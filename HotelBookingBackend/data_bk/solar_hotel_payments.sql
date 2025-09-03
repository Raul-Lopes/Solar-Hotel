CREATE DATABASE  IF NOT EXISTS `solar_hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `solar_hotel`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: solar_hotel
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
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` decimal(38,2) DEFAULT NULL,
  `booking_reference` varchar(255) DEFAULT NULL,
  `failure_reason` varchar(255) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `payment_gateway` enum('PAYPAL','PAYSTACK','STRIPE') DEFAULT NULL,
  `payment_status` enum('COMPLETED','FAILED','PENDING','REFUNDED','REVERSED') DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj94hgy9v5fw1munb90tar2eje` (`user_id`),
  CONSTRAINT `FKj94hgy9v5fw1munb90tar2eje` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,396.00,'CTK0ZCX6IA','Your postal code is incomplete.','2025-08-25 18:36:02.607478','STRIPE','FAILED','',7),(2,396.00,'CTK0ZCX6IA','No such payment_intent: \'pi_3S04CvIPGtfC4sRc0AGErLcm\'','2025-08-25 18:36:38.248137','STRIPE','FAILED','',7),(3,396.00,'CTK0ZCX6IA','No such payment_intent: \'pi_3S04CvIPGtfC4sRc0AGErLcm\'','2025-08-25 18:36:48.165405','STRIPE','FAILED','',7),(4,396.00,'CTK0ZCX6IA','No such payment_intent: \'pi_3S04CvIPGtfC4sRc0AGErLcm\'','2025-08-25 19:16:36.520662','STRIPE','FAILED','',7),(5,396.00,'CTK0ZCX6IA','No such payment_intent: \'pi_3S04CvIPGtfC4sRc0AGErLcm\'','2025-08-25 19:19:07.203460','STRIPE','FAILED','',7),(6,396.00,'CTK0ZCX6IA','No such payment_intent: \'pi_3S09zSIPGtfC4sRc1cHbkYyA\'','2025-08-26 00:46:28.743359','STRIPE','FAILED','',7),(7,198.00,'TWHQTL1LCA','No such payment_intent: \'pi_3S0A7lIPGtfC4sRc0fjCJaXT\'','2025-08-26 00:49:02.029246','STRIPE','FAILED','',7),(8,198.00,'TWHQTL1LCA','No such payment_intent: \'pi_3S0OJPIPGtfC4sRc0daJdKXY\'','2025-08-26 15:58:43.188033','STRIPE','FAILED','',7),(9,568.00,'0CNGXJCQS5','No such payment_intent: \'pi_3S0REVIPGtfC4sRc18cwTPHG\'','2025-08-26 19:05:55.291927','STRIPE','FAILED','',7),(10,568.00,'0CNGXJCQS5','No such payment_intent: \'pi_3S0REVIPGtfC4sRc18cwTPHG\'','2025-08-26 19:14:19.828388','STRIPE','FAILED','',7),(11,568.00,'IPVG3M2AGY','No such payment_intent: \'pi_3S0RqoIPGtfC4sRc10YU3U3H\'','2025-08-26 19:45:37.516037','STRIPE','FAILED','',7),(12,568.00,'IPVG3M2AGY','No such payment_intent: \'pi_3S0RqoIPGtfC4sRc10YU3U3H\'','2025-08-26 19:46:10.015130','STRIPE','FAILED','',7),(13,568.00,'IPVG3M2AGY',NULL,'2025-08-27 11:12:11.664326','STRIPE','COMPLETED','pi_3S0gGBIPGtfC4sRc16YTzGaR',7),(14,99.00,'UGWZG8Q238',NULL,'2025-08-27 11:55:39.125141','STRIPE','COMPLETED','pi_3S0h0MIPGtfC4sRc1z8ygjyz',7);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-08 21:31:17
