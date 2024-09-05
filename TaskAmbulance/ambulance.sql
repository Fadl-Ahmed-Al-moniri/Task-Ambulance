-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2024 at 10:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ambulance`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambulance_booking`
--

CREATE TABLE `ambulance_booking` (
  `booking_id` int(11) NOT NULL,
  `booking_type` varchar(50) DEFAULT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `status_image` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `dateofbook` datetime DEFAULT NULL,
  `booking_status` enum('pending','completed','canceled','new') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambulance_booking`
--

INSERT INTO `ambulance_booking` (`booking_id`, `booking_type`, `quantity`, `status_image`, `location`, `user_id`, `dateofbook`, `booking_status`) VALUES
(5, 'fire', 'minjor', 'upload\\9129background.jpg', '[15.391949482773335, 44.216720536351204]', 1, NULL, 'completed'),
(6, 'fire', 'minjor', 'upload\\9129background.jpg', '[15.391949482773335, 44.216720536351204]', 1, '0000-00-00 00:00:00', 'canceled'),
(7, 'fire', 'minjor', 'upload\\9129background.jpg', '[15.391949482773335, 44.216720536351204]', 1, '0000-00-00 00:00:00', 'canceled'),
(8, 'fire', 'minjor', 'upload\\9129background.jpg', '[15.391949482773335, 44.216720536351204]', 1, '2024-11-20 15:30:00', 'completed'),
(9, 'fire', 'minjor', 'upload\\9129background.jpg', '[15.391949482773335, 44.216720536351204]', 1, '2024-11-20 15:30:00', 'canceled'),
(10, 'fire', 'minjor', '', '[15.391949482773335, 44.216720536351204]', 1, '2024-11-20 15:30:00', 'completed'),
(11, 'fire', 'minjor', '9129background.jpg', '[15.391949482773335, 44.216720536351204]', 1, '2024-11-20 15:30:00', 'canceled'),
(12, 'fire', 'minjor', '9129background.jpg', '[15.391949482773335, 44.216720536351204]', 5, '2024-11-20 15:30:00', 'canceled'),
(15, 'fire', 'minjor', '9129background.jpg', '[15.391949482773335, 44.216720536351204]', 1, '2024-11-20 15:30:00', 'canceled'),
(16, 'fire', '', '9129background.jpg', '[15.391949482773335, 44.216720536351204]', 1, '2024-11-20 15:30:00', 'canceled'),
(17, 'fire', 'minjor', '9129background.jpg', '[15.391949482773335, 44.216720536351204]', 1, '2024-11-20 15:30:00', 'completed'),
(18, 'Accident', 'Major', 'fail', '[15.391949482773335, 44.216720536351204]', 1, '2024-09-04 02:24:01', 'completed'),
(19, 'Accident', 'Major', 'fail', '[15.391949482773335, 44.216720536351204]', 1, '2024-09-04 02:28:05', 'completed'),
(20, 'Accident', 'Major', 'fail', '[15.391949482773335, 44.216720536351204]', 1, '2024-09-04 16:00:36', 'completed'),
(22, 'Fire', 'Minor', 'fail', '[15.391949482773335, 44.216720536351204]', 1, '2024-09-04 17:13:00', 'completed'),
(23, 'fire', 'minjor', NULL, '[15.391949482773335, 44.216720536351204]', 1, '2024-09-04 08:21:10', 'completed'),
(24, 'other', 'minjor', NULL, '[15.391949482773335, 44.216720536351204]', 1, '2024-09-04 08:21:10', 'canceled'),
(25, 'Medical', 'Minor', 'fail', '15.348070693967886,44.1719638556242', 1, '2024-09-05 17:50:48', 'completed'),
(26, 'Accident', 'Minor', 'fail', '15.412350772283244,44.201239831745625', 2, '2024-09-05 20:17:38', 'completed'),
(27, 'Fire', 'Major', 'fail', '15.39616236624199,44.23001658171415', 11, '2024-09-05 22:15:44', 'completed'),
(28, 'Fire', 'Major', 'fail', '15.296235949899245,44.199617095291615', 11, '2024-09-05 22:17:46', 'pending'),
(29, 'Other', 'Major', 'fail', '15.321282342315651,44.205110259354115', 17, '2024-09-05 22:44:52', 'canceled');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `cnic_number` varchar(13) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city_address` varchar(255) DEFAULT NULL,
  `cnic_image` varchar(255) DEFAULT NULL,
  `userstate` enum('active','block') NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `cnic_number`, `full_name`, `phone`, `password`, `address`, `city_address`, `cnic_image`, `userstate`, `role`) VALUES
