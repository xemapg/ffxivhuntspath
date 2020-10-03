<?php
	function initLang(){
		if(empty($_COOKIE[Config::$cookie_web_lang])){
			$langWeb = isset($_SERVER["HTTP_ACCEPT_LANGUAGE"]) ? substr($_SERVER["HTTP_ACCEPT_LANGUAGE"],0,2) : '';
			$langWeb = setWebLang($langWeb);
		} else {
			$langWeb = substr($_COOKIE[Config::$cookie_web_lang], 0, 2);
		}
		
		require_once('web_lang_'.$langWeb.'.php');
		
		/* --------------------- */
		
		if(empty($_COOKIE[Config::$cookie_game_lang])){
			$langGame = isset($_SERVER["HTTP_ACCEPT_LANGUAGE"]) ? substr($_SERVER["HTTP_ACCEPT_LANGUAGE"],0,2) : '';
			$langGame = setGameLang($langGame);
		} else {
			$langGame = substr($_COOKIE[Config::$cookie_game_lang], 0, 2);
		}
		require_once('game_lang_'.$langGame.'.php');
	}
	
	function setWebLang($lang){
		$webLang = $lang;
		switch ($lang){
			case "de":
				$webLang = 'de';
				break;
			case "es":
				$webLang = 'es';
				break;
			case "en":
				$webLang = 'en';
				break;
			default:
				$webLang = 'en';
				break;
		}
		cookie_set(Config::$cookie_web_lang, $webLang);
		return $webLang;
	}
	
	function setGameLang($lang){
		$gameLang = $lang;
		switch ($lang){
			case "ja":
				$gameLang= 'ja';
				break;
			case "fr":
				$gameLang= 'fr';
				break;
			case "de":
				$gameLang= 'de';
				break;
			case "en":
				$gameLang= 'en';
				break;
			case "zh":
				$gameLang= 'zh';
				break;
			default:
				$gameLang= 'en';
				break;
		}
		cookie_set(Config::$cookie_game_lang, $gameLang);
		return $gameLang;
	}