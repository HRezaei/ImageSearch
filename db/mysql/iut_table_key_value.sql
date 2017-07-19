
-- --------------------------------------------------------

--
-- Table structure for table `key_value`
--

CREATE TABLE `key_value` (
  `collection` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'A named collection of key and value pairs.',
  `name` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The key of the key-value pair. As KEY is a SQL reserved keyword, name was chosen instead.',
  `value` longblob NOT NULL COMMENT 'The value.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Generic key-value storage table. See the state system for…';
