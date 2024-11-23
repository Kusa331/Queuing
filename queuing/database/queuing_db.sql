-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2024 at 05:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `queuing_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `file_uploads`
--

CREATE TABLE `file_uploads` (
  `id` int(30) NOT NULL,
  `file_path` longblob DEFAULT NULL,
  `date_uploaded` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `file_uploads`
--

INSERT INTO `file_uploads` (`id`, `file_path`, `date_uploaded`) VALUES
(17, 0x313630313533353036305f66696c655f6578616d706c655f4d50345f313238305f31304d472e6d7034, '2020-10-01 14:51:52'),
(19, 0x313733323132353930305f3436323535393536355f313234323131343931373035383839355f343435363037383936323834383035383230315f6e2e6a7067, '2024-11-21 02:05:22'),
(20, 0x313733323132363938305f3835343233382d68645f313238305f3732305f33306670732e6d7034, '2024-11-21 02:23:14'),
(21, 0x313733323132363938305f434353205365616c202831292e706e67, '2024-11-21 02:23:47'),
(22, 0x313733323132373334305f7569632d6c6f676f322e706e67, '2024-11-21 02:29:19'),
(23, 0x313733323132383330305f3339383037333536355f3335313236363736343236313631335f363035363638353335393532393532363636375f6e2e6a7067, '2024-11-21 02:45:39');

-- --------------------------------------------------------

--
-- Table structure for table `queue_list`
--

CREATE TABLE `queue_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `transaction_id` int(30) NOT NULL,
  `window_id` int(30) NOT NULL,
  `queue_no` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` date NOT NULL DEFAULT current_timestamp(),
  `created_timestamp` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `queue_list`
--

INSERT INTO `queue_list` (`id`, `name`, `transaction_id`, `window_id`, `queue_no`, `status`, `date_created`, `created_timestamp`) VALUES
(11, 'Adrian', 1, 0, '1001', 1, '2024-11-20', '2024-11-20 03:04:10'),
(12, 'AdrianM', 1, 1, '1001', 1, '2024-11-20', '2024-11-20 04:01:12'),
(13, 'Adrian11', 1, 1, '1001', 1, '2024-11-20', '2024-11-20 04:01:13'),
(14, 'Adrian', 1, 1, '1001', 1, '2024-11-20', '2024-11-20 04:02:44'),
(15, 'AdrianM', 2, 2, '1001', 1, '2024-11-20', '2024-11-20 04:21:46'),
(16, 'Adrian112', 1, 1, '1001', 1, '2024-11-20', '2024-11-20 04:02:44'),
(17, 'AdrianM', 2, 2, '1001', 1, '2024-11-20', '2024-11-20 04:21:47'),
(18, 'queue', 1, 1, '1001', 1, '2024-11-20', '2024-11-20 04:02:44'),
(19, 'qsqsq', 1, 1, '1001', 1, '2024-11-20', '2024-11-20 04:03:57'),
(20, 'Adrian', 1, 1, '1001', 1, '2024-11-20', '2024-11-20 04:07:01'),
(21, 'AdrianM', 1, 1, '1001', 1, '2024-11-20', '2024-11-20 04:07:12'),
(22, 'Adrian1212', 2, 2, '1001', 1, '2024-11-20', '2024-11-20 04:22:25'),
(23, 'pao', 1, 1, '1001', 1, '2024-11-20', '2024-11-20 04:07:12'),
(24, 'Adrian', 1, 1, '1011', 1, '2024-11-20', '2024-11-20 03:53:39'),
(25, 'Adrian11', 1, 1, '1012', 1, '2024-11-20', '2024-11-20 03:54:13'),
(26, 'AdrianM', 1, 1, '1013', 1, '2024-11-20', '2024-11-20 04:00:34'),
(27, 'Adrian11', 2, 2, '1004', 1, '2024-11-20', '2024-11-20 04:22:26'),
(28, 'queue', 3, 3, '1001', 1, '2024-11-20', '2024-11-20 04:38:25'),
(29, 'queue', 3, 3, '1002', 1, '2024-11-20', '2024-11-20 04:38:25'),
(30, 'AdrianM', 2, 2, '1005', 1, '2024-11-20', '2024-11-20 04:22:26'),
(31, 'asdasd', 2, 2, '1006', 1, '2024-11-20', '2024-11-20 04:22:27'),
(32, 'Staff 4', 4, 4, '1001', 1, '2024-11-20', '2024-11-20 04:23:53'),
(33, 'Adrian', 2, 2, '1007', 1, '2024-11-20', '2024-11-20 04:37:12'),
(34, 'Adrian11', 2, 2, '1008', 1, '2024-11-20', '2024-11-20 04:37:12'),
(35, 'Adrian11', 4, 4, '1002', 0, '2024-11-20', '2024-11-20 04:37:24'),
(36, 'qq', 1, 1, '1014', 1, '2024-11-20', '2024-11-20 04:37:52'),
(37, 'Adrian112', 3, 3, '1003', 1, '2024-11-20', '2024-11-20 04:38:25'),
(38, 'Rafael', 2, 2, '1009', 1, '2024-11-20', '2024-11-20 17:28:51'),
(39, 'queue', 1, 1, '1015', 1, '2024-11-20', '2024-11-20 22:19:52'),
(40, 'pao', 3, 3, '1004', 1, '2024-11-20', '2024-11-20 22:35:25'),
(41, 'admin', 1, 1, '1016', 1, '2024-11-20', '2024-11-20 23:35:07'),
(42, 'Adrian', 1, 1, '1017', 1, '2024-11-20', '2024-11-21 02:06:53'),
(43, 'ede', 1, 1, '1001', 1, '2024-11-21', '2024-11-21 01:50:40'),
(44, 'asdas', 1, 1, '1002', 1, '2024-11-21', '2024-11-21 01:51:55'),
(45, 'dasdasd', 2, 2, '1001', 1, '2024-11-21', '2024-11-21 01:52:36'),
(46, 'asdasd', 2, 2, '1002', 1, '2024-11-21', '2024-11-21 01:52:56'),
(47, 'aaa', 2, 2, '1003', 1, '2024-11-21', '2024-11-21 01:52:57'),
(48, 'wow', 1, 1, '1003', 1, '2024-11-21', '2024-11-21 01:59:49'),
(49, 'Adrian11111', 1, 1, '1004', 1, '2024-11-21', '2024-11-21 02:16:33'),
(50, 'Adrian', 6, 0, '1001', 0, '2024-11-21', '2024-11-21 02:05:45'),
(51, 'AdrianM', 6, 0, '1001', 0, '2024-11-21', '2024-11-21 02:05:52'),
(52, 'queue', 2, 2, '1010', 1, '2024-11-21', '2024-11-21 02:31:48'),
(53, 'Adrian11', 2, 2, '1010', 1, '2024-11-21', '2024-11-21 02:32:06'),
(54, 'Adrian', 3, 3, '1005', 1, '2024-11-21', '2024-11-21 02:30:21'),
(55, '12312312', 3, 3, '1005', 1, '2024-11-21', '2024-11-21 02:30:30'),
(56, 'ads', 1, 1, '1018', 1, '2024-11-21', '2024-11-21 02:16:33'),
(57, 'pao', 7, 14, '1001', 1, '2024-11-21', '2024-11-21 02:20:18'),
(58, '1231', 7, 14, '1002', 1, '2024-11-21', '2024-11-21 02:20:18'),
(59, '123', 7, 14, '1003', 1, '2024-11-21', '2024-11-21 02:24:33'),
(60, 'admin', 7, 14, '1004', 1, '2024-11-21', '2024-11-21 02:28:21'),
(61, 'mark', 7, 14, '1005', 1, '2024-11-21', '2024-11-21 02:28:22'),
(62, 'q', 3, 3, '1003', 1, '2024-11-21', '2024-11-21 02:30:31'),
(63, 'w', 3, 3, '1004', 1, '2024-11-21', '2024-11-21 02:30:33'),
(64, 'e', 2, 2, '1006', 1, '2024-11-21', '2024-11-21 02:32:06'),
(65, 'e', 2, 2, '1007', 1, '2024-11-21', '2024-11-21 02:32:11'),
(66, 'r', 1, 1, '1006', 0, '2024-11-21', '2024-11-21 02:27:07'),
(67, 'r', 1, 1, '1007', 0, '2024-11-21', '2024-11-21 02:27:12'),
(68, 't', 1, 1, '1008', 0, '2024-11-21', '2024-11-21 02:27:18'),
(69, 't', 1, 1, '1009', 0, '2024-11-21', '2024-11-21 02:27:23'),
(70, 'y', 1, 1, '1010', 0, '2024-11-21', '2024-11-21 02:27:32'),
(71, 'y', 1, 1, '1011', 0, '2024-11-21', '2024-11-21 02:27:40'),
(72, 'u', 4, 4, '1001', 1, '2024-11-21', '2024-11-21 02:43:38'),
(73, 'u', 4, 4, '1002', 1, '2024-11-21', '2024-11-21 02:43:41'),
(74, '5', 4, 4, '1003', 1, '2024-11-21', '2024-11-21 02:43:42'),
(75, 'come', 2, 2, '1008', 1, '2024-11-21', '2024-11-21 02:36:50'),
(76, 'Adrian', 7, 14, '1006', 0, '2024-11-21', '2024-11-21 02:40:33');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=Inactive,=1 Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `name`, `status`) VALUES
(1, 'Payments', 1),
(2, 'Inquiry', 1),
(3, 'Concerns', 1),
(4, 'Update\r\n', 1),
(7, 'Appointments', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_windows`
--

