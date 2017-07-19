
-- --------------------------------------------------------

--
-- Table structure for table `block_content_field_revision`
--

CREATE TABLE `block_content_field_revision` (
  `id` int(10) UNSIGNED NOT NULL,
  `revision_id` int(10) UNSIGNED NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `info` varchar(255) DEFAULT NULL,
  `changed` int(11) DEFAULT NULL,
  `revision_created` int(11) DEFAULT NULL,
  `revision_user` int(10) UNSIGNED DEFAULT NULL COMMENT 'The ID of the target entity.',
  `revision_translation_affected` tinyint(4) DEFAULT NULL,
  `default_langcode` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The revision data table for block_content entities.';
