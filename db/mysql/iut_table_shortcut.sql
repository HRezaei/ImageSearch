
-- --------------------------------------------------------

--
-- Table structure for table `shortcut`
--

CREATE TABLE `shortcut` (
  `id` int(10) UNSIGNED NOT NULL,
  `shortcut_set` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for shortcut entities.';
