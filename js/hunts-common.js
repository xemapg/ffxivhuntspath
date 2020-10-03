var idMsgTimeout = null;

function startSearching(){
	$('#searchbutton button').addClass('disabled');
	$('#clearbutton').addClass('disabled');
	
	$('#loadingPanel').removeClass("hidden");
	$('#searchPanel').addClass("hidden");
	$('#searchTab').addClass("hidden");
	$('#resultsTab').addClass('hidden');
		
	$('#loadingPanel').removeClass('hidden');
	if($('html').hasClass('svg')){
		$('#loadingSvg').removeClass('hidden');
		$('#loadingNoSvg').addClass('hidden');
	} else {
		$('#loadingNoSvg').removeClass('hidden');
		$('#loadingSvg').addClass('hidden');
		animateloop();
	}
}

function errorSearching(){
	if(idMsgTimeout != null){
		clearTimeout(idMsgTimeout);
		idMsgTimeout = null;
	} 
	if($('#msgErrorCall').length > 0){
		$('#msgErrorCall').slideUp(function(){
			$(this).remove();
		});
	}
	
	var errMsg = $('<div id="msgErrorCall" class="alert alert-danger alert-dismissible" role="alert">'
			+'<button type="button" class="close" aria-label="Close">'
				+'<span aria-hidden="true">&times;</span>'
			+'</button>'
			+$MSG_CALL_ERROR_OCURRED
		+'</div>').hide();
	
	$('#messagesPanel').append(errMsg);
	
	idMsgTimeout = setTimeout(function(){
		$('#msgErrorCall').slideUp(function(){
			$(this).remove();
		});
	}, 20000);
	
	$('#msgErrorCall').find('button.close').on('click', function(){
		$('#msgErrorCall').slideUp(function(){
			$(this).remove();
		});
		clearTimeout(idMsgTimeout);
		idMsgTimeout = null;
	});
	$(errMsg).slideDown();
	
	$('#searchbutton button').removeClass('disabled');
	$('#clearbutton').removeClass('disabled');
	
	$('#loadingPanel').addClass("hidden");
	$('#searchPanel').removeClass("hidden");
	$('#searchTab').removeClass("hidden");
	$('#resultsTab').addClass("hidden");
}
function modifySearch(){
	$('#resultsTab').addClass('hidden');
	$('#loadingPanel').addClass("hidden");
	$('#newsearchbutton').addClass("hidden");
	
	$('#searchTab').removeClass("hidden");
	$('#searchPanel').removeClass("hidden");
	
	$('#searchbutton').removeClass("hidden");
	$('#searchbutton button').removeClass('disabled');
	$('#clearbutton').removeClass("hidden").removeClass('disabled');
}
function doneSearching(){
	$('#resultsTab').removeClass('hidden');
	$('#newsearchbutton').removeClass("hidden");
	
	$('#loadingPanel').addClass("hidden");
	$('#clearbutton').addClass("hidden");
	$('#searchbutton').addClass("hidden");
	
	$('#searchbutton button').removeClass('disabled');
	$('#clearbutton').removeClass('disabled');
}

function animateloop() {
	if($("#progressInner").is(':visible')){
		$("#progressInner").css({marginLeft: "-40%"});
		$("#progressInner").animate({
			marginLeft: "140%"
		}, 2500, function(){animateloop()});
	}
}

