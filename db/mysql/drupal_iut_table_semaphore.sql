
-- --------------------------------------------------------

--
-- Table structure for table `semaphore`
--

CREATE TABLE `semaphore` (
  `name` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique name.',
  `value` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'A value for the semaphore.',
  `expire` double NOT NULL COMMENT 'A Unix timestamp with microseconds indicating when the semaphore should expire.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Table for holding semaphores, locks, flags, etc. that…';
