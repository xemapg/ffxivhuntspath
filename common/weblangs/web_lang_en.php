<?php
class WebLang {
	/*
	 * Instructions to translate:
	 *
	 * If you want to translate this to your language, you just have to translate all the strings at the right
	 * side of the '=' and leave the rest untouched. The translated strings needs to be quoted.
	 *
	 * The strings surrounded with the signs < or > doesn't need to be touched.
	 * 
	 * Also, the strings marked like {0}, {1}, etc... are the parameters, doesn't need to be touched either. 
	 *
	 * If you're not sure about how to translate a string, or you have any doubts, you can contact us in the email address: admin@ffxivhuntspath.com
	 * 
	 * When you're done, sent it back to us to the email specified above. If you want to appear as main contributor of this website, send with this file
	 * your Character in-game and your server and we'll add you.
	 * 
	 * Thank you!
	 */
	
	/* Common */
	public static $MSG_HOME = 'Home';
	public static $MSG_API = 'API';
	public static $MSG_EXPANSION = 'Expansion';
	public static $MSG_WEB_LANGUAGE = 'Web';
	public static $MSG_GAME_LANGUAGE = 'Game';
	
	public static $MSG_MENU = 'Menu';
	
	public static $MSG_TITLE = 'FFXIV Hunts Path Finder';
	public static $MSG_TITLE_DESC = 'Simple tool for searching the best route for a group of selected mobs, designed for the daily marks included in FFXIV';
	public static $MSG_HW = 'Heavensward';
	public static $MSG_SB = 'Stormblood';
	public static $MSG_ARR = 'A Realm Reborn';
	public static $MSG_SHB = 'Shadowbringers';
	
	/* Search Page */
	public static $MSG_SEARCH_BTN = 'Search {0} mobs';
	public static $MSG_SEARCH_BTN_DROPDOWN = 'Toggle Dropdown';
	public static $MSG_SEARCH_BTN_EXPANSION = 'Change Expansion';
	public static $MSG_SEARCH_BTN_WEB_LANGUAGE = 'Change Web Language';
	public static $MSG_SEARCH_BTN_GAME_LANGUAGE = 'Change Game Language';
	public static $MSG_CLEAR_BTN = 'Clear';
	public static $MSG_MODIFY_BTN = 'Modify Search';
	
	/* Home */
	public static $MSG_HOME_TITLE_NEWS = 'News';
	public static $MSG_HOME_TITLE_REDDIT_THREAD = 'Reddit Thread';
	public static $MSG_HOME_TITLE_EXPANSIONS = 'Expansions';
	public static $MSG_HOME_TITLE_MAIN_CONTRIBS = 'Main Contributors';
	public static $MSG_HOME_TITLE_DONATIONS = 'Donations';
	
	public static $MSG_HOME_REDDIT_THREAD = 'Main Reddit Thread about the website';
	
	public static $MSG_HOME_NEWS_UPDATE = 'Update';
	
	public static $MSG_HOME_COLLAB_GUY = 'Admin and Developer, Mobs location in SB and HW expansions. Web Translation to Spanish';
	public static $MSG_HOME_COLLAB_MORD = 'Mobs location in HW expansion';
	public static $MSG_HOME_COLLAB_FELKIS = 'Mobs location in HW expansion';
	public static $MSG_HOME_COLLAB_SMOKEY = 'Mobs location in HW expansion';
	public static $MSG_HOME_COLLAB_MAMORU = 'Game Client Translation to Simplified Chinese in SB and HW expansions';
	public static $MSG_HOME_COLLAB_SUMIRE = 'Game Client Translation to Simplified Chinese in SB and HW expansions';
	
	public static $MSG_HOME_COLLABORATE = 'Want to contribute translating to your language? Want to send suggestions or report bugs? You can contact us via email';
	public static $MSG_HOME_DONATE = 'If you want to donate for this website, you can do it here';
	
	public static $MSG_NO_JS_EMAIL = 'Please enable Javascript to see the email address';
	
	public static $MSG_TEMPORAL_ARR_WARN = 'This is a preliminary version and may contain errors, for more information please visit the <a href="/home/#update5" class="bold">Changelog</a>';
			
	public static $MSG_HOME_UPDATES_7 =
			'I\'d like to inform that the Shadowbringers expansion, available next 2nd July 2019 will be added.<br/><br/>At the same time, the website is being rebuild from scratch, with a backend and a frontend separated, adding the possibility to use the backend as a public API. All the code will be published in GitHub. That way, i\'ll make changes people requested and many other changes, but keeping the essence of the web intact.<br/><br/>Regards!'
	;
	
	public static $MSG_HOME_UPDATES_6 = 
			'Added Translation of the Game Client to Simplified Chinese in the Heavensward and Stormblood expansions thanks to '.
			'<a href="http://na.finalfantasyxiv.com/lodestone/character/14748036/">Mamoru Akizuki (Faerie)</a> and '.
			'<a href="http://na.finalfantasyxiv.com/lodestone/character/17035001/">Sumire Aster (Faerie)</a>';
			
