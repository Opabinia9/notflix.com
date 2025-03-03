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
  CONSTRAINT `bugrep_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugrep`
--

LOCK TABLES `bugrep` WRITE;
/*!40000 ALTER TABLE `bugrep` DISABLE KEYS */;
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
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`SeriesID`) REFERENCES `media` (`SeriesID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `URL` varchar(255) DEFAULT 'http://notflix.com',
  PRIMARY KEY (`SeriesID`,`SeasonID`,`EpisodeID`),
  KEY `SeasonID` (`SeasonID`),
  KEY `watchlist_ibfk_4` (`EpisodeID`),
  CONSTRAINT `Episode_ibfk_1` FOREIGN KEY (`SeriesID`) REFERENCES `media` (`SeriesID`) ON DELETE CASCADE,
  CONSTRAINT `Episode_ibfk_2` FOREIGN KEY (`SeasonID`) REFERENCES `season` (`SeasonID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (1,1,1,'?','?',0,'http://notflix.com/videos/san114/Series/AllTogetherNow/S1E10.mp4'),(1,1,2,'?','?',0,'http://notflix.com/videos/san114/Series/AllTogetherNow/S1E10.mp4'),(1,1,3,'?','?',0,'http://notflix.com/videos/san114/Series/AllTogetherNow/S1E10.mp4'),(1,1,4,'?','?',0,'http://notflix.com/videos/san114/Series/AllTogetherNow/S1E10.mp4'),(1,1,5,'?','?',0,'http://notflix.com/videos/san114/Series/AllTogetherNow/S1E10.mp4'),(1,1,6,'?','?',0,'http://notflix.com/videos/san114/Series/AllTogetherNow/S1E10.mp4'),(1,1,7,'?','?',0,'http://notflix.com/videos/san114/Series/AllTogetherNow/S1E10.mp4'),(1,1,8,'I Wanna Be Bobby\'s Girl','21m',0,'http://notflix.com/videos/san114/Series/AllTogetherNow/S1E10.mp4'),(1,1,9,'Watching the Detectives','22m',0,'http://notflix.com/videos/san114/Series/AllTogetherNow/S1E10.mp4'),(1,1,10,'Look What They\'ve Done To My Song','22m',1,'http://notflix.com/'),(1,1,11,'Whiter Shade Of Pale','22m',1,'http://notflix.com/'),(1,1,12,'Emotional Rescue','21m',1,'http://notflix.com/'),(1,1,13,'The Green, Green Grass Of Home','21m',1,'http://notflix.com/'),(1,1,14,'The Lion Sleeps Tonight','21m',1,'http://notflix.com/'),(1,1,15,'When A Man Loves A Woman','21m',1,'http://notflix.com/'),(1,1,16,'Beast Of Burden','21m',1,'http://notflix.com/');
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
  CONSTRAINT `features_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'All Together Now','One-time Rock\'n\'Roll star Bobby Rivers discovers he has 15-year-old twins when his former lover dies',1991,'25m',4,1,'http://notflix.com/imgs/Shows/alltogethernow.jpg'),(2,'Buffy the Vampire Slayer','A young woman, destined to slay vampires, demons and other infernal creatures, deals with her life f',1997,'44m',7,1,'http://notflix.com/imgs/Shows/BTVS.jpg'),(3,'Lucifer','Lucifer Morningstar has decided he\'s had enough of being the dutiful servant in Hell and decides to ',2016,'45m',6,1,'http://notflix.com/imgs/Shows/lucifer.jpg');
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
  CONSTRAINT `requests_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
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
  CONSTRAINT `Season_ibfk_1` FOREIGN KEY (`seriesID`) REFERENCES `media` (`SeriesID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES (1,1,21),(1,2,23),(1,3,26),(1,4,31),(2,1,12),(2,2,22),(2,3,22),(2,4,22),(2,5,22),(2,6,22),(2,7,22),(3,1,13),(3,2,18),(3,3,26),(3,4,10),(3,5,16),(3,6,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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
  CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `users` (`AccountID`) ON DELETE CASCADE,
  CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`SeriesID`) REFERENCES `episode` (`SeriesID`) ON DELETE CASCADE,
  CONSTRAINT `watchlist_ibfk_3` FOREIGN KEY (`SeasonID`) REFERENCES `episode` (`SeasonID`) ON DELETE CASCADE,
  CONSTRAINT `watchlist_ibfk_4` FOREIGN KEY (`EpisodeID`) REFERENCES `episode` (`EpisodeID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
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

-- Dump completed on 2025-03-03 20:03:57
