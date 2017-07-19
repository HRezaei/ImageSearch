
-- --------------------------------------------------------

--
-- Table structure for table `key_value_expire`
--

CREATE TABLE `key_value_expire` (
  `collection` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'A named collection of key and value pairs.',
  `name` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The key of the key/value pair.',
  `value` longblob NOT NULL COMMENT 'The value of the key/value pair.',
  `expire` int(11) NOT NULL DEFAULT '2147483647' COMMENT 'The time since Unix epoch in seconds when this item expires. Defaults to the maximum possible time.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Generic key/value storage table with an expiration.';
