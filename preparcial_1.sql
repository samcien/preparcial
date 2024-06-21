-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: financial_system
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto` (
  `userId` int NOT NULL,
  `friendId` int NOT NULL,
  PRIMARY KEY (`userId`,`friendId`),
  KEY `friendId` (`friendId`),
  CONSTRAINT `contacto_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `usuarios` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `contacto_ibfk_2` FOREIGN KEY (`friendId`) REFERENCES `usuarios` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (1,2),(1,3),(2,3),(2,4),(3,5);
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_de_usuarios`
--

DROP TABLE IF EXISTS `detalles_de_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_de_usuarios` (
  `account_number` varchar(20) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `aadhaar_doc` varchar(12) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`account_number`),
  KEY `userId` (`userId`),
  CONSTRAINT `detalles_de_usuarios_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `usuarios` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_de_usuarios`
--

LOCK TABLES `detalles_de_usuarios` WRITE;
/*!40000 ALTER TABLE `detalles_de_usuarios` DISABLE KEYS */;
INSERT INTO `detalles_de_usuarios` VALUES ('ACC001','Saving','1234567890','111122223333','/images/alice.jpg',1),('ACC002','Checking','1234567891','222233334444','/images/bob.jpg',2),('ACC003','Saving','1234567892','333344445555','/images/charlie.jpg',3),('ACC004','Checking','1234567893','444455556666','/images/david.jpg',4),('ACC005','Saving','1234567894','555566667777','/images/eve.jpg',5);
/*!40000 ALTER TABLE `detalles_de_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `requestId` int NOT NULL AUTO_INCREMENT,
  `fromId` int DEFAULT NULL,
  `toId` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `category` varchar(50) DEFAULT NULL,
  `request_send` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`requestId`),
  KEY `fromId` (`fromId`),
  KEY `toId` (`toId`),
  CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`fromId`) REFERENCES `usuarios` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`toId`) REFERENCES `usuarios` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (1,1,2,100.00,'Payment for services','Completed','2024-06-20 23:23:38','Service','send'),(2,2,3,150.00,'Loan repayment','Pending','2024-06-20 23:23:38','Loan','send'),(3,3,4,200.00,'Gift','Completed','2024-06-20 23:23:38','Gift','send'),(4,4,5,250.00,'Purchase','Failed','2024-06-20 23:23:38','Purchase','send'),(5,5,1,300.00,'Rent','Completed','2024-06-20 23:23:38','Rent','send');
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `saldo` decimal(10,2) DEFAULT '0.00',
  `balance` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Alice','password123',1000.00,1000.00),(2,'Bob','password456',1500.00,1500.00),(3,'Charlie','password789',2000.00,2000.00),(4,'David','password012',2500.00,2500.00),(5,'Eve','password345',3000.00,3000.00);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-20 20:04:06