	public static $MSG_HOME_UPDATES_5 = 
			'A <b>preliminary</b> version for ARR Hunts has been added. It\'s not definitive, since this tool was thought for the HW and SB expansions, '.
			'in which zones you\'re able to fly and skip obstacles unlike ARR areas, so the routes calculated are not optimal, and even messy in zones which contains '.
			'separated areas. Also, not all the hunts are added yet, they will be progressively added.<br/>'.
			'<h4>Changelog</h4><ul>'.
				'<li>Added preliminary version of ARR Hunts</li>'.
				'<li>Tabs without results won\'t be showed anymore to save space</li>'.
				'<li>The list with the results are now labelled with the steps of the map</li>'.
				'<li>Improvements for mobile and tablet resolutions</li>'.
				'<li>Minor fixes and small bug corrections</li>'.
			'</ul><br/>'.
			'<h4>Known Issues</h4><ul>'.
				'<li>Routes in ARR expansion can be incorrect</li>'.
				'<li>Different areas inside zones in ARR expansions not added yet</li>'.
				'<li>Not all ARR hunting bills have been added yet</li>'.
			'</ul>'
	;
	
	public static $MSG_NOTE_1 = 'I retract myself from what I said, I\'m having some free time again and I\'m already working in the background on the ARR hunts, even if it\'s not the purpose of this tool as I said, it will help finding the mobs in an easier way.';
		
	public static $MSG_HOME_UPDATES_4 = array(
		'Added translation for the website to German'
	);
	
	public static $MSG_HOME_UPDATES_3 = array(
			'Improved routing algorithm (20% faster)',
			'Added Home and API pages (API is still in progress)',
			'For larger resolutions, the list for selecting the mobs becomes a grid of 3 mobs per row',
			'Option selected for searching is now saved (If you have cookies enabled)',
			'Translations added to the web, independent of your game client (For now, only spanish and english)',
			'Added donation button (Even tho we don\'t seek to make benefit with this)',
			'Minor fixes and small bug corrections'
	);
	
	public static $MSG_HOME_UPDATES_2 = array(
			'There\'s been a huge refactoring in the code of the website',
			'Levels and number of mobs to slain has been added (The number of mobs to slain is not fully updated for every mob yet)',
			'More accuracy in the coordinates of the aetherytes/mobs',
			'Improved Cache',
			'Searching Indicator',
			'The algorithm for the aetherytes penalty has been improved',
			'Responsive Improvements for small resolutions',
			'Minor fixes and small bug corrections'
	);
	
	public static $MSG_HOME_UPDATES_1 = array(
			'Stormblood mobs uploaded',
			'Big changes and improvements in the UI'
	);
	
	/* API */
	public static $MSG_TITLE_API = 'API';
	public static $MSG_WORK_IN_PROGRESS = 'Not available yet, work in progress';
	
	/* Maintenance */
	public static $MSG_MAINTENANCE_TITLE = 'Maintenance in progress';
	public static $MSG_MAINTENANCE_TEXT_1 = 'Our apologies, the website is currently under maintenance.';
	public static $MSG_MAINTENANCE_TEXT_2 = 'Our best Goldsmith is currently working on it as fast as a Manderville can. Please try again in a few minutes.';
	
	/* Languages */
	public static $MSG_LANG_ENGLISH = 'English';
	public static $MSG_LANG_FRENCH = 'French';
	public static $MSG_LANG_GERMAN = 'German';
	public static $MSG_LANG_JAPANESE = 'Japanese';
	public static $MSG_LANG_SPANISH = 'Spanish';
	public static $MSG_LANG_SMP_CHINESE = 'Chinese (Simplified)';
	
	/* Footer */
	public static $MSG_FOOTER_DATA = 'All the data has been aggregated manually by contributors.';
	
	public static function getLangJs(){
?>
	<script>
		var $MSG_ALL_TRANSPORTS = 'Use all teleports';
		var $MSG_ALL_TRANSPORTS_DESC = 'Uses all the aetherytes in order to get the fastest path, more expensive';
		var $MSG_NO_TRANSPORTS_ZONE = 'No teleports in the same zone';
		var $MSG_NO_TRANSPORTS_ZONE_DESC = 'Avoid the use of teleports if you\'re already in the zone';
		
		var $MSG_SEARCH = 'Search';
		var $MSG_SEARCH_PLACEHOLDER = 'Search for your hunt...';
		
		var $MSG_SELECTED_MOB = '<b>{0}</b> has been selected.';
		var $MSG_ALREADY_SELECTED_MOB = '<b>{0}</b> was already selected.';
		
		var $MSG_NOTHING_HERE = 'Nothing to do here, move along';
		var $MSG_TRANSPORT_TO = 'Teleport to <b>{0} ({1})</b>';
		var $MSG_KILL_AT = 'Go to <b>({0}, {1})</b> and Slay';
		var $MSG_EFFICIENCY = 'For efficiency reasons, <b>only a max of {0} mobs per zone allowed</b>';
		
		var $MSG_BADGE_DONE = 'Done';
		var $MSG_BADGE_KILL = 'Kill';
		var $MSG_BADGE_TELEPORT = 'Teleport';
		var $MSG_BADGE_ERROR = 'Error';
		
		var $MSG_PERIOD = ["second", "minute", "hour", "day", "month", "year"];
		var $MSG_PERIOD_PL = ["seconds", "minutes", "hours", "days", "months", "years"];
		var $MSG_TIME_AGO = '{0} {1} ago'; // Where {0} is the time, and {1} the period, eg. 1 second ago. 3 hours ago.
		
		var $MSG_CALL_ERROR_OCURRED = '<b>Whoops!</b> An error ocurred in the call, please try again later.';
	</script>
<?php
	}
	
	public static function getLang(){
		return 'en';
	}
}