function printSteps(dataZone){
	var $div = $('#steps-zone-'+dataZone['id']);
	$div.empty();
	$ul = $('<ul class="list-group">');
	if( dataZone.path.length == 0 ){
		var $item = $('<li class="list-group-item">');
		var $item_badge = $('<span class="label action-tag">');
		
		$item.html($MSG_NOTHING_HERE);
		$item.append($item_badge.addClass("label-success").text($MSG_BADGE_DONE));
		
		$ul.append($item);
	} else {
		$stepIndex = 0;
		$.each( dataZone.path, function(key, step) {
			var $type = step['id_type'];			
			step['completed'] = false;
			
			var $item = $('<li class="list-group-item mob-result-item">');
			var $item_badge = $('<span class="label action-tag">');
			if($type == 1){
				// Done
				$item.html($MSG_NOTHING_HERE);
				$item.append($item_badge.addClass("label-success").text($MSG_BADGE_DONE));
			} else if($type == 2){
				// Teleport
				
				var $x = step['to']['x'];
				var $y = step['to']['y'];
				var $aeth_name = step['to']['aeth_name'];
				var $zone_name = step['to']['zone_name'];

				$htmlString = '';
				if($stepIndex > 0) $htmlString = ($stepIndex)+' - ';
				$stepIndex++;
				$htmlString += String.format($MSG_TRANSPORT_TO, $aeth_name, $zone_name);
				$item.html($htmlString);
				$item.append($item_badge.addClass("label-primary").text($MSG_BADGE_TELEPORT));
			} else if($type == 3){
				// Kill
				
				var $x = step['at']['x'];
				var $y = step['at']['y'];
				var $lvl = step['at']['lvl'];
				var $name = step['at']['name'];
				var $slay = step['at']['slay'];
				var $is_fate = parseInt(step['at']['is_fate']);
				var $fate = step['at']['fate'];
				
				$htmlString = '';
				if($stepIndex > 0) $htmlString = ($stepIndex)+' - ';
				$stepIndex++;
				$htmlString += String.format($MSG_KILL_AT, parseInt($x, 10), parseInt($y, 10));
				if($is_fate) $htmlString += '<img src="../img/fate.png" class="fate-icon-tag" title="'+$fate+'"/>';
				if($lvl != null) $htmlString += "<span class='lvl-tag'>Lv "+$lvl+"</span>";
				$htmlString += "<span class='name-tag'>"+$name+"</span>";
				if($slay != null) $htmlString += "<span class='slay-tag'> (x"+$slay+")</span>";
				$htmlString += $item_badge.addClass("label-danger").text($MSG_BADGE_KILL).prop('outerHTML');
				if($is_fate) $htmlString += '<div class="fate-name-tag"><img src="../img/fate.png" class="fate-img-tag" title="'+$fate+'"/>'+$fate+'</div>';
				
				$item.html($htmlString);
			} else if($type == 10){
				// Exceeded
				
				$max = step['max'];
				
				$item.html('<i>'+String.format($MSG_EFFICIENCY, $max)+'</i>');
				$item.append($item_badge.addClass("label-warning").text("Warning"));
			}
			$ul.append($item);
		});
	}
	$div.append($ul);
}

function paintCanvas(c, data){
	c.width = $(c).closest('.outsideWrapper').width();
	c.height = $(c).closest('.outsideWrapper').height();
	c.getContext("2d").clearRect(0, 0, c.width, c.height);
	
	paintFates(c, data);
	paintFateNames(c, data);
	
	var $lastX = null,
		$lastY = null,
		$zsx = 1.0*data['size_x'],
		$zsy = 1.0*data['size_x'],
		i = 0;
		
	$.each( data.path, function(key, step) {
		var $x = null, 
			$y = null,
			$type = step['id_type'],
			$print = false;
			
		if($type == 2){
			$x = step['to']['x'];
			$y = step['to']['y'];
			$print = true;
		} else if($type == 3){
			$x = step['at']['x'];
			$y = step['at']['y'];
			
			$print = true;
		} else {
			$print = false;
		}
		if($print && $lastX != null && $lastY != null){
			i++;
			drawPath(c, i, $lastX, $lastY, $x, $y, $zsx, $zsy, $type);
		}
		if($print){
			$lastX = $x;
			$lastY = $y;
		}
	});
}
function paintFates(c, data){
	var $zsx = 1.0*data['size_x'],
		$zsy = 1.0*data['size_x'];
	
	$.each( data.path, function(key, step) {
		var $x = null, 
			$y = null,
			$type = step['id_type'];
			
		if($type == 3){
			$x = step['at']['x'];
			$y = step['at']['y'];
			$is_fate = parseInt(step['at']['is_fate']);
			$fate = step['at']['fate'];
			if($is_fate){
				drawFate(c, $x, $y, $zsx, $zsy, $fate);
			}
		}
	});
}
function paintFateNames(c, data){
	var $zsx = 1.0*data['size_x'],
		$zsy = 1.0*data['size_x'];
	
	$.each( data.path, function(key, step) {
		var $x = null, 
			$y = null,
			$type = step['id_type'];
			
		if($type == 3){
			$x = step['at']['x'];
			$y = step['at']['y'];
			$is_fate = parseInt(step['at']['is_fate']);
			$fate = step['at']['fate'];
			if($is_fate){
				drawFateName(c, $x, $y, $zsx, $zsy, $fate);
			}
		}
	});
}

function pixCoordX(c, w, x, zsx){
	return (x-1.0)*w/(zsx-1.0);
}
function pixCoordY(c, h, y, zsy){
	return (y-1.0)*h/(zsy-1.0);
}
function findAngle(sx, sy, ex, ey) {
    // make sx and sy at the zero point
    return Math.atan2((ey - sy), (ex - sx));
}

function drawArrowhead(ctx, locx, locy, angle, color, sizex, sizey) {
    var hx = sizex / 2;
    var hy = sizey / 2;
	ctx.translate(locx, locy);
	ctx.rotate(angle);
	ctx.translate(-hx,-hy);

	ctx.beginPath();   
	ctx.moveTo(0,0);
	ctx.lineTo(0,1*sizey);    
	ctx.lineTo(1*sizex,1*hy);
	ctx.closePath();
    ctx.fillStyle = color;
	ctx.fill();
}

