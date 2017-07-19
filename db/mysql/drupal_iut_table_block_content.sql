
-- --------------------------------------------------------

--
-- Table structure for table `block_content`
--

CREATE TABLE `block_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `revision_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for block_content entities.';
