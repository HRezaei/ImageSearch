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
}