function drawFate(c, fx, fy, zsx, zsy, fate){
	var img_w = 32;
	var img_h = 32;
	
	$img_fate = $('<img src="../img/fate.png" width="'+img_w+'" height="'+img_h+'"/>')[0];
	var ctx = c.getContext("2d");
	ctx.save();
	
	var w = $(c).closest('.outsideWrapper').width();
	var h = $(c).closest('.outsideWrapper').height();
	
    var ccx = pixCoordX(c, w, fx, zsx);
    var ccy = pixCoordY(c, h, fy, zsy);
	
    var fcx = ccx - img_w/2.0;
    var fcy = ccy - img_h/2.0;
    
	ctx.drawImage($img_fate, fcx, fcy, img_w, img_h);
	ctx.restore();
}
function drawFateName(c, fx, fy, zsx, zsy, fate){
	var img_w = 32;
	var img_h = 32;
	
	var ctx = c.getContext("2d");	
	ctx.save();
	
	var w = $(c).closest('.outsideWrapper').width();
	var h = $(c).closest('.outsideWrapper').height();
	
    var ccx = pixCoordX(c, w, fx, zsx);
    var ccy = pixCoordY(c, h, fy, zsy);
	
    var fcx = ccx - img_w/2.0;
    var fcy = ccy - img_h/2.0;

    var paddingBottom = 2;
    var textSidePadding = 5;
    var rectHeight = 20;
    
	ctx.font = (rectHeight-6)+'px "Droid Sans", Helvetica, sans-serif';
    ctx.textBaseline = 'top';
    ctx.fillStyle = 'rgba(32,32,32, 0.50)';
    ctx.strokeStyle = "rgba(48,48,48, 0.40)";
    
    var txt_width = ctx.measureText(fate).width;
    ctx.shadowBlur=5;
    ctx.lineWidth=1;
    roundRect(ctx, ccx-txt_width/2.0-textSidePadding, fcy-(rectHeight+paddingBottom), txt_width+(textSidePadding*2), rectHeight, 4, true, true);
        
    ctx.shadowColor="black";
    ctx.shadowBlur=1;
    ctx.lineWidth=3;
    ctx.strokeText(fate, ccx-txt_width/2.0, fcy-rectHeight);
    ctx.shadowBlur=0;
    ctx.fillStyle = '#fff';
    ctx.fillText(fate, ccx-txt_width/2.0, fcy-rectHeight);
    
    ctx.restore();
}

function drawPath(c, step, fx, fy, tx, ty, zsx, zsy, id_type){
	var ctx = c.getContext("2d");
	
	ctx.save();
	
	var w = $(c).closest('.outsideWrapper').width();
	var h = $(c).closest('.outsideWrapper').height();
	
    var fcx = pixCoordX(c, w, fx, zsx);
    var fcy = pixCoordY(c, h, fy, zsy);
    var tcx = pixCoordX(c, w, tx, zsx);
    var tcy = pixCoordY(c, h, ty, zsy);
	
    cx = (fcx + tcx) / 2.0;
    cy = (fcy + tcy) / 2.0;
    
	circlex = -(tcy-fcy);
	circley = (tcx-fcx);
	
	var nm = Math.sqrt(Math.pow(circlex, 2) + Math.pow(circley, 2));
	
	circlex = circlex*15.0 / nm + tcx;
	circley = circley*15.0 / nm + tcy;
    vpx = -(tcy-fcy)*0.1+cx;
    vpy = (tcx-fcx)*0.1+cy;
	
	ctx.beginPath();
	ctx.moveTo(fcx, fcy);
	ctx.quadraticCurveTo(vpx, vpy, tcx, tcy);
	ctx.lineWidth = 2;

	// line color
    var col = 'black';
	var grad = ctx.createLinearGradient(fcx, fcy, tcx, tcy);
	if(id_type === 2){
		grad.addColorStop(0, "rgba(0, 153, 255, 0.60)");
		grad.addColorStop(1, "blue");
		
		col = 'blue';
	} else if(id_type === 3){
		grad.addColorStop(0, "rgba(226, 111, 111, 0.60)");
		grad.addColorStop(1, "red");
		
		col = "red";
	}
    ctx.strokeStyle = grad;
	ctx.stroke();
	ctx.closePath();
	
	var ang = findAngle(vpx, vpy, tcx, tcy);
	ctx.fillRect(tcx, tcy, 2, 2);
	drawArrowhead(ctx, tcx, tcy, ang, col, 12, 10);
	ctx.restore();
    
	ctx.save();
	ctx.beginPath();
    ctx.arc(circlex, circley, 8, 0, 2 * Math.PI, false);
    ctx.fillStyle = col;
    ctx.fill();
	ctx.closePath();
    
	ctx.fillStyle = 'white';
    ctx.textAlign = 'center';
	ctx.font = "bold 14px Arial";
    ctx.fillText(step, circlex, circley+5);
    
	ctx.restore();
}



