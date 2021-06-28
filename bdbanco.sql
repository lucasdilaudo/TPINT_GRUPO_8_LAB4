create database bdbanco;
use bdbanco;


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

INSERT INTO cuentas (`NrodeCuenta`, `CBU`, `DNI`, `TipodeCuenta`, `FechadeCreacion`, `Saldo`, `Estado`) VALUES ('1', '1111', '1111', '1', '2021-06-21', '10000', '1');
INSERT INTO cuentas (`NrodeCuenta`, `CBU`, `DNI`, `TipodeCuenta`, `FechadeCreacion`, `Saldo`, `Estado`) VALUES ('2', '2222', '2222', '2', '2021-06-03', '10000', '1');
INSERT INTO cuentas (`NrodeCuenta`, `CBU`, `DNI`, `TipodeCuenta`, `FechadeCreacion`, `Saldo`, `Estado`) VALUES ('3', '3333', '3333', '2', '2021-06-01', '10000', '1');
