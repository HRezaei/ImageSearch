<?php


namespace Drupal\importer;


class Importer {
	
	
	public static function import($dir, $num_bits = 64) {
		
		$bits = sqrt($num_bits);//blockhash takes a number and generate a hash of lenght number^2
		$images = file_scan_directory($dir, '/.*\.jpg/');
		$output = [];
		foreach ($images as $file) {
			$hash = $hash = \Drupal\bhash\BlockHash::generate($file->uri, $bits);
			$query = \Drupal\UserInterface\hex2bin($hash);
			
			$result = \Drupal\UserInterface\load_image_by_hash($hash);
			
			$dcfs = new \Drupal\dcfs\DCFSearch();
			if (!$result) {
				$ext = pathinfo($file->uri, PATHINFO_EXTENSION);
				$permanent_uri = 'public://images/' . $hash . '.' .$ext;
				$moved_path = file_unmanaged_copy($file->uri, $permanent_uri);
					
				if($moved_path) {
			
					$image_id = \Drupal\UserInterface\insert_image($permanent_uri, $hash);
			
					$dcfs->index($query, $image_id);
				}
			}
			else {
				$output[$uri] = $result;
			}
		}
	}
}