<?php
/**
 * @file
 * Contains \Drupal\UserInterface\UserInterfaceController.
 */

namespace Drupal\UserInterface;


use Drupal\Core\Controller\ControllerBase;


class UserInterfaceController extends ControllerBase {
  public function main_form() {
  	$form = \Drupal::formBuilder()->getForm('Drupal\UserInterface\Form\SearchForm');
    return $form;
  }
  
  public function test_form() {
  	//$form = \Drupal::formBuilder()->getForm('Drupal\UserInterface\Form\SearchForm');
  	set_time_limit(0);
  	$content = run_test(20, [5, 6, 7, 8, 9, 10, 11, 12]);
  	$module_path = drupal_get_path('module', 'UserInterface');
  	
  	return ['cont' => [
  			'#markup' => "<pre>" . print_r($content, TRUE) . "</pre>",
  		]
  	];
  }
}