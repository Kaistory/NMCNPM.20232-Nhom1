-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: chung_cu_bluemoon
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `cac_khoan_nop`
--

DROP TABLE IF EXISTS `cac_khoan_nop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cac_khoan_nop` (
  `MA_KT` int NOT NULL,
  `MA_HO` int DEFAULT NULL,
  `TRANG_THAI` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `SO_LUONG` int DEFAULT NULL,
  PRIMARY KEY (`MA_KT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cac_khoan_nop`
--

LOCK TABLES `cac_khoan_nop` WRITE;
/*!40000 ALTER TABLE `cac_khoan_nop` DISABLE KEYS */;
/*!40000 ALTER TABLE `cac_khoan_nop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chu_ho`
--

DROP TABLE IF EXISTS `chu_ho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chu_ho` (
  `ID_CH` int NOT NULL,
  `MA_HO` int NOT NULL,
  `SO_TV` int DEFAULT NULL,
  PRIMARY KEY (`MA_HO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chu_ho`
--

LOCK TABLES `chu_ho` WRITE;
/*!40000 ALTER TABLE `chu_ho` DISABLE KEYS */;
INSERT INTO `chu_ho` VALUES (2,2,NULL),(25,4,NULL);
/*!40000 ALTER TABLE `chu_ho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cong_ty_cc`
--

DROP TABLE IF EXISTS `cong_ty_cc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cong_ty_cc` (
  `MA_KT` int NOT NULL,
  `MA_HO` int NOT NULL,
  `TEN_KT` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `SO_TIEN` int NOT NULL,
  `THOI_GIAN` date NOT NULL,
  PRIMARY KEY (`MA_KT`,`MA_HO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cong_ty_cc`
--

LOCK TABLES `cong_ty_cc` WRITE;
/*!40000 ALTER TABLE `cong_ty_cc` DISABLE KEYS */;
/*!40000 ALTER TABLE `cong_ty_cc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ho_gd`
--

DROP TABLE IF EXISTS `ho_gd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ho_gd` (
  `MA_HO` int NOT NULL,
  `PHONG` int NOT NULL,
  `DIEN_TICH` int NOT NULL,
  `CHAT_LUONG` int DEFAULT NULL,
  PRIMARY KEY (`MA_HO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ho_gd`
--

LOCK TABLES `ho_gd` WRITE;
/*!40000 ALTER TABLE `ho_gd` DISABLE KEYS */;
INSERT INTO `ho_gd` VALUES (1,101,120,NULL);
/*!40000 ALTER TABLE `ho_gd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoan_thu`
--

DROP TABLE IF EXISTS `khoan_thu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoan_thu` (
  `MA_KT` int NOT NULL,
  `LOAI_KT` int NOT NULL,
  `TEN_KT` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `SO_TIEN` int NOT NULL,
  `DON_VI` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`MA_KT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoan_thu`
--

LOCK TABLES `khoan_thu` WRITE;
/*!40000 ALTER TABLE `khoan_thu` DISABLE KEYS */;
/*!40000 ALTER TABLE `khoan_thu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_khau`
--

DROP TABLE IF EXISTS `nhan_khau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhan_khau` (
  `ID` int NOT NULL,
  `CCCD` int NOT NULL,
  `TEN` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `SDT` int DEFAULT NULL,
  `EMAIL` varchar(60) COLLATE utf8mb3_bin DEFAULT NULL,
  `NGAY_SINH` date NOT NULL,
  `DIA_CHI` varchar(120) COLLATE utf8mb3_bin DEFAULT NULL,
  `TRANG_THAI` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `GIOI_TINH` int DEFAULT NULL,
  `QUOC_TICH` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `MQH` int DEFAULT NULL,
  `ID_CHU_HO` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_khau`
--

LOCK TABLES `nhan_khau` WRITE;
/*!40000 ALTER TABLE `nhan_khau` DISABLE KEYS */;
INSERT INTO `nhan_khau` VALUES (1,251,'duong khai',375,'k4224','2014-02-02','fda','dinh cu',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `nhan_khau` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pt_gui`
--

DROP TABLE IF EXISTS `pt_gui`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pt_gui` (
  `SO_LUONG` int NOT NULL,
  `LOAI` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `MA_HO` int NOT NULL,
  PRIMARY KEY (`MA_HO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pt_gui`
--

LOCK TABLES `pt_gui` WRITE;
/*!40000 ALTER TABLE `pt_gui` DISABLE KEYS */;
/*!40000 ALTER TABLE `pt_gui` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thu_tien`
--

DROP TABLE IF EXISTS `thu_tien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thu_tien` (
  `MA_HO` int NOT NULL,
  `SO_TIEN` int NOT NULL,
  `THOI_GIAN` date NOT NULL,
  PRIMARY KEY (`MA_HO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thu_tien`
--

LOCK TABLES `thu_tien` WRITE;
/*!40000 ALTER TABLE `thu_tien` DISABLE KEYS */;
/*!40000 ALTER TABLE `thu_tien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-02  0:14:17
