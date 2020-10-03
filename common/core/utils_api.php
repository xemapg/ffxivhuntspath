<?php
# MantisBT - a php based bugtracking system

# MantisBT is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# MantisBT is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with MantisBT.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Compression API
 *
 * This API handles the ob_gzhandler in php.
 *
 * @package CoreAPI
 * @subpackage CompressionAPI
 * @copyright Copyright (C) 2000 - 2002  Kenzaburo Ito - kenito@300baud.org
 * @copyright Copyright (C) 2002 - 2012  MantisBT Team - mantisbt-dev@lists.sourceforge.net
 * @link http://www.mantisbt.org
 */

/**
 * Starts the buffering/compression (only if the compression option is ON)
 * This variable is used internally.  It is not used for configuration
 * @global bool $g_compression_started
 */
$g_compression_started = false;

/**
 * Check if compression handler (ob_gzhandler) should be enabled. Note: this should not be used
 * as an indicator of whether output received by a client will be compressed, only whether an
 * output handler is used to compress output.
 * @return bool
 * @access public
 */
function compress_handler_is_enabled() {
	global $g_compress_html;
	
	//return false;
	compress_enable();
	
	if(!isset($_SERVER["HTTP_ACCEPT_ENCODING"]) || strpos( $_SERVER["HTTP_ACCEPT_ENCODING"], "gzip" ) === false){
		return false;
	}
	
	// indicates compression should be disabled for a page. Note: php.ini may still enable zlib.output_compression.
	// it may be possible to turn this off through the use of ini_set within that specific page.
	if ( defined( 'COMPRESSION_DISABLED' ) ) {
		return false;
	}

	// Dont use config_get here so only dependency is on consant.inc.php in this module
	// We only actively compress html if global configuration compress_html is set.
	if ( isset($g_compress_html) && (ON == $g_compress_html) ) {
		// both compression handlers require zlib module to be loaded
		if( !extension_loaded( 'zlib' ) ) {
			return false;
		}
	
		if ( ini_get( 'zlib.output_compression' ) ) {
			/* zlib output compression is already enabled - we can't load the gzip output handler */
			return false;
		}
		
		// Since php 5.2.10, it's possible to set zlib.output_compression via ini_set.
		// This method is preferred over ob_gzhandler
		if( php_version_at_least( '5.2.10' ) && ini_get( 'output_handler' ) == '' && function_exists( 'ini_set' ) ) {
			ini_set( 'zlib.output_compression', true );
			// do it transparently
			return false;
		}
		
		// if php.ini does not already use ob_gzhandler by default, return true.
		return ( 'ob_gzhandler' != ini_get( 'output_handler' ) );
	}
}

/**
 * Start compression handler if required
 * @return null
 * @access public
 */
function compress_start_handler() {
	if( compress_handler_is_enabled() ) {
		# Before doing anything else, start output buffering so we don't prevent
		#  headers from being sent if there's a blank line in an included file
		ob_start( 'compress_handler' );
	} else if ( ini_get_bool( 'zlib.output_compression' ) == true ) {
		if( defined( 'COMPRESSION_DISABLED' ) ) {
			return;
		}
		ob_start();
	}
}

/**
 * Output Buffering handler that either compresses the buffer or just.
 * returns it, depending on the return value of compress_handler_is_enabled()
 * @param string $p_buffer
 * @param int $p_mode
 * @return string
 * @access public
 */
function compress_handler( & $p_buffer, $p_mode ) {
	global $g_compression_started;
	if( $g_compression_started && compress_handler_is_enabled() ) {
		return ob_gzhandler( $p_buffer, $p_mode );
	} else {
		return $p_buffer;
	}
}

/**
 * Enable output buffering with compression.
 * @return null
 * @access public
 */
function compress_enable() {
	global $g_compression_started;

	$g_compression_started = true;
}

/**
 * Disable output buffering with compression.
 * @return null
 * @access public
 */
function compress_disable() {
	global $g_compression_started;

	$g_compression_started = false;
}

/**
 * Devuelve si la compresion gzip ha comenzado
 * 
 * @return boolean
 */
function compression_has_started() {
	global $g_compression_started;
	
	return $g_compression_started;
}

/**
 * converts a 1 value to X
 * converts a 0 value to a space
 * @param int $p_num boolean numeric
 * @return string X or space
 * @access public
 */
function trans_bool( $p_num ) {
	if( 0 == $p_num ) {
		return '&#160;';
	} else {
		return 'X';
	}
}

/**
 * Add a trailing DIRECTORY_SEPARATOR to a string if it isn't present
 * @param string $p_path
 * @return string
 * @access public
 */
function terminate_directory_path( $p_path ) {
	return rtrim( $p_path, DIRECTORY_SEPARATOR ) . DIRECTORY_SEPARATOR;
}

/**
 * Return true if the parameter is null 
 * or an empty array 
 * or an empty string 
 * or a string containing only whitespace, false otherwise
 * @param string $p_var var to test
 * @return bool
 * @access public
 */
