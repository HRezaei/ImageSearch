
-- --------------------------------------------------------

--
-- Table structure for table `node`
--

CREATE TABLE `node` (
  `nid` int(10) UNSIGNED NOT NULL,
  `vid` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for node entities.';
