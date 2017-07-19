
-- --------------------------------------------------------

--
-- Table structure for table `search_total`
--

CREATE TABLE `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique word in the search index.',
  `count` float DEFAULT NULL COMMENT 'The count of the word in the index using Zipf''s law to equalize the probability distribution.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Stores search totals for words.';
