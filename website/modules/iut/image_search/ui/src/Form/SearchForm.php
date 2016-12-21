<?php

/**
 * @file
 * Contains \Drupal\UserInterface\Form\SearchForm.
 */

namespace Drupal\UserInterface\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\File\Entity;

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
		$form['radius'] = array(
				'#type' => 'number',
				'#title' => $this->t('Search Radius'),
				'#default_value' => 7,
		);

		$form['submit'] = array(
				'#type' => 'submit',
				'#value' => $this->t('Search'),
				'#button_type' => 'primary',
		);
		
		if($form_state->isRebuilding()) {
			
			$storage = $form_state->getStorage();
			
			$form['debug_info'] = [
				'#type' => 'details',
				'#title' => 'Info',
				'#open' => TRUE,
				'body_content' => [
					'#markup' => 'Times are in seconds<br/><pre>' .
					print_r($storage['info'], TRUE) . '</pre><br/>'
				]
			];
			
			$images = $storage['images'];
			if($images) {
				foreach ($images as $image) {
					$form['results'][] = [
						'#theme' => 'image_style',
						//'#width' => $variables['width'],
						//'#height' => $variables['height'],
						'#style_name' => 'medium',
						'#uri' => $image->uri,
						'#attributes' => [
							'title' => "image-id={$image->image_id}; {$image->uri}"
						]
					]; 
				}
			}
			else {
				$form['results'] = [
					'#type' => 'markup',
					'#markup' => 'Nosimilar image found!',
				]; 
			}
		}
		
		return $form;
	}

	/**
	 * {@inheritdoc}
	 */
	public function validateForm(array &$form, FormStateInterface $form_state) {
		$directory = 'temporary://iut_upload/';
		file_prepare_directory($directory, FILE_CREATE_DIRECTORY|FILE_MODIFY_PERMISSIONS);
		$file = file_save_upload('sample_image', [], $directory);		
		//$file = $form_state->getValue('sample_image');
		if (!$file) {
			$form_state->setErrorByName('sample_image', $this->t('Could not upload image. Please try again.'));
			return ;
		}
		$file = $file[0];
		$uri = $file->getFileUri();
		$path = drupal_realpath($uri);
		
		$hash = \Drupal\imagehash\image_hash($path, 8);
		
		$form_state->setValue('image_hash', $hash);
		$form_state->setValue('image_path', $path);
		
	}

	/**
	 * {@inheritdoc}
	 */
	public function submitForm(array &$form, FormStateInterface $form_state) {
		
		$hash = $form_state->getValue('image_hash');
		$uri = $form_state->getValue('image_path');
		$radius = $form_state->getValue('radius');
		
		$query = \Drupal\UserInterface\hex2bin($hash);
		
		
		$dcfs = new \Drupal\dcfs\DCFSearch();
		
		$search_result = $dcfs->search($query, $radius);
		
		$images = [];
		$ids = array_unique($search_result['result']);
		if($ids) {
			$images = \Drupal\UserInterface\load_image($ids);
		}
		
		$search_result['info'] += [
			'query' => $query,
			'hash' => $hash
		];
		
		$form_state->setRebuild(TRUE);
		$form_state->setStorage([
			'images' => $images,
			'info' => $search_result['info']
		]);
	}
	
	
}