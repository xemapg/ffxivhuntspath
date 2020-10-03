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
	public static $MSG_HOME = 'Inicio';
	public static $MSG_API = 'API';
	public static $MSG_EXPANSION = 'Expansión';
	public static $MSG_WEB_LANGUAGE = 'Web';
	public static $MSG_GAME_LANGUAGE = 'Juego';
	
	public static $MSG_MENU = 'Menú';
	
	public static $MSG_TITLE = 'FFXIV Hunts Path Finder';
	public static $MSG_TITLE_DESC = 'Herramienta simple para buscar la mejor ruta para un grupo de enemigos seleccionados, diseñado para las cazas diarias incluidas en FFXIV';
	public static $MSG_HW = 'Heavensward';
	public static $MSG_SB = 'Stormblood';
	public static $MSG_ARR = 'A Realm Reborn';
	public static $MSG_SHB = 'Shadowbringers';
	
	/* Search Page */
	public static $MSG_SEARCH_BTN = 'Buscar {0} enemigos';
	public static $MSG_SEARCH_BTN_DROPDOWN = 'Abrir combo';
	public static $MSG_SEARCH_BTN_EXPANSION = 'Cambiar Expansión';
	public static $MSG_SEARCH_BTN_WEB_LANGUAGE = 'Cambiar Lenguaje de la Web';
	public static $MSG_SEARCH_BTN_GAME_LANGUAGE = 'Change Lenguaje del Juego';
	public static $MSG_CLEAR_BTN = 'Borrar';
	public static $MSG_MODIFY_BTN = 'Cambiar Búsqueda';
		
	/* Home */	
	public static $MSG_HOME_TITLE_NEWS = 'Novedades';
	public static $MSG_HOME_TITLE_REDDIT_THREAD = 'Hilo en Reddit';
	public static $MSG_HOME_TITLE_EXPANSIONS = 'Expansiones';
	public static $MSG_HOME_TITLE_MAIN_CONTRIBS = 'Principales Colaboradores';
	public static $MSG_HOME_TITLE_DONATIONS = 'Donaciones';
	
	public static $MSG_HOME_REDDIT_THREAD = 'Hilo principal en Reddit sobre esta web';
	
	public static $MSG_HOME_NEWS_UPDATE = 'Actualización';
	
	public static $MSG_HOME_COLLAB_GUY = 'Administrador y Desarrollador. Localización de enemigos en SB y HW. Traducción de la Web a Español';
	public static $MSG_HOME_COLLAB_MORD = 'Localización de enemigos en HW';
	public static $MSG_HOME_COLLAB_FELKIS = 'Localización de enemigos en HW';
	public static $MSG_HOME_COLLAB_SMOKEY = 'Localización de enemigos en HW';
	public static $MSG_HOME_COLLAB_MAMORU = 'Traducción del Juego a Chino (Simplificado) en las expansiones SB y HW';
	public static $MSG_HOME_COLLAB_SUMIRE = 'Traducción del Juego a Chino (Simplificado) en las expansiones SB y HW';
	
	public static $MSG_HOME_COLLABORATE = '¿Quieres contribuir con esta página traduciendola a tu idioma? ¿Quieres contactar con nosotros para aportar ideas o reportar errores? Puedes contactar con nosotros vía email';
	public static $MSG_HOME_DONATE = 'Si quieres donar para esta web, puedes hacerlo aquí';
	
	public static $MSG_NO_JS_EMAIL = 'Habilita Javascript para ver la dirección de correo';
	
	public static $MSG_TEMPORAL_ARR_WARN = 'Esta es una versión preliminar de la expansión y puede contener errores, para más información visita los <a href="/home/#update5">Cambios recientes</a>';
			
	public static $MSG_HOME_UPDATES_7 =
			'Me gustaría informar de que la expansión Shadowbringers, disponible a partir del 2 de Julio de 2019, será añadida.<br/><br/>Al mismo tiempo, se está rehaciendo de 0 la página web, con un backend y un frontend separados con la posibilidad de que el backend sea usado como API pública. Todo el código será publicado en GitHub. Así aprovecharé para realizar numerosos cambios que me habéis pedido y otras mejoras, manteniendo la esencia de esta web intacta.<br/><br/>Saludos!'
	;
	
	public static $MSG_HOME_UPDATES_6 = 
			'Se ha añadido la traducción del Juego a Chino (Simplificado) en las expansiones Heavensward y Stormblood, gracias a '.
			'<a href="http://na.finalfantasyxiv.com/lodestone/character/14748036/">Mamoru Akizuki (Faerie)</a> y '.
			'<a href="http://na.finalfantasyxiv.com/lodestone/character/17035001/">Sumire Aster (Faerie)</a>';
			
	public static $MSG_HOME_UPDATES_5 =
			'Una versión <b>preliminar</b> de las cazas para la expansión ARR ha sido añadida. No es definitiva ya que esta herramienta fue pensada para las expansiones HW y SB, '.
			'en cuyas zonas se puede volar y esquivar obstáculos, no como en las áreas de la expansión ARR, así que las rutas calculadas no serán óptimas, y posiblemente mal realizadas en zonas que contienen '.
			'areas separadas. Además, no todos los enemigos han sido añadidos todavía, irán siendo añadidos de manera progresiva.<br/>'.
			'<h4>Cambios</h4><ul>'.
				'<li>Añadida versión preliminar para las cazas de ARR</li>'.
				'<li>Las pestañas sin resultados no serán mostradas para ahorrar espacio</li>'.
				'<li>La lista con los resultados ahora muestran el paso que corresponde en el mapa</li>'.
				'<li>Mejoras visuales para móviles y tablets</li>'.
				'<li>Corrección de fallos menores</li>'.
			'</ul><br/>'.
			'<h4>Errores conocidos</h4><ul>'.
				'<li>Las Rutas en la expansión ARR pueden ser incorrectas</li>'.
				'<li>Las diferentes areas dentro de las zonas de la expansión ARR no han sido añadidas todavía</li>'.
				'<li>No todos los enemigos están añadidos todavía</li>'.
			'</ul>'
	;
			
	public static $MSG_NOTE_1 = 'Me retracto de lo que dije, tengo algo de tiempo libre de nuevo y estoy trabajando de fondo en las cazas diarias de la expansión ARR, incluso si este no era el propósito de esta herramienta como dije, tal vez ayude a encontrar los enemigos de una manera más sencilla.';
			
	public static $MSG_HOME_UPDATES_4 = array(
		'Añadida traducción del sitio web a Alemán'
	);
	
	public static $MSG_HOME_UPDATES_3 = array(
			'Mejorado el algoritmo de rutas (20% más rápido)',
			'Añadidas páginas de Inicio y API (API todavía en progreso)',
			'Para mayores resoluciones, la lista para seleccionar los enemigos, se vuelve una tabla con 3 enemigos por fila',
			'Ahora se guarda la última opción seleccionada al buscar (Si tienes habilitadas las Cookies)',
			'Traducciones añadidas a la página, independientes del idioma del juego (Por ahora, solo Inglés y Español)',
			'Añadido botón para donar (Aunque no buscamos hacer beneficio con esta web)',
			'Corrección de fallos menores'
	);
	
	public static $MSG_HOME_UPDATES_2 = array(
			'Gran refactorización del código del sitio web',
			'Se han añadido los Niveles y el número de enemigos a eliminar (El número de enemigos a eliminar no está actualizado para todos todavía)',
			'Mayor precisión en las coordenadas de los aetherytes/enemigos',
			'Cache mejorada',
			'Indicador de Buscando ruta',
			'El algoritmo para la penalización de teletransporte a Aetherytes ha sido mejorado',
			'Mejoras en el diseño para resoluciones más pequeñas',
			'Corrección de fallos menores'
	);
	
	public static $MSG_HOME_UPDATES_1 = array(
			'Actualizado con los enemigos de SB',
			'Grandes Cambios y mejoras en la Interfaz'
	);
	
	/* API */
	public static $MSG_TITLE_API = 'API';
	public static $MSG_WORK_IN_PROGRESS = 'No disponible todavía, trabajo en progreso';
	
	/* Maintenance */
	public static $MSG_MAINTENANCE_TITLE = 'Mantenimiento en progreso';
	public static $MSG_MAINTENANCE_TEXT_1 = 'Lo sentimos, esta pagina web está bajo mantenimiento.';
	public static $MSG_MAINTENANCE_TEXT_2 = 'Nuestro mejor Orfebre está trabajando tan rápido como sólo un Manderville puede. Por favor, inténtanlo de nuevo en unos minutos.';
	
	/* Languages */
	public static $MSG_LANG_ENGLISH = 'Inglés';
	public static $MSG_LANG_FRENCH = 'Francés';
	public static $MSG_LANG_GERMAN = 'Alemán';
	public static $MSG_LANG_JAPANESE = 'Japonés';
	public static $MSG_LANG_SPANISH = 'Español';
	public static $MSG_LANG_SMP_CHINESE = 'Chino (Simplificado)';
		
	/* Footer */
	public static $MSG_FOOTER_DATA = 'Todos los datos han sido añadidos manualmente por colaboradores.';
		
	public static function getLangJs(){
?>
	<script>
		var $MSG_ALL_TRANSPORTS = 'Usar todos los Teletransportes';
		var $MSG_ALL_TRANSPORTS_DESC = 'Usa todos los Aetherytes para obtener la ruta más rápida, más caro';
		var $MSG_NO_TRANSPORTS_ZONE = 'Sin teletransportes en el mismo área';
		var $MSG_NO_TRANSPORTS_ZONE_DESC = 'Evita el uso de teletransportes si ya estás en la misma zona';
		
		var $MSG_SEARCH = 'Búsqueda';
		var $MSG_SEARCH_PLACEHOLDER = 'Busca tu presa...';
		
		var $MSG_SELECTED_MOB = '<b>{0}</b> ha sido seleccionado.';
		var $MSG_ALREADY_SELECTED_MOB = '<b>{0}</b> ya estaba seleccionado.';
		
		var $MSG_NOTHING_HERE = 'Nada por aquí, nada por allá...';
		var $MSG_TRANSPORT_TO = 'Teletranspórtate a <b>{0} ({1})</b>';
		var $MSG_KILL_AT = 'Ve a <b>({0}, {1})</b> y Elimina';
		var $MSG_EFFICIENCY = 'Por razones de eficiencia, <b>sólo están permitidos un máximo de {0} enemigos por zona</b>';

		var $MSG_BADGE_DONE = 'Hecho';
		var $MSG_BADGE_KILL = 'Eliminar';
		var $MSG_BADGE_TELEPORT = 'Teletransporte';
		var $MSG_BADGE_ERROR = 'Error';
		
		var $MSG_PERIOD = ["segundo", "minuto", "hora", "día", "mes", "año"];
		var $MSG_PERIOD_PL = ["segundos", "minutos", "horas", "días", "meses", "años"];
		var $MSG_TIME_AGO = 'Hace {0} {1}'; // Where {0} is the time, and {1} the period, eg. 1 second ago. 3 hours ago.
		
		var $MSG_CALL_ERROR_OCURRED = '<b>Aibá!</b> Ha ocurrido un error al realizar esta acción. Por favor, inténtalo de nuevo más tarde.';
	</script>
<?php
	}
	
	public static function getLang(){
		return 'es';
	}
}