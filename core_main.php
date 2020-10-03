<?php
	# Attempt to find the location of the core files.
	$g_config_path = dirname(__FILE__).DIRECTORY_SEPARATOR.'common'.DIRECTORY_SEPARATOR;
	$g_cache_path = dirname(__FILE__).DIRECTORY_SEPARATOR.'common'.DIRECTORY_SEPARATOR.'cache'.DIRECTORY_SEPARATOR;
	$g_web_langs_path = dirname(__FILE__).DIRECTORY_SEPARATOR.'common'.DIRECTORY_SEPARATOR.'weblangs'.DIRECTORY_SEPARATOR;
	$g_game_langs_path = dirname(__FILE__).DIRECTORY_SEPARATOR.'common'.DIRECTORY_SEPARATOR.'gamelangs'.DIRECTORY_SEPARATOR;
	$g_core_api_path = dirname(__FILE__).DIRECTORY_SEPARATOR.'common'.DIRECTORY_SEPARATOR.'core'.DIRECTORY_SEPARATOR;
	
	/*
	 * Set include paths
	 */
	define ( 'BASE_PATH' , realpath( dirname(__FILE__) ) );
	$webRoot = BASE_PATH;
	$webCoreApis = $g_core_api_path;
	$webConfig = $g_config_path;
	$webCacheLib = $g_cache_path;
	$webLangs = $g_web_langs_path;
	$webGameLangs = $g_game_langs_path;
	
	/*
	 * Prepend the application/ and tests/ directories to the
	 * include_path.  
	 */
	$path = array(
		$webRoot,
	    $webCoreApis,
	    $webConfig,
		$webCacheLib,
		$webLangs,
		$webGameLangs,
	    get_include_path()
	    );
	set_include_path( implode( PATH_SEPARATOR, $path ) );
	
	/*
	 * Unset global variables that are no longer needed.
	 */
	unset($webRoot, $webCoreApis, $webConfig, $webCacheLib, $webGameLangs, $webLangs);
	
	require_once( 'config.php' );
	
	require_once( 'print_api.php' );
	require_once( 'utils_api.php' );
	require_once( 'lang.php' );
	initLang();
