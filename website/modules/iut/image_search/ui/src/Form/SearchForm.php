<?php

/**
 * @file
 * Contains \Drupal\UserInterface\Form\SearchForm.
 */

namespace Drupal\UserInterface\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\File\Entity;
use Drupal\bhash;

/**
 * Implements an example form.
 */
class SearchForm extends FormBase {

	/**
	 * {@inheritdoc}
	 */
	public function getFormId() {
		return 'search_form';
	}

	/**
	 * {@inheritdoc}
	 */
	public function buildForm(array $form, FormStateInterface $form_state) {
		$form['sample_image'] = array(
				'#type' => 'file',
				'#title' => $this->t('Upload your image'),
				'#multiple' => FALSE,
				'#description' => $this->t("Your image will be indexed in our development phase")
		);
		$form['actions']['#type'] = 'actions';
		$form['actions']['submit'] = array(
				'#type' => 'submit',
				'#value' => $this->t('Search'),
				'#button_type' => 'primary',
		);
		
		if($form_state->isRebuilding()) {
			
			$form['debug_info'] = [
				'#type' => 'markup',
				'#markup' => $form_state->getValue('duration') .'<br/>'
			];
			
			$images = $form_state->getStorage();
			
			foreach ($images as $image) {
				$form['results'][] = [
					'#theme' => 'image_style',
					//'#width' => $variables['width'],
					//'#height' => $variables['height'],
					'#style_name' => 'medium',
					'#uri' => $image->uri,
				]; 
			}
		}
		
		return $form;
	}

	/**
	 * {@inheritdoc}
	 */
	public function validateForm(array &$form, FormStateInterface $form_state) {
		$file = file_save_upload('sample_image', [], 'temporary://iut_upload/');		
		//$file = $form_state->getValue('sample_image');
		if (!$file) {
			$form_state->setErrorByName('sample_image', $this->t('Could not upload image. Please try again.'));
			return ;
		}
		$file = $file[0];
		$uri = $file->getFileUri();
		$path = drupal_realpath($uri);
		
		$hash = \Drupal\bhash\BlockHash::generate($path, 8);
		
		$form_state->setValue('image_hash', $hash);
		$form_state->setValue('image_path', $path);
		
	}

	/**
	 * {@inheritdoc}
	 */
	public function submitForm(array &$form, FormStateInterface $form_state) {
		
		$hash = $form_state->getValue('image_hash');
		$uri = $form_state->getValue('image_path');
		
		$query = \Drupal\UserInterface\hex2bin($hash);
		
		$result = \Drupal\UserInterface\load_image_by_hash($hash);
		
		$dcfs = new \Drupal\dcfs\DCFSearch();
		
		if (!$result) {
			
			//@todo move file to a permanent directory
// 			$file = new ([]);
// 			$file->setFileUri($uri);
			$ext = pathinfo($uri, PATHINFO_EXTENSION);
			$permanent_uri = 'public://images/' . $hash . '.' .$ext;
			$moved_path = file_unmanaged_move($uri, $permanent_uri);
			
			if($moved_path) {
				
				$image_id = \Drupal\UserInterface\insert_image($permanent_uri, $hash);
				
				$dcfs->index($query, $image_id);
			}
		}
		file_unmanaged_delete($uri);
		//$search_result = [1, 2];
		$time_start = microtime(TRUE);
		$search_result = $dcfs->search($query, 5);
		$duration = microtime(TRUE) - $time_start;
		
		$form_state->setValue("duration", $duration);
		
		if(!$search_result) {
			drupal_set_message('No similar image is found!', 'error');
			return ;
		}
// 		drupal_set_message(print_r($search_result, true));
// 		return ;
		
		$ids = array_unique($search_result);
		
		$images = \Drupal\UserInterface\load_image($ids);
		
		$form_state->setRebuild(TRUE);
		$form_state->setStorage($images);
	}
	
	
}