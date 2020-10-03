<?php
	function initCaches(){
		getDataArr();
		getDataHw();
		getDataSb();
		getDataShb();
		getCachedDistancesArr();
		getCachedDistancesHw();
		getCachedDistancesSb();
		getCachedDistancesShb();
	}
	
	function getPrecalculatedPaths($exp){
		$cache = phpFastCache(Config::$cache_mode);
		$con = Config::getDbConnection();
		
		if($exp === 'arr'){
			if($cache->get(Etag::$etag_distances_arr) == null || Etag::isEtagExpired($con, Etag::$etag_distances_arr)){
				$cache->set(Config::$precalculated_paths_arr, array());
			} else {
				return $cache->get(Config::$precalculated_paths_sb);
			}
		} else if($exp === 'hw'){
			if($cache->get(Etag::$etag_distances_hw) == null || Etag::isEtagExpired($con, Etag::$etag_distances_hw)){
				$cache->set(Config::$precalculated_paths_hw, array());
			} else {
				return $cache->get(Config::$precalculated_paths_hw);
			}
		} else if($exp === 'sb'){
			if($cache->get(Etag::$etag_distances_sb) == null || Etag::isEtagExpired($con, Etag::$etag_distances_sb)){
				$cache->set(Config::$precalculated_paths_sb, array());
			} else {
				return $cache->get(Config::$precalculated_paths_sb);
			}
		}
	}
	
	function addPrecalculatedPath($exp, $search, $bestPath){
		$cache = phpFastCache(Config::$cache_mode);
		if($exp === 'arr'){
			$arr = $cache->get(Etag::$etag_distances_arr) ?? array();
			$arr[$search] = $bestPath;
			$cache->set(Config::$precalculated_paths_arr, $arr);
		} else if($exp === 'hw'){
			$arr = $cache->get(Etag::$etag_distances_hw) ?? array();
			$arr[$search] = $bestPath;
			$cache->set(Config::$precalculated_paths_hw, $arr);
		} else if($exp === 'sb'){
			$arr = $cache->get(Etag::$etag_distances_sb) ?? array();
			$arr[$search] = $bestPath;
			$cache->set(Config::$precalculated_paths_sb, $arr);
		}
	}
	
	function getDataArr(){
		$cache = phpFastCache(Config::$cache_mode);
		$con = Config::getDbConnection();
		
		$data = array();
		
		$fates = array();
		$regions = array();
		$zones = array();
		$aetherytes = array();
		$mobs = array();
		
		$fates_changed = false;
		$mobs_changed = false;
		$aetherytes_changed = false;
		$zones_changed = false;
		
		if($cache->get(Etag::$etag_fates_arr) == null || Etag::isEtagExpired($con, Etag::$etag_fates_arr)){
			$fates_result = mysqli_query($con, "SELECT * FROM fates_arr ORDER BY id ASC");
			$fates = process_fates($fates_result);
			$fates_changed = true;
			
			$cache->set(Etag::$etag_fates_arr, $fates);
		} else {
			$aetherytes = $cache->get(Etag::$etag_fates_arr);
		}
		
		if($cache->get(Etag::$etag_aetherytes_arr) == null || Etag::isEtagExpired($con, Etag::$etag_aetherytes_arr)){
			$aetherytes_result = mysqli_query($con, "SELECT * FROM aetherytes_arr ORDER BY id_zone ASC");
			$aetherytes = process_aetherytes($aetherytes_result);
			$aetherytes_changed = true;
			
			$cache->set(Etag::$etag_aetherytes_arr, $aetherytes);
		} else {
			$aetherytes = $cache->get(Etag::$etag_aetherytes_arr);
		}
		
		if($fates_changed || $cache->get(Etag::$etag_mobs_arr) == null || Etag::isEtagExpired($con, Etag::$etag_mobs_arr)){
			$mobs_result = mysqli_query($con, "SELECT * FROM mobs_arr WHERE is_visible > 0 ORDER BY id_zone, name ASC");
			$mobs = process_mobs($mobs_result, $fates);
			$mobs_changed = true;
			
			$cache->set(Etag::$etag_mobs_arr, $mobs);
		} else {
			$mobs = $cache->get(Etag::$etag_mobs_arr);
		}
		
		if($mobs_changed || $aetherytes_changed || $cache->get(Etag::$etag_zones_arr) == null || Etag::isEtagExpired($con, Etag::$etag_zones_arr)){
			$zones_result = mysqli_query($con, "SELECT * FROM zones_arr ORDER BY id ASC");
			$zones = process_zones($zones_result, $aetherytes, $mobs);
			$zones_changed = true;
			
			$cache->set(Etag::$etag_zones_arr, $zones);
		} else {
			$zones = $cache->get(Etag::$etag_zones_arr);
		}
		
		if($zones_changed || $cache->get(Etag::$etag_region_arr) == null || Etag::isEtagExpired($con, Etag::$etag_region_arr)){
			$regions_result = mysqli_query($con, "SELECT * FROM region_arr ORDER BY id ASC");
			$regions = process_regions($regions_result, $zones);
			
			$cache->set(Etag::$etag_region_arr, $regions);
		} else {
			$regions = $cache->get(Etag::$etag_region_arr);
		}
		
		$data['r'] = $regions;
		$data['z'] = $zones;
		$data['a'] = $aetherytes;
		$data['m'] = $mobs;
		return $data;
	}
	
	function getCachedDistancesArr(){
		$cache = phpFastCache(Config::$cache_mode);
		$con = Config::getDbConnection();
		
		$matrix = array();
		if($cache->get(Etag::$etag_distances_arr) == null || Etag::isEtagExpired($con, Etag::$etag_distances_arr)){
			// Reload Distances, info has changed
			$data = getDataArr();
			
			$mobs = $data['m'];
			$zones = $data['z'];
			$aetherytes = $data['a'];
			
			foreach($zones as $z){
				$matrix[$z['id']] = array();

				// Mobs of Zone i in $mobsZone;
				foreach($z['mobs'] as $my){
					foreach($z['aetherytes'] as $ax){
						setValue($matrix[$z['id']], 'a'.$ax['id'], 'm'.$my['id'], distance2d($ax['x'], $ax['y'], $my['x'], $my['y']));
					}
					foreach($z['mobs'] as $mx){
						if($mx['id'] != $my['id']){
							setValue($matrix[$z['id']], 'm'.$mx['id'], 'm'.$my['id'], distance2d($mx['x'], $mx['y'], $my['x'], $my['y']));
						}
					}
				}
			}
			
			$cache->set(Etag::$etag_distances_arr, $matrix);
		} else {
			$matrix = $cache->get(Etag::$etag_distances_arr);
		}
		
		return $matrix;
	}
	
	function getDataHw(){
		$cache = phpFastCache(Config::$cache_mode);
		$con = Config::getDbConnection();
	
		$data = array();
	
		$zones = array();
		$aetherytes = array();
		$mobs = array();
		
		$mobs_changed = false;
		$aetherytes_changed = false;
		
		if($cache->get(Etag::$etag_mobs_hw) == null || Etag::isEtagExpired($con, Etag::$etag_mobs_hw)){
			$mobs_result = mysqli_query($con, "SELECT * FROM mobs_hw WHERE id ORDER BY id_zone, name ASC");
			$mobs = process_mobs($mobs_result);
			$mobs_changed = true;
			
			$cache->set(Etag::$etag_mobs_hw, $mobs);
		} else {
			$mobs = $cache->get(Etag::$etag_mobs_hw);
		}
		
		if($cache->get(Etag::$etag_aetherytes_hw) == null || Etag::isEtagExpired($con, Etag::$etag_aetherytes_hw)){
			$aetherytes_result = mysqli_query($con, "SELECT * FROM aetherytes_hw ORDER BY id_zone ASC");
			$aetherytes = process_aetherytes($aetherytes_result);
			$aetherytes_changed= true;
			
			$cache->set(Etag::$etag_aetherytes_hw, $aetherytes);
		} else {
			$aetherytes = $cache->get(Etag::$etag_aetherytes_hw);
		}
		
		if($mobs_changed || $aetherytes_changed || $cache->get(Etag::$etag_zones_hw) == null || Etag::isEtagExpired($con, Etag::$etag_zones_hw)){
			$zones_result = mysqli_query($con, "SELECT * FROM zones_hw ORDER BY id ASC");
			$zones = process_zones($zones_result, $aetherytes, $mobs);
			
			$cache->set(Etag::$etag_zones_hw, $zones);
		} else {
			$zones = $cache->get(Etag::$etag_zones_hw);
		}
		
		$data['z'] = $zones;
		$data['a'] = $aetherytes;
		$data['m'] = $mobs;
		return $data;
	}

	function getCachedDistancesHw(){
		$cache = phpFastCache(Config::$cache_mode);
		$con = Config::getDbConnection();
		
		$matrix = array();
		if($cache->get(Etag::$etag_distances_hw) == null || Etag::isEtagExpired($con, Etag::$etag_distances_hw)){
			// Reload Distances, info has changed
			$data = getDataHw();
			
			$mobs = $data['m'];
			$zones = $data['z'];
			$aetherytes = $data['a'];
						
			foreach($zones as $z){
				$matrix[$z['id']] = array();

				// Mobs of Zone i in $mobsZone;
				foreach($z['mobs'] as $my){
					foreach($z['aetherytes'] as $ax){
						setValue($matrix[$z['id']], 'a'.$ax['id'], 'm'.$my['id'], distance2d($ax['x'], $ax['y'], $my['x'], $my['y']));
					}
					foreach($z['mobs'] as $mx){
						if($mx['id'] != $my['id']){
							setValue($matrix[$z['id']], 'm'.$mx['id'], 'm'.$my['id'], distance2d($mx['x'], $mx['y'], $my['x'], $my['y']));
						}
					}
				}
			}
			
			$cache->set(Etag::$etag_distances_hw, $matrix);
		} else {
			$matrix = $cache->get(Etag::$etag_distances_hw);
		}
	
		return $matrix;
	}

	function getDataSb(){
		$cache = phpFastCache(Config::$cache_mode);
		$con = Config::getDbConnection();
	
		$data = array();
	
		$zones = array();
		$aetherytes = array();
		$mobs = array();
				
		$mobs_changed = false;
		$aetherytes_changed = false;
				
		if($cache->get(Etag::$etag_mobs_sb) == null || Etag::isEtagExpired($con, Etag::$etag_mobs_sb)){
			$mobs_result = mysqli_query($con, "SELECT * FROM mobs_sb WHERE id ORDER BY id_zone, name ASC");
			$mobs = process_mobs($mobs_result);
			$mobs_changed = true;
			
			$cache->set(Etag::$etag_mobs_sb, $mobs);
		} else {
			$mobs = $cache->get(Etag::$etag_mobs_sb);
		}
		
		if($cache->get(Etag::$etag_aetherytes_sb) == null || Etag::isEtagExpired($con, Etag::$etag_aetherytes_sb)){
			$aetherytes_result = mysqli_query($con, "SELECT * FROM aetherytes_sb ORDER BY id_zone ASC");
			$aetherytes = process_aetherytes($aetherytes_result);
			$aetherytes_changed = true;
			
			$cache->set(Etag::$etag_aetherytes_sb, $aetherytes);
		} else {
			$aetherytes = $cache->get(Etag::$etag_aetherytes_sb);
		}		
		
		if($mobs_changed || $aetherytes_changed || $cache->get(Etag::$etag_zones_sb) == null || Etag::isEtagExpired($con, Etag::$etag_zones_sb)){
			$zones_result = mysqli_query($con, "SELECT * FROM zones_sb ORDER BY id ASC");
			$zones = process_zones($zones_result, $aetherytes, $mobs);
			
			$cache->set(Etag::$etag_zones_sb, $zones);
		} else {
			$zones = $cache->get(Etag::$etag_zones_sb);
		}
		
		$data['z'] = $zones;
		$data['a'] = $aetherytes;
		$data['m'] = $mobs;
		return $data;
	}
	
	function getCachedDistancesSb(){
		$cache = phpFastCache(Config::$cache_mode);
		$con = Config::getDbConnection();
		
		$matrix = array();
		if($cache->get(Etag::$etag_distances_sb) == null || Etag::isEtagExpired($con, Etag::$etag_distances_sb)){
			// Reload Distances, info has changed
			$data = getDataSb();
			
			$zones = $data['z'];
			$aetherytes = $data['a'];
			$mobs = $data['m'];
						
			foreach($zones as $z){
				$matrix[$z['id']] = array();

				// Mobs of Zone i in $mobsZone;
				foreach($z['mobs'] as $my){
					foreach($z['aetherytes'] as $ax){
						setValue($matrix[$z['id']], 'a'.$ax['id'], 'm'.$my['id'], distance2d($ax['x'], $ax['y'], $my['x'], $my['y']));
					}
					foreach($z['mobs'] as $mx){
						if($mx['id'] != $my['id']){
							setValue($matrix[$z['id']], 'm'.$mx['id'], 'm'.$my['id'], distance2d($mx['x'], $mx['y'], $my['x'], $my['y']));
						}
					}
				}
			}			
			
			$cache->set(Etag::$etag_distances_sb, $matrix);
		} else {
			$matrix = $cache->get(Etag::$etag_distances_sb);
		}
	
		return $matrix;
	}

	function getDataShb(){
		$cache = phpFastCache(Config::$cache_mode);
		$con = Config::getDbConnection();
	
		$data = array();
	
		$zones = array();
		$aetherytes = array();
		$mobs = array();
				
		$mobs_changed = false;
		$aetherytes_changed = false;
				
		if($cache->get(Etag::$etag_mobs_shb) == null || Etag::isEtagExpired($con, Etag::$etag_mobs_shb)){
			$mobs_result = mysqli_query($con, "SELECT * FROM mobs_shb WHERE id ORDER BY id_zone, name ASC");
			$mobs = process_mobs($mobs_result);
			$mobs_changed = true;
			
			$cache->set(Etag::$etag_mobs_shb, $mobs);
		} else {
			$mobs = $cache->get(Etag::$etag_mobs_shb);
		}
		
		if($cache->get(Etag::$etag_aetherytes_shb) == null || Etag::isEtagExpired($con, Etag::$etag_aetherytes_shb)){
			$aetherytes_result = mysqli_query($con, "SELECT * FROM aetherytes_shb ORDER BY id_zone ASC");
			$aetherytes = process_aetherytes($aetherytes_result);
			$aetherytes_changed = true;
			
			$cache->set(Etag::$etag_aetherytes_shb, $aetherytes);
		} else {
			$aetherytes = $cache->get(Etag::$etag_aetherytes_shb);
		}		
		
		if($mobs_changed || $aetherytes_changed || $cache->get(Etag::$etag_zones_shb) == null || Etag::isEtagExpired($con, Etag::$etag_zones_shb)){
			$zones_result = mysqli_query($con, "SELECT * FROM zones_shb ORDER BY id ASC");
			$zones = process_zones($zones_result, $aetherytes, $mobs);
			
			$cache->set(Etag::$etag_zones_shb, $zones);
		} else {
			$zones = $cache->get(Etag::$etag_zones_shb);
		}
		
		$data['z'] = $zones;
		$data['a'] = $aetherytes;
		$data['m'] = $mobs;
		return $data;
	}
	
	function getCachedDistancesShb(){
		$cache = phpFastCache(Config::$cache_mode);
		$con = Config::getDbConnection();
		
		$matrix = array();
		if($cache->get(Etag::$etag_distances_shb) == null || Etag::isEtagExpired($con, Etag::$etag_distances_shb)){
			// Reload Distances, info has changed
			$data = getDataShb();
			
			$zones = $data['z'];
			$aetherytes = $data['a'];
			$mobs = $data['m'];
						
			foreach($zones as $z){
				$matrix[$z['id']] = array();
						
				// Mobs of Zone i in $mobsZone;
				foreach($z['mobs'] as $my){
					foreach($z['aetherytes'] as $ax){
						setValue($matrix[$z['id']], 'a'.$ax['id'], 'm'.$my['id'], distance2d($ax['x'], $ax['y'], $my['x'], $my['y']));
					}
					foreach($z['mobs'] as $mx){
						if($mx['id'] != $my['id']){
							setValue($matrix[$z['id']], 'm'.$mx['id'], 'm'.$my['id'], distance2d($mx['x'], $mx['y'], $my['x'], $my['y']));
						}
					}
				}
			}			
			
			$cache->set(Etag::$etag_distances_shb, $matrix);
		} else {
			$matrix = $cache->get(Etag::$etag_distances_shb);
		}
	
		return $matrix;
	}
	
	function process_fates($result){
		$fates = array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
			$fate['id'] = intval($row['id']);
			$fate['xivdb_id'] = intval(empty_or($row['xivdb_id'], -1));
			$fate['name'] = $row['name'];
			$fate['name_en'] = empty_or($row['name_en'], $row['name']);
			$fate['name_de'] = empty_or($row['name_de'], $row['name']);
			$fate['name_fr'] = empty_or($row['name_fr'], $row['name']);
			$fate['name_jp'] = empty_or($row['name_jp'], $row['name']);
			$fate['name_ch'] = empty_or($row['name_ch'], $row['name']);
			$fates[$fate['id']] = $fate;
		}
		return $fates;
	}
	
	function process_regions($result, $zones = null){
		$regions = array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
			$region['id'] = intval($row['id']);
			$region['xivdb_id'] = intval(empty_or($row['xivdb_id'], -1));
			$region['name'] = $row['name'];
			$region['name_en'] = empty_or($row['name_en'], $row['name']);
			$region['name_de'] = empty_or($row['name_de'], $row['name']);
			$region['name_fr'] = empty_or($row['name_fr'], $row['name']);
			$region['name_jp'] = empty_or($row['name_jp'], $row['name']);
			$region['name_ch'] = empty_or($row['name_ch'], $row['name']);
			$region['zones'] = array();
			if(!empty($zones)){
				foreach($zones as $z){
					if($z['id_region'] === $region['id']){
						$region['zones'][] = $z;
					}
				}
			}
			$regions[$region['id']] = $region;
		}
		return $regions;
	}
	
	function process_zones($result, $aetherytes = null, $mobs = null){
		$zones = array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
			$zone['id'] = intval($row['id']);
			$zone['xivdb_id'] = intval(empty_or($row['xivdb_id'], -1));
			$zone['name'] = $row['name'];
			$zone['name_en'] = empty_or($row['name_en'], $row['name']);
			$zone['name_de'] = empty_or($row['name_de'], $row['name']);
			$zone['name_fr'] = empty_or($row['name_fr'], $row['name']);
			$zone['name_jp'] = empty_or($row['name_jp'], $row['name']);
			$zone['name_ch'] = empty_or($row['name_ch'], $row['name']);
			$zone['size_x'] = float_or_null($row['size_x']);
			$zone['size_y'] = float_or_null($row['size_y']);
			$zone['id_region'] = intval($row['id_region'] ?? null);
			$zone['aetherytes'] = array();
			$zone['mobs'] = array();
			if(!empty($aetherytes)){
				foreach($aetherytes as $a){
					if($a['id_zone'] === $zone['id']){
						$zone['aetherytes'][] = $a;
					}
				}
			}
			if(!empty($mobs)){
				foreach($mobs as $m){
					if($m['id_zone'] === $zone['id']){
						$zone['mobs'][] = $m;
					}
				}
			}
			$zones[$zone['id']] = $zone;
		}
		return $zones;
	}
	
	function process_aetherytes($result){
		$aetherytes = array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
			$aetheryte['id'] = intval($row['id']);
			$aetheryte['xivdb_id'] = intval(empty_or($row['xivdb_id'], -1));
			$aetheryte['name'] = $row['name'];
			$aetheryte['name_en'] = empty_or($row['name_en'], $row['name']);
			$aetheryte['name_de'] = empty_or($row['name_de'], $row['name']);
			$aetheryte['name_fr'] = empty_or($row['name_fr'], $row['name']);
			$aetheryte['name_jp'] = empty_or($row['name_jp'], $row['name']);
			$aetheryte['name_ch'] = empty_or($row['name_ch'], $row['name']);
			$aetheryte['id_zone'] = intval($row['id_zone']);
			$aetheryte['x'] = float_or_null($row['x']);
			$aetheryte['y'] = float_or_null($row['y']);
			$aetheryte['cost'] = float_or_zero($row['cost']);
			$aetherytes[$aetheryte['id']] = $aetheryte;
		}
		return $aetherytes;
	}
	
	function process_mobs($result, $fates = null){
		$mobs = array();
		while ($row = mysqli_fetch_array($result, MYSQLI_ASSOC)) {
			$mob['id'] = intval($row['id']);
			$mob['xivdb_id'] = intval(empty_or($row['xivdb_id'], -1));
			$mob['name'] = $row['name'];
			$mob['name_en'] = empty_or($row['name_en'], $row['name']);
			$mob['name_de'] = empty_or($row['name_de'], $row['name']);
			$mob['name_fr'] = empty_or($row['name_fr'], $row['name']);
			$mob['name_jp'] = empty_or($row['name_jp'], $row['name']);
			$mob['name_ch'] = empty_or($row['name_ch'], $row['name']);
			$mob['id_zone'] = intval($row['id_zone']);
			$mob['x'] = float_or_null($row['x']);
			$mob['y'] = float_or_null($row['y']);
			$mob['lvl'] = int_or_null($row['lvl']);
			$mob['slain'] = int_or_null($row['slain']);
			$mob['is_fate'] = intval($row['is_fate'] ?? 0);
			$mob['id_fate'] = intval($row['id_fate'] ?? 0);
			$mob['is_visible'] = intval($row['is_visible'] ?? 1);
			$mob['is_multiple'] = intval($row['is_multiple'] ?? 0);
			$mob['fate'] = null;
			if($mob['id_fate'] > 0){
				$mob['fate'] = $fates[$mob['id_fate']];
			}
			if($mob['is_visible']){
				$mobs[$mob['id']] = $mob;
			}
		}
		return $mobs;
	}
	
	
	// Distance from (x1,y1) to (x2,y2)
	function distance2d($x1, $y1, $x2, $y2){
		return sqrt(($x1-$x2)**2 + ($y1-$y2)**2);
	}
	function distance3d($x1, $y1, $z1, $x2, $y2, $z2){
		return sqrt(($x1-$x2)**2 + ($y1-$y2)**2 + ($z1-$z2)**2);
	}
	
	function getValue(&$map, $x, $y) {
		return $map[$x.':::'.$y] ?? 9999;
	}

	function setValue(&$map, $x, $y, $value) {
		$map[$x.':::'.$y] = $value;
		$map[$y.':::'.$x] = $value;
	}
	
	
	function empty_or($value, $or){
		if(empty($value)) return $or;
		return $value;
	}
	function int_or_null($value) {
		if(empty($value)) return null;
		return intval($value);
	}
	function float_or_zero($value) : float{
		if(empty($value)) return 0.0;
		return floatval($value);
	}
	function float_or_null($value) {
		if(empty($value)) return null;
		return floatval($value);
	}