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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Austin','Texas'),(2,'San Antonio','Texas'),(3,'Houston','Texas'),(4,'Dallas','Texas'),(5,'Corpus Christi','Texas'),(6,'El Paso','Texas'),(7,'Amarillo','Texas'),(8,'Lubbock','Texas'),(9,'Paris','Texas'),(10,'Harlingen','Texas');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;

-- Added cities
INSERT INTO `cities` VALUES ('11','Orlando','Florida'),
                            ('12','Miami','Florida'),
                            ('13','Tampa','Florida'),
                            ('14','Jacksonville','Florida'),
                            ('15','St. Petersburg','Florida'),
                            ('16','Los Angeles','California'),
                            ('17','San Francisco','California'),
                            ('18','San Diego','California'),
                            ('19','Sacramento','California'),
                            ('20','San Jose','California');
INSERT INTO `cities` VALUES ('21','Salt Lake City','Utah'),
                            ('22','Montgomery','Alabama'),
                            ('23','Phoenix','Arizona'),
                            ('24','Anchorage','Alaska'),
                            ('25','Denver','Colorado'),
                            ('26','Bridgeport','Connecticut'),
                            ('27','Wilmington','Delaware'),
                            ('28','Atlanta','Georgia'),
                            ('29','Honolulu','Hawaii'),
                            ('30','Boise','Idaho');
INSERT INTO `cities` VALUES ('31','Chicago','Illinois'),
                            ('32','Indianopolis','Indiana'),
                            ('33','Des Moines','Iowa'),
                            ('34','Wichita','Kansas'),
                            ('35','Louisville','Kentucky'),
                            ('36','New Orleans','Louisiana'),
                            ('37','Portland','Maine'),
                            ('38','Baltimore','Maryland'),
                            ('39','Boston','Massachusetts'),
                            ('40','Detroit','Michigan');
INSERT INTO `cities` VALUES ('41','Minneapolis','Minnesota'),
                            ('42','Jackson','Mississippi'),
                            ('43','Kansas City','Missouri'),
                            ('44','Billings','Montana'),
                            ('45','Omaha','Nebraska'),
                            ('46','Las Vegas','Nevada'),
                            ('47','Manchester','New Hampshire'),
                            ('48','Newark','New Jersey'),
                            ('49','Albuquerque','New Mexico'),
                            ('50','New York City','New York');
INSERT INTO `cities` VALUES ('51','Charlotte','North Carolina'),
                            ('52','Fargo','North Dakota'),
                            ('53','Columbus','Ohio'),
                            ('54','Oklahoma City','Oklahoma'),
                            ('55','Eugene','Oregon'),
                            ('56','Philadelphia','Pennsylvania'),
                            ('57','Providence','Rhode Island'),
                            ('58','Columbia','South Carolina'),
                            ('59','Sioux Falls','South Dakota'),
                            ('60','Nashville','Tennessee');
INSERT INTO `cities` VALUES ('61','Burlington','Vermont'),
                            ('62','Virginia Beach','Virginia'),
                            ('63','Seattle','Washington'),
                            ('64','Charleston','West Virginia'),
                            ('65','Milwaukee','Wisconsin'),
                            ('66','Cheyenne','Wyoming')
                            ('67','Memphis','Tennessee'),
                            ('68','Tucson','Arizona'),
                            ('69','Mesa','Arizona'),
                            ('70','Raleigh','North Carolina');
INSERT INTO `cities` VALUES ('71','Colorado Springs','Colorado'),
                            ('72','Tulsa','Oklahoma'),
                            ('73','Aurora','Colorado'),
                            ('74','Cleveland','Ohio'),
                            ('75','Henderson','Nevada'),
                            ('76','Lexington','Kentucky'),
                            ('77','Cincinnati','Ohio'),
                            ('78','Saint Paul','Minnesota'),
                            ('79','Tacoma','Washington'),
                            ('80','Lincoln','Nebraska');



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
