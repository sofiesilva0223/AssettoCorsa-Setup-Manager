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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `car_id` int NOT NULL,
  `Car_Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`car_id`),
  UNIQUE KEY `id_UNIQUE` (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'ks_alfa_33_stradale'),(2,'ks_alfa_mito_qv'),(3,'ks_alfa_romeo_gta'),(4,'ks_audi_r8_lms'),(5,'ks_audi_sport_quattro'),(6,'ks_audi_tt_vln'),(7,'ks_bmw_m4'),(8,'ks_corvette_c7_stingray'),(9,'ks_ferrari_312_67'),(10,'ks_ferrari_488_gt3_2020'),(11,'ks_ferrari_f2004'),(12,'ks_ferrari_sf15t'),(13,'ks_ford_gt40'),(14,'ks_glickenhaus_scg003'),(15,'ks_lamborghini_huracan_performante'),(16,'ks_lamborghini_miura_sv'),(17,'ks_lotus_3_eleven'),(18,'ks_maserati_250f_6cyl'),(19,'ks_maserati_mc12_gt1'),(20,'ks_mazda_miata'),(21,'ks_mazda_mx5_cup'),(22,'ks_mazda_mx5_nd_f24'),(23,'ks_mazda_rx7_tuned'),(24,'ks_mclaren_650_gt3'),(25,'ks_mclaren_p1_gtr'),(26,'ks_mercedes_amg_gt3'),(27,'ks_nissan_gtr'),(28,'ks_nissan_skyline_r34'),(29,'ks_pagani_huayra_bc_test'),(30,'ks_porsche_718_spyder_rs'),(31,'ks_porsche_911_gt3_r_2016'),(32,'ks_porsche_911_rsr_2017'),(33,'ks_porsche_917_k'),(34,'ks_porsche_919_hybrid_2016'),(35,'ks_porsche_991_carrera_s'),(36,'ks_porsche_cayman_gt4_clubsport'),(37,'ks_porsche_macan'),(38,'ks_toyota_ae86_drift'),(39,'ks_toyota_celica_st185'),(40,'ks_toyota_supra_mkiv_drift'),(41,'ks_toyota_ts040');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
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
