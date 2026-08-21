-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb_avengers
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `amenazas`
--

DROP TABLE IF EXISTS `amenazas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amenazas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_registro` datetime NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `evidencia` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitud` decimal(10,7) NOT NULL,
  `longitud` decimal(10,7) NOT NULL,
  `prioridad` enum('Baja','Media','Alta','Critica') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_amenaza_id` int NOT NULL,
  `PERSONAS_id` int NOT NULL,
  `MISIONES_id` int NOT NULL,
  `GRUPOS_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_amenaza_id` (`tipo_amenaza_id`),
  KEY `PERSONAS_id` (`PERSONAS_id`),
  KEY `MISIONES_id` (`MISIONES_id`),
  KEY `GRUPOS_id` (`GRUPOS_id`),
  CONSTRAINT `amenazas_ibfk_1` FOREIGN KEY (`tipo_amenaza_id`) REFERENCES `tipo_amenaza` (`id`),
  CONSTRAINT `amenazas_ibfk_2` FOREIGN KEY (`PERSONAS_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `amenazas_ibfk_3` FOREIGN KEY (`MISIONES_id`) REFERENCES `misiones` (`id`),
  CONSTRAINT `amenazas_ibfk_4` FOREIGN KEY (`GRUPOS_id`) REFERENCES `grupos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenazas`
--

LOCK TABLES `amenazas` WRITE;
/*!40000 ALTER TABLE `amenazas` DISABLE KEYS */;
INSERT INTO `amenazas` VALUES (1,'2026-01-09 15:00:00','Actividad tecnologica sospechosa','cam001.jpg',40.7128000,-74.0060000,'Alta',2,1,1,1),(2,'2026-01-09 16:00:00','Drones desconocidos detectados','cam002.jpg',40.7130000,-74.0050000,'Alta',2,1,1,1),(3,'2026-01-11 10:00:00','Senal de inteligencia enemiga','intel001.jpg',52.5200000,13.4050000,'Media',4,3,2,2),(4,'2026-01-11 11:00:00','Posible operacion de Zemo','intel002.jpg',52.5210000,13.4060000,'Alta',4,3,2,2),(5,'2026-03-10 09:00:00','Amenaza contra civiles','alert001.jpg',48.8566000,2.3522000,'Critica',3,7,3,1),(6,'2026-04-18 20:00:00','Senal alienigena','space001.jpg',0.3476000,32.5825000,'Critica',1,2,4,1);
/*!40000 ALTER TABLE `amenazas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arma_proveedor`
--

DROP TABLE IF EXISTS `arma_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arma_proveedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ARMAS_id` int NOT NULL,
  `PROVEEDORES_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ARMAS_id` (`ARMAS_id`,`PROVEEDORES_id`),
  KEY `PROVEEDORES_id` (`PROVEEDORES_id`),
  CONSTRAINT `arma_proveedor_ibfk_1` FOREIGN KEY (`ARMAS_id`) REFERENCES `armas` (`id`),
  CONSTRAINT `arma_proveedor_ibfk_2` FOREIGN KEY (`PROVEEDORES_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arma_proveedor`
--

LOCK TABLES `arma_proveedor` WRITE;
/*!40000 ALTER TABLE `arma_proveedor` DISABLE KEYS */;
INSERT INTO `arma_proveedor` VALUES (1,1,1),(2,2,2),(3,3,1),(4,3,2),(5,4,3),(6,5,1),(7,6,3);
/*!40000 ALTER TABLE `arma_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `armas`
--

DROP TABLE IF EXISTS `armas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `armas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modelo` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_arma_id` int NOT NULL,
  `funcion` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `clasificada` tinyint(1) NOT NULL DEFAULT '0',
  `experimental` tinyint(1) NOT NULL DEFAULT '0',
  `prototipo` tinyint(1) NOT NULL DEFAULT '0',
  `cantidad` int NOT NULL DEFAULT '1',
  `PERSONAS_id` int NOT NULL,
  `GRUPOS_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `tipo_arma_id` (`tipo_arma_id`),
  KEY `PERSONAS_id` (`PERSONAS_id`),
  KEY `GRUPOS_id` (`GRUPOS_id`),
  CONSTRAINT `armas_ibfk_1` FOREIGN KEY (`tipo_arma_id`) REFERENCES `tipo_arma` (`id`),
  CONSTRAINT `armas_ibfk_2` FOREIGN KEY (`PERSONAS_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `armas_ibfk_3` FOREIGN KEY (`GRUPOS_id`) REFERENCES `grupos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `armas`
--

LOCK TABLES `armas` WRITE;
/*!40000 ALTER TABLE `armas` DISABLE KEYS */;
INSERT INTO `armas` VALUES (1,'ARM001','Armadura Iron Man','Mark 85',1,'Combate y defensa',1,0,0,1,1,1),(2,'ARM002','Escudo de vibranium','Steve Shield',3,'Defensa',0,0,0,1,2,1),(3,'ARM003','Arma de energia','Prototype X',2,'Ataque energetico',1,1,1,2,4,3),(4,'ARM004','Arco tactico','Hawkeye Pro',3,'Ataque a distancia',0,0,0,1,5,1),(5,'ARM005','Guantelete experimental','Gamma-X',4,'Manipulacion energetica',1,1,1,1,8,3),(6,'ARM006','Dron de vigilancia','Vision Drone',1,'Reconocimiento',0,0,1,5,3,2);
/*!40000 ALTER TABLE `armas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_personas` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Operaciones',5),(2,'Inteligencia',3),(3,'Ciencia y Tecnologia',3),(4,'Seguridad',1),(5,'Medicina',0),(6,'Logistica',0);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enemigos`
--

DROP TABLE IF EXISTS `enemigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enemigos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_pila` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_completo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ataques_realizados` text COLLATE utf8mb4_unicode_ci,
  `ultima_ubicacion` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado_prision` enum('Libre','TheRaft') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enemigos`
--

LOCK TABLES `enemigos` WRITE;
/*!40000 ALTER TABLE `enemigos` DISABLE KEYS */;
INSERT INTO `enemigos` VALUES (1,'Thanos','Thanos','Ataques interplanetarios','Titan','Libre'),(2,'Loki','Loki Laufeyson','Infiltracion y manipulacion','Nueva York','TheRaft'),(3,'Ultron','Ultron','Ataques tecnologicos','Sokovia','Libre'),(4,'Zemo','Helmut Zemo','Operaciones de sabotaje','Berlin','TheRaft');
/*!40000 ALTER TABLE `enemigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objetivo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEPARTAMENTOS_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `DEPARTAMENTOS_id` (`DEPARTAMENTOS_id`),
  CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`DEPARTAMENTOS_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'Avengers','Defensa global',1),(2,'S.H.I.E.L.D.','Inteligencia y operaciones',2),(3,'Stark Industries','Desarrollo tecnologico',3),(4,'Guardianes de Seguridad','Proteccion de instalaciones',4),(5,'Equipo Medico','Atencion medica',5),(6,'Logistica Central','Suministro y transporte',6);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_asignacion`
--

DROP TABLE IF EXISTS `historial_asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_asignacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_asignacion` datetime NOT NULL,
  `fecha_finalizacion` datetime DEFAULT NULL,
  `tipo_asignacion` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observacion` text COLLATE utf8mb4_unicode_ci,
  `PERSONAS_id` int NOT NULL,
  `DEPARTAMENTOS_id` int NOT NULL,
  `MISIONES_id` int NOT NULL,
  `GRUPOS_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PERSONAS_id` (`PERSONAS_id`),
  KEY `DEPARTAMENTOS_id` (`DEPARTAMENTOS_id`),
  KEY `MISIONES_id` (`MISIONES_id`),
  KEY `GRUPOS_id` (`GRUPOS_id`),
  CONSTRAINT `historial_asignacion_ibfk_1` FOREIGN KEY (`PERSONAS_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `historial_asignacion_ibfk_2` FOREIGN KEY (`DEPARTAMENTOS_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `historial_asignacion_ibfk_3` FOREIGN KEY (`MISIONES_id`) REFERENCES `misiones` (`id`),
  CONSTRAINT `historial_asignacion_ibfk_4` FOREIGN KEY (`GRUPOS_id`) REFERENCES `grupos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_asignacion`
--

LOCK TABLES `historial_asignacion` WRITE;
/*!40000 ALTER TABLE `historial_asignacion` DISABLE KEYS */;
INSERT INTO `historial_asignacion` VALUES (1,'2026-01-01 08:00:00',NULL,'Operativa','Asignacion principal',1,1,1,1),(2,'2026-01-01 08:00:00',NULL,'Operativa','Lider de campo',2,1,1,1),(3,'2026-01-01 08:00:00',NULL,'Inteligencia','Analisis de informacion',3,2,2,2),(4,'2026-01-01 08:00:00',NULL,'Cientifica','Investigacion tecnologica',4,3,2,3),(5,'2026-03-01 08:00:00',NULL,'Operativa','Apoyo militar',7,1,3,1);
/*!40000 ALTER TABLE `historial_asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mision_arma`
--

DROP TABLE IF EXISTS `mision_arma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mision_arma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `MISIONES_id` int NOT NULL,
  `ARMAS_id` int NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `MISIONES_id` (`MISIONES_id`,`ARMAS_id`),
  KEY `ARMAS_id` (`ARMAS_id`),
  CONSTRAINT `mision_arma_ibfk_1` FOREIGN KEY (`MISIONES_id`) REFERENCES `misiones` (`id`),
  CONSTRAINT `mision_arma_ibfk_2` FOREIGN KEY (`ARMAS_id`) REFERENCES `armas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mision_arma`
--

LOCK TABLES `mision_arma` WRITE;
/*!40000 ALTER TABLE `mision_arma` DISABLE KEYS */;
INSERT INTO `mision_arma` VALUES (1,1,1,1),(2,1,4,2),(3,2,3,1),(4,2,6,3),(5,4,1,1),(6,4,5,1);
/*!40000 ALTER TABLE `mision_arma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mision_departamento_apoyo`
--

DROP TABLE IF EXISTS `mision_departamento_apoyo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mision_departamento_apoyo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `MISIONES_id` int NOT NULL,
  `DEPARTAMENTOS_id` int NOT NULL,
  `necesidad` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MISIONES_id` (`MISIONES_id`,`DEPARTAMENTOS_id`),
  KEY `DEPARTAMENTOS_id` (`DEPARTAMENTOS_id`),
  CONSTRAINT `mision_departamento_apoyo_ibfk_1` FOREIGN KEY (`MISIONES_id`) REFERENCES `misiones` (`id`),
  CONSTRAINT `mision_departamento_apoyo_ibfk_2` FOREIGN KEY (`DEPARTAMENTOS_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mision_departamento_apoyo`
--

LOCK TABLES `mision_departamento_apoyo` WRITE;
/*!40000 ALTER TABLE `mision_departamento_apoyo` DISABLE KEYS */;
INSERT INTO `mision_departamento_apoyo` VALUES (1,1,3,'Soporte tecnologico'),(2,1,4,'Seguridad del perimetro'),(3,2,2,'Analisis de inteligencia'),(4,2,5,'Atencion medica'),(5,4,3,'Analisis energetico'),(6,4,6,'Transporte y suministros');
/*!40000 ALTER TABLE `mision_departamento_apoyo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mision_grupo_apoyo`
--

DROP TABLE IF EXISTS `mision_grupo_apoyo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mision_grupo_apoyo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `MISIONES_id` int NOT NULL,
  `GRUPOS_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `MISIONES_id` (`MISIONES_id`,`GRUPOS_id`),
  KEY `GRUPOS_id` (`GRUPOS_id`),
  CONSTRAINT `mision_grupo_apoyo_ibfk_1` FOREIGN KEY (`MISIONES_id`) REFERENCES `misiones` (`id`),
  CONSTRAINT `mision_grupo_apoyo_ibfk_2` FOREIGN KEY (`GRUPOS_id`) REFERENCES `grupos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mision_grupo_apoyo`
--

LOCK TABLES `mision_grupo_apoyo` WRITE;
/*!40000 ALTER TABLE `mision_grupo_apoyo` DISABLE KEYS */;
INSERT INTO `mision_grupo_apoyo` VALUES (1,1,3),(2,1,4),(3,2,2),(4,4,3),(5,4,5);
/*!40000 ALTER TABLE `mision_grupo_apoyo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `misiones`
--

DROP TABLE IF EXISTS `misiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `misiones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` datetime NOT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `objetivo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lugar` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `horas_totales` decimal(8,2) NOT NULL,
  `resultado` enum('Exito','Fracaso') COLLATE utf8mb4_unicode_ci NOT NULL,
  `responsable_grupo_id` int DEFAULT NULL,
  `responsable_persona_id` int DEFAULT NULL,
  `enemigo_id` int DEFAULT NULL,
  `objetivo_generico` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `responsable_grupo_id` (`responsable_grupo_id`),
  KEY `responsable_persona_id` (`responsable_persona_id`),
  KEY `enemigo_id` (`enemigo_id`),
  CONSTRAINT `misiones_ibfk_1` FOREIGN KEY (`responsable_grupo_id`) REFERENCES `grupos` (`id`),
  CONSTRAINT `misiones_ibfk_2` FOREIGN KEY (`responsable_persona_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `misiones_ibfk_3` FOREIGN KEY (`enemigo_id`) REFERENCES `enemigos` (`id`),
  CONSTRAINT `misiones_chk_1` CHECK ((((`responsable_grupo_id` is not null) and (`responsable_persona_id` is null)) or ((`responsable_grupo_id` is null) and (`responsable_persona_id` is not null)))),
  CONSTRAINT `misiones_chk_2` CHECK ((((`enemigo_id` is not null) and (`objetivo_generico` is null)) or ((`enemigo_id` is null) and (`objetivo_generico` is not null)))),
  CONSTRAINT `misiones_chk_3` CHECK (((`fecha_fin` is null) or (`fecha_fin` >= `fecha_inicio`)))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `misiones`
--

LOCK TABLES `misiones` WRITE;
/*!40000 ALTER TABLE `misiones` DISABLE KEYS */;
INSERT INTO `misiones` VALUES (1,'2026-01-10 08:00:00','2026-01-10 20:00:00','Defender la ciudad ante una amenaza tecnologica','Nueva York',120.00,'Exito',1,NULL,3,NULL),(2,'2026-02-05 09:00:00','2026-02-06 19:00:00','Investigar actividad de inteligencia','Berlin',150.00,'Exito',2,NULL,4,NULL),(3,'2026-03-15 10:00:00','2026-03-15 18:00:00','Evacuar civiles de una zona de riesgo','Sokovia',80.00,'Fracaso',NULL,7,NULL,'Base de evacuacion'),(4,'2026-04-20 07:00:00','2026-04-21 13:00:00','Contener amenaza alienigena','Wakanda',140.00,'Exito',1,NULL,1,NULL);
/*!40000 ALTER TABLE `misiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partes_arma`
--

DROP TABLE IF EXISTS `partes_arma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partes_arma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_parte` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `ARMAS_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ARMAS_id` (`ARMAS_id`),
  CONSTRAINT `partes_arma_ibfk_1` FOREIGN KEY (`ARMAS_id`) REFERENCES `armas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partes_arma`
--

LOCK TABLES `partes_arma` WRITE;
/*!40000 ALTER TABLE `partes_arma` DISABLE KEYS */;
INSERT INTO `partes_arma` VALUES (1,'Nucleo energetico','Fuente principal de energia',1),(2,'Placas de defensa','Proteccion externa',1),(3,'Aleacion especial','Material de alta resistencia',2),(4,'Emisor energetico','Generador de energia',3),(5,'Control neuronal','Sistema de control',5);
/*!40000 ALTER TABLE `partes_arma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_mision`
--

DROP TABLE IF EXISTS `persona_mision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona_mision` (
  `id` int NOT NULL AUTO_INCREMENT,
  `funcion` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PERSONAS_id` int NOT NULL,
  `MISIONES_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PERSONAS_id` (`PERSONAS_id`,`MISIONES_id`),
  KEY `MISIONES_id` (`MISIONES_id`),
  CONSTRAINT `persona_mision_ibfk_1` FOREIGN KEY (`PERSONAS_id`) REFERENCES `personas` (`id`),
  CONSTRAINT `persona_mision_ibfk_2` FOREIGN KEY (`MISIONES_id`) REFERENCES `misiones` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_mision`
--

LOCK TABLES `persona_mision` WRITE;
/*!40000 ALTER TABLE `persona_mision` DISABLE KEYS */;
INSERT INTO `persona_mision` VALUES (1,'Lider',1,1),(2,'Combate',2,1),(3,'Apoyo aereo',7,1),(4,'Investigacion',4,2),(5,'Inteligencia',3,2),(6,'Comando',9,2),(7,'Evacuacion',7,3),(8,'Combate',6,4),(9,'Estrategia',1,4),(10,'Apoyo',8,4);
/*!40000 ALTER TABLE `persona_mision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipo_documento` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_documento` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre_completo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estado` enum('Activo','Inactivo','Muerto') COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto_perfil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asignado_mision` tinyint(1) NOT NULL DEFAULT '0',
  `aumentado` tinyint(1) NOT NULL DEFAULT '0',
  `tipo_aumento` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `habilidad` text COLLATE utf8mb4_unicode_ci,
  `tipo_miembro` enum('Principal','Civil','Militar') COLLATE utf8mb4_unicode_ci NOT NULL,
  `horas_mision` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total_misiones` int NOT NULL DEFAULT '0',
  `DEPARTAMENTOS_id` int NOT NULL,
  `GRUPOS_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_documento` (`numero_documento`),
  KEY `DEPARTAMENTOS_id` (`DEPARTAMENTOS_id`),
  KEY `GRUPOS_id` (`GRUPOS_id`),
  CONSTRAINT `personas_ibfk_1` FOREIGN KEY (`DEPARTAMENTOS_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `personas_ibfk_2` FOREIGN KEY (`GRUPOS_id`) REFERENCES `grupos` (`id`),
  CONSTRAINT `personas_chk_1` CHECK ((((`aumentado` = true) and (`tipo_aumento` is not null) and (`habilidad` is not null)) or ((`aumentado` = false) and (`tipo_aumento` is null) and (`habilidad` is null))))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,'CC','1001','Tony Stark','1970-05-29','Activo',NULL,1,0,NULL,NULL,'Principal',260.00,2,1,1),(2,'CC','1002','Steve Rogers','1918-07-04','Activo',NULL,1,1,'Biologico','Fuerza y resistencia aumentada','Principal',120.00,1,1,1),(3,'CC','1003','Natasha Romanoff','1984-11-22','Activo',NULL,1,0,NULL,NULL,'Principal',150.00,1,2,2),(4,'CC','1004','Bruce Banner','1969-12-18','Activo',NULL,1,1,'Mutante','Transformacion y fuerza superior','Principal',150.00,1,3,3),(5,'CC','1005','Clint Barton','1971-01-07','Activo',NULL,1,0,NULL,NULL,'Militar',0.00,0,1,1),(6,'CC','1006','Peter Parker','2001-08-10','Activo',NULL,1,1,'Biologico','Fuerza, agilidad y sentidos mejorados','Principal',140.00,1,1,1),(7,'CC','1007','Sam Wilson','1978-09-23','Activo',NULL,1,0,NULL,NULL,'Militar',120.00,1,1,1),(8,'CC','1008','Wanda Maximoff','1989-02-10','Activo',NULL,1,1,'Mutante','Manipulacion de energia','Principal',140.00,1,3,3),(9,'CC','1009','Nick Fury','1951-12-04','Activo',NULL,0,0,NULL,NULL,'Militar',150.00,1,2,2),(10,'CC','1010','Maria Hill','1982-04-04','Activo',NULL,0,0,NULL,NULL,'Militar',0.00,0,2,2),(11,'CC','1011','Pepper Potts','1974-02-10','Activo',NULL,0,0,NULL,NULL,'Civil',0.00,0,3,3),(12,'CC','1012','Happy Hogan','1969-09-29','Activo',NULL,0,0,NULL,NULL,'Militar',0.00,0,4,4);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_servicio_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `tipo_servicio_id` (`tipo_servicio_id`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`tipo_servicio_id`) REFERENCES `tipo_servicio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Stark Industries',1),(2,'Wakanda Design Group',2),(3,'S.H.I.E.L.D. Supply',4),(4,'Pym Technologies',3),(5,'Oscorp',1);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_amenaza`
--

DROP TABLE IF EXISTS `tipo_amenaza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_amenaza` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_amenaza`
--

LOCK TABLES `tipo_amenaza` WRITE;
/*!40000 ALTER TABLE `tipo_amenaza` DISABLE KEYS */;
INSERT INTO `tipo_amenaza` VALUES (5,'Actividad mutante'),(3,'Amenaza biologica'),(1,'Invasion alienigena'),(2,'Tecnologia avanzada'),(4,'Terrorismo');
/*!40000 ALTER TABLE `tipo_amenaza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_arma`
--

DROP TABLE IF EXISTS `tipo_arma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_arma` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_arma`
--

LOCK TABLES `tipo_arma` WRITE;
/*!40000 ALTER TABLE `tipo_arma` DISABLE KEYS */;
INSERT INTO `tipo_arma` VALUES (5,'Contencion'),(2,'Energetica'),(4,'Experimental'),(3,'Tactica'),(1,'Tecnologica');
/*!40000 ALTER TABLE `tipo_arma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servicio`
--

DROP TABLE IF EXISTS `tipo_servicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_servicio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servicio`
--

LOCK TABLES `tipo_servicio` WRITE;
/*!40000 ALTER TABLE `tipo_servicio` DISABLE KEYS */;
INSERT INTO `tipo_servicio` VALUES (2,'Armamento'),(3,'Investigacion'),(4,'Logistica'),(5,'Seguridad'),(1,'Tecnologia');
/*!40000 ALTER TABLE `tipo_servicio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-20 20:41:37
