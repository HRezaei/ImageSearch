
-- --------------------------------------------------------

--
-- Table structure for table `node_field_data`
--

CREATE TABLE `node_field_data` (
  `nid` int(10) UNSIGNED NOT NULL,
  `vid` int(10) UNSIGNED NOT NULL,
  `type` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `status` tinyint(4) NOT NULL,
  `title` varchar(255) NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL COMMENT 'The ID of the target entity.',
  `created` int(11) NOT NULL,
  `changed` int(11) NOT NULL,
  `promote` tinyint(4) NOT NULL,
  `sticky` tinyint(4) NOT NULL,
  `revision_translation_affected` tinyint(4) DEFAULT NULL,
  `default_langcode` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The data table for node entities.';
