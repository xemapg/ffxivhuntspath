<?php
	require_once('../core.php');
	
	$data = getDataHw();
	$expansion = 'hw';
	
	cookie_set(Config::$cookie_last_expansion, $expansion);
		
	print_meta();
?>
<html lang="<?php echo WebLang::getLang() ?>" ng-app="mobApp" xmlns:og="http://ogp.me/ns#">
<?php 
	print_generic_head();
	print_index_body($expansion, $data['m'], $data['z']);
?>
</html>