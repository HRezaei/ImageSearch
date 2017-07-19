
-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `collection` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Primary Key: Config object collection.',
  `name` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Primary Key: Config object name.',
  `data` longblob COMMENT 'A serialized configuration object data.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for configuration data.';
