
-- --------------------------------------------------------

--
-- Table structure for table `node_revision__comment`
--

CREATE TABLE `node_revision__comment` (
  `bundle` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) UNSIGNED NOT NULL COMMENT 'The entity revision id this data is attached to',
  `langcode` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language code for this data item.',
  `delta` int(10) UNSIGNED NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this entity: 0 = no, 1 = closed (read only), 2 = open (read/write).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Revision archive storage for node field comment.';
