
-- --------------------------------------------------------

--
-- Table structure for table `shortcut`
--

CREATE TABLE `shortcut` (
  `id` int(10) UNSIGNED NOT NULL,
  `shortcut_set` varchar(32) CHARACTER SET ascii NOT NULL COMMENT 'The ID of the target entity.',
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for shortcut entities.';

--
-- Dumping data for table `shortcut`
--

INSERT INTO `shortcut` (`id`, `shortcut_set`, `uuid`, `langcode`) VALUES
(1, 'default', '5be3b841-af0b-4d77-b4a1-3aa41bcedc22', 'en'),
(2, 'default', 'b130602d-a1b4-4ae8-9895-c80abe0920ed', 'en');
