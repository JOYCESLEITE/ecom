-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Identificacao` varchar(45) DEFAULT NULL,
  `Endereco` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Cliente Teste',NULL,NULL),(2,'Cliente Novo',NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_pf`
--

DROP TABLE IF EXISTS `cliente_pf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_pf` (
  `idCliente` int NOT NULL,
  `CPF` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `cliente_pf_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_pf`
--

LOCK TABLES `cliente_pf` WRITE;
/*!40000 ALTER TABLE `cliente_pf` DISABLE KEYS */;
INSERT INTO `cliente_pf` VALUES (2,'98765432100');
/*!40000 ALTER TABLE `cliente_pf` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_cliente_pf` BEFORE INSERT ON `cliente_pf` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM cliente_pj WHERE idCliente = NEW.idCliente) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O cliente j� est� registrado como Pessoa Jur�dica.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `cliente_pj`
--

DROP TABLE IF EXISTS `cliente_pj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_pj` (
  `idCliente` int NOT NULL,
  `CNPJ` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `cliente_pj_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_pj`
--

LOCK TABLES `cliente_pj` WRITE;
/*!40000 ALTER TABLE `cliente_pj` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_pj` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_cliente_pj` BEFORE INSERT ON `cliente_pj` FOR EACH ROW BEGIN
    IF EXISTS (SELECT 1 FROM cliente_pf WHERE idCliente = NEW.idCliente) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Erro: O cliente j� est� registrado como Pessoa F�sica.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientepf`
--

DROP TABLE IF EXISTS `clientepf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientepf` (
  `idClientePF` int NOT NULL,
  `CPF` varchar(45) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idClientePF`,`Cliente_idCliente`),
  UNIQUE KEY `Cliente_idCliente_UNIQUE` (`Cliente_idCliente`),
  KEY `fk_ClientePF_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_ClientePF_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepf`
--

LOCK TABLES `clientepf` WRITE;
/*!40000 ALTER TABLE `clientepf` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientepf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientepj`
--

DROP TABLE IF EXISTS `clientepj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientepj` (
  `idClientePJ` int NOT NULL,
  `CNPJ` varchar(45) NOT NULL,
  `Raz├úo Social` varchar(45) DEFAULT NULL,
  `Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idClientePJ`,`Cliente_idCliente`),
  UNIQUE KEY `Cliente_idCliente_UNIQUE` (`Cliente_idCliente`),
  KEY `fk_ClientePJ_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_ClientePJ_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientepj`
--

LOCK TABLES `clientepj` WRITE;
/*!40000 ALTER TABLE `clientepj` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientepj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disponibilizando um produto`
--

DROP TABLE IF EXISTS `disponibilizando um produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disponibilizando um produto` (
  `Fornecedor_idFornecedor` int NOT NULL,
  `Produtos_idProdutos` int NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`,`Produtos_idProdutos`),
  KEY `fk_Fornecedor_has_Produtos_Produtos1_idx` (`Produtos_idProdutos`),
  KEY `fk_Fornecedor_has_Produtos_Fornecedor_idx` (`Fornecedor_idFornecedor`),
  CONSTRAINT `fk_Fornecedor_has_Produtos_Fornecedor` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`),
  CONSTRAINT `fk_Fornecedor_has_Produtos_Produtos1` FOREIGN KEY (`Produtos_idProdutos`) REFERENCES `produtos` (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disponibilizando um produto`
--

LOCK TABLES `disponibilizando um produto` WRITE;
/*!40000 ALTER TABLE `disponibilizando um produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `disponibilizando um produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `idEntrega` int NOT NULL,
  `Status` varchar(45) NOT NULL,
  `Codigo de rastreio` varchar(45) DEFAULT NULL,
  `Pedidos_idPedidos` int NOT NULL,
  `Pedidos_Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idEntrega`,`Pedidos_idPedidos`,`Pedidos_Cliente_idCliente`),
  KEY `fk_Entrega_Pedidos1_idx` (`Pedidos_idPedidos`,`Pedidos_Cliente_idCliente`),
  CONSTRAINT `fk_Entrega_Pedidos1` FOREIGN KEY (`Pedidos_idPedidos`, `Pedidos_Cliente_idCliente`) REFERENCES `pedidos` (`idPedidos`, `Cliente_idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL,
  `Local` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEstoque`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL,
  `Raz├úo Social` varchar(45) DEFAULT NULL,
  `CNPJ` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`),
  UNIQUE KEY `CNPJ_UNIQUE` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `idPagamento` int NOT NULL,
  `tipo de pagamento` varchar(45) NOT NULL,
  `Pedidos_idPedidos` int NOT NULL,
  `Pedidos_Cliente_idCliente` int NOT NULL,
  PRIMARY KEY (`idPagamento`,`Pedidos_idPedidos`,`Pedidos_Cliente_idCliente`),
  KEY `fk_Pagamento_Pedidos1_idx` (`Pedidos_idPedidos`,`Pedidos_Cliente_idCliente`),
  CONSTRAINT `fk_Pagamento_Pedidos1` FOREIGN KEY (`Pedidos_idPedidos`, `Pedidos_Cliente_idCliente`) REFERENCES `pedidos` (`idPedidos`, `Cliente_idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idPedidos` int NOT NULL,
  `Status do pedido` varchar(45) DEFAULT NULL,
  `Descr├º├úo` varchar(45) DEFAULT NULL,
  `Cliente_idCliente` int NOT NULL,
  `Frete` float DEFAULT NULL,
  PRIMARY KEY (`idPedidos`,`Cliente_idCliente`),
  KEY `fk_Pedidos_Cliente1_idx` (`Cliente_idCliente`),
  CONSTRAINT `fk_Pedidos_Cliente1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `idProdutos` int NOT NULL,
  `Categoria` varchar(45) DEFAULT NULL,
  `Descri├º├úo` varchar(45) DEFAULT NULL,
  `Valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos em estoque`
--

DROP TABLE IF EXISTS `produtos em estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos em estoque` (
  `Produtos_idProdutos` int NOT NULL,
  `Estoque_idEstoque` int NOT NULL,
  `Quantidade` int DEFAULT NULL,
  PRIMARY KEY (`Produtos_idProdutos`,`Estoque_idEstoque`),
  KEY `fk_Produtos_has_Estoque_Estoque1_idx` (`Estoque_idEstoque`),
  KEY `fk_Produtos_has_Estoque_Produtos1_idx` (`Produtos_idProdutos`),
  CONSTRAINT `fk_Produtos_has_Estoque_Estoque1` FOREIGN KEY (`Estoque_idEstoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `fk_Produtos_has_Estoque_Produtos1` FOREIGN KEY (`Produtos_idProdutos`) REFERENCES `produtos` (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos em estoque`
--

LOCK TABLES `produtos em estoque` WRITE;
/*!40000 ALTER TABLE `produtos em estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos em estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos por vendedor (terceiro)`
--

DROP TABLE IF EXISTS `produtos por vendedor (terceiro)`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos por vendedor (terceiro)` (
  `Terceiro/vendedor_idTerceiro/vendedor` int NOT NULL,
  `Produtos_idProdutos` int NOT NULL,
  `Quantidade` int DEFAULT NULL,
  PRIMARY KEY (`Terceiro/vendedor_idTerceiro/vendedor`,`Produtos_idProdutos`),
  KEY `fk_Terceiro/vendedor_has_Produtos_Produtos1_idx` (`Produtos_idProdutos`),
  KEY `fk_Terceiro/vendedor_has_Produtos_Terceiro/vendedor1_idx` (`Terceiro/vendedor_idTerceiro/vendedor`),
  CONSTRAINT `fk_Terceiro/vendedor_has_Produtos_Produtos1` FOREIGN KEY (`Produtos_idProdutos`) REFERENCES `produtos` (`idProdutos`),
  CONSTRAINT `fk_Terceiro/vendedor_has_Produtos_Terceiro/vendedor1` FOREIGN KEY (`Terceiro/vendedor_idTerceiro/vendedor`) REFERENCES `terceiro/vendedor` (`idTerceiro/vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos por vendedor (terceiro)`
--

LOCK TABLES `produtos por vendedor (terceiro)` WRITE;
/*!40000 ALTER TABLE `produtos por vendedor (terceiro)` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos por vendedor (terceiro)` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_has_pedidos`
--

DROP TABLE IF EXISTS `produtos_has_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_has_pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produto` int NOT NULL,
  `id_pedido` int NOT NULL,
  `quantidade` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Produtos_has_Pedidos_Produtos` (`id_produto`),
  CONSTRAINT `fk_Produtos_has_Pedidos_Produtos` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_has_pedidos`
--

LOCK TABLES `produtos_has_pedidos` WRITE;
/*!40000 ALTER TABLE `produtos_has_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `produtos_has_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacao_produtos_pedidos`
--

DROP TABLE IF EXISTS `relacao_produtos_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacao_produtos_pedidos` (
  `Produtos_idProdutos` int NOT NULL,
  `Pedidos_idPedidos` int NOT NULL,
  `Quantidades` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Produtos_idProdutos`,`Pedidos_idPedidos`),
  KEY `idx_Pedidos_idPedidos` (`Pedidos_idPedidos`),
  KEY `idx_Produtos_idProdutos` (`Produtos_idProdutos`),
  CONSTRAINT `fk_RelacaoProdutos_Pedidos` FOREIGN KEY (`Pedidos_idPedidos`) REFERENCES `pedidos` (`idPedidos`),
  CONSTRAINT `fk_RelacaoProdutos_Produtos` FOREIGN KEY (`Produtos_idProdutos`) REFERENCES `produtos` (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacao_produtos_pedidos`
--

LOCK TABLES `relacao_produtos_pedidos` WRITE;
/*!40000 ALTER TABLE `relacao_produtos_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacao_produtos_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacao_produtos_pedidos_clean`
--

DROP TABLE IF EXISTS `relacao_produtos_pedidos_clean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacao_produtos_pedidos_clean` (
  `Produtos_idProdutos` int NOT NULL,
  `Pedidos_idPedidos` int NOT NULL,
  `Quantidades` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Produtos_idProdutos`,`Pedidos_idPedidos`),
  KEY `fk_Produtos_has_Pedidos_Pedidos1_idx` (`Pedidos_idPedidos`),
  KEY `fk_Produtos_has_Pedidos_Produtos1_idx` (`Produtos_idProdutos`),
  CONSTRAINT `fk_Produtos_has_Pedidos_Pedidos1` FOREIGN KEY (`Pedidos_idPedidos`) REFERENCES `pedidos` (`idPedidos`),
  CONSTRAINT `fk_Produtos_has_Pedidos_Produtos1` FOREIGN KEY (`Produtos_idProdutos`) REFERENCES `produtos` (`idProdutos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacao_produtos_pedidos_clean`
--

LOCK TABLES `relacao_produtos_pedidos_clean` WRITE;
/*!40000 ALTER TABLE `relacao_produtos_pedidos_clean` DISABLE KEYS */;
/*!40000 ALTER TABLE `relacao_produtos_pedidos_clean` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terceiro/vendedor`
--

DROP TABLE IF EXISTS `terceiro/vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terceiro/vendedor` (
  `idTerceiro/vendedor` int NOT NULL,
  `Raz├úo Social` varchar(45) DEFAULT NULL,
  `Local` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTerceiro/vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terceiro/vendedor`
--

LOCK TABLES `terceiro/vendedor` WRITE;
/*!40000 ALTER TABLE `terceiro/vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `terceiro/vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terceiro_vendedor`
--

DROP TABLE IF EXISTS `terceiro_vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `terceiro_vendedor` (
  `idTerceiro/vendedor` int NOT NULL,
  `Raz├úo Social` varchar(45) DEFAULT NULL,
  `Local` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTerceiro/vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terceiro_vendedor`
--

LOCK TABLES `terceiro_vendedor` WRITE;
/*!40000 ALTER TABLE `terceiro_vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `terceiro_vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-18  0:32:01
