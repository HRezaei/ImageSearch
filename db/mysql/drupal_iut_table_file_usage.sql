
-- --------------------------------------------------------

--
-- Table structure for table `file_usage`
--

CREATE TABLE `file_usage` (
  `fid` int(10) UNSIGNED NOT NULL COMMENT 'File ID.',
  `module` varchar(50) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The name of the module that is using the file.',
  `type` varchar(64) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The name of the object type in which the file is used.',
  `id` varchar(64) CHARACTER SET ascii NOT NULL DEFAULT '0' COMMENT 'The primary key of the object using the file.',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The number of times this file is used by this object.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Track where a file is used.';
