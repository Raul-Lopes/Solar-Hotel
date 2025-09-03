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
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` varchar(255) DEFAULT NULL,
  `booking_reference` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `recipient` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `type` enum('EMAIL','SMS','WHATSAPP') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'Your Booking has been created successfully. \n Please proceed with your payment using the paymentlike below \nhttp://localhost:4200/payment/CTK0ZCX6IA/396.00','CTK0ZCX6IA','2025-08-25 18:21:57.480578','raul.lagoa@gmail.com','BOOKING CONFIRMATION','EMAIL'),(2,'Your Payment for booking with reference: CTK0ZCX6IA failed with reason: Your postal code is incomplete.','CTK0ZCX6IA','2025-08-25 18:36:03.712683','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(3,'Your Payment for booking with reference: CTK0ZCX6IA failed with reason: No such payment_intent: \'pi_3S04CvIPGtfC4sRc0AGErLcm\'','CTK0ZCX6IA','2025-08-25 18:36:39.219645','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(4,'Your Payment for booking with reference: CTK0ZCX6IA failed with reason: No such payment_intent: \'pi_3S04CvIPGtfC4sRc0AGErLcm\'','CTK0ZCX6IA','2025-08-25 18:36:49.033846','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(5,'Your Payment for booking with reference: CTK0ZCX6IA failed with reason: No such payment_intent: \'pi_3S04CvIPGtfC4sRc0AGErLcm\'','CTK0ZCX6IA','2025-08-25 19:16:37.667102','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(6,'Your Payment for booking with reference: CTK0ZCX6IA failed with reason: No such payment_intent: \'pi_3S04CvIPGtfC4sRc0AGErLcm\'','CTK0ZCX6IA','2025-08-25 19:19:08.298712','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(7,'Your Payment for booking with reference: CTK0ZCX6IA failed with reason: No such payment_intent: \'pi_3S09zSIPGtfC4sRc1cHbkYyA\'','CTK0ZCX6IA','2025-08-26 00:46:30.209220','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(8,'Your Booking has been created successfully. \n Please proceed with your payment using the paymentlike below \nhttp://localhost:4200/payment/TWHQTL1LCA/198.00','TWHQTL1LCA','2025-08-26 00:48:11.006878','raul.lagoa@gmail.com','BOOKING CONFIRMATION','EMAIL'),(9,'Your Payment for booking with reference: TWHQTL1LCA failed with reason: No such payment_intent: \'pi_3S0A7lIPGtfC4sRc0fjCJaXT\'','TWHQTL1LCA','2025-08-26 00:49:03.120429','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(10,'Your Payment for booking with reference: TWHQTL1LCA failed. \nReason: No such payment_intent: \'pi_3S0OJPIPGtfC4sRc0daJdKXY\'','TWHQTL1LCA','2025-08-26 15:58:44.895132','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(11,'Your Booking has been created successfully. \n Please proceed with your payment using the paymentlike below \nhttp://localhost:4200/payment/0CNGXJCQS5/568.00','0CNGXJCQS5','2025-08-26 19:03:27.291475','raul.lagoa@gmail.com','BOOKING CONFIRMATION','EMAIL'),(12,'Your Payment for booking with reference: 0CNGXJCQS5 failed. \nReason: No such payment_intent: \'pi_3S0REVIPGtfC4sRc18cwTPHG\'','0CNGXJCQS5','2025-08-26 19:05:56.354071','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(13,'Your Payment for booking with reference: 0CNGXJCQS5 failed. \nReason: No such payment_intent: \'pi_3S0REVIPGtfC4sRc18cwTPHG\'','0CNGXJCQS5','2025-08-26 19:14:20.996458','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(14,'Your Booking has been created successfully. \n Please proceed with your payment using the paymentlike below \nhttp://localhost:4200/payment/IPVG3M2AGY/568.00','IPVG3M2AGY','2025-08-26 19:43:35.824302','raul.lagoa@gmail.com','BOOKING CONFIRMATION','EMAIL'),(15,'Your Payment for booking with reference: IPVG3M2AGY failed. \nReason: No such payment_intent: \'pi_3S0RqoIPGtfC4sRc10YU3U3H\'','IPVG3M2AGY','2025-08-26 19:45:38.805731','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(16,'Your Payment for booking with reference: IPVG3M2AGY failed. \nReason: No such payment_intent: \'pi_3S0RqoIPGtfC4sRc10YU3U3H\'','IPVG3M2AGY','2025-08-26 19:46:27.158968','raul.lagoa@gmail.com','BOOKING PAYMENT FAILED','EMAIL'),(17,'Congratulations!! Your payment for booking with reference: IPVG3M2AGYis successful','IPVG3M2AGY','2025-08-27 11:12:13.164419','raul.lagoa@gmail.com','BOOKING PAYMENT SUCCESSFUL','EMAIL'),(18,'Your Booking has been created successfully. \n Please proceed with your payment using the paymentlike below \nhttp://localhost:4200/payment/UGWZG8Q238/99.00','UGWZG8Q238','2025-08-27 11:54:35.763068','raul.lagoa@gmail.com','BOOKING CONFIRMATION','EMAIL'),(19,'Congratulations!!\nYour payment for booking with reference: UGWZG8Q238 is successful','UGWZG8Q238','2025-08-27 11:55:40.322527','raul.lagoa@gmail.com','BOOKING PAYMENT SUCCESSFUL','EMAIL');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
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
