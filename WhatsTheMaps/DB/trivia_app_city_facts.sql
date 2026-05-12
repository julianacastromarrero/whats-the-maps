-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: trivia_app
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

--
-- Table structure for table `city_facts`
--

DROP TABLE IF EXISTS `city_facts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city_facts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_id` int NOT NULL,
  `fact_type_id` int NOT NULL,
  `value_number` decimal(15,2) DEFAULT NULL,
  `value_text` text,
  `value_boolean` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `fact_type_id` (`fact_type_id`),
  CONSTRAINT `city_facts_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE,
  CONSTRAINT `city_facts_ibfk_2` FOREIGN KEY (`fact_type_id`) REFERENCES `fact_types` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_facts`
--

LOCK TABLES `city_facts` WRITE;
/*!40000 ALTER TABLE `city_facts` DISABLE KEYS */;
INSERT INTO `city_facts` VALUES (1,1,1,1839.00,NULL,NULL),(2,1,4,267.00,NULL,NULL),(3,1,3,993500.00,NULL,NULL),(4,1,2,185.00,NULL,NULL),(5,2,1,1718.00,NULL,NULL),(6,2,4,229.00,NULL,NULL),(7,2,3,1526700.00,NULL,NULL),(8,2,2,220.00,NULL,NULL),(9,3,1,1837.00,NULL,NULL),(10,3,4,305.00,NULL,NULL),(11,3,3,2314000.00,NULL,NULL),(12,3,2,32.00,NULL,NULL),(13,4,1,1856.00,NULL,NULL),(14,4,4,281.00,NULL,NULL),(15,4,3,1326000.00,NULL,NULL),(16,4,2,147.00,NULL,NULL),(17,5,1,1852.00,NULL,NULL),(18,5,4,125.00,NULL,NULL),(19,5,3,316000.00,NULL,NULL),(20,5,2,2.00,NULL,NULL),(21,6,1,1852.00,NULL,NULL),(22,6,4,95.00,NULL,NULL),(23,6,3,679000.00,NULL,NULL),(24,6,2,1185.00,NULL,NULL),(25,7,1,1887.00,NULL,NULL),(26,7,4,114.00,NULL,NULL),(27,7,3,204000.00,NULL,NULL),(28,7,2,1116.00,NULL,NULL),(29,8,1,1909.00,NULL,NULL),(30,8,4,84.00,NULL,NULL),(31,8,3,272000.00,NULL,NULL),(32,8,2,976.00,NULL,NULL),(33,9,1,1845.00,NULL,NULL),(34,9,4,20.00,NULL,NULL),(35,9,3,24000.00,NULL,NULL),(36,9,2,180.00,NULL,NULL),(37,10,1,1904.00,NULL,NULL),(38,10,3,72000.00,NULL,NULL),(39,10,2,12.00,NULL,NULL),(40,1,5,NULL,'Sixth and Guadalupe',NULL),(41,1,6,NULL,'Mexico',NULL),(42,1,7,NULL,'The Live Music Capital of the World',NULL),(43,2,5,NULL,'Tower of the Americas',NULL),(44,2,6,NULL,'Mexico',NULL),(45,2,7,NULL,'Alamo City',NULL),(46,3,5,NULL,'JPMorgan Chase Tower',NULL),(47,3,6,NULL,'Louisiana',NULL),(48,3,7,NULL,'Space City',NULL),(49,4,5,NULL,'Bank of America Plaza',NULL),(50,4,6,NULL,'Oklahoma',NULL),(51,4,7,NULL,'The Big D',NULL),(52,5,5,NULL,'One Shoreline Plaza South Tower',NULL),(53,5,6,NULL,'Mexico',NULL),(54,5,7,NULL,'Sparkling City by the Sea',NULL),(55,6,5,NULL,'WestStar Tower',NULL),(56,6,6,NULL,'New Mexico',NULL),(57,6,7,NULL,'The Sun City',NULL),(58,7,5,NULL,'FirstBank Southwest Tower',NULL),(59,7,6,NULL,'New Mexico',NULL),(60,7,7,NULL,'The Yellow Rose of Texas',NULL),(61,8,5,NULL,'Metro Tower',NULL),(62,8,6,NULL,'New Mexico',NULL),(63,8,7,NULL,'Hub City',NULL),(64,9,5,NULL,'Eiffel Tower Replica',NULL),(65,9,6,NULL,'Oklahoma',NULL),(66,9,7,NULL,'Crape Myrtle City',NULL),(67,10,5,NULL,'Baxter Building',NULL),(68,10,6,NULL,'Mexico',NULL),(69,10,7,NULL,'Six Shooter Junction',NULL);
/*!40000 ALTER TABLE `city_facts` ENABLE KEYS */;
INSERT INTO `city_facts`(`city_id`,`fact_type_id`,`value_number`,`value_text`,`value_boolean`) VALUES 
      -- FLORIDA CITIES ADDED
      -- ORLANDO - city_id = 11
      (11, 1, 1856.00, NULL, NULL),   -- founding year
      (11, 2, 27.00,   NULL, NULL),   -- elevation (m)
      (11, 3, 335000.00, NULL, NULL), -- population
      (11, 4, 134.00,  NULL, NULL),   -- tallest structure height(m)
      (11, 5, NULL, '200 South Orange', NULL),  -- tallest structure name
      (11, 6, NULL, 'Georgia', NULL),          -- nearest border
      (11, 7, NULL, 'The City Beautiful', NULL), -- nickname
      -- MIAMI - city_id = 12
      (12, 1, 1896.00, NULL, NULL),   -- founding year
      (12, 2, 2.00,   NULL, NULL),   -- elevation (m)
      (12, 3, 485000.00, NULL, NULL), -- population
      (12, 4, 265.00,  NULL, NULL),   -- tallest structure height(m)
      (12, 5, NULL, 'Panorama Tower', NULL),  -- tallest structure name
      (12, 6, NULL, 'Georgia', NULL),          -- nearest border
      (12, 7, NULL, 'The Magic City', NULL), -- nickname
      -- TAMPA - city_id = 13
      (13, 1, 1849.00, NULL, NULL),   -- founding year
      (13, 2, 11.00,   NULL, NULL),   -- elevation (m)
      (13, 3, 400000.00, NULL, NULL), -- population
      (13, 4, 176.50,  NULL, NULL),   -- tallest structure height(m)
      (13, 5, NULL, '100 North Tampa', NULL),  -- tallest structure name
      (13, 6, NULL, 'Georgia', NULL),          -- nearest border
      (13, 7, NULL, 'The Cigar City', NULL), -- nickname
      -- ST PETERSBURG - city_id = 15
      (15, 1, 1888.00, NULL, NULL),
      (15, 2, 13.40,   NULL, NULL),
      (15, 3, 260000.00, NULL, NULL),
      (15, 4, 157.00,  NULL, NULL),
      (15, 5, NULL, '400 Central', NULL),
      (15, 6, NULL, 'Georgia', NULL),
      (15, 7, NULL, 'The Sunshine City', NULL),
      -- JACKSONVILLE - city_id = 14
      (14, 1, 1822.00, NULL, NULL),
      (14, 2, 5.00,   NULL, NULL),
      (14, 3, 950000.00, NULL, NULL),
      (14, 4, 188.00,  NULL, NULL),
      (14, 5, NULL, 'Bank of America Tower', NULL),
      (14, 6, NULL, 'Georgia', NULL),
      (14, 7, NULL, 'The River City', NULL),
      -- CALIFORNIA CITIES ADDED
      -- LOS ANGELES - city_id = 16
      (16, 1, 1781.00, NULL, NULL),   -- founding year
      (16, 2, 87.00,   NULL, NULL),   -- elevation (m)
      (16, 3, 3857000.00, NULL, NULL), -- population
      (16, 4, 335.00,  NULL, NULL),   -- tallest structure height(m)
      (16, 5, NULL, 'Wilshire Grand Center', NULL),  -- tallest structure name
      (16, 6, NULL, 'Mexico', NULL),          -- nearest border
      (16, 7, NULL, 'City of Angels', NULL), -- nickname
      -- SAN FRANCISCO - city_id = 17
      (17, 1, 1776.00, NULL, NULL),   -- founding year
      (17, 2, 16.00,   NULL, NULL),   -- elevation (m)
      (17, 3, 830000.00, NULL, NULL), -- population
      (17, 4, 326.00,  NULL, NULL),   -- tallest structure height(m)
      (17, 5, NULL, 'Salesforce', NULL),  -- tallest structure name
      (17, 6, NULL, 'Mexico', NULL),          -- nearest border
      (17, 7, NULL, 'The City by the Bay', NULL), -- nickname
      -- SAN DIEGO - city_id = 18
      (18, 1, 1769.00, NULL, NULL),   -- founding year
      (18, 2, 19.00,   NULL, NULL),   -- elevation (m)
      (18, 3, 1390000.00, NULL, NULL), -- population
      (18, 4, 152.40,  NULL, NULL),   -- tallest structure height(m)
      (18, 5, NULL, 'One America Plaza', NULL),  -- tallest structure name
      (18, 6, NULL, 'Mexico', NULL),          -- nearest border
      (18, 7, NULL, 'Americas Finest City', NULL), -- nickname
      -- SACRAMENTO - city_id = 19
      (19, 1, 1848.00, NULL, NULL),   -- founding year
      (19, 2, 9.00,   NULL, NULL),   -- elevation (m)
      (19, 3, 529000.00, NULL, NULL), -- population
      (19, 4, 129.00,  NULL, NULL),   -- tallest structure height(m)
      (19, 5, NULL, 'Wells Fargo Center', NULL),  -- tallest structure name
      (19, 6, NULL, 'Nevada', NULL),          -- nearest border
      (19, 7, NULL, 'City of Trees', NULL), -- nickname
      -- SAN JOSE - city_id = 20
      (20, 1, 1777.00, NULL, NULL),   -- founding year
      (20, 2, 25.00,   NULL, NULL),   -- elevation (m)
      (20, 3, 990000.00, NULL, NULL), -- population
      (20, 4, 91.50,  NULL, NULL),   -- tallest structure height(m)
      (20, 5, NULL, '200 Park Avenue', NULL),  -- tallest structure name
      (20, 6, NULL, 'Mexico', NULL),          -- nearest border
      (20, 7, NULL, 'Capital of Silicon Valley', NULL), -- nickname
      -- SALT LAKE CITY - city_id = 21
      (21, 1, 1847.00, NULL, NULL),   -- founding year
      (21, 2, 1300.00,   NULL, NULL),   -- elevation (m)
      (21, 3, 199723.00, NULL, NULL), -- population
      (21, 4, 136.80,  NULL, NULL),   -- tallest structure height(m)
      (21, 5, NULL, 'Astra Tower', NULL),  -- tallest structure name
      (21, 6, NULL, 'Wyoming', NULL),          -- nearest border
      (21, 7, NULL, 'The Crossroads of the West', NULL), -- nickname
      -- MONTGOMERY - city_id = 22
      (22, 1, 1819.00, NULL, NULL),   -- founding year
      (22, 2, 73.00,   NULL, NULL),   -- elevation (m)
      (22, 3, 200603.00, NULL, NULL), -- population
      (22, 4, 227.00,  NULL, NULL),   -- tallest structure height(m)
      (22, 5, NULL, 'RSA Battle House Tower', NULL),  -- tallest structure name
      (22, 6, NULL, 'Georgia', NULL),          -- nearest border
      (22, 7, NULL, 'The Gump', NULL), -- nickname
      -- PHOENIX - city_id = 23
      (23, 1, 1867.00, NULL, NULL),   -- founding year
      (23, 2, 331.00,   NULL, NULL),   -- elevation (m)
      (23, 3, 1608139.00, NULL, NULL), -- population
      (23, 4, 147.20,  NULL, NULL),   -- tallest structure height(m)
      (23, 5, NULL, 'Chase Tower', NULL),  -- tallest structure name
      (23, 6, NULL, 'Mexico', NULL),          -- nearest border
      (23, 7, NULL, 'Valley of the Sun', NULL), -- nickname
      -- ANCHORAGE - city_id = 24
      (24, 1, 1915.00, NULL, NULL),   -- founding year
      (24, 2, 31.00,   NULL, NULL),   -- elevation (m)
      (24, 3, 291247.00, NULL, NULL), -- population
      (24, 4, 90.00,  NULL, NULL),   -- tallest structure height(m)
      (24, 5, NULL, 'Conoco-Phillips Building', NULL),  -- tallest structure name
      (24, 6, NULL, 'Canada', NULL),          -- nearest border
      (24, 7, NULL, 'The City of Lights and Flowers', NULL), -- nickname
      -- DENVER - city_id = 25
      (25, 1, 1858.00, NULL, NULL),   -- founding year
      (25, 2, 1610.00,   NULL, NULL),   -- elevation (m)
      (25, 3, 715522.00, NULL, NULL), -- population
      (25, 4, 217.60,  NULL, NULL),   -- tallest structure height(m)
      (25, 5, NULL, 'Republic Plaza', NULL),  -- tallest structure name
      (25, 6, NULL, 'Wyoming', NULL),          -- nearest border
      (25, 7, NULL, 'The Mile High City', NULL), -- nickname
      -- BRIDGEPORT - city_id = 26
      (26, 1, 1821.00, NULL, NULL),   -- founding year
      (26, 2, 1.00,   NULL, NULL),   -- elevation (m)
      (26, 3, 148654.00, NULL, NULL), -- population
      (26, 4, 76.00,  NULL, NULL),   -- tallest structure height(m)
      (26, 5, NULL, 'Bridgeport Center', NULL),  -- tallest structure name
      (26, 6, NULL, 'New York', NULL),          -- nearest border
      (26, 7, NULL, 'The Park City', NULL), -- nickname
      -- WILMINGTON - city_id = 27
      (27, 1, 1739.00, NULL, NULL),   -- founding year
      (27, 2, 28.00,   NULL, NULL),   -- elevation (m)
      (27, 3, 70898.00, NULL, NULL), -- population
      (27, 4, 110.00,  NULL, NULL),   -- tallest structure height(m)
      (27, 5, NULL, 'Chase Manhattan Center', NULL),  -- tallest structure name
      (27, 6, NULL, 'Pennsylvania', NULL),          -- nearest border
      (27, 7, NULL, 'Corporate Capital of the World', NULL), -- nickname
      -- ATLANTA - city_id = 28
      (28, 1, 1837.00, NULL, NULL),   -- founding year
      (28, 2, 320.00,   NULL, NULL),   -- elevation (m)
      (28, 3, 498715.00, NULL, NULL), -- population
      (28, 4, 311.80,  NULL, NULL),   -- tallest structure height(m)
      (28, 5, NULL, 'Bank of American Plaza', NULL),  -- tallest structure name
      (28, 6, NULL, 'Alabama', NULL),          -- nearest border
      (28, 7, NULL, 'The City In a Forest', NULL), -- nickname
      -- HONOLULU - city_id = 29
      (29, 1, 1850.00, NULL, NULL),   -- founding year
      (29, 2, 5.00,   NULL, NULL),   -- elevation (m)
      (29, 3, 350964.00, NULL, NULL), -- population
      (29, 4, 133.00,  NULL, NULL),   -- tallest structure height(m)
      (29, 5, NULL, 'The Central Ala Moana', NULL),  -- tallest structure name
      (29, 6, NULL, 'None', NULL),          -- nearest border
      (29, 7, NULL, 'Crossroads of the Pacific', NULL), -- nickname
      -- BOISE - city_id = 30
      (30, 1, 1863.00, NULL, NULL),   -- founding year
      (30, 2, 824.00,   NULL, NULL),   -- elevation (m)
      (30, 3, 235684.00, NULL, NULL), -- population
      (30, 4, 98.50,  NULL, NULL),   -- tallest structure height(m)
      (30, 5, NULL, 'Eighth and Main', NULL),  -- tallest structure name
      (30, 6, NULL, 'Oregon', NULL),          -- nearest border
      (30, 7, NULL, 'The City of Trees', NULL), -- nickname
      -- CHICAGO - city_id = 31
      (31, 1, 1780.00, NULL, NULL),   -- founding year
      (31, 2, 182.02,   NULL, NULL),   -- elevation (m)
      (31, 3, 2746388.00, NULL, NULL), -- population
      (31, 4, 442.00,  NULL, NULL),   -- tallest structure height(m)
      (31, 5, NULL, 'Willis Tower', NULL),  -- tallest structure name
      (31, 6, NULL, 'Indiana', NULL),          -- nearest border
      (31, 7, NULL, 'The Windy City', NULL), -- nickname
      -- INDIANAPOLIS - city_id = 32
      (32, 1, 1821.00, NULL, NULL),   -- founding year
      (32, 2, 219.00,   NULL, NULL),   -- elevation (m)
      (32, 3, 887642.00, NULL, NULL), -- population
      (32, 4, 213.70,  NULL, NULL),   -- tallest structure height(m)
      (32, 5, NULL, 'Salesforce Tower', NULL),  -- tallest structure name
      (32, 6, NULL, 'Illinois', NULL),          -- nearest border
      (32, 7, NULL, 'Circle City', NULL), -- nickname
      -- DES MOINES - city_id = 33
      (33, 1, 1843.00, NULL, NULL),   -- founding year
      (33, 2, 3242.00,   NULL, NULL),   -- elevation (m)
      (33, 3, 214133.00, NULL, NULL), -- population
      (33, 4, 192.00,  NULL, NULL),   -- tallest structure height(m)
      (33, 5, NULL, '801 Grand', NULL),  -- tallest structure name
      (33, 6, NULL, 'Missouri', NULL),          -- nearest border
      (33, 7, NULL, 'Niceville USA', NULL), -- nickname
      -- WICHITA - city_id = 34
      (34, 1, 1868.00, NULL, NULL),   -- founding year
      (34, 2, 397.00,   NULL, NULL),   -- elevation (m)
      (34, 3, 397532.00, NULL, NULL), -- population
      (34, 4, 98.00,  NULL, NULL),   -- tallest structure height(m)
      (34, 5, NULL, 'Epic Center', NULL),  -- tallest structure name
      (34, 6, NULL, 'Oklahoma', NULL),          -- nearest border
      (34, 7, NULL, 'Air Capital of the World', NULL), -- nickname
      -- LOUISVILLE - city_id = 35
      (35, 1, 1778.00, NULL, NULL),   -- founding year
      (35, 2, 142.00,   NULL, NULL),   -- elevation (m)
      (35, 3, 633045.00, NULL, NULL), -- population
      (35, 4, 167.30,  NULL, NULL),   -- tallest structure height(m)
      (35, 5, NULL, '400 West Market', NULL),  -- tallest structure name
      (35, 6, NULL, 'Indiana', NULL),          -- nearest border
      (35, 7, NULL, 'Derby City', NULL), -- nickname
      -- NEW ORLEANS - city_id = 36
      (36, 1, 1718.00, NULL, NULL),   -- founding year
      (36, 2, -2.00,   NULL, NULL),   -- elevation (m)
      (36, 3, 383997.00, NULL, NULL), -- population
      (36, 4, 212.00,  NULL, NULL),   -- tallest structure height(m)
      (36, 5, NULL, 'Hancock Whitney Center', NULL),  -- tallest structure name
      (36, 6, NULL, 'Mississippi', NULL),          -- nearest border
      (36, 7, NULL, 'The Crescent City', NULL), -- nickname
      -- PORTLAND - city_id = 37
      (37, 1, 1623.00, NULL, NULL),   -- founding year
      (37, 2, 19.00,   NULL, NULL),   -- elevation (m)
      (37, 3, 68408.00, NULL, NULL), -- population
      (37, 4, 62.30,  NULL, NULL),   -- tallest structure height(m)
      (37, 5, NULL, 'The Casco', NULL),  -- tallest structure name
      (37, 6, NULL, 'New Hampshire', NULL),          -- nearest border
      (37, 7, NULL, 'The Forest City', NULL), -- nickname
      -- BALTIMORE - city_id = 38
      (38, 1, 1625.00, NULL, NULL),   -- founding year
      (38, 2, 14.00,   NULL, NULL),   -- elevation (m)
      (38, 3, 675647.00, NULL, NULL), -- population
      (38, 4, 161.20,  NULL, NULL),   -- tallest structure height(m)
      (38, 5, NULL, '100 Light Street', NULL),  -- tallest structure name
      (38, 6, NULL, 'Pennsylvania', NULL),          -- nearest border
      (38, 7, NULL, 'Charm City', NULL), -- nickname
      -- BOSTON - city_id = 39
      (39, 1, 1850.00, NULL, NULL),   -- founding year
      (39, 2, 5.00,   NULL, NULL),   -- elevation (m)
      (39, 3, 350964.00, NULL, NULL), -- population
      (39, 4, 241.00,  NULL, NULL),   -- tallest structure height(m)
      (39, 5, NULL, 'John Hancock Tower', NULL),  -- tallest structure name
      (39, 6, NULL, 'New Hampshire', NULL),          -- nearest border
      (39, 7, NULL, 'Bean Town', NULL), -- nickname
      -- DETROIT - city_id = 40
      (40, 1, 1701.00, NULL, NULL),   -- founding year
      (40, 2, 182.00,   NULL, NULL),   -- elevation (m)
      (40, 3, 639111.00, NULL, NULL), -- population
      (40, 4, 221.50,  NULL, NULL),   -- tallest structure height(m)
      (40, 5, NULL, 'Detroit Marriott at the Renaissance Center', NULL),  -- tallest structure name
      (40, 6, NULL, 'Canada', NULL),          -- nearest border
      (40, 7, NULL, 'The Motor City', NULL), -- nickname
      -- MINNEAPOLIS - city_id = 41
      (41, 1, 1856.00, NULL, NULL),   -- founding year
      (41, 2, 250.00,   NULL, NULL),   -- elevation (m)
      (41, 3, 429954.00, NULL, NULL), -- population
      (41, 4, 241.40,  NULL, NULL),   -- tallest structure height(m)
      (41, 5, NULL, 'IDS Tower', NULL),  -- tallest structure name
      (41, 6, NULL, 'Wisconsin', NULL),          -- nearest border
      (41, 7, NULL, 'City of Lakes', NULL), -- nickname
      -- JACKSON - city_id = 42
      (42, 1, 1822.00, NULL, NULL),   -- founding year
      (42, 2, 110.00,   NULL, NULL),   -- elevation (m)
      (42, 3, 153701.00, NULL, NULL), -- population
      (42, 4, 97.00,  NULL, NULL),   -- tallest structure height(m)
      (42, 5, NULL, 'Regions Plaza', NULL),  -- tallest structure name
      (42, 6, NULL, 'Louisiana', NULL),          -- nearest border
      (42, 7, NULL, 'Jacktown', NULL), -- nickname
      -- KANSAS CITY - city_id = 43
      (43, 1, 1838.00, NULL, NULL),   -- founding year
      (43, 2, 353.50,   NULL, NULL),   -- elevation (m)
      (43, 3, 2192035.00, NULL, NULL), -- population
      (43, 4, 189.90,  NULL, NULL),   -- tallest structure height(m)
      (43, 5, NULL, 'One Kansas City Place', NULL),  -- tallest structure name
      (43, 6, NULL, 'Kansas', NULL),          -- nearest border
      (43, 7, NULL, 'The City of Fountains', NULL), -- nickname
      -- BILLINGS - city_id = 44
      (44, 1, 1877.00, NULL, NULL),   -- founding year
      (44, 2, 979.00,   NULL, NULL),   -- elevation (m)
      (44, 3, 117116.00, NULL, NULL), -- population
      (44, 4, 83.00,  NULL, NULL),   -- tallest structure height(m)
      (44, 5, NULL, 'First Interstate Center', NULL),  -- tallest structure name
      (44, 6, NULL, 'Wyoming', NULL),          -- nearest border
      (44, 7, NULL, 'Magic City', NULL), -- nickname
      -- OMAHA - city_id = 45
      (45, 1, 1854.00, NULL, NULL),   -- founding year
      (45, 2, 320.00,   NULL, NULL),   -- elevation (m)
      (45, 3, 486051.00, NULL, NULL), -- population
      (45, 4, 206.00,  NULL, NULL),   -- tallest structure height(m)
      (45, 5, NULL, 'Mutual of Omaha Tower', NULL),  -- tallest structure name
      (45, 6, NULL, 'Iowa', NULL),          -- nearest border
      (45, 7, NULL, 'Gate-City of the West', NULL), -- nickname
      -- LAS VEGAS - city_id = 46
      (46, 1, 1905.00, NULL, NULL),   -- founding year
      (46, 2, 610.00,   NULL, NULL),   -- elevation (m)
      (46, 3, 641903.00, NULL, NULL), -- population
      (46, 4, 350.00,  NULL, NULL),   -- tallest structure height(m)
      (46, 5, NULL, 'The Strat', NULL),  -- tallest structure name
      (46, 6, NULL, 'California', NULL),          -- nearest border
      (46, 7, NULL, 'Sin City', NULL), -- nickname
      -- MANCHESTER - city_id = 47
      (47, 1, 1751.00, NULL, NULL),   -- founding year
      (47, 2, 64.00,   NULL, NULL),   -- elevation (m)
      (47, 3, 115644.00, NULL, NULL), -- population
      (47, 4, 84.00,  NULL, NULL),   -- tallest structure height(m)
      (47, 5, NULL, 'City Hall Plaza', NULL),  -- tallest structure name
      (47, 6, NULL, 'Massachusetts', NULL),          -- nearest border
      (47, 7, NULL, 'Queen City', NULL), -- nickname
      -- NEWARK - city_id = 48
      (48, 1, 1663.00, NULL, NULL),   -- founding year
      (48, 2, 4.00,   NULL, NULL),   -- elevation (m)
      (48, 3, 311549.00, NULL, NULL), -- population
      (48, 4, 142.00,  NULL, NULL),   -- tallest structure height(m)
      (48, 5, NULL, 'National Newark Building', NULL),  -- tallest structure name
      (48, 6, NULL, 'New York', NULL),          -- nearest border
      (48, 7, NULL, 'Brick City', NULL), -- nickname
      -- ALBUQUERQUE - city_id = 49
      (49, 1, 1706.00, NULL, NULL),   -- founding year
      (49, 2, 1619.00,   NULL, NULL),   -- elevation (m)
      (49, 3, 564599.00, NULL, NULL), -- population
      (49, 4, 107.00,  NULL, NULL),   -- tallest structure height(m)
      (49, 5, NULL, 'Albuquerque Plaza Office Tower', NULL),  -- tallest structure name
      (49, 6, NULL, 'Arizona', NULL),          -- nearest border
      (49, 7, NULL, 'The Duke City', NULL), -- nickname
      -- NEW YORK CITY - city_id = 50
      (50, 1, 1624.00, NULL, NULL),   -- founding year
      (50, 2, 541.00,   NULL, NULL),   -- elevation (m)
      (50, 3, 8804190.00, NULL, NULL), -- population
      (50, 4, 98.50,  NULL, NULL),   -- tallest structure height(m)
      (50, 5, NULL, 'One World Trade Center', NULL),  -- tallest structure name
      (50, 6, NULL, 'New Jersey', NULL),          -- nearest border
      (50, 7, NULL, 'The Big Apple', NULL), -- nickname
            -- CHARLOTTE - city_id = 51
      (51, 1, 1755.00, NULL, NULL),   -- founding year
      (51, 2, 205.00,   NULL, NULL),   -- elevation (m)
      (51, 3, 874579.00, NULL, NULL), -- population
      (51, 4, 265.50,  NULL, NULL),   -- tallest structure height(m)
      (51, 5, NULL, 'Bank of America Corporate Center', NULL),  -- tallest structure name
      (51, 6, NULL, 'South Carolina', NULL),          -- nearest border
      (51, 7, NULL, 'The Queen City', NULL), -- nickname
      -- FARGO - city_id = 52
      (52, 1, 1871.00, NULL, NULL),   -- founding year
      (52, 2, 276.00,   NULL, NULL),   -- elevation (m)
      (52, 3, 125990.00, NULL, NULL), -- population
      (52, 4, 71.00,  NULL, NULL),   -- tallest structure height(m)
      (52, 5, NULL, 'RDO Building', NULL),  -- tallest structure name
      (52, 6, NULL, 'Minnesota', NULL),          -- nearest border
      (52, 7, NULL, 'Gateway to the West', NULL), -- nickname
      -- COLUMBUS - city_id = 53
      (53, 1, 1812.00, NULL, NULL),   -- founding year
      (53, 2, 241.00,   NULL, NULL),   -- elevation (m)
      (53, 3, 905748.00, NULL, NULL), -- population
      (53, 4, 190.20,  NULL, NULL),   -- tallest structure height(m)
      (53, 5, NULL, 'Rhodes State Office Tower', NULL),  -- tallest structure name
      (53, 6, NULL, 'West Virginia', NULL),          -- nearest border
      (53, 7, NULL, 'The Arch City', NULL), -- nickname
      -- OKLAHOMA CITY - city_id = 54
      (54, 1, 1889.00, NULL, NULL),   -- founding year
      (54, 2, 365.00,   NULL, NULL),   -- elevation (m)
      (54, 3, 681054.00, NULL, NULL), -- population
      (54, 4, 257.30,  NULL, NULL),   -- tallest structure height(m)
      (54, 5, NULL, 'Devon Energy Center', NULL),  -- tallest structure name
      (54, 6, NULL, 'Kansas', NULL),          -- nearest border
      (54, 7, NULL, 'Loud City', NULL), -- nickname
      -- EUGENE - city_id = 55
      (55, 1, 1468.00, NULL, NULL),   -- founding year
      (55, 2, 126.00,   NULL, NULL),   -- elevation (m)
      (55, 3, 176654.00, NULL, NULL), -- population
      (55, 4, 65.00,  NULL, NULL),   -- tallest structure height(m)
      (55, 5, NULL, 'Ya-Po-Ah Terrace', NULL),  -- tallest structure name
      (55, 6, NULL, 'California', NULL),          -- nearest border
      (55, 7, NULL, 'Emerald Valley', NULL), -- nickname
      -- PHILADELPHIA - city_id = 56
      (56, 1, 1682.00, NULL, NULL),   -- founding year
      (56, 2, 12.00,   NULL, NULL),   -- elevation (m)
      (56, 3, 1603797.00, NULL, NULL), -- population
      (56, 4, 339.10,  NULL, NULL),   -- tallest structure height(m)
      (56, 5, NULL, 'Comcast Technology Tower', NULL),  -- tallest structure name
      (56, 6, NULL, 'New Jersey', NULL),          -- nearest border
      (56, 7, NULL, 'The City of Brotherly Love', NULL), -- nickname
      -- PROVIDENCE - city_id = 57
      (57, 1, 1636.00, NULL, NULL),   -- founding year
      (57, 2, 3.00,   NULL, NULL),   -- elevation (m)
      (57, 3, 190934.00, NULL, NULL), -- population
      (57, 4, 130.00,  NULL, NULL),   -- tallest structure height(m)
      (57, 5, NULL, 'Industrial National Bank Building', NULL),  -- tallest structure name
      (57, 6, NULL, 'Massachusetts', NULL),          -- nearest border
      (57, 7, NULL, 'The Creative Capital', NULL), -- nickname
      -- COLUMBIA - city_id = 58
      (58, 1, 1786.00, NULL, NULL),   -- founding year
      (58, 2, 84.00,   NULL, NULL),   -- elevation (m)
      (58, 3, 136632.00, NULL, NULL), -- population
      (58, 4, 106.00,  NULL, NULL),   -- tallest structure height(m)
      (58, 5, NULL, 'Capitol Center', NULL),  -- tallest structure name
      (58, 6, NULL, 'North Carolina', NULL),          -- nearest border
      (58, 7, NULL, 'Soda City', NULL), -- nickname
      -- SIOUX FALLS - city_id = 59
      (59, 1, 1856.00, NULL, NULL),   -- founding year
      (59, 2, 446.00,   NULL, NULL),   -- elevation (m)
      (59, 3, 192517.00, NULL, NULL), -- population
      (59, 4, 53.00,  NULL, NULL),   -- tallest structure height(m)
      (59, 5, NULL, 'CenturyLink Tower', NULL),  -- tallest structure name
      (59, 6, NULL, 'Minnesota', NULL),          -- nearest border
      (59, 7, NULL, 'Best Little City in America', NULL), -- nickname
      -- NASHVILLE - city_id = 60
      (60, 1, 1779.00, NULL, NULL),   -- founding year
      (60, 2, 169.00,   NULL, NULL),   -- elevation (m)
      (60, 3, 715884.00, NULL, NULL), -- population
      (60, 4, 188.10,  NULL, NULL),   -- tallest structure height(m)
      (60, 5, NULL, '333 Commerce', NULL),  -- tallest structure name
      (60, 6, NULL, 'Kentucky', NULL),          -- nearest border
      (60, 7, NULL, 'Music City', NULL), -- nickname
      -- BURLINGTON - city_id = 61
      (61, 1, 1783.00, NULL, NULL),   -- founding year
      (61, 2, 61.00,   NULL, NULL),   -- elevation (m)
      (61, 3, 44743.00, NULL, NULL), -- population
      (61, 4, 51.80,  NULL, NULL),   -- tallest structure height(m)
      (61, 5, NULL, 'IRA Allen Chapel', NULL),  -- tallest structure name
      (61, 6, NULL, 'New York', NULL),          -- nearest border
      (61, 7, NULL, 'BTV', NULL), -- nickname
      -- VIRGINIA BEACH - city_id = 62
      (62, 1, 1906.00, NULL, NULL),   -- founding year
      (62, 2, 3.00,   NULL, NULL),   -- elevation (m)
      (62, 3, 459470.00, NULL, NULL), -- population
      (62, 4, 155.00,  NULL, NULL),   -- tallest structure height(m)
      (62, 5, NULL, 'Westin Virginia Beach Tower', NULL),  -- tallest structure name
      (62, 6, NULL, 'North Carolina', NULL),          -- nearest border
      (62, 7, NULL, 'The Resort City', NULL), -- nickname
      -- SEATTLE - city_id = 63
      (63, 1, 1851.00, NULL, NULL),   -- founding year
      (63, 2, 45.00,   NULL, NULL),   -- elevation (m)
      (63, 3, 737015.00, NULL, NULL), -- population
      (63, 4, 285.70,  NULL, NULL),   -- tallest structure height(m)
      (63, 5, NULL, 'Columbia Center', NULL),  -- tallest structure name
      (63, 6, NULL, 'Canada', NULL),          -- nearest border
      (63, 7, NULL, 'Jet City', NULL), -- nickname
      -- CHARLESTON - city_id = 64
      (64, 1, 1788.00, NULL, NULL),   -- founding year
      (64, 2, 182.00,   NULL, NULL),   -- elevation (m)
      (64, 3, 48864.00, NULL, NULL), -- population
      (64, 4, 89.00,  NULL, NULL),   -- tallest structure height(m)
      (64, 5, NULL, 'West Virginia State Capitol', NULL),  -- tallest structure name
      (64, 6, NULL, 'Ohio', NULL),          -- nearest border
      (64, 7, NULL, 'Charlie West', NULL), -- nickname
      -- MILWAUKEE - city_id = 65
      (65, 1, 1846.00, NULL, NULL),   -- founding year
      (65, 2, 188.00,   NULL, NULL),   -- elevation (m)
      (65, 3, 577222.00, NULL, NULL), -- population
      (65, 4, 183.20,  NULL, NULL),   -- tallest structure height(m)
      (65, 5, NULL, 'US Bank Center', NULL),  -- tallest structure name
      (65, 6, NULL, 'Illinois', NULL),          -- nearest border
      (65, 7, NULL, 'Cream City', NULL), -- nickname
      -- CHEYENNE - city_id = 66
      (66, 1, 1867.00, NULL, NULL),   -- founding year
      (66, 2, 1855.00,   NULL, NULL),   -- elevation (m)
      (66, 3, 65132.00, NULL, NULL), -- population
      (66, 4, 45.00,  NULL, NULL),   -- tallest structure height(m)
      (66, 5, NULL, 'Wyoming Financial Center', NULL),  -- tallest structure name
      (66, 6, NULL, 'Colorado', NULL),          -- nearest border
      (66, 7, NULL, 'Magic City of the Plains', NULL), -- nickname
      -- MEMPHIS - city_id = 67
      (67, 1, 1819.00, NULL, NULL),   -- founding year
      (67, 2, 103.00,   NULL, NULL),   -- elevation (m)
      (67, 3, 633104.00, NULL, NULL), -- population
      (67, 4, 130.00,  NULL, NULL),   -- tallest structure height(m)
      (67, 5, NULL, '100 North Main', NULL),  -- tallest structure name
      (67, 6, NULL, 'Arkansas', NULL),          -- nearest border
      (67, 7, NULL, 'Bluff City', NULL), -- nickname
      -- TUCSON - city_id = 68
      (68, 1, 1775.00, NULL, NULL),   -- founding year
      (68, 2, 728.00,   NULL, NULL),   -- elevation (m)
      (68, 3, 542629.00, NULL, NULL), -- population
      (68, 4, 100.00,  NULL, NULL),   -- tallest structure height(m)
      (68, 5, NULL, 'One South Church', NULL),  -- tallest structure name
      (68, 6, NULL, 'Mexico', NULL),          -- nearest border
      (68, 7, NULL, 'The Old Pueblo', NULL), -- nickname
      -- MESA - city_id = 69
      (69, 1, 1878.00, NULL, NULL),   -- founding year
      (69, 2, 404.00,   NULL, NULL),   -- elevation (m)
      (69, 3, 504258.00, NULL, NULL), -- population
      (69, 4, 68.00,  NULL, NULL),   -- tallest structure height(m)
      (69, 5, NULL, 'Bank of America Financial Plaza', NULL),  -- tallest structure name
      (69, 6, NULL, 'Mexico', NULL),          -- nearest border
      (69, 7, NULL, 'Gateway City', NULL), -- nickname
      -- RALEIGH - city_id = 70
      (70, 1, 1792.00, NULL, NULL),   -- founding year
      (70, 2, 101.00,   NULL, NULL),   -- elevation (m)
      (70, 3, 467665.00, NULL, NULL), -- population
      (70, 4, 164.00,  NULL, NULL),   -- tallest structure height(m)
      (70, 5, NULL, 'PNC Plaza', NULL),  -- tallest structure name
      (70, 6, NULL, 'Virginia', NULL),          -- nearest border
      (70, 7, NULL, 'City of Oaks', NULL), -- nickname
      -- COLORADO SPRINGS - city_id = 71
      (71, 1, 1886.00, NULL, NULL),   -- founding year
      (71, 2, 1832.00,   NULL, NULL),   -- elevation (m)
      (71, 3, 478961.00, NULL, NULL), -- population
      (71, 4, 75.00,  NULL, NULL),   -- tallest structure height(m)
      (71, 5, NULL, 'Wells Fargo Tower', NULL),  -- tallest structure name
      (71, 6, NULL, 'Kansas', NULL),          -- nearest border
      (71, 7, NULL, 'Olympic City', NULL), -- nickname
      -- TULSA - city_id = 72
      (72, 1, 1830.00, NULL, NULL),   -- founding year
      (72, 2, 194.00,   NULL, NULL),   -- elevation (m)
      (72, 3, 413066.00, NULL, NULL), -- population
      (72, 4, 203.30,  NULL, NULL),   -- tallest structure height(m)
      (72, 5, NULL, 'BOK Tower', NULL),  -- tallest structure name
      (72, 6, NULL, 'Kansas', NULL),          -- nearest border
      (72, 7, NULL, 'Oil Capital of the World', NULL), -- nickname
      -- AURORA - city_id = 73
      (73, 1, 1891.00, NULL, NULL),   -- founding year
      (73, 2, 1694.00,   NULL, NULL),   -- elevation (m)
      (73, 3, 386261.00, NULL, NULL), -- population
      (73, 4, 60.20,  NULL, NULL),   -- tallest structure height(m)
      (73, 5, NULL, 'Gaylord Rockies and Resort Convention center', NULL),  -- tallest structure name
      (73, 6, NULL, 'Kansas', NULL),          -- nearest border
      (73, 7, NULL, 'The Gateway to the Rockies', NULL), -- nickname
      -- CLEVELAND - city_id = 74
      (74, 1, 1796.00, NULL, NULL),   -- founding year
      (74, 2, 199.00,   NULL, NULL),   -- elevation (m)
      (74, 3, 372624.00, NULL, NULL), -- population
      (74, 4, 288.70,  NULL, NULL),   -- tallest structure height(m)
      (74, 5, NULL, 'Key Tower', NULL),  -- tallest structure name
      (74, 6, NULL, 'Pennsylvania', NULL),          -- nearest border
      (74, 7, NULL, 'The Forest City', NULL), -- nickname
      -- HENDERSON - city_id = 75
      (75, 1, 1941.00, NULL, NULL),   -- founding year
      (75, 2, 569.00,   NULL, NULL),   -- elevation (m)
      (75, 3, 317610.00, NULL, NULL), -- population
      (75, 4, 70.10,  NULL, NULL),   -- tallest structure height(m)
      (75, 5, NULL, 'Sunset Station', NULL),  -- tallest structure name
      (75, 6, NULL, 'Arizona', NULL),          -- nearest border
      (75, 7, NULL, 'Hendertucky', NULL), -- nickname
      -- LEXINGTON - city_id = 76
      (76, 1, 1782.00, NULL, NULL),   -- founding year
      (76, 2, 298.00,   NULL, NULL),   -- elevation (m)
      (76, 3, 322570.00, NULL, NULL), -- population
      (76, 4, 125.00,  NULL, NULL),   -- tallest structure height(m)
      (76, 5, NULL, 'Lexington Financial Center', NULL),  -- tallest structure name
      (76, 6, NULL, 'Ohio', NULL),          -- nearest border
      (76, 7, NULL, 'Athens of the West', NULL), -- nickname
      -- CINCINATTI - city_id = 77
      (77, 1, 1788.00, NULL, NULL),   -- founding year
      (77, 2, 226.00,   NULL, NULL),   -- elevation (m)
      (77, 3, 309317.00, NULL, NULL), -- population
      (77, 4, 202.70,  NULL, NULL),   -- tallest structure height(m)
      (77, 5, NULL, 'Great American Tower', NULL),  -- tallest structure name
      (77, 6, NULL, 'Kentucky', NULL),          -- nearest border
      (77, 7, NULL, 'The Birthplace of Professional Baseball', NULL), -- nickname
      -- SAINT PAUL - city_id = 78
      (78, 1, 1854.00, NULL, NULL),   -- founding year
      (78, 2, 251.00,   NULL, NULL),   -- elevation (m)
      (78, 3, 311527.00, NULL, NULL), -- population
      (78, 4, 144.00,  NULL, NULL),   -- tallest structure height(m)
      (78, 5, NULL, 'Wells Fargo Place', NULL),  -- tallest structure name
      (78, 6, NULL, 'Wisconsin', NULL),          -- nearest border
      (78, 7, NULL, 'The Saintly City', NULL), -- nickname
      -- TACOMA - city_id = 79
      (79, 1, 1872.00, NULL, NULL),   -- founding year
      (79, 2, 118.00,   NULL, NULL),   -- elevation (m)
      (79, 3, 219346.00, NULL, NULL), -- population
      (79, 4, 103.00,  NULL, NULL),   -- tallest structure height(m)
      (79, 5, NULL, '1201 Pacific', NULL),  -- tallest structure name
      (79, 6, NULL, 'Oregon', NULL),          -- nearest border
      (79, 7, NULL, 'City of Destiny', NULL), -- nickname
      -- LINCOLN - city_id = 80
      (80, 1, 1856.00, NULL, NULL),   -- founding year
      (80, 2, 366.00,   NULL, NULL),   -- elevation (m)
      (80, 3, 291082.00, NULL, NULL), -- population
      (80, 4, 121.00,  NULL, NULL),   -- tallest structure height(m)
      (80, 5, NULL, 'Nebraska State Capitol', NULL),  -- tallest structure name
      (80, 6, NULL, 'Iowa', NULL),          -- nearest border
      (80, 7, NULL, 'Star City', NULL); -- nickname

UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-26 13:57:53
