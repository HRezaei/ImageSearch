
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for user entities.';
