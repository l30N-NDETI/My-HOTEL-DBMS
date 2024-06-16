-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2024 at 01:33 PM
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
-- Database: `my hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_Id` int(11) NOT NULL,
  `Category_Name` varchar(255) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Beds_numbers` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_Id`, `Category_Name`, `Price`, `Beds_numbers`) VALUES
(1, 'Single', 30000.00, 1),
(2, 'Double', 15000.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_Id` int(11) NOT NULL,
  `Employee_Name` varchar(255) NOT NULL,
  `Employee_Speciality` varchar(255) NOT NULL,
  `Hotel_Id` int(11) DEFAULT NULL,
  `is_lead` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`Employee_Id`, `Employee_Name`, `Employee_Speciality`, `Hotel_Id`, `is_lead`) VALUES
(1, 'Leon Ndeti', 'Manager', 1, 1),
(2, 'Daniel Ndambuki', 'Janitor', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hotel`
--

CREATE TABLE `hotel` (
  `Hotel_Id` int(11) NOT NULL,
  `Hotel_name` varchar(255) NOT NULL,
  `Type_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hotel`
--

INSERT INTO `hotel` (`Hotel_Id`, `Hotel_name`, `Type_Id`) VALUES
(1, '46 Residence.', 1),
(2, '58 Bay', 2);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_Id` int(11) NOT NULL,
  `Floor` int(11) NOT NULL,
  `Type_Id` int(11) DEFAULT NULL,
  `Hotel_Id` int(11) DEFAULT NULL,
  `Category_Id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Room_Id`, `Floor`, `Type_Id`, `Hotel_Id`, `Category_Id`) VALUES
(101, 1, 1, 1, 1),
(102, 1, 2, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `Type_Id` int(11) NOT NULL,
  `Type_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`Type_Id`, `Type_Name`) VALUES
(1, '5-STAR'),
(2, '4-STAR');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_Id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_Id`),
  ADD KEY `Hotel_Id` (`Hotel_Id`);

--
-- Indexes for table `hotel`
--
ALTER TABLE `hotel`
  ADD PRIMARY KEY (`Hotel_Id`),
  ADD KEY `Type_Id` (`Type_Id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_Id`),
  ADD KEY `Type_Id` (`Type_Id`),
  ADD KEY `Hotel_Id` (`Hotel_Id`),
  ADD KEY `Category_Id` (`Category_Id`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`Type_Id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`Hotel_Id`) REFERENCES `hotel` (`Hotel_Id`);

--
-- Constraints for table `hotel`
--
ALTER TABLE `hotel`
  ADD CONSTRAINT `hotel_ibfk_1` FOREIGN KEY (`Type_Id`) REFERENCES `type` (`Type_Id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`Type_Id`) REFERENCES `type` (`Type_Id`),
  ADD CONSTRAINT `room_ibfk_2` FOREIGN KEY (`Hotel_Id`) REFERENCES `hotel` (`Hotel_Id`),
  ADD CONSTRAINT `room_ibfk_3` FOREIGN KEY (`Category_Id`) REFERENCES `category` (`Category_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
