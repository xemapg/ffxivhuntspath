<?php
	class Cache {
		public static $lastEditedFavicons = '201706251800';
		public static $lastEditedLogo = '201706251800';
		public static $lastEditedMaps = '201809192054';
		
		public static $lastEditedCss = '201707251914';
		public static $lastEditedJs = '201707120950';
	}
	
	function print_meta(){
		?><!DOCTYPE html>
		<?php
	}

	function print_generic_head($style_function = null){
		?>
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8" /> 
		
		<title><?php echo WebLang::$MSG_TITLE;?></title>
		
		<link rel="apple-touch-icon" sizes="180x180" href="<?php echo Config::$context ?>/favicons/apple-touch-icon.png?v=<?php echo Cache::$lastEditedFavicons?>">
		<link rel="icon" type="image/png" sizes="32x32" href="<?php echo Config::$context ?>/favicons/favicon-32x32.png?v=<?php echo Cache::$lastEditedFavicons?>">
		<link rel="icon" type="image/png" sizes="16x16" href="<?php echo Config::$context ?>/favicons/favicon-16x16.png?v=<?php echo Cache::$lastEditedFavicons?>">
		<link rel="manifest" href="<?php echo Config::$context ?>/favicons/manifest.json?v=<?php echo Cache::$lastEditedFavicons?>">
		<link rel="mask-icon" href="<?php echo Config::$context ?>/favicons/safari-pinned-tab.svg?v=<?php echo Cache::$lastEditedFavicons?>" color="#5bbad5">
		<link rel="shortcut icon" href="<?php echo Config::$context ?>/favicons/favicon.ico?v=<?php echo Cache::$lastEditedFavicons?>">
		<meta name="apple-mobile-web-app-title" content="FFXIV Hunts Path Finder">
		<meta name="application-name" content="FFXIV Hunts Path Finder">
		<meta name="msapplication-config" content="<?php echo Config::$context ?>/favicons/browserconfig.xml?v=<?php echo Cache::$lastEditedFavicons?>">
		<meta name="theme-color" content="#ffffff">
		
		<meta property="og:title" content="FFXIV Hunts Path Finder" />
		<meta property="og:type" content="website" />
		<meta property="og:url" content="http://www.ffxivhuntspath.com/" />
		<meta property="og:image" content="http://www.ffxivhuntspath.com/img/logo_preview.png" />
		<meta property="og:site_name" content="FFXIV Hunts Path Finder">
		<meta property="og:description" content="Simple tool for searching the best route for a group of selected mobs, designed for the daily marks included in FFXIV" />

		<link rel="stylesheet" href="<?php echo Config::$context ?>/css/jquery-ui.css?v=<?php echo Cache::$lastEditedCss ?>">
		<link rel="stylesheet" href="<?php echo Config::$context ?>/css/bootstrap.min.css?v=<?php echo Cache::$lastEditedCss ?>">
		<link rel="stylesheet" href="<?php echo Config::$context ?>/css/snackbar.min.css?v=<?php echo Cache::$lastEditedCss ?>">
		<link rel="stylesheet" href="<?php echo Config::$context ?>/css/bootstrap-material-design.min.css?v=<?php echo Cache::$lastEditedCss ?>">
		<link rel="stylesheet" href="<?php echo Config::$context ?>/css/ripples.min.css?v=<?php echo Cache::$lastEditedCss ?>">
		<link rel="stylesheet" href="<?php echo Config::$context ?>/css/hunts.min.css?v=<?php echo Cache::$lastEditedCss ?>">
		<link rel="stylesheet" href="<?php echo Config::$context ?>/css/leaflet.css?v=<?php echo Cache::$lastEditedCss ?>"/>
		  
		<?php 
			if($style_function != null && function_exists($style_function)){
				echo call_user_func($style_function);
			}
		?>
		
		<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
		<script>
		  WebFont.load({
		    google: {
		      families: ['Roboto','Droid Sans']
		    }
		  });
		</script>
		<script src="<?php echo Config::$context ?>/js/jquery-2.2.4.min.js"></script>
		<script src="<?php echo Config::$context ?>/js/jquery-ui.min.js"></script>
		<script src="<?php echo Config::$context ?>/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<?php echo Config::$context ?>/js/angular.min.js"></script>
		<script src="<?php echo Config::$context ?>/js/angular-resource.min.js"></script>
		<script src="<?php echo Config::$context ?>/js/leaflet.js"></script>
	</head>
<?php
	}
	
	function print_generic_body_scripts(){
?>
	<script src="<?php echo Config::$context ?>/js/bootstrap.min.js"></script>
	<script src="<?php echo Config::$context ?>/js/snackbar.min.js"></script>
	<script src="<?php echo Config::$context ?>/js/material.min.js"></script>
	<script src="<?php echo Config::$context ?>/js/ripples.min.js"></script>
	<script src="<?php echo Config::$context ?>/js/modernizr-custom.js"></script>
	<script src="<?php echo Config::$context ?>/js/js.cookie.js"></script>
	<script src="<?php echo Config::$context ?>/js/common.js?v=<?php echo Cache::$lastEditedJs ?>"></script>
<?php
	}
	
	function print_top_navbar_options(){
		$langWeb = WebLang::getLang();
		$langGame = GameLang::getLangDb();
		$langGameFlag = GameLang::getLang();
		?>
			<div id="navbar-menu" class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="<?php echo Config::$context ?>/home/"><?php echo WebLang::$MSG_HOME ?></a></li>
					<li><a href="<?php echo Config::$context ?>/api/"><?php echo WebLang::$MSG_API ?></a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
					  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><?php echo WebLang::$MSG_EXPANSION?>
					  	<span class="caret"></span>
						<span class="sr-only"><?php echo WebLang::$MSG_SEARCH_BTN_EXPANSION ?></span>
					  </a>
					  <ul class="dropdown-menu" style="padding:0;background-color:#7d8494;">
					  	<li class="realmreborn"><a href="<?php echo Config::$context ?>/arr/"><img src="<?php echo Config::$context ?>/img/arr.png" height="28px"/></a></li>
							<li class="heavensward"><a href="<?php echo Config::$context ?>/hw/"><img src="<?php echo Config::$context ?>/img/hw.png" height="28px"/></a></li>
							<li class="stormblood"><a href="<?php echo Config::$context ?>/sb/"><img src="<?php echo Config::$context ?>/img/sb.png" height="28px"/></a></li>
							<li class="shadowbringers"><a href="<?php echo Config::$context ?>/shb/"><img src="<?php echo Config::$context ?>/img/shb.png" height="28px"/></a></li>
					  </ul>
					</li>
					<li class="dropdown">
					  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					  	<img src="<?php echo Config::$context ?>/img/langs/<?php echo $langWeb ?>.png" class="icon-flag"><?php echo WebLang::$MSG_WEB_LANGUAGE?> 
					  	<span class="caret"></span>
						<span class="sr-only"><?php echo WebLang::$MSG_SEARCH_BTN_WEB_LANGUAGE?></span>
					  </a>
					  <ul class="dropdown-menu">
						<li><a href="#" class="action-lang" data-lang="en" data-type="1">
							<img src="<?php echo Config::$context ?>/img/langs/en.png" class="icon-flag"><?php echo WebLang::$MSG_LANG_ENGLISH ?>
						</a></li>
						<li><a href="#" class="action-lang" data-lang="de" data-type="1">
							<img src="<?php echo Config::$context ?>/img/langs/de.png" class="icon-flag"><?php echo WebLang::$MSG_LANG_GERMAN ?>
						</a></li>
						<li><a href="#" class="action-lang" data-lang="es" data-type="1">
							<img src="<?php echo Config::$context ?>/img/langs/es.png" class="icon-flag"><?php echo WebLang::$MSG_LANG_SPANISH?>
						</a></li>
					  </ul>
					</li>
					<li class="dropdown">
					  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					  	<img src="<?php echo Config::$context ?>/img/langs/<?php echo $langGameFlag ?>.png" class="icon-flag"><?php echo WebLang::$MSG_GAME_LANGUAGE ?> 
					  	<span class="caret"></span>
						<span class="sr-only"><?php echo WebLang::$MSG_SEARCH_BTN_GAME_LANGUAGE ?></span>
					  </a>
					  <ul class="dropdown-menu">
						<li><a href="#" class="action-lang" data-lang="en" data-type="2"><img src="<?php echo Config::$context ?>/img/langs/en.png" class="icon-flag"><?php echo WebLang::$MSG_LANG_ENGLISH ?></a></li>
						<li><a href="#" class="action-lang" data-lang="fr" data-type="2"><img src="<?php echo Config::$context ?>/img/langs/fr.png" class="icon-flag"><?php echo WebLang::$MSG_LANG_FRENCH ?></a></li>
						<li><a href="#" class="action-lang" data-lang="de" data-type="2"><img src="<?php echo Config::$context ?>/img/langs/de.png" class="icon-flag"><?php echo WebLang::$MSG_LANG_GERMAN ?></a></li>
						<li><a href="#" class="action-lang" data-lang="ja" data-type="2"><img src="<?php echo Config::$context ?>/img/langs/ja.png" class="icon-flag"><?php echo WebLang::$MSG_LANG_JAPANESE ?></a></li>
						<li><a href="#" class="action-lang" data-lang="zh" data-type="2"><img src="<?php echo Config::$context ?>/img/langs/zh.png" class="icon-flag"><?php echo WebLang::$MSG_LANG_SMP_CHINESE ?></a></li>
					  </ul>
					</li>
				 </ul>
			</div>
<?php
	}
	
	function print_footer(){
?>			<div class="footer row" style="width:100%;">
				<p class="text-right"><a href="https://www.facebook.com/ffxivhuntspath/"><img src="/img/facebook.png" class="ext-link-icon"></a><a href="https://twitter.com/ffxivhuntspath"><img src="/img/twitter.png" class="ext-link-icon"></a></p>
				<p class="text-right"><?php echo WebLang::$MSG_FOOTER_DATA ?></p>
				<p class="text-right">FINAL FANTASY is a registered trademark of Square Enix Holdings Co., Ltd.</p>
				<p class="text-right"><small><?php echo WebLang::$MSG_HOME_COLLABORATE ?>: <script type="text/javascript"><!--
				var cfynmqn = ['n','i','l','i','m','m','h','s','>','a','.','e','l','o','i',' ','a','h','m','t','x','n','e','"','>','m','v','u','"','r','x','a','p','c','o','m','s','f','t','<','f','t','s','c','i','t','m','p','<','t','a','f','l','f','@','c','o','i','"','a','d','f','a','n','=','a','a','d','v','h','s','h','.','h','"','@','/','u','=','a',':','i','n',' '];var miysgvk = [20,11,43,25,9,79,75,31,83,82,36,5,53,38,19,2,33,67,39,34,64,29,49,54,55,18,26,68,40,4,24,73,32,37,78,58,71,63,74,80,22,13,45,42,65,30,50,72,0,70,1,23,12,6,61,77,14,59,8,10,17,62,56,69,47,51,44,57,66,35,46,3,76,27,48,21,81,28,7,16,15,52,60,41];var uqspfim= new Array();for(var i=0;i<miysgvk.length;i++){uqspfim[miysgvk[i]] = cfynmqn[i]; }for(var i=0;i<uqspfim.length;i++){document.write(uqspfim[i]);}
				// --></script>
				<noscript><?php echo WebLang::$MSG_NO_JS_EMAIL ?></noscript></small></p>
			</div>
<?php
	}
	
	function print_index_body($exp, $mobs, $zones, $regions = null){
		$langWeb = WebLang::getLang();
		$langGame = GameLang::getLangDb();
?>
	<body>
		<?php print_generic_body_scripts(); ?>
		<?php echo WebLang::getLangJs(); ?>
		<script>var $lastEditedMaps = '<?php echo Cache::$lastEditedMaps; ?>';</script>
		<script src="<?php echo Config::$context ?>/js/hunts-common.js?v=<?php echo Cache::$lastEditedJs ?>"></script>
		<script src="<?php echo Config::$context ?>/js/hunts.js?v=<?php echo Cache::$lastEditedJs ?>"></script>
		
		<nav class="navbar <?php
					if($exp === 'hw') echo 'navbar-heavensward';
					else if($exp === 'sb') echo 'navbar-stormblood';
					else if($exp === 'arr') echo 'navbar-stormblood';
					else if($exp === 'shb') echo 'navbar-shadowbringers';
					else echo 'navbar-ffxiv';
				?> navbar-fixed-top">
		  <div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menu" aria-expanded="false">
					<span class="sr-only"><?php echo WebLang::$MSG_MENU ?></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div class="btn-group">
					<a href="#" style="padding:0;background-color:transparent !important;">
						<img src="<?php echo Config::$context ?>/img/<?php echo $exp.'.png'; ?>" height="32px"/>
					</a>
				</div>
			</div>
			<?php print_top_navbar_options(); ?>
		  </div>
		</nav>

		<div id="main" class="container" ng-controller="MobListController as mobList">
			<div id="messagesPanel" style="margin-top:20px;"></div>
		
			<div id="header" class="page-header jumbotron" style="margin-top:20px;">
				<h2 class="clearfix"><img src="<?php echo Config::$context ?>/img/logo.png?v=<?php echo Cache::$lastEditedLogo ?>" class="header-logo"><?php echo WebLang::$MSG_TITLE;?></h2>
				<h2 class="clearfix"><small><?php echo WebLang::$MSG_TITLE_DESC;?>: <?php
					if($exp === 'hw') echo WebLang::$MSG_HW;
					else if($exp === 'sb') echo WebLang::$MSG_SB;
					else if($exp === 'arr') echo WebLang::$MSG_ARR;
					else if($exp === 'shb') echo WebLang::$MSG_SHB;
				?></small></h2>
			</div>
			
			<div id="searchPanel" class="jumbotron"></div>
			
			<div id="loadingPanel" class="jumbotron hidden">
				<div id="loadingSvg" class="spinner-wrapper hidden">
					<div class="loader">
					  <svg class="circular">
						<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="5" stroke-miterlimit="10"/>
					  </svg>
					</div>
				</div>
				<div id="loadingNoSvg" class="hidden">
					<div class="progress" style="height:16px;margin-top:16px;">
					  <div id="progressInner" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
						<span class="sr-only"></span>
					  </div>
					</div>
				</div>
			</div>
			
			<div id="searchTab" class="fade in active">
				<ul class="nav nav-pills" role="tablist">
	<?php 
		$first = 1;
		foreach($zones as $z){
				?><li role="presentation" <?php echo ($first?'class="active"':'');?>><a data-toggle="tab" href="#zone<?php echo $z['id'];?>"><?php echo $z['name_'.$langGame];?> <span class="badge">{{mobList.selectedCount(<?php echo $z['id'];?>)}}</span></a></li><?php
			$first = 0;
		}
	?>
				</ul>
			
				<div class="tab-content">	
	<?php 
		$first = 1;		
		foreach($zones as $z){
			?>
					<div id="zone<?php echo $z['id'];?>" class="tab-pane fade <?php echo ($first?'in active':'');?>">
						<div class="panel-body">
							<div class="well" style="overflow:visible;">
								<div class="mob-items">
		<?php
			$j = 0;
			$openTag = false;
			foreach($z['mobs'] as $m){
				if(($j % 3) == 0){ 
					echo '<div class="row equal">';
					$openTag = true; 
				}
				?><div class="mob-item col-sm-12 col-md-4">
					<div class="checkbox">
						<label>
							<input type="checkbox" data-id="<?php echo $m['id'];?>" data-is-multiple="0" data-zone-name="<?php echo $z['name_'.$langGame];?>">
							<?php echo (!empty($m['lvl']) ? '<span class="lvl-tag">Lv '.$m['lvl'].'</span>':'') ?>
							<span class="tag"><?php echo $m['name_'.$langGame]?></span>
							<span class="location"><?php echo " (".intval($m['x']).",".intval($m['y']).")"; ?></span>
						</label>
					</div>
				</div><?php
				if($j % 3 == 2){ 
					echo '</div>'; 
					$openTag = false; 
				}
				$j++;
			}
			if($openTag) echo '</div>';
		?>
								</div>
							</div>
						</div>
					</div><?php
			$first = 0;
		}
	?>
				</div>
			</div>	
			
			<div id="resultsTab" class="hidden">
				<ul id="result-pills" class="nav nav-pills result-pills" role="tablist">
	<?php 
		$first = 1;
		foreach($zones as $z){
			?><li role="presentation" <?php echo ($first?'class="active"':'');?>><a data-toggle="tab" href="#reszone<?php echo $z['id'];?>"><?php echo $z['name_'.$langGame];?> <span class="badge">{{mobList.selectedCount(<?php echo $z['id'];?>)}}</span></a></li><?php
			$first = 0;
		}
	?>
				</ul>
			
			<div class="tab-content">	
	<?php 
		$first = 1;		
		foreach($zones as $z){
			?>
					<div id="reszone<?php echo $z['id'];?>" class="tab-pane fade <?php echo ($first?'in active':'');?>">
						<div class="panel-body">
							<div class="well" style="overflow: auto;" >
								<div id="mapzone<?php echo $z['id'];?>" style="overflow: auto;">
									<div class="outsideWrapper" style="text-center;">
										<div class="insideWrapper" class="img-responsive" >
											<img id="map-zone<?php echo $z['id'];?>" class="coveredImage">
											<canvas id="canvas-zone<?php echo $z['id'];?>" class="canvas-route"></canvas>
										</div>
									</div>
								</div>
								<div id="steps-zone-<?php echo $z['id'];?>"></div>
							</div>
						</div>
					</div><?php
			$first = 0;
		}
	?>
				</div>
			</div>
			<?php echo print_footer(); ?>
			
			<nav class="navbar navbar-fixed-bottom" style="background-color:#222">
			  <div class="container">
				  <ul class="nav navbar-nav lower-navbar">
					<div id="searchbutton" class="btn-group dropup">
						<button type="button" class="btn btn-success btn-raised navbar-btn" ng-click="data.send(item, $event);" style="padding:8px;"><?php echo string_format(WebLang::$MSG_SEARCH_BTN, '<span class="badge">{{mobList.allSelectedCount()}}</span>') ?></button>
						<button type="button" class="btn btn-success btn-raised navbar-btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="caret"></span>
							<span class="sr-only"><?php echo WebLang::$MSG_SEARCH_BTN_DROPDOWN ?></span>
						</button>
						<ul class="list-group dropdown-menu">
							<li class="btn list-group-item" ng-class="mobList.selectedOption == opt.option?'list-group-item-primary active':''" ng-value="opt.option" ng-model="mobList.selectedOption" ng-repeat="opt in mobList.options" ng-click="mobList.selectedOption = opt.option;">
								<h5 class="list-group-item-heading">{{opt.text}}</h5>
								<h5 class="list-group-item-text" style="opacity:0.82;white-space:normal;">{{opt.description}}</h5>
							</li>
						</ul> 
					</div>
					
					<button id="clearbutton" type="button" class="btn btn-default btn-raised navbar-btn" ng-click="mobList.clear();" style="padding:8px 20px;"><?php echo WebLang::$MSG_CLEAR_BTN ?></button>
					<button id="newsearchbutton" type="button" class="btn btn-default btn-raised navbar-btn hidden" ng-click="mobList.newSearch();"><?php echo WebLang::$MSG_MODIFY_BTN ?></button>
				  </ul>
			  </div>
			</nav>
		</div>
	</body>
<?php	
	}
	
	function print_index_arr_body($exp, $mobs, $zones, $regions){
		$langWeb = WebLang::getLang();
		$langGame = GameLang::getLangDb();
		?>
	<body>
		<?php print_generic_body_scripts(); ?>
		<?php echo WebLang::getLangJs(); ?>
		<script>var $lastEditedMaps = '<?php echo Cache::$lastEditedMaps; ?>';</script>
		<script src="<?php echo Config::$context ?>/js/hunts-common.js?v=<?php echo Cache::$lastEditedJs ?>"></script>
		<script src="<?php echo Config::$context ?>/js/hunts.js?v=<?php echo Cache::$lastEditedJs ?>"></script>
		
		<nav class="navbar <?php
					if($exp === 'arr') echo 'navbar-realmreborn';
					else if($exp === 'hw') echo 'navbar-heavensward';
					else if($exp === 'sb') echo 'navbar-stormblood';
					else echo 'navbar-ffxiv';
				?> navbar-fixed-top">
		  <div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menu" aria-expanded="false">
					<span class="sr-only"><?php echo WebLang::$MSG_MENU ?></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div class="btn-group">
					<a href="#" style="padding:0;background-color:transparent !important;">
						<img src="<?php echo Config::$context ?>/img/<?php echo $exp.'.png'; ?>" height="32px"/>
					</a>
				</div>
			</div>
			<?php print_top_navbar_options(); ?>
		  </div>
		</nav>

		<div class="container" ng-controller="MobListController as mobList">

			<div id="messagesPanel" style="margin-top:20px;"></div>
		
			<div id="header" class="page-header jumbotron" style="margin-top:20px;">
				<h2 class="clearfix"><img src="<?php echo Config::$context ?>/img/logo.png?v=<?php echo Cache::$lastEditedLogo ?>" class="header-logo"><?php echo WebLang::$MSG_TITLE;?></h2>
				<h2 class="clearfix"><small><?php echo WebLang::$MSG_TITLE_DESC;?>: <?php
					if($exp === 'arr') echo WebLang::$MSG_ARR;
					else if($exp === 'hw') echo WebLang::$MSG_HW;
					else if($exp === 'sb') echo WebLang::$MSG_SB;
				?></small></h2>
				<div class="alert alert-warning alert-dismissible clearfix" role="alert"><?php echo WebLang::$MSG_TEMPORAL_ARR_WARN; ?></div>
			</div>
			
			<div id="searchPanel" class="jumbotron"></div>
			
			<div id="loadingPanel" class="jumbotron hidden">
				<div id="loadingSvg" class="spinner-wrapper hidden">
					<div class="loader">
					  <svg class="circular">
						<circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="5" stroke-miterlimit="10"/>
					  </svg>
					</div>
				</div>
				<div id="loadingNoSvg" class="hidden">
					<div class="progress" style="height:16px;margin-top:16px;">
					  <div id="progressInner" class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
						<span class="sr-only"></span>
					  </div>
					</div>
				</div>
			</div>
			
			<div id="searchTab" class="fade in active">
				<ul class="nav nav-pills" role="tablist">
	<?php 
		$first = 1;
		foreach($regions as $r){
			?><li role="presentation" <?php echo ($first?'class="active"':'');?>><a data-toggle="tab" href="#region<?php echo $r['id'];?>"><?php echo $r['name_'.$langGame];?> <span class="badge">{{mobList.selectedCountRegion(<?php echo $r['id'];?>)}}</span></a></li><?php
			$first = 0;
		}
	?>
				</ul>
				<div class="tab-content well" style="overflow:auto;margin-top:10px;padding:10px;">
		
	<?php 
		$first_region = 1;
		foreach($regions as $r){
			$first = 1;
					?><div id="region<?php echo $r['id'];?>" class="tab-pane fade <?php echo ($first_region?'in active':'');?>" >
						<ul class="nav nav-pills" role="tablist"><?php
			$first_region = 0;
			foreach($r['zones'] as $z){
				?><li role="presentation" <?php echo ($first?'class="active"':'');?>><a data-toggle="tab" href="#zone<?php echo $z['id'];?>"><?php echo $z['name_'.$langGame];?> <span class="badge">{{mobList.selectedCount(<?php echo $z['id'];?>)}}</span></a></li><?php
				$first = 0;
			}
			
						?></ul>
						<div class="tab-content">
	<?php 
			$first = 1;
			foreach($r['zones'] as $z){
						?><div id="zone<?php echo $z['id'];?>" class="tab-zone<?php echo $z['id'];?> tab-region<?php echo $z['id_region'];?> tab-pane fade <?php echo ($first?'in active':'');?>">
							<div class="panel-body">
								<div>
									<div class="mob-items"><?php
				$j = 0;
				$first = 0;
				$openTag = false;
				foreach($z['mobs'] as $m){
					if(($j % 3) == 0){ 
						echo '<div class="row equal">';
						$openTag = true; 
					}
					?><div class="mob-item col-sm-12 col-md-4">
						<div class="checkbox">
							<label>
								<input type="checkbox" data-id="<?php echo $m['id'];?>" data-is-multiple="<?php echo $m['is_multiple'];?>" data-zone-name="<?php echo $z['name_'.$langGame];?>" >
								<?php echo (!empty($m['lvl']) ? '<span class="lvl-tag">Lv '.$m['lvl'].'</span>':'') ?>
								<span class="tag"><?php echo $m['name_'.$langGame]?></span>
								<span class="location"><?php echo " (".intval($m['x']).",".intval($m['y']).")"; ?></span>
								<?php if($m['is_fate']) { ?>
								<span class="fate-tag"><img src="<?php echo Config::$context ?>/img/fate.png" title="<?php echo $m['fate']['name_'.$langGame]; ?>" width="24px" height="24px"></img></span>
								<?php } ?>
							</label>
						</div>
					</div><?php
					if($j % 3 == 2){ 
						echo '</div>'; 
						$openTag = false; 
					}
					$j++;
				}
				if($openTag) echo '</div>';
?>
									</div>
								</div>
							</div>
						</div><?php
			}
			
?>
					</div>
				</div>
<?php
			
		} 
?>		
				</div>
			</div>
			<div id="resultsTab" class="hidden">
				<ul id="result-pills-region" class="nav nav-pills result-pills" role="tablist">
<?php
		$first = 1;
		foreach($regions as $r){
			?><li role="presentation" <?php echo ($first?'class="active"':'');?>><a data-toggle="tab" href="#resregion<?php echo $r['id'];?>"><?php echo $r['name_'.$langGame];?> <span class="badge">{{mobList.selectedCountRegion(<?php echo $r['id'];?>)}}</span></a></li><?php
			$first = 0;
		}
?>
				</ul>
				<div class="tab-content well" style="overflow:auto;margin-top:10px;padding:10px;">
<?php 
		$first_region = 1;
		foreach($regions as $r){
			$first = 1;
			?><div id="resregion<?php echo $r['id'];?>" class="tab-pane fade <?php echo ($first_region?'in active':'');?>" >
						<ul class="nav nav-pills result-pills" role="tablist"><?php
			$first_region = 0;
			foreach($r['zones'] as $z){
				?><li role="presentation" <?php echo ($first?'class="active"':'');?>><a data-toggle="tab" href="#reszone<?php echo $z['id'];?>"><?php echo $z['name_'.$langGame];?> <span class="badge">{{mobList.selectedCount(<?php echo $z['id'];?>)}}</span></a></li><?php
				$first = 0;
			}
						?></ul>
						<div class="tab-content">
<?php 
			$first = 1;
			foreach($r['zones'] as $z){
?>
							<div id="reszone<?php echo $z['id'];?>" class="tab-pane fade <?php echo ($first?'in active':'');?>">
								<div class="panel-body">
									<div>
										<div id="mapzone<?php echo $z['id'];?>" style="overflow:visible;">
											<div class="outsideWrapper" style="text-center;">
												<div class="insideWrapper" class="img-responsive" >
													<img id="map-zone<?php echo $z['id'];?>" class="coveredImage">
													<canvas id="canvas-zone<?php echo $z['id'];?>" class="canvas-route"></canvas>
												</div>
											</div>
										</div>
										<div id="steps-zone-<?php echo $z['id'];?>"></div>
									</div>
								</div>
							</div><?php
				$first = 0;
			}
			
			?>
						</div>
					</div>
<?php
			
		} 
?>		
				</div>
			</div>
			<?php echo print_footer(); ?>
			
			<nav class="navbar navbar-fixed-bottom" style="background-color:#222">
			  <div class="container">
				  <ul class="nav navbar-nav lower-navbar">
					<div id="searchbutton" class="btn-group dropup">
						<button type="button" class="btn btn-success btn-raised navbar-btn" ng-click="data.send(item, $event);" style="padding:8px;"><?php echo string_format(WebLang::$MSG_SEARCH_BTN, '<span class="badge">{{mobList.allSelectedCount()}}</span>') ?></button>
						<button type="button" class="btn btn-success btn-raised navbar-btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<span class="caret"></span>
							<span class="sr-only"><?php echo WebLang::$MSG_SEARCH_BTN_DROPDOWN ?></span>
						</button>
						<ul class="list-group dropdown-menu">
							<li class="btn list-group-item" ng-class="mobList.selectedOption == opt.option?'list-group-item-primary active':''" ng-value="opt.option" ng-model="mobList.selectedOption" ng-repeat="opt in mobList.options" ng-click="mobList.selectedOption = opt.option;">
								<h5 class="list-group-item-heading">{{opt.text}}</h5>
								<h5 class="list-group-item-text" style="opacity:0.82;white-space:normal;">{{opt.description}}</h5>
							</li>
						</ul> 
					</div>
					
					<button id="clearbutton" type="button" class="btn btn-default btn-raised navbar-btn" ng-click="mobList.clear();" style="padding:8px 20px;"><?php echo WebLang::$MSG_CLEAR_BTN ?></button>
					<button id="newsearchbutton" type="button" class="btn btn-default btn-raised navbar-btn hidden" ng-click="mobList.newSearch();"><?php echo WebLang::$MSG_MODIFY_BTN ?></button>
				  </ul>
			  </div>
			</nav>
		</div>
	</body>
<?php	
	}	
	
	function print_generic_body($contentFunction){
		$langWeb= WebLang::getLang();
		$langGame = GameLang::getLangDb();
?>
	<body>
		<?php echo print_generic_body_scripts(); ?>
		<?php echo WebLang::getLangJs(); ?>
		
		<nav class="navbar navbar-generic navbar-fixed-top">
		  <div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-menu" aria-expanded="false">
					<span class="sr-only"><?php echo WebLang::$MSG_MENU ?></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<div class="btn-group">
					<a href="#" class="navbar-brand" style="height:auto;padding:0;background-color:transparent !important;">
						<img src="<?php echo Config::$context ?>/img/logo.png" height="32px" style="display:inline"/>
						<?php echo WebLang::$MSG_TITLE ?>
					</a>
				</div>
			</div>
			<?php echo print_top_navbar_options(); ?>
		  </div>
		</nav>

		<div class="container">
			<div class="row" style="margin-top:12px;">
				<div class="col-md-8">
					<div class="well">
						<h2><img src="<?php echo Config::$context ?>/img/logo.png?v=<?php echo Cache::$lastEditedLogo ?>" class="header-logo"><?php echo WebLang::$MSG_TITLE;?></h2>
						<h2><small><?php echo WebLang::$MSG_TITLE_DESC;?></small></h2>
					</div>
					<?php echo call_user_func($contentFunction); ?>
				</div>
				<?php echo print_sidebar_right(); ?>
			</div>
			<?php echo print_footer(); ?>
		</div>
	</body>
<?php	
	}
	
	function print_sidebar_right(){
?>
		<div class="col-md-4">
			<div class="well">
				<h4><?php echo WebLang::$MSG_HOME_TITLE_EXPANSIONS ?></h4>
				<div class="expansions">
					<div class="expansion-row">
						<a class="expansion-block realmreborn" href="<?php echo Config::$context ?>/arr/">
							<img src="<?php echo Config::$context ?>/img/arr.png"/>
						</a>
					</div>
					<div class="expansion-row">
						<a class="expansion-block heavensward" href="<?php echo Config::$context ?>/hw/">
							<img src="<?php echo Config::$context ?>/img/hw.png">
						</a>
					</div>
					<div class="expansion-row">
						<a class="expansion-block stormblood" href="<?php echo Config::$context ?>/sb/">
							<img src="<?php echo Config::$context ?>/img/sb.png"/>
						</a>
					</div>
					<div class="expansion-row">
						<a class="expansion-block shadowbringers" href="<?php echo Config::$context ?>/shb/">
							<img src="<?php echo Config::$context ?>/img/shb.png"/>
						</a>
					</div>
				</div>
			</div>
			<div class="well">
				<h4><?php echo WebLang::$MSG_HOME_TITLE_MAIN_CONTRIBS ?></h4>
				<dl>
					<dt class="text-primary"><a href="http://eu.finalfantasyxiv.com/lodestone/character/6727480/">Guybrush Peepwood (Cerberus)</a></dt>
					<dd style="margin-bottom:16px;"><i><?php echo WebLang::$MSG_HOME_COLLAB_GUY ?></i></dd>
					<dt class="text-primary"><a href="http://eu.finalfantasyxiv.com/lodestone/character/7279199/">Mordyn Greene (Cerberus)</a></dt>
					<dd style="margin-bottom:16px;"><i><?php echo WebLang::$MSG_HOME_COLLAB_MORD ?></i></dd>
					<dt class="text-primary"><a href="http://eu.finalfantasyxiv.com/lodestone/character/5619673/">Felkis Brink (Cerberus)</a></dt>
					<dd style="margin-bottom:16px;"><i><?php echo WebLang::$MSG_HOME_COLLAB_FELKIS ?></i></dd>
					<dt class="text-primary"><a href="http://eu.finalfantasyxiv.com/lodestone/character/8483986/">Smokey Irish (Cerberus)</a></dt>
					<dd style="margin-bottom:16px;"><i><?php echo WebLang::$MSG_HOME_COLLAB_SMOKEY ?></i></dd>
					<dt class="text-primary"><a href="http://na.finalfantasyxiv.com/lodestone/character/14748036/">Mamoru Akizuki (Faerie)</a></dt>
					<dd style="margin-bottom:16px;"><i><?php echo WebLang::$MSG_HOME_COLLAB_MAMORU ?></i></dd>
					<dt class="text-primary"><a href="http://na.finalfantasyxiv.com/lodestone/character/17035001/">Sumire Aster (Faerie)</a></dt>
					<dd style="margin-bottom:16px;"><i><?php echo WebLang::$MSG_HOME_COLLAB_SUMIRE ?></i></dd>
				</dl>
				<hr/>
				<small><?php echo WebLang::$MSG_HOME_COLLABORATE ?>: <script type="text/javascript"><!--
				var cfynmqn = ['n','i','l','i','m','m','h','s','>','a','.','e','l','o','i',' ','a','h','m','t','x','n','e','"','>','m','v','u','"','r','x','a','p','c','o','m','s','f','t','<','f','t','s','c','i','t','m','p','<','t','a','f','l','f','@','c','o','i','"','a','d','f','a','n','=','a','a','d','v','h','s','h','.','h','"','@','/','u','=','a',':','i','n',' '];var miysgvk = [20,11,43,25,9,79,75,31,83,82,36,5,53,38,19,2,33,67,39,34,64,29,49,54,55,18,26,68,40,4,24,73,32,37,78,58,71,63,74,80,22,13,45,42,65,30,50,72,0,70,1,23,12,6,61,77,14,59,8,10,17,62,56,69,47,51,44,57,66,35,46,3,76,27,48,21,81,28,7,16,15,52,60,41];var uqspfim= new Array();for(var i=0;i<miysgvk.length;i++){uqspfim[miysgvk[i]] = cfynmqn[i]; }for(var i=0;i<uqspfim.length;i++){document.write(uqspfim[i]);}
				// --></script>
				<noscript><?php echo WebLang::$MSG_NO_JS_EMAIL ?></noscript></small>
			</div>
			<div class="well">
				<h4><?php echo WebLang::$MSG_HOME_TITLE_DONATIONS ?></h4>
				<div class="row"><div class="col-xs-12"><?php echo WebLang::$MSG_HOME_DONATE ?></div></div>
			</div>
			<div class="well">
				<h4><?php echo WebLang::$MSG_HOME_TITLE_REDDIT_THREAD ?></h4>
				<dl>
					<dt><a href="https://www.reddit.com/r/ffxiv/comments/6ioeh1/ffxiv_hunts_path_finder_stormblood/"><?php echo WebLang::$MSG_HOME_REDDIT_THREAD ?></a></dt>
				</dl>
			</div>
		</div>		
<?php		
	}
	
	function print_news(){
?>
		<div class="well" style="margin-top:20px;">
			<h2><?php echo WebLang::$MSG_HOME_TITLE_NEWS; ?></h2>
			<div id="update7"><?php print_update_raw(WebLang::$MSG_HOME_NEWS_UPDATE, WebLang::$MSG_HOME_UPDATES_7, 'Admin', to_utc_time(2019, 6, 18, 19, 34, 0)); ?></div>
			<div id="update6"><?php print_update_raw(WebLang::$MSG_HOME_NEWS_UPDATE, WebLang::$MSG_HOME_UPDATES_6, 'Admin', to_utc_time(2017, 10, 9, 10, 39, 0)); ?></div>
			<div id="update5"><?php print_update_raw(WebLang::$MSG_HOME_NEWS_UPDATE, WebLang::$MSG_HOME_UPDATES_5, 'Admin', to_utc_time(2017, 7, 11, 20, 45, 0)); ?></div>
			<div id="note1"><?php print_note('Regarding ARR Hunts', WebLang::$MSG_NOTE_1, 'Guybrush', to_utc_time(2017, 7, 4, 11, 10, 0)); ?></div>
			<div id="update4"><?php print_update(WebLang::$MSG_HOME_NEWS_UPDATE, WebLang::$MSG_HOME_UPDATES_4, 'Admin', to_utc_time(2017, 7, 3, 13, 30, 0)); ?></div>
			<div id="update3"><?php print_update(WebLang::$MSG_HOME_NEWS_UPDATE, WebLang::$MSG_HOME_UPDATES_3, 'Admin', to_utc_time(2017, 7, 1, 15, 32, 0)); ?></div>
			<div id="update2"><?php print_update(WebLang::$MSG_HOME_NEWS_UPDATE, WebLang::$MSG_HOME_UPDATES_2, 'Admin', to_utc_time(2017, 6, 25, 18, 0, 0)); ?></div>
			<div id="update1"><?php print_update(WebLang::$MSG_HOME_NEWS_UPDATE, WebLang::$MSG_HOME_UPDATES_1, 'Admin', to_utc_time(2017, 6, 21, 18, 0, 0)); ?></div>
		</div>
<?php		
	}
	
	function print_new($title, $text, $author, $date){
?>	<h3><?php echo $title ?></h3>
	<div class="news">
	<?php echo '<div class="news-text">'.$text.'</div><div class="news-footer"><span class="news-author">'.$author.'</span> - <span class="news-date"><script>printDate('.$date.');</script></span></div>';?>
	</div>
	<hr/>
<?php
	}
	
	function print_note($title, $text, $author, $date){
		?><h3>Note: <?php echo $title ?></h3>
	<div class="news">
	<?php echo  
		'<div class="news-text">'.$text.'</div>'.
		'<div class="news-footer"><span class="news-author">'.$author.'</span> - <span class="news-date"><script>printDate('.$date.');</script></span></div>';?>
	</div>
	<hr/>
<?php
	}
	
	function print_update($title, $updates, $author, $date){
		?><h3><?php echo $title ?></h3>
	<div class="news">
	<?php echo  
		'<div class="news-text"><ul>'.implode(array_map('helper_print_li_update', $updates)).'</ul></div>'.
		'<div class="news-footer"><span class="news-author">'.$author.'</span> - <span class="news-date"><script>printDate('.$date.');</script></span></div>';?>
	</div>
	<hr/>
<?php
	}
	
	function print_update_raw($title, $updates, $author, $date){
		?><h3><?php echo $title ?></h3>
	<div class="news">
	<?php echo  
		'<div class="news-text">'.$updates.'</div>'.
		'<div class="news-footer"><span class="news-author">'.$author.'</span> - <span class="news-date"><script>printDate('.$date.');</script></span></div>';?>
	</div>
	<hr/>
<?php
	}
	
	function print_updates_with_header($title, $header, $updates, $author, $date){
		?>	<h3><?php echo $title ?></h3>
	<div class="news">
	<?php echo ($header !== null ? '<h4>'.$header.'</h4>':'').
		'<div class="news-text"><ul>'.array_map('helper_print_li_update', $updates).'</ul></div>'.
		'<div class="news-footer"><span class="news-author">'.$author.'</span> - <span class="news-date"><script>printDate('.$date.');</script></span></div>';?>
	</div>
	<hr/>
<?php
	}
	
	function helper_print_li_update($upd){
		return '<li>'.$upd.'</li>';
	}
	
	function print_api(){
?>
		<div class="well" style="margin-top:20px;">
			<h2><?php echo WebLang::$MSG_TITLE_API ?></h2>
			<h2><small><?php echo WebLang::$MSG_WORK_IN_PROGRESS ?></small></h2>
		</div>
<?php 
	}
	
	function to_utc_time($y, $m, $d, $hour = 0, $min = 0, $sec = 0){
		return (new DateTime())->setDate($y,$m,$d)->setTime($hour,$min,$sec)->getTimestamp();
	}
