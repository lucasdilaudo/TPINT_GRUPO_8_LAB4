-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: bdbanco
-- ------------------------------------------------------
-- Server version	8.0.23

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

-- -----------------------------------------------------
-- Schema bdbanco
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdbanco` ;
USE `bdbanco` ;


--
-- Table structure for table `cuentas`
--

DROP TABLE IF EXISTS `cuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas` (
  `NrodeCuenta` int NOT NULL,
  `CBU` int NOT NULL,
  `FechadeCreacion` datetime NOT NULL,
  `Saldo` double NOT NULL,
  `Estado` tinyint NOT NULL,
  `tiposdecuentas_IDTipodeCuenta` int NOT NULL,
  `usuarios_DNI` int NOT NULL,
  PRIMARY KEY (`CBU`,`NrodeCuenta`,`tiposdecuentas_IDTipodeCuenta`,`usuarios_DNI`),
  KEY `fk_cuentas_tiposdecuentas1_idx` (`tiposdecuentas_IDTipodeCuenta`),
  KEY `fk_cuentas_usuarios1_idx` (`usuarios_DNI`),
  CONSTRAINT `fk_cuentas_tiposdecuentas1` FOREIGN KEY (`tiposdecuentas_IDTipodeCuenta`) REFERENCES `tiposdecuentas` (`IDTipodeCuenta`),
  CONSTRAINT `fk_cuentas_usuarios1` FOREIGN KEY (`usuarios_DNI`) REFERENCES `usuarios` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas`
--

