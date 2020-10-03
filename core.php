<?php
	require_once('core_main.php');
	
	function add_style(){
		?><style>html,body,.container-table{height:100%;padding:5px}.container-table{display:table}.vertical-center-row{display:table-cell;vertical-align:middle}@media (max-width: 768px){html,body,.container-table{height:auto}.vertical-center-row{vertical-align:top}}.maintenance-img-container{float:left;padding:40px}.maintenance-img{width:100%}.maintenance-desc-container{float:left;padding:20px 10px}@media (max-width: 420px){.maintenance-img-container{padding:20px}.maintenance-desc-container{padding:10px}}</style><?php
	}
		
	if(Config::$maintenance === 1){
		header("HTTP/1.1 503 Service Unavailable");
		header("Status: 503 Service Unavailable");
		header("Retry-After: 600");
				
		print_meta();
?>
	<html lang="<?php echo WebLang::getLang() ?>" xmlns:og="http://ogp.me/ns#">
		<?php print_generic_head('add_style'); ?>
		<body>
			<?php print_generic_body_scripts(); ?>
			<div class="container container-table">
				<div class="row vertical-center-row">
					<div class="col-xs-12 col-sm-6 col-sm-offset-3 well clearfix">
						<div class="maintenance-img-container">
							<img src="<?php echo Config::$context?>/img/maintenance.png" class="maintenance-img">
						</div>
						<div class="maintenance-desc-container">
							<h2><?php echo WebLang::$MSG_MAINTENANCE_TITLE ?></h2>
							<p><?php echo WebLang::$MSG_MAINTENANCE_TEXT_1?></p>
							<p><?php echo WebLang::$MSG_MAINTENANCE_TEXT_2?></p>
						</div>
					</div>
				</div>
			</div>
		</body>
	</html>
<?php
		exit();
	}
	
	require_once( 'route2_api.php' );
	
	require_once( 'phpfastcache.php' );
	require_once( 'etags.php' );
	require_once( 'data.php' );
	
	date_default_timezone_set('Europe/Madrid');
	
	initCaches();
	
	compress_start_handler();
	
	// set HTTP response headers
	http_all_headers();
