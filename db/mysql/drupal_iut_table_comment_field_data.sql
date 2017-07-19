
-- --------------------------------------------------------

--
-- Table structure for table `comment_field_data`
--

CREATE TABLE `comment_field_data` (
  `cid` int(10) UNSIGNED NOT NULL,
  `comment_type` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `pid` int(10) UNSIGNED DEFAULT NULL COMMENT 'The ID of the target entity.',
  `entity_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'The ID of the target entity.',
  `subject` varchar(64) DEFAULT NULL,
  `uid` int(10) UNSIGNED DEFAULT NULL COMMENT 'The ID of the target entity.',
  `name` varchar(60) DEFAULT NULL,
  `mail` varchar(254) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `hostname` varchar(128) DEFAULT NULL,
  `created` int(11) NOT NULL,
  `changed` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `thread` varchar(255) NOT NULL,
  `entity_type` varchar(32) CHARACTER SET ascii DEFAULT NULL,
  `field_name` varchar(32) CHARACTER SET ascii DEFAULT NULL,
  `default_langcode` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The data table for comment entities.';
