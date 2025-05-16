/*M!999999\- enable the sandbox mode */
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: metroasir
-- ------------------------------------------------------
-- Server version       10.11.11-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `conexiones`
--

DROP TABLE IF EXISTS `conexiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `conexiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `estacion_origen_id` int(11) DEFAULT NULL,
  `estacion_destino_id` int(11) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `estacion_origen_id` (`estacion_origen_id`),
  KEY `estacion_destino_id` (`estacion_destino_id`),
  CONSTRAINT `conexiones_ibfk_1` FOREIGN KEY (`estacion_origen_id`) REFERENCES `estaciones` (`id`),
  CONSTRAINT `conexiones_ibfk_2` FOREIGN KEY (`estacion_destino_id`) REFERENCES `estaciones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conexiones`
--

LOCK TABLES `conexiones` WRITE;
/*!40000 ALTER TABLE `conexiones` DISABLE KEYS */;
INSERT INTO `conexiones` VALUES
(47,1,2,2),
(48,2,1,2),
(49,2,3,2),
(50,3,2,2),
(51,3,4,2),
(52,4,3,2),
(53,4,5,2),
(54,5,4,2),
(55,5,6,2),
(56,6,5,2),
(57,6,7,2),
(58,7,6,2),
(59,7,8,2),
(60,8,7,2),
(61,8,9,2),
(62,9,8,2),
(63,9,10,2),
(64,10,9,2),
(65,10,11,2),
(66,11,10,2),
(67,11,12,2),
(68,12,11,2),
(69,12,13,2),
(70,13,12,2),
(71,13,14,2),
(72,14,13,2),
(73,14,15,2),
(74,15,14,2),
(75,15,16,2),
(76,16,15,2),
(77,16,17,2),
(78,17,16,2),
(79,17,18,2),
(80,18,17,2),
(81,18,19,2),
(82,19,18,2),
(83,19,20,2),
(84,20,19,2),
(85,20,21,2),
(86,21,20,2),
(87,21,22,2),
(88,22,21,2),
(89,22,23,2),
(90,23,22,2);
/*!40000 ALTER TABLE `conexiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estaciones`
--

DROP TABLE IF EXISTS `estaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `estaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `linea` varchar(10) DEFAULT NULL,
  `adaptada` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estaciones`
--

LOCK TABLES `estaciones` WRITE;
/*!40000 ALTER TABLE `estaciones` DISABLE KEYS */;
INSERT INTO `estaciones` VALUES
(1,'Arguelles',NULL,0),
(2,'San Bernardo',NULL,0),
(3,'Bilbao',NULL,0),
(4,'Alonso Martínez',NULL,0),
(5,'Colón',NULL,0),
(6,'Serrano',NULL,0),
(7,'Velázquez',NULL,0),
(8,'Goya',NULL,1),
(9,'Lista',NULL,0),
(10,'Diego de León',NULL,1),
(11,'Avenida de América',NULL,1),
(12,'Prosperidad',NULL,0),
(13,'Alfonso XIII',NULL,0),
(14,'Avenida de la Paz',NULL,0),
(15,'Arturo Soria',NULL,1),
(16,'Esperanza',NULL,0),
(17,'Canillas',NULL,0),
(18,'Mar de Cristal',NULL,1),
(19,'San Lorenzo',NULL,0),
(20,'Parque de Santa María',NULL,0),
(21,'Hortaleza',NULL,0),
(22,'Manoteras',NULL,0),
(23,'Pinar de Chamartín',NULL,1);
/*!40000 ALTER TABLE `estaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-16 19:22:19