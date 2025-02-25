-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: ecommerce_web
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
-- Table structure for table `ContactUs`
--

DROP TABLE IF EXISTS `ContactUs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ContactUs` (
  `contactusId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`contactusId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ContactUs`
--

LOCK TABLES `ContactUs` WRITE;
/*!40000 ALTER TABLE `ContactUs` DISABLE KEYS */;
INSERT INTO `ContactUs` VALUES (1,'Dinusha Fernando','dinusha@example.com','I need help with my order.'),(2,'Chamika Perera','chamika@example.com','Can I return a product?'),(3,'Tharindu Silva','tharindu@example.com','Do you have more products in stock?'),(4,'Amali Rathnayake','amali@example.com','I want to report a bug on the website.'),(5,'Harsha Kumara','harsha@example.com','What is the warranty for electronics?');
/*!40000 ALTER TABLE `ContactUs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Message`
--

DROP TABLE IF EXISTS `Message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Message` (
  `messageid` int NOT NULL AUTO_INCREMENT,
  `to_user_id` int NOT NULL,
  `from_user_id` int NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `response` text,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`messageid`),
  KEY `to_user_id` (`to_user_id`),
  KEY `from_user_id` (`from_user_id`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`to_user_id`) REFERENCES `User` (`userid`) ON DELETE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`from_user_id`) REFERENCES `User` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Message`
--

LOCK TABLES `Message` WRITE;
/*!40000 ALTER TABLE `Message` DISABLE KEYS */;
INSERT INTO `Message` VALUES (3,3,1,'Admin Update','Please update your profile.',NULL,'2024-12-03 09:00:00');
/*!40000 ALTER TABLE `Message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Order_Product`
--

DROP TABLE IF EXISTS `Order_Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Order_Product` (
  `productid` int NOT NULL,
  `orderid` int NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`productid`,`orderid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `Product` (`productid`) ON DELETE CASCADE,
  CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `OrderTable` (`orderid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Order_Product`
--

LOCK TABLES `Order_Product` WRITE;
/*!40000 ALTER TABLE `Order_Product` DISABLE KEYS */;
/*!40000 ALTER TABLE `Order_Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderTable`
--

DROP TABLE IF EXISTS `OrderTable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderTable` (
  `orderid` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `apartment` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('Pending','Processing','Shipped','Delivered','Cancelled') DEFAULT 'Pending',
  `buyerid` int NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `buyerid` (`buyerid`),
  CONSTRAINT `ordertable_ibfk_1` FOREIGN KEY (`buyerid`) REFERENCES `User` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderTable`
--

LOCK TABLES `OrderTable` WRITE;
/*!40000 ALTER TABLE `OrderTable` DISABLE KEYS */;
INSERT INTO `OrderTable` VALUES (1,'Moditha','Marasingha','Sri Lanka','123 Lotus Rd',NULL,'Colombo','Western','10100','0711234567','moditha@example.com','2024-12-01 11:00:00','Pending',1),(2,'Kamal','Wijesinghe','Sri Lanka','321 Rose St','Apt 4B','Matara','Southern','81000','0724567890','kamal@example.com','2024-12-02 09:30:00','Processing',4),(3,'Dinusha','Fernando','Sri Lanka','789 Orchid Ave',NULL,'Kandy','Central','20000','0709876543','dinusha@example.com','2024-12-02 16:00:00','Shipped',1),(4,'Amali','Rathnayake','Sri Lanka','456 Jasmine St',NULL,'Galle','Southern','80000','0712345678','amali@example.com','2024-12-03 12:45:00','Delivered',4),(5,'Harsha','Kumara','Sri Lanka','654 Lily Ln',NULL,'Jaffna','Northern','40000','0765678901','harsha@example.com','2024-12-04 08:30:00','Pending',1);
/*!40000 ALTER TABLE `OrderTable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
  `productid` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty_available` int NOT NULL,
  `category` enum('Electronics','Sports','Health & Beauty','Groceries','Stationary','Fashion') NOT NULL,
  `description` text,
  `productimg` varchar(255) DEFAULT NULL,
  `sellerId` int NOT NULL,
  PRIMARY KEY (`productid`),
  KEY `sellerId` (`sellerId`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`sellerId`) REFERENCES `User` (`userid`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (9,'saban',100.00,12,'Groceries','soap','',9);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `Fname` varchar(50) NOT NULL,
  `Lname` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `mobileno` varchar(15) NOT NULL,
  `birthday` date NOT NULL,
  `password` varchar(255) NOT NULL,
  `userType` enum('buyer','seller','admin') NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `profilepic_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'moditham','Moditha','Marasingha','moditha2003@gmail.com','071 6899444','2003-08-28','Modi1234','admin','A60/1, Somi Kelum, Hungampola ,Morontota','Kegalle','Sabaragamuwa','Sri Lanka','71220','IMG-20230830-WA0032.jpg'),(3,'nimal_fernando','Nimal','Fernando','nimal@example.com','0703456789','1985-11-20','admin1234','admin','789 Orchid Ave','Kandy','Central','Sri Lanka','20000','https://example.com/nimal.jpg'),(4,'kamal_w','Kamal','Wijesinghe','kamal@example.com','0724567890','1995-02-08','buyer1234','buyer','321 Rose St','Matara','Southern','Sri Lanka','81000','https://example.com/kamal.jpg'),(7,'Hasinduh','Hasindu','Lakshan','hasindu@gmail.com','0777123456','2000-06-30','hasindu1234','buyer',NULL,NULL,NULL,NULL,NULL,'profileicon.webp'),(8,'Nipun','Nipun','Munasingha','nipun@gmail.com','077213456','2003-02-12','nipun1234','seller',NULL,NULL,NULL,NULL,NULL,'profileicon.webp'),(9,'seller','test','seller','test@gmail.com','1111111111','2024-12-12','seller1234','seller',NULL,NULL,NULL,NULL,NULL,'profileicon.webp');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-19 21:36:51
