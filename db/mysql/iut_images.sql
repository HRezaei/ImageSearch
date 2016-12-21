-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 21, 2016 at 08:21 PM
-- Server version: 5.5.44-0ubuntu0.14.10.1
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `IUTSearch`
--

-- --------------------------------------------------------

--
-- Table structure for table `iut_images`
--

CREATE TABLE `iut_images` (
  `image_id` int(11) NOT NULL COMMENT 'Unique identifier of image',
  `hash` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'blockhash of image in hexadecimal',
  `uri` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'absolute uri of the image'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Stores information of indexed images';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `iut_images`
--
ALTER TABLE `iut_images`
  ADD PRIMARY KEY (`image_id`),
  ADD UNIQUE KEY `hash` (`hash`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `iut_images`
--
ALTER TABLE `iut_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique identifier of image';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
