
-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `item_id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key: Unique item ID.',
  `name` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The queue name.',
  `data` longblob COMMENT 'The arbitrary data for the item.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the claim lease expires on the item.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores items in queues.';
