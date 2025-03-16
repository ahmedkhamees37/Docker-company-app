-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 02, 2020 at 09:59 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `company`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `DEPTNO` int(11) NOT NULL,
  `DEPTNAME` varchar(150) DEFAULT NULL,
  `LOCATION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`DEPTNO`),
  UNIQUE KEY `DEPTNAME` (`DEPTNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--


-- --------------------------------------------------------

--
-- Stand-in structure for view `department_data`
--
CREATE TABLE IF NOT EXISTS `department_data` (
`DEPARTMENT_NO` int(11)
,`DEPARTMENT` varchar(150)
,`LOCATION` varchar(100)
);
-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `EMPNO` int(11) NOT NULL,
  `EMPNAME` varchar(120) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `SALARY` double DEFAULT NULL,
  `HIRINGDATE` date DEFAULT NULL,
  `BIRTHDATE` date DEFAULT NULL,
  `DEPTNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`EMPNO`),
  UNIQUE KEY `EMPNAME` (`EMPNAME`),
  KEY `DEPTNO` (`DEPTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--


-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_data`
--
CREATE TABLE IF NOT EXISTS `employee_data` (
`NUMBER` int(11)
,`NAME` varchar(120)
,`ADDRESS` varchar(200)
,`SALARY` double
,`HIRING_DATE` date
,`DATE_OF_BIRTH` date
,`DEPARTMENT_NO` int(11)
,`DEPARTMENT` varchar(150)
);
-- --------------------------------------------------------

--
-- Table structure for table `employee_phones`
--

CREATE TABLE IF NOT EXISTS `employee_phones` (
  `EMPNO` int(11) NOT NULL DEFAULT '0',
  `PHONE` varchar(55) NOT NULL DEFAULT '',
  PRIMARY KEY (`EMPNO`,`PHONE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_phones`
--


-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_phones_data`
--
CREATE TABLE IF NOT EXISTS `employee_phones_data` (
`EMPLOYEE_NO` int(11)
,`EMPLOYEE_NAME` varchar(120)
,`PHONE` varchar(55)
);
-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE IF NOT EXISTS `project` (
  `PROJECTNO` int(11) NOT NULL,
  `PROJECTNAME` varchar(150) DEFAULT NULL,
  `LOCATION` varchar(100) DEFAULT NULL,
  `DEPTNO` int(11) DEFAULT NULL,
  PRIMARY KEY (`PROJECTNO`),
  UNIQUE KEY `PROJECTNAME` (`PROJECTNAME`),
  KEY `DEPTNO` (`DEPTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project`
--


-- --------------------------------------------------------

--
-- Stand-in structure for view `project_data`
--
CREATE TABLE IF NOT EXISTS `project_data` (
`PROJECT_NO` int(11)
,`PROJECT_NAME` varchar(150)
,`LOCATION` varchar(100)
,`DEPARTMENT_NO` int(11)
,`DEPARTMENT` varchar(150)
);
-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `pass`) VALUES
('a', 'a');

-- --------------------------------------------------------

--
-- Table structure for table `workon`
--

CREATE TABLE IF NOT EXISTS `workon` (
  `EMPNO` int(11) NOT NULL DEFAULT '0',
  `PROJECTNO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`EMPNO`,`PROJECTNO`),
  KEY `PROJECTNO` (`PROJECTNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `workon`
--


-- --------------------------------------------------------

--
-- Stand-in structure for view `workon_data`
--
CREATE TABLE IF NOT EXISTS `workon_data` (
`EMPLOYEE_NO` int(11)
,`EMPLOYEE_NAME` varchar(120)
,`PROJECT_NO` int(11)
,`PROJECT_NAME` varchar(150)
);
-- --------------------------------------------------------

--
-- Structure for view `department_data`
--
DROP TABLE IF EXISTS `department_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `department_data` AS select `department`.`DEPTNO` AS `DEPARTMENT_NO`,`department`.`DEPTNAME` AS `DEPARTMENT`,`department`.`LOCATION` AS `LOCATION` from `department`;

-- --------------------------------------------------------

--
-- Structure for view `employee_data`
--
DROP TABLE IF EXISTS `employee_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_data` AS select `employee`.`EMPNO` AS `NUMBER`,`employee`.`EMPNAME` AS `NAME`,`employee`.`ADDRESS` AS `ADDRESS`,`employee`.`SALARY` AS `SALARY`,`employee`.`HIRINGDATE` AS `HIRING_DATE`,`employee`.`BIRTHDATE` AS `DATE_OF_BIRTH`,`employee`.`DEPTNO` AS `DEPARTMENT_NO`,`department`.`DEPTNAME` AS `DEPARTMENT` from (`employee` join `department`) where (`employee`.`DEPTNO` = `department`.`DEPTNO`);

-- --------------------------------------------------------

--
-- Structure for view `employee_phones_data`
--
DROP TABLE IF EXISTS `employee_phones_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_phones_data` AS select `employee`.`EMPNO` AS `EMPLOYEE_NO`,`employee`.`EMPNAME` AS `EMPLOYEE_NAME`,`employee_phones`.`PHONE` AS `PHONE` from (`employee` join `employee_phones`) where (`employee`.`EMPNO` = `employee_phones`.`EMPNO`);

-- --------------------------------------------------------

--
-- Structure for view `project_data`
--
DROP TABLE IF EXISTS `project_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `project_data` AS select `project`.`PROJECTNO` AS `PROJECT_NO`,`project`.`PROJECTNAME` AS `PROJECT_NAME`,`project`.`LOCATION` AS `LOCATION`,`project`.`DEPTNO` AS `DEPARTMENT_NO`,`department`.`DEPTNAME` AS `DEPARTMENT` from (`project` join `department`) where (`project`.`DEPTNO` = `department`.`DEPTNO`);

-- --------------------------------------------------------

--
-- Structure for view `workon_data`
--
DROP TABLE IF EXISTS `workon_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `workon_data` AS select `workon`.`EMPNO` AS `EMPLOYEE_NO`,`employee`.`EMPNAME` AS `EMPLOYEE_NAME`,`workon`.`PROJECTNO` AS `PROJECT_NO`,`project`.`PROJECTNAME` AS `PROJECT_NAME` from ((`workon` join `employee`) join `project`) where ((`workon`.`EMPNO` = `employee`.`EMPNO`) and (`workon`.`PROJECTNO` = `project`.`PROJECTNO`));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DEPTNO`) REFERENCES `department` (`DEPTNO`);

--
-- Constraints for table `employee_phones`
--
ALTER TABLE `employee_phones`
  ADD CONSTRAINT `employee_phones_ibfk_1` FOREIGN KEY (`EMPNO`) REFERENCES `employee` (`EMPNO`);

--
-- Constraints for table `project`
--
ALTER TABLE `project`
  ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`DEPTNO`) REFERENCES `department` (`DEPTNO`);

--
-- Constraints for table `workon`
--
ALTER TABLE `workon`
  ADD CONSTRAINT `workon_ibfk_1` FOREIGN KEY (`EMPNO`) REFERENCES `employee` (`EMPNO`),
  ADD CONSTRAINT `workon_ibfk_2` FOREIGN KEY (`PROJECTNO`) REFERENCES `project` (`PROJECTNO`);
