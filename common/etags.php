<?php
class Etag {
	public static $etag_distances_arr = 'distances_arr';
    public static $etag_distances_hw = 'distances_hw';
    public static $etag_distances_sb = 'distances_sb';
    public static $etag_distances_shb = 'distances_shb';
    
    public static $etag_fates_arr = 'fates_arr';
    public static $etag_region_arr = 'region_arr';
    public static $etag_zones_arr = 'zones_arr';
    public static $etag_zones_hw = 'zones_hw';
    public static $etag_zones_sb = 'zones_sb';
    public static $etag_zones_shb = 'zones_shb';
    public static $etag_aetherytes_arr = 'aeth_arr';
    public static $etag_aetherytes_hw = 'aeth_hw';
    public static $etag_aetherytes_sb = 'aeth_sb';
    public static $etag_aetherytes_shb = 'aeth_shb';
    public static $etag_mobs_arr = 'mobs_arr';
    public static $etag_mobs_hw = 'mobs_hw';
    public static $etag_mobs_sb = 'mobs_sb';
    public static $etag_mobs_shb = 'mobs_shb';
	
	public static $etags = array();
	
	static function setEtag($item, $value){
		$etags[$item] = $value;
	}
	static function getEtag($item){
		if(!array_key_exists($item, self::$etags)) return null;
		return self::$etags[$item];
	}
	static function getEtagFromDb($con, $item){
		$etag_result = mysqli_query($con, "SELECT * FROM etags WHERE item = '".$item."'");
		$row = mysqli_fetch_array($etag_result, MYSQLI_ASSOC);
		if($row != null) return $row['etag'];
		else mysqli_query($con, "CALL update_etag('".$item."')");
		return null;
	}
	static function isEtagExpired($con, $item){
		$etag = Etag::getEtagFromDb($con, $item);
		
		if($etag == null || $etag !== Etag::getEtag($item) ){
			Etag::setEtag($item, $etag);
			return true;
		}
		return false;
	}
}