/**
 * Draws a rounded rectangle using the current state of the canvas. 
 * If you omit the last three params, it will draw a rectangle 
 * outline with a 5 pixel border radius 
 * @param {CanvasRenderingContext2D} ctx
 * @param {Number} x The top left x coordinate
 * @param {Number} y The top left y coordinate 
 * @param {Number} width The width of the rectangle 
 * @param {Number} height The height of the rectangle
 * @param {Number} radius The corner radius. Defaults to 5;
 * @param {Boolean} fill Whether to fill the rectangle. Defaults to false.
 * @param {Boolean} stroke Whether to stroke the rectangle. Defaults to true.
 */
function roundRect(ctx, x, y, width, height, radius, fill, stroke) {
  if (typeof stroke == "undefined" ) {
    stroke = true;
  }
  if (typeof radius === "undefined") {
    radius = 5;
  }
  ctx.beginPath();
  ctx.moveTo(x + radius, y);
  ctx.lineTo(x + width - radius, y);
  ctx.quadraticCurveTo(x + width, y, x + width, y + radius);
  ctx.lineTo(x + width, y + height - radius);
  ctx.quadraticCurveTo(x + width, y + height, x + width - radius, y + height);
  ctx.lineTo(x + radius, y + height);
  ctx.quadraticCurveTo(x, y + height, x, y + height - radius);
  ctx.lineTo(x, y + radius);
  ctx.quadraticCurveTo(x, y, x + radius, y);
  ctx.closePath();
  if (stroke) {
    ctx.stroke();
  }
  if (fill) {
    ctx.fill();
  }        
}



// https://gist.github.com/LeonBlade/66ba5bbea9cea22f7aa113af023a1d28
//
// @name         FFXIV Hunts Path Finder Autocomplete
// @namespace    http://github.com/LeonBlade
// @version      1.2
// @author       James Stine (LeonBlade)
// @modified	 Guybrush Peepwood
$(document).ready(function () {
    hunts = $('.tab-content .mob-item label');
    dataList = $('<datalist id="hunts">');
	$(hunts).each(function(i, o){
		var $checkbox = $(o).find('input[type="checkbox"]');
		
		var id = $checkbox.attr('data-id');
		var isMultiple = $checkbox.attr('data-is-multiple');
		var zoneName = $checkbox.attr('data-zone-name');
		
		var label = $.trim($(o).find('span.tag').text());
		if(isMultiple !== '0'){
			label += ' ('+zoneName+')';
		}
		var search = label.toLowerCase();
		dataList.append($('<option id="'+id+'" value="'+label+'" data-search="'+search+'"/>'));
	});

    $('#searchPanel').append('<div id="searchGroup" class="form-group is-empty"><label class="control-label" for="searchText">'+$MSG_SEARCH+'</label><input type="text" placeholder="'+$MSG_SEARCH_PLACEHOLDER+'" id="searchText" list="hunts" class="form-control"></div>');

    $('#searchText').after(dataList);
    $('#searchText').on('input', function () {
        v = $(this).val();
        id = $('#hunts').find('option[value="'+v+'"]').attr('id');
        if (id && !$('input[data-id="'+id+'"]')[0].checked) {
			var $checkbox = $('input[data-id="'+id+'"]');
            $($checkbox).closest('label').click();
			$($checkbox).triggerHandler('change');
			$(this).val("");
			var options =  {
				content: String.format($MSG_SELECTED_MOB, v),
				timeout: 4000,
				style: 'okay',
				htmlAllowed: true,
			}
			$.snackbar(options);
			$(this).focus();
        } else if (id && $('input[data-id="'+id+'"]')[0].checked) {
			$(this).val("");
			var options =  {
				content: String.format($MSG_ALREADY_SELECTED_MOB, v),
				timeout: 4000,
				style: 'warn',
				htmlAllowed: true,
			}
			$.snackbar(options);
			$(this).focus();
        }
    }).on( "keypress", function(){
		var key = event.which || event.keyCode;
		if ( key == 13 ) {
			v = $(this).val();
			if(v !== ''){
				$option = $('#hunts').find('option[data-search*="'+v.toLowerCase()+'"]:first');
				if($option.length > 0){
					$(this).val($($option).attr('value')).trigger('input');
				}
			}
		}
	});
    
    $(".outsideWrapper").resizable({
        aspectRatio: 1 / 1,
        alsoResize: ".outsideWrapper",
  	  	maxHeight: 500,
        maxWidth: 500,
        minHeight: 250,
        minWidth: 250
    });
    
	$.material.init();
});