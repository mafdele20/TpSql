-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: gestionactivitesbancaire
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agence`
--

DROP TABLE IF EXISTS `agence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agence` (
  `idA` int(11) NOT NULL AUTO_INCREMENT,
  `nomA` varchar(30) DEFAULT NULL,
  `idRegion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idA`),
  KEY `idRegion` (`idRegion`),
  CONSTRAINT `agence_ibfk_1` FOREIGN KEY (`idRegion`) REFERENCES `region` (`idR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agence`
--

LOCK TABLES `agence` WRITE;
/*!40000 ALTER TABLE `agence` DISABLE KEYS */;
/*!40000 ALTER TABLE `agence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `idC` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(55) DEFAULT NULL,
  `prenom` varchar(55) DEFAULT NULL,
  `adresse` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `password` varchar(55) DEFAULT NULL,
  `salaire` int(55) DEFAULT NULL,
  `idType` int(11) DEFAULT NULL,
  `idEm` int(11) DEFAULT NULL,
  PRIMARY KEY (`idC`),
  UNIQUE KEY `email` (`email`),
  KEY `idType` (`idType`),
  KEY `idEm` (`idEm`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`idType`) REFERENCES `typeclient` (`idType`),
  CONSTRAINT `client_ibfk_2` FOREIGN KEY (`idEm`) REFERENCES `employeur` (`idEm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compte`
--

DROP TABLE IF EXISTS `compte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compte` (
  `cleRib` varchar(55) DEFAULT NULL,
  `etat` tinyint(1) DEFAULT NULL,
  `fraisO` int(11) DEFAULT NULL,
  `delai` int(11) DEFAULT NULL,
  `agio` int(11) DEFAULT NULL,
  `dateE` date DEFAULT NULL,
  `client` int(11) DEFAULT NULL,
  `idC` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idC`),
  KEY `client` (`client`),
  CONSTRAINT `compte_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`idC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compte`
--

LOCK TABLES `compte` WRITE;
/*!40000 ALTER TABLE `compte` DISABLE KEYS */;
/*!40000 ALTER TABLE `compte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `idE` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) DEFAULT NULL,
  `prenom` varchar(55) DEFAULT NULL,
  `adresse` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `password` varchar(55) DEFAULT NULL,
  `telephone` int(55) DEFAULT NULL,
  `idP` int(11) DEFAULT NULL,
  PRIMARY KEY (`idE`),
  UNIQUE KEY `email` (`email`),
  KEY `idP` (`idP`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`idP`) REFERENCES `profil` (`idP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeagence`
--

DROP TABLE IF EXISTS `employeeagence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeeagence` (
  `idA` int(11) DEFAULT NULL,
  `idE` int(11) DEFAULT NULL,
  `dateD` date DEFAULT NULL,
  `dateF` date DEFAULT NULL,
  KEY `idA` (`idA`),
  KEY `idE` (`idE`),
  CONSTRAINT `employeeagence_ibfk_1` FOREIGN KEY (`idA`) REFERENCES `agence` (`idA`),
  CONSTRAINT `employeeagence_ibfk_2` FOREIGN KEY (`idE`) REFERENCES `employee` (`idE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeagence`
--

LOCK TABLES `employeeagence` WRITE;
/*!40000 ALTER TABLE `employeeagence` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeagence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeur`
--

DROP TABLE IF EXISTS `employeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employeur` (
  `idEm` int(11) NOT NULL AUTO_INCREMENT,
  `nomEm` varchar(55) DEFAULT NULL,
  `prenom` varchar(55) DEFAULT NULL,
  `adresse` varchar(55) DEFAULT NULL,
  `raisonSocial` varchar(55) DEFAULT NULL,
  `numI` int(55) DEFAULT NULL,
  PRIMARY KEY (`idEm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeur`
--

LOCK TABLES `employeur` WRITE;
/*!40000 ALTER TABLE `employeur` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation`
--

DROP TABLE IF EXISTS `operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `montant` int(11) NOT NULL,
  `type` varchar(55) DEFAULT NULL,
  `compte` int(11) DEFAULT NULL,
  `agence` int(11) DEFAULT NULL,
  `employee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agence` (`agence`),
  KEY `employee` (`employee`),
  KEY `compte` (`compte`),
  CONSTRAINT `operation_ibfk_1` FOREIGN KEY (`agence`) REFERENCES `agence` (`idA`),
  CONSTRAINT `operation_ibfk_2` FOREIGN KEY (`employee`) REFERENCES `employee` (`idE`),
  CONSTRAINT `operation_ibfk_3` FOREIGN KEY (`compte`) REFERENCES `compte` (`idC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation`
--

LOCK TABLES `operation` WRITE;
/*!40000 ALTER TABLE `operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profil`
--

DROP TABLE IF EXISTS `profil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profil` (
  `idP` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`idP`),
  UNIQUE KEY `libelle` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profil`
--

LOCK TABLES `profil` WRITE;
/*!40000 ALTER TABLE `profil` DISABLE KEYS */;
/*!40000 ALTER TABLE `profil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `idR` int(11) NOT NULL AUTO_INCREMENT,
  `nomR` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`idR`),
  UNIQUE KEY `nomR` (`nomR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typeclient`
--

DROP TABLE IF EXISTS `typeclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `typeclient` (
  `idType` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typeclient`
--

LOCK TABLES `typeclient` WRITE;
/*!40000 ALTER TABLE `typeclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `typeclient` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-15 23:05:37
