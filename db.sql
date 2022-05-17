-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2022 at 12:39 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctor_appointment`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(11) NOT NULL,
  `admin_email_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `admin_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `admin_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hospital_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hospital_address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `hospital_contact_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hospital_logo` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`admin_id`, `admin_email_address`, `admin_password`, `admin_name`, `hospital_name`, `hospital_address`, `hospital_contact_no`, `hospital_logo`) VALUES
(1, 'johnsmith@gmail.com', 'password', 'John smith', 'MU', '115, Last Lane, NYC', '741287410', '../images/239684540.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_table`
--

CREATE TABLE `appointment_table` (
  `appointment_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_schedule_id` int(11) NOT NULL,
  `appointment_number` int(11) NOT NULL,
  `reason_for_appointment` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `appointment_time` time NOT NULL,
  `status` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `patient_come_into_hospital` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL,
  `doctor_comment` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `appointment_table`
--

INSERT INTO `appointment_table` (`appointment_id`, `doctor_id`, `patient_id`, `doctor_schedule_id`, `appointment_number`, `reason_for_appointment`, `appointment_time`, `status`, `patient_come_into_hospital`, `doctor_comment`) VALUES
(3, 1, 3, 2, 1000, 'discuss', '09:00:00', 'Cancel', 'No', ''),
(4, 1, 3, 2, 1001, 'discusss', '09:00:00', 'Cancel', 'No', ''),
(5, 1, 4, 2, 1002, 'discuss problem', '09:30:00', 'Completed', 'Yes', 'ok done'),
(6, 5, 3, 7, 1003, 'discuss personal issu', '18:00:00', 'In Process', 'Yes', ''),
(7, 6, 5, 13, 1004, 'discuss issu', '15:30:00', 'Completed', 'Yes', 'ok done'),
(8, 4, 3, 15, 1005, 'discusss', '14:28:00', 'In Process', 'Yes', ''),
(9, 6, 3, 16, 1006, 'course discuss', '22:12:00', 'Booked', 'No', ''),
(10, 7, 3, 17, 1007, 'class discuss', '23:00:00', 'Completed', 'Yes', 'ok done'),
(11, 8, 17, 21, 1008, 'CN course discuss', '04:18:00', 'Booked', 'No', ''),
(12, 8, 3, 21, 1009, 'math discuss', '04:33:00', 'Booked', 'No', ''),
(13, 6, 3, 22, 1010, 'mathh dicuss', '06:35:00', 'Booked', 'No', ''),
(14, 9, 17, 23, 1011, 'CN discusss', '10:52:00', 'Completed', 'Yes', 'oK done'),
(15, 5, 4, 20, 1012, 'discuss', '02:39:00', 'In Process', 'Yes', ''),
(16, 10, 17, 25, 1013, 'CN discuss', '10:30:00', 'Completed', 'Yes', 'discuss complete'),
(17, 11, 17, 26, 1014, 'CN discuss', '09:23:00', 'Completed', 'Yes', 'OK done'),
(18, 12, 17, 27, 1015, 'CN discuss', '09:35:00', 'Completed', 'Yes', 'ok done'),
(19, 6, 17, 24, 1016, 'math problem slove', '06:22:00', 'Cancel', 'No', ''),
(20, 2, 17, 28, 1017, 'Algo discuss', '10:00:00', 'Cancel', 'No', ''),
(21, 2, 3, 28, 1018, 'algo', '10:20:00', 'Booked', 'No', ''),
(22, 13, 17, 30, 1019, 'CN discuss', '09:00:00', 'Completed', 'Yes', 'ok done'),
(23, 13, 17, 31, 1020, 'jjjjk', '01:52:00', 'Booked', 'No', ''),
(24, 13, 17, 32, 1021, ',kkk', '01:54:00', 'Cancel', 'No', ''),
(25, 13, 3, 32, 1022, 'jjj', '02:24:00', 'Completed', 'Yes', 'ok');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_schedule_table`
--

CREATE TABLE `doctor_schedule_table` (
  `doctor_schedule_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `doctor_schedule_date` date NOT NULL,
  `doctor_schedule_day` enum('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday') COLLATE utf8_unicode_ci NOT NULL,
  `doctor_schedule_start_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_schedule_end_time` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `average_consulting_time` int(5) NOT NULL,
  `doctor_schedule_status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_schedule_table`
--

INSERT INTO `doctor_schedule_table` (`doctor_schedule_id`, `doctor_id`, `doctor_schedule_date`, `doctor_schedule_day`, `doctor_schedule_start_time`, `doctor_schedule_end_time`, `average_consulting_time`, `doctor_schedule_status`) VALUES
(2, 1, '2021-02-19', 'Friday', '09:00', '14:00', 15, 'Active'),
(3, 2, '2021-02-19', 'Friday', '09:00', '12:00', 15, 'Active'),
(4, 5, '2021-02-19', 'Friday', '10:00', '14:00', 10, 'Active'),
(5, 3, '2021-02-19', 'Friday', '13:00', '17:00', 20, 'Active'),
(6, 4, '2021-02-19', 'Friday', '15:00', '18:00', 5, 'Active'),
(7, 5, '2021-02-22', 'Monday', '18:00', '20:00', 10, 'Active'),
(8, 2, '2021-02-24', 'Wednesday', '09:30', '12:30', 10, 'Active'),
(9, 5, '2021-02-24', 'Wednesday', '11:00', '15:00', 10, 'Active'),
(10, 1, '2021-02-24', 'Wednesday', '12:00', '15:00', 10, 'Active'),
(29, 6, '2022-04-27', 'Wednesday', '05:20', '05:50', 30, 'Active'),
(30, 13, '2022-04-25', 'Monday', '09:00', '09:30', 30, 'Active'),
(32, 13, '2022-04-29', 'Friday', '01:54', '09:54', 30, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_table`
--

CREATE TABLE `doctor_table` (
  `doctor_id` int(11) NOT NULL,
  `doctor_email_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_profile_image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_phone_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `doctor_date_of_birth` date NOT NULL,
  `doctor_degree` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_expert_in` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `doctor_status` enum('Active','Inactive') COLLATE utf8_unicode_ci NOT NULL,
  `doctor_added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_table`
--

INSERT INTO `doctor_table` (`doctor_id`, `doctor_email_address`, `doctor_password`, `doctor_name`, `doctor_profile_image`, `doctor_phone_no`, `doctor_address`, `doctor_date_of_birth`, `doctor_degree`, `doctor_expert_in`, `doctor_status`, `doctor_added_on`) VALUES
(1, 'peterparker@gmail.com', 'password', 'Dr. Peter Parker', '../images/10872.jpg', '7539518520', '102, Sky View, NYC', '1985-10-29', 'OS', 'CSE', 'Active', '2021-02-15 17:04:59'),
(2, 'adambrodly@gmail.com', 'password', 'Dr. Adam Broudly', '../images/21336.jpg', '753852963', '105, Fort, NYC', '1982-08-10', 'Algorithom', 'SE', 'Active', '2021-02-18 15:00:32'),
(4, 'williampeterson@gmail.com', 'password', 'Dr. William Peterson', '../images/9498.jpg', '8523698520', '32, Green City, NYC', '1984-06-11', 'ML', 'CS', 'Active', '2021-02-18 15:08:24'),
(5, 'emmalarsdattor@gmail.com', 'password', 'Dr. Emma Larsdattor', '../images/1613641523.png', '9635852025', '25, Silver Arch', '1988-03-03', 'data structure', 'EEE', 'Active', '2021-02-18 15:15:23'),
(6, 'manuel.armstrong@gmail.com', 'password', 'Dr. Manuel Armstrong', '../images/1614081376.png', '8523697410', '2378 Fire Access Road Asheboro, NC 27203', '1989-03-01', 'Math', 'ECE', 'Active', '2021-02-23 17:26:16'),
(13, 'huntercafe69@gmail.com', 'password', 'KL', '../images/468559620.png', '01828828', 'sylhet', '2022-04-26', 'computer network', 'CSE', 'Active', '2022-04-25 23:20:00');

-- --------------------------------------------------------

--
-- Table structure for table `patient_table`
--

CREATE TABLE `patient_table` (
  `patient_id` int(11) NOT NULL,
  `patient_email_address` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `patient_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `patient_first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `patient_last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `patient_date_of_birth` date NOT NULL,
  `patient_gender` enum('Male','Female','Other') COLLATE utf8_unicode_ci NOT NULL,
  `patient_address` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `patient_phone_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `patient_maritial_status` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `patient_added_on` datetime NOT NULL,
  `patient_verification_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email_verify` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient_table`
--

INSERT INTO `patient_table` (`patient_id`, `patient_email_address`, `patient_password`, `patient_first_name`, `patient_last_name`, `patient_date_of_birth`, `patient_gender`, `patient_address`, `patient_phone_no`, `patient_maritial_status`, `patient_added_on`, `patient_verification_code`, `email_verify`) VALUES
(3, 'jacobmartin@gmail.com', 'password', 'Jacob', 'Martin', '2021-02-26', 'Male', 'CS', '85745635210', 'Single', '2021-02-18 16:34:55', 'b1f3f8409f7687072adb1f1b7c22d4b0', 'Yes'),
(4, 'oliviabaker@gmail.com', 'password', 'Olivia', 'Baker', '2001-04-05', 'Female', 'EEE', '7539518520', 'Married', '2021-02-19 18:28:23', '8902e16ef62a556a8e271c9930068fea', 'Yes'),
(5, 'web-tutorial@programmer.net', 'password', 'Amber', 'Anderson', '1995-07-25', 'Female', 'Civil', '75394511442', 'Single', '2021-02-23 17:50:06', '1909d59e254ab7e433d92f014d82ba3d', 'Yes'),
(17, 'jakaw33977@bamibi.com', 'password', 'ROy', 'jk', '2022-04-28', 'Male', 'CSE', '01798737512', 'Single', '2022-04-19 21:24:20', '8555e51fee60591ae6a1fe49a9409556', 'Yes'),
(23, 'huntercafe69@gmail.com', 'password', 'ROy', 'jk', '2022-04-21', 'Male', 'cse', '563253534653', 'Single', '2022-04-24 15:16:15', 'cbf3452b56a3a5176065fbc57a5531a2', 'No'),
(24, 'tidoti4117@richdn.com', 'password', 'ROy', 'L', '2022-05-07', 'Male', 'cse', '98737512', 'Single', '2022-04-24 15:18:23', '0e02d6442700d20d98383dfae161dd27', 'No');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `appointment_table`
--
ALTER TABLE `appointment_table`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `doctor_schedule_table`
--
ALTER TABLE `doctor_schedule_table`
  ADD PRIMARY KEY (`doctor_schedule_id`);

--
-- Indexes for table `doctor_table`
--
ALTER TABLE `doctor_table`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `patient_table`
--
ALTER TABLE `patient_table`
  ADD PRIMARY KEY (`patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment_table`
--
ALTER TABLE `appointment_table`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `doctor_schedule_table`
--
ALTER TABLE `doctor_schedule_table`
  MODIFY `doctor_schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `doctor_table`
--
ALTER TABLE `doctor_table`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `patient_table`
--
ALTER TABLE `patient_table`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
