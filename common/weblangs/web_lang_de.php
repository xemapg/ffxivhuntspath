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
	public static $MSG_HOME = 'Startseite';
	public static $MSG_API = 'API';
	public static $MSG_EXPANSION = 'Erweiterung';
	public static $MSG_WEB_LANGUAGE = 'Website';
	public static $MSG_GAME_LANGUAGE = 'Spiel';
	
	public static $MSG_MENU = 'Menü';
	
	public static $MSG_TITLE = 'FFXIV Hunts Path Finder';
	public static $MSG_TITLE_DESC = 'Ein einfaches Tool zum Finden der besten Route zu ausgewählten Mobs für die Hohe Jagd in FFXIV';
	public static $MSG_HW = 'Heavensward';
	public static $MSG_SB = 'Stormblood';
	public static $MSG_ARR = 'A Realm Reborn';
	public static $MSG_SHB = 'Shadowbringers';
	
	/* Search Page */
	public static $MSG_SEARCH_BTN = 'Suche {0} Mobs';
	public static $MSG_SEARCH_BTN_DROPDOWN = 'Toggle Dropdown';
	public static $MSG_SEARCH_BTN_EXPANSION = 'Erweiterung wechseln';
	public static $MSG_SEARCH_BTN_WEB_LANGUAGE = 'Sprache der Website wechseln';
	public static $MSG_SEARCH_BTN_GAME_LANGUAGE = 'Sprache des Spiels wechseln';
	public static $MSG_CLEAR_BTN = 'Löschen';
	public static $MSG_MODIFY_BTN = 'Suche ändern';
	
	/* Home */
	public static $MSG_HOME_TITLE_NEWS = 'Neuigkeiten';
	public static $MSG_HOME_TITLE_REDDIT_THREAD = 'Reddit Thread';
	public static $MSG_HOME_TITLE_EXPANSIONS = 'Erweiterungen';
	public static $MSG_HOME_TITLE_MAIN_CONTRIBS = 'Mitwirkende';
	public static $MSG_HOME_TITLE_DONATIONS = 'Spenden';
	
	public static $MSG_HOME_REDDIT_THREAD = 'Offizieller Reddit Thread zur Website';
	
	public static $MSG_HOME_NEWS_UPDATE = 'Update';
	
	public static $MSG_HOME_COLLAB_GUY = 'Admin und Entwickler, Positionsbestimmung der Mobs für die Erweiterungen SB und HW, Übersetzung der Website ins Spanische';
	public static $MSG_HOME_COLLAB_MORD = 'Positionsbestimmung der Mobs in der HW Erweiterung';
	public static $MSG_HOME_COLLAB_FELKIS = 'Positionsbestimmung der Mobs in der HW Erweiterung';
	public static $MSG_HOME_COLLAB_SMOKEY = 'Positionsbestimmung der Mobs in der HW Erweiterung';
	public static $MSG_HOME_COLLAB_MAMORU = 'Game Client Translation to Simplified Chinese in SB and HW expansions';
	public static $MSG_HOME_COLLAB_SUMIRE = 'Game Client Translation to Simplified Chinese in SB and HW expansions';
	
	public static $MSG_HOME_COLLABORATE = 'Möchtest du helfen, Hunts Path Finder durch eine Übersetzung in deine Sprache zu verbessern? Willst du einen Verbesserungsvorschlag einbringen oder einen Bug melden? Schreibe uns eine Email';
	public static $MSG_HOME_DONATE = 'Wenn du diese Website gerne nutzt und uns durch eine Spende helfen möchtest, kannst du das hier tun:';
	
	public static $MSG_NO_JS_EMAIL = 'Bitte aktiviere Java Script, um die Email-Adresse anzuzeigen.';
	
	public static $MSG_TEMPORAL_ARR_WARN = 'This is a preliminary version and may contain errors, for more information please visit the <a href="/home/#update5">Changelog</a>';
			
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
		'Übersetzung der Website ins Deutsche hinzugefügt'
	);
	
	public static $MSG_HOME_UPDATES_3 = array(
			'Verbesserter Algorhythmus zur Routenerstellung (20% schneller)',
			'Home und API auf der Website hinzugefügt (API ist noch in Arbeit)',
			'Für hohe Auflösungen wird die Liste zur Auswahl der Mobs nun als Gitter dargestellt.',
			'Die ausgewählte Option für Teleports wird jetzt für den nächsten Besuch gespeichert (sofern Cookies aktiviert sind)',
			'Übersetzung der Website in verschiedene Sprachen hinzugefügt, unabhängig von der Spracheinstellung im Spiel (vorerst nur Englisch und Spanisch)',
			'Möglichkeit zu Spenden hinzugefügt (Es ist nicht unser Ziel, mit diesr Website Profit zu machen, aber deren Entwicklung, Instandhaltung und Verbesserung kostet Geld und Ressourcen)',
			'Kleine Bug-Fixes'
	);
	
	public static $MSG_HOME_UPDATES_2 = array(
			'Vollständige Überarbeitung des Codes der Website',
			'Levels und für die Jagd erforderliche Mob-Anzahl hinzugefügt (Die Mob-Anzahl ist nocht nicht vollständig eingefügt)',
			'Verbesserte Genauigkeit der Koordinaten für Mobs und Ätheriten',
			'Verbesserte Cache',
			'Suchvorschläge',
			'Verbesserter Algorhythmus für den Zeitverlust durch die Nutzung von Ätheriten',
			'Verbesserte Verwendung für Bildschirme mit kleiner Auflösung',
			'Kleine Bug-Fixes'
	);
	
	public static $MSG_HOME_UPDATES_1 = array(
			'Mobs in Stormblood hinzugefügt',
			'Große Änderungen und Verbesserungen der UI'
	);
	
	/* API */
	public static $MSG_TITLE_API = 'API';
	public static $MSG_WORK_IN_PROGRESS = 'Noch nicht verfügbar, befindet sich in Arbeit.';
	
	/* Maintenance */
	public static $MSG_MAINTENANCE_TITLE = 'Wartung wird durchgeführt';
	public static $MSG_MAINTENANCE_TEXT_1 = 'Es tut uns Leid, die Website befindet sich gerade in Wartung.';
	public static $MSG_MAINTENANCE_TEXT_2 = 'Unser bester Goldschmied arbeitet so schnell, wie eigentlich nur Godbert es kann. Bitte versuche es in ein paar Minuten noch einmal.';
	
	/* Languages */
	public static $MSG_LANG_ENGLISH = 'Englisch';
	public static $MSG_LANG_FRENCH = 'Französisch';
	public static $MSG_LANG_GERMAN = 'Deutsch';
	public static $MSG_LANG_JAPANESE = 'Japanisch';
	public static $MSG_LANG_SPANISH = 'Spanisch';
	public static $MSG_LANG_SMP_CHINESE = 'vereinfachtem Chinesisch';
	
	/* Footer */
	public static $MSG_FOOTER_DATA = 'Sämtliche Daten wurden manuell von Mitwirkenden gesammelt.';
	
	public static function getLangJs(){
?>
	<script>
		var $MSG_ALL_TRANSPORTS = 'Alle Teleports benutzen';
		var $MSG_ALL_TRANSPORTS_DESC = 'Benutzt Teleports auch innerhalb einer Zone, um den schnellsten Weg zu finden';
		var $MSG_NO_TRANSPORTS_ZONE = 'Keine Teleports innerhalb der Zone';
		var $MSG_NO_TRANSPORTS_ZONE_DESC = 'Erstellt eine Route ohne zusätzliche Teleports innerhalb der selben Zone';
		
		var $MSG_SEARCH = 'Suche';
		var $MSG_SEARCH_PLACEHOLDER = 'Suche nach Mob';
		
		var $MSG_SELECTED_MOB = '<b>{0}</b> ist ausgewählt.';
		var $MSG_ALREADY_SELECTED_MOB = '<b>{0}</b> wurde bereits hinzugefügt.';
		
		var $MSG_NOTHING_HERE = 'Hier gibt es gerade nichts zu tun.';
		var $MSG_TRANSPORT_TO = 'Teleportiere nach <b>{0} ({1})</b>';
		var $MSG_KILL_AT = 'Gehe nach <b>({0}, {1})</b> und jage';
		var $MSG_EFFICIENCY = 'Aus Effizienzgründen sind <b>maximal {0} Mobs pro Zone möglich</b>';
		
		var $MSG_BADGE_DONE = 'Fertig';
		var $MSG_BADGE_KILL = 'Jagd';
		var $MSG_BADGE_TELEPORT = 'Teleport';
		var $MSG_BADGE_ERROR = 'Fehler';
		
		var $MSG_PERIOD = ["Sekunde", "Minute", "Stunde", "Tag", "Monat", "Jahr"];
		var $MSG_PERIOD_PL = ["Sekunden", "Minuten", "Stunden", "Tagen", "Monaten", "Jahren"];
		var $MSG_TIME_AGO = 'vor {0} {1}'; // Where {0} is the time, and {1} the period, eg. 1 second ago. 3 hours ago.
		
		var $MSG_CALL_ERROR_OCURRED = '<b>Oh nein!</b> Bei der Anfrage ist ein Fehler aufgetreten, bitte versuche es später noch ein mal.';
	</script>
<?php
	}
	
	public static function getLang(){
		return 'de';
	}
}