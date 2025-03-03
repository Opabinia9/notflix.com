-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: notflixdb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `bugrep`
--

DROP TABLE IF EXISTS `bugrep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bugrep` (
  `BID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int DEFAULT NULL,
  `Bug` varchar(300) DEFAULT NULL,
  `ReportDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`BID`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `bugrep_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugrep`
--

LOCK TABLES `bugrep` WRITE;
/*!40000 ALTER TABLE `bugrep` DISABLE KEYS */;
INSERT INTO `bugrep` VALUES (1,2,'error\r\n','2025-03-02 22:32:32');
/*!40000 ALTER TABLE `bugrep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `CID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `SeriesID` int NOT NULL,
  `Content` varchar(300) DEFAULT NULL,
  `PostDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`CID`),
  KEY `comments_ibfk_1` (`AccountID`),
  KEY `comments_ibfk_2` (`SeriesID`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`),
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`SeriesID`) REFERENCES `media` (`SeriesID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `episode` (
  `SeriesID` int NOT NULL,
  `SeasonID` int NOT NULL,
  `EpisodeID` int NOT NULL,
  `EpisodeTitle` varchar(50) DEFAULT NULL,
  `Length` varchar(7) DEFAULT NULL,
  `Available` tinyint(1) DEFAULT '0',
  `URL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SeriesID`,`SeasonID`,`EpisodeID`),
  KEY `SeasonID` (`SeasonID`),
  KEY `watchlist_ibfk_4` (`EpisodeID`),
  CONSTRAINT `Episode_ibfk_1` FOREIGN KEY (`SeriesID`) REFERENCES `media` (`SeriesID`),
  CONSTRAINT `Episode_ibfk_2` FOREIGN KEY (`SeasonID`) REFERENCES `season` (`SeasonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,0,1,'testmovie','1h 24m',1,'http://notflix.com/videos/examplemovie.mp4'),(2,0,1,'a second movie','0h 0m',1,'http://notflix.com/'),(3,1,1,'the fisrt episode','45m',1,'http://notflix.com/videos/S1E1.mp4'),(3,1,2,'episode 2','45m',1,NULL),(3,1,3,'and another','45m',1,NULL),(3,1,4,'end','45m',1,NULL),(3,2,1,'welcome to season 2','45m',1,NULL),(3,2,2,'it continue','45m',1,'http://notflix.com/videos/S1E1.mp4'),(3,2,3,'almost done','45m',1,NULL),(3,2,4,'the end','45m',1,NULL);
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `features`
--

DROP TABLE IF EXISTS `features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `features` (
  `FID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int DEFAULT NULL,
  `Feature` varchar(300) DEFAULT NULL,
  `RequestDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`FID`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `features_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES (1,2,NULL,'2025-03-02 22:20:36'),(2,2,NULL,'2025-03-02 22:22:11'),(3,2,'vcdsz','2025-03-02 22:23:16'),(4,2,'bvcxz','2025-03-02 22:23:32');
/*!40000 ALTER TABLE `features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `SeriesID` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `ReleaseYear` int DEFAULT NULL,
  `Length` varchar(7) DEFAULT NULL,
  `NOS` int DEFAULT '0',
  `Available` tinyint(1) DEFAULT '0',
  `Poster` varchar(255) DEFAULT 'http://notflix.com/imgs/default.jpg',
  PRIMARY KEY (`SeriesID`),
  CONSTRAINT `media_chk_1` CHECK ((`NOS` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'testmovie','this is a desc',1993,'1h 24m',0,1,'http://notflix.com/imgs/xfiles.jpg'),(2,'a second movie','a movie that is a sequl to the not aclaimed \"testmovie\"',2024,'0h 0m',0,1,'http://notflix.com/imgs/default.jpg'),(3,'the series','the spin off series of the underaarated testmovie series',2025,'99h 99m',2,1,'http://notflix.com/imgs/show.jpg');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `RID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int DEFAULT NULL,
  `Request` varchar(300) DEFAULT NULL,
  `RequestDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`RID`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,2,'sad','2025-03-02 21:30:12'),(2,2,'hello','2025-03-02 22:03:06'),(3,2,'and another\r\n','2025-03-02 22:03:18'),(4,2,'test again','2025-03-02 22:06:39');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `seriesID` int NOT NULL,
  `SeasonID` int NOT NULL,
  `NOE` int DEFAULT NULL,
  PRIMARY KEY (`seriesID`,`SeasonID`),
  KEY `idx_seasonid` (`SeasonID`),
  CONSTRAINT `Season_ibfk_1` FOREIGN KEY (`seriesID`) REFERENCES `media` (`SeriesID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,0,1),(2,0,1),(3,1,4),(3,2,4);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `Username` varchar(20) NOT NULL,
  `Password_hash` varchar(255) DEFAULT NULL,
  `DateCreated` date DEFAULT NULL,
  `Salt` varbinary(16) DEFAULT NULL,
  PRIMARY KEY (`AccountID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'seb','$2y$12$GeFQG3gDGUXYhREh/ClrIelaim/zv5Ivezbi5Mp146Irgg4AF9CZG','2025-02-28',_binary '\Â)toô1\ÃEh∫N_òπΩ'),(3,'newac','$2y$12$aRDeyZgjC31YeMuHd2A5deczV16ZtIxW9RGcuPo7LC2SJ1QVAFG2.','2025-03-02',_binary 'ˇ:Fåó\Ê5ù	\"∑\‚');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlist` (
  `AccountID` int NOT NULL,
  `SeriesID` int NOT NULL,
  `SeasonID` int NOT NULL,
  `EpisodeID` int NOT NULL,
  `Time_code` time DEFAULT '00:00:00',
  PRIMARY KEY (`AccountID`,`SeriesID`),
  KEY `SeriesID` (`SeriesID`),
  KEY `SeasonID` (`SeasonID`),
  KEY `EpisodeID` (`EpisodeID`),
  CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`),
  CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`SeriesID`) REFERENCES `episode` (`SeriesID`),
  CONSTRAINT `watchlist_ibfk_3` FOREIGN KEY (`SeasonID`) REFERENCES `episode` (`SeasonID`),
  CONSTRAINT `watchlist_ibfk_4` FOREIGN KEY (`EpisodeID`) REFERENCES `episode` (`EpisodeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
INSERT INTO `watchlist` VALUES (2,1,0,1,'00:00:10'),(2,3,1,1,'00:00:58');
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-03 11:21:07
