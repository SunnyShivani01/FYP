-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 11, 2022 at 12:16 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `PrinteX_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Documents', 'This category is for the document types of printing.', 1, 0, '2022-08-26 09:22:05', NULL),
(2, 'Panaflex', 'This printing category is for the banners or panaflex.', 1, 0, '2022-08-26 09:22:52', NULL),
(3, 'Shirt', 'This category is for all shirt printing.', 1, 0, '2022-08-26 09:23:20', NULL),
(4, 'Sample 101', 'Sample 101', 0, 1, '2022-01-26 09:24:17', '2022-11-29 17:18:32'),
(5, 'To Delete', 'Sample deleted Category.', 0, 1, '2022-08-26 09:25:12', '2022-08-26 09:25:37');

-- --------------------------------------------------------

--
-- Table structure for table `payment_history`
--

CREATE TABLE `payment_history` (
  `id` int(30) NOT NULL,
  `transaction_id` int(30) NOT NULL,
  `amount` float NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_history`
--

INSERT INTO `payment_history` (`id`, `transaction_id`, `amount`, `date_created`, `date_updated`) VALUES
(18, 15, 0, '2022-11-30 10:33:23', NULL),
(19, 15, 200, '2022-11-30 10:34:09', NULL),
(20, 16, 0, '2022-11-30 12:02:50', NULL),
(21, 17, 0, '2022-11-30 12:03:41', NULL),
(22, 18, 100, '2022-12-03 13:52:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `price_list`
--

CREATE TABLE `price_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `size` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `price_list`
--

INSERT INTO `price_list` (`id`, `category_id`, `size`, `price`, `status`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 1, 'Legal (8.5 X 14 in)', 5, 1, 0, '2022-08-26 09:50:30', '2022-08-26 10:22:10'),
(2, 1, 'Short (8.5 x 10.5 in)', 3, 1, 0, '2022-08-26 09:51:26', '2022-08-26 10:22:17'),
(3, 1, 'A4 (210 x 297 mm)', 5, 1, 0, '2022-08-26 09:51:46', NULL),
(4, 1, 'A3 (297 x 420 mm)', 6, 0, 0, '2022-08-26 09:52:05', '2022-11-17 10:38:10'),
(5, 1, 'Α0 (84.1 x 118.9 cm)', 50, 1, 0, '2022-08-26 09:54:03', NULL),
(6, 2, '2 x 3 ft.', 200, 1, 0, '2022-08-26 09:55:53', NULL),
(7, 2, ' 4 x 2 ft', 250, 1, 0, '2022-08-26 09:56:16', '2022-08-26 09:56:58'),
(8, 2, '3 x 4 ft.', 300, 1, 0, '2022-08-26 09:56:33', '2022-08-26 09:57:11'),
(9, 2, '4 x 4 ft.', 350, 1, 0, '2022-08-26 09:56:43', '2022-08-26 09:57:22'),
(10, 3, 'A4 Front and Back', 250, 1, 0, '2022-08-26 10:18:13', NULL),
(12, 3, '8.5 x 14.5 Front 4 x 6 back ', 220, 1, 0, '2022-08-26 10:19:18', NULL),
(13, 3, 'A4 Front Only', 180, 1, 0, '2022-08-26 10:19:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'PrinteX - Digital Printing Manager'),
(6, 'short_name', 'PrinteX'),
(11, 'logo', 'uploads/Logo1.png'),
(13, 'user_avatar', 'uploads/saad.jpg'),
(14, 'cover', 'uploads/cover.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `transaction_id` int(30) NOT NULL,
  `price_id` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `quantity` float NOT NULL DEFAULT 0,
  `total` float NOT NULL DEFAULT 0,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_items`
--

INSERT INTO `transaction_items` (`transaction_id`, `price_id`, `price`, `quantity`, `total`, `date_updated`) VALUES
(15, 2, 3, 1, 3, '2022-11-30 10:33:23'),
(15, 6, 200, 1, 200, '2022-11-30 10:33:23'),
(15, 10, 250, 1, 250, '2022-11-30 10:33:23'),
(16, 5, 50, 1, 50, '2022-11-30 12:02:50'),
(17, 7, 250, 1e26, 2.5e28, '2022-11-30 12:03:41'),
(18, 5, 50, 1, 50, '2022-12-03 13:52:11'),
(18, 7, 250, 1, 250, '2022-12-03 13:52:11'),
(19, 12, 220, 1, 220, '2022-12-11 16:08:53');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_list`
--

CREATE TABLE `transaction_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `client_name` text NOT NULL,
  `client_contact` text NOT NULL,
  `client_address` text NOT NULL,
  `total_amount` float NOT NULL DEFAULT 0,
  `paid_amount` float NOT NULL DEFAULT 0,
  `balance` float NOT NULL DEFAULT 0,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Unpaid, 1=partially paid, 2= paid',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending, 1= On-process, 2= done',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_list`
--

INSERT INTO `transaction_list` (`id`, `code`, `client_name`, `client_contact`, `client_address`, `total_amount`, `paid_amount`, `balance`, `payment_status`, `status`, `date_created`, `date_updated`) VALUES
(15, '202211-00001', 'sunny', '00', 'N/A', 453, 200, 253, 1, 2, '2022-11-30 10:33:23', '2022-11-30 13:23:37'),
(16, '202211-00002', 'Guest', 'N/A', 'N/A', 50, 0, 50, 0, 1, '2022-11-30 12:02:50', '2022-11-30 12:06:01'),
(17, '202211-00003', 'Guest', 'N/A', 'N/A', 2.5e28, 0, 2.5e28, 0, 0, '2022-11-30 12:03:41', '2022-11-30 12:03:41'),
(18, '202212-00001', 'Guest', 'N/A', 'N/A', 300, 100, 200, 1, 2, '2022-12-03 13:52:11', '2022-12-03 13:52:33'),
(19, '202212-00002', 'Moiz', '03421234234', 'Hirabad, City Gate', 220, 0, 0, 0, 1, '2022-12-11 16:08:53', '2022-12-11 16:11:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Moiz', NULL, 'Hasnain', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1670756489', NULL, 1, 1, '2022-08-26 14:02:37', '2022-12-11 16:01:29'),
(7, 'Sunny', NULL, 'Sagar', 'sunny', '533c5ba8368075db8f6ef201546bd71a', 'uploads/avatar-7.png?v=1643180426', NULL, 2, 1, '2022-08-26 15:00:26', '2022-11-17 10:42:08'),
(8, 'saad', NULL, 's', 'admin1', '347602146a923872538f3803eb5f3cef', NULL, NULL, 1, 1, '2022-11-30 12:10:21', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `price_list`
--
ALTER TABLE `price_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `price_id` (`price_id`);

--
-- Indexes for table `transaction_list`
--
ALTER TABLE `transaction_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_history`
--
ALTER TABLE `payment_history`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `price_list`
--
ALTER TABLE `price_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `transaction_list`
--
ALTER TABLE `transaction_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment_history`
--
ALTER TABLE `payment_history`
  ADD CONSTRAINT `payment_history_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `price_list`
--
ALTER TABLE `price_list`
  ADD CONSTRAINT `price_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `transaction_items_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transaction_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_items_ibfk_2` FOREIGN KEY (`price_id`) REFERENCES `price_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
