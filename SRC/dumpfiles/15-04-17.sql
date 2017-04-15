-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: COMPLAINTS
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `complaints`
--

DROP TABLE IF EXISTS `complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `type` enum('CIVIL','ELECTRICAL','NETWORK','GENERAL') NOT NULL DEFAULT 'GENERAL',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text,
  `status` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `complaintuser_fk` (`username`),
  CONSTRAINT `complaintuser_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaints`
--

LOCK TABLES `complaints` WRITE;
/*!40000 ALTER TABLE `complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_wardens`
--

DROP TABLE IF EXISTS `hostel_wardens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostel_wardens` (
  `hostel_name` varchar(30) NOT NULL,
  `warden_name` varchar(50) NOT NULL,
  KEY `hostelwarden_fk` (`hostel_name`),
  KEY `wardenname_fk` (`warden_name`),
  CONSTRAINT `hostelwarden_fk` FOREIGN KEY (`hostel_name`) REFERENCES `hostels` (`hostel_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wardenname_fk` FOREIGN KEY (`warden_name`) REFERENCES `wardens` (`warden_name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_wardens`
--

LOCK TABLES `hostel_wardens` WRITE;
/*!40000 ALTER TABLE `hostel_wardens` DISABLE KEYS */;
INSERT INTO `hostel_wardens` VALUES ('ASHWATHA BOYS WING','Dr. Sadagopan N'),('ASHWATHA BOYS WING','Dr. Noor Mahammad SK'),('ASHOKA','Dr. Sadagopan N'),('ASHOKA','Dr. Noor Mahammad SK'),('ASHWATHA GIRLS WING','Dr. Umarani Jayaraman');
/*!40000 ALTER TABLE `hostel_wardens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostels`
--

DROP TABLE IF EXISTS `hostels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hostels` (
  `hostel_name` varchar(30) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  PRIMARY KEY (`hostel_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostels`
--

LOCK TABLES `hostels` WRITE;
/*!40000 ALTER TABLE `hostels` DISABLE KEYS */;
INSERT INTO `hostels` VALUES ('ASHOKA','M'),('ASHWATHA BOYS WING','M'),('ASHWATHA GIRLS WING','F');
/*!40000 ALTER TABLE `hostels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lost_found`
--

DROP TABLE IF EXISTS `lost_found`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lost_found` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `lost_or_found` enum('LOST','FOUND') NOT NULL,
  `username` varchar(50) NOT NULL,
  `item_title` varchar(100) NOT NULL,
  `description` text,
  `lf_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `lf_location` varchar(100) DEFAULT NULL,
  `item_photo` varchar(100) DEFAULT NULL,
  `contact_person` varchar(70) NOT NULL,
  `contact_email` varchar(70) DEFAULT NULL,
  `contact_no` char(15) DEFAULT NULL,
  `status` enum('OPEN','CLOSED') NOT NULL DEFAULT 'OPEN',
  PRIMARY KEY (`item_id`),
  KEY `userlf_fk` (`username`),
  CONSTRAINT `userlf_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lost_found`
--

LOCK TABLES `lost_found` WRITE;
/*!40000 ALTER TABLE `lost_found` DISABLE KEYS */;
/*!40000 ALTER TABLE `lost_found` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `private_complaints`
--

DROP TABLE IF EXISTS `private_complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `private_complaints` (
  `complaint_id` int(11) NOT NULL,
  `roll_no` char(9) NOT NULL,
  `c_roomno` int(4) NOT NULL,
  `c_hostel` varchar(30) NOT NULL,
  `freetime` datetime DEFAULT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `pvtcomrollno_fk` (`roll_no`),
  KEY `pvtcomhostel_fk` (`c_hostel`),
  CONSTRAINT `pvtcomhostel_fk` FOREIGN KEY (`c_hostel`) REFERENCES `hostels` (`hostel_name`) ON DELETE CASCADE,
  CONSTRAINT `pvtcomplaint_fk` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`complaint_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pvtcomrollno_fk` FOREIGN KEY (`roll_no`) REFERENCES `students` (`roll_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_complaints`
--

LOCK TABLES `private_complaints` WRITE;
/*!40000 ALTER TABLE `private_complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `private_complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_complaints`
--

DROP TABLE IF EXISTS `public_complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_complaints` (
  `complaint_id` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `upvotes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`complaint_id`),
  CONSTRAINT `pubcomplaint_fk` FOREIGN KEY (`complaint_id`) REFERENCES `complaints` (`complaint_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_complaints`
--

LOCK TABLES `public_complaints` WRITE;
/*!40000 ALTER TABLE `public_complaints` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `roll_no` char(9) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `contact_no` char(15) DEFAULT NULL,
  `room_no` int(4) DEFAULT NULL,
  `hostel_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`roll_no`),
  KEY `studentuser_fk` (`username`),
  KEY `studenthostel_fk` (`hostel_name`),
  CONSTRAINT `studenthostel_fk` FOREIGN KEY (`hostel_name`) REFERENCES `hostels` (`hostel_name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `studentuser_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES ('ced15i002','ced15i002@iiitdm.ac.in','Mukesh','R','9566182018',1516,'ASHWATHA BOYS WING'),('ced15i003','ced15i003@iiitdm.ac.in','Krishna','Sri','9176541397',1517,'ASHWATHA BOYS WING'),('ced15i021','ced15i021@iiitdm.ac.in','Anmol','Gupta','7358613761',1519,'ASHWATHA BOYS WING'),('esd15i004','esd15i004@iiitdm.ac.in','Saravana','Balaji',NULL,614,'ASHOKA');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` blob NOT NULL,
  `privileges` enum('STUDENT','CIVIL TECHNICIAN','ELECTRICAL TECHNICIAN','NETWORK TECHNICIAN','ENGINEER','SYSTEM INCHARGE','TEACHER','ADMIN','GUEST') NOT NULL DEFAULT 'GUEST',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('ced15i002@iiitdm.ac.in','j;çE\Õ\›\Z=\„8L\◊\"\‘!Ü','STUDENT'),('ced15i003@iiitdm.ac.in','j;çE\Õ\›\Z=\„8L\◊\"\‘!Ü','STUDENT'),('ced15i021@iiitdm.ac.in','j;çE\Õ\›\Z=\„8L\◊\"\‘!Ü','STUDENT'),('esd15i004@iiitdm.ac.in','j;çE\Õ\›\Z=\„8L\◊\"\‘!Ü','STUDENT'),('noor@iiitdm.ac.in','j;çE\Õ\›\Z=\„8L\◊\"\‘!Ü','SYSTEM INCHARGE'),('sadagopan@iiitdm.ac.in','j;çE\Õ\›\Z=\„8L\◊\"\‘!Ü','SYSTEM INCHARGE'),('sivaselvanb@iiitdm.ac.in','j;çE\Õ\›\Z=\„8L\◊\"\‘!Ü','TEACHER'),('umarani@iiitdm.ac.in','j;çE\Õ\›\Z=\„8L\◊\"\‘!Ü','TEACHER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wardens`
--

DROP TABLE IF EXISTS `wardens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wardens` (
  `warden_name` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `warden_phone` char(15) DEFAULT NULL,
  PRIMARY KEY (`warden_name`),
  KEY `wardenuser_fk` (`username`),
  CONSTRAINT `wardenuser_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wardens`
--

LOCK TABLES `wardens` WRITE;
/*!40000 ALTER TABLE `wardens` DISABLE KEYS */;
INSERT INTO `wardens` VALUES ('Dr. Noor Mahammad SK','noor@iiitdm.ac.in','+91-44-27476349'),('Dr. Sadagopan N','sadagopan@iiitdm.ac.in','+91-44-27476350'),('Dr. Umarani Jayaraman','umarani@iiitdm.ac.in','+91-44-27476361');
/*!40000 ALTER TABLE `wardens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-15 10:31:57
