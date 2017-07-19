
-- --------------------------------------------------------

--
-- Table structure for table `flood`
--

CREATE TABLE `flood` (
  `fid` int(11) NOT NULL COMMENT 'Unique flood event ID.',
  `event` varchar(64) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Name of event (e.g. contact).',
  `identifier` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Identifier of the visitor, such as an IP address or hostname.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp of the event.',
  `expiration` int(11) NOT NULL DEFAULT '0' COMMENT 'Expiration timestamp. Expired events are purged on cron run.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Flood controls the threshold of events, such as the number…';
