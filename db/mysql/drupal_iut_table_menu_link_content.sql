
-- --------------------------------------------------------

--
-- Table structure for table `menu_link_content`
--

CREATE TABLE `menu_link_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `bundle` varchar(32) CHARACTER SET ascii NOT NULL,
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for menu_link_content entities.';
