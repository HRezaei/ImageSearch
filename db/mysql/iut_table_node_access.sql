
-- --------------------------------------------------------

--
-- Table structure for table `node_access`
--

CREATE TABLE `node_access` (
  `nid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The node.nid this record affects.',
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The language.langcode of this node.',
  `fallback` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether this record should be used as a fallback if a language condition is not provided.',
  `gid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The grant ID a user must possess in the specified realm to gain this row''s privileges on the node.',
  `realm` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The realm in which the user must possess the grant ID. Each node access node can define one or more realms.',
  `grant_view` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can view this node.',
  `grant_update` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can edit this node.',
  `grant_delete` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can delete this node.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Identifies which realm/grant pairs a user must possess in…';
