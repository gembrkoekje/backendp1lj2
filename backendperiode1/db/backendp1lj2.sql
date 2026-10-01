-- MySQL dump 10.13  Distrib 8.4.7, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: backendp1lj2
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `backendp1lj2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `backendp1lj2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `backendp1lj2`;

--
-- Table structure for table `allergeen`
--

DROP TABLE IF EXISTS `allergeen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Omschrijving` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergeen`
--

LOCK TABLES `allergeen` WRITE;
/*!40000 ALTER TABLE `allergeen` DISABLE KEYS */;
INSERT INTO `allergeen` VALUES (1,'Gluten','Dit product bevat gluten',_binary '',NULL,'2026-09-29 13:47:13.252835','2026-09-29 13:47:13.252835'),(2,'Gelatine','Dit product bevat gelatine',_binary '',NULL,'2026-09-29 13:47:13.252835','2026-09-29 13:47:13.252835'),(3,'AZO-Kleurstof','Dit product bevat AZO-kleurstoffen',_binary '',NULL,'2026-09-29 13:47:13.252835','2026-09-29 13:47:13.252835'),(4,'Lactose','Dit product bevat lactose',_binary '',NULL,'2026-09-29 13:47:13.252835','2026-09-29 13:47:13.252835'),(5,'Soja','Dit product bevat soja',_binary '',NULL,'2026-09-29 13:47:13.252835','2026-09-29 13:47:13.252835');
/*!40000 ALTER TABLE `allergeen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leverancier`
--

DROP TABLE IF EXISTS `leverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactPersoon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `LeverancierNummer` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mobiel` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leverancier`
--

