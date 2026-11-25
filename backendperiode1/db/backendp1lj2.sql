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
  `Naam` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Omschrijving` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergeen`
--

LOCK TABLES `allergeen` WRITE;
/*!40000 ALTER TABLE `allergeen` DISABLE KEYS */;
INSERT INTO `allergeen` VALUES (1,'Gluten','Dit product bevat gluten',_binary '',NULL,'2026-11-25 14:27:52.081571','2026-11-25 14:27:52.081571'),(2,'Gelatine','Dit product bevat gelatine',_binary '',NULL,'2026-11-25 14:27:52.081571','2026-11-25 14:27:52.081571'),(3,'AZO-Kleurstof','Dit product bevat AZO-kleurstoffen',_binary '',NULL,'2026-11-25 14:27:52.081571','2026-11-25 14:27:52.081571'),(4,'Lactose','Dit product bevat lactose',_binary '',NULL,'2026-11-25 14:27:52.081571','2026-11-25 14:27:52.081571'),(5,'Soja','Dit product bevat soja',_binary '',NULL,'2026-11-25 14:27:52.081571','2026-11-25 14:27:52.081571');
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
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Straat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Huisnummer` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Postcode` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Stad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Van Gilslaan','34','1045CB','Hilvarenbeek',_binary '',NULL,'2026-11-25 14:27:52.018419','2026-11-25 14:27:52.018419'),(2,'Den Dolderpad','2','1067RC','Utrecht',_binary '',NULL,'2026-11-25 14:27:52.018419','2026-11-25 14:27:52.018419'),(3,'Fredo Raalteweg','257','1236OP','Nijmegen',_binary '',NULL,'2026-11-25 14:27:52.018419','2026-11-25 14:27:52.018419'),(4,'Bertrand Russellhof','21','2034AP','Den Haag',_binary '',NULL,'2026-11-25 14:27:52.018419','2026-11-25 14:27:52.018419'),(5,'Leon van Bonstraat','213','145XC','Lunteren',_binary '',NULL,'2026-11-25 14:27:52.018419','2026-11-25 14:27:52.018419'),(6,'Bea van Lingenlaan','234','2197FG','Sint Pancras',_binary '',NULL,'2026-11-25 14:27:52.018419','2026-11-25 14:27:52.018419');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
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
  `Naam` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactPersoon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LeverancierNummer` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mobiel` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactId` int unsigned NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  KEY `FK_Leverancier_ContactId_Contact_Id` (`ContactId`),
  CONSTRAINT `FK_Leverancier_ContactId_Contact_Id` FOREIGN KEY (`ContactId`) REFERENCES `contact` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leverancier`
--

