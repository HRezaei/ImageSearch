<?php


namespace Drupal\imagehash;


class ImageHash {
	
	public static $default_method = 'whash'; 
	
	public static function bhash($uri, $bits = 8) {
		$command = "blockhash -b $bits $uri";
	
		$last_line = exec($command, $output, $return_var);
		$hash = substr($last_line, 0, pow($bits, 2)/4);
		return $hash;
	}
	
	public static function phash($uri, $bits = 8) {
		$module_path = drupal_get_path('module', 'imagehash');
		$path = realpath($module_path . '/scripts/phash.py');
		$command = "python $path $uri $bits";
	
		$hash = exec($command, $output, $return_var);
		return $hash;
	}
	
	public static function whash($uri, $bits = 8) {
		$module_path = drupal_get_path('module', 'imagehash');
		$path = realpath($module_path . '/scripts/whash.py');
		$command = "python $path $uri $bits";
	
		$hash = exec($command, $output, $return_var);
		return $hash;
	}
}