CREATE TABLE `transaction_windows` (
  `id` int(30) NOT NULL,
  `transaction_id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` tinyint(100) DEFAULT 1 COMMENT '0=Inactive,1=Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_windows`
--

INSERT INTO `transaction_windows` (`id`, `transaction_id`, `name`, `status`) VALUES
(1, 1, 'Window 1', 1),
(2, 2, 'Window 1', 1),
(3, 3, 'Window 1', 1),
(4, 4, 'Window 1', 1),
(5, 1, 'Window 2', 1),
(6, 2, 'Window 2', 1),
(7, 3, 'Window 2', 1),
(8, 4, 'Window 2', 1),
(9, 1, 'Window 3', 1),
(10, 2, 'Window 3', 1),
(11, 3, 'Window 3', 1),
(14, 7, 'Window 1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `window_id` int(30) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1 = Admin, 2= staff',
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `window_id`, `type`, `username`, `password`) VALUES
(1, 'Administrator', 0, 1, 'admin', '0192023a7bbd73250516f069df18b500'),
(3, 'staff1', 1, 2, 'staff1', '202cb962ac59075b964b07152d234b70'),
(4, 'Staff 2', 2, 2, 'staff2', '202cb962ac59075b964b07152d234b70'),
(5, 'admin', 0, 1, 'admin2', '25d55ad283aa400af464c76d713c07ad'),
(6, 'Staff 4', 1, 2, 'staff4', '202cb962ac59075b964b07152d234b70'),
(7, 'staff3', 3, 2, 'staff3', '202cb962ac59075b964b07152d234b70'),
(8, 'staff5', 4, 2, 'staff5', '202cb962ac59075b964b07152d234b70'),
(9, 'Ken', 3, 2, 'KenStaff5', '202cb962ac59075b964b07152d234b70');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `file_uploads`
--
ALTER TABLE `file_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue_list`
--
ALTER TABLE `queue_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction_windows`
--
ALTER TABLE `transaction_windows`
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
-- AUTO_INCREMENT for table `file_uploads`
--
ALTER TABLE `file_uploads`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `queue_list`
--
ALTER TABLE `queue_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transaction_windows`
--
ALTER TABLE `transaction_windows`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
