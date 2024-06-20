-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: preparcial
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
-- Table structure for table `aseguradoras`
--

DROP TABLE IF EXISTS `aseguradoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aseguradoras` (
  `id_aseguradora` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `correo` varchar(40) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_aseguradora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aseguradoras`
--

LOCK TABLES `aseguradoras` WRITE;
/*!40000 ALTER TABLE `aseguradoras` DISABLE KEYS */;
INSERT INTO `aseguradoras` VALUES (1,'Aseguradora Panamá','Calle 123, Ciudad de Panamá','info@aseguradora.com','111-2222'),(2,'Seguros Unidos','Avenida Principal, Panamá','contacto@segurosunidos.com','333-4444'),(3,'Confianza Seguros','Barrio Seguro, Panamá','info@confianzaseguros.com','555-6666'),(4,'Seguros del Este','Centro Financiero, Panamá','atencion@seguroseste.com','777-8888'),(5,'Seguros del Pacífico','Avenida Costera, Panamá','servicio@segurospacifico.com','999-0000');
/*!40000 ALTER TABLE `aseguradoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `casos`
--

DROP TABLE IF EXISTS `casos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `casos` (
  `numero_caso` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_aseguradora` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_juzgado` int DEFAULT NULL,
  `descrip` varchar(200) DEFAULT NULL,
  `estado` enum('pendiente','en curso','cerrado') DEFAULT NULL,
  `tipo_de_proceso` varchar(50) DEFAULT NULL,
  `createat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateat` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`numero_caso`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_aseguradora` (`id_aseguradora`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_juzgado` (`id_juzgado`),
  CONSTRAINT `casos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `casos_ibfk_2` FOREIGN KEY (`id_aseguradora`) REFERENCES `aseguradoras` (`id_aseguradora`),
  CONSTRAINT `casos_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `casos_ibfk_4` FOREIGN KEY (`id_juzgado`) REFERENCES `juzgados` (`id_juzgado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casos`
--

LOCK TABLES `casos` WRITE;
/*!40000 ALTER TABLE `casos` DISABLE KEYS */;
INSERT INTO `casos` VALUES (1,1,1,1,1,'Caso de Accidente de Tránsito','pendiente','Civil','2024-06-19 21:43:39','2024-06-19 21:43:39'),(2,2,2,2,2,'Caso de Fraude Financiero','en curso','Penal','2024-06-19 21:43:39','2024-06-19 21:43:39'),(3,3,3,3,3,'Caso de Divorcio','cerrado','Familiar','2024-06-19 21:43:39','2024-06-19 21:43:39'),(4,4,4,4,4,'Caso de Responsabilidad Civil','pendiente','Civil','2024-06-19 21:43:39','2024-06-19 21:43:39'),(5,5,5,5,5,'Caso de Herencia Familiar','en curso','Familiar','2024-06-19 21:43:39','2024-06-19 21:43:39');
/*!40000 ALTER TABLE `casos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_aseguradora` int DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_aseguradora` (`id_aseguradora`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`id_aseguradora`) REFERENCES `aseguradoras` (`id_aseguradora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana','López','1980-05-15',1),(2,'Roberto','Gómez','1992-08-20',2),(3,'Sofía','Herrera','1975-03-10',3),(4,'Jorge','Ramírez','1988-11-25',4),(5,'María','Castro','1983-07-03',5);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juzgados`
--

DROP TABLE IF EXISTS `juzgados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juzgados` (
  `id_juzgado` int NOT NULL AUTO_INCREMENT,
  `nombre_juzgado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_juzgado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juzgados`
--

LOCK TABLES `juzgados` WRITE;
/*!40000 ALTER TABLE `juzgados` DISABLE KEYS */;
INSERT INTO `juzgados` VALUES (1,'Juzgado Civil de Panamá'),(2,'Juzgado Penal de Panamá'),(3,'Juzgado de Familia de Panamá'),(4,'Juzgado Administrativo de Panamá'),(5,'Juzgado Laboral de Panamá');
/*!40000 ALTER TABLE `juzgados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `contraseña` varchar(40) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `createat` datetime DEFAULT NULL,
  `updateat` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan','Pérez','123456','juan.perez@example.com','12345678','2024-06-19 21:42:46','2024-06-19 21:42:46'),(2,'María','González','password','maria.gonzalez@example.com','98765432','2024-06-19 21:42:46','2024-06-19 21:42:46'),(3,'Pedro','Martínez','securepass','pedro.martinez@example.com','56781234','2024-06-19 21:42:46','2024-06-19 21:42:46'),(4,'Laura','Sánchez','p@ssw0rd','laura.sanchez@example.com','11223344','2024-06-19 21:42:46','2024-06-19 21:42:46'),(5,'Carlos','López','mypassword','carlos.lopez@example.com','99887766','2024-06-19 21:42:46','2024-06-19 21:42:46');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_estados_casos`
--

DROP TABLE IF EXISTS `vista_estados_casos`;
/*!50001 DROP VIEW IF EXISTS `vista_estados_casos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estados_casos` AS SELECT 
 1 AS `casos_pendientes`,
 1 AS `casos_en_curso`,
 1 AS `casos_cerrados`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_estados_casos`
--

/*!50001 DROP VIEW IF EXISTS `vista_estados_casos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estados_casos` AS select sum((case when (`casos`.`estado` = 'pendiente') then 1 else 0 end)) AS `casos_pendientes`,sum((case when (`casos`.`estado` = 'en curso') then 1 else 0 end)) AS `casos_en_curso`,sum((case when (`casos`.`estado` = 'cerrado') then 1 else 0 end)) AS `casos_cerrados` from `casos` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 21:58:31
