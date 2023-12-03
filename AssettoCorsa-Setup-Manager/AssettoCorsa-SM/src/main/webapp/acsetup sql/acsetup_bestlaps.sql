CREATE DATABASE  IF NOT EXISTS `acsetup` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `acsetup`;
-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: acsetup
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `bestlaps`
--

DROP TABLE IF EXISTS `bestlaps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bestlaps` (
  `lap_id` int NOT NULL,
  `track_id` int NOT NULL,
  `car_id` int NOT NULL,
  `user_id` int NOT NULL,
  `setup_id` int NOT NULL,
  `lap_time` float DEFAULT NULL,
  PRIMARY KEY (`lap_id`),
  UNIQUE KEY `lap_id_UNIQUE` (`lap_id`),
  KEY `lap to user_idx` (`user_id`),
  KEY `lap to car_idx` (`car_id`),
  KEY `lap to track_idx` (`track_id`),
  KEY `lap to setup_idx` (`setup_id`),
  CONSTRAINT `lap to car` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  CONSTRAINT `lap to setup` FOREIGN KEY (`setup_id`) REFERENCES `setups` (`setup_id`),
  CONSTRAINT `lap to track` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`),
  CONSTRAINT `lap to user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestlaps`
--

LOCK TABLES `bestlaps` WRITE;
/*!40000 ALTER TABLE `bestlaps` DISABLE KEYS */;
INSERT INTO `bestlaps` VALUES (1,1,1,1,1,120.5),(2,2,2,2,2,90.3),(3,3,3,3,3,85.7),(4,4,4,4,4,110.2),(5,5,5,5,5,95.6),(6,6,6,6,6,100.1),(7,7,7,7,7,105.4),(8,8,8,8,8,80.9),(9,9,9,9,9,115.3),(10,10,10,10,10,125.6);
/*!40000 ALTER TABLE `bestlaps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-26 21:42:57
