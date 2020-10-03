<?php
	require_once('../core.php');
	
	$data = getDataShb();
	$request = json_decode(file_get_contents('php://input'),true);
	
	if(empty($request)) {
		http_response_code(400);
		return;
	}

	header('Content-Type: application/json');
	
	$cachedMatrix = getCachedDistancesShb();
	$cachedPaths = getPrecalculatedPaths('shb');
	$response = getBestRoute('shb', $data, $request, $cachedMatrix, $cachedPaths);
	echo $response;