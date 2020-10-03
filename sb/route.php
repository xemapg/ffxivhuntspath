<?php
	require_once('../core.php');
	
	$data = getDataSb();
	$request = json_decode(file_get_contents('php://input'),true);
	
	if(empty($request)) {
		http_response_code(400);
		return;
	}
	
	header('Content-Type: application/json');
	
	$cachedMatrix = getCachedDistancesSb();
	$cachedPaths = getPrecalculatedPaths('sb');
	$response = getBestRoute('sb', $data, $request, $cachedMatrix, $cachedPaths);
	echo $response;