LOCK TABLES `leverancier` WRITE;
/*!40000 ALTER TABLE `leverancier` DISABLE KEYS */;
INSERT INTO `leverancier` VALUES (1,'Venco','Bert van Linge','L1029384719','06-28493827',1,_binary '',NULL,'2026-11-25 14:27:52.058338','2026-11-25 14:27:52.058338'),(2,'Astra Sweets','Jasper del Monte','L1029284315','06-39398734',2,_binary '',NULL,'2026-11-25 14:27:52.058338','2026-11-25 14:27:52.058338'),(3,'Haribo','Sven Stalman','L1029324748','06-24383291',3,_binary '',NULL,'2026-11-25 14:27:52.058338','2026-11-25 14:27:52.058338'),(4,'Basset','Joyce Stelterberg','L1023845773','06-48293823',4,_binary '',NULL,'2026-11-25 14:27:52.058338','2026-11-25 14:27:52.058338'),(5,'De Bron','Remco Veenstra','L1023857736','06-34291234',5,_binary '\0','Leverancier is niet actief, gegevens kunnen niet gewijzigd worden','2026-11-25 14:27:52.058338','2026-11-25 14:27:52.058338'),(6,'Quality Street','Johan Nooij','L1029234586','06-23458456',6,_binary '',NULL,'2026-11-25 14:27:52.058338','2026-11-25 14:27:52.058338');
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
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
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
INSERT INTO `magazijn` VALUES (1,1,5.00,453,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(2,2,2.50,400,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(3,3,5.00,1,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(4,4,1.00,800,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(5,5,3.00,234,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(6,6,2.00,345,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(7,7,1.00,795,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(8,8,10.00,233,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(9,9,2.50,123,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(10,10,3.00,NULL,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(11,11,2.00,367,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(12,12,1.00,467,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798'),(13,13,5.00,20,_binary '',NULL,'2026-11-25 14:27:52.108798','2026-11-25 14:27:52.108798');
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(29,'2026_09_29_114554_import_database_jamin',2),(30,'2026_11_01_100000_create_sp_overzicht_leverancier',2),(31,'2026_11_01_110000_create_sp_toevoegen_product',2),(32,'2026_11_25_100000_create_sp_wijzigen_leverancier',2),(33,'2026_11_25_110000_create_sp_pagination',2),(34,'2026_11_25_120000_add_manager_role_to_users_table',2);
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
  `Naam` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Barcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Mintnopjes','8719587231278',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(2,'Schoolkrijt','8719587326713',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(3,'Honingdrop','8719587327836',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(4,'Zure Beren','8719587321441',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(5,'Cola Flesjes','8719587321237',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(6,'Turtles','8719587322245',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(7,'Witte Muizen','8719587328256',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(8,'Reuzen Slangen','8719587325641',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(9,'Zoute Rijen','8719587322739',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(10,'Winegums','8719587327527',_binary '\0','Wordt niet meer geproduceerd','2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(11,'Drop Munten','8719587322345',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(12,'Kruis Drop','8719587322265',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044'),(13,'Zoute Ruitjes','8719587323256',_binary '',NULL,'2026-11-25 14:27:51.997044','2026-11-25 14:27:51.997044');
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
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
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
INSERT INTO `productperallergeen` VALUES (1,1,2,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171'),(2,1,1,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171'),(3,1,3,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171'),(4,3,4,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171'),(5,6,5,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171'),(6,9,2,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171'),(7,9,5,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171'),(8,10,2,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171'),(9,12,4,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171'),(10,13,1,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171'),(11,13,4,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171'),(12,13,5,_binary '',NULL,'2026-11-25 14:27:52.159171','2026-11-25 14:27:52.159171');
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
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
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
INSERT INTO `productperleverancier` VALUES (1,1,1,'2023-04-09',23,'2023-04-16',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(2,1,1,'2023-04-18',21,'2023-04-25',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(3,1,2,'2023-04-09',12,'2023-04-16',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(4,1,3,'2023-04-10',11,'2023-04-17',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(5,2,4,'2023-04-14',16,'2023-04-21',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(6,2,4,'2023-04-21',23,'2023-04-28',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(7,2,5,'2023-04-14',45,'2023-04-21',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(8,2,6,'2023-04-14',30,'2023-04-21',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(9,3,7,'2023-04-12',12,'2023-04-19',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(10,3,7,'2023-04-19',23,'2023-04-26',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(11,3,8,'2023-04-10',12,'2023-04-17',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(12,3,9,'2023-04-11',1,'2023-04-18',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(13,4,10,'2023-04-16',24,'2023-04-30',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(14,5,11,'2023-04-10',47,'2023-04-17',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(15,5,11,'2023-04-19',60,'2023-04-26',_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(16,5,12,'2023-04-11',45,NULL,_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746'),(17,5,13,'2023-04-12',23,NULL,_binary '',NULL,'2026-11-25 14:27:52.206746','2026-11-25 14:27:52.206746');
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
  `rolename` enum('magazijnmedewerker','admin','klant','manager') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'magazijnmedewerker','magazijnmedewerker@email.nl',NULL,'$2y$12$DK1F78laMevEDa4KDWRtN.XFoW.yR9p6Jv0rKsbPehTXJ0CfNVqfa','magazijnmedewerker','cZAbC6YtqBj8XjY9GLeNk1JuyZ6TsNxH4trHJmobGB6nMfNdXpq7Fazx3PWh','2026-09-29 09:42:31','2026-09-29 09:42:31'),(3,'admin','admin@email.nl',NULL,'$2y$12$ZGOGpMxZpyPY6wIs06sfVOYriO4HH/n5k3ARKc8iGLy63CG9KnySS','admin','IEQAPMkSoztDB1CrdVdcoIzENQZ6q7mjYg36Wr2rg8wB46ggxLPWO3xPDixj','2026-09-29 09:42:55','2026-09-29 09:42:55'),(4,'klant','klant@email.nl',NULL,'$2y$12$RggMBKQHkSiQeMmMKNdKIuP.gXvaRSkh9EYTiln5cM8y7a4R4bPka','klant',NULL,'2026-09-29 09:43:12','2026-09-29 09:43:12'),(5,'manager','manager@email.nl',NULL,'$2y$12$aNQfVvFhcD.I2OY2u8R1duOP8bCaPvjfhI8gWEZSiwmRdsd.RXOAC','manager',NULL,'2026-11-25 12:22:32','2026-11-25 12:22:32');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'backendp1lj2'
--
/*!50003 DROP PROCEDURE IF EXISTS `spCountAllergenenByProductId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCountAllergenenByProductId`(
    IN p_ProductId INT UNSIGNED
)
BEGIN
    SELECT   COUNT(PPAL.Id)     AS Totaal
    FROM     ProductPerAllergeen AS PPAL
    WHERE    PPAL.ProductId = p_ProductId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCountGeleverdeProductenByLeverancierId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCountGeleverdeProductenByLeverancierId`(
    IN p_LeverancierId INT UNSIGNED
)
BEGIN
    SELECT   COUNT(DISTINCT PPLE.ProductId)     AS Totaal
    FROM     ProductPerLeverancier AS PPLE
    WHERE    PPLE.LeverancierId = p_LeverancierId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCountLeveranciers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCountLeveranciers`()
BEGIN
    SELECT   COUNT(LEVE.Id)     AS Totaal
    FROM     Leverancier AS LEVE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCountLeveringenByProductId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCountLeveringenByProductId`(
    IN p_ProductId INT UNSIGNED
)
BEGIN
    SELECT   COUNT(PPLE.Id)     AS Totaal
    FROM     ProductPerLeverancier AS PPLE
    WHERE    PPLE.ProductId = p_ProductId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCountMagazijn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCountMagazijn`()
BEGIN
    SELECT   COUNT(MAGA.Id)     AS Totaal
    FROM     Magazijn AS MAGA;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spCreateLevering` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spCreateLevering`(
     IN p_LeverancierId                 INT UNSIGNED
    ,IN p_ProductId                     INT UNSIGNED
    ,IN p_Aantal                        INT UNSIGNED
    ,IN p_DatumEerstVolgendeLevering    DATE
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF NOT EXISTS (SELECT 1 FROM Product WHERE Id = p_ProductId AND IsActief = 1) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Het product wordt niet meer geproduceerd';
    END IF;

    START TRANSACTION;

    INSERT INTO ProductPerLeverancier
    (
         LeverancierId
        ,ProductId
        ,DatumLevering
        ,Aantal
        ,DatumEerstVolgendeLevering
        ,IsActief
        ,Opmerking
        ,DatumAangemaakt
        ,DatumGewijzigd
    )
    VALUES
    (
         p_LeverancierId
        ,p_ProductId
        ,CURDATE()
        ,p_Aantal
        ,p_DatumEerstVolgendeLevering
        ,1
        ,NULL
        ,NOW(6)
        ,NOW(6)
    );

    UPDATE   Magazijn
    SET      AantalAanwezig = IFNULL(AantalAanwezig, 0) + p_Aantal
            ,DatumGewijzigd = NOW(6)
    WHERE    ProductId      = p_ProductId;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllergenenByProductId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetAllergenenByProductId`(
     IN p_ProductId  INT UNSIGNED
    ,IN p_Limit      INT UNSIGNED
    ,IN p_Offset     INT UNSIGNED
)
BEGIN
    SELECT   ALLE.Naam
            ,ALLE.Omschrijving
    FROM     ProductPerAllergeen AS PPAL
    INNER JOIN Allergeen AS ALLE
            ON ALLE.Id = PPAL.AllergeenId
    WHERE    PPAL.ProductId = p_ProductId
    ORDER BY ALLE.Naam ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetAllLeveranciers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetAllLeveranciers`(
     IN p_Limit   INT UNSIGNED
    ,IN p_Offset  INT UNSIGNED
)
BEGIN
    SELECT   LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
            ,COUNT(DISTINCT PPLE.ProductId)     AS AantalVerschillendeProducten
    FROM     Leverancier AS LEVE
    LEFT JOIN ProductPerLeverancier AS PPLE
           ON PPLE.LeverancierId = LEVE.Id
    GROUP BY LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
    ORDER BY AantalVerschillendeProducten DESC
            ,LEVE.Naam ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetGeleverdeProductenByLeverancierId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetGeleverdeProductenByLeverancierId`(
     IN p_LeverancierId  INT UNSIGNED
    ,IN p_Limit          INT UNSIGNED
    ,IN p_Offset         INT UNSIGNED
)
BEGIN
    SELECT   PROD.Id                    AS ProductId
            ,PROD.Naam
            ,MAGA.AantalAanwezig
            ,MAGA.VerpakkingsEenheid
            ,MAX(PPLE.DatumLevering)    AS LaatsteLevering
    FROM     ProductPerLeverancier AS PPLE
    INNER JOIN Product AS PROD
            ON PROD.Id = PPLE.ProductId
    LEFT JOIN Magazijn AS MAGA
            ON MAGA.ProductId = PROD.Id
    WHERE    PPLE.LeverancierId = p_LeverancierId
    GROUP BY PROD.Id
            ,PROD.Naam
            ,MAGA.AantalAanwezig
            ,MAGA.VerpakkingsEenheid
    ORDER BY MAGA.AantalAanwezig DESC
            ,PROD.Naam ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetLeverancierById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetLeverancierById`(
    IN p_LeverancierId INT UNSIGNED
)
BEGIN
    SELECT   LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
    FROM     Leverancier AS LEVE
    WHERE    LEVE.Id = p_LeverancierId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetLeverancierDetailsById` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetLeverancierDetailsById`(
    IN p_LeverancierId INT UNSIGNED
)
BEGIN
    SELECT   LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
            ,CONT.Straat
            ,CONT.Huisnummer
            ,CONT.Postcode
            ,CONT.Stad
    FROM     Leverancier AS LEVE
    INNER JOIN Contact AS CONT
            ON CONT.Id = LEVE.ContactId
    WHERE    LEVE.Id   = p_LeverancierId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetLeveranciersWijzigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetLeveranciersWijzigen`(
     IN p_Limit   INT UNSIGNED
    ,IN p_Offset  INT UNSIGNED
)
BEGIN
    SELECT   LEVE.Id
            ,LEVE.Naam
            ,LEVE.ContactPersoon
            ,LEVE.LeverancierNummer
            ,LEVE.Mobiel
    FROM     Leverancier AS LEVE
    ORDER BY LEVE.Id ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetLeveringenByProductId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetLeveringenByProductId`(
     IN p_ProductId  INT UNSIGNED
    ,IN p_Limit      INT UNSIGNED
    ,IN p_Offset     INT UNSIGNED
)
BEGIN
    SELECT   PROD.Naam
            ,PPLE.DatumLevering
            ,PPLE.Aantal
            ,PPLE.DatumEerstVolgendeLevering
    FROM     ProductPerLeverancier AS PPLE
    INNER JOIN Product AS PROD
            ON PROD.Id = PPLE.ProductId
    WHERE    PPLE.ProductId = p_ProductId
    ORDER BY PPLE.DatumLevering ASC
            ,PPLE.Id ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetMagazijnOverzicht` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetMagazijnOverzicht`(
     IN p_Limit   INT UNSIGNED
    ,IN p_Offset  INT UNSIGNED
)
BEGIN
    SELECT   PROD.Id
            ,PROD.Naam
            ,PROD.Barcode
            ,MAGA.VerpakkingsEenheid
            ,MAGA.AantalAanwezig
    FROM     Magazijn AS MAGA
    INNER JOIN Product AS PROD
            ON PROD.Id = MAGA.ProductId
    ORDER BY PROD.Barcode ASC
    LIMIT    p_Limit
    OFFSET   p_Offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spGetProductVanLeverancier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spGetProductVanLeverancier`(
     IN p_LeverancierId INT UNSIGNED
    ,IN p_ProductId     INT UNSIGNED
)
BEGIN
    SELECT   PROD.Id                AS ProductId
            ,PROD.Naam              AS ProductNaam
            ,PROD.IsActief + 0      AS ProductIsActief
            ,LEVE.Id                AS LeverancierId
            ,LEVE.Naam              AS LeverancierNaam
            ,LEVE.ContactPersoon
            ,LEVE.Mobiel
    FROM     Leverancier AS LEVE
    INNER JOIN ProductPerLeverancier AS PPLE
            ON PPLE.LeverancierId = LEVE.Id
    INNER JOIN Product AS PROD
            ON PROD.Id = PPLE.ProductId
    WHERE    LEVE.Id   = p_LeverancierId
      AND    PROD.Id   = p_ProductId
    LIMIT    1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdateLeverancier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateLeverancier`(
     IN p_LeverancierId      INT UNSIGNED
    ,IN p_Naam               VARCHAR(100)
    ,IN p_ContactPersoon     VARCHAR(100)
    ,IN p_LeverancierNummer  VARCHAR(20)
    ,IN p_Mobiel             VARCHAR(15)
    ,IN p_Straat             VARCHAR(100)
    ,IN p_Huisnummer         VARCHAR(10)
    ,IN p_Postcode           VARCHAR(7)
    ,IN p_Stad               VARCHAR(100)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    IF NOT EXISTS (SELECT 1 FROM Leverancier WHERE Id = p_LeverancierId AND IsActief = 1) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'De leverancier is niet actief en kan niet gewijzigd worden';
    END IF;

    START TRANSACTION;

    UPDATE   Leverancier
    SET      Naam              = p_Naam
            ,ContactPersoon    = p_ContactPersoon
            ,LeverancierNummer = p_LeverancierNummer
            ,Mobiel            = p_Mobiel
            ,DatumGewijzigd    = NOW(6)
    WHERE    Id                = p_LeverancierId;

    UPDATE   Contact AS CONT
    INNER JOIN Leverancier AS LEVE
            ON LEVE.ContactId    = CONT.Id
    SET      CONT.Straat         = p_Straat
            ,CONT.Huisnummer     = p_Huisnummer
            ,CONT.Postcode       = p_Postcode
            ,CONT.Stad           = p_Stad
            ,CONT.DatumGewijzigd = NOW(6)
    WHERE    LEVE.Id             = p_LeverancierId;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-25 14:27:52
