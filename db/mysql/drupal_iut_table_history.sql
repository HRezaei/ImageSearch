
-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that read the node nid.',
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid that was read.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp at which the read occurred.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='A record of which users have read which nodes.';
