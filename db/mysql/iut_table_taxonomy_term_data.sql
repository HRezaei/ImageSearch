
-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_data`
--

CREATE TABLE `taxonomy_term_data` (
  `tid` int(10) UNSIGNED NOT NULL,
  `vid` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for taxonomy_term entities.';
