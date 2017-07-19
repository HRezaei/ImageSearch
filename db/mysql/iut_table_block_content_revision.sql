
-- --------------------------------------------------------

--
-- Table structure for table `block_content_revision`
--

CREATE TABLE `block_content_revision` (
  `id` int(10) UNSIGNED NOT NULL,
  `revision_id` int(10) UNSIGNED NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `revision_log` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The revision table for block_content entities.';
