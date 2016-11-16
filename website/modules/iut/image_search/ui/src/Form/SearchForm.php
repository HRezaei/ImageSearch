<?php

/**
 * @file
 * Contains \Drupal\UserInterface\Form\SearchForm.
 */

namespace Drupal\UserInterface\Form;

use Drupal\Core\Form\FormBase;
use Drupal\Core\Form\FormStateInterface;

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
		$form['sampe_image'] = array(
				'#type' => 'file',
				'#title' => $this->t('Upload your image'),
		);
		$form['actions']['#type'] = 'actions';
		$form['actions']['submit'] = array(
				'#type' => 'submit',
				'#value' => $this->t('Search'),
				'#button_type' => 'primary',
		);
		return $form;
	}

	/**
	 * {@inheritdoc}
	 */
	public function validateForm(array &$form, FormStateInterface $form_state) {
		if (strlen($form_state->getValue('sampe_image')) < 3) {
			$form_state->setErrorByName('sampe_image', $this->t('The phone number is too short. Please enter a full phone number.'));
		}
	}

	/**
	 * {@inheritdoc}
	 */
	public function submitForm(array &$form, FormStateInterface $form_state) {
		drupal_set_message($this->t('Your phone number is @number', array('@number' => $form_state->getValue('sampe_image'))));
	}

}