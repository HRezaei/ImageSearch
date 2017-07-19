
-- --------------------------------------------------------

--
-- Table structure for table `node_revision`
--

CREATE TABLE `node_revision` (
  `nid` int(10) UNSIGNED NOT NULL,
  `vid` int(10) UNSIGNED NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `revision_timestamp` int(11) DEFAULT NULL,
  `revision_uid` int(10) UNSIGNED DEFAULT NULL COMMENT 'The ID of the target entity.',
  `revision_log` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The revision table for node entities.';
