-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 20, 2025 at 05:23 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cryptosystem`
--
CREATE DATABASE IF NOT EXISTS `cryptosystem` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cryptosystem`;

-- --------------------------------------------------------

--
-- Table structure for table `filerequest`
--

CREATE TABLE IF NOT EXISTS `filerequest` (
  `SNo` int(11) NOT NULL,
  `FileId` int(11) NOT NULL,
  `FileName` varchar(65) NOT NULL,
  `OwnerId` varchar(50) NOT NULL,
  `RequestedUser` varchar(50) NOT NULL,
  `PublicKey_Owner` varchar(18) NOT NULL,
  `PrivateKey_User` varchar(18) NOT NULL,
  `RequestDate` date NOT NULL,
  `Status` varchar(18) NOT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `filerequest`
--

INSERT INTO `filerequest` (`SNo`, `FileId`, `FileName`, `OwnerId`, `RequestedUser`, `PublicKey_Owner`, `PrivateKey_User`, `RequestDate`, `Status`) VALUES
(1, 1, 'ayyappan.jpg', 'amsasi', 'priyaa', '6681', 'f945e14b', '2025-03-18', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE IF NOT EXISTS `owner` (
  `Name` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `Age` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `MailId` varchar(50) NOT NULL,
  `MobileNo` varchar(15) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `RegDate` date NOT NULL,
  `PublicKey` varchar(15) NOT NULL,
  `PrivateKey` varchar(15) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`Name`, `Gender`, `DOB`, `Age`, `Address`, `MailId`, `MobileNo`, `UserId`, `Password`, `RegDate`, `PublicKey`, `PrivateKey`) VALUES
('SasiKumar.A.M', 'Male', '1978-06-22', 43, 'Mudhaliar St,\r\nThiruvedagam,\r\nMadurai Dt.', 'amsasi78@gmail.com', '9842168547', 'amsasi', 'sasirani', '2025-03-17', '6681', '7b2ad2'),
('HariniSasi', 'Female', '2010-10-16', 11, 'Mudhaliar St,\r\nThiruvedagam,\r\nMadurai Dt.', 'harini@gmail.com', '9842168547', 'harini', 'sasirani', '2025-03-17', '1984', '19fe2565');

-- --------------------------------------------------------

--
-- Table structure for table `ownerrequest`
--

CREATE TABLE IF NOT EXISTS `ownerrequest` (
  `SNo` int(11) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `OwnerId` varchar(50) NOT NULL,
  `RequestDate` date NOT NULL,
  `PublicKey_Owner` varchar(18) NOT NULL,
  `Status` varchar(18) NOT NULL,
  PRIMARY KEY (`SNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ownerrequest`
--

INSERT INTO `ownerrequest` (`SNo`, `UserId`, `OwnerId`, `RequestDate`, `PublicKey_Owner`, `Status`) VALUES
(1, 'priyaa', 'amsasi', '2025-03-17', '6681', 'Accepted'),
(2, 'priyaa', 'harini', '2025-03-17', '1984', 'Accepted'),
(3, 'rani', 'harini', '2025-03-17', '1984', 'Accepted');

-- --------------------------------------------------------

--
-- Table structure for table `uploadfile`
--

CREATE TABLE IF NOT EXISTS `uploadfile` (
  `FileId` int(11) NOT NULL,
  `FileName` varchar(50) NOT NULL,
  `FileKey` varchar(18) NOT NULL,
  `UploadDate` date NOT NULL,
  `OwnerId` varchar(50) NOT NULL,
  PRIMARY KEY (`FileId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uploadfile`
--

INSERT INTO `uploadfile` (`FileId`, `FileName`, `FileKey`, `UploadDate`, `OwnerId`) VALUES
(1, 'ayyappan.jpg', '7b2ad2', '2025-03-17', 'amsasi'),
(2, 'j2ee.ppt', '7b2ad2', '2025-03-17', 'amsasi'),
(3, 'python.pdf', '19fe2565', '2025-03-17', 'harini'),
(4, 'javanotes.txt', '19fe2565', '2025-03-17', 'harini');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `Name` varchar(50) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `DOB` date NOT NULL,
  `Age` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `MailId` varchar(50) NOT NULL,
  `MobileNo` varchar(15) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `RegDate` date NOT NULL,
  `PublicKey` varchar(15) NOT NULL,
  `PrivateKey` varchar(15) NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Name`, `Gender`, `DOB`, `Age`, `Address`, `MailId`, `MobileNo`, `UserId`, `Password`, `RegDate`, `PublicKey`, `PrivateKey`) VALUES
('PriyaaSasi', 'Female', '2009-05-04', 12, 'Mudhaliar St,\r\nThiruedagam,\r\nMadurai Dt.', 'priyaasasi@gmail.com', '9842168547', 'priyaa', 'sasirani', '2025-03-17', '0104', 'f945e14b'),
('RaniSasi', 'Female', '1987-03-25', 34, 'Mudhaliar St,\r\nThiruvedagam,\r\nMadurai Dt', 'ranisasi@gmail.com', '9994567890', 'rani', 'sasirani', '2025-03-17', '9180', 'b423defc');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
