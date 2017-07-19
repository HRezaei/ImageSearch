
-- --------------------------------------------------------

--
-- Table structure for table `menu_link_content_data`
--

CREATE TABLE `menu_link_content_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `bundle` varchar(32) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `link__uri` varchar(2048) DEFAULT NULL COMMENT 'The URI of the link.',
  `link__title` varchar(255) DEFAULT NULL COMMENT 'The link text.',
  `link__options` longblob COMMENT 'Serialized array of options for the link.',
  `external` tinyint(4) DEFAULT NULL,
  `rediscover` tinyint(4) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `expanded` tinyint(4) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `parent` varchar(255) DEFAULT NULL,
  `changed` int(11) DEFAULT NULL,
  `default_langcode` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The data table for menu_link_content entities.';
