
-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_field_data`
--

CREATE TABLE `taxonomy_term_field_data` (
  `tid` int(10) UNSIGNED NOT NULL,
  `vid` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `name` varchar(255) NOT NULL,
  `description__value` longtext,
  `description__format` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `weight` int(11) NOT NULL,
  `changed` int(11) DEFAULT NULL,
  `default_langcode` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The data table for taxonomy_term entities.';
