-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 01, 2019 at 11:34 PM
-- Server version: 5.7.26-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-8+ubuntu16.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `traveline`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `booking_detail`
--

CREATE TABLE `booking_detail` (
  `pnr_no` int(10) NOT NULL,
  `master_pid` int(15) NOT NULL,
  `route_id` int(15) NOT NULL,
  `journey_date` date NOT NULL,
  `total_fare` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus_details`
--

CREATE TABLE `bus_details` (
  `bus_no` varchar(15) NOT NULL,
  `bus_name` varchar(20) NOT NULL,
  `bus_type` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `total_seats` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus_route`
--

CREATE TABLE `bus_route` (
  `route_id` int(10) NOT NULL,
  `loc_from` varchar(50) NOT NULL,
  `loc_to` varchar(50) NOT NULL,
  `distance` int(10) NOT NULL,
  `fare` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bus_schedule`
--

CREATE TABLE `bus_schedule` (
  `s_id` int(10) NOT NULL,
  `fk_bus_routeid` int(10) NOT NULL,
  `fk_bus_regno` varchar(30) NOT NULL,
  `arrival_time` time(5) NOT NULL,
  `depart_time` time(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `card_detail`
--

CREATE TABLE `card_detail` (
  `fk_paymt_id` int(10) NOT NULL,
  `card_hold_name` varchar(30) NOT NULL,
  `card_no` bigint(20) NOT NULL,
  `cvv` int(5) NOT NULL,
  `expiry_date` date NOT NULL,
  `amount` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `cust_id` int(10) NOT NULL,
  `id` int(11) NOT NULL,
  `query_type` varchar(50) NOT NULL,
  `query_message` varchar(200) NOT NULL,
  `query_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback` int(10) NOT NULL,
  `passenger_name` varchar(50) NOT NULL,
  `passenger_email` varchar(50) NOT NULL,
  `comment` varchar(150) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `route_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='customer feedback table that is associated with bus';

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `g_bus_no` varchar(10) NOT NULL,
  `img_location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='gallery for bus';

-- --------------------------------------------------------

--
-- Table structure for table `identity`
--

CREATE TABLE `identity` (
  `identity_id` int(10) NOT NULL,
  `identity_type` varchar(20) NOT NULL,
  `identity_detail` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `passenger_contact`
--

CREATE TABLE `passenger_contact` (
  `passenger_id` int(11) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_email` varchar(50) DEFAULT NULL,
  `p_contact` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='master passenger having contact detail of passenger';

-- --------------------------------------------------------

--
-- Table structure for table `passenger_detail`
--

CREATE TABLE `passenger_detail` (
  `id` int(11) NOT NULL,
  `mst_psg_id` int(10) NOT NULL,
  `passenger_name` varchar(30) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(5) NOT NULL,
  `seat_no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_detail`
--

CREATE TABLE `payment_detail` (
  `payment_id` int(11) NOT NULL,
  `pmt_pnr_no` int(15) NOT NULL,
  `total_amount` int(10) NOT NULL,
  `payment_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD PRIMARY KEY (`pnr_no`),
  ADD KEY `master_pid` (`master_pid`);

--
-- Indexes for table `bus_details`
--
ALTER TABLE `bus_details`
  ADD PRIMARY KEY (`bus_no`);

--
-- Indexes for table `bus_route`
--
ALTER TABLE `bus_route`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `bus_schedule`
--
ALTER TABLE `bus_schedule`
  ADD PRIMARY KEY (`s_id`),
  ADD KEY `fk_bus_routeid` (`fk_bus_routeid`),
  ADD KEY `fk_bus_regno` (`fk_bus_regno`);

--
-- Indexes for table `card_detail`
--
ALTER TABLE `card_detail`
  ADD KEY `fk_paymt_id` (`fk_paymt_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cust_id` (`cust_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD KEY `g_bus_no` (`g_bus_no`);

--
-- Indexes for table `identity`
--
ALTER TABLE `identity`
  ADD KEY `identity_id` (`identity_id`);

--
-- Indexes for table `passenger_contact`
--
ALTER TABLE `passenger_contact`
  ADD PRIMARY KEY (`passenger_id`);

--
-- Indexes for table `passenger_detail`
--
ALTER TABLE `passenger_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mst_psg_id` (`mst_psg_id`);

--
-- Indexes for table `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `pmt_pnr_no` (`pmt_pnr_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `booking_detail`
--
ALTER TABLE `booking_detail`
  MODIFY `pnr_no` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bus_route`
--
ALTER TABLE `bus_route`
  MODIFY `route_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bus_schedule`
--
ALTER TABLE `bus_schedule`
  MODIFY `s_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `passenger_contact`
--
ALTER TABLE `passenger_contact`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `passenger_detail`
--
ALTER TABLE `passenger_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `payment_detail`
--
ALTER TABLE `payment_detail`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD CONSTRAINT `booking_detail_ibfk_1` FOREIGN KEY (`master_pid`) REFERENCES `passenger_contact` (`passenger_id`);

--
-- Constraints for table `bus_schedule`
--
ALTER TABLE `bus_schedule`
  ADD CONSTRAINT `bus_schedule_ibfk_1` FOREIGN KEY (`fk_bus_routeid`) REFERENCES `bus_route` (`route_id`),
  ADD CONSTRAINT `bus_schedule_ibfk_2` FOREIGN KEY (`fk_bus_regno`) REFERENCES `bus_details` (`bus_no`);

--
-- Constraints for table `card_detail`
--
ALTER TABLE `card_detail`
  ADD CONSTRAINT `card_detail_ibfk_1` FOREIGN KEY (`fk_paymt_id`) REFERENCES `payment_detail` (`payment_id`);

--
-- Constraints for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD CONSTRAINT `contact_us_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `passenger_contact` (`passenger_id`);

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`g_bus_no`) REFERENCES `bus_details` (`bus_no`);

--
-- Constraints for table `identity`
--
ALTER TABLE `identity`
  ADD CONSTRAINT `identity_ibfk_1` FOREIGN KEY (`identity_id`) REFERENCES `passenger_contact` (`passenger_id`);

--
-- Constraints for table `passenger_detail`
--
ALTER TABLE `passenger_detail`
  ADD CONSTRAINT `passenger_detail_ibfk_1` FOREIGN KEY (`mst_psg_id`) REFERENCES `passenger_contact` (`passenger_id`);

--
-- Constraints for table `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD CONSTRAINT `payment_detail_ibfk_1` FOREIGN KEY (`pmt_pnr_no`) REFERENCES `booking_detail` (`pnr_no`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
