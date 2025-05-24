-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: danelasql
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `answer_text` text NOT NULL,
  `is_correct` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (121,31,'1',1),(122,31,'2',0),(123,31,'3',0),(124,31,'4',0),(125,32,'c',1),(126,32,'balotni',0),(127,32,'karichni',0),(128,32,'mwvane',0),(129,33,'c',1),(130,33,'achi sayvareli feri',0),(131,33,'achi sayvareli feri',0),(132,33,'achi sayvareli feri',0),(133,34,'c',1),(134,34,'achi sayvareli feri',0),(135,34,'achi sayvareli feri',0),(136,34,'achi sayvareli feri',0),(137,35,'c',1),(138,35,'achi sayvareli feri',0),(139,35,'achi sayvareli feri',0),(140,35,'achi sayvareli feri',0),(141,36,'1',1),(142,36,'2',0),(143,36,'3',0),(144,36,'4',0),(145,37,'c',1),(146,37,'balotni',0),(147,37,'karichni',0),(148,37,'mwvane',0),(149,38,'c',1),(150,38,'achi sayvareli feri',0),(151,38,'achi sayvareli feri',0),(152,38,'achi sayvareli feri',0),(153,39,'c',1),(154,39,'achi sayvareli feri',0),(155,39,'achi sayvareli feri',0),(156,39,'achi sayvareli feri',0),(157,40,'c',1),(158,40,'achi sayvareli feri',0),(159,40,'achi sayvareli feri',0),(160,40,'achi sayvareli feri',0),(161,41,'1',1),(162,41,'2',0),(163,41,'3',0),(164,41,'4',0),(165,42,'c',1),(166,42,'balotni',0),(167,42,'karichni',0),(168,42,'mwvane',0),(169,43,'c',1),(170,43,'achi sayvareli feri',0),(171,43,'achi sayvareli feri',0),(172,43,'achi sayvareli feri',0),(173,44,'c',1),(174,44,'achi sayvareli feri',0),(175,44,'achi sayvareli feri',0),(176,44,'achi sayvareli feri',0),(177,45,'c',1),(178,45,'achi sayvareli feri',0),(179,45,'achi sayvareli feri',0),(180,45,'achi sayvareli feri',0),(181,46,'1',1),(182,46,'2',0),(183,46,'3',0),(184,46,'4',0),(185,47,'c',1),(186,47,'balotni',0),(187,47,'karichni',0),(188,47,'mwvane',0),(189,48,'c',1),(190,48,'achi sayvareli feri',0),(191,48,'achi sayvareli feri',0),(192,48,'achi sayvareli feri',0),(193,49,'c',1),(194,49,'achi sayvareli feri',0),(195,49,'achi sayvareli feri',0),(196,49,'achi sayvareli feri',0),(197,50,'c',1),(198,50,'achi sayvareli feri',0),(199,50,'achi sayvareli feri',0),(200,50,'achi sayvareli feri',0),(201,51,'1',1),(202,51,'2',0),(203,51,'3',0),(204,51,'4',0),(205,52,'c',1),(206,52,'balotni',0),(207,52,'karichni',0),(208,52,'mwvane',0),(209,53,'c',1),(210,53,'achi sayvareli feri',0),(211,53,'achi sayvareli feri',0),(212,53,'achi sayvareli feri',0),(213,54,'c',1),(214,54,'achi sayvareli feri',0),(215,54,'achi sayvareli feri',0),(216,54,'achi sayvareli feri',0),(217,55,'c',1),(218,55,'achi sayvareli feri',0),(219,55,'achi sayvareli feri',0),(220,55,'achi sayvareli feri',0),(261,66,'1',1),(262,66,'2',0),(263,66,'3',0),(264,66,'4',0),(265,67,'c',1),(266,67,'balotni',0),(267,67,'karichni',0),(268,67,'mwvane',0),(269,68,'c',1),(270,68,'achi sayvareli feri',0),(271,68,'achi sayvareli feri',0),(272,68,'achi sayvareli feri',0),(273,69,'c',1),(274,69,'achi sayvareli feri',0),(275,69,'achi sayvareli feri',0),(276,69,'achi sayvareli feri',0),(277,70,'c',1),(278,70,'achi sayvareli feri',0),(279,70,'achi sayvareli feri',0),(280,70,'achi sayvareli feri',0),(281,71,'kakakaka',1),(282,71,'kakakaka',0),(283,71,'kakakaka',0),(284,71,'kakakaka',0),(285,72,'kakakaka',1),(286,72,'kakakaka',0),(287,72,'kakakaka',0),(288,72,'kakakaka',0),(289,73,'c',1),(290,73,'achi sayvareli feri',0),(291,73,'achi sayvareli feri',0),(292,73,'achi sayvareli feri',0),(293,74,'c',1),(294,74,'achi sayvareli feri',0),(295,74,'achi sayvareli feri',0),(296,74,'achi sayvareli feri',0),(297,75,'c',1),(298,75,'achi sayvareli feri',0),(299,75,'achi sayvareli feri',0),(300,75,'achi sayvareli feri',0),(301,76,'4',1),(302,76,'5',0),(303,76,'6',0),(304,76,'7',0),(305,77,'11',1),(306,77,'12',0),(307,77,'14',0),(308,77,'15',0),(309,78,'6',1),(310,78,'7',0),(311,78,'8',0),(312,78,'9',0),(313,79,'1',1),(314,79,'2',0),(315,79,'3',0),(316,79,'4',0),(317,80,'2',1),(318,80,'3',0),(319,80,'4',0),(320,80,'5',0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `issued_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
INSERT INTO `certificates` VALUES (1,4,1,'2025-02-18 13:59:24'),(2,4,1,'2025-02-18 14:02:32'),(18,7,1,'2025-05-04 17:57:51');
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_steps`
--

DROP TABLE IF EXISTS `course_steps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_steps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int DEFAULT NULL,
  `step_number` int NOT NULL,
  `presentation_id` int DEFAULT NULL,
  `quiz_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `course_id` (`course_id`),
  KEY `presentation_id` (`presentation_id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `course_steps_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  CONSTRAINT `course_steps_ibfk_2` FOREIGN KEY (`presentation_id`) REFERENCES `presentations` (`id`),
  CONSTRAINT `course_steps_ibfk_3` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_steps`
--

LOCK TABLES `course_steps` WRITE;
/*!40000 ALTER TABLE `course_steps` DISABLE KEYS */;
INSERT INTO `course_steps` VALUES (14,1,1,28,11),(15,1,1,29,11),(16,1,1,25,11),(17,1,2,26,11),(18,1,2,29,7);
/*!40000 ALTER TABLE `course_steps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'JavaScript Basics','Learn the basics of JavaScript.'),(2,'Course 2','Introduction to Programming');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (3,'Armenian'),(4,'Bulgarian'),(5,'English'),(1,'Georgian'),(12,'Romanian'),(2,'Turkish');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(255) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `news_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (3,'დასრულდა','<p>zazazzazazzazazzazazzazazzazazzazazzazazzazazzazazzazazza</p>','2025-04-25 19:20:14','/uploads/news/1745608814861.png',2),(4,'დასრულდა test','test','2025-04-25 19:22:11','/uploads/news/1745608931829.png',3),(6,'მარკო რუბიო - ვიცით, სად არის უკრაინა და სად არის რუსეთი, საჭიროა ნამდვილი გარღვევა ძალიან მალე, წინააღმდეგ შემთხვევაში, ვფიქრობ, ტრამპს მოუწევს გადაწყვეტილების მიღება, რამდენი დრო დავუთმოთ ამას','<p>აშშ-ის სახელმწიფო მდივანი მარკო რუბიო აცხადებს, რომ უკრაინაში ომის საკითხზე გარღვევა ძალიან მალე უნდა მოხდეს, წინააღმდეგ შემთხვევაში აშშ-ის პრეზიდენტს, დონალდ ტრამპს მოუწევს გადაწყვეტილების მიღება, რამდენი დრო დაუთმოს ამ საკითხს.</p><p>აღნიშნულის შესახებ რუბიომ „ფოქს ნიუსთან“ ინტერვიუში <a href=\"https://www.foxnews.com/video/6372195430112?fbclid=IwY2xjawKBOKBleHRuA2FlbQIxMABicmlkETFwaGxxWGpUTHBScExTQ0NJAR6kIxSUrwQ_hWbaJyFy3bh61lgGYOYsyY-pbyXPs-Ik_ACooQb5l-30iUowIQ_aem_CZeJH_BzW_TEsN9I_N92Bg\">ისაუბრა</a>.<br>&nbsp;</p><p>„ვფიქრობ, ვიცით, სად არის უკრაინა და სად არის რუსეთი, სად არის პუტინი ამჟამად. ისინი კვლავ შორს არიან ერთმანეთისგან. უფრო ახლოს არიან, მაგრამ მაინც შორს არიან. საჭიროა ნამდვილი გარღვევა ძალიან მალე, რომ ეს შესაძლებელი გახდეს, წინააღმდეგ შემთხვევაში, ვფიქრობ, პრეზიდენტს მოუწევს გადაწყვეტილების მიღება, კიდევ რამდენი დრო დავუთმოთ ამას“, – განაცხადა რუბიომ.</p>','2025-05-03 12:09:16','/uploads/news/1746274156600.png',4),(7,'test','<p>test</p>','2025-05-05 09:13:25','/uploads/news/1746436405031.png',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_categories`
--

DROP TABLE IF EXISTS `news_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_categories`
--

LOCK TABLES `news_categories` WRITE;
/*!40000 ALTER TABLE `news_categories` DISABLE KEYS */;
INSERT INTO `news_categories` VALUES (7,'Final conference'),(4,'Guidebook'),(5,'Job shadowing activities'),(2,'Meetings'),(6,'Multiplier events'),(1,'News'),(3,'Piloting activities');
/*!40000 ALTER TABLE `news_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentation_languages`
--

DROP TABLE IF EXISTS `presentation_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentation_languages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `presentation_id` int NOT NULL,
  `language_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `presentation_id` (`presentation_id`),
  UNIQUE KEY `presentation_id_2` (`presentation_id`,`language_id`),
  KEY `fk_language` (`language_id`),
  CONSTRAINT `fk_language` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `presentation_languages_ibfk_1` FOREIGN KEY (`presentation_id`) REFERENCES `presentations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentation_languages`
--

LOCK TABLES `presentation_languages` WRITE;
/*!40000 ALTER TABLE `presentation_languages` DISABLE KEYS */;
INSERT INTO `presentation_languages` VALUES (12,1,1),(13,2,5),(14,18,3),(10,24,5),(15,25,2),(16,26,4),(17,27,3),(18,28,5),(19,29,3);
/*!40000 ALTER TABLE `presentation_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentations`
--

DROP TABLE IF EXISTS `presentations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `presentations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentations`
--

LOCK TABLES `presentations` WRITE;
/*!40000 ALTER TABLE `presentations` DISABLE KEYS */;
INSERT INTO `presentations` VALUES (1,'step1.pdf','step1.pdf'),(2,'step2.pdf','step2.pdf'),(18,'dddd','/uploads/presentations/1740643599582.pdf'),(19,'new','/uploads/presentations/1741071570833.pdf'),(20,'zzaaazzaa','/uploads/presentations/1746382102896.pdf'),(24,'aass','/uploads/presentations/1747307076112.pdf'),(25,'JS-Step 1(Turkish)','/uploads/presentations/1748090309273.pdf'),(26,'JS-Step 2(Bulgarian)','/uploads/presentations/1748090329415.pdf'),(27,'JS-Step 3(Armenian)','/uploads/presentations/1748090351000.pdf'),(28,'JS-Step 1(English)','/uploads/presentations/1748090370338.pdf'),(29,'JS-Step 1(Armenian)','/uploads/presentations/1748090396483.pdf');
/*!40000 ALTER TABLE `presentations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quiz_id` int DEFAULT NULL,
  `question_text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quiz_id` (`quiz_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (31,7,'c'),(32,7,'c'),(33,7,'c'),(34,7,'c'),(35,7,'c'),(36,8,'c'),(37,8,'c'),(38,8,'c'),(39,8,'c'),(40,8,'c'),(41,9,'c'),(42,9,'c'),(43,9,'c'),(44,9,'c'),(45,9,'c'),(46,10,'c'),(47,10,'c'),(48,10,'c'),(49,10,'c'),(50,10,'c'),(51,11,'c'),(52,11,'c'),(53,11,'c'),(54,11,'c'),(55,11,'c'),(66,14,'c'),(67,14,'c'),(68,14,'c'),(69,14,'c'),(70,14,'c'),(71,15,'kakakaka'),(72,15,'kakakaka'),(73,15,'kakakaka'),(74,15,'c'),(75,15,'c'),(76,15,'ramdenia 2+2'),(77,15,'ramdeni wlisaa achi?'),(78,15,'ramdenia 5+1'),(79,15,'c'),(80,15,'k');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quizzes`
--

DROP TABLE IF EXISTS `quizzes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quizzes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `course_id` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_quiz_course` (`course_id`),
  CONSTRAINT `fk_quiz_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quizzes`
--

LOCK TABLES `quizzes` WRITE;
/*!40000 ALTER TABLE `quizzes` DISABLE KEYS */;
INSERT INTO `quizzes` VALUES (7,'zazaaaza',1),(8,'zazaaazaaaa',1),(9,'azaza',1),(10,'feffefe',1),(11,'test',1),(14,'test34',1),(15,'kakakaka',1);
/*!40000 ALTER TABLE `quizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_answers`
--

DROP TABLE IF EXISTS `user_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `quiz_id` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  `selected_answer_id` int DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL,
  `answered_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `score` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `quiz_id` (`quiz_id`),
  KEY `question_id` (`question_id`),
  KEY `user_answers_ibfk_4` (`selected_answer_id`),
  CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_answers_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`),
  CONSTRAINT `user_answers_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`),
  CONSTRAINT `user_answers_ibfk_4` FOREIGN KEY (`selected_answer_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=934 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_answers`
--

LOCK TABLES `user_answers` WRITE;
/*!40000 ALTER TABLE `user_answers` DISABLE KEYS */;
INSERT INTO `user_answers` VALUES (235,7,7,31,121,1,'2025-02-26 07:19:27',NULL),(236,7,7,32,125,1,'2025-02-26 07:19:27',NULL),(237,7,7,33,129,1,'2025-02-26 07:19:27',NULL),(238,7,7,34,133,1,'2025-02-26 07:19:27',NULL),(239,7,7,35,137,1,'2025-02-26 07:19:27',NULL),(240,7,8,36,141,1,'2025-02-26 07:19:38',NULL),(241,7,8,37,145,1,'2025-02-26 07:19:38',NULL),(242,7,8,38,149,1,'2025-02-26 07:19:38',NULL),(243,7,8,39,153,1,'2025-02-26 07:19:38',NULL),(244,7,8,40,157,1,'2025-02-26 07:19:38',NULL),(245,7,8,36,141,1,'2025-02-26 07:19:53',NULL),(246,7,8,37,145,1,'2025-02-26 07:19:53',NULL),(247,7,8,38,149,1,'2025-02-26 07:19:53',NULL),(248,7,8,39,153,1,'2025-02-26 07:19:53',NULL),(249,7,8,40,157,1,'2025-02-26 07:19:53',NULL),(250,7,7,31,121,1,'2025-02-26 07:20:56',NULL),(251,7,7,32,125,1,'2025-02-26 07:20:56',NULL),(252,7,7,33,129,1,'2025-02-26 07:20:56',NULL),(253,7,7,34,133,1,'2025-02-26 07:20:56',NULL),(254,7,7,35,137,1,'2025-02-26 07:20:56',NULL),(255,7,8,36,141,1,'2025-02-26 07:21:05',NULL),(256,7,8,37,145,1,'2025-02-26 07:21:05',NULL),(257,7,8,38,149,1,'2025-02-26 07:21:05',NULL),(258,7,8,39,153,1,'2025-02-26 07:21:05',NULL),(259,7,8,40,157,1,'2025-02-26 07:21:05',NULL),(260,7,8,36,141,1,'2025-02-26 07:21:38',NULL),(261,7,8,37,145,1,'2025-02-26 07:21:38',NULL),(262,7,8,38,149,1,'2025-02-26 07:21:38',NULL),(263,7,8,39,153,1,'2025-02-26 07:21:38',NULL),(264,7,8,40,157,1,'2025-02-26 07:21:38',NULL),(265,7,9,41,161,1,'2025-02-26 07:24:02',NULL),(266,7,9,42,165,1,'2025-02-26 07:24:02',NULL),(267,7,9,43,169,1,'2025-02-26 07:24:02',NULL),(268,7,9,44,173,1,'2025-02-26 07:24:02',NULL),(269,7,9,45,177,1,'2025-02-26 07:24:02',NULL),(270,7,9,41,161,1,'2025-02-26 07:24:17',NULL),(271,7,9,42,165,1,'2025-02-26 07:24:17',NULL),(272,7,9,43,169,1,'2025-02-26 07:24:17',NULL),(273,7,9,44,173,1,'2025-02-26 07:24:17',NULL),(274,7,9,45,177,1,'2025-02-26 07:24:17',NULL),(275,7,7,31,124,0,'2025-02-26 07:24:56',NULL),(276,7,7,32,128,0,'2025-02-26 07:24:56',NULL),(277,7,7,33,132,0,'2025-02-26 07:24:56',NULL),(278,7,7,34,136,0,'2025-02-26 07:24:56',NULL),(279,7,7,35,140,0,'2025-02-26 07:24:56',NULL),(280,7,7,31,121,1,'2025-02-26 07:25:08',NULL),(281,7,7,32,125,1,'2025-02-26 07:25:08',NULL),(282,7,7,33,129,1,'2025-02-26 07:25:08',NULL),(283,7,7,34,133,1,'2025-02-26 07:25:08',NULL),(284,7,7,35,137,1,'2025-02-26 07:25:08',NULL),(285,7,9,41,164,0,'2025-02-26 07:26:06',NULL),(286,7,9,42,168,0,'2025-02-26 07:26:06',NULL),(287,7,9,43,172,0,'2025-02-26 07:26:06',NULL),(288,7,9,44,176,0,'2025-02-26 07:26:06',NULL),(289,7,9,45,180,0,'2025-02-26 07:26:06',NULL),(290,7,9,41,161,1,'2025-02-26 07:26:15',NULL),(291,7,9,42,165,1,'2025-02-26 07:26:15',NULL),(292,7,9,43,169,1,'2025-02-26 07:26:15',NULL),(293,7,9,44,173,1,'2025-02-26 07:26:15',NULL),(294,7,9,45,177,1,'2025-02-26 07:26:15',NULL),(295,7,7,31,121,1,'2025-02-26 07:27:33',NULL),(296,7,7,32,125,1,'2025-02-26 07:27:33',NULL),(297,7,7,33,129,1,'2025-02-26 07:27:33',NULL),(298,7,7,34,133,1,'2025-02-26 07:27:33',NULL),(299,7,7,35,137,1,'2025-02-26 07:27:33',NULL),(300,7,8,36,141,1,'2025-02-26 07:29:15',NULL),(301,7,8,37,145,1,'2025-02-26 07:29:15',NULL),(302,7,8,38,149,1,'2025-02-26 07:29:15',NULL),(303,7,8,39,153,1,'2025-02-26 07:29:15',NULL),(304,7,8,40,157,1,'2025-02-26 07:29:15',NULL),(305,7,8,36,141,1,'2025-02-26 07:35:02',NULL),(306,7,8,37,145,1,'2025-02-26 07:35:02',NULL),(307,7,8,38,149,1,'2025-02-26 07:35:02',NULL),(308,7,8,39,153,1,'2025-02-26 07:35:02',NULL),(309,7,8,40,157,1,'2025-02-26 07:35:02',NULL),(310,7,9,41,161,1,'2025-02-26 07:35:47',NULL),(311,7,9,42,165,1,'2025-02-26 07:35:47',NULL),(312,7,9,43,169,1,'2025-02-26 07:35:47',NULL),(313,7,9,44,173,1,'2025-02-26 07:35:47',NULL),(314,7,9,45,177,1,'2025-02-26 07:35:47',NULL),(315,7,7,31,121,1,'2025-02-26 07:37:15',NULL),(316,7,7,32,125,1,'2025-02-26 07:37:15',NULL),(317,7,7,33,129,1,'2025-02-26 07:37:15',NULL),(318,7,7,34,133,1,'2025-02-26 07:37:15',NULL),(319,7,7,35,137,1,'2025-02-26 07:37:15',NULL),(320,7,8,36,141,1,'2025-02-26 07:38:13',NULL),(321,7,8,37,145,1,'2025-02-26 07:38:13',NULL),(322,7,8,38,149,1,'2025-02-26 07:38:13',NULL),(323,7,8,39,153,1,'2025-02-26 07:38:13',NULL),(324,7,8,40,157,1,'2025-02-26 07:38:13',NULL),(325,7,9,41,161,1,'2025-02-26 07:39:03',NULL),(326,7,9,42,165,1,'2025-02-26 07:39:03',NULL),(327,7,9,43,169,1,'2025-02-26 07:39:03',NULL),(328,7,9,44,173,1,'2025-02-26 07:39:03',NULL),(329,7,9,45,177,1,'2025-02-26 07:39:03',NULL),(330,7,7,31,121,1,'2025-02-26 07:41:18',NULL),(331,7,7,32,125,1,'2025-02-26 07:41:18',NULL),(332,7,7,33,129,1,'2025-02-26 07:41:18',NULL),(333,7,7,34,133,1,'2025-02-26 07:41:18',NULL),(334,7,7,35,137,1,'2025-02-26 07:41:18',NULL),(335,7,7,31,121,1,'2025-02-26 07:45:33',NULL),(336,7,7,32,125,1,'2025-02-26 07:45:33',NULL),(337,7,7,33,129,1,'2025-02-26 07:45:33',NULL),(338,7,7,34,133,1,'2025-02-26 07:45:33',NULL),(339,7,7,35,137,1,'2025-02-26 07:45:33',NULL),(340,7,8,36,141,1,'2025-02-26 07:45:48',NULL),(341,7,8,37,145,1,'2025-02-26 07:45:48',NULL),(342,7,8,38,149,1,'2025-02-26 07:45:48',NULL),(343,7,8,39,153,1,'2025-02-26 07:45:48',NULL),(344,7,8,40,157,1,'2025-02-26 07:45:48',NULL),(345,7,7,31,121,1,'2025-02-26 07:50:26',NULL),(346,7,7,32,125,1,'2025-02-26 07:50:26',NULL),(347,7,7,33,129,1,'2025-02-26 07:50:26',NULL),(348,7,7,34,133,1,'2025-02-26 07:50:26',NULL),(349,7,7,35,137,1,'2025-02-26 07:50:26',NULL),(350,7,8,36,141,1,'2025-02-26 07:50:43',NULL),(351,7,8,37,145,1,'2025-02-26 07:50:43',NULL),(352,7,8,38,149,1,'2025-02-26 07:50:43',NULL),(353,7,8,39,153,1,'2025-02-26 07:50:43',NULL),(354,7,8,40,157,1,'2025-02-26 07:50:43',NULL),(355,7,7,31,121,1,'2025-02-26 07:52:54',NULL),(356,7,7,32,125,1,'2025-02-26 07:52:54',NULL),(357,7,7,33,129,1,'2025-02-26 07:52:54',NULL),(358,7,7,34,133,1,'2025-02-26 07:52:54',NULL),(359,7,7,35,137,1,'2025-02-26 07:52:54',NULL),(360,7,8,36,141,1,'2025-02-26 07:53:09',NULL),(361,7,8,37,145,1,'2025-02-26 07:53:09',NULL),(362,7,8,38,149,1,'2025-02-26 07:53:09',NULL),(363,7,8,39,153,1,'2025-02-26 07:53:09',NULL),(364,7,8,40,157,1,'2025-02-26 07:53:09',NULL),(365,7,8,36,141,1,'2025-02-26 07:55:02',NULL),(366,7,8,37,145,1,'2025-02-26 07:55:02',NULL),(367,7,8,38,149,1,'2025-02-26 07:55:02',NULL),(368,7,8,39,153,1,'2025-02-26 07:55:02',NULL),(369,7,8,40,157,1,'2025-02-26 07:55:02',NULL),(370,7,7,31,121,1,'2025-02-26 07:56:21',NULL),(371,7,7,32,125,1,'2025-02-26 07:56:21',NULL),(372,7,7,33,129,1,'2025-02-26 07:56:21',NULL),(373,7,7,34,133,1,'2025-02-26 07:56:21',NULL),(374,7,7,35,137,1,'2025-02-26 07:56:21',NULL),(375,7,8,36,141,1,'2025-02-26 07:56:40',NULL),(376,7,8,37,145,1,'2025-02-26 07:56:40',NULL),(377,7,8,38,149,1,'2025-02-26 07:56:40',NULL),(378,7,8,39,153,1,'2025-02-26 07:56:40',NULL),(379,7,8,40,157,1,'2025-02-26 07:56:40',NULL),(380,7,9,41,161,1,'2025-02-26 07:58:08',NULL),(381,7,9,42,165,1,'2025-02-26 07:58:08',NULL),(382,7,9,43,169,1,'2025-02-26 07:58:08',NULL),(383,7,9,44,173,1,'2025-02-26 07:58:08',NULL),(384,7,9,45,177,1,'2025-02-26 07:58:08',NULL),(385,7,7,31,121,1,'2025-02-26 07:59:04',NULL),(386,7,7,32,125,1,'2025-02-26 07:59:04',NULL),(387,7,7,33,129,1,'2025-02-26 07:59:04',NULL),(388,7,7,34,133,1,'2025-02-26 07:59:04',NULL),(389,7,7,35,137,1,'2025-02-26 07:59:04',NULL),(390,7,8,36,141,1,'2025-02-26 07:59:19',NULL),(391,7,8,37,145,1,'2025-02-26 07:59:19',NULL),(392,7,8,38,149,1,'2025-02-26 07:59:19',NULL),(393,7,8,39,153,1,'2025-02-26 07:59:19',NULL),(394,7,8,40,157,1,'2025-02-26 07:59:19',NULL),(395,7,7,31,121,1,'2025-02-26 08:04:06',NULL),(396,7,7,32,125,1,'2025-02-26 08:04:06',NULL),(397,7,7,33,129,1,'2025-02-26 08:04:06',NULL),(398,7,7,34,133,1,'2025-02-26 08:04:06',NULL),(399,7,7,35,137,1,'2025-02-26 08:04:06',NULL),(400,7,8,36,141,1,'2025-02-26 08:04:22',NULL),(401,7,8,37,145,1,'2025-02-26 08:04:22',NULL),(402,7,8,38,149,1,'2025-02-26 08:04:22',NULL),(403,7,8,39,153,1,'2025-02-26 08:04:22',NULL),(404,7,8,40,157,1,'2025-02-26 08:04:22',NULL),(405,7,7,31,121,1,'2025-02-26 08:06:38',NULL),(406,7,7,32,125,1,'2025-02-26 08:06:38',NULL),(407,7,7,33,129,1,'2025-02-26 08:06:38',NULL),(408,7,7,34,133,1,'2025-02-26 08:06:38',NULL),(409,7,7,35,137,1,'2025-02-26 08:06:38',NULL),(410,7,8,36,141,1,'2025-02-26 08:07:33',NULL),(411,7,8,37,145,1,'2025-02-26 08:07:33',NULL),(412,7,8,38,149,1,'2025-02-26 08:07:33',NULL),(413,7,8,39,153,1,'2025-02-26 08:07:33',NULL),(414,7,8,40,157,1,'2025-02-26 08:07:33',NULL),(415,7,7,31,121,1,'2025-02-26 08:08:38',NULL),(416,7,7,32,125,1,'2025-02-26 08:08:38',NULL),(417,7,7,33,129,1,'2025-02-26 08:08:38',NULL),(418,7,7,34,133,1,'2025-02-26 08:08:38',NULL),(419,7,7,35,137,1,'2025-02-26 08:08:38',NULL),(420,7,8,36,141,1,'2025-02-26 08:08:53',NULL),(421,7,8,37,145,1,'2025-02-26 08:08:53',NULL),(422,7,8,38,149,1,'2025-02-26 08:08:53',NULL),(423,7,8,39,153,1,'2025-02-26 08:08:53',NULL),(424,7,8,40,157,1,'2025-02-26 08:08:53',NULL),(425,7,7,31,121,1,'2025-02-26 08:10:22',NULL),(426,7,7,32,125,1,'2025-02-26 08:10:22',NULL),(427,7,7,33,129,1,'2025-02-26 08:10:22',NULL),(428,7,7,34,133,1,'2025-02-26 08:10:22',NULL),(429,7,7,35,137,1,'2025-02-26 08:10:22',NULL),(430,7,7,31,121,1,'2025-02-26 08:11:49',NULL),(431,7,7,32,125,1,'2025-02-26 08:11:49',NULL),(432,7,7,33,129,1,'2025-02-26 08:11:49',NULL),(433,7,7,34,133,1,'2025-02-26 08:11:49',NULL),(434,7,7,35,137,1,'2025-02-26 08:11:49',NULL),(435,7,8,36,141,1,'2025-02-26 08:12:04',NULL),(436,7,8,37,145,1,'2025-02-26 08:12:04',NULL),(437,7,8,38,149,1,'2025-02-26 08:12:04',NULL),(438,7,8,39,153,1,'2025-02-26 08:12:04',NULL),(439,7,8,40,157,1,'2025-02-26 08:12:04',NULL),(440,7,7,31,121,1,'2025-02-26 09:08:30',NULL),(441,7,7,32,125,1,'2025-02-26 09:08:30',NULL),(442,7,7,33,129,1,'2025-02-26 09:08:30',NULL),(443,7,7,34,133,1,'2025-02-26 09:08:30',NULL),(444,7,7,35,137,1,'2025-02-26 09:08:30',NULL),(445,7,8,36,141,1,'2025-02-26 09:08:42',NULL),(446,7,8,37,145,1,'2025-02-26 09:08:42',NULL),(447,7,8,38,149,1,'2025-02-26 09:08:42',NULL),(448,7,8,39,153,1,'2025-02-26 09:08:42',NULL),(449,7,8,40,157,1,'2025-02-26 09:08:42',NULL),(450,7,8,36,141,1,'2025-02-26 09:10:14',NULL),(451,7,8,37,145,1,'2025-02-26 09:10:14',NULL),(452,7,8,38,149,1,'2025-02-26 09:10:14',NULL),(453,7,8,39,153,1,'2025-02-26 09:10:14',NULL),(454,7,8,40,157,1,'2025-02-26 09:10:14',NULL),(455,7,8,36,141,1,'2025-02-26 09:11:33',NULL),(456,7,8,37,145,1,'2025-02-26 09:11:33',NULL),(457,7,8,38,149,1,'2025-02-26 09:11:33',NULL),(458,7,8,39,153,1,'2025-02-26 09:11:33',NULL),(459,7,8,40,157,1,'2025-02-26 09:11:33',NULL),(460,7,8,36,141,1,'2025-02-26 09:11:46',NULL),(461,7,8,37,145,1,'2025-02-26 09:11:46',NULL),(462,7,8,38,149,1,'2025-02-26 09:11:46',NULL),(463,7,8,39,153,1,'2025-02-26 09:11:46',NULL),(464,7,8,40,157,1,'2025-02-26 09:11:46',NULL),(465,7,8,36,141,1,'2025-02-26 09:17:20',NULL),(466,7,8,37,145,1,'2025-02-26 09:17:20',NULL),(467,7,8,38,149,1,'2025-02-26 09:17:20',NULL),(468,7,8,39,153,1,'2025-02-26 09:17:20',NULL),(469,7,8,40,157,1,'2025-02-26 09:17:20',NULL),(470,7,8,36,141,1,'2025-02-26 09:18:17',NULL),(471,7,8,37,145,1,'2025-02-26 09:18:17',NULL),(472,7,8,38,149,1,'2025-02-26 09:18:17',NULL),(473,7,8,39,153,1,'2025-02-26 09:18:17',NULL),(474,7,8,40,157,1,'2025-02-26 09:18:17',NULL),(475,7,8,36,141,1,'2025-02-26 09:20:47',NULL),(476,7,8,37,145,1,'2025-02-26 09:20:47',NULL),(477,7,8,38,149,1,'2025-02-26 09:20:47',NULL),(478,7,8,39,153,1,'2025-02-26 09:20:47',NULL),(479,7,8,40,157,1,'2025-02-26 09:20:47',NULL),(480,7,7,31,121,1,'2025-02-26 09:21:21',NULL),(481,7,7,32,125,1,'2025-02-26 09:21:21',NULL),(482,7,7,33,129,1,'2025-02-26 09:21:21',NULL),(483,7,7,34,133,1,'2025-02-26 09:21:21',NULL),(484,7,7,35,137,1,'2025-02-26 09:21:21',NULL),(485,7,8,36,141,1,'2025-02-26 09:21:33',NULL),(486,7,8,37,145,1,'2025-02-26 09:21:33',NULL),(487,7,8,38,149,1,'2025-02-26 09:21:33',NULL),(488,7,8,39,153,1,'2025-02-26 09:21:33',NULL),(489,7,8,40,157,1,'2025-02-26 09:21:33',NULL),(490,7,8,36,141,1,'2025-02-26 09:22:58',NULL),(491,7,8,37,145,1,'2025-02-26 09:22:58',NULL),(492,7,8,38,149,1,'2025-02-26 09:22:58',NULL),(493,7,8,39,153,1,'2025-02-26 09:22:58',NULL),(494,7,8,40,157,1,'2025-02-26 09:22:58',NULL),(495,7,8,36,141,1,'2025-02-26 09:24:04',NULL),(496,7,8,37,145,1,'2025-02-26 09:24:04',NULL),(497,7,8,38,149,1,'2025-02-26 09:24:04',NULL),(498,7,8,39,153,1,'2025-02-26 09:24:04',NULL),(499,7,8,40,157,1,'2025-02-26 09:24:04',NULL),(500,7,8,36,141,1,'2025-02-26 09:32:51',NULL),(501,7,8,37,145,1,'2025-02-26 09:32:51',NULL),(502,7,8,38,149,1,'2025-02-26 09:32:51',NULL),(503,7,8,39,153,1,'2025-02-26 09:32:51',NULL),(504,7,8,40,157,1,'2025-02-26 09:32:51',NULL),(505,7,8,36,141,1,'2025-02-26 09:47:29',NULL),(506,7,8,37,145,1,'2025-02-26 09:47:29',NULL),(507,7,8,38,149,1,'2025-02-26 09:47:29',NULL),(508,7,8,39,153,1,'2025-02-26 09:47:29',NULL),(509,7,8,40,157,1,'2025-02-26 09:47:29',NULL),(510,7,8,36,141,1,'2025-02-26 11:31:17',NULL),(511,7,8,37,145,1,'2025-02-26 11:31:17',NULL),(512,7,8,38,149,1,'2025-02-26 11:31:17',NULL),(513,7,8,39,153,1,'2025-02-26 11:31:17',NULL),(514,7,8,40,157,1,'2025-02-26 11:31:17',NULL),(515,7,7,31,121,1,'2025-02-26 11:32:19',NULL),(516,7,7,32,125,1,'2025-02-26 11:32:19',NULL),(517,7,7,33,129,1,'2025-02-26 11:32:19',NULL),(518,7,7,34,133,1,'2025-02-26 11:32:19',NULL),(519,7,7,35,137,1,'2025-02-26 11:32:19',NULL),(520,7,8,36,141,1,'2025-02-26 11:32:41',NULL),(521,7,8,37,145,1,'2025-02-26 11:32:41',NULL),(522,7,8,38,149,1,'2025-02-26 11:32:41',NULL),(523,7,8,39,153,1,'2025-02-26 11:32:41',NULL),(524,7,8,40,157,1,'2025-02-26 11:32:41',NULL),(525,7,8,36,141,1,'2025-02-26 11:38:45',NULL),(526,7,8,37,145,1,'2025-02-26 11:38:45',NULL),(527,7,8,38,149,1,'2025-02-26 11:38:45',NULL),(528,7,8,39,153,1,'2025-02-26 11:38:45',NULL),(529,7,8,40,157,1,'2025-02-26 11:38:45',NULL),(530,7,8,36,141,1,'2025-02-26 11:45:46',NULL),(531,7,8,37,145,1,'2025-02-26 11:45:46',NULL),(532,7,8,38,149,1,'2025-02-26 11:45:46',NULL),(533,7,8,39,153,1,'2025-02-26 11:45:46',NULL),(534,7,8,40,157,1,'2025-02-26 11:45:46',NULL),(535,7,8,36,141,1,'2025-02-26 11:46:03',NULL),(536,7,8,37,145,1,'2025-02-26 11:46:03',NULL),(537,7,8,38,149,1,'2025-02-26 11:46:03',NULL),(538,7,8,39,153,1,'2025-02-26 11:46:03',NULL),(539,7,8,40,157,1,'2025-02-26 11:46:03',NULL),(540,7,8,36,141,1,'2025-02-26 11:48:32',NULL),(541,7,8,37,145,1,'2025-02-26 11:48:32',NULL),(542,7,8,38,149,1,'2025-02-26 11:48:32',NULL),(543,7,8,39,153,1,'2025-02-26 11:48:32',NULL),(544,7,8,40,157,1,'2025-02-26 11:48:32',NULL),(545,7,9,41,161,1,'2025-02-26 11:48:59',NULL),(546,7,9,42,165,1,'2025-02-26 11:48:59',NULL),(547,7,9,43,169,1,'2025-02-26 11:48:59',NULL),(548,7,9,44,173,1,'2025-02-26 11:48:59',NULL),(549,7,9,45,177,1,'2025-02-26 11:48:59',NULL),(550,7,7,31,121,1,'2025-02-26 11:56:18',NULL),(551,7,7,32,125,1,'2025-02-26 11:56:18',NULL),(552,7,7,33,129,1,'2025-02-26 11:56:18',NULL),(553,7,7,34,133,1,'2025-02-26 11:56:18',NULL),(554,7,7,35,137,1,'2025-02-26 11:56:18',NULL),(555,7,8,36,141,1,'2025-02-26 11:56:33',NULL),(556,7,8,37,145,1,'2025-02-26 11:56:33',NULL),(557,7,8,38,149,1,'2025-02-26 11:56:33',NULL),(558,7,8,39,153,1,'2025-02-26 11:56:33',NULL),(559,7,8,40,157,1,'2025-02-26 11:56:33',NULL),(560,7,9,41,161,1,'2025-02-26 11:56:52',NULL),(561,7,9,42,165,1,'2025-02-26 11:56:52',NULL),(562,7,9,43,169,1,'2025-02-26 11:56:52',NULL),(563,7,9,44,173,1,'2025-02-26 11:56:52',NULL),(564,7,9,45,177,1,'2025-02-26 11:56:52',NULL),(565,7,9,41,161,1,'2025-02-26 12:26:12',NULL),(566,7,9,42,165,1,'2025-02-26 12:26:12',NULL),(567,7,9,43,169,1,'2025-02-26 12:26:12',NULL),(568,7,9,44,173,1,'2025-02-26 12:26:12',NULL),(569,7,9,45,177,1,'2025-02-26 12:26:12',NULL),(570,7,9,41,161,1,'2025-02-27 11:15:49',NULL),(571,7,9,42,165,1,'2025-02-27 11:15:49',NULL),(572,7,9,43,169,1,'2025-02-27 11:15:49',NULL),(573,7,9,44,173,1,'2025-02-27 11:15:49',NULL),(574,7,9,45,177,1,'2025-02-27 11:15:49',NULL),(575,7,7,31,121,1,'2025-02-27 11:16:10',NULL),(576,7,7,32,125,1,'2025-02-27 11:16:10',NULL),(577,7,7,33,129,1,'2025-02-27 11:16:10',NULL),(578,7,7,34,133,1,'2025-02-27 11:16:10',NULL),(579,7,7,35,137,1,'2025-02-27 11:16:10',NULL),(580,7,7,31,121,1,'2025-02-27 11:18:52',NULL),(581,7,7,32,125,1,'2025-02-27 11:18:52',NULL),(582,7,7,33,129,1,'2025-02-27 11:18:52',NULL),(583,7,7,34,133,1,'2025-02-27 11:18:52',NULL),(584,7,7,35,137,1,'2025-02-27 11:18:52',NULL),(585,7,7,31,121,1,'2025-02-27 11:22:16',NULL),(586,7,7,32,125,1,'2025-02-27 11:22:16',NULL),(587,7,7,33,129,1,'2025-02-27 11:22:16',NULL),(588,7,7,34,133,1,'2025-02-27 11:22:16',NULL),(589,7,7,35,137,1,'2025-02-27 11:22:16',NULL),(590,7,8,36,141,1,'2025-02-27 11:22:28',NULL),(591,7,8,37,145,1,'2025-02-27 11:22:28',NULL),(592,7,8,38,149,1,'2025-02-27 11:22:28',NULL),(593,7,8,39,153,1,'2025-02-27 11:22:28',NULL),(594,7,8,40,157,1,'2025-02-27 11:22:28',NULL),(595,7,9,41,161,1,'2025-02-27 11:22:36',NULL),(596,7,9,42,165,1,'2025-02-27 11:22:36',NULL),(597,7,9,43,169,1,'2025-02-27 11:22:36',NULL),(598,7,9,44,173,1,'2025-02-27 11:22:36',NULL),(599,7,9,45,177,1,'2025-02-27 11:22:36',NULL),(600,7,7,31,121,1,'2025-02-27 11:22:44',NULL),(601,7,7,32,125,1,'2025-02-27 11:22:44',NULL),(602,7,7,33,129,1,'2025-02-27 11:22:44',NULL),(603,7,7,34,133,1,'2025-02-27 11:22:44',NULL),(604,7,7,35,137,1,'2025-02-27 11:22:44',NULL),(605,7,8,36,141,1,'2025-02-27 11:25:00',NULL),(606,7,8,37,145,1,'2025-02-27 11:25:00',NULL),(607,7,8,38,149,1,'2025-02-27 11:25:00',NULL),(608,7,8,39,153,1,'2025-02-27 11:25:00',NULL),(609,7,8,40,157,1,'2025-02-27 11:25:00',NULL),(610,7,9,41,161,1,'2025-02-27 11:25:09',NULL),(611,7,9,42,165,1,'2025-02-27 11:25:09',NULL),(612,7,9,43,169,1,'2025-02-27 11:25:09',NULL),(613,7,9,44,173,1,'2025-02-27 11:25:09',NULL),(614,7,9,45,177,1,'2025-02-27 11:25:09',NULL),(615,7,7,31,121,1,'2025-02-27 11:25:17',NULL),(616,7,7,32,125,1,'2025-02-27 11:25:17',NULL),(617,7,7,33,129,1,'2025-02-27 11:25:17',NULL),(618,7,7,34,133,1,'2025-02-27 11:25:17',NULL),(619,7,7,35,137,1,'2025-02-27 11:25:17',NULL),(620,7,7,31,121,1,'2025-02-27 11:27:17',NULL),(621,7,7,32,125,1,'2025-02-27 11:27:17',NULL),(622,7,7,33,129,1,'2025-02-27 11:27:17',NULL),(623,7,7,34,133,1,'2025-02-27 11:27:17',NULL),(624,7,7,35,137,1,'2025-02-27 11:27:17',NULL),(625,7,8,36,141,1,'2025-02-27 11:27:25',NULL),(626,7,8,37,145,1,'2025-02-27 11:27:25',NULL),(627,7,8,38,149,1,'2025-02-27 11:27:25',NULL),(628,7,8,39,153,1,'2025-02-27 11:27:25',NULL),(629,7,8,40,157,1,'2025-02-27 11:27:25',NULL),(630,7,9,41,161,1,'2025-02-27 11:27:32',NULL),(631,7,9,42,165,1,'2025-02-27 11:27:32',NULL),(632,7,9,43,169,1,'2025-02-27 11:27:32',NULL),(633,7,9,44,173,1,'2025-02-27 11:27:32',NULL),(634,7,9,45,177,1,'2025-02-27 11:27:32',NULL),(635,7,7,31,121,1,'2025-02-27 11:27:51',NULL),(636,7,7,32,125,1,'2025-02-27 11:27:51',NULL),(637,7,7,33,129,1,'2025-02-27 11:27:51',NULL),(638,7,7,34,133,1,'2025-02-27 11:27:51',NULL),(639,7,7,35,137,1,'2025-02-27 11:27:51',NULL),(640,7,7,31,121,1,'2025-02-27 11:29:32',NULL),(641,7,7,32,125,1,'2025-02-27 11:29:32',NULL),(642,7,7,33,129,1,'2025-02-27 11:29:32',NULL),(643,7,7,34,133,1,'2025-02-27 11:29:32',NULL),(644,7,7,35,137,1,'2025-02-27 11:29:32',NULL),(645,7,8,36,141,1,'2025-02-27 11:29:51',NULL),(646,7,8,37,145,1,'2025-02-27 11:29:51',NULL),(647,7,8,38,149,1,'2025-02-27 11:29:51',NULL),(648,7,8,39,153,1,'2025-02-27 11:29:51',NULL),(649,7,8,40,157,1,'2025-02-27 11:29:51',NULL),(650,7,9,41,161,1,'2025-02-27 11:30:08',NULL),(651,7,9,42,165,1,'2025-02-27 11:30:08',NULL),(652,7,9,43,169,1,'2025-02-27 11:30:08',NULL),(653,7,9,44,173,1,'2025-02-27 11:30:08',NULL),(654,7,9,45,177,1,'2025-02-27 11:30:08',NULL),(655,7,7,31,121,1,'2025-02-27 11:30:21',NULL),(656,7,7,32,125,1,'2025-02-27 11:30:21',NULL),(657,7,7,33,129,1,'2025-02-27 11:30:21',NULL),(658,7,7,34,133,1,'2025-02-27 11:30:21',NULL),(659,7,7,35,137,1,'2025-02-27 11:30:21',NULL),(660,7,9,41,161,1,'2025-02-27 11:33:30',NULL),(661,7,9,42,165,1,'2025-02-27 11:33:30',NULL),(662,7,9,43,169,1,'2025-02-27 11:33:30',NULL),(663,7,9,44,173,1,'2025-02-27 11:33:30',NULL),(664,7,9,45,177,1,'2025-02-27 11:33:30',NULL),(665,7,7,31,121,1,'2025-02-27 11:36:27',NULL),(666,7,7,32,125,1,'2025-02-27 11:36:27',NULL),(667,7,7,33,129,1,'2025-02-27 11:36:27',NULL),(668,7,7,34,133,1,'2025-02-27 11:36:27',NULL),(669,7,7,35,137,1,'2025-02-27 11:36:27',NULL),(670,7,8,36,141,1,'2025-02-27 11:36:41',NULL),(671,7,8,37,145,1,'2025-02-27 11:36:41',NULL),(672,7,8,38,149,1,'2025-02-27 11:36:41',NULL),(673,7,8,39,153,1,'2025-02-27 11:36:41',NULL),(674,7,8,40,157,1,'2025-02-27 11:36:41',NULL),(675,7,9,41,161,1,'2025-02-27 11:37:01',NULL),(676,7,9,42,165,1,'2025-02-27 11:37:01',NULL),(677,7,9,43,169,1,'2025-02-27 11:37:01',NULL),(678,7,9,44,173,1,'2025-02-27 11:37:01',NULL),(679,7,9,45,177,1,'2025-02-27 11:37:01',NULL),(680,7,7,31,121,1,'2025-02-27 11:37:21',NULL),(681,7,7,32,125,1,'2025-02-27 11:37:21',NULL),(682,7,7,33,129,1,'2025-02-27 11:37:21',NULL),(683,7,7,34,133,1,'2025-02-27 11:37:21',NULL),(684,7,7,35,137,1,'2025-02-27 11:37:21',NULL),(685,7,8,36,141,1,'2025-02-27 11:39:59',NULL),(686,7,8,37,145,1,'2025-02-27 11:39:59',NULL),(687,7,8,38,149,1,'2025-02-27 11:39:59',NULL),(688,7,8,39,153,1,'2025-02-27 11:39:59',NULL),(689,7,8,40,157,1,'2025-02-27 11:39:59',NULL),(690,7,9,41,161,1,'2025-02-27 11:40:07',NULL),(691,7,9,42,165,1,'2025-02-27 11:40:07',NULL),(692,7,9,43,169,1,'2025-02-27 11:40:07',NULL),(693,7,9,44,173,1,'2025-02-27 11:40:07',NULL),(694,7,9,45,177,1,'2025-02-27 11:40:07',NULL),(695,7,7,31,121,1,'2025-02-27 11:40:14',NULL),(696,7,7,32,125,1,'2025-02-27 11:40:14',NULL),(697,7,7,33,129,1,'2025-02-27 11:40:14',NULL),(698,7,7,34,133,1,'2025-02-27 11:40:14',NULL),(699,7,7,35,137,1,'2025-02-27 11:40:14',NULL),(700,7,8,36,141,1,'2025-02-27 11:42:47',NULL),(701,7,8,37,145,1,'2025-02-27 11:42:47',NULL),(702,7,8,38,149,1,'2025-02-27 11:42:47',NULL),(703,7,8,39,153,1,'2025-02-27 11:42:47',NULL),(704,7,8,40,157,1,'2025-02-27 11:42:47',NULL),(705,7,9,41,161,1,'2025-02-27 11:42:54',NULL),(706,7,9,42,165,1,'2025-02-27 11:42:54',NULL),(707,7,9,43,169,1,'2025-02-27 11:42:54',NULL),(708,7,9,44,173,1,'2025-02-27 11:42:54',NULL),(709,7,9,45,177,1,'2025-02-27 11:42:54',NULL),(710,7,10,46,181,1,'2025-02-27 11:43:02',NULL),(711,7,10,47,185,1,'2025-02-27 11:43:02',NULL),(712,7,10,48,189,1,'2025-02-27 11:43:02',NULL),(713,7,10,49,193,1,'2025-02-27 11:43:02',NULL),(714,7,10,50,197,1,'2025-02-27 11:43:02',NULL),(715,7,11,51,201,1,'2025-02-27 11:43:10',NULL),(716,7,11,52,205,1,'2025-02-27 11:43:10',NULL),(717,7,11,53,209,1,'2025-02-27 11:43:10',NULL),(718,7,11,54,213,1,'2025-02-27 11:43:10',NULL),(719,7,11,55,217,1,'2025-02-27 11:43:10',NULL),(720,7,7,31,121,1,'2025-02-28 08:28:55',NULL),(721,7,7,32,125,1,'2025-02-28 08:28:55',NULL),(722,7,7,33,129,1,'2025-02-28 08:28:55',NULL),(723,7,7,34,133,1,'2025-02-28 08:28:55',NULL),(724,7,7,35,137,1,'2025-02-28 08:28:55',NULL),(725,7,7,31,121,1,'2025-02-28 08:31:10',NULL),(726,7,7,32,125,1,'2025-02-28 08:31:10',NULL),(727,7,7,33,129,1,'2025-02-28 08:31:10',NULL),(728,7,7,34,133,1,'2025-02-28 08:31:10',NULL),(729,7,7,35,137,1,'2025-02-28 08:31:10',NULL),(730,7,7,31,121,1,'2025-03-03 10:56:57',NULL),(731,7,7,32,125,1,'2025-03-03 10:56:57',NULL),(732,7,7,33,129,1,'2025-03-03 10:56:57',NULL),(733,7,7,34,133,1,'2025-03-03 10:56:57',NULL),(734,7,7,35,137,1,'2025-03-03 10:56:57',NULL),(735,7,7,31,121,1,'2025-03-03 10:58:50',NULL),(736,7,7,32,125,1,'2025-03-03 10:58:50',NULL),(737,7,7,33,129,1,'2025-03-03 10:58:50',NULL),(738,7,7,34,133,1,'2025-03-03 10:58:50',NULL),(739,7,7,35,137,1,'2025-03-03 10:58:50',NULL),(740,7,7,31,121,1,'2025-03-04 12:58:53',NULL),(741,7,7,32,125,1,'2025-03-04 12:58:53',NULL),(742,7,7,33,129,1,'2025-03-04 12:58:53',NULL),(743,7,7,34,133,1,'2025-03-04 12:58:53',NULL),(744,7,7,35,137,1,'2025-03-04 12:58:53',NULL),(745,7,7,31,121,1,'2025-03-04 13:00:17',NULL),(746,7,7,32,125,1,'2025-03-04 13:00:17',NULL),(747,7,7,33,129,1,'2025-03-04 13:00:17',NULL),(748,7,7,34,133,1,'2025-03-04 13:00:17',NULL),(749,7,7,35,137,1,'2025-03-04 13:00:17',NULL),(750,7,7,31,121,1,'2025-03-04 13:01:29',NULL),(751,7,7,32,125,1,'2025-03-04 13:01:29',NULL),(752,7,7,33,129,1,'2025-03-04 13:01:29',NULL),(753,7,7,34,133,1,'2025-03-04 13:01:29',NULL),(754,7,7,35,137,1,'2025-03-04 13:01:29',NULL),(755,7,7,31,121,1,'2025-03-04 13:03:59',NULL),(756,7,7,32,125,1,'2025-03-04 13:03:59',NULL),(757,7,7,33,129,1,'2025-03-04 13:03:59',NULL),(758,7,7,34,133,1,'2025-03-04 13:03:59',NULL),(759,7,7,35,137,1,'2025-03-04 13:03:59',NULL),(760,7,7,31,121,1,'2025-03-04 13:04:31',NULL),(761,7,7,32,125,1,'2025-03-04 13:04:31',NULL),(762,7,7,33,129,1,'2025-03-04 13:04:31',NULL),(763,7,7,34,133,1,'2025-03-04 13:04:31',NULL),(764,7,7,35,137,1,'2025-03-04 13:04:31',NULL),(765,7,7,31,121,1,'2025-03-04 13:06:00',NULL),(766,7,7,32,125,1,'2025-03-04 13:06:00',NULL),(767,7,7,33,129,1,'2025-03-04 13:06:00',NULL),(768,7,7,34,133,1,'2025-03-04 13:06:00',NULL),(769,7,7,35,137,1,'2025-03-04 13:06:00',NULL),(770,7,7,31,121,1,'2025-03-04 13:07:38',NULL),(771,7,7,32,125,1,'2025-03-04 13:07:38',NULL),(772,7,7,33,129,1,'2025-03-04 13:07:38',NULL),(773,7,7,34,133,1,'2025-03-04 13:07:38',NULL),(774,7,7,35,137,1,'2025-03-04 13:07:38',NULL),(775,7,8,36,141,1,'2025-03-05 06:26:55',NULL),(776,7,8,37,145,1,'2025-03-05 06:26:55',NULL),(777,7,8,38,149,1,'2025-03-05 06:26:55',NULL),(778,7,8,39,153,1,'2025-03-05 06:26:55',NULL),(779,7,8,40,157,1,'2025-03-05 06:26:55',NULL),(780,7,9,41,162,0,'2025-03-05 06:27:14',NULL),(781,7,9,42,167,0,'2025-03-05 06:27:14',NULL),(782,7,9,43,169,1,'2025-03-05 06:27:14',NULL),(783,7,9,44,173,1,'2025-03-05 06:27:14',NULL),(784,7,9,45,177,1,'2025-03-05 06:27:14',NULL),(785,7,9,41,161,1,'2025-03-05 06:27:31',NULL),(786,7,9,42,165,1,'2025-03-05 06:27:31',NULL),(787,7,9,43,169,1,'2025-03-05 06:27:31',NULL),(788,7,9,44,173,1,'2025-03-05 06:27:31',NULL),(789,7,9,45,177,1,'2025-03-05 06:27:31',NULL),(790,7,7,31,121,1,'2025-03-05 07:22:34',NULL),(791,7,7,32,125,1,'2025-03-05 07:22:34',NULL),(792,7,7,33,129,1,'2025-03-05 07:22:34',NULL),(793,7,7,34,133,1,'2025-03-05 07:22:34',NULL),(794,7,7,35,137,1,'2025-03-05 07:22:34',NULL),(795,7,7,31,121,1,'2025-03-05 07:22:42',NULL),(796,7,7,32,125,1,'2025-03-05 07:22:42',NULL),(797,7,7,33,129,1,'2025-03-05 07:22:42',NULL),(798,7,7,34,133,1,'2025-03-05 07:22:42',NULL),(799,7,7,35,137,1,'2025-03-05 07:22:42',NULL),(800,7,7,31,121,1,'2025-03-05 07:25:07',NULL),(801,7,7,32,125,1,'2025-03-05 07:25:07',NULL),(802,7,7,33,129,1,'2025-03-05 07:25:07',NULL),(803,7,7,34,133,1,'2025-03-05 07:25:07',NULL),(804,7,7,35,137,1,'2025-03-05 07:25:07',NULL),(805,7,7,31,121,1,'2025-03-05 07:30:07',NULL),(806,7,7,32,125,1,'2025-03-05 07:30:07',NULL),(807,7,7,33,129,1,'2025-03-05 07:30:07',NULL),(808,7,7,34,133,1,'2025-03-05 07:30:07',NULL),(809,7,7,35,137,1,'2025-03-05 07:30:07',NULL),(810,7,7,31,121,1,'2025-03-05 07:30:31',NULL),(811,7,7,32,125,1,'2025-03-05 07:30:31',NULL),(812,7,7,33,129,1,'2025-03-05 07:30:31',NULL),(813,7,7,34,133,1,'2025-03-05 07:30:31',NULL),(814,7,7,35,137,1,'2025-03-05 07:30:31',NULL),(815,7,10,46,181,1,'2025-03-05 07:30:46',NULL),(816,7,10,47,185,1,'2025-03-05 07:30:46',NULL),(817,7,10,48,189,1,'2025-03-05 07:30:46',NULL),(818,7,10,49,193,1,'2025-03-05 07:30:46',NULL),(819,7,10,50,197,1,'2025-03-05 07:30:46',NULL),(820,7,7,31,121,1,'2025-03-05 07:31:07',NULL),(821,7,7,32,125,1,'2025-03-05 07:31:07',NULL),(822,7,7,33,129,1,'2025-03-05 07:31:07',NULL),(823,7,7,34,133,1,'2025-03-05 07:31:07',NULL),(824,7,7,35,137,1,'2025-03-05 07:31:07',NULL),(825,7,7,31,122,0,'2025-03-05 07:31:20',NULL),(826,7,7,32,126,0,'2025-03-05 07:31:20',NULL),(827,7,7,33,132,0,'2025-03-05 07:31:20',NULL),(828,7,7,35,137,1,'2025-03-05 07:31:20',NULL),(829,7,7,31,121,1,'2025-03-05 07:33:54',NULL),(830,7,7,32,125,1,'2025-03-05 07:33:54',NULL),(831,7,7,33,129,1,'2025-03-05 07:33:54',NULL),(832,7,7,34,133,1,'2025-03-05 07:33:54',NULL),(833,7,7,35,137,1,'2025-03-05 07:33:54',NULL),(834,7,7,31,121,1,'2025-03-05 07:34:09',NULL),(835,7,7,32,125,1,'2025-03-05 07:34:09',NULL),(836,7,7,33,129,1,'2025-03-05 07:34:09',NULL),(837,7,7,34,133,1,'2025-03-05 07:34:09',NULL),(838,7,7,35,137,1,'2025-03-05 07:34:09',NULL),(839,7,7,31,122,0,'2025-03-05 07:34:21',NULL),(840,7,7,32,127,0,'2025-03-05 07:34:21',NULL),(841,7,7,33,132,0,'2025-03-05 07:34:21',NULL),(842,7,7,34,136,0,'2025-03-05 07:34:21',NULL),(843,7,7,35,137,1,'2025-03-05 07:34:21',NULL),(844,7,9,41,161,1,'2025-03-06 06:17:23',NULL),(845,7,9,42,165,1,'2025-03-06 06:17:23',NULL),(846,7,9,43,169,1,'2025-03-06 06:17:23',NULL),(847,7,9,44,173,1,'2025-03-06 06:17:23',NULL),(848,7,9,45,177,1,'2025-03-06 06:17:23',NULL),(849,7,8,36,142,0,'2025-03-06 06:18:01',NULL),(850,7,8,37,146,0,'2025-03-06 06:18:01',NULL),(851,7,8,38,151,0,'2025-03-06 06:18:01',NULL),(852,7,8,39,155,0,'2025-03-06 06:18:01',NULL),(853,7,8,40,157,1,'2025-03-06 06:18:01',NULL),(854,7,8,36,141,1,'2025-03-06 10:33:46',NULL),(855,7,8,37,145,1,'2025-03-06 10:33:46',NULL),(856,7,8,38,149,1,'2025-03-06 10:33:46',NULL),(857,7,8,39,153,1,'2025-03-06 10:33:46',NULL),(858,7,8,40,157,1,'2025-03-06 10:33:46',NULL),(859,7,10,46,181,1,'2025-03-06 10:34:02',NULL),(860,7,10,47,185,1,'2025-03-06 10:34:02',NULL),(861,7,10,48,189,1,'2025-03-06 10:34:02',NULL),(862,7,10,49,193,1,'2025-03-06 10:34:02',NULL),(863,7,10,50,197,1,'2025-03-06 10:34:02',NULL),(864,7,11,51,201,1,'2025-03-06 10:34:12',NULL),(865,7,11,52,205,1,'2025-03-06 10:34:12',NULL),(866,7,11,53,209,1,'2025-03-06 10:34:12',NULL),(867,7,11,54,213,1,'2025-03-06 10:34:12',NULL),(868,7,11,55,217,1,'2025-03-06 10:34:12',NULL),(869,7,7,31,122,0,'2025-03-17 11:11:43',NULL),(870,7,7,32,127,0,'2025-03-17 11:11:43',NULL),(871,7,7,33,131,0,'2025-03-17 11:11:43',NULL),(872,7,7,34,135,0,'2025-03-17 11:11:43',NULL),(873,7,7,35,138,0,'2025-03-17 11:11:43',NULL),(874,7,11,51,201,1,'2025-03-17 11:19:00',NULL),(875,7,11,52,205,1,'2025-03-17 11:19:00',NULL),(876,7,11,53,209,1,'2025-03-17 11:19:00',NULL),(877,7,11,54,213,1,'2025-03-17 11:19:00',NULL),(878,7,11,55,217,1,'2025-03-17 11:19:00',NULL),(879,7,11,51,201,1,'2025-03-17 11:19:35',NULL),(880,7,11,52,205,1,'2025-03-17 11:19:35',NULL),(881,7,11,53,209,1,'2025-03-17 11:19:35',NULL),(882,7,11,54,213,1,'2025-03-17 11:19:35',NULL),(883,7,11,55,217,1,'2025-03-17 11:19:35',NULL),(884,7,15,71,281,1,'2025-04-28 09:09:27',NULL),(885,7,15,72,285,1,'2025-04-28 09:09:27',NULL),(886,7,15,73,289,1,'2025-04-28 09:09:27',NULL),(887,7,15,74,293,1,'2025-04-28 09:09:27',NULL),(888,7,15,75,297,1,'2025-04-28 09:09:27',NULL),(889,7,15,76,301,1,'2025-04-28 09:09:27',NULL),(890,7,15,77,305,1,'2025-04-28 09:09:27',NULL),(891,7,15,78,309,1,'2025-04-28 09:09:27',NULL),(892,7,15,79,313,1,'2025-04-28 09:09:27',NULL),(893,7,15,80,317,1,'2025-04-28 09:09:27',NULL),(894,7,15,71,281,1,'2025-04-28 09:12:45',NULL),(895,7,15,72,285,1,'2025-04-28 09:12:45',NULL),(896,7,15,73,289,1,'2025-04-28 09:12:45',NULL),(897,7,15,74,293,1,'2025-04-28 09:12:45',NULL),(898,7,15,75,297,1,'2025-04-28 09:12:45',NULL),(899,7,15,76,301,1,'2025-04-28 09:12:45',NULL),(900,7,15,77,308,0,'2025-04-28 09:12:45',NULL),(901,7,15,78,312,0,'2025-04-28 09:12:45',NULL),(902,7,15,79,316,0,'2025-04-28 09:12:45',NULL),(903,7,15,80,320,0,'2025-04-28 09:12:45',NULL),(904,7,15,71,281,1,'2025-04-28 09:12:46',NULL),(905,7,15,72,285,1,'2025-04-28 09:12:46',NULL),(906,7,15,73,289,1,'2025-04-28 09:12:46',NULL),(907,7,15,74,293,1,'2025-04-28 09:12:46',NULL),(908,7,15,75,297,1,'2025-04-28 09:12:46',NULL),(909,7,15,76,301,1,'2025-04-28 09:12:46',NULL),(910,7,15,77,308,0,'2025-04-28 09:12:46',NULL),(911,7,15,78,312,0,'2025-04-28 09:12:46',NULL),(912,7,15,79,316,0,'2025-04-28 09:12:46',NULL),(913,7,15,80,320,0,'2025-04-28 09:12:46',NULL),(914,7,15,71,281,1,'2025-04-28 09:36:42',NULL),(915,7,15,72,285,1,'2025-04-28 09:36:42',NULL),(916,7,15,73,289,1,'2025-04-28 09:36:42',NULL),(917,7,15,74,293,1,'2025-04-28 09:36:42',NULL),(918,7,15,75,297,1,'2025-04-28 09:36:42',NULL),(919,7,15,76,301,1,'2025-04-28 09:36:42',NULL),(920,7,15,77,305,1,'2025-04-28 09:36:42',NULL),(921,7,15,78,309,1,'2025-04-28 09:36:42',NULL),(922,7,15,79,313,1,'2025-04-28 09:36:42',NULL),(923,7,15,80,317,1,'2025-04-28 09:36:42',NULL),(924,7,15,71,281,1,'2025-04-28 09:40:41',NULL),(925,7,15,72,285,1,'2025-04-28 09:40:41',NULL),(926,7,15,73,289,1,'2025-04-28 09:40:41',NULL),(927,7,15,74,293,1,'2025-04-28 09:40:41',NULL),(928,7,15,75,297,1,'2025-04-28 09:40:41',NULL),(929,7,15,76,301,1,'2025-04-28 09:40:41',NULL),(930,7,15,77,305,1,'2025-04-28 09:40:41',NULL),(931,7,15,78,309,1,'2025-04-28 09:40:41',NULL),(932,7,15,79,313,1,'2025-04-28 09:40:41',NULL),(933,7,15,80,317,1,'2025-04-28 09:40:41',NULL);
/*!40000 ALTER TABLE `user_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_progress`
--

DROP TABLE IF EXISTS `user_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_progress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `step_number` int DEFAULT NULL,
  `is_completed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `user_progress_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_progress`
--

LOCK TABLES `user_progress` WRITE;
/*!40000 ALTER TABLE `user_progress` DISABLE KEYS */;
INSERT INTO `user_progress` VALUES (1,4,1,1,1),(2,5,1,1,1),(260,7,1,1,1),(261,7,1,3,1),(262,7,1,2,1),(263,7,1,4,1),(266,7,1,5,1);
/*!40000 ALTER TABLE `user_progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_quiz_results`
--

DROP TABLE IF EXISTS `user_quiz_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_quiz_results` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `question_text` text NOT NULL,
  `selected_answer` text NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_quiz_results`
--

LOCK TABLES `user_quiz_results` WRITE;
/*!40000 ALTER TABLE `user_quiz_results` DISABLE KEYS */;
INSERT INTO `user_quiz_results` VALUES (1,4,1,'What is 2+2?','4',1,'2025-02-18 07:17:30');
/*!40000 ALTER TABLE `user_quiz_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_scores`
--

DROP TABLE IF EXISTS `user_scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_scores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `quiz_id` int NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_scores_ibfk_2` (`quiz_id`),
  KEY `user_scores_ibfk_1` (`user_id`),
  CONSTRAINT `user_scores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_scores_ibfk_2` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_scores`
--

LOCK TABLES `user_scores` WRITE;
/*!40000 ALTER TABLE `user_scores` DISABLE KEYS */;
INSERT INTO `user_scores` VALUES (173,7,7,100.00,'2025-03-05 07:33:54'),(174,7,9,100.00,'2025-03-06 06:17:24'),(175,7,8,20.00,'2025-03-06 06:18:01'),(176,7,8,100.00,'2025-03-06 10:33:47'),(177,7,10,100.00,'2025-03-06 10:34:02'),(178,7,11,100.00,'2025-03-06 10:34:12'),(179,7,15,100.00,'2025-04-28 09:09:28'),(180,7,15,60.00,'2025-04-28 09:12:45'),(181,7,15,60.00,'2025-04-28 09:12:46'),(182,7,15,100.00,'2025-04-28 09:36:42');
/*!40000 ALTER TABLE `user_scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `verification_code` varchar(255) DEFAULT NULL,
  `reservation_limit` int DEFAULT '5',
  `country` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'dddd','','e@e.coeem','$2a$08$vs0SVJUA.8OiuaVTAJ3L/ew9jigDHFJsOvITFLpFrxd84IAmAfQEC','2025-02-17 11:53:15',2,'active',NULL,5,NULL),(5,'John Doe','','johndoe@example.com','$2a$08$vs0SVJUA.8OiuaVTAJ3L/ew9jigDHFJsOvITFLpFrxd84IAmAfQEC','2025-02-18 10:31:46',2,'active','123456',5,NULL),(7,'admin','admin','admin@c.com','$2a$08$/iUILYnkttn0tjkAOkIXUu2cufO4TJS4Njn1gmlxnX02TVgSgOAbm','2025-02-18 10:34:58',1,'active','123456',5,NULL),(11,'zada','','ewe@ekaa.coeem','$2a$08$DZwGxTlcwDRdeffOGXJR2eBZ5hUGNTji2dK/pLkZGJ6YUiBtEXEYm','2025-04-28 10:14:29',2,'pending','101716',5,'Albania'),(12,'aaaa','','eeee@eeee.cossseem','$2a$08$0Bl5GLbpqxIGkywTlZQvlO39KE3sZX8d/SRJfbE1XhiL9YByK3NMm','2025-04-28 10:16:47',2,'pending','114801',5,NULL),(13,'achiko','tsulaia','a@zaa.com','$2a$08$EuDw15hx.zOJv0mFJCAqOO36twqo1X0if17csdPoTezlLvNMtgc1m','2025-05-04 09:22:30',2,'active',NULL,5,'Georgia'),(14,'aleks','aleks','1@1.com','$2a$08$DeOPwfpFEzLZBDFfBJzCv.VFUujgU1UC4nkNNHzI2mfkL4yP/fl7S','2025-05-24 12:30:04',2,'pending','408455',5,'Armenia'),(15,'aleks','aleks','gajeha7222@frisbook.com','$2a$08$vIdDRGgH8w1ODU3DBm9R4eYGL3b06YI3VC/rs1cSEdc.LMnvamdQe','2025-05-24 12:30:37',2,'active',NULL,5,'Armenia');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-24 17:02:19
