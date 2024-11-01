-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: dbveaction
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProductVersion` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20240915183939_InitialCreate','6.0.16'),('20240921051846_InitialCreate2','6.0.16'),('20240924194656_UpdateUserSchema','6.0.16'),('20240927062918_UpdateUserSchemaVacationIdFollowers','6.0.16'),('20240927063601_UpdateUserSchemaFollowVication','6.0.16'),('20240927074122_UpdateUserSchemaVacationIdFollowers1','6.0.16'),('20240928043549_UpdateUserSchemaFollowVication2','6.0.16'),('20240928045139_UpdateUserSchemaFollowVication3','6.0.16');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetRoleClaims`
--

DROP TABLE IF EXISTS `AspNetRoleClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoleClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetRoleClaims_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetRoleClaims_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoleClaims`
--

LOCK TABLES `AspNetRoleClaims` WRITE;
/*!40000 ALTER TABLE `AspNetRoleClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetRoleClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetRoles`
--

DROP TABLE IF EXISTS `AspNetRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetRoles` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `RoleNameIndex` (`NormalizedName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetRoles`
--

LOCK TABLES `AspNetRoles` WRITE;
/*!40000 ALTER TABLE `AspNetRoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserClaims`
--

DROP TABLE IF EXISTS `AspNetUserClaims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserClaims` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ClaimType` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimValue` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`),
  KEY `IX_AspNetUserClaims_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserClaims_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserClaims`
--

LOCK TABLES `AspNetUserClaims` WRITE;
/*!40000 ALTER TABLE `AspNetUserClaims` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserClaims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserLogins`
--

DROP TABLE IF EXISTS `AspNetUserLogins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserLogins` (
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderKey` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ProviderDisplayName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  KEY `IX_AspNetUserLogins_UserId` (`UserId`),
  CONSTRAINT `FK_AspNetUserLogins_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserLogins`
--

LOCK TABLES `AspNetUserLogins` WRITE;
/*!40000 ALTER TABLE `AspNetUserLogins` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserLogins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserRoles`
--

DROP TABLE IF EXISTS `AspNetUserRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserRoles` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `RoleId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`UserId`,`RoleId`),
  KEY `IX_AspNetUserRoles_RoleId` (`RoleId`),
  CONSTRAINT `FK_AspNetUserRoles_AspNetRoles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `AspNetRoles` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_AspNetUserRoles_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserRoles`
--

LOCK TABLES `AspNetUserRoles` WRITE;
/*!40000 ALTER TABLE `AspNetUserRoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUsers`
--

DROP TABLE IF EXISTS `AspNetUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUsers` (
  `Id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `FirstName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `LastName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Role` int DEFAULT NULL,
  `AccessFailedCount` int NOT NULL DEFAULT '0',
  `ConcurrencyStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `EmailConfirmed` tinyint(1) NOT NULL DEFAULT '0',
  `LockoutEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `LockoutEnd` datetime(6) DEFAULT NULL,
  `NormalizedEmail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `NormalizedUserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `PasswordHash` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumber` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL DEFAULT '0',
  `SecurityStamp` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `TwoFactorEnabled` tinyint(1) NOT NULL DEFAULT '0',
  `UserName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  KEY `EmailIndex` (`NormalizedEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUsers`
--

LOCK TABLES `AspNetUsers` WRITE;
/*!40000 ALTER TABLE `AspNetUsers` DISABLE KEYS */;
INSERT INTO `AspNetUsers` VALUES ('0bc680c9-aa4e-444c-a820-c0069e0abf6f','admin','admin','admin@admin.co.il',1,0,'543e5796-deea-4d8e-9e8e-f7954c05a56b',0,1,NULL,'ADMIN@ADMIN.CO.IL','ADMIN@ADMIN.CO.IL','AQAAAAEAACcQAAAAEABQvda76sXQP+ADJeZ+e6KEnYA1+Zd1A8fi/Yk99Wiv4qp/u5bQhhB5p0OSUFu0Fw==',NULL,0,'AWWTJGK4GODY5NRWS4JI45UOQS6SEZLA',0,'admin@admin.co.il'),('1','guy','michelevitz','guy@guy.co.il',0,0,NULL,0,0,NULL,NULL,NULL,NULL,NULL,0,NULL,0,NULL),('ca21d956-15d0-49e6-9bc4-a80c1d096794','guy','michelevitz','guy@insites.co.il',0,0,'f37f032b-8109-4e7a-ba91-d67305016d96',0,1,NULL,'GUY@INSITES.CO.IL','GUY@INSITES.CO.IL','AQAAAAEAACcQAAAAEFFsda0Cq2XZBW2vxi1c9b9zs1BxybsNyd45vLakdY2FIPXdYr16ukrOxE49VsIIQQ==',NULL,0,'TWXZXU4NV7DLUJZNOQRPWK3UBQS5F75J',0,'guy@insites.co.il');
/*!40000 ALTER TABLE `AspNetUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AspNetUserTokens`
--

DROP TABLE IF EXISTS `AspNetUserTokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AspNetUserTokens` (
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LoginProvider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`UserId`,`LoginProvider`,`Name`),
  CONSTRAINT `FK_AspNetUserTokens_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AspNetUserTokens`
--

LOCK TABLES `AspNetUserTokens` WRITE;
/*!40000 ALTER TABLE `AspNetUserTokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `AspNetUserTokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followers`
--

DROP TABLE IF EXISTS `followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `followers` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `VicationId` int DEFAULT NULL,
  `VicationsId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_Followers_UserId` (`UserId`),
  KEY `IX_Followers_VicationId` (`VicationId`),
  CONSTRAINT `FK_Followers_AspNetUsers_UserId` FOREIGN KEY (`UserId`) REFERENCES `AspNetUsers` (`Id`),
  CONSTRAINT `FK_Followers_Vications_VicationId` FOREIGN KEY (`VicationId`) REFERENCES `Vications` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followers`
--

LOCK TABLES `followers` WRITE;
/*!40000 ALTER TABLE `followers` DISABLE KEYS */;
INSERT INTO `followers` VALUES (3,'ca21d956-15d0-49e6-9bc4-a80c1d096794',NULL,0),(13,'ca21d956-15d0-49e6-9bc4-a80c1d096794',NULL,2),(16,'ca21d956-15d0-49e6-9bc4-a80c1d096794',NULL,11),(17,'ca21d956-15d0-49e6-9bc4-a80c1d096794',NULL,10),(19,'ca21d956-15d0-49e6-9bc4-a80c1d096794',NULL,13);
/*!40000 ALTER TABLE `followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vications`
--

DROP TABLE IF EXISTS `Vications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vications` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Destination` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `StartDate` datetime(6) NOT NULL,
  `EndDate` datetime(6) NOT NULL,
  `Price` decimal(65,30) NOT NULL,
  `ImagePath` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vications`
--

LOCK TABLES `Vications` WRITE;
/*!40000 ALTER TABLE `Vications` DISABLE KEYS */;
INSERT INTO `Vications` VALUES (3,'Sunrise Jade ','Serene and stylish, this adults-only haven boasts large swimming pools with ample space between sunbeds, offering a tranquil escape by the sea. Delight in excellent breakfast and lunch options, and enjoy the convenience of swim-up rooms for a refreshing morning dip.\r\n\r\n','2024-10-09 00:00:00.000000','2024-10-13 00:00:00.000000',822.000000000000000000000000000000,'/images/a8cd5d01.jpeg'),(4,'Vrissaki Beach Hotel','A free breakfast buffet, 2 beach bars, and a poolside bar are just a few of the amenities provided at Vrissaki Beach Hotel. With amenities like a white sand beach and beach massages, this hotel is the perfect place to soak up the sun. Treat yourself to a body scrub, aromatherapy, or a body treatment at the onsite spa. Be sure to enjoy a meal at any of the 3 on-site restaurants. In addition to a terrace and a garden, guests can connect to free in-room WiFi.\r\n','2024-10-26 00:00:00.000000','2024-10-29 00:00:00.000000',336.000000000000000000000000000000,'/images/a8a210e3.jpeg'),(5,'Mayia Exclusive Resort & Spa - Adults Only - All Inclusive','Beautifully designed with modern architecture, this serene resort offers stunning sea views and a tranquil atmosphere. Enjoy a private beach, unlimited à la carte dining, and luxurious boat tours for an unforgettable experience.','2024-09-24 00:00:00.000000','2024-09-26 00:00:00.000000',1684.000000000000000000000000000000,'/images/25aa1e7c.jpeg'),(6,'Rodos Palladium Leisure & Wellness','Perched along a serene beach, this hotel offers breathtaking sea views and a tranquil atmosphere. Delight in exceptional amenities including a pristine pool, delectable buffet meals, and a variety of engaging activities.','2024-09-19 00:00:00.000000','2024-09-23 00:00:00.000000',940.000000000000000000000000000000,'/images/35c577e2.jpg'),(7,'Mitsis Rodos Maris','Consider a stay at Mitsis Rodos Maris and take advantage of a free breakfast buffet, a beach bar, and a poolside bar. With beach massages, sun loungers, and rowing, this property is the perfect place to soak up some sun. Indulge in aromatherapy, a sports massage, and a facial at ZEEN - THE SPA ORIGIN, the onsite spa. The on-site local and international cuisine buffet restaurant, Main Restaurant, offers breakfast, lunch, and dinner. Fitness classes are offered at the gym; other things to do include beach volleyball. Free in-room WiFi is available to all guests, along with a terrace and shopping on site.','2024-11-12 00:00:00.000000','2024-11-14 00:00:00.000000',808.000000000000000000000000000000,'/images/1292d33d.jpeg'),(8,'Red Roof Inn PLUS+ Jamaica, NY – JFK Airport','Red Roof Inn PLUS+ Jamaica, NY – JFK Airport provides a 24-hour business center and more. Stay connected with free in-room WiFi.\r\n','2024-11-19 00:00:00.000000','2024-11-22 00:00:00.000000',975.000000000000000000000000000000,'/images/6853b377.jpeg'),(9,'Hampton Inn & Suites Rockville Centre','Located close to Hofstra University and Long Beach, Hampton Inn & Suites Rockville Centre provides dry cleaning/laundry services, a 24-hour gym, and a business center. Free in-room WiFi and a snack bar/deli are available to all guests.','2024-11-19 00:00:00.000000','2024-11-22 00:00:00.000000',1073.000000000000000000000000000000,'/images/bdd8c6d4.jpeg'),(10,'The Historic Wailuku Inn','Take advantage of a free breakfast buffet, a terrace, and a garden at The Historic Wailuku Inn. Stay connected with free in-room WiFi.','2024-10-04 00:00:00.000000','2024-10-08 00:00:00.000000',1770.000000000000000000000000000000,'/images/682ffad6.jpeg'),(11,'Hilton Vacation Club Ka\'anapali Beach Maui1','At Hilton Vacation Club Ka\'anapali Beach Maui, you can look forward to a poolside bar, a grocery/convenience store, and a coffee shop/cafe. An arcade/game room, laundry facilities, and a bar are available to all guests.','2025-02-05 00:00:00.000000','2025-02-11 00:00:00.000000',1741.000000000000000000000000000000,'/images/25aa1e7c.jpeg'),(12,'Hotel Acandia','At Hotel Acandia, you can look forward to free cooked-to-order breakfast, a poolside bar, and dry cleaning/laundry services. Stay connected with free in-room WiFi, and guests can find other amenities such as a bar and a restaurant.','2024-06-25 00:00:00.000000','2024-09-28 00:00:00.000000',473.000000000000000000000000000000,'/images/099375a5.jpeg'),(14,'Charming Traditional 1-bed House in Rhodes','This smoke-free residence features free self parking and free WiFi in public areas. The villa provides a TV with digital channels, plus a kitchen with a refrigerator, an oven, and a stovetop. Added amenities include free WiFi, a balcony, and a private yard.','2024-12-02 00:00:00.000000','2024-12-07 00:00:00.000000',1650.000000000000000000000000000000,'/images/33e16b38.jpeg'),(15,'Homewood Suites by Hilton Fort Myers Airport/FGCU','A free breakfast buffet, a free roundtrip airport shuttle, and a free grocery shopping service are just a few of the amenities provided at Homewood Suites by Hilton Fort Myers Airport/FGCU. Stay connected with free WiFi in public areas, and guests can find other amenities such as dry cleaning/laundry services and a 24-hour gym.\r\n','2024-10-25 00:00:00.000000','2024-10-28 00:00:00.000000',2453.000000000000000000000000000000,'/images/0b742d5d.jpeg');
/*!40000 ALTER TABLE `Vications` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-01 21:33:59
