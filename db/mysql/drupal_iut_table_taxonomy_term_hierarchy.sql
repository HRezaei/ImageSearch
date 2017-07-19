
-- --------------------------------------------------------

--
-- Table structure for table `taxonomy_term_hierarchy`
--

CREATE TABLE `taxonomy_term_hierarchy` (
  `tid` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term.',
  `parent` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term''s parent. 0 indicates no parent.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores the hierarchical relationship between terms.';
