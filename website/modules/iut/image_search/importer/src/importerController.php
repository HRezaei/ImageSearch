<?php
/**
 * @file
 * Contains \Drupal\UserInterface\UserInterfaceController.
 */

namespace Drupal\importer;


use Drupal\Core\Controller\ControllerBase;


class importerController extends ControllerBase {
  public function dir_form() {
  	$form = \Drupal::formBuilder()->getForm('Drupal\importer\Form\DirForm');
    return $form;
  }
}