LOCK TABLES `cuentas` WRITE;
/*!40000 ALTER TABLE `cuentas` DISABLE KEYS */;
INSERT INTO `cuentas` VALUES (7412,15165,'2020-02-20 00:00:00',10000,1,2,123452),(2468,15169,'2020-03-20 00:00:00',10000,1,2,123456),(8998,15616,'2019-09-12 00:00:00',10000,1,2,123457),(8412,16513,'2020-06-15 00:00:00',10000,1,1,123453),(7523,21354,'2021-02-16 00:00:00',9000,1,2,1234510),(5254,21563,'2021-06-24 00:00:00',10000,1,2,123454),(5275,22665,'2020-06-25 00:00:00',10000,1,1,1234510),(3872,23153,'2019-06-03 00:00:00',10000,1,2,123458),(7893,25168,'2021-05-19 00:00:00',10000,1,1,123457),(7245,35244,'2020-05-08 00:00:00',10000,1,2,123459),(3652,35412,'2020-07-13 00:00:00',10000,1,1,123451),(4535,35426,'2020-08-10 00:00:00',10000,1,1,123455),(8561,51316,'2020-09-20 00:00:00',10000,1,2,123451),(7823,57863,'2018-05-09 00:00:00',11000,1,1,123459),(6854,75177,'2020-11-13 00:00:00',10000,1,2,123451),(4356,98465,'2020-05-23 00:00:00',10000,0,1,123454),(100,100100,'2021-07-15 00:00:00',11866.667007446289,1,2,3622680);
/*!40000 ALTER TABLE `cuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meses`
--

DROP TABLE IF EXISTS `meses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meses` (
  `IdMes` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`IdMes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meses`
--

LOCK TABLES `meses` WRITE;
/*!40000 ALTER TABLE `meses` DISABLE KEYS */;
/*!40000 ALTER TABLE `meses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimiento`
--

DROP TABLE IF EXISTS `movimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimiento` (
  `IDmovimiento` int NOT NULL AUTO_INCREMENT,
  `FechaMovimiento` datetime NOT NULL,
  `DetalleMovimiento` varchar(45) NOT NULL,
  `ImporteMovimiento` float NOT NULL,
  `TipoMovimiento` int NOT NULL,
  `CBU origen` int DEFAULT NULL,
  `CBU destino` int DEFAULT NULL,
  PRIMARY KEY (`IDmovimiento`),
  KEY `fk_movimiento_tipoMovimiento_TIPO_idx` (`TipoMovimiento`),
  KEY `fk_movimiento_cuentas_CBUorigen_idx` (`CBU origen`),
  CONSTRAINT `fk_movimiento_cuentas_CBUorigen` FOREIGN KEY (`CBU origen`) REFERENCES `cuentas` (`CBU`) ON UPDATE CASCADE,
  CONSTRAINT `fk_movimiento_tipoMovimiento_TIPO` FOREIGN KEY (`TipoMovimiento`) REFERENCES `tiposdemovimientos` (`IDTipodeMovimiento`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimiento`
--

LOCK TABLES `movimiento` WRITE;
/*!40000 ALTER TABLE `movimiento` DISABLE KEYS */;
INSERT INTO `movimiento` VALUES (51,'2021-07-15 00:00:00','Honorarios',1000,4,21354,57863),(52,'2021-07-15 00:00:00','Alta de Cuenta',10000,1,100100,100100),(53,'2021-07-15 00:00:00','Alta de Prestamo',2000,2,100100,100100),(54,'2021-07-15 00:00:00','Alta de Prestamo',4000,2,100100,100100),(55,'2021-07-15 00:00:00','Pago de Prestamo',4000,3,100100,100100),(56,'2021-07-15 00:00:00','Pago de Prestamo',133.333,3,100100,100100);
/*!40000 ALTER TABLE `movimiento` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tranferencia` AFTER INSERT ON `movimiento` FOR EACH ROW begin
Update cuentas Set saldo=saldo+NEW.ImporteMovimiento Where cuentas.CBU=NEW.`CBU destino` AND NEW.TipoMovimiento=4;
Update cuentas Set saldo=saldo-NEW.ImporteMovimiento Where cuentas.CBU=NEW.`CBU origen` AND NEW.TipoMovimiento=4;
Update cuentas Set saldo=saldo-NEW.ImporteMovimiento Where cuentas.CBU=NEW.`CBU origen` AND NEW.TipoMovimiento=3;
Update cuentas Set saldo=saldo+NEW.ImporteMovimiento Where cuentas.CBU=NEW.`CBU origen` AND NEW.TipoMovimiento=2;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `idprestamos` int NOT NULL AUTO_INCREMENT,
  `CBU` int NOT NULL,
  `FechaPrestamo` datetime NOT NULL,
  `ImportePedido` float NOT NULL,
  `ImporteApagar` float NOT NULL,
  `PlazoPrestamo` int NOT NULL,
  `MontoMensual` float NOT NULL,
  `CantCuotas` int NOT NULL,
  `aceptado` int DEFAULT NULL,
  PRIMARY KEY (`idprestamos`),
  KEY `fk_prestamos_cuentas_CBU_idx` (`CBU`),
  CONSTRAINT `fk_prestamos_cuentas_CBU` FOREIGN KEY (`CBU`) REFERENCES `cuentas` (`CBU`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (16,21354,'2021-07-15 00:00:00',7000,5000,12,583.333,12,NULL),(17,100100,'2021-07-15 00:00:00',3200,1866.67,24,133.333,23,1),(18,100100,'2021-07-15 00:00:00',5460,3900,12,455,12,NULL),(19,100100,'2021-07-15 00:00:00',5600,0,12,466.667,0,1);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `prestamos_AFTER_UPDATE` AFTER UPDATE ON `prestamos` FOR EACH ROW BEGIN
	if old.aceptado is null then
			if (new.aceptado=1) then
				insert into movimiento values(default,new.FechaPrestamo,'Alta de Prestamo',new.ImporteApagar,2,new.CBU,new.CBU);
				end if;
		end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tiposdecuentas`
--

DROP TABLE IF EXISTS `tiposdecuentas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposdecuentas` (
  `IDTipodeCuenta` int NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Estado` tinyint NOT NULL,
  PRIMARY KEY (`IDTipodeCuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposdecuentas`
--

LOCK TABLES `tiposdecuentas` WRITE;
/*!40000 ALTER TABLE `tiposdecuentas` DISABLE KEYS */;
INSERT INTO `tiposdecuentas` VALUES (1,'Caja de ahorro',1),(2,'Cuenta Corriente',1);
/*!40000 ALTER TABLE `tiposdecuentas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposdemovimientos`
--

DROP TABLE IF EXISTS `tiposdemovimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiposdemovimientos` (
  `IDTipodeMovimiento` int NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Estado` tinyint NOT NULL,
  PRIMARY KEY (`IDTipodeMovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposdemovimientos`
--

LOCK TABLES `tiposdemovimientos` WRITE;
/*!40000 ALTER TABLE `tiposdemovimientos` DISABLE KEYS */;
INSERT INTO `tiposdemovimientos` VALUES (1,'Alta de cuenta',1),(2,'Alta de un pr�stamo',1),(3,'Pago de pr�stamo',1),(4,'Transferencia.',1);
/*!40000 ALTER TABLE `tiposdemovimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `DNI` int NOT NULL,
  `Cuil` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Sexo` int DEFAULT NULL,
  `Nacionalidad` varchar(50) DEFAULT NULL,
  `FechadeNacimiento` datetime DEFAULT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  `Localidad` varchar(50) DEFAULT NULL,
  `Provincia` varchar(50) NOT NULL,
  `CorreoElectronico` varchar(50) NOT NULL,
  `Telefono` int NOT NULL,
  `TipodeUsuario` int NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Contrasena` varchar(20) NOT NULL,
  `Estado` tinyint NOT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,1111,'pablo','ayza',2,'Argentina','1999-06-05 00:00:00','sarmiento 3244','San Miguel','Buenos Aires','pablo002@hotmail.com',65493217,1,'pablo','1234',1),(2,2222,'fede','maza',2,'Argentina','1998-03-08 00:00:00','constituyentes 3562','Gral. pacheco','Buenos Aires','Federico@hotmail.com',95137534,1,'fede','1234',1),(3,3333,'Lucas','Di laudo',2,'Argentina','1997-08-17 00:00:00','Corrientes 230','Hurlingham','Buenos Aires','Lucas@hotmail.com',85267524,1,'lucas','1234',0),(4,4444,'Marcos','Zone',2,'Argentina','1999-10-13 00:00:00','cordoba 657','Avellaneda','Buenos Aires','marcos@hotmail.com',63257854,1,'marcos','1234',1),(5,5555,'Profe','UTN',2,'Argentina','2002-01-01 00:00:00','Av.Hipolito Yrigoyen 288','Gral. pacheco','Buenos Aires','profeUTN@hotmail.com',12345678,1,'profeUTN','1234',1),(123451,154321,'Jorge','Fernandez',2,'Chile','1995-07-27 00:00:00','Tucuman 695','caseros','Buenos Aires','Jorge@hotmail.com',85693652,2,'jorge','5678',1),(123452,254321,'Juana','Hernandez',1,'Peru','1989-06-23 00:00:00','Flauber 132','San Martín','Santa Fe','JuanaHernandez@hotmail.com',34021336,2,'juana','5678',1),(123453,354321,'Jose Maria','Vargas',2,'Argentina','1980-08-29 00:00:00','Risso Patrón 581','Laferrere','Buenos Aires','Vargas@hotmail.com',46269348,2,'vargas','5678',1),(123454,454321,'Enriqua','Manfrin',1,'Argentina','1972-01-14 00:00:00','Urquiza 1585','Gualeguaychú','Entre Ríos','Enriqua@hotmail.com',96574235,2,'erniqua','5678',1),(123455,554321,'Naomi','fallaci',1,'Argentina','1994-07-18 00:00:00','F Amoedo 7123','Quilmes','Buenos Aires','Nao@hotmail.com',42536356,2,'naomi','5678',1),(123456,654321,'Diego','Caseres',2,'Argentina','1985-01-17 00:00:00','A Vignes 1410','Haedo','Buenos Aires','Diego@hotmail.com',85246397,2,'diego','5678',1),(123457,754321,'German','Pirozi',2,'Argentina','1985-08-21 00:00:00','Manuel Belgran 1923','La plata','Buenos Aires','German@hotmail.com',84673162,2,'german','5678',1),(123458,854321,'Vicente','Pestalozzi',2,'Argentina','1987-04-10 00:00:00','Roque Saenz Pe A 298','Rafaela','Santa Fe','vicente@hotmail.com',96574255,2,'vicente','5678',1),(123459,954321,'Aricela','Malavia',1,'Argentina','1985-04-11 00:00:00','21 De Caballeria 765','Gualeguaychú','Entre Ríos','aricela@hotmail.com',96124235,2,'aricela','5678',1),(1234510,1054321,'Facundo','Torres',2,'Argentina','1997-11-10 00:00:00','Ramos Mejias 16105','Villa María','Córdoba','facu@hotmail.com',65434235,2,'facundo','5678',1),(3622680,2036222680,'paulo','londra',1,'argentina','1990-05-26 00:00:00','direccion1','local','buens aires','paulo@hotmail.com',4746,2,'paulo','londra',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bdbanco'
--

--
-- Dumping routines for database 'bdbanco'
--
/*!50003 DROP PROCEDURE IF EXISTS `crearCuenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `crearCuenta`(IN _nroCuenta int, IN _cbu int, IN _fechaCreacion datetime, IN _saldo double, IN _estado tinyint, IN _tiposdecuentas_IDTipodeCuenta int, IN _usuarios_DNI int)
BEGIN
	 INSERT INTO cuentas(NrodeCuenta, CBU, FechadeCreacion, Saldo, Estado, tiposdecuentas_IDTipodeCuenta, usuarios_DNI) 
		VALUES (_nroCuenta, _cbu, _fechaCreacion, _saldo, _estado, _tiposdecuentas_IDTipodeCuenta, _usuarios_DNI);
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

-- Dump completed on 2021-07-15  3:19:31
