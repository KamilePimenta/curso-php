/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

DROP TABLE IF EXISTS `Clients`;
CREATE TABLE IF NOT EXISTS `Clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `street` varchar(100) NOT NULL,
  `num` varchar(10) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` char(2) NOT NULL,
  `neighborhood` varchar(100) NOT NULL,
  `reference` varchar(200) DEFAULT NULL,
  `cep` char(8) NOT NULL,
  `phone` char(10) DEFAULT NULL,
  `cel` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `Clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `Clients` ENABLE KEYS */;

DROP TABLE IF EXISTS `Models`;
CREATE TABLE IF NOT EXISTS `Models` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `isCar` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `Models` DISABLE KEYS */;
REPLACE INTO `Models` (`id`, `name`, `isCar`) VALUES
	(1, 'Corsa', 1),
	(2, 'Titan 150', 0),
	(3, 'Chevette', 1);
/*!40000 ALTER TABLE `Models` ENABLE KEYS */;

DROP TABLE IF EXISTS `PayTypes`;
CREATE TABLE IF NOT EXISTS `PayTypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `PayTypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `PayTypes` ENABLE KEYS */;

DROP TABLE IF EXISTS `Transactions`;
CREATE TABLE IF NOT EXISTS `Transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `seller` int(10) unsigned NOT NULL,
  `buyer` int(10) unsigned NOT NULL,
  `value` decimal(8,2) unsigned NOT NULL,
  `payType` int(10) unsigned DEFAULT NULL,
  `installments` tinyint(2) unsigned DEFAULT NULL,
  `installmentValue` decimal(8,2) unsigned DEFAULT NULL,
  `deposit` decimal(8,2) unsigned DEFAULT NULL COMMENT 'Sinal',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Transacoes_Clientes_Comprador` (`buyer`),
  KEY `FK_Transacoes_Clientes_Vendedor` (`seller`),
  KEY `FK_Transacoes_Formas de Pagamento` (`payType`),
  CONSTRAINT `FK_Transacoes_Clientes_Comprador` FOREIGN KEY (`buyer`) REFERENCES `Clients` (`id`),
  CONSTRAINT `FK_Transacoes_Clientes_Vendedor` FOREIGN KEY (`seller`) REFERENCES `Clients` (`id`),
  CONSTRAINT `FK_Transacoes_Formas de Pagamento` FOREIGN KEY (`payType`) REFERENCES `PayTypes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;

DROP TABLE IF EXISTS `TransactionsVehicles`;
CREATE TABLE IF NOT EXISTS `TransactionsVehicles` (
  `vehicle` int(10) unsigned NOT NULL,
  `transaction` int(10) unsigned NOT NULL,
  KEY `FK_VeiculosDasTransacoes_Transacoes` (`transaction`),
  KEY `FK_VeiculosDasTransacoes_Veiculos` (`vehicle`),
  CONSTRAINT `FK_VeiculosDasTransacoes_Transacoes` FOREIGN KEY (`transaction`) REFERENCES `Transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_VeiculosDasTransacoes_Veiculos` FOREIGN KEY (`vehicle`) REFERENCES `Vehicles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `TransactionsVehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `TransactionsVehicles` ENABLE KEYS */;

DROP TABLE IF EXISTS `Vehicles`;
CREATE TABLE IF NOT EXISTS `Vehicles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `model` int(10) unsigned NOT NULL,
  `plate` char(8) NOT NULL,
  `chassis` char(17) DEFAULT NULL,
  `renavam` char(11) DEFAULT NULL,
  `color` char(70) DEFAULT NULL,
  `fuel` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `placa` (`plate`),
  UNIQUE KEY `chassi` (`chassis`),
  UNIQUE KEY `renavam` (`renavam`),
  KEY `FK_Veiculos_Modelos` (`model`),
  CONSTRAINT `FK_Veiculos_Modelos` FOREIGN KEY (`model`) REFERENCES `Models` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*!40000 ALTER TABLE `Vehicles` DISABLE KEYS */;
REPLACE INTO `Vehicles` (`id`, `model`, `plate`, `chassis`, `renavam`, `color`, `fuel`) VALUES
	(1, 1, 'DPG-5031', '9BWZZZ377VT004251', '09377842056', 'Prata', 'Gasolina'),
	(2, 1, 'HGT-9058', '9MHGZT377VT004251', '09377842556', 'Brisa da Noite', 'Gas'),
	(3, 2, 'HJO-1585', '9BWZZZ377VT008251', '09577842056', 'Preto', 'Flex'),
	(4, 3, 'BUC-6327', '9BHDJZ377VT004251', '09305152156', 'Verde', 'Alcool');
/*!40000 ALTER TABLE `Vehicles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
