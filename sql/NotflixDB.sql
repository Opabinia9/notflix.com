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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugrep`
--

LOCK TABLES `bugrep` WRITE;
/*!40000 ALTER TABLE `bugrep` DISABLE KEYS */;
INSERT INTO `bugrep` VALUES (1,23,'I am the bug','2025-03-04 01:40:37');
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
INSERT INTO `episode` VALUES (1,1,1,'?','?',0,'http://notflix.com'),(1,1,2,'?','?',0,'http://notflix.com'),(1,1,3,'?','?',0,'http://notflix.com'),(1,1,4,'?','?',0,'http://notflix.com'),(1,1,5,'?','?',0,'http://notflix.com'),(1,1,6,'?','?',0,'http://notflix.com'),(1,1,7,'?','?',0,'http://notflix.com'),(1,1,8,'I Wanna Be Bobby\'s Girl','21m',0,'http://notflix.com'),(1,1,9,'Watching the Detectives','22m',0,'http://notflix.com'),(1,1,10,'Look What They\'ve Done To My Song','22m',1,'http://notflix.com'),(1,1,11,'Whiter Shade Of Pale','22m',1,'http://notflix.com'),(1,1,12,'Emotional Rescue','21m',1,'http://notflix.com'),(1,1,13,'The Green, Green Grass Of Home','21m',1,'http://notflix.com'),(1,1,14,'The Lion Sleeps Tonight','21m',1,'http://notflix.com'),(1,1,15,'When A Man Loves A Woman','21m',1,'http://notflix.com'),(1,1,16,'Beast Of Burden','21m',1,'http://notflix.com'),(2,2,1,'When She Was Bad','45m',0,'http://notflix.com'),(2,2,2,'Some Assembly Required','44m',0,'http://notflix.com'),(2,2,3,'School Hard','44m',0,'http://notflix.com'),(2,2,4,'Inca Mummy Girl','44m',0,'http://notflix.com'),(2,2,5,'Reptile Boy','44m',0,'http://notflix.com'),(2,2,6,'Halloween','44m',0,'http://notflix.com'),(2,2,7,'Lie to Me','45m',0,'http://notflix.com'),(2,2,8,'The Dark Age','45m',0,'http://notflix.com'),(2,2,9,'What\'s My Line?: Part 1','1h',0,'http://notflix.com'),(2,2,11,'Ted','45m',0,'http://notflix.com'),(2,2,12,'Bad Eggs','1h',0,'http://notflix.com'),(2,2,13,'Surprise','1h',0,'http://notflix.com'),(2,2,14,'Innocence','1h',0,'http://notflix.com'),(2,2,15,'Phases','1h',0,'http://notflix.com'),(2,2,16,'Bewitched, Bothered and Bewildered','1h',0,'http://notflix.com/videos/san114/Series/BTVS/2-16.mp4'),(2,2,17,'Passion','1h',1,'http://notflix.com/videos/san114/Series/BTVS/2-17.mp4'),(2,2,18,'Killed by Death','1h',1,'http://notflix.com/videos/san114/Series/BTVS/2-18.mp4'),(2,2,19,'I Only Have Eyes for You','1h',1,'http://notflix.com/videos/san114/Series/BTVS/2-19.mp4'),(2,2,20,'Go Fish','1h',1,'http://notflix.com/videos/san114/Series/BTVS/2-20.mp4'),(2,2,21,'Becoming: Part 1','1h',1,'http://notflix.com/videos/san114/Series/BTVS/2-21.mp4'),(2,2,22,'Becoming: Part 2','44m',1,'http://notflix.com/videos/san114/Series/BTVS/2-22.mp4'),(3,1,1,'Pilot','44m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-1.mp4'),(3,1,2,'Lucifer, Stay. Good Devil.','44m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-2.mp4'),(3,1,3,'The Would-Be Prince of Darkness','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-3.mp4'),(3,1,4,'Manly Whatnots','42m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-4.mp4'),(3,1,5,'Sweet Kicks','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-5.mp4'),(3,1,6,'Favorite Son','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-6.mp4'),(3,1,7,'Wingman','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-7.mp4'),(3,1,8,'Et Tu, Doctor?','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-8.mp4'),(3,1,9,'A Priest Walks Into a Bar','42m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-9.mp4'),(3,1,10,'Pops','44m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-10.mp4'),(3,1,11,'St. Lucifer','44m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-11.mp4'),(3,1,12,'#TeamLucifer','44m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-12.mp4'),(3,1,13,'Take Me Back to Hell','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/1-13.mp4'),(3,2,1,'Everything\'s Coming Up Lucifer','44m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-1.mp4'),(3,2,2,'Liar, Liar, Slutty Dress on Fire','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-2.mp4'),(3,2,3,'Sin-Eater','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-3.mp4'),(3,2,4,'Lady Parts','42m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-4.mp4'),(3,2,5,'Weaponizer','44m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-5.mp4'),(3,2,6,'Monster','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-6.mp4'),(3,2,7,'My Little Monkey','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-7.mp4'),(3,2,8,'Trip to Stabby Town','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-8.mp4'),(3,2,9,'Homewrecker','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-9.mp4'),(3,2,10,'Quid Pro Ho','44m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-10.mp4'),(3,2,11,'Stewardess Interruptus','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-11.mp4'),(3,2,12,'Love Handles','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-12.mp4'),(3,2,13,'A Good Day to Die','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-13.mp4'),(3,2,14,'Candy Morningstar','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-14.mp4'),(3,2,15,'Deceptive Little Parasite','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-15.mp4'),(3,2,16,'God Johnson','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-16.mp4'),(3,2,17,'Sympathy for the Goddess','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-17.mp4'),(3,2,18,'The Good, the Bad, and the Crispy','43m',0,'http://notflix.com/videos/san114/Series/Lucifer/2-18.mp4'),(3,4,1,'Everything\'s Okay','49m',0,'http://notflix.com/videos/san114/Series/Lucifer/4-01.mp4'),(3,4,2,'Somebody\'s Been Reading Dante\'s Inferno','50m',0,'http://notflix.com/videos/san114/Series/Lucifer/4-02.mp4'),(3,4,3,'O, Ye of Little Faith, Father','49m',0,'http://notflix.com/videos/san114/Series/Lucifer/4-03.mp4'),(3,4,4,'All About Eve','49m',1,'http://notflix.com/videos/san114/Series/Lucifer/4-04.mp4'),(3,4,5,'Expire Erect','50m',1,'http://notflix.com/videos/san114/Series/Lucifer/4-05.mp4'),(3,4,6,'Orgy Pants to Work','50m',1,'http://notflix.com/videos/san114/Series/Lucifer/4-06.mp4'),(3,4,7,'Devil Is as Devil Does','48m',1,'http://notflix.com/videos/san114/Series/Lucifer/4-07.mp4'),(3,4,9,'Save Lucifer','50m',1,'http://notflix.com/videos/san114/Series/Lucifer/4-09.mp4'),(3,4,10,'Who\'s da New King of Hell?','55m',1,'http://notflix.com/videos/san114/Series/Lucifer/4-10.mp4');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `features`
--

LOCK TABLES `features` WRITE;
/*!40000 ALTER TABLE `features` DISABLE KEYS */;
INSERT INTO `features` VALUES (1,23,'Yaoi on the homepage','2025-03-04 01:40:56'),(2,24,'Nyan Cat HoloGraphic jumpscares','2025-03-04 01:47:30');
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
INSERT INTO `media` VALUES (1,'All Together Now','One-time Rock\'n\'Roll star Bobby Rivers discovers he has 15-year-old twins when his former lover dies',1991,'25m',4,0,'http://notflix.com/imgs/Shows/alltogethernow.jpg'),(2,'Buffy the Vampire Slayer','A young woman, destined to slay vampires, demons and other infernal creatures, deals with her life f',1997,'44m',7,1,'http://notflix.com/imgs/Shows/BTVS.jpg'),(3,'Lucifer','Lucifer Morningstar has decided he\'s had enough of being the dutiful servant in Hell and decides to ',2016,'45m',6,1,'http://notflix.com/imgs/Shows/lucifer.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (1,23,'Your mum','2025-03-04 01:40:21'),(2,24,'How To Train your epilectic brother\r\n\r\nwww.epilepsyawareness.com','2025-03-04 01:46:43');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (23,'Ali-cat','$2y$10$HyI/A0nQKlxwNWFSGM7ktOVNci4cZ2XYGBs6q1nnfnhMpy.iqvxcm','2025-03-04',_binary '¢¼W©¾…}\Ã\Ðuž\Í'),(24,'PoigusJoigus','$2y$10$qMEocr3bCloP3SNqQbZnC.7Y1tRHzcXRrwzWID.l6kOxMGd6C0XjK','2025-03-04',_binary '\\”\ä¦üMN\ç£%%x\\o'),(25,'Orik','$2y$10$I6sg8y6zT9kPvv2r..OKiu.ElI.GHcMRQTEY3FK2x5N8xTgDuUcIC','2025-03-04',_binary '_+*s3Bz/£H¬´ø\à');
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
INSERT INTO `watchlist` VALUES (25,2,2,16,'00:43:46');
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

-- Dump completed on 2025-03-07  8:02:19
