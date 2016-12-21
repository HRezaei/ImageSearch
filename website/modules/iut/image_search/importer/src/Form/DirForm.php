<?php

/**
 * @file
 * Contains \Drupal\UserInterface\Form\SearchForm.
 */

namespace Drupal\importer\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;
use Drupal\File\Entity;
use Drupal\KernelTests\Core\File\DirectoryTest;
use Drupal\importer\Importer;

/**
 * Implements an example form.
 */
class DirForm extends FormBase {

	/**
	 * {@inheritdoc}
	 */
	public function getFormId() {
		return 'dir_form';
	}

	/**
	 * {@inheritdoc}
	 */
	public function buildForm(array $form, FormStateInterface $form_state) {
		$form['directory'] = array(
				'#type' => 'textfield',
				'#title' => $this->t('Enter path of directory to import'),
				'#description' => $this->t("e.g. /home/user/photos/ <br/>All jpg images within this directory will be indexed")
		);
		
		$form['num_bits'] = array(
				'#type' => 'number',
				'#title' => $this->t('Number of Bits'),
				'#default_value' => 64,
				'#description' => $this->t("This number must be a power of 4, such as 64, 256")
		);
		
		$form['submit'] = array(
				'#type' => 'submit',
				'#value' => $this->t('Import'),
				'#button_type' => 'primary',
		);
		if($form_state->isRebuilding()) {
				
			$storage = $form_state->getStorage();
			$form['result'] = [
				'#markup' => '<pre>' . print_r($storage, TRUE) . '</pre>'
			];
		}
		return $form;
	}

	/**
	 * {@inheritdoc}
	 */
	public function validateForm(array &$form, FormStateInterface $form_state) {
		$directory = $form_state->getValue('directory');
		
		if (!file_exists($directory)) {
			$form_state->setErrorByName('directory', $this->t('Directory does not exist.'));
			return ;
		}
	}

	/**
	 * {@inheritdoc}
	 */
	public function submitForm(array &$form, FormStateInterface $form_state) {
		
		$dir = $form_state->getValue('directory');
		$num_bits = $form_state->getValue('num_bits');

		$result = Importer::import($dir, $num_bits);
		
		$form_state->setRebuild(TRUE);
		$form_state->setStorage($result);
	}
	
	
}