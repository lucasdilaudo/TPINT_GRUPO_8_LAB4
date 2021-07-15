-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bdbanco
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bdbanco
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bdbanco` ;
USE `bdbanco` ;

-- -----------------------------------------------------
-- Table `bdbanco`.`tiposdecuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdbanco`.`tiposdecuentas` (
  `IDTipodeCuenta` INT NOT NULL,
  `Descripcion` VARCHAR(50) NOT NULL,
  `Estado` TINYINT NOT NULL,
  PRIMARY KEY (`IDTipodeCuenta`))

;

-- -----------------------------------------------------
-- Table `bdbanco`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdbanco`.`usuarios` (
  `DNI` INT NOT NULL,
  `Cuil` INT NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  `Apellido` VARCHAR(50) NOT NULL,
  `Sexo` INT NULL DEFAULT NULL,
  `Nacionalidad` VARCHAR(50) NULL DEFAULT NULL,
  `FechadeNacimiento` DATETIME NULL DEFAULT NULL,
  `Direccion` VARCHAR(50) NULL DEFAULT NULL,
  `Localidad` VARCHAR(50) NULL DEFAULT NULL,
  `Provincia` VARCHAR(50) NOT NULL,
  `CorreoElectronico` VARCHAR(50) NOT NULL,
  `Telefono` INT NOT NULL,
  `TipodeUsuario` INT NOT NULL,
  `Usuario` VARCHAR(20) NOT NULL,
  `Contrasena` VARCHAR(20) NOT NULL,
  `Estado` TINYINT NOT NULL,
  PRIMARY KEY (`DNI`));



