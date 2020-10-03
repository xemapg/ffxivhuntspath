<?php
	require_once('../core.php');
	
	$lang = substr(filter_input(INPUT_GET, 'lang', FILTER_SANITIZE_STRING), 0, 2);
	$type = intval(filter_input(INPUT_GET, 'type', FILTER_SANITIZE_STRING));
	
	switch($type){
		case 1:
			setWebLang($lang);
			break;
		case 2:
			setGameLang($lang);
			break;
		default:
			break;
	}
	
	http_response_code(200);
	return $lang.' '.$type;
	exit();