-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2020 at 06:45 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_sabiraaliu_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_sabiraaliu_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_sabiraaliu_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `street` varchar(80) DEFAULT NULL,
  `street_no` int(11) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `zipcode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `street`, `street_no`, `city`, `zipcode`) VALUES
(1, 'Leo Mathausergasse', 66, 'Vienna', 1230),
(2, 'address1', 22, 'Vienna', 1010),
(3, 'address2', 33, 'Linz', 1010),
(4, 'address3', 11, 'Graz', 1010),
(5, 'address4', 55, 'Vienna', 1010);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `phone_number`, `email`, `fk_address_id`) VALUES
(1, 'Sabira', 'Aliu', 60511111, 'sabira@mail.com', 1),
(2, 'Anna', 'May', 60522222, 'anna@mail.com', 2),
(3, 'John', 'Jarry', 60533333, 'john@mail.com', 3),
(4, 'Maya', 'Moor', 60544444, 'maya@mail.com', 4),
(5, 'Richard', 'Ray', 60555555, 'richard@mail.com', 5);

-- --------------------------------------------------------

--
-- Table structure for table `drop_off`
--

CREATE TABLE `drop_off` (
  `drop_off_id` int(11) NOT NULL,
  `drop_off_date` date DEFAULT NULL,
  `drop_off_time` time DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drop_off`
--

INSERT INTO `drop_off` (`drop_off_id`, `drop_off_date`, `drop_off_time`, `fk_address_id`, `fk_customer_id`, `fk_package_id`) VALUES
(1, '2020-01-10', '10:15:00', 1, 1, 1),
(2, '2020-01-10', '10:15:00', 1, 2, 2),
(3, '2020-02-11', '10:15:00', 1, 1, 3),
(4, '2020-02-11', '10:15:00', 1, 1, 4),
(5, '2020-01-12', '10:15:00', 1, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `emp_first_name` varchar(55) DEFAULT NULL,
  `emp_last_name` varchar(55) DEFAULT NULL,
  `emp_phone_no` int(11) DEFAULT NULL,
  `emp_email` varchar(80) DEFAULT NULL,
  `gander` char(1) DEFAULT NULL,
  `selary` int(11) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `emp_first_name`, `emp_last_name`, `emp_phone_no`, `emp_email`, `gander`, `selary`, `fk_address_id`) VALUES
(1, 'Maylo', 'Mo', 65011111, 'maylo@mail.com', 'm', 2000, 2),
(2, 'Maylo', 'Mo', 65011111, 'maylo@mail.com', 'm', 2000, 4),
(3, 'Maylo', 'Mo', 65011111, 'maylo@mail.com', 'm', 2800, 3),
(4, 'Maylo', 'Mo', 65011111, 'maylo@mail.com', 'm', 2500, 1),
(5, 'Maylo', 'Mo', 65011111, 'maylo@mail.com', 'm', 3000, 5);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `type`, `fk_address_id`) VALUES
(1, 'normal', 1),
(2, 'priority', 2),
(3, 'normal', 3),
(4, 'priority', 3),
(5, 'normal', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pick_up`
--

CREATE TABLE `pick_up` (
  `pick_up_id` int(11) NOT NULL,
  `pick_up_date` date DEFAULT NULL,
  `pick_up_time` time DEFAULT NULL,
  `fk_address_id` int(11) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pick_up`
--

INSERT INTO `pick_up` (`pick_up_id`, `pick_up_date`, `pick_up_time`, `fk_address_id`, `fk_customer_id`, `fk_package_id`) VALUES
(1, '2020-02-10', '11:00:00', 2, 3, 1),
(2, '2020-02-10', '11:00:00', 3, 3, 2),
(3, '2020-02-10', '11:00:00', 4, 3, 3),
(4, '2020-02-10', '11:00:00', 2, 1, 4),
(5, '2020-02-10', '11:00:00', 2, 2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `processing_station`
--

CREATE TABLE `processing_station` (
  `process_id` int(11) NOT NULL,
  `time_received` time DEFAULT NULL,
  `time_deposited` time DEFAULT NULL,
  `date_received` date DEFAULT NULL,
  `date_deposited` date DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `processing_station`
--

INSERT INTO `processing_station` (`process_id`, `time_received`, `time_deposited`, `date_received`, `date_deposited`, `fk_package_id`, `fk_employee_id`) VALUES
(1, '12:00:00', NULL, '2020-02-10', NULL, 2, 2),
(2, '12:00:00', '13:15:00', '2020-02-10', '2020-02-15', 3, 1),
(3, '12:00:00', NULL, '2020-02-10', NULL, 2, 2),
(4, '09:00:00', '13:15:00', '2020-03-10', '2020-03-15', 3, 1),
(5, '13:00:00', '15:15:00', '2020-02-10', '2020-02-15', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `transport_vans`
--

CREATE TABLE `transport_vans` (
  `van_id` int(11) NOT NULL,
  `van_model` varchar(55) DEFAULT NULL,
  `license_no` int(11) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transport_vans`
--

INSERT INTO `transport_vans` (`van_id`, `van_model`, `license_no`, `fk_employee_id`) VALUES
(1, 'Nissan', 11111, 1),
(2, 'Ford', 22222, 2),
(3, 'Mercedes', 33333, 3),
(4, 'BMW', 44444, 4),
(5, 'Nissan', 55555, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `drop_off`
--
ALTER TABLE `drop_off`
  ADD PRIMARY KEY (`drop_off_id`),
  ADD KEY `fk_address_id` (`fk_address_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_address_id` (`fk_address_id`);

--
-- Indexes for table `pick_up`
--
ALTER TABLE `pick_up`
  ADD PRIMARY KEY (`pick_up_id`),
  ADD KEY `fk_address_id` (`fk_address_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_package_id` (`fk_package_id`);

--
-- Indexes for table `processing_station`
--
ALTER TABLE `processing_station`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- Indexes for table `transport_vans`
--
ALTER TABLE `transport_vans`
  ADD PRIMARY KEY (`van_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `drop_off`
--
ALTER TABLE `drop_off`
  MODIFY `drop_off_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pick_up`
--
ALTER TABLE `pick_up`
  MODIFY `pick_up_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `processing_station`
--
ALTER TABLE `processing_station`
  MODIFY `process_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transport_vans`
--
ALTER TABLE `transport_vans`
  MODIFY `van_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `drop_off`
--
ALTER TABLE `drop_off`
  ADD CONSTRAINT `drop_off_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `drop_off_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `drop_off_ibfk_3` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `pick_up`
--
ALTER TABLE `pick_up`
  ADD CONSTRAINT `pick_up_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `pick_up_ibfk_2` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `pick_up_ibfk_3` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints for table `processing_station`
--
ALTER TABLE `processing_station`
  ADD CONSTRAINT `processing_station_ibfk_1` FOREIGN KEY (`fk_package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `processing_station_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);

--
-- Constraints for table `transport_vans`
--
ALTER TABLE `transport_vans`
  ADD CONSTRAINT `transport_vans_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
