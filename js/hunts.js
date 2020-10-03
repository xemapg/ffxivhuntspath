var mobApp = angular.module('mobApp',[]);

mobApp.controller('MobListController', function($scope, $sce, $http) {
    var mobList = this;
    
    $lastOption = Cookies.get('last_option');
    if(!!$lastOption) $lastOption = parseInt($lastOption);
    else $lastOption = 1;
    
	mobList.options = [
		 {text:$MSG_ALL_TRANSPORTS, description:$MSG_ALL_TRANSPORTS_DESC, option:1},
		 {text:$MSG_NO_TRANSPORTS_ZONE, description:$MSG_NO_TRANSPORTS_ZONE_DESC, option: 2}];
 	mobList.selectedOption = $lastOption;
    mobList.selectedCountRegion = function(region) {
		return $('#region'+region+' .mob-items .mob-item input:checked[type="checkbox"]').length;
    };
    mobList.selectedCount = function(zone) {
		return $('#zone'+zone+' .mob-items .mob-item input:checked[type="checkbox"]').length;
    };
	mobList.allSelectedCount = function() {
		var l = $('.mob-item input:checked[type="checkbox"]').length;
		if(l == 0){
			$('#searchbutton button').addClass('disabled');
			$('#clearbutton').addClass('disabled');
		} else {
			$('#searchbutton button').removeClass('disabled');
			$('#clearbutton').removeClass('disabled');
		}
		return l;
    };
	mobList.newSearch = function(){
		modifySearch();
	};
	mobList.clear = function(){
		$('.mob-items .mob-item').trigger("clear-state");
	};	
	
	$zones_data = [];
	
	$scope.data = {};
	$scope.data.send = function(item, event) {
		var mobsSel = $('.mob-items .mob-item input:checked[type="checkbox"]').map(function() { return $(this).data("id"); }).get();
		if(mobsSel.length > 0){
			startSearching();
			
			$http({
				method: 'POST',
				url: "route.php",
				data: {'m':mobsSel, 'o':mobList.selectedOption},
				headers: {'Content-Type': 'application/json'}
			}).then(function successCallback($response) {
				$scope.data.fromServer = $response.data;
				
				doneSearching();

				$('.result-pills').find('li').hide();

				$zones_data = [];
				
				var $first = null;
				for(var key in $response.data){
					$zone = $response.data[key];
					$id_zone = $zone['id'];
					
					printSteps($zone);
					if($zone['has_path']){
						if($('#result-pills-region').length > 0){
							$('.result-pills').find('a[href="#resregion'+$zone['id_region']+'"]').closest('li').show();
						}						
						$('.result-pills').find('a[href="#reszone'+$zone['id']+'"]').closest('li').show();
						
						if($first == null) $first = $zone;
						$("#map-zone"+$id_zone).attr("src", "maps/map_zone"+$zone['id']+".jpg?v="+$lastEditedMaps);
						$("#mapzone"+$id_zone).show();
						
						paintCanvas($("#canvas-zone"+$id_zone)[0], $zone);
						$zones_data[$id_zone] = $zone;
						$(window).smartresize(function(){
							for(var $id_zone in $zones_data){
								paintCanvas($("#canvas-zone"+$id_zone)[0], $zones_data[$id_zone]);
							}
						});
					} else {
						$("#mapzone"+$id_zone).hide();
					}
				};
				if($('#result-pills-region').length > 0){
					$('.result-pills a[href="#resregion'+$first['id_region']+'"]').tab("show");
				}
				$('.result-pills a[href="#reszone'+$first['id']+'"]').tab("show");
			}, function errorCallback(response) {
				errorSearching();
			});
		}
	}

	$scopeThis = $scope;
	$('.mob-item').each(function () {
		// Settings
		var $el = $(this),
			$label = $(this).find('div.checkbox label'),
			$checkbox = $(this).find('input[type="checkbox"]');

		// Event Handlers
		$label.on('click', function () {
			$checkbox.triggerHandler('change');
		});
		$el.on('clear-state', function () {
			$checkbox.prop('checked', false);
		});
		$checkbox.on('change', function () {
			$scopeThis.$digest();
		});
	});
});