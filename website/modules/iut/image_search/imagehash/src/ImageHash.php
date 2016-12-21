<?php


namespace Drupal\bhash;


class BlockHash {
	
	
	public static function generate($uri, $bits = 8) {
		$command = "blockhash -b $bits $uri";
	
		$last_line = exec($command, $output, $return_var);
		$hash = substr($last_line, 0, pow($bits, 2)/4);
		return $hash;
	}
}