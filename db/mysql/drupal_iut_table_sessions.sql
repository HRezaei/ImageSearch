
-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `uid` int(10) UNSIGNED NOT NULL COMMENT 'The users.uid corresponding to a session, or 0 for anonymous user.',
  `sid` varchar(128) CHARACTER SET ascii NOT NULL COMMENT 'A session ID (hashed). The value is generated by Drupal''s session handlers.',
  `hostname` varchar(128) CHARACTER SET ascii NOT NULL DEFAULT '' COMMENT 'The IP address that last used this session ID (sid).',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when this session last requested a page. Old records are purged by PHP automatically.',
  `session` longblob COMMENT 'The serialized contents of $_SESSION, an array of name/value pairs that persists across page requests by this session ID. Drupal loads $_SESSION from here at the start of each request and saves it at the end.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Drupal''s session handlers read and write into the sessions…';

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`uid`, `sid`, `hostname`, `timestamp`, `session`) VALUES
(1, 'd9MapPlHVZ6UHGEpCajyOo1LPQMdmsP66q5pz0JcYYE', '127.0.0.1', 1490505570, 0x5f7366325f617474726962757465737c613a313a7b733a333a22756964223b733a313a2231223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a343a7b733a313a2275223b693a313439303530353536383b733a313a2263223b693a313439303434323433353b733a313a226c223b733a373a2232303030303030223b733a313a2273223b733a34333a22796a636142374a55524a436468736f4d7a32622d794d527a6b633458505a4a3436385535486e7368657777223b7d),
(1, 'sk7Zk3KwVbFVy8ojTXhK1AR_jJWy1A_P-ENYTkMw-aI', '127.0.0.1', 1493120757, 0x5f7366325f617474726962757465737c613a313a7b733a333a22756964223b733a313a2231223b7d5f7366325f666c61736865737c613a303a7b7d5f7366325f6d6574617c613a343a7b733a313a2275223b693a313439333132303735363b733a313a2263223b693a313439333132303735363b733a313a226c223b733a373a2232303030303030223b733a313a2273223b733a34333a225742304c7675443563583063774e6b6255727361346f634f67664a4d5a78304f6239346478794962597938223b7d);