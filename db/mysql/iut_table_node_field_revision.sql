
-- --------------------------------------------------------

--
-- Table structure for table `node_field_revision`
--

CREATE TABLE `node_field_revision` (
  `nid` int(10) UNSIGNED NOT NULL,
  `vid` int(10) UNSIGNED NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `status` tinyint(4) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `uid` int(10) UNSIGNED NOT NULL COMMENT 'The ID of the target entity.',
  `created` int(11) DEFAULT NULL,
  `changed` int(11) DEFAULT NULL,
  `promote` tinyint(4) DEFAULT NULL,
  `sticky` tinyint(4) DEFAULT NULL,
  `revision_translation_affected` tinyint(4) DEFAULT NULL,
  `default_langcode` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The revision data table for node entities.';
