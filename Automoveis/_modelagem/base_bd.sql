-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.25-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              9.4.0.5186
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela automoveis.Clientes
DROP TABLE IF EXISTS `Clientes`;
CREATE TABLE IF NOT EXISTS `Clientes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `cpf` char(11) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `uf` char(2) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `complemento` varchar(200) DEFAULT NULL,
  `cep` char(8) NOT NULL,
  `tel` char(10) DEFAULT NULL,
  `cel` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela automoveis.Clientes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;

-- Copiando estrutura para tabela automoveis.Formas de Pagamento
DROP TABLE IF EXISTS `Formas de Pagamento`;
CREATE TABLE IF NOT EXISTS `Formas de Pagamento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela automoveis.Formas de Pagamento: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Formas de Pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `Formas de Pagamento` ENABLE KEYS */;

-- Copiando estrutura para tabela automoveis.Modelos
DROP TABLE IF EXISTS `Modelos`;
CREATE TABLE IF NOT EXISTS `Modelos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) NOT NULL,
  `eCarro` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela automoveis.Modelos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Modelos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Modelos` ENABLE KEYS */;

-- Copiando estrutura para tabela automoveis.Transacoes
DROP TABLE IF EXISTS `Transacoes`;
CREATE TABLE IF NOT EXISTS `Transacoes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vendedor` int(10) unsigned NOT NULL,
  `comprador` int(10) unsigned NOT NULL,
  `valor` decimal(8,2) unsigned NOT NULL,
  `formaPagto` int(10) unsigned DEFAULT NULL,
  `qtdeParcelas` tinyint(2) unsigned DEFAULT NULL,
  `valorParcela` decimal(8,2) unsigned DEFAULT NULL,
  `sinal` decimal(8,2) unsigned DEFAULT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_Transacoes_Clientes_Vendedor` (`vendedor`),
  KEY `FK_Transacoes_Clientes_Comprador` (`comprador`),
  KEY `FK_Transacoes_Formas de Pagamento` (`formaPagto`),
  CONSTRAINT `FK_Transacoes_Clientes_Comprador` FOREIGN KEY (`comprador`) REFERENCES `Clientes` (`id`),
  CONSTRAINT `FK_Transacoes_Clientes_Vendedor` FOREIGN KEY (`vendedor`) REFERENCES `Clientes` (`id`),
  CONSTRAINT `FK_Transacoes_Formas de Pagamento` FOREIGN KEY (`formaPagto`) REFERENCES `Formas de Pagamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela automoveis.Transacoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Transacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Transacoes` ENABLE KEYS */;

-- Copiando estrutura para tabela automoveis.Veiculos
DROP TABLE IF EXISTS `Veiculos`;
CREATE TABLE IF NOT EXISTS `Veiculos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `modelo` int(10) unsigned NOT NULL,
  `placa` char(8) NOT NULL,
  `chassi` char(17) DEFAULT NULL,
  `renavam` char(11) DEFAULT NULL,
  `cor` char(70) DEFAULT NULL,
  `combustivel` char(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `placa` (`placa`),
  UNIQUE KEY `chassi` (`chassi`),
  UNIQUE KEY `renavam` (`renavam`),
  KEY `FK_Veiculos_Modelos` (`modelo`),
  CONSTRAINT `FK_Veiculos_Modelos` FOREIGN KEY (`modelo`) REFERENCES `Modelos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela automoveis.Veiculos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `Veiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Veiculos` ENABLE KEYS */;

-- Copiando estrutura para tabela automoveis.VeiculosDasTransacoes
DROP TABLE IF EXISTS `VeiculosDasTransacoes`;
CREATE TABLE IF NOT EXISTS `VeiculosDasTransacoes` (
  `veiculo` int(10) unsigned NOT NULL,
  `transacao` int(10) unsigned NOT NULL,
  KEY `FK_VeiculosDasTransacoes_Veiculos` (`veiculo`),
  KEY `FK_VeiculosDasTransacoes_Transacoes` (`transacao`),
  CONSTRAINT `FK_VeiculosDasTransacoes_Transacoes` FOREIGN KEY (`transacao`) REFERENCES `Transacoes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_VeiculosDasTransacoes_Veiculos` FOREIGN KEY (`veiculo`) REFERENCES `Veiculos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela automoveis.VeiculosDasTransacoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `VeiculosDasTransacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `VeiculosDasTransacoes` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
