<?php
	require_once('../core.php');
	
	$data = getDataHw();
	$request = json_decode(file_get_contents('php://input'),true);
	
	if(empty($request)) {
		http_response_code(400);
		return;
	}
	
	header('Content-Type: application/json');
	
	$cachedMatrix = getCachedDistancesHw();
	$cachedPaths = getPrecalculatedPaths('hw');
	$response = getBestRoute('hw', $data, $request, $cachedMatrix, $cachedPaths);
	echo $response;