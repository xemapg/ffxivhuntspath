<?php
	require_once('../core.php');
		
	print_meta();
?>
<html lang="<?php echo WebLang::getLang() ?>" xmlns:og="http://ogp.me/ns#">
<?php 
	print_generic_head();
	print_generic_body('print_api');
?>
</html>