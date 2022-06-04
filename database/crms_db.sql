-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 01, 2022 at 06:19 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cancel_reports`
--

CREATE TABLE `cancel_reports` (
  `id` int(11) NOT NULL,
  `complainant_id` int(11) NOT NULL,
  `complaint_id` int(11) NOT NULL,
  `cancel_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=Pending, 1=Confirmed',
  `cancel_reason` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancel_reports`
--

INSERT INTO `cancel_reports` (`id`, `complainant_id`, `complaint_id`, `cancel_status`, `cancel_reason`, `date_created`) VALUES
(10, 56, 3, 1, 'both parties are settled', '2022-02-03 13:29:12'),
(21, 56, 10, 1, 'I want to cancel my report\r\n', '2022-02-16 15:45:31'),
(22, 56, 9, 1, 'fgdf', '2022-02-18 17:33:06'),
(23, 56, 9, 1, 'tr', '2022-02-18 18:17:01');

-- --------------------------------------------------------

--
-- Table structure for table `complainants`
--

CREATE TABLE `complainants` (
  `id` int(30) NOT NULL,
  `fname` varchar(200) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `street` varchar(250) NOT NULL,
  `barangay` varchar(200) NOT NULL DEFAULT 'Balasing',
  `municipality` varchar(200) NOT NULL DEFAULT 'Santa Maria',
  `province` varchar(200) NOT NULL DEFAULT 'Bulacan',
  `contact` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=unverified,1=verified',
  `code` mediumint(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `complainant_status` int(4) NOT NULL DEFAULT 1 COMMENT '1 = Active,\r\n2 = Blocked',
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complainants`
--

