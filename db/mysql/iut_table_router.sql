
-- --------------------------------------------------------

--
-- Table structure for table `router`
--

CREATE TABLE `router` (
  `name` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Primary Key: Machine name of this route',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'The path for this URI',
  `pattern_outline` varchar(255) NOT NULL DEFAULT '' COMMENT 'The pattern',
  `fit` int(11) NOT NULL DEFAULT '0' COMMENT 'A numeric representation of how specific the path is.',
  `route` longblob COMMENT 'A serialized Route object',
  `number_parts` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Number of parts in this router path.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Maps paths to various callbacks (access, page and title)';
