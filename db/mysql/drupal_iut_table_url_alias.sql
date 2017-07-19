
-- --------------------------------------------------------

--
-- Table structure for table `url_alias`
--

CREATE TABLE `url_alias` (
  `pid` int(10) UNSIGNED NOT NULL COMMENT 'A unique path alias identifier.',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path this alias is for. e.g. node/12.',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'The alias for this path. e.g. title-of-the-story.',
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code this alias is for. if ''und'', the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A list of URL aliases for Drupal paths. a user may visit…';
