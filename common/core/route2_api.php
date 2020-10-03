<?php
	define("MAX_MOBS_ZONE", 9);
	define("TELEPORT_COST", 2.8);
	
	define("MAX_MOBS_ZONE_OPTION_1", 8);
	define("MAX_MOBS_ZONE_OPTION_2", 12);
	define("MAX_MOBS_ZONE_OPTION_3", 10);
	
	define("ALL_TRANSPORTS_INCLUDED", 1);
	define("NO_TRANSPORTS_ZONE", 2);
	define("NO_TRANSPORTS", 3);
	
	function getBestRoute($exp, $data, $request, &$distances, &$precalculatedPaths = array()){
		$cache = phpFastCache(Config::$cache_mode);
		
		$zones = $data['z'];
		$aetherytes = $data['a'];
		$mobs = $data['m'];	
		
		$option = ALL_TRANSPORTS_INCLUDED;
		$max_mobs = MAX_MOBS_ZONE_OPTION_1;
				
		if($request['o'] && is_int($request['o'])){
			$opt = intval($request['o']);
			if($opt >= 1 || $opt <= 2){
				$option = $opt;
				cookie_set(Config::$cookie_last_option, $option);
			}
		}
		
		if($option === ALL_TRANSPORTS_INCLUDED) $max_mobs = MAX_MOBS_ZONE_OPTION_1;
		else if($option === NO_TRANSPORTS_ZONE) $max_mobs = MAX_MOBS_ZONE_OPTION_2;
		else if($option === NO_TRANSPORTS) $max_mobs = MAX_MOBS_ZONE_OPTION_3;
				
		$mobsReq = array();
		foreach($mobs as $m){
			if(in_array($m['id'], $request['m'])){
				$mobsReq[] = $m;
			}
		}

		$results = array();
		foreach($zones as $z){
			$idZone = $z['id'];
			
			$results[$idZone] = array(
				'id' => $z['id'],
				'id_region' => $z['id_region'],
				'size_x' => $z['size_x'],
				'size_y' => $z['size_y'],
				'has_path' => false,
				'path' => array()
			);
			
			$resultZone = &$results[$idZone];
			
			$distancesZone = &$distances[$idZone];
			
			$mobsZone = array();
			foreach($mobsReq as $m){
				if($m['id_zone'] == $idZone){
					$mobsZone[] = $m;
				}
			}
			
			$aethZone = $z['aetherytes'];
			/*foreach($aetherytes as $a){
				if($a['id_zone'] == $idZone){
					$aethZone[] = $a;
				}
			}*/
			
			$sliced = 0;
			if(count($mobsZone) > $max_mobs){
				$mobsZone = array_slice($mobsZone, 0, $max_mobs, true);
				$sliced = 1;
			}
			
			if(count($mobsZone) == 0){
				$resultZone['has_path'] = false;
				$resultZone['path'][] = nothingToDo();
			} else {
				if($sliced){
					$resultZone['path'][] = maxMobs($max_mobs) ;
				}
				if(count($aethZone) == 1){
					// only one aetheryte, simple path
					if(count($mobsZone) == 1){
						$resultZone['has_path'] = true;
						$resultZone['path'][] = teleportTo($aethZone[0], $z);
						$resultZone['path'][] = killMob($mobsZone[0]);
					} else {
						// Look for best route
						$search = 'o'.$option.'p'.implode(',', array_map("getIdMob", $mobsZone));
						$bestPath = $precalculatedPaths[$search] ?? null;
						if($bestPath == null){
							$bestPath = bestDistance($distancesZone, $mobsZone, $aethZone, $option);
							addPrecalculatedPath($exp, $search, $bestPath);
						}
						$resultZone['has_path'] = true;
						$resultZone['path'] = array_merge($resultZone['path'], translateBestPath($bestPath, $z, $mobsZone, $aethZone));
					}
				} else {
					// more than one aetheryte, complex path, look for best route
					if(count($mobsZone) == 1){
						$min = null;
						$aBest = null;
						foreach($aethZone as $a){
							$dAux = getValue($distancesZone, 'a'.$a['id'],'m'.$mobsZone[0]['id']) + floatval($a['cost']);
							if($min == null || $dAux < $min){
								$min = $dAux;
								$aBest = $a;
							}						
						}
						$resultZone['has_path'] = true;
						$resultZone['path'][] = teleportTo($aBest, $z);
						$resultZone['path'][] = killMob($mobsZone[0]);
					} else {
						// Look for best route
						$search = 'o'.$option.'p'.implode(',', array_map("getIdMob", $mobsZone));
						$bestPath = $precalculatedPaths[$search] ?? null;
						if($bestPath == null){
							$bestPath = bestDistance($distancesZone, $mobsZone, $aethZone, $option);
							addPrecalculatedPath($exp, $search, $bestPath);
						}
						$resultZone['has_path'] = true;
						$resultZone['path'] = array_merge($resultZone['path'], translateBestPath($bestPath, $z, $mobsZone, $aethZone));
					}
				}
			}
		}
		return json_encode($results);
	}

	function nothingToDo(){
		$res = array(
				'id_type' => 1,
				'type' => 'done'
		);
		return $res;
	}
	
	function teleportTo($aeth, $zone){
		$res = array(
			'id_type' => 2,
			'type' => 'teleport',
			'to' => array(
				'aeth_name' => $aeth['name_'.GameLang::getLangDb()],
				'zone_name' => $zone['name_'.GameLang::getLangDb()],
				'x' => $aeth['x'],
				'y' => $aeth['y']
			)
		);
		return $res;
	}
	
	function killMob($mob){
		$fate = null;
		$mob_fate = $mob['fate'];
		if(!empty($mob_fate)){
			$fate['name'] = $mob_fate['name_'.GameLang::getLangDb()];
		}
		$res = array(
			'id_type' => 3,
			'type' => 'kill',
			'at' => array(
				'x' => $mob['x'],
				'y' => $mob['y'],
				'name' => $mob['name_'.GameLang::getLangDb()],
				'slay' => $mob['slain'],
				'lvl' => $mob['lvl'],
				'is_fate' => (!empty($mob['fate']) ? 1 : 0),
				'fate' => (!empty($mob['fate']) ? $mob['fate']['name_'.GameLang::getLangDb()] : '')
			)
		);
		return $res;
	}
	
	function maxMobs($max_mobs){
		$res = array(
			'id_type' => 10,
			'type' => 'exceeded',
			'max' => $max_mobs
		);
		return $res;
	}
	
	function translateBestPath($bestPath, $zone, $mobsZone, $aethZone){
		$res = array();
		foreach($bestPath as $step){
			if($step[0] === 'm'){
				// Kill mob
				$idMob = intval(ltrim ($step, 'm'));
				foreach($mobsZone as $m){
					if($m['id'] == $idMob){
						$res[] = killMob($m);
						break;
					}					
				}
			} else if($step[0] === 'a'){
				$idAeth = intval(ltrim ($step, 'a'));
				foreach($aethZone as $a){
					if($a['id'] == $idAeth){
						$res[] = teleportTo($a, $zone);
						break;
					}					
				}
			}
		}
		return $res;
	}
	
	function bestDistance(&$mapDistances, $mobsZone, $aethZone, $option){
		$bestPath = Array();
		$bestDistance = 99999.0;
		
		foreach($aethZone as $a1){
			// First place to go
			$addedTeleportCost = $a1['cost'];
			bestDistanceRec($mapDistances, $aethZone, $mobsZone, $bestDistance, $addedTeleportCost, $bestPath, 'a'.$a1['id'], array ('a'.$a1['id']), $option);
		}
		return $bestPath; 
	}
	
	function bestDistanceRec(&$mapDistances, &$aethZone, $mobsLeft, &$bestDistance, $distance, &$bestPath, $previousStep, $pathFollowed, &$option){
		if(empty($mobsLeft)){
			if($distance < $bestDistance){
				$bestPath = $pathFollowed; // create a copy of the array
				$bestDistance = $distance;
				//echo "best path found: ".$bestDistance."\n";
			}
		} else {
			if($distance < $bestDistance){
				// Continue
				foreach($mobsLeft as $key => $m){
					$mob = 'm'.$m['id'];
					$newPathFollowed = $pathFollowed; // create a copy of the array
					$newPathFollowed[] = $mob;
					
					$d = $distance + getValue($mapDistances, $previousStep, $mob);
					
					$newMobsLeft = $mobsLeft; // create a copy of the array
					unset($newMobsLeft[$key]);
					
					bestDistanceRec($mapDistances, $aethZone, $newMobsLeft, $bestDistance, $d, $bestPath, $mob, $newPathFollowed, $option);
				}
				if($option === ALL_TRANSPORTS_INCLUDED){
					if($previousStep[0] === 'm'){
						foreach($aethZone as $aKey => $a){
							$aeth = 'a'.$a['id'];
							// If last step was a mob, consider transport to a aetheryte, distance would remain unchanged
							//$pathFollowedArrayObject = new ArrayObject($pathFollowed);
							$newPathFollowed = $pathFollowed; // create a copy of the array
							$newPathFollowed[] = $aeth;
														
							bestDistanceRec($mapDistances, $aethZone, $mobsLeft, $bestDistance, $distance+TELEPORT_COST+floatval($a['cost']), $bestPath, $aeth, $newPathFollowed, $option);
						}
					}
				}
			}		
		}
	}
	
	function getIdMob($m){
		return $m['id'];
	}
?>