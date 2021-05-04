CREATE DATABASE  IF NOT EXISTS `proj_schema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proj_schema`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proj_schema
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` varchar(5) NOT NULL DEFAULT 'B0001',
  `street` varchar(25) NOT NULL,
  `city` varchar(20) NOT NULL,
  `zip` int NOT NULL,
  PRIMARY KEY (`branch_id`),
  UNIQUE KEY `idbranch_UNIQUE` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES ('B0001','892 Poppy Lane','Houston',77526),('B0002','845 Country Road','Denver',89456),('B0004','007 Bond Avenue','London',23568);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `branch_BEFORE_INSERT` BEFORE INSERT ON `branch` FOR EACH ROW BEGIN
IF (length(new.branch_id) < 5 ) THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Error: Branch ID must be between "B0001" and "B9999".';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `branch_BEFORE_UPDATE` BEFORE UPDATE ON `branch` FOR EACH ROW BEGIN
IF (length(new.branch_id) < 5 ) THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Error: Branch ID must be between "B0001" and "B9999".';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `checkings`
--

DROP TABLE IF EXISTS `checkings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checkings` (
  `cAccountNum` int NOT NULL,
  `currentBalance` decimal(10,2) NOT NULL,
  `client_id` varchar(6) NOT NULL,
  PRIMARY KEY (`cAccountNum`),
  UNIQUE KEY `idcheckings_UNIQUE` (`cAccountNum`),
  KEY `check_clientid_idx` (`client_id`),
  CONSTRAINT `check_clientid` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkings`
--

LOCK TABLES `checkings` WRITE;
/*!40000 ALTER TABLE `checkings` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `client_id` varchar(6) NOT NULL,
  `f_name` varchar(16) NOT NULL,
  `l_name` varchar(20) NOT NULL,
  `branch_id` varchar(6) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `idclient_UNIQUE` (`client_id`),
  KEY `branch_id_idx` (`branch_id`),
  CONSTRAINT `c_branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card` (
  `cCardNum` int NOT NULL,
  `creditLimit` int NOT NULL,
  `interestRate` decimal(5,2) NOT NULL,
  `currentBalance` decimal(7,2) NOT NULL,
  `client_id` varchar(6) NOT NULL,
  PRIMARY KEY (`cCardNum`),
  UNIQUE KEY `idcredit_card_UNIQUE` (`cCardNum`),
  KEY `credit_clientid_idx` (`client_id`),
  CONSTRAINT `credit_clientid` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debit_card`
--

DROP TABLE IF EXISTS `debit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `debit_card` (
  `dCardNum` int NOT NULL,
  `cAccountNum` int NOT NULL,
  PRIMARY KEY (`dCardNum`),
  UNIQUE KEY `iddebit_card_UNIQUE` (`dCardNum`),
  KEY `debit_checkings_idx` (`cAccountNum`),
  CONSTRAINT `debit_checkings` FOREIGN KEY (`cAccountNum`) REFERENCES `checkings` (`cAccountNum`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debit_card`
--

LOCK TABLES `debit_card` WRITE;
/*!40000 ALTER TABLE `debit_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `debit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `savings`
--

DROP TABLE IF EXISTS `savings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `savings` (
  `sAccountNum` int NOT NULL,
  `dollarAmount` decimal(8,2) NOT NULL,
  `interestRate` float NOT NULL,
  `client_id` varchar(6) NOT NULL,
  PRIMARY KEY (`sAccountNum`),
  UNIQUE KEY `idsavings_UNIQUE` (`sAccountNum`),
  KEY `saving_clientid_idx` (`client_id`),
  CONSTRAINT `saving_clientid` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `savings`
--

LOCK TABLES `savings` WRITE;
/*!40000 ALTER TABLE `savings` DISABLE KEYS */;
/*!40000 ALTER TABLE `savings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` varchar(6) NOT NULL,
  `position` varchar(8) NOT NULL DEFAULT 'Employee',
  `f_name` varchar(16) NOT NULL,
  `l_name` varchar(20) NOT NULL,
  `street` varchar(25) NOT NULL,
  `city` varchar(20) NOT NULL,
  `zip` varchar(5) NOT NULL,
  `salary` float(8,2) NOT NULL,
  `branch_id` varchar(6) NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `idstaff_UNIQUE` (`staff_id`),
  KEY `branch_id_idx` (`branch_id`),
  CONSTRAINT `branch_id` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('125HE9','Employee','Pete','Davis','92 Mossy Tree Lane','Moscat','74331',12000.00,'B0001'),('15O91','Manager','Erica','Ericson','761 Feels Good Blvd','Saintsbury','89115',102000.00,'B0002'),('78999A','Employee','Amanda','Manners','401 Pepe Way','Devilsburg','89696',11500.00,'B0002'),('984F95','Manager','Bob','Brown','3845 Neighbor Way','Moscat','74332',92000.00,'B0001'),('98XC19','Employee','Shelly','Cooper','87 Giant Berry Road','Mosdog','74112',12500.00,'B0001');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `staff_BEFORE_INSERT` BEFORE INSERT ON `staff` FOR EACH ROW BEGIN
IF (new.position != 'Manager' AND  new.position != 'Employee') THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Error: position must be either "Manager" or "Employee".';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `staff_BEFORE_UPDATE` BEFORE UPDATE ON `staff` FOR EACH ROW BEGIN
IF (new.position != 'Manager' AND  new.position != 'Employee') THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'Error: position must be either "Manager" or "Employee".';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'proj_schema'
--

--
-- Dumping routines for database 'proj_schema'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-03 20:40:01
