create database bdbanco;
use bdbanco;

CREATE TABLE `tiposdecuentas` (
  `IDTipodeCuenta` int NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`IDTipodeCuenta`)
); 

CREATE TABLE `tiposdemovimientos` (
  `IDTipodeMovimiento` int NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`IDTipodeMovimiento`)
); 

CREATE TABLE `usuarios` (
  `DNI` int NOT NULL,
  `Cuil` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Sexo` int NULL,
  `Nacionalidad` varchar(50) NULL,
  `FechadeNacimiento` datetime NULL,
  `Direccion` varchar(50) NULL,
  `Localidad` varchar(50) NULL,
  `Provincia` varchar(50) NULL,
  `CorreoElectronico` varchar(50) NULL,
  `Telefono` int NULL,
  `TipodeUsuario` int NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Contrasena` varchar(20) NOT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`DNI`)
); 

CREATE TABLE `cuentas` (
  `NrodeCuenta` int NOT NULL,
  `CBU` int NOT NULL,
  `DNI` int DEFAULT NULL,
  `TipodeCuenta` int DEFAULT NULL,
  `FechadeCreacion` datetime DEFAULT NULL,
  `Saldo` double DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  PRIMARY KEY (`CBU`,`NrodeCuenta`)
); 

-- inserts --
INSERT INTO tiposdecuentas (`IDTipodeCuenta` ,`Descripcion`, `Estado`)
 VALUES ('1', 'Caja de ahorro', '1'),
		('2', 'Cuenta corriente', '1');
			
INSERT INTO tiposdemovimientos (`IDTipodeMovimiento` ,`Descripcion`, `Estado`)
 VALUES ('1', 'Alta de cuenta', '1'),
		('2', 'Alta de un prestamo', '1'),
		('3', 'Pago de prestamo', '1'),
		('4', 'Transferencia', '1');
    
INSERT INTO usuarios (`DNI`, `Cuil`, `Nombre`, `Apellido`, `Sexo`, `Nacionalidad`, `FechadeNacimiento`, `Direccion`, `Localidad`, `Provincia`, `CorreoElectronico`, `Telefono`, `TipodeUsuario`, `Usuario`, `Contrasena`, `Estado`)
 VALUES ('1111', '1001', 'Carlos', 'Perez', '1', 'Argentino', '1980-06-21', 'Av. Libertador 100', 'San Fernando', 'Buenos Aires', 'carlosperez@hotmail.com', '1510101010', '1', 'carlos', 'perez', '1'), -- admin --
        ('2222', '1002', 'Silvia', 'Gomez', '2', 'Argentino', '1980-05-20', 'Av. Larralde 1000', 'Tigre', 'Buenos Aires', 'silviagomez@hotmail.com', '1520202020', '2', 'silvia', 'gomez', '1'), -- cliente --
        ('3333', '1003', 'Raul', 'Fernandez', '1', 'Argentino', '1990-01-26', 'Av. Sobremonte 510', 'San Fernando', 'Buenos Aires', 'raulfernandez@hotmail.com', '1530303030', '2', 'raul', 'fernandez', '1'); -- cliente --
  
INSERT INTO cuentas (`NrodeCuenta`, `CBU`, `DNI`, `TipodeCuenta`, `FechadeCreacion`, `Saldo`, `Estado`) VALUES ('1', '1111', '1111', '1', '2021-06-21', '10000', '1');
INSERT INTO cuentas (`NrodeCuenta`, `CBU`, `DNI`, `TipodeCuenta`, `FechadeCreacion`, `Saldo`, `Estado`) VALUES ('2', '2222', '2222', '2', '2021-06-03', '10000', '1');
INSERT INTO cuentas (`NrodeCuenta`, `CBU`, `DNI`, `TipodeCuenta`, `FechadeCreacion`, `Saldo`, `Estado`) VALUES ('3', '3333', '3333', '2', '2021-06-01', '10000', '1');