INSERT INTO `complainants` (`id`, `fname`, `lname`, `age`, `gender`, `address`, `street`, `barangay`, `municipality`, `province`, `contact`, `status`, `code`, `email`, `password`, `complainant_status`, `create_at`) VALUES
(56, 'Deng', 'Hermogenes', 23, '', '234 Blk 13', 'Caybutok', 'Balasing', 'Santa Maria', 'Bulacan', '09551221561', 1, 719222, 'andy3@gmail.com', 'eaeaa54f2b9b7204129f5ce9b0b1e8e7', 1, '2022-01-28 12:38:31'),
(68, 'Jhana ', 'Guevara', 45, 'Bisexual', '33', 'Tabing Ilog', 'Balasing', 'Santa Maria', 'Bulacan', '09562455552', 0, 547917, 'andy35543@gmail.com', 'eaeaa54f2b9b7204129f5ce9b0b1e8e7', 2, '2022-01-31 23:10:13'),
(96, 'Jhana ', 'Gregorio', 33, 'Female', '032', 'Ventura', 'Balasing', 'Santa Maria', 'Bulacan', '09562455552', 1, 0, 'andy1@gmail.com', 'eaeaa54f2b9b7204129f5ce9b0b1e8e7', 1, '2022-02-04 18:15:43'),
(126, 'Jhana ', 'Gregorio', 44, 'Bisexual', '0324', 'Ewong', 'Balasing', 'Santa Maria', 'Bulacan', '09562455552', 0, 553871, 'andy31@gmail.com', 'eaeaa54f2b9b7204129f5ce9b0b1e8e7', 1, '2022-02-20 17:51:24'),
(130, 'Jhana ', 'Gregorio', 7, 'Female', '33', 'Guam', 'Balasing', 'Santa Maria', 'Bulacan', '09562455552', 0, 777230, 'andy553@gmail.com', '392c55c28ebe6765cd0825e59db34aef', 1, '2022-02-20 18:24:28'),
(131, 'Jhana ', 'Gregorio', 7, 'Female', '0324', 'Guam', 'Balasing', 'Santa Maria', 'Bulacan', '09562455552', 1, 0, 'andy123@gmail.com', 'abb918a6d2b0f034444d6d827b91891a', 1, '2022-02-20 18:25:23'),
(140, 'Andrea', 'Hermogenes', 23, 'Female', '3423', 'Paying', 'Balasing', 'Santa Maria', 'Bulacan', '09562455552', 1, 0, 'ashermoegenes03@gmail.com', 'eaeaa54f2b9b7204129f5ce9b0b1e8e7', 1, '2022-02-24 14:01:44');

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `id` int(11) NOT NULL,
  `complainant_id` int(11) NOT NULL,
  `complainant_fname` varchar(255) NOT NULL,
  `complainant_lname` varchar(255) NOT NULL,
  `complainant_contact` int(30) NOT NULL,
  `respondent_fname` varchar(255) NOT NULL,
  `respondent_lname` varchar(255) NOT NULL,
  `complaints_address` text NOT NULL,
  `complaints_street` varchar(255) NOT NULL,
  `complaints_barangay` varchar(200) NOT NULL DEFAULT 'Balasing',
  `complaints_municipality` varchar(200) NOT NULL DEFAULT 'Santa Maria',
  `complaints_province` varchar(200) NOT NULL DEFAULT 'Bulacan',
  `contact_num` varchar(100) NOT NULL,
  `date_happened` datetime NOT NULL,
  `time_of_incident` time(2) NOT NULL,
  `type` text CHARACTER SET utf8 NOT NULL,
  `incident_location` text NOT NULL,
  `incident_street` text NOT NULL,
  `incident_barangay` varchar(200) NOT NULL DEFAULT 'Balasing',
  `incident_municipality` varchar(200) NOT NULL DEFAULT 'Santa Maria',
  `incident_province` varchar(200) NOT NULL DEFAULT 'Bulacan',
  `description` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Pending,2=Received, 3=Action Made, 4=Cased Closed, 5=Cancelled	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints`
--

INSERT INTO `complaints` (`id`, `complainant_id`, `complainant_fname`, `complainant_lname`, `complainant_contact`, `respondent_fname`, `respondent_lname`, `complaints_address`, `complaints_street`, `complaints_barangay`, `complaints_municipality`, `complaints_province`, `contact_num`, `date_happened`, `time_of_incident`, `type`, `incident_location`, `incident_street`, `incident_barangay`, `incident_municipality`, `incident_province`, `description`, `date_created`, `status`) VALUES
(3, 56, 'Anne', 'Hermogenes', 97689670, 'Antonio', 'Galvez', '02546', 'Luwasan', 'Balasing', 'Santa Maria', 'Bulacan', '7757657', '2022-02-16 00:00:00', '12:42:00.00', 'Improper Parking', '0254', 'Tabing Ilog', 'Balasing', 'Santa Maria', 'Bulacan', 'tyrtyrdty', '2022-02-03 00:44:57', 5),
(5, 56, 'Anne', 'Fill', 98665552, 'Hazel', 'Galvez', '02546', 'Castillo', 'Balasing', 'Santa Maria', 'Bulacan', '98526522', '2022-02-03 00:00:00', '23:47:00.00', 'Fraud', '0254', 'Nigro', 'Balasing', 'Santa Maria', 'Bulacan', 'faking of our documents', '2022-02-07 11:48:06', 5),
(14, 139, 'Anne', 'Fill', 2147483647, 'Hazel', 'Galvez', '02546', 'Paying', 'Balasing', 'Santa Maria', 'Bulacan', '09551441367', '2022-02-01 00:00:00', '15:36:00.00', 'Lending (Pagpapautang)', 'near at the 7/11', 'Paying', 'Balasing', 'Santa Maria', 'Bulacan', 'The complainant didnt pay her debt amounting of 20, 0000', '2022-02-24 13:35:26', 5),
(15, 140, 'Andrea', 'Hermogenes', 2147483647, 'Antonio', 'Galvez', '02546', 'Paying', 'Balasing', 'Santa Maria', 'Bulacan', '09551441352', '2022-02-01 00:00:00', '14:04:00.00', 'Lending (Pagpapautang)', '0254', 'Bagong Barrio', 'Balasing', 'Santa Maria', 'Bulacan', 'This person didnt pay his debt amounting 20,000', '2022-02-24 14:04:56', 2);

-- --------------------------------------------------------

--
-- Table structure for table `complaints_action`
--

CREATE TABLE `complaints_action` (
  `id` int(30) NOT NULL,
  `complaint_id` int(30) NOT NULL,
  `responder_id` int(30) NOT NULL,
  `dispatched_by` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,1= confirmed',
  `remarks` text NOT NULL,
  `case_closed` text NOT NULL,
  `cancellation_reason` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints_action`
--

