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
INSERT INTO `episode` VALUES (1,1,1,'Daddy Cool','22m',0,'http://notflix.com'),(1,1,2,'Substitute','21m',0,'http://notflix.com'),(1,1,3,'Born to Be Wild','21m',0,'http://notflix.com'),(1,1,4,'I Hate the Music','22m',0,'http://notflix.com'),(1,1,5,'Look What They\'ve Done to My Song','22m',0,'http://notflix.com'),(1,1,6,'Are You Lonesome Tonight?','21m',0,'http://notflix.com'),(1,1,7,'I Wanna Be Bobby\'s Girl','21m',0,'http://notflix.com'),(1,1,8,'Whiter Shade of Pale','21m',0,'http://notflix.com'),(1,1,9,'You\'ve Got a Friend','21m',0,'http://notflix.com'),(1,1,10,'G.L.O.R.I.A.','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-10.mp4'),(1,1,11,'Watching the Detectives','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-11.mp4'),(1,1,12,'Emotional Rescue','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-12.mp4'),(1,1,13,'The Green, Green Grass Of Home','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-13.mp4'),(1,1,14,'The Lion Sleeps Tonight','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-14.mp4'),(1,1,15,'When A Man Loves A Woman','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-15.mp4'),(1,1,16,'Beast Of Burden','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-16.mp4'),(1,1,17,'This Old Heart of Mine','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-17.mp4'),(1,1,18,'Chanson D\'Amour','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-18.mp4'),(1,1,19,'Yesterday\'s Hero','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-19.mp4'),(1,1,20,'Paperback Writer','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-20.mp4'),(1,1,21,'The Great Pretender','21m',1,'http://notflix.com/videos/san114/Series/AllTogetherNow/1-21.mp4'),(1,2,1,'Tonight\'s the Night','21m',0,'http://notflix.com'),(1,2,2,'Summer Holiday','21m',0,'http://notflix.com'),(1,2,3,'Call Me','21m',0,'http://notflix.com'),(1,2,4,'Help Me Make It Through the Night','21m',0,'http://notflix.com'),(1,2,5,'American Pie','21m',0,'http://notflix.com'),(1,2,6,'My Way','21m',0,'http://notflix.com'),(1,2,7,'All My Friends Are Getting Married','21m',0,'http://notflix.com'),(1,2,8,'Money for Nothing','21m',0,'http://notflix.com'),(1,2,9,'The Two of Us','21m',0,'http://notflix.com'),(1,2,10,'Twisting by the Pool','21m',0,'http://notflix.com'),(1,2,11,'Would I Lie to You','21m',0,'http://notflix.com'),(1,2,12,'Money Changes Everything','21m',0,'http://notflix.com'),(1,2,13,'Dream Lover','21m',0,'http://notflix.com'),(1,2,14,'Bat Out of Hell','21m',0,'http://notflix.com'),(1,2,15,'Staying Alive','21m',0,'http://notflix.com'),(1,2,16,'Crazy for You','21m',0,'http://notflix.com'),(1,2,17,'Breaking Up Is Hard to Do','21m',0,'http://notflix.com'),(1,2,18,'Take a Walk on the Wild Side','21m',0,'http://notflix.com'),(1,2,19,'Like a Virgin','21m',0,'http://notflix.com'),(1,2,20,'Stuck on You','21m',0,'http://notflix.com'),(1,2,21,'Born to Run','21m',0,'http://notflix.com'),(1,2,22,'Computer Games','21m',0,'http://notflix.com'),(1,2,23,'Joy to the World','21m',0,'http://notflix.com'),(1,3,1,'Let\'s Dance','21m',0,'http://notflix.com'),(1,3,2,'Taking Care of Business','21m',0,'http://notflix.com'),(1,3,3,'I\'ve Got to Be Me','21m',0,'http://notflix.com'),(1,3,4,'History Never Repeats','21m',0,'http://notflix.com'),(1,3,5,'The Letter','21m',0,'http://notflix.com'),(1,3,6,'You\'re So Vain','21m',0,'http://notflix.com'),(1,3,7,'Addicted to Love','21m',0,'http://notflix.com'),(1,3,8,'The Winner Takes It All','21m',0,'http://notflix.com'),(1,3,9,'Baby Love','21m',0,'http://notflix.com'),(1,3,10,'Devil Woman','21m',0,'http://notflix.com'),(1,3,11,'Get a Job','21m',0,'http://notflix.com'),(1,3,12,'Come Together','21m',0,'http://notflix.com'),(1,3,13,'Love Hurts','21m',0,'http://notflix.com'),(1,3,14,'The Sounds of Silence','21m',0,'http://notflix.com'),(1,3,15,'I Like Bread and Butter','21m',0,'http://notflix.com'),(1,3,16,'Walk Like an Egyptian','21m',0,'http://notflix.com'),(1,3,17,'Love Me Tender','21m',0,'http://notflix.com'),(1,3,18,'You Ain\'t Nothing But a Hound Dog','21m',0,'http://notflix.com'),(1,3,19,'Under My Thumb','21m',0,'http://notflix.com'),(1,3,20,'Look Through Any Window','21m',0,'http://notflix.com'),(1,3,21,'Jump in My Car','21m',0,'http://notflix.com'),(1,3,22,'I Put a Spell on You','21m',0,'http://notflix.com'),(1,3,23,'Let\'s Spend the Night Together','21m',0,'http://notflix.com'),(1,3,24,'Unforgettable','21m',0,'http://notflix.com'),(1,3,25,'Michelle','21m',0,'http://notflix.com'),(1,3,26,'Love and Marriage','21m',0,'http://notflix.com'),(1,4,1,'The Real Thing','21m',0,'http://notflix.com'),(1,4,2,'Back in the U.S.S.R.','21m',0,'http://notflix.com'),(1,4,3,'Not Fade Away','21m',0,'http://notflix.com'),(1,4,4,'Raindrops Keep Falling on My Head','21m',0,'http://notflix.com'),(1,4,5,'Some Enchanted Evening','21m',0,'http://notflix.com'),(1,4,6,'Am I That Easy to Forget','21m',0,'http://notflix.com'),(1,4,7,'Let It Be','21m',0,'http://notflix.com'),(1,4,8,'I See Red','21m',0,'http://notflix.com'),(1,4,9,'Love Is in the Air','21m',0,'http://notflix.com'),(1,4,10,'Down Among the Dead Men','21m',0,'http://notflix.com'),(1,4,11,'I Started a Joke','21m',0,'http://notflix.com'),(1,4,12,'Only Women Bleed','21m',0,'http://notflix.com'),(1,4,13,'Killing Me Softly','21m',0,'http://notflix.com'),(1,4,14,'I Am Woman','21m',0,'http://notflix.com'),(1,4,15,'Turn the Page','21m',0,'http://notflix.com'),(1,4,16,'Amigos para siempre','21m',0,'http://notflix.com'),(1,4,17,'Move Baby Move','21m',0,'http://notflix.com'),(1,4,18,'In the Flesh','21m',0,'http://notflix.com'),(1,4,19,'At the Hop','21m',0,'http://notflix.com'),(1,4,20,'Always on My Mind','21m',0,'http://notflix.com'),(1,4,21,'Friday on My Mind','21m',0,'http://notflix.com'),(1,4,22,'Money Makes the World Go Round','21m',0,'http://notflix.com'),(1,4,23,'Stairway to Heaven','21m',0,'http://notflix.com'),(1,4,24,'From a Distance','21m',0,'http://notflix.com'),(1,4,25,'Just the Way You Are','21m',0,'http://notflix.com'),(1,4,26,'Leader of the Pack','21m',0,'http://notflix.com'),(1,4,27,'We Are Family','21m',0,'http://notflix.com'),(1,4,28,'Like Sister and Brother','21m',0,'http://notflix.com'),(1,4,29,'Old School Yard','21m',0,'http://notflix.com'),(1,4,30,'Your Cheatin\' Heart','21m',0,'http://notflix.com'),(1,4,31,'School\'s Out','21m',0,'http://notflix.com'),(2,1,1,'Welcome to the Hellmouth','43m',0,'http://notflix.com'),(2,1,2,'The Harvest','45m',0,'http://notflix.com'),(2,1,3,'Witch','45m',0,'http://notflix.com'),(2,1,4,'Teacher\'s Pet','43m',0,'http://notflix.com'),(2,1,5,'Never Kill a Boy on the First Date','43m',0,'http://notflix.com'),(2,1,6,'The Pack','45m',0,'http://notflix.com'),(2,1,7,'Angel','45m',0,'http://notflix.com'),(2,1,8,'I, Robot... You, Jane','45m',0,'http://notflix.com'),(2,1,9,'The Puppet Show','45m',0,'http://notflix.com'),(2,1,10,'Nightmares','45m',0,'http://notflix.com'),(2,1,11,'Out of Mind, Out of Sight','45m',0,'http://notflix.com'),(2,1,12,'Prophecy Girl','45m',0,'http://notflix.com'),(2,2,1,'When She Was Bad','45m',0,'http://notflix.com'),(2,2,2,'Some Assembly Required','44m',0,'http://notflix.com'),(2,2,3,'School Hard','44m',0,'http://notflix.com'),(2,2,4,'Inca Mummy Girl','44m',0,'http://notflix.com'),(2,2,5,'Reptile Boy','44m',0,'http://notflix.com'),(2,2,6,'Halloween','44m',0,'http://notflix.com'),(2,2,7,'Lie to Me','45m',0,'http://notflix.com'),(2,2,8,'The Dark Age','45m',0,'http://notflix.com'),(2,2,9,'What\'s My Line?: Part 1','1h',0,'http://notflix.com'),(2,2,10,'What\'s My Line?: Part 2','1h',0,'http://notflix.com'),(2,2,11,'Ted','45m',0,'http://notflix.com'),(2,2,12,'Bad Eggs','1h',0,'http://notflix.com'),(2,2,13,'Surprise','1h',0,'http://notflix.com'),(2,2,14,'Innocence','1h',0,'http://notflix.com'),(2,2,15,'Phases','1h',0,'http://notflix.com'),(2,2,16,'Bewitched, Bothered and Bewildered','1h',0,'http://notflix.com'),(2,2,17,'Passion','1h',1,'http://notflix.com/videos/san114/Series/BTVS/1-17.mp4'),(2,2,18,'Killed by Death','1h',1,'http://notflix.com/videos/san114/Series/BTVS/1-18.mp4'),(2,2,19,'I Only Have Eyes for You','1h',1,'http://notflix.com/videos/san114/Series/BTVS/1-19.mp4'),(2,2,20,'Go Fish','1h',1,'http://notflix.com/videos/san114/Series/BTVS/1-20.mp4'),(2,2,21,'Becoming: Part 1','1h',1,'http://notflix.com/videos/san114/Series/BTVS/1-21.mp4'),(2,2,22,'Becoming: Part 2','44m',0,'http://notflix.com'),(2,3,1,'Anne','1h',0,'http://notflix.com'),(2,3,2,'Dead Man\'s Party','44m',0,'http://notflix.com'),(2,3,3,'Faith, Hope & Trick','45m',0,'http://notflix.com'),(2,3,4,'Beauty and the Beasts','1h',0,'http://notflix.com'),(2,3,5,'Homecoming','1h',0,'http://notflix.com'),(2,3,6,'Band Candy','1h',0,'http://notflix.com'),(2,3,7,'Revelations','45m',0,'http://notflix.com'),(2,3,8,'Lovers Walk','1h',0,'http://notflix.com'),(2,3,9,'The Wish','45m',0,'http://notflix.com'),(2,3,10,'Amends','1h',0,'http://notflix.com'),(2,3,11,'Gingerbread','1h',0,'http://notflix.com'),(2,3,12,'Helpless','1h',0,'http://notflix.com'),(2,3,13,'The Zeppo','1h',0,'http://notflix.com'),(2,3,14,'Bad Girls','1h',0,'http://notflix.com'),(2,3,15,'Consequences','1h',0,'http://notflix.com'),(2,3,16,'Doppelgangland','1h',0,'http://notflix.com'),(2,3,17,'Enemies','1h',0,'http://notflix.com'),(2,3,18,'Earshot','1h',0,'http://notflix.com'),(2,3,19,'Choices','43m',0,'http://notflix.com'),(2,3,20,'The Prom','1h',0,'http://notflix.com'),(2,3,21,'Graduation Day: Part 1','1h',0,'http://notflix.com'),(2,3,22,'Graduation Day: Part 2','1h',0,'http://notflix.com'),(3,1,1,'Pilot','44m',0,'http://notflix.com'),(3,1,2,'Lucifer, Stay. Good Devil.','44m',0,'http://notflix.com'),(3,1,3,'The Would-Be Prince of Darkness','43m',0,'http://notflix.com'),(3,1,4,'Manly Whatnots','42m',0,'http://notflix.com'),(3,1,5,'Sweet Kicks','43m',0,'http://notflix.com'),(3,1,6,'Favorite Son','43m',0,'http://notflix.com'),(3,1,7,'Wingman','43m',0,'http://notflix.com'),(3,1,8,'Et Tu, Doctor?','43m',0,'http://notflix.com'),(3,1,9,'A Priest Walks Into a Bar','42m',0,'http://notflix.com'),(3,1,10,'Pops','44m',0,'http://notflix.com'),(3,1,11,'St. Lucifer','44m',0,'http://notflix.com'),(3,1,12,'#TeamLucifer','44m',0,'http://notflix.com'),(3,1,13,'Take Me Back to Hell','43m',0,'http://notflix.com'),(3,2,1,'Everything\'s Coming Up Lucifer','44m',0,'http://notflix.com'),(3,2,2,'Liar, Liar, Slutty Dress on Fire','43m',0,'http://notflix.com'),(3,2,3,'Sin-Eater','43m',0,'http://notflix.com'),(3,2,4,'Lady Parts','42m',0,'http://notflix.com'),(3,2,5,'Weaponizer','44m',0,'http://notflix.com'),(3,2,6,'Monster','43m',0,'http://notflix.com'),(3,2,7,'My Little Monkey','43m',0,'http://notflix.com'),(3,2,8,'Trip to Stabby Town','43m',0,'http://notflix.com'),(3,2,9,'Homewrecker','43m',0,'http://notflix.com'),(3,2,10,'Quid Pro Ho','44m',0,'http://notflix.com'),(3,2,11,'Stewardess Interruptus','43m',0,'http://notflix.com'),(3,2,12,'Love Handles','43m',0,'http://notflix.com'),(3,2,13,'A Good Day to Die','43m',0,'http://notflix.com'),(3,2,14,'Candy Morningstar','43m',0,'http://notflix.com'),(3,2,15,'Deceptive Little Parasite','43m',0,'http://notflix.com'),(3,2,16,'God Johnson','43m',0,'http://notflix.com'),(3,2,17,'Sympathy for the Goddess','43m',0,'http://notflix.com'),(3,2,18,'The Good, the Bad, and the Crispy','43m',0,'http://notflix.com'),(3,3,1,'They\'re Back, Aren\'t They?','43m',0,'http://notflix.com'),(3,3,2,'The One with the Baby Carrot','43m',0,'http://notflix.com'),(3,3,4,'What Would Lucifer Do?','43m',0,'http://notflix.com'),(3,3,5,'Welcome Back, Charlotte Richards','43m',0,'http://notflix.com'),(3,3,6,'Vegas with Some Radish','43m',0,'http://notflix.com'),(3,3,7,'Off the Record','43m',0,'http://notflix.com'),(3,3,8,'Chloe Does Lucifer','43m',0,'http://notflix.com'),(3,3,9,'The Sinnerman','43m',0,'http://notflix.com'),(3,3,10,'The Sin Bin','43m',0,'http://notflix.com'),(3,3,11,'City of Angels?','43m',0,'http://notflix.com'),(3,3,12,'All About Her','43m',0,'http://notflix.com'),(3,3,13,'Til Death Do Us Part','43m',0,'http://notflix.com'),(3,3,14,'My Brother\'s Keeper','43m',0,'http://notflix.com'),(3,3,15,'High School Poppycock','43m',0,'http://notflix.com'),(3,3,16,'Infernal Guinea Pig','43m',0,'http://notflix.com'),(3,3,17,'Let Pinhead Sing!','43m',0,'http://notflix.com'),(3,3,18,'The Last Heartbreak','43m',0,'http://notflix.com'),(3,3,19,'Orange Is the New Maze','43m',0,'http://notflix.com'),(3,3,20,'The Angel of San Bernardino','43m',0,'http://notflix.com'),(3,3,21,'Anything Pierce Can Do I Can Do Better','43m',0,'http://notflix.com'),(3,3,22,'All Hands on Decker','43m',0,'http://notflix.com'),(3,3,23,'Quintessential Deckerstar','43m',0,'http://notflix.com'),(3,3,24,'A Devil of My Word','43m',0,'http://notflix.com'),(3,3,25,'Boo Normal','43m',0,'http://notflix.com'),(3,3,26,'Once Upon a Time','43m',0,'http://notflix.com'),(3,4,1,'Everything\'s Okay','49m',0,'http://notflix.com'),(3,4,2,'Somebody\'s Been Reading Dante\'s Inferno','50m',0,'http://notflix.com'),(3,4,3,'O, Ye of Little Faith, Father','49m',0,'http://notflix.com'),(3,4,4,'All About Eve','49m',0,'http://notflix.com'),(3,4,5,'Expire Erect','50m',0,'http://notflix.com'),(3,4,6,'Orgy Pants to Work','50m',0,'http://notflix.com'),(3,4,7,'Devil Is as Devil Does','48m',0,'http://notflix.com'),(3,4,9,'Save Lucifer','50m',0,'http://notflix.com'),(3,4,10,'Who\'s da New King of Hell?','55m',0,'http://notflix.com'),(4,0,1,'The Guest','1h 40m',0,'http://notflix.com'),(5,2,1,'Out of Time','42',0,'http://notflix.com'),(5,2,2,'The Justice Society of America','42',0,'http://notflix.com'),(5,2,3,'Shogun','42m',0,'http://notflix.com'),(5,2,4,'Abominations','42m',0,'http://notflix.com'),(5,2,5,'Compromised','42m',0,'http://notflix.com'),(5,2,6,'Outlaw Country','41m',0,'http://notflix.com'),(5,2,7,'Invasion!','42m',0,'http://notflix.com'),(5,2,8,'The Chicago Way','42m',0,'http://notflix.com'),(5,2,9,'Raiders of the Lost Art','41m',0,'http://notflix.com'),(5,2,10,'The Legion of Doom','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/DCLT/2-10.mp4'),(5,2,11,'Turncoat','40m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/DCLT/2-11.mp4'),(5,2,12,'Camelot/3000','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/DCLT/2-12.mp4'),(5,2,13,'Land of the Lost','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/DCLT/2-13.mp4'),(5,2,14,'Moonshot','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/DCLT/2-14.mp4'),(5,2,15,'Fellowship of the Spear','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/DCLT/2-15.mp4'),(5,2,16,'Doomworld','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/DCLT/2-16.mp4'),(5,2,17,'Aruba','41m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/DCLT/2-17.mp4'),(7,5,1,'Legacy','42m',0,'http://notflix.com'),(7,5,2,'The Recruits','42m',0,'http://notflix.com'),(7,5,3,'A Matter of Trust','42m',0,'http://notflix.com'),(7,5,4,'Penance','42m',0,'http://notflix.com'),(7,5,5,'Human Target','42m',0,'http://notflix.com'),(7,5,6,'So It Begins','42m',0,'http://notflix.com'),(7,5,7,'Vigilante','42m',0,'http://notflix.com'),(7,5,8,'Invasion!','42m',0,'http://notflix.com'),(7,5,9,'What We Leave Behind','42m',0,'http://notflix.com'),(7,5,10,'Who Are You?','42m',0,'http://notflix.com'),(7,5,11,'Second Chances','42m',0,'http://notflix.com'),(7,5,12,'Bratva','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-12.mp4'),(7,5,13,'Spectre of the Gun','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-13.mp4'),(7,5,14,'The Sin-Eater','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-14.mp4'),(7,5,15,'Fighting Fire with Fire','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-15.mp4'),(7,5,16,'Checkmate','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-16.mp4'),(7,5,17,'Kapiushon','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-17.mp4'),(7,5,18,'Disbanded','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-18.mp4'),(7,5,19,'Dangerous Liaisons','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-19.mp4'),(7,5,20,'Underneath','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-20.mp4'),(7,5,21,'Honor Thy Fathers','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-21.mp4'),(7,5,22,'Missing','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-22.mp4'),(7,5,23,'Lian Yu','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Arrow/5-23.mp4'),(8,3,1,'Flashpoint','42m',0,'http://notflix.com'),(8,3,2,'Paradox','42m',0,'http://notflix.com'),(8,3,3,'Magenta','42m',0,'http://notflix.com'),(8,3,4,'The New Rogues','42m',0,'http://notflix.com'),(8,3,5,'Monster','42m',0,'http://notflix.com'),(8,3,6,'Shade','42m',0,'http://notflix.com'),(8,3,7,'Killer Frost','42m',0,'http://notflix.com'),(8,3,8,'Invasion!','42m',0,'http://notflix.com'),(8,3,9,'The Present','42m',0,'http://notflix.com'),(8,3,10,'Borrowing Problems from the Future','42m',0,'http://notflix.com'),(8,3,11,'Dead or Alive','42m',0,'http://notflix.com'),(8,3,12,'Untouchable','42m',0,'http://notflix.com'),(8,3,13,'Attack on Gorilla City','42m',0,'http://notflix.com'),(8,3,14,'Attack on Central City','42m',0,'http://notflix.com'),(8,3,15,'The Wrath of Savitar','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Flash/5-15.mp4'),(8,3,16,'Into the Speed Force','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Flash/5-16.mp4'),(8,3,17,'Duet','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Flash/5-17.mp4'),(8,3,18,'Abra Kadabra','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Flash/5-18.mp4'),(8,3,19,'The Once and Future Flash','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Flash/5-19.mp4'),(8,3,20,'I Know Who You Are','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Flash/5-20.mp4'),(8,3,21,'Cause and Effect','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Flash/5-21.mp4'),(8,3,22,'Infantino Street','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Flash/5-22.mp4'),(8,3,23,'Finish Line','42m',1,'http://notflix.com/videos/san114/Series/ArrowVerse/Flash/5-23.mp4');
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
  `Description` varchar(300) DEFAULT NULL,
  `ReleaseYear` int DEFAULT NULL,
  `Length` varchar(7) DEFAULT NULL,
  `NOS` int DEFAULT '0',
  `Available` tinyint(1) DEFAULT '0',
  `Poster` varchar(255) DEFAULT 'http://notflix.com/imgs/Shows/default.jpg',
  PRIMARY KEY (`SeriesID`),
  CONSTRAINT `media_chk_1` CHECK ((`NOS` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'All Together Now','One-time Rock\'n\'Roll star Bobby Rivers discovers he has 15-year-old twins when his former lover dies',1991,'25m',4,1,'http://notflix.com/imgs/Shows/alltogethernow.jpg'),(2,'Buffy the Vampire Slayer','One-time Rock\'n\'Roll star Bobby Rivers discovers he has 15-year-old twins when his former lover dies in a plane crash. They and Tracy, the woman who looked after them when their mother was travelling the world, move in with him.',1997,'44m',7,1,'http://notflix.com/imgs/Shows/BTVS.jpg'),(3,'Lucifer','Lucifer Morningstar has decided he\'s had enough of being the dutiful servant in Hell and decides to spend some time on Earth to better understand humanity. He settles in Los Angeles - the City of Angels.',2016,'45m',6,0,'http://notflix.com/imgs/Shows/lucifer.jpg'),(4,'The Guest','A soldier introduces himself to the Peterson family, claiming to be a friend of their son who died in action. After the young man is welcomed into their home, a series of accidental deaths seem to be connected to his presence.',2014,'1h 40m',0,0,'http://notflix.com/imgs/Shows/TheGuest.jpg'),(5,'DC\'s Legends of Tomorrow','Time-traveling rogue, Rip Hunter, has to recruit a rag-tag team of heroes and villains to help prevent an apocalypse that could impact not only Earth, but all of time.',2016,'42m',7,1,'http://notflix.com/imgs/Shows/DCLT.jpg'),(6,'Supergirl','The adventures of Superman\'s cousin and her own superhero career.',2015,'43m',6,0,'http://notflix.com/imgs/Shows/Supergirl.jpg'),(7,'Arrow','Spoiled billionaire playboy Oliver Queen is missing and presumed dead when his yacht is lost at sea. He returns five years later a changed man, determined to clean up the city as a hooded vigilante armed with a bow.',2012,'42m',8,1,'http://notflix.com/imgs/Shows/Arrow.jpg'),(8,'The Flash','After being struck by lightning, Barry Allen wakes up from his coma to discover he\'s been given the power of super speed, becoming the Flash, and fighting crime in Central City.',2014,'43m',9,1,'http://notflix.com/imgs/Shows/TheFlash.webp');
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
INSERT INTO `season` VALUES (1,1,21),(1,2,23),(1,3,26),(1,4,31),(2,1,12),(2,2,22),(2,3,22),(2,4,22),(2,5,22),(2,6,22),(2,7,22),(3,1,13),(3,2,18),(3,3,26),(3,4,10),(3,5,16),(3,6,10),(4,0,1),(5,1,16),(5,2,17),(5,3,18),(5,4,16),(5,5,15),(5,6,15),(5,7,13),(6,1,20),(6,2,22),(6,3,23),(6,4,22),(6,5,19),(6,6,20),(7,1,23),(7,2,23),(7,3,23),(7,4,23),(7,5,23),(7,6,23),(7,7,23),(7,8,10),(8,1,23),(8,2,23),(8,3,23),(8,4,23),(8,5,22),(8,6,19),(8,7,18),(8,8,20),(8,9,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (23,'Ali-cat','$2y$10$HyI/A0nQKlxwNWFSGM7ktOVNci4cZ2XYGBs6q1nnfnhMpy.iqvxcm','2025-03-04',_binary '¢ºW©æÖ}\√\–uû\Õ'),(24,'PoigusJoigus','$2y$10$qMEocr3bCloP3SNqQbZnC.7Y1tRHzcXRrwzWID.l6kOxMGd6C0XjK','2025-03-04',_binary '\\î\‰¶¸MN\Á£%%x\\o'),(25,'Orik','$2y$10$I6sg8y6zT9kPvv2r..OKiu.ElI.GHcMRQTEY3FK2x5N8xTgDuUcIC','2025-03-04',_binary '_+*s3Bz/£H¨¥¯\‡'),(26,'seb','$2y$10$wAV5W1tH6jGMwevuYOjjPOvCtirMJreHuCzUSLEpWZ9fENg75gaSK','2025-03-06',_binary '\ÿÙÿà\'Û3\‡,ù\nj7');
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
INSERT INTO `watchlist` VALUES (25,2,2,16,'00:43:46'),(26,3,4,6,'00:48:27'),(26,4,0,1,'01:35:28');
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

-- Dump completed on 2025-03-09 13:21:29
