<?php
/**
 * @file
 * Contains \Drupal\iut\image_search\ui\UserInterfaceController.
 */

namespace Drupal\user_interface;


use Drupal\Core\Controller\ControllerBase;


class UserInterfaceController extends ControllerBase {
  public function main_form() {
    return Drupal\drupal_get_form('image_search_form');
  }
}