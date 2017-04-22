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
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `type` enum('CIVIL','ELECTRICAL','NETWORK','GENERAL') NOT NULL DEFAULT 'GENERAL',
  `roll_no` char(9) NOT NULL,
  `c_roomno` int(4) NOT NULL,
  `c_hostel` varchar(30) NOT NULL,
  `freetime` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`complaint_id`),
  KEY `pvtcomplaintuser_fk` (`username`),
  KEY `pvtcomrollno_fk` (`roll_no`),
  KEY `pvtcomhostel_fk` (`c_hostel`),
  CONSTRAINT `pvtcomhostel_fk` FOREIGN KEY (`c_hostel`) REFERENCES `hostels` (`hostel_name`) ON DELETE CASCADE,
  CONSTRAINT `pvtcomplaintuser_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pvtcomrollno_fk` FOREIGN KEY (`roll_no`) REFERENCES `students` (`roll_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `private_complaints`
--

LOCK TABLES `private_complaints` WRITE;
/*!40000 ALTER TABLE `private_complaints` DISABLE KEYS */;
INSERT INTO `private_complaints` VALUES (8,'ced15i001@iiitdm.ac.in','CIVIL','ced15i001',1515,'ASHWATHA BOYS WING',NULL,'2017-04-23 00:52:11','2017-04-23 01:05:25','Door glass broken','REDRESSED'),(9,'ced15i002@iiitdm.ac.in','ELECTRICAL','ced15i003',1517,'ASHWATHA BOYS WING',NULL,'2017-04-23 00:52:49','2017-04-23 00:52:49','Tube light not working','TECHNICIAN'),(10,'esd15i004@iiitdm.ac.in','NETWORK','esd15i004',614,'ASHOKA',NULL,'2017-04-23 00:53:28','2017-04-23 00:53:28','Network port broken','TECHNICIAN'),(11,'ced15i007@iiitdm.ac.in','CIVIL','ced15i021',601,'ASHOKA',NULL,'2017-04-23 00:54:40','2017-04-23 01:05:25','Bed legs are loose and shaky','REDRESSED'),(12,'evd15i019@iiitdm.ac.in','GENERAL','evd15i019',626,'ASHOKA',NULL,'2017-04-23 00:55:28','2017-04-23 00:55:28','The hostel bay is noisy at night hours','TECHNICIAN'),(13,'ced15i005@iiitdm.ac.in','NETWORK','ced15i040',1522,'ASHWATHA BOYS WING',NULL,'2017-04-23 00:56:18','2017-04-23 00:56:18','Educational Sites also blocked by fortigate','TECHNICIAN'),(14,'ced15i040@iiitdm.ac.in','NETWORK','ced15i040',218,'ASHOKA',NULL,'2017-04-23 00:57:01','2017-04-23 01:05:25','Internet very slow. Lags while playing DOTA','REDRESSED'),(15,'ced15i021@iiitdm.ac.in','ELECTRICAL','ced15i021',1519,'ASHWATHA BOYS WING',NULL,'2017-04-23 00:58:42','2017-04-23 00:58:42','Fan making a lot of noise','TECHNICIAN'),(16,'ced15i004@iiitdm.ac.in','ELECTRICAL','ced15i004',1518,'ASHWATHA BOYS WING',NULL,'2017-04-23 01:00:08','2017-04-23 01:00:08','My room switch in MCB trips very frequently','TECHNICIAN'),(17,'ced15i004@iiitdm.ac.in','ELECTRICAL','ced15i005',1521,'ASHWATHA BOYS WING',NULL,'2017-04-23 01:02:11','2017-04-23 01:02:11','Voltage Fluctation destroying my devices','TECHNICIAN'),(18,'ced15i003@iiitdm.ac.in','CIVIL','ced15i003',1517,'ASHWATHA BOYS WING',NULL,'2017-04-23 01:03:12','2017-04-23 01:03:12','Room Stopper installed not functioning properly','TECHNICIAN');
/*!40000 ALTER TABLE `private_complaints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_complaints`
--

DROP TABLE IF EXISTS `public_complaints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_complaints` (
  `complaint_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `type` enum('CIVIL','ELECTRICAL','NETWORK','GENERAL') NOT NULL DEFAULT 'GENERAL',
  `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text,
  `status` varchar(30) NOT NULL,
  `location` varchar(100) NOT NULL,
  `upvotes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`complaint_id`),
  KEY `pubcomplaintuser_fk` (`username`),
  CONSTRAINT `pubcomplaintuser_fk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE SET NULL ON UPDATE CASCADE
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
  UNIQUE KEY `username` (`username`),
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
INSERT INTO `students` VALUES ('ced15i001','ced15i001@iiitdm.ac.in','Pranay','Ankit','+91-89821-40522',1515,'ASHWATHA BOYS WING'),('ced15i002','ced15i002@iiitdm.ac.in','Mukesh','R','9566182018',1516,'ASHWATHA BOYS WING'),('ced15i003','ced15i003@iiitdm.ac.in','Krishna','Sri','9176541397',1517,'ASHWATHA BOYS WING'),('ced15i004','ced15i004@iiitdm.ac.in','Lakshmi','Narasimhan',NULL,1518,'ASHWATHA BOYS WING'),('ced15i005','ced15i005@iiitdm.ac.in','Mugundhan','K','+91 94874 13025',1522,'ASHWATHA BOYS WING'),('ced15i007','ced15i007@iiitdm.ac.in','Govind','K P','9789273408',1523,'ASHWATHA BOYS WING'),('ced15i015','ced15i015@iiitdm.ac.in','Viraj','Sonatkar','+91 9566-018619',1528,'ASHWATHA BOYS WING'),('ced15i021','ced15i021@iiitdm.ac.in','Anmol','Gupta','7358613761',1519,'ASHWATHA BOYS WING'),('ced15i040','ced15i040@iiitdm.ac.in','Akash','V','+91 98848 45868',218,'ASHOKA'),('esd15i004','esd15i004@iiitdm.ac.in','Saravana','Balaji',NULL,614,'ASHOKA'),('evd15i019','evd15i019@iiitdm.ac.in','Harish','Manikandan','94 44 984040',626,'ASHOKA');
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
INSERT INTO `users` VALUES ('ced15i001@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','STUDENT'),('ced15i002@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','STUDENT'),('ced15i003@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','STUDENT'),('ced15i004@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','STUDENT'),('ced15i005@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','STUDENT'),('ced15i007@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','STUDENT'),('ced15i015@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','STUDENT'),('ced15i021@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','STUDENT'),('ced15i040@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','STUDENT'),('esd15i004@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','STUDENT'),('evd15i019@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','STUDENT'),('noor@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','SYSTEM INCHARGE'),('sadagopan@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','SYSTEM INCHARGE'),('sivaselvanb@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','SYSTEM INCHARGE'),('umarani@iiitdm.ac.in','*C6778092DF76FD0C175620916D9AB169B0F581B7','TEACHER');
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
  UNIQUE KEY `username` (`username`),
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

-- Dump completed on 2017-04-23  1:19:08
