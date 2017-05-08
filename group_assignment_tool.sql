-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 28, 2017 at 05:28 AM
-- Server version: 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `group_assignment_tool`
--

-- --------------------------------------------------------

--
-- Table structure for table `app`
--

CREATE TABLE IF NOT EXISTS `app` (
  `app_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `token` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `app`
--

INSERT INTO `app` (`app_id`, `name`, `token`) VALUES
(1, 'Slack', ''),
(2, 'Bugzilla', ''),
(3, 'TEST', '');

-- --------------------------------------------------------

--
-- Table structure for table `app_group`
--

CREATE TABLE IF NOT EXISTS `app_group` (
  `app_id` smallint(5) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`app_id`,`group_id`),
  KEY `app_group_ibfk_2` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_group`
--

INSERT INTO `app_group` (`app_id`, `group_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `employee_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`email`),
  UNIQUE KEY `empl_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `email`, `first_name`, `last_name`) VALUES
(70, 'chad@gmail.com', 'Chad', 'Chadders'),
(1, 'elgandara@csumb.edu', 'Eliasar', 'Gandara');

-- --------------------------------------------------------

--
-- Table structure for table `employee_role`
--

CREATE TABLE IF NOT EXISTS `employee_role` (
  `employee_id` smallint(5) unsigned NOT NULL,
  `role_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_role`
--

INSERT INTO `employee_role` (`employee_id`, `role_id`) VALUES
(1, 3),
(1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `app_group_id` text NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`group_id`, `name`, `app_group_id`) VALUES
(1, 'Sales', 'S4GCVAMFS'),
(2, 'Engineers', 'S4GSUKDDJ');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `name`, `description`) VALUES
(3, 'Marketing', 'Manages communication with the customers.'),
(4, 'Developer', 'A general developer.');

-- --------------------------------------------------------

--
-- Table structure for table `role_group`
--

CREATE TABLE IF NOT EXISTS `role_group` (
  `role_id` smallint(5) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`group_id`),
  KEY `role_group_ibfk_2` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `first_name`, `last_name`, `username`, `password`, `is_admin`) VALUES
(3, 'elgandara@csumb.edu', 'Eliasar', 'Gandara', 'eliasar', 'pbkdf2:sha1:1000$IachQ8D5$7f5da8ff633b1cfecefc0690b08e64239be3fe30', 1);

(4, 'sdubuke@csumb.edu', 'Stephan', 'Dubuke', 'thedirtyham', 'pbkdf2:sha1:1000$HTxqTke1$e2e85f0fac6f4987e6b704f9cf33395928c7058e', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_group`
--
ALTER TABLE `app_group`
  ADD CONSTRAINT `app_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `app_group_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_role`
--
ALTER TABLE `employee_role`
  ADD CONSTRAINT `employee_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_role_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_group`
--
ALTER TABLE `role_group`
  ADD CONSTRAINT `role_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_group_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