(1, 'fadl', '2000255205', 'fadl ahmed almoniri', '00967777589435', '1234', 'sanaa', 'shamlan', '3079100012773930791000127739.jpg', 'active', 'user'),
(2, 'test', '22000', 'ali ahmed', '00967777777777', '1234', 'sanaa', '60-st', '', 'active', 'user'),
(3, 'fafa', '055055', 'dffd', '5515651', '555555', '455555544', 'fdfd', '/data/user/0/com.example.AmbulaceBooking/cache/8508777e-0790-4d44-8834-4e082e1effba2694565398991330101.jpg', 'active', 'user'),
(5, 'testofromapp', '0550', 'dffd', '5515651', '555555', '455555544', 'fdfd', '/data/user/0/com.example.AmbulaceBooking/cache/8508777e-0790-4d44-8834-4e082e1effba2694565398991330101.jpg', 'active', 'user'),
(6, 'admin', '000000000000', 'admin', '777589435', '1234', 'sana\'a ', 'shamlan ', NULL, '', 'admin'),
(9, 'driver', '0000000000000', 'driver', '777589435', '1234', 'sana\'a ', 'shamlan ', NULL, 'active', 'driver'),
(10, 'ali@gmail.com', '54822485', 'ali Ahmed ', '7777600555', '1234', 'maraab', 'aljobh', '/data/user/0/com.example.AmbulaceBooking/cache/3e0e74dd-e6e6-449f-b521-1b43d5c46b51/قـوقـل نـت ـ صنعاء ـ شارع الثلاثين أمام جامعة الايمان (1).jpg', 'active', ''),
(11, 'afa', '555555', 'fsff', '555555555555555', '1234', 'dfdfd', 'dfdv', '/data/user/0/com.example.AmbulaceBooking/cache/fa10c885-6a2f-431e-a0be-50ad5e96aaad/قـوقـل نـت ـ صنعاء ـ شارع الثلاثين أمام جامعة الايمان (1).jpg', 'active', ''),
(13, 'aaa', '4010', 'line', '0000', '1234', 'rere', '1', '/data/user/0/com.example.AmbulaceBooking/cache/7c4e1f0d-35fa-41eb-8fd6-f3b7906476db/قـوقـل نـت ـ صنعاء ـ شارع الثلاثين أمام جامعة الايمان (1).jpg', 'active', ''),
(14, 'moh', '1234', 'Mohammad ', '77777', '1234', 'sanaa', 'asa', '/data/user/0/com.example.AmbulaceBooking/cache/446feb74-28c3-4b54-9256-b90203973b1f/قـوقـل نـت ـ صنعاء ـ شارع الثلاثين أمام جامعة الايمان (1).jpg', 'active', ''),
(15, 'ailali', '454', 'Ali ', '87788', '1234', '55555', '7070', '/data/user/0/com.example.AmbulaceBooking/cache/e467bb32-d297-474d-a12c-856d5d5036d0/قـوقـل نـت ـ صنعاء ـ شارع الثلاثين أمام جامعة الايمان (1).jpg', 'active', ''),
(16, 'oowoo', '55455', 'dld', '888', '1234', '1234', 'rer', '/data/user/0/com.example.AmbulaceBooking/cache/04a1d5ea-dfd4-4e5b-9404-e64692607587/قـوقـل نـت ـ صنعاء ـ شارع الثلاثين أمام جامعة الايمان (1).jpg', 'active', ''),
(17, 'fafaf', '4547', 'ewfweve', 'vevev', '1234', 'afaf', 'affa', '/data/user/0/com.example.AmbulaceBooking/cache/2e246b46-d35d-42ab-bb32-c0713ed983dd/قـوقـل نـت ـ صنعاء ـ شارع الثلاثين أمام جامعة الايمان (1).jpg', 'active', ''),
(18, 'afaf', '122347', 'fd77', '88', '1234', '5f5d', 'fdf', '/data/user/0/com.example.AmbulaceBooking/cache/2ea44458-f9e7-45a9-9cbf-15354de9ef99/FB_IMG_1725544280588.jpg', 'active', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambulance_booking`
--
ALTER TABLE `ambulance_booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cnic_number` (`cnic_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ambulance_booking`
--
ALTER TABLE `ambulance_booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ambulance_booking`
--
ALTER TABLE `ambulance_booking`
  ADD CONSTRAINT `ambulance_booking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
