if (!String.format) {
  String.format = function(format) {
    var args = Array.prototype.slice.call(arguments, 1);
    return format.replace(/{(\d+)}/g, function(match, number) { 
      return typeof args[number] != 'undefined'
        ? args[number] 
        : match
      ;
    });
  };
}
function printDate(timestamp){
	document.write('<abbr title="'+(new Date(timestamp*1000)).toLocaleString()+'">'+intervalDate(timestamp*1000)+'</abbr>');
}
function intervalDate(timestamp){
	$difference = ((new Date()).getTime() - timestamp) / 1000;
	$lengths = [1, 60, 60*60, 60*60*24, 60*60*24*31, 60*60*24*31*12];
	for($j = $lengths.length-1; Math.floor($difference / $lengths[$j]) == 0 && $j > 0;$j--);
	$difference = Math.floor($difference / $lengths[$j]);
	if($difference != 1) return String.format($MSG_TIME_AGO, $difference, $MSG_PERIOD_PL[$j]);
	else return String.format($MSG_TIME_AGO, $difference, $MSG_PERIOD[$j]);
}
(function($,sr){
  // debouncing function from John Hann
  // http://unscriptable.com/index.php/2009/03/20/debouncing-javascript-methods/
  var debounce = function (func, threshold, execAsap) {
      var timeout;

      return function debounced () {
          var obj = this, args = arguments;
          function delayed () {
              if (!execAsap)
                  func.apply(obj, args);
              timeout = null;
          };

          if (timeout)
              clearTimeout(timeout);
          else if (execAsap)
              func.apply(obj, args);

          timeout = setTimeout(delayed, threshold || 100);
      };
  }
  // smartresize 
  jQuery.fn[sr] = function(fn){  return fn ? this.bind('resize', debounce(fn)) : this.trigger(sr); };

})(jQuery,'smartresize');
$(document).ready(function(){
	$('.action-lang').on('click',function(){
		$type = $(this).data('type');
		$lang = $(this).data('lang');
		$.get("/langs/setlang.php?type="+$type+"&lang="+$lang, function(data) {
			location.reload();
		})
		.error(function(){
			
		});
	});
});