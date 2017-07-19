
-- --------------------------------------------------------

--
-- Table structure for table `file_managed`
--

CREATE TABLE `file_managed` (
  `fid` int(10) UNSIGNED NOT NULL,
  `uuid` varchar(128) CHARACTER SET ascii NOT NULL,
  `langcode` varchar(12) CHARACTER SET ascii NOT NULL,
  `uid` int(10) UNSIGNED DEFAULT NULL COMMENT 'The ID of the target entity.',
  `filename` varchar(255) DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `filemime` varchar(255) CHARACTER SET ascii DEFAULT NULL,
  `filesize` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created` int(11) DEFAULT NULL,
  `changed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='The base table for file entities.';

--
-- Dumping data for table `file_managed`
--

INSERT INTO `file_managed` (`fid`, `uuid`, `langcode`, `uid`, `filename`, `uri`, `filemime`, `filesize`, `status`, `created`, `changed`) VALUES
(1, 'a67fc455-a155-44c5-baae-2c6b270f7d18', 'en', 0, 'cat05.jpg', 'temporary://iut_upload/cat05.jpg', 'image/jpeg', 41278, 0, 1490499882, 1490499882),
(2, '20a12b5b-8dff-44e7-878f-f1865be57b2f', 'en', 0, 'cat05.jpg', 'temporary://iut_upload/cat05_0.jpg', 'image/jpeg', 41278, 0, 1490499961, 1490499961),
(3, 'd52df443-a288-4221-82fc-f5a59e38695c', 'en', 0, 'cat05.jpg', 'temporary://iut_upload/cat05_1.jpg', 'image/jpeg', 41278, 0, 1490500015, 1490500015);