-- -----------------------------------------------------
-- Table `bdbanco`.`cuentas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdbanco`.`cuentas` (
  `NrodeCuenta` INT NOT NULL,
  `CBU` INT NOT NULL,
  `FechadeCreacion` DATETIME NOT NULL,
  `Saldo` DECIMAL(10,2) NOT NULL,
  `Estado` TINYINT NOT NULL,
  `tiposdecuentas_IDTipodeCuenta` INT NOT NULL,
  `usuarios_DNI` INT NOT NULL,
  PRIMARY KEY (`CBU`, `NrodeCuenta`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`),
  INDEX `fk_cuentas_tiposdecuentas1_idx` (`tiposdecuentas_IDTipodeCuenta` ASC) VISIBLE,
  INDEX `fk_cuentas_usuarios1_idx` (`usuarios_DNI` ASC) VISIBLE,
  CONSTRAINT `fk_cuentas_tiposdecuentas1`
    FOREIGN KEY (`tiposdecuentas_IDTipodeCuenta`)
    REFERENCES `bdbanco`.`tiposdecuentas` (`IDTipodeCuenta`),
  CONSTRAINT `fk_cuentas_usuarios1`
    FOREIGN KEY (`usuarios_DNI`)
    REFERENCES `bdbanco`.`usuarios` (`DNI`));



-- -----------------------------------------------------
-- Table `bdbanco`.`tiposdemovimientos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdbanco`.`tiposdemovimientos` (
  `IDTipodeMovimiento` INT NOT NULL,
  `Descripcion` VARCHAR(50) NOT NULL,
  `Estado` TINYINT NOT NULL,
  PRIMARY KEY (`IDTipodeMovimiento`))
;


-- -----------------------------------------------------
-- Table `bdbanco`.`movimiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdbanco`.`movimiento` (
  `IDmovimiento` INT NOT NULL AUTO_INCREMENT,
  `FechaMovimiento` DATETIME NOT NULL,
  `DetalleMovimiento` VARCHAR(45) NOT NULL,
  `ImporteMovimiento` DECIMAL(10,2) NOT NULL,
  `TipoMovimiento` INT NOT NULL,
  `CBU origen` INT NOT NULL,
  `CBU destino` INT NOT NULL,
  PRIMARY KEY (`IDmovimiento`),
  INDEX `fk_movimiento_tipoMovimiento_TIPO_idx` (`TipoMovimiento` ASC) VISIBLE,
  INDEX `fk_movimiento_cuentas_CBUorigen_idx` (`CBU origen` ASC) VISIBLE,
  CONSTRAINT `fk_movimiento_cuentas_CBUorigen`
    FOREIGN KEY (`CBU origen`)
    REFERENCES `bdbanco`.`cuentas` (`CBU`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movimiento_tipoMovimiento_TIPO`
    FOREIGN KEY (`TipoMovimiento`)
    REFERENCES `bdbanco`.`tiposdemovimientos` (`IDTipodeMovimiento`)
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table `bdbanco`.`prestamos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bdbanco`.`prestamos` (
  `idprestamos` INT NOT NULL AUTO_INCREMENT,
  `CBU` INT NOT NULL,
  `FechaPrestamo` DATETIME NOT NULL,
  `ImporteApagar` FLOAT NOT NULL,
  `ImportePedido` FLOAT NOT NULL,
  `PlazoPrestamo` INT NOT NULL,
  `MontoMensual` FLOAT NOT NULL,
  `CantCuotas` INT NOT NULL,
  PRIMARY KEY (`idprestamos`),
  INDEX `fk_prestamos_cuentas_CBU_idx` (`CBU` ASC) VISIBLE,
  CONSTRAINT `fk_prestamos_cuentas_CBU`
    FOREIGN KEY (`CBU`)
    REFERENCES `bdbanco`.`cuentas` (`CBU`)
    ON UPDATE CASCADE)
;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

ALTER TABLE `bdbanco`.`prestamos` 
ADD COLUMN `aceptado` INT NULL AFTER `CantCuotas`;



CREATE DEFINER=`root`@`localhost` TRIGGER `prestamos_AFTER_UPDATE` AFTER UPDATE ON `prestamos` FOR EACH ROW BEGIN
	if old.aceptado is null then
			if (new.aceptado=1) then
				insert into movimiento values(default,new.FechaPrestamo,'Alta de Prestamo',new.ImporteApagar,2,new.CBU,new.CBU);
				end if;
		end if;
        
	

END

CREATE DEFINER=`root`@`localhost` TRIGGER `tranferencia` AFTER INSERT ON `movimiento` FOR EACH ROW begin

    Update cuentas Set saldo=saldo+NEW.ImporteMovimiento Where cuentas.CBU=NEW.`CBU destino` AND NEW.TipoMovimiento=4;
	Update cuentas Set saldo=saldo-NEW.ImporteMovimiento Where cuentas.CBU=NEW.`CBU origen` AND NEW.TipoMovimiento=4;
		Update cuentas Set saldo=saldo-NEW.ImporteMovimiento Where cuentas.CBU=NEW.`CBU origen` AND NEW.TipoMovimiento=3;
    Update cuentas Set saldo=saldo+NEW.ImporteMovimiento Where cuentas.CBU=NEW.`CBU origen` AND NEW.TipoMovimiento=2;

end

CREATE TABLE `meses` (
  `IdMes` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`IdMes`)
) 
-- --------------------------
-- Registros
-- --------------------------

-- --------------------------
-- Registro Tipos de usuarios. 
-- --------------------------
INSERT INTO `bdbanco`.`tiposdecuentas` (`IDTipodeCuenta`, `Descripcion`, `Estado`) 
VALUES ('1', 'caja de ahorro', '1');
INSERT INTO `bdbanco`.`tiposdecuentas` (`IDTipodeCuenta`, `Descripcion`, `Estado`) 
VALUES ('2', 'cuenta corriente', '1');
-- --------------------------
-- Registro Usuarios. 
-- --------------------------
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`) 
VALUES ('1', '1111', 'pablo', 'boris', '2', 'Argentina', '1999-06-05', 'sarmiento 3244', 'San Miguel', 'Buenos Aires', 'pablo002@hotmail.com', '65493217', '1', 'pablo', '1234', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
VALUES ('2', '2222', 'fede', 'maza', '2', 'Argentina', '1998-03-08', 'constituyentes 3562', 'Gral. pacheco', 'Buenos Aires', 'Federico@hotmail.com', '95137534', '1', 'fede', '1234', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`) 
VALUES ('3', '3333', 'Lucas', 'Di laudo', '2', 'Argentina', '1997-08-17', 'Corrientes 230', 'Hurlingham', 'Buenos Aires', 'Lucas@hotmail.com', '85267524', '1', 'lucas', '1234', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
VALUES ('4', '4444', 'Marcos', 'Zone', '2', 'Argentina', '1999-10-13', 'cordoba 657', 'Avellaneda', 'Buenos Aires', 'marcos@hotmail.com', '63257854', '1', 'marcos', '1234', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`) 
VALUES ('5', '5555', 'Profe', 'UTN', '2', 'Argentina', '2002-01-01', 'Av.Hipolito Yrigoyen 288', 'Gral. pacheco', 'Buenos Aires', 'profeUTN@hotmail.com', '12345678', '1', 'profeUTN', '1234', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
VALUES ('123451', '154321', 'Jorge', 'Fernandez', '2', 'Chile', '1995-07-27', 'Tucuman 695', 'caseros', 'Buenos Aires', 'Jorge@hotmail.com', '85693652', '2', 'jorge', '5678', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`) 
VALUES ('123452', '254321', 'Juana', 'Hernandez', '1', 'Peru', '1989-06-23', 'Flauber 132', 'San Martín', 'Santa Fe', 'JuanaHernandez@hotmail.com', '34021336', '2', 'juana', '5678', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
VALUES ('123453', '354321', 'Jose Maria', 'Vargas', '2', 'Argentina', '1980-8-29', 'Risso Patrón 581', 'Laferrere', 'Buenos Aires', 'Vargas@hotmail.com', '46269348', '2', 'vargas', '5678', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
VALUES ('123454', '454321', 'Enriqua', 'Manfrin', '1', 'Argentina', '1972-1-14', 'Urquiza 1585', 'Gualeguaychú', 'Entre Ríos', 'Enriqua@hotmail.com', '96574235', '2', 'erniqua', '5678', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
VALUES ('123455', '554321', 'Naomi', 'fallaci', '1', 'Argentina', '1994-7-18', 'F Amoedo 7123', 'Quilmes', 'Buenos Aires', 'Nao@hotmail.com', '42536356', '2', 'naomi', '5678', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
VALUES ('123456', '654321', 'Diego', 'Caseres', '2', 'Argentina', '1985-1-17', 'A Vignes 1410', 'Haedo', 'Buenos Aires', 'Diego@hotmail.com', '85246397', '2', 'diego', '5678', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
VALUES ('123457', '754321', 'German', 'Pirozi', '2', 'Argentina', '1985-8-21', 'Manuel Belgran 1923', 'La plata', 'Buenos Aires', 'German@hotmail.com', '84673162', '2', 'german', '5678', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
VALUES ('123458', '854321', 'Vicente', 'Pestalozzi', '2', 'Argentina', '1987-4-10', 'Roque Saenz Pe A 298', 'Rafaela', 'Santa Fe', 'vicente@hotmail.com', '96574255', '2', 'vicente', '5678', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
VALUES ('123459', '954321', 'Aricela', 'Malavia', '1', 'Argentina', '1985-4-11', '21 De Caballeria 765', 'Gualeguaychú', 'Entre Ríos', 'aricela@hotmail.com', '96124235', '2', 'aricela', '5678', '1');
INSERT INTO `bdbanco`.`usuarios` (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
VALUES ('1234510', '1054321', 'Facundo', 'Torres', '2', 'Argentina', '1997-11-10', 'Ramos Mejias 16105', 'Villa María', 'Córdoba', 'facu@hotmail.com', '65434235', '2', 'facundo', '5678', '1');
-- --------------------------
-- Registro de cuentas. 
-- --------------------------
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('3652', '35412', '2020-07-13', '10000', '1', '1', '123451');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('8561', '51316', '2020-09-20', '10000', '1', '2', '123451');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('6854', '75177', '2020-11-13', '10000', '1', '2', '123451');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('7412', '15165', '2020-02-20', '10000', '1', '2', '123452');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('8412', '16513', '2020-06-15', '10000', '1', '1', '123453');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('4356', '98465', '2020-05-23', '10000', '1', '1', '123454');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('5254', '21563', '2021-06-24', '10000', '1', '2', '123454');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('4535', '35426', '2020-08-10', '10000', '1', '1', '123455');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('2468', '15169', '2020-03-20', '10000', '1', '2', '123456');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('8998', '15616', '2019-09-12', '10000', '1', '2', '123457');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('7893', '25168', '2021-05-19', '10000', '1', '1', '123457');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('3872', '23153', '2019-06-03', '10000', '1', '2', '123458');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('7823', '57863', '2018-05-09', '10000', '1', '1', '123459');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('7245', '35244', '2020-05-08', '10000', '1', '2', '123459');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('5275', '22665', '2020-06-25', '10000', '1', '1', '1234510');
INSERT INTO `bdbanco`.`cuentas` (`NrodeCuenta`, `CBU`, `FechadeCreacion`, `Saldo`, `Estado`, `tiposdecuentas_IDTipodeCuenta`, `usuarios_DNI`) 
VALUES ('7523', '21354', '2021-02-16', '10000', '1', '2', '1234510');
-- --------------------------
-- Registro de cuentas. 
-- --------------------------
INSERT INTO `bdbanco`.`tiposdemovimientos` (`IDTipodeMovimiento`, `Descripcion`, `Estado`) VALUES ('1', 'Alta de cuenta', '1');
UPDATE `bdbanco`.`tiposdemovimientos` SET `Descripcion` = 'Transferencia' WHERE (`IDTipodeMovimiento` = '4');
INSERT INTO `bdbanco`.`tiposdemovimientos` (`IDTipodeMovimiento`, `Descripcion`, `Estado`) VALUES ('2', 'Alta de prestamo', '1');
INSERT INTO `bdbanco`.`tiposdemovimientos` (`IDTipodeMovimiento`, `Descripcion`, `Estado`) VALUES ('3', 'Pago de prestamo', '1');

INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Enero');
INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Febrero');
INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Marzo');
INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Abril');
INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Mayo');
INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Junio');
INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Julio');
INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Agosto');
INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Septiembre');
INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Octubre');
INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Noviembre');
INSERT INTO `bdbanco`.`meses` (`Descripcion`) VALUES ('Diciembre');


