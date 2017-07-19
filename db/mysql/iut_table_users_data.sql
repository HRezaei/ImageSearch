
-- --------------------------------------------------------

--
-- Table structure for table `users_data`
--

CREATE TABLE `users_data` (
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary key: users.uid for user.',
  `module` varchar(50) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The name of the module declaring the variable.',
  `name` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The identifier of the data.',
  `value` longblob COMMENT 'The value.',
  `serialized` tinyint(3) UNSIGNED DEFAULT '0' COMMENT 'Whether value is serialized.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores module data as key/value pairs per user.';
