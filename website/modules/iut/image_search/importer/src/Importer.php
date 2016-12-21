<?php


namespace Drupal\importer;


class Importer {
	
	
	public static function import($dir, $hash_method, $num_bits = 64) {
		
		$bits = sqrt($num_bits);//blockhash and phash takes a number and generate a hash of lenght number^2
		$images = file_scan_directory($dir, '/.*\.jpg/');
		$output = [];
		$dcfs = new \Drupal\dcfs\DCFSearch($hash_method);
		
		foreach ($images as $file) {
			$hash = \Drupal\imagehash\image_hash($file->uri, $bits, $hash_method);
			$query = \Drupal\UserInterface\hex2bin($hash);
			
			$result = \Drupal\UserInterface\load_image_by_hash($hash);
			
			if (!$result) {
				$ext = pathinfo($file->uri, PATHINFO_EXTENSION);
				$permanent_uri = 'public://images/' . $hash . '.' .$ext;
				$moved_path = file_unmanaged_copy($file->uri, $permanent_uri);
					
				if($moved_path) {
			
					$image_id = \Drupal\UserInterface\insert_image($permanent_uri, $hash);
			
					$dcfs->index($query, $image_id);
					$output[$file->uri] = $image_id;
				}
				else {
					$output[$file->uri] = 'Could not copy';
				}
			}
			else {
				$output[$file->uri] = $result;
			}
		}
		return $output;
	}
	
	public static function reindex($hash_method, $num_bits = 64) {

		
		$bits = sqrt($num_bits);//blockhash and phash takes a number and generate a hash of lenght number^2
		$images = file_scan_directory(drupal_realpath('public://images/'), '/.*\.jpg/');
		//$images = \Drupal\UserInterface\load_image();//Load all images
		$output = [];
		$dcfs = new \Drupal\dcfs\DCFSearch('whash');
		
		$dcfs->reindex($hash_method);
		db_query("TRUNCATE " . IMAGES_TABLE);
		
		foreach ($images as $file) {

			$hash = \Drupal\imagehash\image_hash($file->uri, $bits, $hash_method);
			$query = \Drupal\UserInterface\hex2bin($hash);
				
			$result = \Drupal\UserInterface\load_image_by_hash($hash);
			
			if (!$result) {
				$ext = pathinfo($file->uri, PATHINFO_EXTENSION);
				$new_uri = 'public://images/' . $hash . '.' .$ext;
				$moved_path = file_unmanaged_move($file->uri, $new_uri);
						
				if($moved_path) {
						
					$image_id = \Drupal\UserInterface\insert_image($new_uri, $hash);
						
					$dcfs->index($query, $image_id);
					$output[$file->uri] = $image_id;
				}
				else {
					$output[$file->uri] = 'Could not rename';
				}
			}
			else {
				$output[$file->uri] = 'Does not exist';
			}
		}
		return $output;
	}
}