function is_blank( $p_var ) {
	if($p_var === null){
		return true;
	}
	if(is_array($p_var)){
		return count($p_var) == 0;
	} else {
		$trimmed = trim( $p_var);
		return !isset( $trimmed[0] );
	}
}

function is_str_blank( $p_var ) {
	if($p_var === null){
		return true;
	}
	$trimmed = trim($p_var);
	return !isset( $trimmed[0] );
}

/**
 * Get the named php ini variable but return it as a bool
 * @param string $p_name
 * @return bool
 * @access public
 */
function ini_get_bool( $p_name ) {
	$result = ini_get( $p_name );

	if( is_string( $result ) ) {
		switch( strtolower( $result ) ) {
			case 'off':
			case 'false':
			case 'no':
			case 'none':
			case '':
			case '0':
				return false;
				break;
			case 'on':
			case 'true':
			case 'yes':
			case '1':
				return true;
				break;
		}
	} else {
		return (bool) $result;
	}
}

/**
 * Get the named php.ini variable but return it as a number after converting
 * the giga (g/G), mega (m/M) and kilo (k/K) postfixes. These postfixes do not
 * adhere to IEEE 1541 in that k=1024, not k=1000. For more information see
 * http://www.php.net/manual/en/faq.using.php#faq.using.shorthandbytes
 * @param string $p_name Name of the configuration option to read.
 * @return int Integer value of the configuration option.
 * @access public
 */
function ini_get_number( $p_name ) {
	$t_value = ini_get( $p_name );

	$t_result = 0;
	switch( substr( $t_value, -1 ) ) {
		case 'G':
		case 'g':
			$t_result = (int)$t_value * 1073741824;
			break;
		case 'M':
		case 'm':
			$t_result = (int)$t_value * 1048576;
			break;
		case 'K':
		case 'k':
			$t_result = (int)$t_value * 1024;
			break;
		default:
			$t_result = (int)$t_value;
			break;
	}
	return $t_result;
}

function cookie_set($name, $value){
	setcookie($name, $value, time()+60*60*24*365, "/", Config::$domain_cookie);
}

/**
 * Set caching headers that will allow or prevent browser caching.
 * @param boolean Allow caching
 */
function http_caching_headers( $p_allow_caching=false ) {
	global $g_allow_browser_cache;

	// Headers to prevent caching
	// with option to bypass if running from script
	if ( !headers_sent() ) {
		/*if ( $p_allow_caching || ( isset( $g_allow_browser_cache ) && ON == $g_allow_browser_cache ) ) {
			if ( is_browser_internet_explorer() ) {
				header( 'Cache-Control: private, proxy-revalidate' );
			} else {
				header( 'Cache-Control: private, must-revalidate' );
			}
		} else {
			header( 'Cache-Control: no-store, no-cache, must-revalidate' );
		}

		header( 'Expires: ' . gmdate( 'D, d M Y H:i:s \G\M\T', time() ) );
		header( 'Last-Modified: ' . gmdate( 'D, d M Y H:i:s \G\M\T', time() ) );*/
	}
}

/**
 * Set content-type headers.
 */
function http_content_headers() {
	if ( !headers_sent() ) {
		header( 'Content-Type: text/html; charset=utf-8' );
		# For Internet Explorer 8 as per http://blogs.msdn.com/ie/archive/2008/07/02/ie8-security-part-v-comprehensive-protection.aspx
		# Don't let IE second guess our content-type!
		header( 'X-Content-Type-Options: nosniff' );
	}
}

/**
 * Set security headers (frame busting, clickjacking/XSS/CSRF protection).
 */
function http_security_headers() {
	if ( !headers_sent() ) {
		//header( 'X-Frame-Options: DENY' );
		$t_avatar_img_allow = '';
		/*if ( config_get_global( 'show_avatar' ) ) {
			if ( http_is_protocol_https() ) {
				$t_avatar_img_allow = "; img-src 'self' https://secure.gravatar.com:443";
			} else {
				$t_avatar_img_allow = "; img-src 'self' http://www.gravatar.com:80";
			}
		}*/
		//header( "X-Content-Security-Policy: default-src 'self' *.google-analytics.com; frame-ancestors 'none'" );
	}
}

/**
 * Set all headers used by a normal page load.
 */
function http_all_headers() {
	global $g_bypass_headers;

	if ( !$g_bypass_headers && !headers_sent() ) {
		http_content_headers();
		http_caching_headers();
		http_security_headers();
	}
}




function string_format() {
	$args = func_get_args();
	if (count($args) == 0) {
		return;
	}
	if (count($args) == 1) {
		return $args[0];
	}
	$str = array_shift($args);
	$str = preg_replace_callback('/\\{(0|[1-9]\\d*)\\}/', create_function('$match', '$args = '.var_export($args, true).'; return isset($args[$match[1]]) ? $args[$match[1]] : $match[0];'), $str);
	return $str;
}