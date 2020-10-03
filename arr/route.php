<?php
	require_once('../core.php');
	
	$data = getDataArr();
	$request = json_decode(file_get_contents('php://input'),true);
	
	if(empty($request)) {
		http_response_code(400);
		return;
	}
	
	header('Content-Type: application/json');
	
	$cachedMatrix = getCachedDistancesArr();
	$cachedPaths = getPrecalculatedPaths('arr');
	$response = getBestRoute('arr', $data, $request, $cachedMatrix, $cachedPaths);
	echo $response;