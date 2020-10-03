<?php
	require_once('core.php');

	// Redirect to the last Expansion used
	$index = 'shb';
	if(empty($_COOKIE[Config::$cookie_last_expansion])){
		$index = 'shb';
		setcookie(Config::$cookie_last_expansion, $index, time()+60*60*24*365, "/", Config::$domain_cookie);
	} else {
		$index = $_COOKIE[Config::$cookie_last_expansion];
		switch ($index) {
			case "arr":
				$index = 'arr';
				break;
			case "hw":
				$index = 'hw';
				break;
			case "sb":
				$index = 'sb';
				break;   
			case "shb":
				$index = 'shb';
				break;   
			default:
				$index = 'shb';
				break;
		}
	}

	header("Location: http://".Config::$domain."/".$index."/"); /* Redirect browser */
	exit();