
-- --------------------------------------------------------

--
-- Table structure for table `shortcut_set_users`
--

CREATE TABLE `shortcut_set_users` (
  `uid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The users.uid for this set.',
  `set_name` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The shortcut_set.set_name that will be displayed for this user.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Maps users to shortcut sets.';