INSERT INTO `complaints_action` (`id`, `complaint_id`, `responder_id`, `dispatched_by`, `status`, `remarks`, `case_closed`, `cancellation_reason`, `date_created`) VALUES
(32, 14, 3, 1, 1, 'the report is cancelled', '', 'the complainant request for the cacellation of report', '2022-02-24 13:41:19'),
(33, 15, 10, 1, 0, '', '', '', '2022-02-24 14:07:46');

-- --------------------------------------------------------

--
-- Table structure for table `complaints_signature`
--

CREATE TABLE `complaints_signature` (
  `id` int(11) NOT NULL,
  `complaint_id` int(11) NOT NULL,
  `signed` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaints_signature`
--

INSERT INTO `complaints_signature` (`id`, `complaint_id`, `signed`) VALUES
(35, 0, 'img/upload/62163e0357246.png'),
(36, 0, 'img/upload/62163e03577c3.png');

-- --------------------------------------------------------

--
-- Table structure for table `crime`
--

CREATE TABLE `crime` (
  `id` int(11) NOT NULL,
  `complainant_id` int(30) NOT NULL,
  `type_of_crime` varchar(255) NOT NULL,
  `crime_street` varchar(255) NOT NULL,
  `crime_barangay` varchar(200) NOT NULL DEFAULT 'Balasing',
  `crime_landmark` varchar(200) NOT NULL,
  `involved_person` text NOT NULL,
  `crime_details` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Pending,2=Received,3= Processing, 4=Action Made, 5=Cased Closed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crime`
--

INSERT INTO `crime` (`id`, `complainant_id`, `type_of_crime`, `crime_street`, `crime_barangay`, `crime_landmark`, `involved_person`, `crime_details`, `date_created`, `status`) VALUES
(61, 53, 'Robbery ', 'Alonzo', 'Balasing', 'After dunkin', 'Man with balck shirt', '', '2022-01-27 22:01:37', 2);

-- --------------------------------------------------------

--
-- Table structure for table `crime_action`
--

CREATE TABLE `crime_action` (
  `id` int(30) NOT NULL,
  `complaint_id` int(30) NOT NULL,
  `responder_id` int(30) NOT NULL,
  `dispatched_by` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,1= confirmed',
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `crime_action`
--

INSERT INTO `crime_action` (`id`, `complaint_id`, `responder_id`, `dispatched_by`, `status`, `remarks`, `date_created`) VALUES
(3, 1, 1, 1, 1, 'sample', '2020-10-30 16:59:00'),
(4, 2, 1, 1, 0, '', '2021-09-10 14:02:51'),
(6, 19, 3, 1, 0, '', '2022-01-24 13:00:18'),
(7, 4, 4, 1, 1, 'ertwe', '2022-01-24 13:00:39'),
(8, 58, 4, 1, 0, '', '2022-01-26 19:55:47'),
(9, 83, 3, 1, 1, 'rtytry', '2022-02-08 23:45:37'),
(10, 61, 5, 1, 0, '', '2022-02-09 00:53:15'),
(11, 89, 1, 1, 1, 'send to the police station', '2022-02-23 21:19:05'),
(12, 85, 1, 1, 0, '', '2022-02-23 21:20:31');

-- --------------------------------------------------------

--
-- Table structure for table `missing`
--

CREATE TABLE `missing` (
  `id` int(11) NOT NULL,
  `complainant_id` int(11) NOT NULL,
  `missing_fname` varchar(255) NOT NULL,
  `missing_lname` varchar(255) NOT NULL,
  `missing_age` int(20) NOT NULL,
  `missing_gender` varchar(250) NOT NULL,
  `date_happened` date NOT NULL,
  `missing_address` varchar(255) NOT NULL,
  `physical_description` text NOT NULL,
  `missing_cloth` text NOT NULL,
  `informer_fname` varchar(255) NOT NULL,
  `informer_lname` varchar(255) NOT NULL,
  `contact_number` varchar(200) NOT NULL,
  `missing_image` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Pending,2=Received,3= Processing, 4=Action Made, 5=Cased Closed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `missing`
--

INSERT INTO `missing` (`id`, `complainant_id`, `missing_fname`, `missing_lname`, `missing_age`, `missing_gender`, `date_happened`, `missing_address`, `physical_description`, `missing_cloth`, `informer_fname`, `informer_lname`, `contact_number`, `missing_image`, `date_created`, `status`) VALUES
(18, 56, 'yrty', 'yrtyr', 66, 'Female', '2021-12-30', 'gffg', 'yrt', 'ryrt', 'yrt', 'rtre', '98521455', '1643474580_received_270173227243461.jpeg', '2022-01-30 00:43:49', 3),
(20, 56, 'Andong', 'Maranca', 22, 'Female', '2022-02-04', 'Cityland', 'maliit', 'black shirt', 'Aljhune', 'Alcober', '09551441387', '1644217320_Screenshot (1).png', '2022-02-07 15:02:19', 1);

-- --------------------------------------------------------

--
-- Table structure for table `missing_action`
--

CREATE TABLE `missing_action` (
  `id` int(30) NOT NULL,
  `complaint_id` int(30) NOT NULL,
  `responder_id` int(30) NOT NULL,
  `dispatched_by` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=pending,1= confirmed',
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `missing_action`
--

INSERT INTO `missing_action` (`id`, `complaint_id`, `responder_id`, `dispatched_by`, `status`, `remarks`, `date_created`) VALUES
(5, 108, 4, 1, 0, '', '2022-01-24 13:09:43'),
(6, 18, 9, 1, 1, 'settled', '2022-02-09 16:51:05'),
(7, 22, 1, 1, 0, '', '2022-02-09 18:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `responders_team`
--

CREATE TABLE `responders_team` (
  `id` int(30) NOT NULL,
  `station_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `availability` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `responders_team`
--

INSERT INTO `responders_team` (`id`, `station_id`, `name`, `availability`) VALUES
(1, 2, 'R-101', 1),
(3, 1, 'Balasing responder', 0),
(5, 2, 'Balasing 101', 0),
(6, 1, 'Balasing Rescue Team', 1),
(7, 2, 'Balasing Rescue Team', 0),
(8, 2, 'Barangay Balasing', 0),
(9, 1, 'Missing Person', 1),
(10, 2, 'Barangay Tanod', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stations`
--

CREATE TABLE `stations` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stations`
--

INSERT INTO `stations` (`id`, `name`, `address`, `date_created`) VALUES
(1, 'Station 101', 'Station 1 Address', '2020-10-30 10:56:25'),
(2, 'Station 2', 'Station 2 Address', '2020-10-30 10:56:43');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`) VALUES
(1, 'Bullseye', 'barangaybalasing09@gmail.com', '+6917 1047 682');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `user_fname` varchar(255) NOT NULL,
  `user_lname` varchar(255) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff',
  `user_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1= "Active", 2= "Deactive"'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_fname`, `user_lname`, `username`, `password`, `type`, `user_status`) VALUES
(1, 'Admin', '', 'admin', '0192023a7bbd73250516f069df18b500', 1, 1),
(22, 'Andrea', 'Hermogenes', 'clerk_01', '1c42f9c1ca2f65441465b43cd9339d6c', 2, 1),
(23, 'Andrea', 'Hermogenes', 'andeng12', '1c42f9c1ca2f65441465b43cd9339d6c', 2, 2),
(24, 'Precious', 'Jose', 'precious_09', 'eaeaa54f2b9b7204129f5ce9b0b1e8e7', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cancel_reports`
--
ALTER TABLE `cancel_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complainants`
--
ALTER TABLE `complainants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints_action`
--
ALTER TABLE `complaints_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaints_signature`
--
ALTER TABLE `complaints_signature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crime`
--
ALTER TABLE `crime`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `crime_action`
--
ALTER TABLE `crime_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `missing`
--
ALTER TABLE `missing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `missing_action`
--
ALTER TABLE `missing_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `responders_team`
--
ALTER TABLE `responders_team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stations`
--
ALTER TABLE `stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
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
-- AUTO_INCREMENT for table `cancel_reports`
--
ALTER TABLE `cancel_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `complainants`
--
ALTER TABLE `complainants`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `complaints`
--
ALTER TABLE `complaints`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `complaints_action`
--
ALTER TABLE `complaints_action`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `complaints_signature`
--
ALTER TABLE `complaints_signature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `crime`
--
ALTER TABLE `crime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `crime_action`
--
ALTER TABLE `crime_action`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `missing`
--
ALTER TABLE `missing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `missing_action`
--
ALTER TABLE `missing_action`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `responders_team`
--
ALTER TABLE `responders_team`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stations`
--
ALTER TABLE `stations`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
