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