LOCK TABLES `leverancier` WRITE;
/*!40000 ALTER TABLE `leverancier` DISABLE KEYS */;
INSERT INTO `leverancier` VALUES (1,'Venco','Bert van Linge','L1029384719','06-28493827',_binary '',NULL,'2026-09-29 13:47:13.243887','2026-09-29 13:47:13.243887'),(2,'Astra Sweets','Jasper del Monte','L1029284315','06-39398734',_binary '',NULL,'2026-09-29 13:47:13.243887','2026-09-29 13:47:13.243887'),(3,'Haribo','Sven Stalman','L1029324748','06-24383291',_binary '',NULL,'2026-09-29 13:47:13.243887','2026-09-29 13:47:13.243887'),(4,'Basset','Joyce Stelterberg','L1023845773','06-48293823',_binary '',NULL,'2026-09-29 13:47:13.243887','2026-09-29 13:47:13.243887'),(5,'De Bron','Remco Veenstra','L1023857736','06-34291234',_binary '',NULL,'2026-09-29 13:47:13.243887','2026-09-29 13:47:13.243887');
/*!40000 ALTER TABLE `leverancier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazijn`
--

DROP TABLE IF EXISTS `magazijn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magazijn` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `VerpakkingsEenheid` decimal(6,2) NOT NULL,
  `AantalAanwezig` int unsigned DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Magazijn_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_Magazijn_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magazijn`
--

LOCK TABLES `magazijn` WRITE;
/*!40000 ALTER TABLE `magazijn` DISABLE KEYS */;
INSERT INTO `magazijn` VALUES (1,1,5.00,453,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(2,2,2.50,400,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(3,3,5.00,1,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(4,4,1.00,800,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(5,5,3.00,234,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(6,6,2.00,345,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(7,7,1.00,795,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(8,8,10.00,233,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(9,9,2.50,123,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(10,10,3.00,NULL,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(11,11,2.00,367,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(12,12,1.00,467,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638'),(13,13,5.00,20,_binary '',NULL,'2026-09-29 13:47:13.270638','2026-09-29 13:47:13.270638');
/*!40000 ALTER TABLE `magazijn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(5,'2026_09_29_114554_import_database_jamin',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Barcode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Mintnopjes','8719587231278',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(2,'Schoolkrijt','8719587326713',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(3,'Honingdrop','8719587327836',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(4,'Zure Beren','8719587321441',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(5,'Cola Flesjes','8719587321237',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(6,'Turtles','8719587322245',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(7,'Witte Muizen','8719587328256',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(8,'Reuzen Slangen','8719587325641',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(9,'Zoute Rijen','8719587322739',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(10,'Winegums','8719587327527',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(11,'Drop Munten','8719587322345',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(12,'Kruis Drop','8719587322265',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794'),(13,'Zoute Ruitjes','8719587323256',_binary '',NULL,'2026-09-29 13:47:13.233794','2026-09-29 13:47:13.233794');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productperallergeen`
--

DROP TABLE IF EXISTS `productperallergeen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productperallergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `AllergeenId` int unsigned NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ProductPerAllergeen_ProductId_Product_Id` (`ProductId`),
  KEY `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` (`AllergeenId`),
  CONSTRAINT `FK_ProductPerAllergeen_AllergeenId_Allergeen_Id` FOREIGN KEY (`AllergeenId`) REFERENCES `allergeen` (`Id`),
  CONSTRAINT `FK_ProductPerAllergeen_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productperallergeen`
--

LOCK TABLES `productperallergeen` WRITE;
/*!40000 ALTER TABLE `productperallergeen` DISABLE KEYS */;
INSERT INTO `productperallergeen` VALUES (1,1,2,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696'),(2,1,1,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696'),(3,1,3,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696'),(4,3,4,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696'),(5,6,5,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696'),(6,9,2,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696'),(7,9,5,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696'),(8,10,2,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696'),(9,12,4,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696'),(10,13,1,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696'),(11,13,4,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696'),(12,13,5,_binary '',NULL,'2026-09-29 13:47:13.285696','2026-09-29 13:47:13.285696');
/*!40000 ALTER TABLE `productperallergeen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productperleverancier`
--

DROP TABLE IF EXISTS `productperleverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productperleverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `LeverancierId` int unsigned NOT NULL,
  `ProductId` int unsigned NOT NULL,
  `DatumLevering` date NOT NULL,
  `Aantal` int unsigned NOT NULL,
  `DatumEerstVolgendeLevering` date DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL,
  `DatumGewijzigd` datetime(6) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` (`LeverancierId`),
  KEY `FK_ProductPerLeverancier_ProductId_Product_Id` (`ProductId`),
  CONSTRAINT `FK_ProductPerLeverancier_LeverancierId_Leverancier_Id` FOREIGN KEY (`LeverancierId`) REFERENCES `leverancier` (`Id`),
  CONSTRAINT `FK_ProductPerLeverancier_ProductId_Product_Id` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productperleverancier`
--

LOCK TABLES `productperleverancier` WRITE;
/*!40000 ALTER TABLE `productperleverancier` DISABLE KEYS */;
INSERT INTO `productperleverancier` VALUES (1,1,1,'2024-10-09',23,'2024-10-16',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(2,1,1,'2024-10-18',21,'2024-10-25',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(3,1,2,'2024-10-09',12,'2024-10-16',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(4,1,3,'2024-10-10',11,'2024-10-17',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(5,2,4,'2024-10-14',16,'2024-10-21',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(6,2,4,'2024-10-21',23,'2024-10-28',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(7,2,5,'2024-10-14',45,'2024-10-21',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(8,2,6,'2024-10-14',30,'2024-10-21',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(9,3,7,'2024-10-12',12,'2024-10-19',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(10,3,7,'2024-10-19',23,'2024-10-26',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(11,3,8,'2024-10-10',12,'2024-10-17',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(12,3,9,'2024-10-11',1,'2024-10-18',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(13,4,10,'2024-10-16',24,'2024-10-30',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(14,5,11,'2024-10-10',47,'2024-10-17',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(15,5,11,'2024-10-19',60,'2024-10-26',_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(16,5,12,'2024-10-11',45,NULL,_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873'),(17,5,13,'2024-10-12',23,NULL,_binary '',NULL,'2026-09-29 13:47:13.305873','2026-09-29 13:47:13.305873');
/*!40000 ALTER TABLE `productperleverancier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('Hm3DhctHVoau4GdIXhtc9RCOdGyj3uqj4OKcD4Z2',NULL,'127.0.0.1','curl/8.18.0','eyJfdG9rZW4iOiI2aVRUTlZkdm1qdUNqaEFORUEwT05aRmFzdGdZZUE2ZlJ0VHBrbzhWIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9yZWdpc3RlciIsInJvdXRlIjoicmVnaXN0ZXIifSwiX2ZsYXNoIjp7Im9sZCI6WyJfb2xkX2lucHV0IiwiZXJyb3JzIl0sIm5ldyI6W119LCJfb2xkX2lucHV0Ijp7Il90b2tlbiI6IjZpVFROVmR2bWp1Q2poQU5FQTBPTlpGYXN0Z1llQTZmUnRUcGtvOFYiLCJuYW1lIjoiSGFja2VyIiwiZW1haWwiOiJoYWNrZXJAZXhhbXBsZS5jb20iLCJyb2xlbmFtZSI6InN1cGVyYWRtaW4ifSwiZXJyb3JzIjp7ImRlZmF1bHQiOnsiZm9ybWF0IjoiOm1lc3NhZ2UiLCJtZXNzYWdlcyI6eyJyb2xlbmFtZSI6WyJUaGUgc2VsZWN0ZWQgcm9sZW5hbWUgaXMgaW52YWxpZC4iXX19fX0=',1790681930),('NMQt6rBU10ZMl3JFq4Mc504pRCXWJ7ilGcg4DAG5',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJSZWxZUFBUM2lYb1BDeG9hcGFWYjhkMU1DQnBqenFYVnRFWVhWOGZYIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwMDAiLCJyb3V0ZSI6bnVsbH19',1790684617),('SzqzfFUpZNKGxujDn7Is0PkQNIi0PzP6X8EBhy52',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:156.0) Gecko/20100101 Firefox/156.0','eyJfdG9rZW4iOiJubk9YUmV4Z2twM2dITzdjckZ6Z0VRQ0ttYW1xVTNQVTc5THRHcjgxIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwMDBcL2Rhc2hib2FyZCIsInJvdXRlIjoiZGFzaGJvYXJkIn0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjoyLCJwYXNzd29yZF9oYXNoX3dlYiI6IjQ3NjQ2NDRjN2NjZjE3NjA4YjdhNDVkY2U4NjFhYzlmNGE0ODJlNzQwZmMwMzRjMjgyMzFkMWM0NzUxNjUzYWEifQ==',1790757556),('vQ6RPpIts9zSchm2PMEZ8yeM0ACRT5SAbceoLqdg',1,'127.0.0.1','curl/8.18.0','eyJfdG9rZW4iOiI5d3hwVDBwNHVpdFRZRTZScE1yRFJVWHY3cUdMQ2lBS3FHNFdmT09VIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9yZWdpc3RlciIsInJvdXRlIjoicmVnaXN0ZXIifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MSwicGFzc3dvcmRfaGFzaF93ZWIiOiIyOWM0NTVkZjQ5OTBkMjU0MDNiZGY1YjhhOTUzZjU2YzJmYzE1ZjgwZTBkNTUyMWUxOTk3N2VhZDM5YmJlYjZlIn0=',1790681922),('WNAVbfJEaibQwXV2MmTNwqJ5prJ2f7s223HawFz4',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:156.0) Gecko/20100101 Firefox/156.0','eyJfdG9rZW4iOiJmUkxISllvS1ViYklFVGFTNGNIMEtkckYwTmxiQktvTnptUm9wUzJwIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cL2xvY2FsaG9zdDo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1790684664),('wrKzp2tFXwaSR4qkMioQzTPtEScO7YWvqXPZvJkZ',3,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:156.0) Gecko/20100101 Firefox/156.0','eyJfdG9rZW4iOiJEUkVIdVB0WVhuY1N3ZE1xNkV2Q0N2WlNOd25Talc3YXE2UWl3MjBvIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvbG9jYWxob3N0OjgwMDBcL3Byb2ZpbGUiLCJyb3V0ZSI6InByb2ZpbGUuZWRpdCJ9LCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MywicGFzc3dvcmRfaGFzaF93ZWIiOiIyMGUzYzQ5OGYwMzg0NDA3YjllYjlhODQ3OGRlMDMxNGQ0ZDY1ZGUwOGQxMjNmNWU0ZGE1NTAwMGViZjMzOTdmIn0=',1790682853),('XEMpHxCkF2H4N1erbpDLLYQ1SkbIcWZGDUUwXmuO',NULL,'127.0.0.1','curl/8.18.0','eyJfdG9rZW4iOiJOYVhOZDBvSWkyU3RvdkEwbDdhOE5aNktwb0VHWW9TWldUS3NxYTZlIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9yZWdpc3RlciIsInJvdXRlIjoicmVnaXN0ZXIifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1790681902);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rolename` enum('magazijnmedewerker','admin','klant') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'magazijnmedewerker','magazijnmedewerker@email.nl',NULL,'$2y$12$DK1F78laMevEDa4KDWRtN.XFoW.yR9p6Jv0rKsbPehTXJ0CfNVqfa','magazijnmedewerker','WHs29ibhbzx0sSzRsLF67Z4kNvRvDckBpldgDBZgShp2IkLIxix17xK9r5dL','2026-09-29 09:42:31','2026-09-29 09:42:31'),(3,'admin','admin@email.nl',NULL,'$2y$12$ZGOGpMxZpyPY6wIs06sfVOYriO4HH/n5k3ARKc8iGLy63CG9KnySS','admin','U2rAmINtG0vIp31xFGIqsrqDOcWMoOFHDHyF789RGgjfrJtTYTkwP9MuX26b','2026-09-29 09:42:55','2026-09-29 09:42:55'),(4,'klant','klant@email.nl',NULL,'$2y$12$RggMBKQHkSiQeMmMKNdKIuP.gXvaRSkh9EYTiln5cM8y7a4R4bPka','klant',NULL,'2026-09-29 09:43:12','2026-09-29 09:43:12');
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

-- Dump completed on 2026-10-01 10:28:51
