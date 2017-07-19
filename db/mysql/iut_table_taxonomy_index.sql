
-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_index`
--

CREATE TABLE `taxonomy_index` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `tid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node is published (visible to non-administrators).',
  `sticky` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Maintains denormalized information about node/term…';
