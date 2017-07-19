
-- --------------------------------------------------------

--
-- Table structure for table `cachetags`
--

CREATE TABLE `cachetags` (
  `tag` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Namespace-prefixed tag string.',
  `invalidations` int(11) NOT NULL DEFAULT '0' COMMENT 'Number incremented when the tag is invalidated.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Cache table for tracking cache tag invalidations.';
