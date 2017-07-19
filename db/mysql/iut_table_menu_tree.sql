
-- --------------------------------------------------------

--
-- Table structure for table `menu_tree`
--

CREATE TABLE `menu_tree` (
  `menu_name` varchar(32) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The menu name. All links with the same menu name (such as ''tools'') are part of the same menu.',
  `mlid` int(10) UNSIGNED NOT NULL COMMENT 'The menu link ID (mlid) is the integer primary key.',
  `id` varchar(255) CHARACTER SET ascii NOT NULL COMMENT 'Unique machine name: the plugin ID.',
  `parent` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The plugin ID for the parent of this link.',
  `route_name` varchar(255) CHARACTER SET ascii DEFAULT NULL COMMENT 'The machine name of a defined Symfony Route this menu item represents.',
  `route_param_key` varchar(255) DEFAULT NULL COMMENT 'An encoded string of route parameters for loading by route.',
  `route_parameters` longblob COMMENT 'Serialized array of route parameters of this menu link.',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'The external path this link points to (when not using a route).',
  `title` longblob COMMENT 'The serialized title for the link. May be a TranslatableMarkup.',
  `description` longblob COMMENT 'The serialized description of this link - used for admin pages and title attribute. May be a TranslatableMarkup.',
  `class` text COMMENT 'The class for this link plugin.',
  `options` longblob COMMENT 'A serialized array of URL options, such as a query string or HTML attributes.',
  `provider` varchar(50) CHARACTER SET ascii NOT NULL DEFAULT 'system' COMMENT 'The name of the module that generated this link.',
  `enabled` smallint(6) NOT NULL DEFAULT '1' COMMENT 'A flag for whether the link should be rendered in menus. (0 = a disabled menu item that may be shown on admin screens, 1 = a normal, visible link)',
  `discovered` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag for whether the link was discovered, so can be purged on rebuild',
  `expanded` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag for whether this link should be rendered as expanded in menus - expanded links always have their child links displayed, instead of only when the link is in the active trail (1 = expanded, 0 = not expanded)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Link weight among links in the same menu at the same depth.',
  `metadata` longblob COMMENT 'A serialized array of data that may be used by the plugin instance.',
  `has_children` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag indicating whether any enabled links have this link as a parent (1 = enabled children exist, 0 = no enabled children).',
  `depth` smallint(6) NOT NULL DEFAULT '0' COMMENT 'The depth relative to the top level. A link with empty parent will have depth == 1.',
  `p1` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The first mlid in the materialized path. If N = depth, then pN must equal the mlid. If depth > 1 then p(N-1) must equal the parent link mlid. All pX where X > depth must equal zero. The columns p1 .. p9 are also called the parents.',
  `p2` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The second mlid in the materialized path. See p1.',
  `p3` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The third mlid in the materialized path. See p1.',
  `p4` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The fourth mlid in the materialized path. See p1.',
  `p5` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The fifth mlid in the materialized path. See p1.',
  `p6` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The sixth mlid in the materialized path. See p1.',
  `p7` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The seventh mlid in the materialized path. See p1.',
  `p8` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The eighth mlid in the materialized path. See p1.',
  `p9` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'The ninth mlid in the materialized path. See p1.',
  `form_class` varchar(255) DEFAULT NULL COMMENT 'meh'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Contains the menu tree hierarchy.';
