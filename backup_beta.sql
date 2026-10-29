/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: nyxot
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_ban_history`
--

DROP TABLE IF EXISTS `account_ban_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_ban_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expired_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `banned_by` (`banned_by`),
  CONSTRAINT `account_ban_history_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_ban_history_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_ban_history`
--

LOCK TABLES `account_ban_history` WRITE;
/*!40000 ALTER TABLE `account_ban_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_ban_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_bans`
--

DROP TABLE IF EXISTS `account_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_bans` (
  `account_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `banned_by` (`banned_by`),
  CONSTRAINT `account_bans_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_bans_ibfk_2` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_bans`
--

LOCK TABLES `account_bans` WRITE;
/*!40000 ALTER TABLE `account_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_storage`
--

DROP TABLE IF EXISTS `account_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_storage` (
  `account_id` int(11) NOT NULL,
  `key` int(10) unsigned NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`account_id`,`key`),
  CONSTRAINT `account_storage_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_storage`
--

LOCK TABLES `account_storage` WRITE;
/*!40000 ALTER TABLE `account_storage` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_viplist`
--

DROP TABLE IF EXISTS `account_viplist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_viplist` (
  `account_id` int(11) NOT NULL COMMENT 'id of account whose viplist entry it is',
  `player_id` int(11) NOT NULL COMMENT 'id of target player of viplist entry',
  `description` varchar(128) NOT NULL DEFAULT '',
  UNIQUE KEY `account_player_index` (`account_id`,`player_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `account_viplist_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `account_viplist_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_viplist`
--

LOCK TABLES `account_viplist` WRITE;
/*!40000 ALTER TABLE `account_viplist` DISABLE KEYS */;
INSERT INTO `account_viplist` VALUES
(4,1,''),
(4,27,''),
(4,31,''),
(4,32,''),
(4,61,''),
(4,68,''),
(4,114,''),
(4,155,''),
(4,175,''),
(4,189,''),
(4,191,''),
(14,31,''),
(14,32,''),
(14,56,''),
(14,64,''),
(14,67,''),
(14,100,''),
(14,114,''),
(14,156,''),
(14,176,''),
(19,27,''),
(32,31,''),
(32,32,''),
(33,31,''),
(39,83,''),
(39,84,''),
(42,120,''),
(45,76,''),
(45,122,''),
(47,56,''),
(47,67,''),
(47,85,''),
(48,56,''),
(51,77,''),
(79,148,''),
(79,150,''),
(79,151,''),
(84,76,''),
(101,64,''),
(101,114,''),
(102,114,''),
(102,179,''),
(120,64,''),
(122,64,''),
(122,191,''),
(123,114,''),
(123,151,''),
(123,192,''),
(133,151,''),
(136,151,''),
(136,179,'');
/*!40000 ALTER TABLE `account_viplist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `password` char(40) NOT NULL,
  `secret` char(16) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `premium_ends_at` int(10) unsigned NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(64) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT 0,
  `rlname` varchar(255) NOT NULL DEFAULT '',
  `location` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(3) NOT NULL DEFAULT '',
  `web_lastlogin` int(11) NOT NULL DEFAULT 0,
  `web_flags` int(11) NOT NULL DEFAULT 0,
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `email_new` varchar(255) NOT NULL DEFAULT '',
  `email_new_time` int(11) NOT NULL DEFAULT 0,
  `email_code` varchar(255) NOT NULL DEFAULT '',
  `email_next` int(11) NOT NULL DEFAULT 0,
  `premium_points` int(11) NOT NULL DEFAULT 0,
  `creation` int(11) NOT NULL DEFAULT 0,
  `tibia_coins` int(10) unsigned NOT NULL DEFAULT 0,
  `vote` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES
(1,'1','ada1e86d253ff9dc7f1e132428b898fd5a775e46',NULL,1,0,'','',0,'','','',1778538255,0,0,'',0,'',0,0,0,0,0),
(4,'mateus123','e9cc1f43bca29c367980893fbb187460b8e36f2d',NULL,6,0,'baiakpesado0909@gmail.com','',1776530937,'','','us',1779498903,3,1,'',0,'',0,0,0,0,0),
(14,'redlogut','75004f149038473757da0be07ef76dd4a9bdbc8d',NULL,1,0,'mateusbandeira@gmail.com','',1778597668,'','','br',1779018638,0,0,'',0,'',0,10,0,0,0),
(15,'logut','356a192b7913b04c54574d18c28d46e6395428ab',NULL,6,0,'matband@gmail.com','',1778597972,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(16,'Isaac123','66cbf3993ec706ac1701a83cf1638246ad176a5b',NULL,1,0,'motaisaac331@gmail.com','',1778605955,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(17,'isaac1Pl','12a6a59f8bd51f40e7d1ac305a5c9641bc244a88',NULL,1,0,'pablugraeb@gmail.com','',1778606011,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(18,'kraken','da4456e491667416ab01c1a805cca3af7c90868d',NULL,1,0,'carlosmataga@hotmail.com','',1778609856,'','','mx',1778971081,0,0,'',0,'',0,0,0,0,0),
(19,'hedrickmyth','08b4f19f06a1791bf7d281b82d4e8816785fa3a5',NULL,1,0,'hmyth11@gmail.com','',1778631634,'','','br',1778631653,0,0,'',0,'',0,0,0,0,0),
(20,'hackeado','2c958b0592af8499081f34d355af97a3ab49cb61',NULL,1,0,'Hackeadoddvinte@gmail.com','',1778644721,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(21,'lootloko','b45738f818532b5697934c2fb382ad6cb50d0932',NULL,1,0,'loot123@gmail.com','',1778671413,'','','br',1778671421,0,0,'',0,'',0,0,0,0,0),
(22,'darkis','e876cb18afd31929a5879028eb3191ec4e023ffb',NULL,1,0,'jojo@gmail.com','',1778693863,'','','mx',1778693885,0,0,'',0,'',0,0,0,0,0),
(23,'Natan123','e0190e3edce7371c7fcf7fc2fa52a31a15361627',NULL,1,0,'natan.oliveira13@aluno.ce.gov.br','',1778707924,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(24,'Kilo2025','51ce87d36151c66093e74a6f8572cb9c0f815fe9',NULL,1,0,'gadieljacobo76@gmail.com','',1778720890,'','','us',1778806775,0,0,'',0,'',0,0,0,0,0),
(25,'Miguelsz123','356a192b7913b04c54574d18c28d46e6395428ab',NULL,1,0,'miguelferreira@gmail.com','',1778783519,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(26,'pesadoone','5809e950b9aa7f4e65daa17c0f36f58f916cb1f0',NULL,1,0,'pesado1@gmail.com','',1778811956,'','','ve',0,0,0,'',0,'',0,0,0,0,0),
(27,'38875752J','38cf50b16047db35e872bd3e3bc6b69db30cb71d',NULL,1,0,'jofelipe406@gmail.com','',1778858921,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(28,'789456a','21ee97eed1cdd815bfab837489b67f176df4a3a5',NULL,1,0,'asda2sd@hotmail.com','',1778870606,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(29,'jhond1','127b2d1ae4da8248c012270aafc6e3bc1f4d5e5a',NULL,1,0,'contajogoshofman1@gmail.com','',1778892867,'','','br',1778892878,0,0,'',0,'',0,0,0,0,0),
(30,'jonata','4e18771bdb302964a974b3ec0cd6aa8d85df9af9',NULL,1,0,'jotao@gmail.com','',1778937752,'','','pl',1778937764,0,0,'',0,'',0,0,0,0,0),
(31,'6435903','355fe3ed55736ab623175da9c7e6e894146fc9b0',NULL,1,0,'riquedrew@gmail.com','',1778938177,'','','br',1778938183,0,0,'',0,'',0,0,0,0,0),
(32,'teussz123','356a192b7913b04c54574d18c28d46e6395428ab',NULL,1,0,'teusz123@gmail.com','',1778938247,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(33,'teussz1234','356a192b7913b04c54574d18c28d46e6395428ab',NULL,1,0,'teussz1234@gmail.com','',1778938381,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(34,'teussz12345','356a192b7913b04c54574d18c28d46e6395428ab',NULL,1,0,'teussz12345@gmail.com','',1778938759,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(35,'bruna','c8d41d27cbfaa3b257b72e711436ce0ead4527c1',NULL,1,0,'sakskaak@gmail.com','',1778940877,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(36,'7788934','a84d02007d01b0554a4de2973bb3abf000fed89c',NULL,1,0,'carlosmataga90@hotmail.com','',1778941163,'','','mx',1778945270,0,0,'',0,'',0,0,0,0,0),
(37,'johnrei','6ef1c6dac539ae05df0804ae34dceafb16b3a99c',NULL,1,0,'gustavo.izabel@hotmail.com','',1778942450,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(38,'571132','a84d02007d01b0554a4de2973bb3abf000fed89c',NULL,1,0,'carlosmataga@gmail.com','',1778943741,'','','mx',1778960585,0,0,'',0,'',0,0,0,0,0),
(39,'bodzio123','c9906c066e9da59bcffd749faf7061dae1605a10',NULL,1,0,'benytofjka@gmail.com','',1778944115,'','','pl',1778985444,0,0,'',0,'',0,0,0,0,0),
(40,'201192','744bb0e9168683234284fc8d72600ac50fe76740',NULL,1,0,'alexpaulonascimento490@gmail.com','',1778944620,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(41,'bodzio1234','c9906c066e9da59bcffd749faf7061dae1605a10',NULL,1,0,'ewcreretvvr@o2.pl','',1778946053,'','','pl',1779000864,0,0,'',0,'',0,0,0,0,0),
(42,'Zaikop001','a46db9135f87170b0eb0882165a8c78b008dc056',NULL,1,0,'henriquefired@gmail.com','',1778946625,'','','br',1779203924,0,0,'',0,'',0,0,0,0,0),
(43,'kraken90','a84d02007d01b0554a4de2973bb3abf000fed89c',NULL,1,0,'carlosmataga1@hotmail.com','',1778947199,'','','mx',1778960594,0,0,'',0,'',0,0,0,0,0),
(44,'Dannitxd','1bf2e250a409ecd223ebea9ade68e2a46b61ad75',NULL,1,0,'doidinda01@gmail.com','',1778950723,'','','pl',1778951084,0,0,'',0,'',0,0,0,0,0),
(45,'8078203','2d7c243b47e0d68c009fcc776f11864eadf80eb7',NULL,1,0,'pokemon@gmail.com','',1778951243,'','','mx',1779232695,0,0,'',0,'',0,0,0,0,0),
(46,'351999','2d7c243b47e0d68c009fcc776f11864eadf80eb7',NULL,1,0,'pokemon99@gmail.com','',1778951998,'','','mx',0,0,0,'',0,'',0,0,0,0,0),
(47,'adriloko2','fc50cea7e4421eebe21bb1dd8d8bbd2f6510a533',NULL,1,0,'adrianonaoesquece@gmail.com','',1778952242,'','','br',1779018778,0,0,'',0,'',0,0,0,0,0),
(48,'552310','ee752af569fce5bd5c453a82f9da0697aa15e929',NULL,1,0,'hasdio@hg.com','',1778952861,'','','jm',0,0,0,'',0,'',0,0,0,0,0),
(49,'121309','21ee97eed1cdd815bfab837489b67f176df4a3a5',NULL,1,0,'miki122@wp.pl','',1778963970,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(50,'costinhavr','617b67fcef58e98523e3ea0d49a31ab6976aa42a',NULL,1,0,'grt@hotmail.com','',1778965704,'','','br',1778966080,0,0,'',0,'',0,0,0,0,0),
(51,'julianoat','6fea8dd677a4380f1a0b2912be66e3ad5e87f1cb',NULL,1,0,'julianoat321@gmail.com','',1778970468,'','','br',1779009509,0,0,'',0,'',0,0,0,0,0),
(52,'juliano','0eebdeb591ff8f5c7318be6bc2186a49ff016408',NULL,1,0,'asasa@gmail.com','',1778970749,'','','br',1779009556,0,0,'',0,'',0,0,0,0,0),
(53,'juju','0eebdeb591ff8f5c7318be6bc2186a49ff016408',NULL,1,0,'julasapo@gmail.com','',1778970800,'','','br',1779009580,0,0,'',0,'',0,0,0,0,0),
(54,'66771999','4530a54f2ad54a40e8027bf69f5279b121f4696c',NULL,1,0,'nabiagabriel236@gmail.com','',1778977925,'','','af',0,0,0,'',0,'',0,0,0,0,0),
(55,'Vitorkk','23b9e0d92eb7d6e1b70d05ec58f48220b8d65288',NULL,1,0,'engevitor2023@gmail.com','',1778979230,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(56,'pesado0202','bd9cb8c4d26a02276e2712bf51864288fe9e93ff',NULL,1,0,'xd@hotmail.com','',1778981693,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(57,'5979943','602aab4088edc02c9c8eb4f86fa5e6bee5a1ac33',NULL,1,0,'jean.votu@outlook.com','',1778983337,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(58,'123l','873efba1e54beef847eef9dc551888b64a0c50e1',NULL,1,0,'lukaslopes5742@gmail.com','',1778983697,'','','br',1778984731,0,0,'',0,'',0,0,0,0,0),
(59,'bufalo','774bc5028e3a7c29e37fe81f6ad40a3645ed681e',NULL,1,0,'wandersonevan7@icloud.com','',1778985377,'','','us',0,0,0,'',0,'',0,0,0,0,0),
(60,'bufalo1','774bc5028e3a7c29e37fe81f6ad40a3645ed681e',NULL,1,0,'wandersonevan7@gmail.com','',1778985424,'','','us',1778985431,0,0,'',0,'',0,0,0,0,0),
(61,'jotinha01','79e6bbbbeb40c538e88ffdcbd4a527646e92c06d',NULL,1,0,'joao.coutinho02@outlook.com','',1778987838,'','','br',1778987914,0,0,'',0,'',0,0,0,0,0),
(62,'Boldz12','1436d131eccfe63005cc35fed8ccb4df4c75d02e',NULL,1,0,'oldboldzin@gmail.com','',1778989944,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(63,'789123a','d55e7694bdbb6b0d107821e0fe93988bf01abe23',NULL,1,0,'asda12sd@hotmail.com','',1778989954,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(64,'greyerson','cfd6303315bd624e81043d4d4f49f467f9711b4a',NULL,1,0,'betancourtgreyer@gmail.com','',1778998111,'','','ve',1778998122,0,0,'',0,'',0,0,0,0,0),
(65,'pesado2020','2b6d239943971e724ef8bb0810b5eaceda74f62f',NULL,1,0,'isacpedro455@gmail.com','',1779011566,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(66,'2270991','e38ad214943daad1d64c102faec29de4afe9da3d',NULL,1,0,'1@gmail.com','',1779023531,'','','pl',1779023536,0,0,'',0,'',0,0,0,0,0),
(67,'kinalokao','51984d592f40144d145a4b8020cdcb52784f8f8b',NULL,1,0,'daviguilhermepro@gmail.com','',1779024200,'','','br',1779024205,0,0,'',0,'',0,0,0,0,0),
(68,'5018414','30d229d8b6ceb076c1f0483ca305bec0478157f6',NULL,1,0,'pietrohenrique018@gmail.com','',1779026833,'','','pl',1779026845,0,0,'',0,'',0,0,0,0,0),
(69,'emerson','b06553ef70bcb89b353c8bcda13b23b5d9526edf',NULL,1,0,'ecarloscavalcante@hotmail.com','',1779029985,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(70,'qweqwe','5186ced2831f1e6627b8d6dd39a7f585d2dbbbfc',NULL,1,0,'renatin_msn_ata@hotmail.com','',1779031179,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(71,'chicho','9818a2b820012968327de3cf4a6408f61d7f1462',NULL,1,0,'wuachumirufa521@gmail.com','',1779035912,'','','br',1779035927,0,0,'',0,'',0,0,0,0,0),
(72,'amalakis12','c99477d477b7de3e66d1ed4f9a3943db9908cdd7',NULL,1,0,'jweoifj@gmail.com','',1779036154,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(73,'brazilmu','c8f38cca6084926fb2c90c31a3c9145c212767da',NULL,1,0,'japinhasasaki@yahoo.com.br','',1779045627,'','','jp',0,0,0,'',0,'',0,0,0,0,0),
(74,'2912778','23679fea2ecc698ae5d4297fa38f46c385ff08e2',NULL,1,0,'alissonnaiser@gmail.com','',1779048956,'','','ie',0,0,0,'',0,'',0,0,0,0,0),
(75,'bruno0996','bc6e6cf232f4ce4a9332c1db817b7e5c34d20ea5',NULL,1,0,'brunodiasteixeira1996@gmail.com','',1779057148,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(76,'serwerus','13b3d28516507598b74f62765e7a3b99ecc24572',NULL,1,0,'serwerus@mail.ru','',1779107740,'','','tr',1779111304,0,0,'',0,'',0,0,0,0,0),
(77,'3646046mr','b9a6d4833eb9435f371afa7297f052937f6d02a8',NULL,1,0,'Mohamed_raslan46@yahoo.com','',1779126618,'','','eg',0,0,0,'',0,'',0,0,0,0,0),
(78,'kidex32','2aaaa9271ca33b5c32f2e720289d741b26f84922',NULL,1,0,'kid@ig.com','',1779129154,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(79,'98042561','4aafd4b98c26ac91cb7af69547455e1627a7b46f',NULL,1,0,'fernando-messias@live.com.br','',1779149082,'','','br',1779920989,0,0,'',0,'',0,0,0,0,0),
(80,'mateus','4aafd4b98c26ac91cb7af69547455e1627a7b46f',NULL,1,0,'fernando-messias@live.com','',1779157549,'','','br',1779157647,0,0,'',0,'',0,0,0,0,0),
(81,'wendel01','ebd82ae8897054034b738a929f4e9ececd5abdc1',NULL,1,0,'wendel01jn@gmail.com','',1779175344,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(82,'demtry','fdf9a4cc0b8b7f7a054fe448bfea2a276a172793',NULL,1,0,'fdhdhfgf67@yahoo.com','',1779201705,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(83,'mosquitox','2c22044d22303f7765ef6118d22c4d3724db96ed',NULL,1,0,'games@hotmail.com','',1779202988,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(84,'351919','2d7c243b47e0d68c009fcc776f11864eadf80eb7',NULL,1,0,'polomones99@gmail.com','',1779232856,'','','mx',0,0,0,'',0,'',0,0,0,0,0),
(85,'test','837c9c1efa907790abfc0c88636fb4dab178f009',NULL,1,0,'kihgk@gmail.com','',1779247987,'','','pl',1779254400,0,0,'',0,'',0,0,0,0,0),
(86,'testt','837c9c1efa907790abfc0c88636fb4dab178f009',NULL,1,0,'kihgjk@gmail.com','',1779253354,'','','pl',1779254335,0,0,'',0,'',0,0,0,0,0),
(87,'grana','ec703a0df5162310dd17c64c3ccd6dec20511d51',NULL,1,0,'kihgkty@gmail.com','',1779260634,'','','pl',1779260642,0,0,'',0,'',0,0,0,0,0),
(88,'Gustavo487','9017997f55999d5e93e2b9441fbe0d6c7387e605',NULL,1,0,'Gustavovbolivia@gmail.com','',1779287358,'','','bo',0,0,0,'',0,'',0,0,0,0,0),
(89,'Alefjunior','47c1cce14df37e8ad7cf280428569ac16079b84c',NULL,1,0,'junioralef988@gmail.com','',1779300630,'','','br',1779300639,0,0,'',0,'',0,0,0,0,0),
(90,'michelpbt','e133b39930ea2a27b5a21d034a40f08de2e2880b',NULL,1,0,'michelcrhystian@gmail.com','',1779306216,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(91,'brunonata','7ff607ae0d2a9b531a9645a209c1d13d3232ed0d',NULL,1,0,'bruno2024lves@gmail.com','',1779319141,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(92,'941415','0ff8a60ae5569661a3ac205da879d24c919484dd',NULL,1,0,'eduardaalice248@gmail.com','',1779394804,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(93,'Mttheusx','657f5a69d7df99285aef2a422f7ba904df972f2a',NULL,1,0,'matheushonorato000@gmail.com','',1779416435,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(94,'5200252','76197fad63dd18d3507aefdd5fce24838acc2051',NULL,1,0,'jccontreras6181@gmail.com','',1779432092,'','','pl',1779639669,0,0,'',0,'',0,0,0,0,0),
(95,'taito','4300541c3b97e616c8f1503a8b2e6a49f219ab92',NULL,1,0,'royaldark38@yahoo.com','',1779475535,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(96,'caraza1','a51dd312093fbe2071bbc3109cf69b1f333075e4',NULL,1,0,'edizerah95@gmail.com','',1779477382,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(97,'2422988','0d28f7683531f3495f220b8a57d7c01a2091b006',NULL,1,0,'eniskder@yahoo.om','',1779494744,'','','pl',1779494765,0,0,'',0,'',0,0,0,0,0),
(98,'musculo','2fb851962a60d141cf8d206f8a70702737344ce7',NULL,1,0,'gabrieldopradosantos@yahoo.com','',1779507902,'','','br',1779507921,0,0,'',0,'',0,0,0,0,0),
(99,'carleandro','9c1da6f5eb8c6f759f5fd91297b440737b3f76f0',NULL,1,0,'carleandrodavimax@gmail.com','',1779530099,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(100,'071120241','130281f549cd37bf859ccec79f3aa260ee4fa201',NULL,1,0,'frankdrogo10@gmail.com','',1779558570,'','','cl',1779560300,0,0,'',0,'',0,0,0,0,0),
(101,'0711202412','130281f549cd37bf859ccec79f3aa260ee4fa201',NULL,1,0,'zairaaguilera2024@gmail.com','',1779560521,'','','cl',0,0,0,'',0,'',0,0,0,0,0),
(102,'willianst','b94090b746dde292f0b260469f5703c0cf6492c6',NULL,1,0,'willianstorres1319@gmail.com','',1779567071,'','','br',1779903664,0,0,'',0,'',0,0,0,0,0),
(103,'Birobiro','18780f0e207ede576e5cf26a2631db8a5477c86b',NULL,1,0,'Adson.bernar@gmail.com','',1779573989,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(104,'kiko29','74d0afec3ce07f38745d9b1ef2d05729ec0bd69d',NULL,1,0,'digitalclica@gmail.com','AALXABHWGC',1779583103,'','','pl',1779583113,0,0,'',0,'',0,0,0,0,0),
(105,'4969077','26ee488c094ad37a78403855771a04d59efc5b63',NULL,1,0,'matheusronaldo337@gmail.com','',1779657536,'','','ar',0,0,0,'',0,'',0,0,0,0,0),
(106,'8945247','a34e1cb1275fe99720ffb266b34aaeaad5e3615b',NULL,1,0,'duckpbot@hotmail.com','',1779659511,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(107,'5602403','488b7b00e91083007f23fe89510e36208f6e13b4',NULL,1,0,'bruno_taopu3@hotmail.com','',1779669282,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(108,'pissin','f40b508c979dca2a2f0841238b3532daf293639e',NULL,1,0,'veiioomarquespissin@gmail.com','SJHNXV1Q5H',1779680775,'','','br',1779680783,0,0,'',0,'',0,0,0,0,0),
(109,'migue94','261a008c6fd802a1ae77c26fe0dd8fc0f1754d8c',NULL,1,0,'pedrofaes12@gmail.com','',1779714764,'','','ve',1779885024,0,0,'',0,'',0,0,0,0,0),
(110,'migue93','261a008c6fd802a1ae77c26fe0dd8fc0f1754d8c',NULL,1,0,'pedrofaes11@gmail.com','',1779715630,'','','ve',1779885215,0,0,'',0,'',0,0,0,0,0),
(111,'migue92','261a008c6fd802a1ae77c26fe0dd8fc0f1754d8c',NULL,1,0,'pedrofaes10@gmail.com','',1779715667,'','','ve',1779885184,0,0,'',0,'',0,0,0,0,0),
(112,'migue91','261a008c6fd802a1ae77c26fe0dd8fc0f1754d8c',NULL,1,0,'pedrofaes9@gmail.com','',1779716526,'','','ve',1779885157,0,0,'',0,'',0,0,0,0,0),
(113,'migue90','261a008c6fd802a1ae77c26fe0dd8fc0f1754d8c',NULL,1,0,'pedrofaes8@gmail.com','',1779716950,'','','ve',1779885126,0,0,'',0,'',0,0,0,0,0),
(114,'2309592','a1c87f579a6a10943ac394e012e83afa669e0426',NULL,1,0,'joseito229@hotmail.com','',1779747787,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(115,'Sarah12','08c720e8ab73f64e6460eee21a1b9db9d9269b4a',NULL,1,0,'nevillejonas33@gmail.com','',1779749127,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(116,'Johny10','f79df2fc3fdf87794282daa93662329bb05c9a48',NULL,1,0,'osko@gmail.com','',1779751017,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(117,'jhobii','2afff4e01352cf7780292dd67e4e25fa591a4239',NULL,1,0,'jhulie.alves.pereira@icloud.com','HGB5SVZEDL',1779757312,'','','br',1779757331,0,0,'',0,'',0,0,0,0,0),
(118,'kraken20','da4456e491667416ab01c1a805cca3af7c90868d',NULL,1,0,'carlosmataga09@hotmail.com','',1779757712,'','','mx',0,0,0,'',0,'',0,0,0,0,0),
(119,'testeflam','5e7d94d61a71bab6a18a1bf351efe7f8c553a30d',NULL,1,0,'testeflam@gmail.com','',1779762404,'','','pl',1779768817,0,0,'',0,'',0,0,0,0,0),
(120,'amu95','d170e857ddf3d3e19df73e88c80a99f96f0e4a40',NULL,1,0,'brunocaldeira_bsc@hotmail.com','',1779765848,'','','br',1780019835,0,0,'',0,'',0,0,0,0,0),
(121,'juninhobm','0237ec781b45a2c1d82f9f0090832b65dde87320',NULL,1,0,'junin.viiera@gmail.com','',1779807996,'','','br',1779808337,0,0,'',0,'',0,0,0,0,0),
(122,'mikesia123','356a192b7913b04c54574d18c28d46e6395428ab',NULL,1,0,'mikesiasz123@gmail.com','',1779828505,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(123,'primot','4aeb04cbbe32a3e5fc0eb564be12d7348fa407f2',NULL,1,0,'willianstorresmagrini@gmail.com','',1779829617,'','','br',1779913671,0,0,'',0,'',0,0,0,0,0),
(124,'hehehe25','4210a9c514210bb3ed48d56adab69d6e713d8c63',NULL,1,0,'maestrotibiano@gmail.com','',1779829992,'','','jp',0,0,0,'',0,'',0,0,0,0,0),
(125,'88103342az','effb2f30cf8d89b7c21adc790b047601129166e8',NULL,1,0,'gustavovitornascimentopereira@gmail.com','',1779833658,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(126,'endrick','18763682358d0744f19e736735dd09db2c8cd5d3',NULL,1,0,'veel.157@gmail.com','',1779834934,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(127,'36315300','af36c4bf5545a64df2f482df7e21666a23566ce2',NULL,1,0,'minhalojasantos1995@gmail.com','',1779835899,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(128,'Douglasnavas','7402096d1d2cd04fa6d60e3897a35f5c9b681f49',NULL,1,0,'navasalejandro0105@gmail.com','',1779849309,'','','co',0,0,0,'',0,'',0,0,0,0,0),
(129,'Buarque','303454f5e97b773eb1e0ef54c317ff9e6eae1617',NULL,1,0,'buarquealbuquerque@gmail.com','',1779857602,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(130,'3786665','33e8b0463b61cd3c8b923438159786bfd73413f1',NULL,1,0,'mohamedgaber1997@yahoo.com','',1779862710,'','','eg',0,0,0,'',0,'',0,0,0,0,0),
(131,'hehehe25a','7da4f04712edba69825008d3f89fd3edaf30946f',NULL,1,0,'aline.pesiilva2021@gmail.com','',1779876496,'','','ar',0,0,0,'',0,'',0,0,0,0,0),
(132,'3654022','ad3543fae4fb7de2a08b47029a8de1877113fb59',NULL,1,0,'Gerar_012@hotmail.com','',1779901555,'','','pl',0,0,0,'',0,'',0,0,0,0,0),
(133,'6060954a','375cf4c5cb4d70db068ad74b485718fbc79a84e0',NULL,1,0,'asd_2007339@yahoo.com','',1779907619,'','','eg',0,0,0,'',0,'',0,0,0,0,0),
(134,'loira147','deac11193ac672630e225d5e78f09734a447507a',NULL,1,0,'Karen_loira21@gmail.com','',1779914395,'','','br',0,0,0,'',0,'',0,0,0,0,0),
(135,'kraken10','a84d02007d01b0554a4de2973bb3abf000fed89c',NULL,1,0,'carlosmataga92@hotmail.com','',1779919579,'','','mx',0,0,0,'',0,'',0,0,0,0,0),
(136,'adrianat','b94090b746dde292f0b260469f5703c0cf6492c6',NULL,1,0,'adrianamagrini1319@gmail.com','',1779998932,'','','br',0,0,0,'',0,'',0,0,0,0,0);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `castle`
--

DROP TABLE IF EXISTS `castle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `castle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'Ninguem',
  `guild_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(10) NOT NULL DEFAULT '24h',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `castle`
--

LOCK TABLES `castle` WRITE;
/*!40000 ALTER TABLE `castle` DISABLE KEYS */;
INSERT INTO `castle` VALUES
(1,'Turn Causing',20,'24h'),
(2,'Ninguem',0,'war');
/*!40000 ALTER TABLE `castle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crypto_payments`
--

DROP TABLE IF EXISTS `crypto_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `crypto_payments` (
  `paymentID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `boxID` int(11) unsigned NOT NULL DEFAULT 0,
  `boxType` enum('paymentbox','captchabox') NOT NULL,
  `orderID` varchar(50) NOT NULL DEFAULT '',
  `userID` varchar(50) NOT NULL DEFAULT '',
  `countryID` varchar(3) NOT NULL DEFAULT '',
  `coinLabel` varchar(6) NOT NULL DEFAULT '',
  `amount` double(20,8) NOT NULL DEFAULT 0.00000000,
  `amountUSD` double(20,8) NOT NULL DEFAULT 0.00000000,
  `unrecognised` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `addr` varchar(34) NOT NULL DEFAULT '',
  `txID` char(64) NOT NULL DEFAULT '',
  `txDate` datetime DEFAULT NULL,
  `txConfirmed` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `txCheckDate` datetime DEFAULT NULL,
  `processed` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `processedDate` datetime DEFAULT NULL,
  `recordCreated` datetime DEFAULT NULL,
  PRIMARY KEY (`paymentID`),
  UNIQUE KEY `key3` (`boxID`,`orderID`,`userID`,`txID`,`amount`,`addr`),
  KEY `boxID` (`boxID`),
  KEY `boxType` (`boxType`),
  KEY `userID` (`userID`),
  KEY `countryID` (`countryID`),
  KEY `orderID` (`orderID`),
  KEY `amount` (`amount`),
  KEY `amountUSD` (`amountUSD`),
  KEY `coinLabel` (`coinLabel`),
  KEY `unrecognised` (`unrecognised`),
  KEY `addr` (`addr`),
  KEY `txID` (`txID`),
  KEY `txDate` (`txDate`),
  KEY `txConfirmed` (`txConfirmed`),
  KEY `txCheckDate` (`txCheckDate`),
  KEY `processed` (`processed`),
  KEY `processedDate` (`processedDate`),
  KEY `recordCreated` (`recordCreated`),
  KEY `key1` (`boxID`,`orderID`),
  KEY `key2` (`boxID`,`orderID`,`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crypto_payments`
--

LOCK TABLES `crypto_payments` WRITE;
/*!40000 ALTER TABLE `crypto_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `crypto_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donate_orders`
--

DROP TABLE IF EXISTS `donate_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `donate_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `txid` varchar(35) NOT NULL,
  `internal_id` varchar(255) DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL,
  `coins` int(11) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `paid_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  KEY `txid` (`txid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donate_orders`
--

LOCK TABLES `donate_orders` WRITE;
/*!40000 ALTER TABLE `donate_orders` DISABLE KEYS */;
INSERT INTO `donate_orders` VALUES
(1,3,'26fc74292beb488da21ef014f8cee845','d3f7b93d-1876-40ba-9aee-848facfa4848',10.00,100,'pending','2026-05-10 11:20:06',NULL),
(2,3,'c5184bec29114da0ae5150533dde7ed5','d2c164cf-622a-4d08-b6f4-dfaaf796b717',1.00,10,'pending','2026-05-10 12:05:54',NULL),
(3,3,'132074588b6e470285a465d15ea2cb3d','e72ee516-a620-4451-bb6b-96924a0a76b4',1.00,10,'paid','2026-05-10 12:08:51','2026-05-10 12:46:24'),
(4,3,'86e95d27c6f34fbf8ff2d24a2230558b','662316c1-8baf-45c0-ba56-4ed114506bc8',1.00,10,'paid','2026-05-10 12:52:08','2026-05-10 12:52:30'),
(5,3,'52e8d1e5e71f438386a83dd57907ac45','d5ed5fa1-f694-4cb0-a70a-35e9c22308f3',1.00,10,'pending','2026-05-10 12:52:40',NULL),
(6,3,'759960f37dcc48e2be8d00e80dc84e2a','3d0d31d8-ab6a-440b-9750-20447a94c85b',1.00,10,'pending','2026-05-10 20:47:43',NULL),
(7,3,'ff20679bf92f48d3ab8ba43b770b0d59','27298743-717e-4464-9edd-6fd0fdf63e3a',10.00,100,'pending','2026-05-11 09:06:27',NULL),
(8,3,'6d4a2060d44e49c584b02f6c7858051e','1353c11a-0c29-41f7-8e40-0022eaa07c7a',10.00,100,'pending','2026-05-12 08:57:47',NULL),
(9,4,'0aa45cf1c1234993bc75e59216033460','4bfafe38-b787-4de7-9a69-7ebd830e20b8',1.00,10,'pending','2026-05-13 09:35:26',NULL),
(10,14,'c30785527ef84a68a7731af5790ed980','34eeb538-43a1-44d7-8182-881a593a0a89',1.00,10,'paid','2026-05-13 10:01:05','2026-05-13 10:01:50'),
(11,14,'1bd91aebab5f41bc81c9181e9701b0cf','0e99f03a-3041-419f-86fb-ec5d178b4b74',1.00,10,'pending','2026-05-13 10:02:03',NULL),
(12,14,'8e95c9bdf8e2421999cdee5475561a3b','dff2cc76-5842-4013-a33c-21629b0b01a5',1.00,10,'pending','2026-05-13 10:02:08',NULL),
(13,14,'82e38dbc2b9941e798573e07eb03297d','465e4e21-d3d3-4000-a04b-5fd59ce7f10d',1.00,10,'pending','2026-05-13 10:02:13',NULL),
(14,14,'99ae289958bc40c59249f1eb9d5ed99a','f31f44a0-2200-4225-9ab1-c603a7df4a4e',1.00,10,'pending','2026-05-13 10:02:18',NULL),
(15,14,'06b5ca94794f4ace97c2abdb58e63cbc','baa6be85-1966-471a-9548-3b002ca5614c',1.00,10,'pending','2026-05-13 10:02:21',NULL),
(16,14,'8b5cfb3896194e328e5dc616421669b5','377f5195-285e-40d9-94fc-6dc77d2f514f',1.00,10,'pending','2026-05-13 10:05:41',NULL),
(17,14,'a73bfc53ae284eafa7c12e54f52dce61','72cd44d6-7790-4666-8f21-56406f566a0d',1.00,10,'pending','2026-05-13 10:05:45',NULL),
(18,14,'a17275a575c44662a8fae2f53733d59a','7c9f599b-b47a-4bfe-b5b3-d9c16dc38bde',1.00,10,'pending','2026-05-13 10:05:47',NULL),
(19,14,'7291c7fd73dd4c8fb3fd52032f9423de','e1e1be17-ee89-4c96-9ce4-b612b63a1684',1.00,10,'pending','2026-05-13 10:05:49',NULL),
(20,14,'c92cade39d3b4b0d92f9b280032bf82e','154ec99b-4cef-4861-9fed-c1a2a0bb09d6',1.00,10,'pending','2026-05-13 10:13:04',NULL),
(21,14,'e5e106b86a85438fbdb23949ccfed411','43da32ea-7575-4788-980b-6623330422b7',1.00,10,'pending','2026-05-13 10:19:08',NULL),
(22,14,'3c8cd09822354cf0a1bf9d14334e9e93','80dc6a27-90fb-46c1-9994-e8c3ec0599b8',40.00,650,'pending','2026-05-13 10:19:19',NULL),
(23,43,'4a419f1d0be14da3be31510fbe2c28f8','876e8357-5942-4230-b76d-5fa010b3374b',20.00,250,'pending','2026-05-16 16:48:29',NULL),
(24,43,'40f1a8031d7c4e948ef1338c4c299cee','a7389d15-d0f6-42c4-91f4-fc43d810b448',20.00,250,'pending','2026-05-16 16:54:55',NULL),
(25,18,'13319bd4ac9741d19d0089be91258712','1a50e354-3fc8-455d-9870-59a6ba81aa6d',20.00,250,'pending','2026-05-16 17:57:55',NULL),
(26,66,'a4c70258320c4d818deb0c7a70faaa0b','d190ef66-1f84-4d0b-8c6e-53783550b7d8',1.00,10,'pending','2026-05-17 10:12:23',NULL);
/*!40000 ALTER TABLE `donate_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_storage`
--

DROP TABLE IF EXISTS `game_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `game_storage` (
  `key` int(10) unsigned NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_storage`
--

LOCK TABLES `game_storage` WRITE;
/*!40000 ALTER TABLE `game_storage` DISABLE KEYS */;
INSERT INTO `game_storage` VALUES
(34873,0),
(75390,20),
(100020,-1),
(100021,-1);
/*!40000 ALTER TABLE `game_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_invites`
--

DROP TABLE IF EXISTS `guild_invites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_invites` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `guild_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`,`guild_id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `guild_invites_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_invites_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_invites`
--

LOCK TABLES `guild_invites` WRITE;
/*!40000 ALTER TABLE `guild_invites` DISABLE KEYS */;
INSERT INTO `guild_invites` VALUES
(113,15);
/*!40000 ALTER TABLE `guild_invites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_membership`
--

DROP TABLE IF EXISTS `guild_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_membership` (
  `player_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `nick` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`player_id`),
  KEY `guild_id` (`guild_id`),
  KEY `rank_id` (`rank_id`),
  CONSTRAINT `guild_membership_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guild_membership_ibfk_2` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `guild_membership_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `guild_ranks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_membership`
--

LOCK TABLES `guild_membership` WRITE;
/*!40000 ALTER TABLE `guild_membership` DISABLE KEYS */;
INSERT INTO `guild_membership` VALUES
(4,7,19,''),
(27,6,16,''),
(67,8,22,''),
(68,8,24,''),
(72,9,25,''),
(73,10,28,''),
(77,6,18,''),
(83,12,34,''),
(84,12,36,''),
(85,12,36,''),
(110,13,37,''),
(114,15,43,''),
(123,14,42,''),
(124,14,40,''),
(140,16,46,''),
(143,17,49,''),
(144,17,51,''),
(151,20,59,''),
(160,19,55,'Matando noods'),
(163,19,57,'Matando noods'),
(164,19,57,'Matando noods'),
(165,19,57,'Matando noods'),
(166,19,57,'Matando noods'),
(179,20,58,'');
/*!40000 ALTER TABLE `guild_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_ranks`
--

DROP TABLE IF EXISTS `guild_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL COMMENT 'guild',
  `name` varchar(255) NOT NULL COMMENT 'rank name',
  `level` int(11) NOT NULL COMMENT 'rank level - leader, vice, member, maybe something else',
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`),
  CONSTRAINT `guild_ranks_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_ranks`
--

LOCK TABLES `guild_ranks` WRITE;
/*!40000 ALTER TABLE `guild_ranks` DISABLE KEYS */;
INSERT INTO `guild_ranks` VALUES
(16,6,'the Leader',3),
(17,6,'a Vice-Leader',2),
(18,6,'a Member',1),
(19,7,'the Leader',3),
(20,7,'a Vice-Leader',2),
(21,7,'a Member',1),
(22,8,'the Leader',3),
(23,8,'a Vice-Leader',2),
(24,8,'a Member',1),
(25,9,'the Leader',3),
(26,9,'a Vice-Leader',2),
(27,9,'a Member',1),
(28,10,'the Leader',3),
(29,10,'a Vice-Leader',2),
(30,10,'a Member',1),
(34,12,'the Leader',3),
(35,12,'a Vice-Leader',2),
(36,12,'a Member',1),
(37,13,'the Leader',3),
(38,13,'a Vice-Leader',2),
(39,13,'a Member',1),
(40,14,'the Leader',3),
(41,14,'a Vice-Leader',2),
(42,14,'a Member',1),
(43,15,'the Leader',3),
(44,15,'a Vice-Leader',2),
(45,15,'a Member',1),
(46,16,'the Leader',3),
(47,16,'a Vice-Leader',2),
(48,16,'a Member',1),
(49,17,'the Leader',3),
(50,17,'a Vice-Leader',2),
(51,17,'a Member',1),
(55,19,'the Leader',3),
(56,19,'a Vice-Leader',2),
(57,19,'a Member',1),
(58,20,'the Leader',3),
(59,20,'a Vice-Leader',2),
(60,20,'a Member',1);
/*!40000 ALTER TABLE `guild_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_transactions`
--

DROP TABLE IF EXISTS `guild_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild_id` int(11) NOT NULL,
  `guild_associated` int(11) DEFAULT NULL,
  `player_associated` int(11) DEFAULT NULL,
  `type` enum('DEPOSIT','WITHDRAW') NOT NULL,
  `category` enum('OTHER','RENT','MATERIAL','SERVICES','REVENUE','CONTRIBUTION') NOT NULL DEFAULT 'OTHER',
  `balance` bigint(20) unsigned NOT NULL DEFAULT 0,
  `time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `guild_id` (`guild_id`),
  KEY `guild_associated` (`guild_associated`),
  KEY `player_associated` (`player_associated`),
  CONSTRAINT `guild_transactions_ibfk_1` FOREIGN KEY (`guild_id`) REFERENCES `guilds` (`id`) ON DELETE CASCADE,
  CONSTRAINT `guild_transactions_ibfk_2` FOREIGN KEY (`guild_associated`) REFERENCES `guilds` (`id`) ON DELETE SET NULL,
  CONSTRAINT `guild_transactions_ibfk_3` FOREIGN KEY (`player_associated`) REFERENCES `players` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_transactions`
--

LOCK TABLES `guild_transactions` WRITE;
/*!40000 ALTER TABLE `guild_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guild_wars`
--

DROP TABLE IF EXISTS `guild_wars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guild_wars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guild1` int(11) NOT NULL DEFAULT 0,
  `guild2` int(11) NOT NULL DEFAULT 0,
  `name1` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `started` bigint(20) NOT NULL DEFAULT 0,
  `ended` bigint(20) NOT NULL DEFAULT 0,
  `fraglimit` int(11) NOT NULL DEFAULT 0,
  `payment` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `guild1` (`guild1`),
  KEY `guild2` (`guild2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guild_wars`
--

LOCK TABLES `guild_wars` WRITE;
/*!40000 ALTER TABLE `guild_wars` DISABLE KEYS */;
/*!40000 ALTER TABLE `guild_wars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guilds`
--

DROP TABLE IF EXISTS `guilds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guilds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ownerid` int(11) NOT NULL,
  `creationdata` int(11) NOT NULL,
  `motd` varchar(255) NOT NULL DEFAULT '',
  `balance` bigint(20) unsigned NOT NULL DEFAULT 0,
  `description` varchar(5000) NOT NULL DEFAULT '',
  `logo_name` varchar(255) NOT NULL DEFAULT 'default.gif',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `ownerid` (`ownerid`),
  CONSTRAINT `guilds_ibfk_1` FOREIGN KEY (`ownerid`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guilds`
--

LOCK TABLES `guilds` WRITE;
/*!40000 ALTER TABLE `guilds` DISABLE KEYS */;
INSERT INTO `guilds` VALUES
(6,'Ancient Blood',27,1778597853,'',0,'New guild. Leader must edit this text :)','ancient_blood.png'),
(7,'Teste',4,1778872257,'',0,'New guild. Leader must edit this text :)','default.gif'),
(8,'akatsuki',67,1778945101,'',0,'New guild. Leader must edit this text :)','default.gif'),
(9,'kkkkk',72,1778951813,'',0,'New guild. Leader must edit this text :)','default.gif'),
(10,'Elf',73,1778951831,'',0,'New guild. Leader must edit this text :)','default.gif'),
(12,'The Kings',83,1779009450,'',0,'New guild. Leader must edit this text :)','default.gif'),
(13,'donat',110,1779111311,'',0,'New guild. Leader must edit this text :)','default.gif'),
(14,'The Trafica',124,1779254377,'',0,'New guild. Leader must edit this text :)','default.gif'),
(15,'Phoenix',114,1779318233,'',0,'New guild. Leader must edit this text :)','default.gif'),
(16,'El monarca de las sombras',140,1779432181,'',0,'New guild. Leader must edit this text :)','default.gif'),
(17,'BlaCk DraGonSs',143,1779494779,'',0,'New guild. Leader must edit this text :)','default.gif'),
(19,'RoxStars',160,1779885043,'',0,'New guild. Leader must edit this text :)','default.gif'),
(20,'Turn Causing',179,1779903310,'',0,'New guild. Leader must edit this text :)','turn_causing.jpg');
/*!40000 ALTER TABLE `guilds` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `oncreate_guilds` AFTER INSERT ON `guilds`
 FOR EACH ROW BEGIN
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('the Leader', 3, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Vice-Leader', 2, NEW.`id`);
    INSERT INTO `guild_ranks` (`name`, `level`, `guild_id`) VALUES ('a Member', 1, NEW.`id`);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `guildwar_kills`
--

DROP TABLE IF EXISTS `guildwar_kills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `guildwar_kills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `killer` varchar(50) NOT NULL,
  `target` varchar(50) NOT NULL,
  `killerguild` int(11) NOT NULL DEFAULT 0,
  `targetguild` int(11) NOT NULL DEFAULT 0,
  `warid` int(11) NOT NULL DEFAULT 0,
  `time` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `warid` (`warid`),
  CONSTRAINT `guildwar_kills_ibfk_1` FOREIGN KEY (`warid`) REFERENCES `guild_wars` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guildwar_kills`
--

LOCK TABLES `guildwar_kills` WRITE;
/*!40000 ALTER TABLE `guildwar_kills` DISABLE KEYS */;
/*!40000 ALTER TABLE `guildwar_kills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_guests`
--

DROP TABLE IF EXISTS `house_guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_guests` (
  `house_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`house_id`,`player_id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `house_guests_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE,
  CONSTRAINT `house_guests_ibfk_2` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_guests`
--

LOCK TABLES `house_guests` WRITE;
/*!40000 ALTER TABLE `house_guests` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `house_lists`
--

DROP TABLE IF EXISTS `house_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `house_lists` (
  `house_id` int(11) NOT NULL,
  `listid` int(11) NOT NULL,
  `list` text NOT NULL,
  KEY `house_id` (`house_id`),
  CONSTRAINT `house_lists_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `house_lists`
--

LOCK TABLES `house_lists` WRITE;
/*!40000 ALTER TABLE `house_lists` DISABLE KEYS */;
INSERT INTO `house_lists` VALUES
(57,256,'Cimed\nKina Of King'),
(57,257,'Cimed\nKina Of King'),
(58,256,'Aimazing'),
(58,257,'Aimazing');
/*!40000 ALTER TABLE `house_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `houses`
--

DROP TABLE IF EXISTS `houses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT 'House',
  `paid` int(10) unsigned NOT NULL DEFAULT 0,
  `warnings` int(11) NOT NULL DEFAULT 0,
  `is_protected` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `rent` int(11) NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 0,
  `bid` int(11) NOT NULL DEFAULT 0,
  `bid_end` int(11) NOT NULL DEFAULT 0,
  `last_bid` int(11) NOT NULL DEFAULT 0,
  `highest_bidder` int(11) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 0,
  `beds` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `owner` (`owner`),
  KEY `town_id` (`town_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3177 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `houses`
--

LOCK TABLES `houses` WRITE;
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
INSERT INTO `houses` VALUES
(1,78,'1',0,0,0,'Unnamed House #1',0,1,0,0,0,0,49,1),
(2,56,'1',0,0,0,'Unnamed House #2',0,1,0,0,0,0,42,2),
(3,61,'1',0,0,0,'Unnamed House #3',0,1,0,0,0,0,43,1),
(4,62,'1',0,0,0,'Unnamed House #4',0,1,0,0,0,0,49,1),
(5,0,'1',0,0,0,'Unnamed House #5',0,1,0,0,0,0,43,1),
(6,57,'1',0,0,0,'Unnamed House #6',0,1,0,0,0,0,44,0),
(7,0,'1',0,0,0,'Unnamed House #7',0,1,0,0,0,0,31,1),
(8,0,'1',0,0,0,'Unnamed House #8',0,1,0,0,0,0,13,1),
(9,0,'1',0,0,0,'Unnamed House #9',0,1,0,0,0,0,21,1),
(10,0,'1',0,0,0,'Unnamed House #10',0,1,0,0,0,0,37,1),
(11,0,'1',0,0,0,'Unnamed House #11',0,1,0,0,0,0,13,1),
(12,0,'1',0,0,0,'Unnamed House #12',0,1,0,0,0,0,16,1),
(13,0,'1',0,0,0,'Unnamed House #13',0,1,0,0,0,0,28,1),
(14,0,'1',0,0,0,'Unnamed House #14',0,1,0,0,0,0,26,1),
(15,0,'1',0,0,0,'Unnamed House #15',0,1,0,0,0,0,22,1),
(16,0,'1',0,0,0,'Unnamed House #16',0,1,0,0,0,0,29,1),
(17,0,'1',0,0,0,'Unnamed House #17',0,1,0,0,0,0,17,1),
(18,0,'1',0,0,0,'Unnamed House #18',0,1,0,0,0,0,13,1),
(19,0,'1',0,0,0,'Unnamed House #19',0,1,0,0,0,0,21,1),
(20,0,'1',0,0,0,'Unnamed House #20',0,1,0,0,0,0,21,1),
(21,0,'1',0,0,0,'Unnamed House #21',0,1,0,0,0,0,27,0),
(22,0,'1',0,0,0,'Unnamed House #22',0,1,0,0,0,0,9,1),
(23,0,'1',0,0,0,'Unnamed House #23',0,1,0,0,0,0,11,1),
(24,0,'1',0,0,0,'Unnamed House #24',0,1,0,0,0,0,9,1),
(25,0,'1',0,0,0,'Unnamed House #25',0,1,0,0,0,0,13,1),
(26,0,'1',0,0,0,'Unnamed House #26',0,1,0,0,0,0,25,1),
(27,0,'1',0,0,0,'Unnamed House #27',0,1,0,0,0,0,41,1),
(28,0,'1',0,0,0,'Unnamed House #28',0,1,0,0,0,0,34,1),
(29,0,'1',0,0,0,'Unnamed House #29',0,1,0,0,0,0,33,1),
(30,0,'1',0,0,0,'Unnamed House #30',0,1,0,0,0,0,18,1),
(31,0,'1',0,0,0,'Unnamed House #31',0,1,0,0,0,0,16,1),
(32,27,'1',0,0,0,'Unnamed House #32',0,1,0,0,0,0,16,1),
(33,75,'1',0,0,0,'Unnamed House #33',0,1,0,0,0,0,31,0),
(34,0,'1',0,0,0,'Unnamed House #34',0,1,0,0,0,0,26,0),
(35,142,'1',0,0,0,'Unnamed House #35',0,1,0,0,0,0,41,0),
(36,0,'1',0,0,0,'Unnamed House #36',0,1,0,0,0,0,26,1),
(37,0,'1',0,0,0,'Unnamed House #37',0,1,0,0,0,0,26,1),
(38,0,'1',0,0,0,'Unnamed House #38',0,1,0,0,0,0,36,1),
(39,0,'1',0,0,0,'Unnamed House #39',0,1,0,0,0,0,30,1),
(40,0,'1',0,0,0,'Unnamed House #40',0,1,0,0,0,0,37,1),
(41,0,'1',0,0,0,'Unnamed House #41',0,1,0,0,0,0,17,1),
(42,0,'1',0,0,0,'Unnamed House #42',0,1,0,0,0,0,16,1),
(43,0,'1',0,0,0,'Unnamed House #43',0,1,0,0,0,0,16,1),
(44,69,'1',0,0,0,'Unnamed House #44',0,1,0,0,0,0,31,1),
(45,0,'1',0,0,0,'Unnamed House #45',0,1,0,0,0,0,14,1),
(46,0,'1',0,0,0,'Unnamed House #46',0,1,0,0,0,0,36,1),
(47,0,'1',0,0,0,'Unnamed House #47',0,1,0,0,0,0,36,1),
(48,0,'1',0,0,0,'Unnamed House #48',0,1,0,0,0,0,38,0),
(49,0,'1',0,0,0,'Unnamed House #49',0,1,0,0,0,0,38,0),
(50,0,'1',0,0,0,'Unnamed House #50',0,1,0,0,0,0,39,0),
(51,0,'1',0,0,0,'Unnamed House #51',0,1,0,0,0,0,23,0),
(52,0,'1',0,0,0,'Unnamed House #52',0,1,0,0,0,0,39,0),
(53,0,'1',0,0,0,'Unnamed House #53',0,1,0,0,0,0,20,0),
(55,0,'1',0,0,0,'Unnamed House #55',0,1,0,0,0,0,45,0),
(56,0,'1',0,0,0,'Unnamed House #56',0,1,0,0,0,0,53,0),
(57,179,'1',0,0,0,'Unnamed House #57',0,1,0,0,0,0,54,0),
(58,151,'1',0,0,0,'Unnamed House #58',0,1,0,0,0,0,70,0),
(59,0,'1',0,0,0,'Unnamed House #59',0,1,0,0,0,0,146,0),
(60,0,'1',0,0,0,'Unnamed House #60',0,1,0,0,0,0,65,0),
(61,0,'1',0,0,0,'Unnamed House #61',0,1,0,0,0,0,64,0),
(62,0,'1',0,0,0,'Unnamed House #62',0,1,0,0,0,0,71,0),
(63,0,'1',0,0,0,'Unnamed House #63',0,1,0,0,0,0,51,0),
(64,0,'1',0,0,0,'Unnamed House #64',0,1,0,0,0,0,64,0),
(65,0,'1',0,0,0,'Unnamed House #65',0,1,0,0,0,0,64,0),
(66,0,'1',0,0,0,'Unnamed House #66',0,1,0,0,0,0,73,0),
(67,0,'1',0,0,0,'Unnamed House #67',0,1,0,0,0,0,73,0),
(68,0,'1',0,0,0,'Unnamed House #68',0,1,0,0,0,0,61,0),
(69,0,'1',0,0,0,'Unnamed House #69',0,1,0,0,0,0,70,0),
(70,0,'1',0,0,0,'Unnamed House #70',0,1,0,0,0,0,57,0),
(71,0,'1',0,0,0,'Unnamed House #71',0,1,0,0,0,0,50,1),
(72,0,'1',0,0,0,'Unnamed House #72',0,1,0,0,0,0,55,1),
(73,0,'1',0,0,0,'Unnamed House #73',0,1,0,0,0,0,50,1),
(74,0,'1',0,0,0,'Unnamed House #74',0,1,0,0,0,0,10,1),
(75,0,'1',0,0,0,'Unnamed House #75',0,1,0,0,0,0,50,2),
(76,0,'1',0,0,0,'Unnamed House #76',0,1,0,0,0,0,36,2),
(3154,0,'1',0,0,0,'',0,0,0,0,0,0,16,0),
(3155,172,'1',0,0,0,'',0,0,0,0,0,0,30,0),
(3156,28,'1',0,0,0,'',0,0,0,0,0,0,28,0),
(3166,0,'1',0,0,0,'',0,0,0,0,0,0,38,0),
(3167,0,'1',0,0,0,'',0,0,0,0,0,0,28,0),
(3168,0,'1',0,0,0,'',0,0,0,0,0,0,5,0),
(3169,0,'1',0,0,0,'',0,0,0,0,0,0,10,0),
(3170,0,'1',0,0,0,'',0,0,0,0,0,0,16,0),
(3171,0,'1',0,0,0,'',0,0,0,0,0,0,24,0),
(3172,0,'1',0,0,0,'',0,0,0,0,0,0,18,0),
(3173,0,'1',0,0,0,'Unnamed House #1',0,1,0,0,0,0,49,1),
(3175,0,'1',0,0,0,'Unnamed House #2',0,1,0,0,0,0,42,2),
(3176,0,'1',0,0,0,'Unnamed House #3',0,1,0,0,0,0,43,1);
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_bans`
--

DROP TABLE IF EXISTS `ip_bans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ip_bans` (
  `ip` int(10) unsigned NOT NULL,
  `reason` varchar(255) NOT NULL,
  `banned_at` bigint(20) NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `banned_by` int(11) NOT NULL,
  PRIMARY KEY (`ip`),
  KEY `banned_by` (`banned_by`),
  CONSTRAINT `ip_bans_ibfk_1` FOREIGN KEY (`banned_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_bans`
--

LOCK TABLES `ip_bans` WRITE;
/*!40000 ALTER TABLE `ip_bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_bans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_history`
--

DROP TABLE IF EXISTS `market_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `market_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  `expires_at` bigint(20) unsigned NOT NULL,
  `inserted` bigint(20) unsigned NOT NULL,
  `state` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`,`sale`),
  CONSTRAINT `market_history_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_history`
--

LOCK TABLES `market_history` WRITE;
/*!40000 ALTER TABLE `market_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_offers`
--

DROP TABLE IF EXISTS `market_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `market_offers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `sale` tinyint(4) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) unsigned NOT NULL,
  `amount` smallint(5) unsigned NOT NULL,
  `created` bigint(20) unsigned NOT NULL,
  `anonymous` tinyint(4) NOT NULL DEFAULT 0,
  `price` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `sale` (`sale`,`itemtype`),
  KEY `created` (`created`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `market_offers_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_offers`
--

LOCK TABLES `market_offers` WRITE;
/*!40000 ALTER TABLE `market_offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_account_actions`
--

DROP TABLE IF EXISTS `myaac_account_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_account_actions` (
  `account_id` int(11) NOT NULL,
  `ip` int(10) unsigned NOT NULL DEFAULT 0,
  `ipv6` binary(16) NOT NULL DEFAULT '0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `date` int(11) NOT NULL DEFAULT 0,
  `action` varchar(255) NOT NULL DEFAULT '',
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_account_actions`
--

LOCK TABLES `myaac_account_actions` WRITE;
/*!40000 ALTER TABLE `myaac_account_actions` DISABLE KEYS */;
INSERT INTO `myaac_account_actions` VALUES
(4,2831347526,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1776530937,'Account created.'),
(5,2831347526,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1776536779,'Account created.'),
(5,2831347526,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1776536779,'Created character <b>Buduiuba</b>.'),
(8,2831367955,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1776782481,'Account created.'),
(8,2831367955,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1776782481,'Created character <b>Zawn Pro</b>.'),
(8,2831367955,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1776782652,'Created character <b>Shadow Ball</b>.'),
(8,2831367955,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1776783538,'Created character <b>Teteuszx</b>.'),
(9,2831347376,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1777415679,'Account created.'),
(9,2831347376,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1777415679,'Created character <b>Biscate</b>.'),
(10,2831347366,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1777648818,'Account created.'),
(10,2831347366,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1777648818,'Created character <b>Prince of Persia</b>.'),
(1,3381984284,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778538358,'Account password changed.'),
(13,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778549895,'Account created.'),
(13,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778549895,'Created character <b>Magi</b>.'),
(14,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778597668,'Account created.'),
(14,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778597668,'Created character <b>Mozila Firefox</b>.'),
(15,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778597972,'Account created.'),
(15,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778597972,'Created character <b>Account Maanager</b>.'),
(16,2831347607,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778605955,'Account created.'),
(16,2831347607,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778605955,'Created character <b>Mogli</b>.'),
(17,2831347607,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778606011,'Account created.'),
(17,2831347607,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778606011,'Created character <b>Sixseven</b>.'),
(18,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778609856,'Account created.'),
(18,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778609856,'Created character <b>Magi</b>.'),
(19,769943101,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778631634,'Account created.'),
(19,769943101,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778631634,'Created character <b>Prince of Persia</b>.'),
(20,2317629915,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778644721,'Account created.'),
(20,2317629915,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778644721,'Created character <b>Vitinho Dashow</b>.'),
(21,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778671413,'Account created.'),
(21,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778671413,'Created character <b>Sofredor</b>.'),
(21,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778671434,'Created character <b>Sofredor Um</b>.'),
(21,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778671447,'Created character <b>Sofredor Dois</b>.'),
(21,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778671459,'Created character <b>Sofredor Tres</b>.'),
(21,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778671474,'Created character <b>Sofredor Quatro</b>.'),
(21,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778671485,'Created character <b>Sofredor Cindo</b>.'),
(21,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778671498,'Created character <b>Sofredor Seis</b>.'),
(21,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778671523,'Created character <b>Sofredor Sete</b>.'),
(21,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778671537,'Created character <b>Sofredor Oito</b>.'),
(21,2982073178,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778671547,'Created character <b>Sofredor Nove</b>.'),
(22,3149718678,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778693863,'Account created.'),
(22,3149718678,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778693863,'Created character <b>Darkis</b>.'),
(23,2972039625,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778707924,'Account created.'),
(23,2972039625,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778707924,'Created character <b>Nightmare Sanguine</b>.'),
(24,2984456903,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778720890,'Account created.'),
(24,2984456903,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778720890,'Created character <b>Sabrosa</b>.'),
(25,2831347701,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778783519,'Account created.'),
(25,2831347701,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778783519,'Created character <b>Kokies</b>.'),
(26,2202577678,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778811956,'Account created.'),
(26,2202577678,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778811956,'Created character <b>Floki</b>.'),
(27,3144195578,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778858921,'Account created.'),
(27,3144195578,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778858921,'Created character <b>Lord Xucreza</b>.'),
(28,3012875803,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778870606,'Account created.'),
(28,3012875803,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778870606,'Created character <b>Two One</b>.'),
(29,770173095,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778892867,'Account created.'),
(29,770173095,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778892867,'Created character <b>Ivokz Mazdax</b>.'),
(29,770173095,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778892887,'Created character <b>Ebola Com Gonoreia</b>.'),
(30,765516659,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778937752,'Account created.'),
(30,765516659,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778937752,'Created character <b>Lord Paulistinha</b>.'),
(30,765516659,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778937792,'Created character <b>Assassin Of Massacre</b>.'),
(31,2974538409,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778938177,'Account created.'),
(31,2974538409,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778938177,'Created character <b>Henrique</b>.'),
(32,2831347603,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778938247,'Account created.'),
(32,2831347603,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778938247,'Created character <b>Grim Heer</b>.'),
(33,2831347603,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778938381,'Account created.'),
(33,2831347603,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778938381,'Created character <b>Hydrazinha</b>.'),
(30,765516659,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778938389,'Created character <b>Mateusz Dragon Wielki</b>.'),
(34,2831347603,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778938759,'Account created.'),
(34,2831347603,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778938759,'Created character <b>Medusinha</b>.'),
(35,3376736995,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778940877,'Account created.'),
(35,3376736995,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778940877,'Created character <b>Charlovin Degrade</b>.'),
(36,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778941163,'Account created.'),
(36,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778941163,'Created character <b>Murito</b>.'),
(37,755484109,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778942450,'Account created.'),
(37,755484109,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778942450,'Created character <b>Azeroth</b>.'),
(18,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778943692,'Created character <b>Jess</b>.'),
(38,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778943741,'Account created.'),
(38,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778943741,'Created character <b>Koi</b>.'),
(39,1835002425,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778944115,'Account created.'),
(39,1835002425,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778944115,'Created character <b>Obito</b>.'),
(40,3195263711,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778944620,'Account created.'),
(40,3195263711,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778944620,'Created character <b>The Punisher</b>.'),
(39,1835002425,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778944721,'Created character <b>Dodge</b>.'),
(41,1835002425,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778946053,'Account created.'),
(41,1835002425,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778946053,'Created character <b>Madara</b>.'),
(42,2831347669,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778946625,'Account created.'),
(42,2831347669,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778946625,'Created character <b>Xamansmz</b>.'),
(36,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778946657,'Created character <b>Jezy</b>.'),
(43,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778947199,'Account created.'),
(43,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778947199,'Created character <b>Senshii</b>.'),
(44,2762149561,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778950723,'Account created.'),
(44,2762149561,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778950723,'Created character <b>Agrotaigo</b>.'),
(44,2762149561,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778951092,'Created character <b>Demoli</b>.'),
(45,3152094416,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778951243,'Account created.'),
(45,3152094416,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778951243,'Created character <b>Polomon</b>.'),
(45,3152094416,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778951555,'Created character <b>Polomon Segundo</b>.'),
(46,3152094416,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778951998,'Account created.'),
(46,3152094416,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778951998,'Created character <b>Baby</b>.'),
(47,2214580755,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778952242,'Account created.'),
(47,2214580755,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778952242,'Created character <b>Utito Tempo Sann</b>.'),
(48,2981974954,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778952861,'Account created.'),
(48,2981974954,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778952861,'Created character <b>Hammer Of Steel</b>.'),
(47,2214580755,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778954265,'Created character <b>Exevo Gran Mass Frigo</b>.'),
(49,1394160130,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778963970,'Account created.'),
(49,1394160130,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778963970,'Created character <b>Roxy Floxy</b>.'),
(50,3140011386,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778965704,'Account created.'),
(50,3140011386,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778965704,'Created character <b>Headshot</b>.'),
(50,3140011386,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778966093,'Created character <b>Druideira</b>.'),
(51,3135458076,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778970468,'Account created.'),
(51,3135458076,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778970468,'Created character <b>Pampers</b>.'),
(52,3135458076,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778970749,'Account created.'),
(52,3135458076,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778970749,'Created character <b>Johnsons Baby</b>.'),
(53,3135458076,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778970800,'Account created.'),
(53,3135458076,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778970800,'Created character <b>Huggies</b>.'),
(54,1746707848,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778977925,'Account created.'),
(54,1746707848,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778977925,'Created character <b>Avaliadordepessa</b>.'),
(55,3017788565,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778979230,'Account created.'),
(55,3017788565,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778979230,'Created character <b>Vitor Pereira</b>.'),
(56,2969607055,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778981693,'Account created.'),
(56,2969607055,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778981693,'Created character <b>Eterno Murilo Snow</b>.'),
(57,2868296641,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778983337,'Account created.'),
(57,2868296641,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778983337,'Created character <b>Zoroak</b>.'),
(58,766332849,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778983697,'Account created.'),
(58,766332849,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778983697,'Created character <b>Gaguinho</b>.'),
(58,766332849,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778984615,'Created character <b>Misterio</b>.'),
(59,274871936,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778985377,'Account created.'),
(59,274871936,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778985377,'Created character <b>Ryozo</b>.'),
(60,274871936,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778985424,'Account created.'),
(60,274871936,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778985424,'Created character <b>Madre</b>.'),
(61,769661313,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778987838,'Account created.'),
(61,769661313,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778987838,'Created character <b>Jotinha</b>.'),
(62,2969674293,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778989944,'Account created.'),
(62,2969674293,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778989944,'Created character <b>Nego Preto</b>.'),
(63,3012875803,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778989954,'Account created.'),
(63,3012875803,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778989954,'Created character <b>Two Onee</b>.'),
(64,3192395535,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778998111,'Account created.'),
(64,3192395535,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1778998111,'Created character <b>El wuazonbb</b>.'),
(65,2972027735,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779011566,'Account created.'),
(65,2972027735,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779011566,'Created character <b>Archerhur</b>.'),
(66,1841594269,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779023531,'Account created.'),
(66,1841594269,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779023531,'Created character <b>Qansar</b>.'),
(67,765738247,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779024200,'Account created.'),
(67,765738247,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779024200,'Created character <b>Winchester</b>.'),
(68,3193138532,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779026833,'Account created.'),
(68,3193138532,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779026833,'Created character <b>King</b>.'),
(68,3193138532,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779026860,'Created character <b>Prince</b>.'),
(69,3230407067,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779029985,'Account created.'),
(69,3230407067,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779029985,'Created character <b>Bonnie Bennette</b>.'),
(70,3145243806,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779031179,'Account created.'),
(70,3145243806,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779031179,'Created character <b>Zeeh Joga Facil</b>.'),
(71,2975116878,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779035912,'Account created.'),
(71,2975116878,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779035912,'Created character <b>Wuachumirufa</b>.'),
(72,3135126975,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779036154,'Account created.'),
(72,3135126975,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779036154,'Created character <b>Black Druid</b>.'),
(73,3012697028,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779045627,'Account created.'),
(73,3012697028,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779045627,'Created character <b>Soul War</b>.'),
(74,3362255974,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779048956,'Account created.'),
(74,3362255974,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779048956,'Created character <b>Others</b>.'),
(75,2974227228,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779057148,'Account created.'),
(75,2974227228,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779057148,'Created character <b>Black Skull</b>.'),
(76,1315911081,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779107740,'Account created.'),
(76,1315911081,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779107740,'Created character <b>Donat</b>.'),
(77,2630286990,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779126618,'Account created.'),
(77,2630286990,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779126618,'Created character <b>Fornoek</b>.'),
(78,3458872743,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779129154,'Account created.'),
(78,3458872743,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779129154,'Created character <b>Nega Ju</b>.'),
(79,3173389941,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779149082,'Account created.'),
(79,3173389941,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779149082,'Created character <b>Loko do pally</b>.'),
(79,3173389941,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779153818,'Created character <b>Mage Rushmax</b>.'),
(80,3173389941,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779157549,'Account created.'),
(80,3173389941,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779157549,'Created character <b>Loko Do Pallyz</b>.'),
(80,3173389941,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779157662,'Created character <b>Mateusxx</b>.'),
(80,3173389941,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779157687,'Created character <b>Lokazaoo</b>.'),
(81,3011333089,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779175344,'Account created.'),
(81,3011333089,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779175344,'Created character <b>Cain</b>.'),
(82,3307246560,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779201705,'Account created.'),
(82,3307246560,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779201705,'Created character <b>Demtry</b>.'),
(83,2982461259,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779202988,'Account created.'),
(83,2982461259,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779202988,'Created character <b>Kina Rex</b>.'),
(42,2982073027,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779204064,'Created character <b>Sakamoto</b>.'),
(45,3152093890,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779232722,'Deleted character <b>Polomon</b>.'),
(84,3152093890,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779232856,'Account created.'),
(84,3152093890,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779232856,'Created character <b>Star</b>.'),
(85,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779247987,'Account created.'),
(85,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779247987,'Created character <b>Kiboom</b>.'),
(86,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779253354,'Account created.'),
(86,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779253354,'Created character <b>Bad Boy</b>.'),
(87,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779260634,'Account created.'),
(87,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779260634,'Created character <b>Grana Um</b>.'),
(87,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779260652,'Created character <b>Grana Umm</b>.'),
(87,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779260663,'Created character <b>Grana Uh</b>.'),
(87,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779260679,'Created character <b>Grana Uoo</b>.'),
(87,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779260691,'Created character <b>Grana Ummp</b>.'),
(87,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779260706,'Created character <b>Grana Umoo</b>.'),
(87,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779260717,'Created character <b>Grana Umfj</b>.'),
(87,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779260727,'Created character <b>Grana Umjk</b>.'),
(87,3204875993,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779260736,'Created character <b>Grana Umjj</b>.'),
(88,2662130664,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779287358,'Account created.'),
(88,2662130664,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779287358,'Created character <b>Ozzy</b>.'),
(89,770022264,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779300630,'Account created.'),
(89,770022264,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779300630,'Created character <b>Alef Junior</b>.'),
(90,3230525855,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779306216,'Account created.'),
(90,3230525855,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779306216,'Created character <b>Stiick</b>.'),
(91,2975700422,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779319141,'Account created.'),
(91,2975700422,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779319141,'Created character <b>Brunin Catarina</b>.'),
(92,765819241,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779394804,'Account created.'),
(92,765819241,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779394804,'Created character <b>Kritical</b>.'),
(93,765724527,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779416435,'Account created.'),
(93,765724527,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779416435,'Created character <b>Mttheusx</b>.'),
(94,3153691186,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779432092,'Account created.'),
(94,3153691186,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779432092,'Created character <b>Duoner</b>.'),
(95,1723659355,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779475535,'Account created.'),
(95,1723659355,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779475535,'Created character <b>Dage</b>.'),
(96,2762183024,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779477382,'Account created.'),
(96,2762183024,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779477382,'Created character <b>Shanks</b>.'),
(97,3307984138,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779494744,'Account created.'),
(97,3307984138,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779494744,'Created character <b>Crazy Enopes</b>.'),
(97,3307984138,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779494856,'Created character <b>Crazy Paladin</b>.'),
(98,3017617964,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779507902,'Account created.'),
(98,3017617964,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779507902,'Created character <b>Expzin</b>.'),
(98,3017617964,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779508043,'Created character <b>Old Pally</b>.'),
(99,2974354620,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779530099,'Account created.'),
(99,2974354620,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779530099,'Created character <b>Klaus</b>.'),
(100,3195150381,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779558570,'Account created.'),
(100,3195150381,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779558570,'Created character <b>Lexus pro</b>.'),
(100,3195150381,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779560331,'Created character <b>Lexus Max</b>.'),
(101,3195150381,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779560521,'Account created.'),
(101,3195150381,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779560521,'Created character <b>Lexus big</b>.'),
(102,3358858357,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779567071,'Account created.'),
(102,3358858357,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779567071,'Created character <b>Cimed</b>.'),
(103,3006502816,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779573989,'Account created.'),
(103,3006502816,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779573989,'Created character <b>Tomas Turbano</b>.'),
(104,3137474672,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779583103,'Account created.'),
(104,3137474672,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779583103,'Created character <b>Clickz</b>.'),
(104,3137474672,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779583122,'Generated recovery key.'),
(105,2971250858,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779657536,'Account created.'),
(105,2971250858,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779657536,'Created character <b>Dona Do Cabare</b>.'),
(106,3216325251,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779659511,'Account created.'),
(106,3216325251,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779659511,'Created character <b>Killyan</b>.'),
(107,3134003011,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779669282,'Account created.'),
(107,3134003011,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779669282,'Created character <b>Distancer</b>.'),
(108,3010290683,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779680775,'Account created.'),
(108,3010290683,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779680775,'Created character <b>Oi Tiu</b>.'),
(108,3010290683,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779680800,'Generated recovery key.'),
(109,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779714764,'Account created.'),
(109,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779714764,'Created character <b>Hannah</b>.'),
(109,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779714801,'Created character <b>Hanzel</b>.'),
(109,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779714818,'Created character <b>Hanna</b>.'),
(109,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779714834,'Created character <b>Hanny</b>.'),
(109,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779714846,'Created character <b>Kinghel</b>.'),
(109,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779715566,'Changed comment for character <b>Kinghel</b>.'),
(109,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779715578,'Changed comment for character <b>Hanzel</b>.'),
(110,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779715630,'Account created.'),
(110,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779715630,'Created character <b>Hanzell</b>.'),
(111,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779715667,'Account created.'),
(111,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779715667,'Created character <b>Hannahh</b>.'),
(112,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779716526,'Account created.'),
(112,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779716526,'Created character <b>Gretel</b>.'),
(113,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779716950,'Account created.'),
(113,3194429342,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779716950,'Created character <b>Assasixd</b>.'),
(114,3125779673,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779747787,'Account created.'),
(114,3125779673,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779747787,'Created character <b>Nikki Sixx</b>.'),
(115,2971058307,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779749127,'Account created.'),
(115,2971058307,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779749127,'Created character <b>Betin</b>.'),
(116,1357461636,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779751017,'Account created.'),
(116,1357461636,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779751017,'Created character <b>Tupikina</b>.'),
(117,3135311840,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779757312,'Account created.'),
(117,3135311840,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779757312,'Created character <b>Jhobii</b>.'),
(117,3135311840,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779757398,'Generated recovery key.'),
(118,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779757712,'Account created.'),
(118,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779757712,'Created character <b>Tanka</b>.'),
(119,3176445023,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779762404,'Account created.'),
(119,3176445023,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779762404,'Created character <b>Flam Teste</b>.'),
(120,3176445023,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779765848,'Account created.'),
(120,3176445023,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779765848,'Created character <b>Toys</b>.'),
(120,3176445023,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779765867,'Created character <b>King Caldeira</b>.'),
(119,3176445023,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779768867,'Created character <b>Bkzerah</b>.'),
(121,766098473,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779807996,'Account created.'),
(121,766098473,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779807996,'Created character <b>Volka</b>.'),
(121,766098473,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779808344,'Created character <b>Skeps Koyote</b>.'),
(122,2831367354,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779828505,'Account created.'),
(122,2831367354,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779828505,'Created character <b>Choucha Prime</b>.'),
(123,3358858794,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779829617,'Account created.'),
(123,3358858794,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779829617,'Created character <b>Aimazing</b>.'),
(124,2160680998,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779829992,'Account created.'),
(124,2160680998,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779829992,'Created character <b>Momonga</b>.'),
(125,3366224783,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779833658,'Account created.'),
(125,3366224783,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779833658,'Created character <b>Gus tavo</b>.'),
(126,2972026088,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779834934,'Account created.'),
(126,2972026088,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779834934,'Created character <b>Peidjado Roots</b>.'),
(127,2412822909,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779835899,'Account created.'),
(127,2412822909,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779835899,'Created character <b>Yazuka</b>.'),
(128,3044496037,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779849309,'Account created.'),
(128,3044496037,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779849309,'Created character <b>Candy</b>.'),
(129,2972036853,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779857602,'Account created.'),
(129,2972036853,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779857602,'Created character <b>Intocable Joo</b>.'),
(130,2630294562,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779862710,'Account created.'),
(130,2630294562,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779862710,'Created character <b>Boyka</b>.'),
(131,2160680998,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779876496,'Account created.'),
(131,2160680998,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779876496,'Created character <b>Ainz Ooal Gown</b>.'),
(132,3385937410,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779901555,'Account created.'),
(132,3385937410,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779901555,'Created character <b>Muerto tibia</b>.'),
(133,2631055495,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779907619,'Account created.'),
(133,2631055495,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779907619,'Created character <b>Xenhort</b>.'),
(134,2976174775,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779914395,'Account created.'),
(134,2976174775,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779914395,'Created character <b>Loirah Kah</b>.'),
(135,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779919579,'Account created.'),
(135,3185186602,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779919579,'Created character <b>Magito</b>.'),
(136,3205565098,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779998932,'Account created.'),
(136,3205565098,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1779998933,'Created character <b>Kina Of King</b>.');
/*!40000 ALTER TABLE `myaac_account_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_account_emails_verify`
--

DROP TABLE IF EXISTS `myaac_account_emails_verify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_account_emails_verify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `sent_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_account_emails_verify`
--

LOCK TABLES `myaac_account_emails_verify` WRITE;
/*!40000 ALTER TABLE `myaac_account_emails_verify` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_account_emails_verify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_admin_menu`
--

DROP TABLE IF EXISTS `myaac_admin_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `page` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `flags` int(11) NOT NULL DEFAULT 0,
  `enabled` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_admin_menu`
--

LOCK TABLES `myaac_admin_menu` WRITE;
/*!40000 ALTER TABLE `myaac_admin_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_changelog`
--

DROP TABLE IF EXISTS `myaac_changelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_changelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` varchar(500) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 - added, 2 - removed, 3 - changed, 4 - fixed',
  `where` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 - server, 2 - site',
  `date` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_changelog`
--

LOCK TABLES `myaac_changelog` WRITE;
/*!40000 ALTER TABLE `myaac_changelog` DISABLE KEYS */;
INSERT INTO `myaac_changelog` VALUES
(1,'MyAAC installed. (:',3,2,1776530761,0,0);
/*!40000 ALTER TABLE `myaac_changelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_config`
--

DROP TABLE IF EXISTS `myaac_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `value` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_config`
--

LOCK TABLES `myaac_config` WRITE;
/*!40000 ALTER TABLE `myaac_config` DISABLE KEYS */;
INSERT INTO `myaac_config` VALUES
(1,'database_version','46'),
(2,'status_online','0'),
(3,'status_players','0'),
(4,'status_playersMax','0'),
(5,'status_lastCheck','1780056286'),
(6,'status_uptime','112'),
(7,'status_monsters','17999'),
(8,'views_counter','137020'),
(9,'last_usage_report','1779142555'),
(10,'status_uptimeReadable','0h 1m'),
(11,'status_motd','Bem-vindo ao Baiak Pesado!'),
(12,'status_mapAuthor','Pesado'),
(13,'status_mapName','Baiak Yurots'),
(14,'status_mapWidth','2439'),
(15,'status_mapHeight','2283'),
(16,'status_server','Millhiore TFS Downgrade'),
(17,'status_serverVersion','1.7'),
(18,'status_clientVersion','860');
/*!40000 ALTER TABLE `myaac_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_faq`
--

DROP TABLE IF EXISTS `myaac_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(1020) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_faq`
--

LOCK TABLES `myaac_faq` WRITE;
/*!40000 ALTER TABLE `myaac_faq` DISABLE KEYS */;
INSERT INTO `myaac_faq` VALUES
(1,'What is this?','This is website for OTS powered by MyAAC.',0,0);
/*!40000 ALTER TABLE `myaac_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_forum`
--

DROP TABLE IF EXISTS `myaac_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_forum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_post` int(11) NOT NULL DEFAULT 0,
  `last_post` int(11) NOT NULL DEFAULT 0,
  `section` int(11) NOT NULL DEFAULT 0,
  `replies` int(11) NOT NULL DEFAULT 0,
  `views` int(11) NOT NULL DEFAULT 0,
  `author_aid` int(11) NOT NULL DEFAULT 0,
  `author_guid` int(11) NOT NULL DEFAULT 0,
  `post_text` text NOT NULL,
  `post_topic` varchar(255) NOT NULL DEFAULT '',
  `post_smile` tinyint(4) NOT NULL DEFAULT 0,
  `post_html` tinyint(4) NOT NULL DEFAULT 0,
  `post_date` int(11) NOT NULL DEFAULT 0,
  `last_edit_aid` int(11) NOT NULL DEFAULT 0,
  `edit_date` int(11) NOT NULL DEFAULT 0,
  `post_ip` varchar(45) NOT NULL DEFAULT '0.0.0.0',
  `sticked` tinyint(4) NOT NULL DEFAULT 0,
  `closed` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `section` (`section`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_forum`
--

LOCK TABLES `myaac_forum` WRITE;
/*!40000 ALTER TABLE `myaac_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_forum_boards`
--

DROP TABLE IF EXISTS `myaac_forum_boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_forum_boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `guild` int(11) NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 0,
  `closed` tinyint(4) NOT NULL DEFAULT 0,
  `hide` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_forum_boards`
--

LOCK TABLES `myaac_forum_boards` WRITE;
/*!40000 ALTER TABLE `myaac_forum_boards` DISABLE KEYS */;
INSERT INTO `myaac_forum_boards` VALUES
(1,'News','News commenting',0,0,6,1,0),
(2,'Trade','Trade offers.',1,0,0,0,0),
(3,'Quests','Quest making.',2,0,0,0,0),
(4,'Pictures','Your pictures.',3,0,0,0,0),
(5,'Bug Report','Report bugs there.',4,0,0,0,0);
/*!40000 ALTER TABLE `myaac_forum_boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_gallery`
--

DROP TABLE IF EXISTS `myaac_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_gallery`
--

LOCK TABLES `myaac_gallery` WRITE;
/*!40000 ALTER TABLE `myaac_gallery` DISABLE KEYS */;
INSERT INTO `myaac_gallery` VALUES
(1,'Demon','images/gallery/demon.jpg','images/gallery/demon_thumb.gif','MyAAC',0,0);
/*!40000 ALTER TABLE `myaac_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_hotpay`
--

DROP TABLE IF EXISTS `myaac_hotpay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_hotpay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(30) NOT NULL,
  `account_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `currency` varchar(10) NOT NULL,
  `points` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_hotpay`
--

LOCK TABLES `myaac_hotpay` WRITE;
/*!40000 ALTER TABLE `myaac_hotpay` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_hotpay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_menu`
--

DROP TABLE IF EXISTS `myaac_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `blank` tinyint(4) NOT NULL DEFAULT 0,
  `color` varchar(6) NOT NULL DEFAULT '',
  `category` int(11) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `enabled` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_menu`
--

LOCK TABLES `myaac_menu` WRITE;
/*!40000 ALTER TABLE `myaac_menu` DISABLE KEYS */;
INSERT INTO `myaac_menu` VALUES
(1,'kathrine','Latest News','news',0,'',1,0,1),
(2,'kathrine','News Archive','news/archive',0,'',1,1,1),
(3,'kathrine','Changelog','change-log',0,'',1,2,1),
(4,'kathrine','Account Management','account/manage',0,'',2,0,1),
(5,'kathrine','Create Account','account/create',0,'',2,1,1),
(6,'kathrine','Lost Account?','account/lost',0,'',2,2,1),
(7,'kathrine','Server Rules','rules',0,'',2,3,1),
(8,'kathrine','Downloads','downloads',0,'',2,4,1),
(9,'kathrine','Characters','characters',0,'',3,0,1),
(10,'kathrine','Who is Online?','online',0,'',3,1,1),
(11,'kathrine','Highscores','highscores',0,'',3,2,1),
(12,'kathrine','Last Kills','last-kills',0,'',3,3,1),
(13,'kathrine','Houses','houses',0,'',3,4,1),
(14,'kathrine','Guilds','guilds',0,'',3,5,1),
(15,'kathrine','Polls','polls',0,'',3,6,1),
(16,'kathrine','Bans','bans',0,'',3,7,1),
(17,'kathrine','Forum','forum',0,'',3,8,1),
(18,'kathrine','Team','team',0,'',3,9,1),
(19,'kathrine','Monsters','monsters',0,'',5,0,1),
(20,'kathrine','Spells','spells',0,'',5,1,1),
(21,'kathrine','Server Info','ots-info',0,'',5,2,1),
(22,'kathrine','Commands','commands',0,'',5,3,1),
(23,'kathrine','Exp Stages','exp-stages',0,'',5,4,1),
(24,'kathrine','Gallery','gallery',0,'',5,5,1),
(25,'kathrine','Exp Table','exp-table',0,'',5,6,1),
(26,'kathrine','FAQ','faq',0,'',5,7,1),
(27,'kathrine','Buy Points','donate',0,'',6,0,1),
(28,'kathrine','Shop Offer','gifts',0,'',6,1,1),
(29,'kathrine','Shop History','gifts/history',0,'',6,2,1),
(88,'tibiacom','Latest News','news',0,'ffffff',1,0,1),
(89,'tibiacom','News Archive','news/archive',0,'ffffff',1,1,1),
(90,'tibiacom','Changelog','change-log',0,'ffffff',1,2,1),
(91,'tibiacom','Account Management','account/manage',0,'ffffff',2,0,1),
(92,'tibiacom','Create Account','account/create',0,'ffffff',2,1,1),
(93,'tibiacom','Lost Account?','account/lost',0,'ffffff',2,2,1),
(94,'tibiacom','Server Rules','rules',0,'ffffff',2,3,1),
(95,'tibiacom','Downloads','downloads',0,'ffffff',2,4,1),
(96,'tibiacom','Characters','characters',0,'ffffff',3,0,1),
(97,'tibiacom','Who is Online?','online',0,'ffffff',3,1,1),
(98,'tibiacom','Highscores','highscores',0,'ffffff',3,2,1),
(99,'tibiacom','Last Kills','last-kills',0,'ffffff',3,3,1),
(100,'tibiacom','Houses','houses',0,'ffffff',3,4,1),
(101,'tibiacom','Guilds','guilds',0,'ffffff',3,5,1),
(102,'tibiacom','Polls','polls',0,'ffffff',3,6,1),
(103,'tibiacom','Bans','bans',0,'ffffff',3,7,1),
(104,'tibiacom','Support List','team',0,'ffffff',3,8,1),
(105,'tibiacom','Forum','forum',0,'ffffff',4,0,1),
(106,'tibiacom','Monsters','monsters',0,'ffffff',5,0,1),
(107,'tibiacom','Spells','spells',0,'ffffff',5,1,1),
(108,'tibiacom','Commands','commands',0,'ffffff',5,2,1),
(109,'tibiacom','Exp Stages','exp-stages',0,'ffffff',5,3,1),
(110,'tibiacom','Gallery','gallery',0,'ffffff',5,4,1),
(111,'tibiacom','Server Info','ots-info',0,'ffffff',5,5,1),
(112,'tibiacom','Exp Table','exp-table',0,'ffffff',5,6,1),
(113,'tibiacom','FAQ','faq',0,'ffffff',5,7,1),
(114,'tibiacom','Buy Points','donate',0,'ffffff',6,0,1),
(115,'tibiacom','Shop Offer','gifts',0,'ffffff',6,1,1),
(116,'tibiacom','Shop History','gifts/history',0,'ffffff',6,2,1),
(117,'tibiacom','Top Frags','top-frags',0,'',7,1,1),
(118,'tibiacom','Anti-Entrosa','anti-entrosa',0,'',7,2,1),
(119,'tibiacom','Castle War','castlewar',0,'',7,3,1);
/*!40000 ALTER TABLE `myaac_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_monsters`
--

DROP TABLE IF EXISTS `myaac_monsters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_monsters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hide` tinyint(4) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `mana` int(11) NOT NULL DEFAULT 0,
  `exp` int(11) NOT NULL,
  `health` int(11) NOT NULL,
  `look` varchar(255) NOT NULL DEFAULT '',
  `speed_lvl` int(11) NOT NULL DEFAULT 1,
  `use_haste` tinyint(4) NOT NULL,
  `voices` text NOT NULL,
  `immunities` varchar(255) NOT NULL,
  `elements` text NOT NULL,
  `summonable` tinyint(4) NOT NULL,
  `convinceable` tinyint(4) NOT NULL,
  `pushable` tinyint(4) NOT NULL DEFAULT 0,
  `canpushitems` tinyint(4) NOT NULL DEFAULT 0,
  `canwalkonenergy` tinyint(4) NOT NULL DEFAULT 0,
  `canwalkonpoison` tinyint(4) NOT NULL DEFAULT 0,
  `canwalkonfire` tinyint(4) NOT NULL DEFAULT 0,
  `runonhealth` tinyint(4) NOT NULL DEFAULT 0,
  `hostile` tinyint(4) NOT NULL DEFAULT 0,
  `attackable` tinyint(4) NOT NULL DEFAULT 0,
  `rewardboss` tinyint(4) NOT NULL DEFAULT 0,
  `defense` int(11) NOT NULL DEFAULT 0,
  `armor` int(11) NOT NULL DEFAULT 0,
  `canpushcreatures` tinyint(4) NOT NULL DEFAULT 0,
  `race` varchar(255) NOT NULL,
  `loot` text NOT NULL,
  `summons` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=475 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_monsters`
--

LOCK TABLES `myaac_monsters` WRITE;
/*!40000 ALTER TABLE `myaac_monsters` DISABLE KEYS */;
INSERT INTO `myaac_monsters` VALUES
(1,0,'Baby Hades',530,400000,150000,'{\"type\":40,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5985}',40,0,'[\"Hot, eh?\",\"Hell, oh hell!\"]','[\"fire\"]','[]',1,1,0,1,0,0,0,0,1,1,0,15,13,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2160\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"833\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2568\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2691\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2150\",\"count\":\"2\",\"chance\":\"1666\"},{\"id\":\"2191\",\"count\":1,\"chance\":\"833\"}]','[]'),
(2,0,'Bulma Necromancer',0,400000,150000,'{\"type\":54,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6081}',140,0,'[\"Horax pokti!\",\"Hihihihi!\",\"Herba budinia ex!\"]','[\"energy\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,12,8,0,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(3,0,'Dementador',0,400000,150000,'{\"type\":300,\"corpse\":8955}',90,0,'[\"Death!\",\"Come a little closer!\",\"The end is near!\"]','[\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Death\",\"percent\":\"60\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"6000\"}]','[]'),
(4,0,'Diablo',10000,400000,150000,'{\"type\":35,\"corpse\":5995}',90,1,'[\"MUHAHAHAHA!\",\"I SMELL FEEEEEAAAR!\",\"CHAMEK ATH UTHUL ARAK!\",\"Your resistance is futile!\",\"Your soul will be mine!\"]','[\"fire\",\"drown\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,55,1,'fire','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"6000\"}]','[{\"name\":\"fire elemental\",\"chance\":\"12\"}]'),
(5,0,'Draculan',0,400000,150000,'{\"type\":287,\"corpse\":8937}',90,0,'[]','[\"lifedrain\",\"death\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[{\"name\":\"Banshee\",\"chance\":\"50\"}]'),
(6,0,'Hades',0,400000,150000,'{\"type\":12,\"head\":0,\"body\":123,\"legs\":97,\"feet\":94,\"corpse\":6068}',90,1,'[\"COME HERE AND DIE!\",\"COME AND GIVE ME SOME AMUSEMENT!\",\"IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?\",\"I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!\",\"FLAWLESS VICTORY!\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,65,55,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"6000\"}]','[{\"name\":\"Deathslicer\",\"chance\":\"20\"}]'),
(7,0,'Orc Champion',0,400000,150000,'{\"type\":8,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":2864}',140,1,'[\"CRARRGG GROARR!\"]','[\"poison\"]','[]',0,0,0,1,0,0,0,0,1,1,0,12,12,1,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(8,0,'Tartarus',0,11500,150000,'{\"type\":303,\"head\":10,\"body\":50,\"legs\":121,\"feet\":115,\"corpse\":6068}',490,1,'[\"DIE!\",\"COME AND YOU WILL DIE\",\"IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?\",\"I AM LAVANOS OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!\",\"FLAWLESS VICTORY!\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,65,55,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[{\"name\":\"deathslicer\",\"chance\":\"52\"}]'),
(9,0,'carniphila',0,400000,150000,'{\"type\":120,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6047}',140,0,'[]','[\"earth\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"10\"},{\"name\":\"Ice\",\"percent\":\"7\"}]',0,0,0,1,0,0,0,0,1,1,0,15,25,1,'VENOM','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(10,0,'Worker Golem',0,400000,150000,'{\"type\":304,\"corpse\":9801}',175,0,'[\"INTRUDER ALARM!\",\"klonk klonk klonk\",\"Rrrtttarrrttarrrtta\",\"Awaiting orders.\",\"Secret objective complete.\"]','[\"invisible\",\"paralyze\"]','[{\"name\":\"Earth\",\"percent\":\"50\"},{\"name\":\"Holy\",\"percent\":\"30\"},{\"name\":\"Physical\",\"percent\":\"40\"},{\"name\":\"Ice\",\"percent\":\"25\"},{\"name\":\"Death\",\"percent\":\"30\"}]',0,0,0,1,0,0,0,0,1,1,0,45,40,1,'energy','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(11,0,'Eternal Guardian',300,25,70,'{\"type\":345,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":5966}',1,0,'[\"Grak brrretz!\",\"Grow truk grrrrr.\",\"Prek tars, dekklep zurk.\"]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,8,4,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2480\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2526\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(12,0,'Gladiator',470,90,185,'{\"type\":131,\"head\":78,\"body\":3,\"legs\":79,\"feet\":114,\"corpse\":3058}',1,1,'[\"You are no match for me!\",\"Feel my prowess\",\"Fight!\"]','[]','[{\"name\":\"Holy\",\"percent\":\"10\"},{\"name\":\"Physical\",\"percent\":\"15\"}]',1,1,1,0,0,0,0,1,1,1,0,22,20,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"8872\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"25000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"15000\"}]','[]'),
(13,0,'Arkhothep',0,400000,8000000,'{\"type\":12,\"corpse\":5995}',190,0,'[]','[\"name\",\"name\"]','[]',0,0,0,1,0,0,0,0,1,1,0,1000,1000,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(14,0,'Killer Caiman',350,800,1500,'{\"type\":119,\"corpse\":6046}',10,1,'[]','[\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"5\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Earth\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,1,'blood','[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"17500\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"17500\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"15000\"},{\"id\":\"11190\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"3982\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2149\",\"count\":1,\"chance\":\"400\"},{\"id\":\"11239\",\"count\":\"2\",\"chance\":\"1000\"}]','[]'),
(15,0,'Lancer Beetle',0,250,400,'{\"type\":348,\"corpse\":11369}',1,0,'[\"Crump!\"]','[\"earth\",\"invisible\",\"lifedrain\",\"paralyze\"]','[{\"name\":\"Death\",\"percent\":\"50\"}]',0,1,0,1,0,0,0,1,1,1,0,25,25,0,'venom','[{\"id\":\"2148\",\"count\":\"61\",\"chance\":\"2000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"2000\"},{\"id\":\"10608\",\"count\":1,\"chance\":\"17500\"},{\"id\":\"10556\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"11366\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"11368\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2150\",\"count\":1,\"chance\":\"800\"}]','[]'),
(16,0,'Orc Marauder',0,220,235,'{\"type\":342,\"corpse\":11245}',85,1,'[\"Grrrrrr\"]','[\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"1\"},{\"name\":\"Holy\",\"percent\":\"1\"}]',0,1,0,1,0,0,0,0,1,1,0,45,20,1,'blood','[{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"7500\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"7500\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"16250\"},{\"id\":\"2428\",\"count\":1,\"chance\":\"23250\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2455\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2425\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"11318\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"11109\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"8857\",\"count\":1,\"chance\":\"500\"}]','[]'),
(17,0,'Sandcrawler',200,20,30,'{\"type\":350,\"corpse\":11357}',1,0,'[\"Chrk chrk!\"]','[]','[]',1,0,0,1,0,0,0,0,1,1,0,19,16,0,'venom','[{\"id\":\"2148\",\"count\":\"6\",\"chance\":\"20000\"},{\"id\":\"11367\",\"count\":1,\"chance\":\"1500\"}]','[]'),
(18,0,'Terramite',0,160,365,'{\"type\":346,\"corpse\":8593}',1,0,'[\"Zrp zrp!\"]','[\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"1\"},{\"name\":\"Holy\",\"percent\":\"1\"},{\"name\":\"Death\",\"percent\":\"10\"},{\"name\":\"Ice\",\"percent\":\"15\"},{\"name\":\"Earth\",\"percent\":\"1\"}]',0,0,0,1,0,0,0,0,1,1,0,19,16,0,'venom','[{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"36500\"},{\"id\":\"11365\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"11364\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"11363\",\"count\":1,\"chance\":\"1000\"}]','[]'),
(19,0,'Ghastly Dragon',0,4600,7800,'{\"type\":351,\"corpse\":11356}',95,0,'[\"EMBRACE MY GIFTS!\",\"I WILL FEAST ON YOUR SOUL!\"]','[\"paralyze\",\"invisible\",\"death\",\"earth\"]','[{\"name\":\"Fire\",\"percent\":\"10\"},{\"name\":\"Ice\",\"percent\":\"50\"}]',0,0,0,1,0,0,0,1,1,1,0,35,45,1,'undead','[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"40500\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"40500\"},{\"id\":\"2148\",\"count\":\"55\",\"chance\":\"40500\"},{\"id\":\"2152\",\"count\":\"2\",\"chance\":\"26500\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"26500\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"20750\"},{\"id\":\"11361\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"11360\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"10250\"},{\"id\":\"11317\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"9810\",\"count\":1,\"chance\":\"5750\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"11303\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"8472\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"11297\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"11298\",\"count\":1,\"chance\":\"900\"},{\"id\":\"11295\",\"count\":1,\"chance\":\"950\"},{\"id\":\"11362\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"11299\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"11221\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"11296\",\"count\":1,\"chance\":\"200\"},{\"id\":\"11349\",\"count\":1,\"chance\":\"500\"},{\"id\":\"11301\",\"count\":1,\"chance\":\"250\"},{\"id\":\"11114\",\"count\":1,\"chance\":\"100\"},{\"id\":\"11234\",\"count\":1,\"chance\":\"150\"}]','[]'),
(20,0,'Wailing Widow',0,450,850,'{\"type\":347,\"corpse\":11305}',30,1,'[\"EMBRACE MY GIFTS!\",\"I WILL FEAST ON YOUR SOUL!\"]','[\"paralyze\",\"invisible\",\"death\",\"earth\"]','[{\"name\":\"Holy\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,1,1,1,0,35,5,1,'venom','[{\"id\":\"2148\",\"count\":\"55\",\"chance\":\"25000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"25000\"},{\"id\":\"2148\",\"count\":\"38\",\"chance\":\"25000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"4900\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"2796\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"11323\",\"count\":1,\"chance\":\"530\"},{\"id\":\"11322\",\"count\":1,\"chance\":\"530\"},{\"id\":\"11317\",\"count\":1,\"chance\":\"880\"}]','[]'),
(21,0,'Battlemaster Zunzu',0,2500,5000,'{\"type\":343,\"corpse\":11278}',100,0,'[]','[\"earth\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"15\"},{\"name\":\"Death\",\"percent\":\"10\"},{\"name\":\"Fire\",\"percent\":\"25\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,1,1,1,0,35,45,0,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"12500\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"12500\"},{\"id\":\"2149\",\"count\":\"10\",\"chance\":\"7000\"},{\"id\":\"11324\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"11298\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"11297\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"11295\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"11325\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"11200\",\"count\":1,\"chance\":\"100000\"}]','[]'),
(22,0,'Mr. Punish',0,400000,150000,'{\"type\":234,\"corpse\":6328}',140,0,'[\"I kept my axe sharp, especially for you!\"]','[\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"10\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"80\"},{\"name\":\"Death\",\"percent\":\"40\"}]',0,0,0,1,0,0,0,0,1,1,0,35,25,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(23,0,'Fluffy',0,400000,150000,'{\"type\":240,\"corpse\":6332}',145,0,'[\"Wooof!\"]','[\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,35,25,1,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(24,0,'morguthis',0,400000,150000,'{\"type\":85,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6025}',180,1,'[\"Vengeance!\",\"I am the supreme warrior!\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"8\"},{\"name\":\"Fire\",\"percent\":\"8\"},{\"name\":\"Energy\",\"percent\":\"8\"}]',0,0,0,1,0,0,0,0,1,1,0,30,35,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[{\"name\":\"hero\",\"chance\":\"8\"}]'),
(25,0,'Colerian The Barbarian',0,400000,150000,'{\"type\":253,\"head\":76,\"body\":115,\"legs\":115,\"feet\":43,\"corpse\":6068}',185,0,'[\"Wooof!\"]','[\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,35,25,1,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(26,0,'Diabolic Imp',0,400000,150000,'{\"type\":237,\"corpse\":6364}',165,1,'[\"Muahaha!\",\"He he he!\"]','[\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"10\"},{\"name\":\"Death\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,15,15,1,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(27,0,'Destroyer',0,400000,150000,'{\"type\":236,\"corpse\":6320}',175,1,'[\"Destructiooooon!\",\"It\'s a good day to destroy!\"]','[\"energy\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Physical\",\"percent\":\"15\"},{\"name\":\"Fire\",\"percent\":\"30\"},{\"name\":\"Death\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,44,39,1,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(28,0,'Deathbringer',0,400000,150000,'{\"type\":231,\"corpse\":6068}',140,0,'[\"YOU FOOLS WILL PAY!\",\"YOU ALL WILL DIE!!\",\"DEATH, DESTRUCTION!\",\"I will eat your soul!\"]','[\"death\",\"energy\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"35\"}]',0,0,0,1,0,0,0,0,1,1,0,45,45,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(29,0,'Cyclops Destroyer',490,400000,150000,'{\"type\":277,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7741}',185,0,'[\"Whack da humy\",\"Outis emoi g\' onoma.\"]','[]','[{\"name\":\"Fire\",\"percent\":\"10\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"8\"}]',1,1,0,1,0,0,0,0,1,1,0,25,24,0,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(30,0,'defiler',0,400000,150000,'{\"type\":238,\"corpse\":6532}',163,0,'[\"Blubb\"]','[\"earth\",\"paralyze\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"15\"},{\"name\":\"Ice\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,15,15,1,'venom','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(31,0,'plaguesmith',0,400000,150000,'{\"type\":247,\"corpse\":6516}',165,1,'[\"You are looking a bit feverish today!\",\"Hachoo!\",\"Cough Cough!\"]','[\"poison\",\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"25\"},{\"name\":\"Ice\",\"percent\":\"15\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,55,55,1,'venom','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(32,0,'Nightmare',0,400000,150000,'{\"type\":245,\"corpse\":6340}',145,1,'[\"Close your eyes... I want to show you something!\",\"I will haunt you forever!\",\"I will make you scream!\"]','[\"death\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Fire\",\"percent\":\"25\"}]',0,0,0,1,0,0,0,1,1,1,0,30,25,1,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(33,0,'Juggernaut',0,8700,20000,'{\"type\":244,\"corpse\":6336}',80,1,'[\"WAHHHH!\",\"RAAARRR!\",\"GRRRRRR!\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"30\"},{\"name\":\"Fire\",\"percent\":\"30\"},{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,70,70,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"5\",\"chance\":\"80000\"},{\"id\":\"2666\",\"count\":\"8\",\"chance\":\"20000\"},{\"id\":\"2672\",\"count\":\"3\",\"chance\":\"36000\"},{\"id\":\"2220\",\"count\":1,\"chance\":\"80000\"},{\"id\":\"2228\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"985\"},{\"id\":\"2452\",\"count\":1,\"chance\":\"650\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"6000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"6900\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"5400\"},{\"id\":\"7452\",\"count\":1,\"chance\":\"3900\"},{\"id\":\"7404\",\"count\":1,\"chance\":\"1900\"},{\"id\":\"5944\",\"count\":\"1\",\"chance\":\"7300\"},{\"id\":\"2434\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"1777\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"8889\",\"count\":1,\"chance\":\"999\"}]','[]'),
(34,0,'Mutated Bat',0,400000,150000,'{\"type\":307,\"corpse\":9829}',163,0,'[\"Shriiiiek\"]','[\"death\",\"earth\",\"drown\",\"invisible\",\"drunk\"]','[]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(35,0,'Earth Elemental',0,400000,150000,'{\"type\":301,\"corpse\":8933}',155,0,'[]','[\"paralyze\",\"invisible\",\"earth\",\"energy\"]','[{\"name\":\"Death\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"20\"},{\"name\":\"Physical\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,30,30,0,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(36,0,'The Handmaiden',0,400000,150000,'{\"type\":230,\"corpse\":6312}',165,1,'[]','[\"energy\",\"fire\",\"earth\",\"poison\",\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,35,25,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[{\"name\":\"Hand of cursed fate\",\"chance\":\"30\"}]'),
(37,0,'Nightstalker',0,400000,150000,'{\"type\":320,\"corpse\":9915}',170,0,'[\"The sunlight is so depressing.\",\"Come with me, my child.\",\"I\'ve been in the shadow under your bed last night.\",\"You never know what hides in the night.\",\"I remember your face - and I know where you sleep\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,0,0,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(38,0,'Spirit of Earth',10,400000,150000,'{\"type\":67,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6005}',180,0,'[]','[\"fire\",\"poison\",\"paralyze\",\"drunk\"]','[]',0,1,0,1,0,0,0,0,1,1,0,32,30,0,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(39,0,'Destroyer Tanker',0,100000,500000,'{\"type\":236,\"corpse\":6320}',90,1,'[]','[\"fire\",\"invisible\"]','[{\"name\":\"Holy\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"25\"}]',0,0,0,1,0,0,0,0,1,1,0,44,39,1,'blood','[{\"id\":\"2160\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"3366\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3414\",\"count\":1,\"chance\":\"100000\"}]','[]'),
(40,0,'Snake War',0,100000,500000,'{\"type\":356,\"corpse\":6068}',90,0,'[]','[\"fire\",\"invisibility\"]','[{\"name\":\"Physical\",\"percent\":\"1\"},{\"name\":\"Holy\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"30\"},{\"name\":\"Ice\",\"percent\":\"15\"},{\"name\":\"Earth\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,19,16,0,'blood','[{\"id\":\"2160\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"3366\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3414\",\"count\":1,\"chance\":\"100000\"}]','[]'),
(41,0,'minishabaal',0,100000,250000,'{\"type\":237,\"corpse\":6364}',240,1,'[\"I had Princess Lumelia as breakfast!\",\"Naaa-Nana-Naaa-Naaa!\",\"My brother will come and get you for this!\",\"Get them Fluffy!\",\"He He He!\",\"Pftt, Ferumbras such an upstart!\",\"My dragon is not that old, it\'s just second hand!\",\"My other dragon is a red one!\",\"When I am big I want to become the ruthless eighth!\",\"WHERE\'S FLUFFY?\",\"Muahaha!\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,25,25,1,'blood','[{\"id\":\"2160\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"3366\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3414\",\"count\":1,\"chance\":\"100000\"}]','[{\"name\":\"Diabolic Imp\",\"chance\":\"40\"}]'),
(42,0,'Demondras',10000,11500,150000,'{\"type\":35,\"corpse\":5995}',28,1,'[\"MUHAHAHAHA!\",\"I SMELL FEEEEEAAAR!\",\"CHAMEK ATH UTHUL ARAK!\",\"Your resistance is futile!\",\"Your soul will be mine!\"]','[\"fire\",\"drown\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,55,1,'fire','[{\"id\":\"2160\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"3900\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"7500\"},{\"id\":\"5906\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"5954\",\"count\":\"1\",\"chance\":\"2345\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"1982\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"4600\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"13000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"4\",\"chance\":\"5500\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"11000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"32000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"2350\"},{\"id\":\"7382\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7393\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"2418\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[{\"name\":\"fire elemental\",\"chance\":\"12\"}]'),
(43,0,'Lizard Chosen',0,100000,500000,'{\"type\":344,\"corpse\":11279}',90,0,'[\"Grzzzzzzz!\"]','[\"earth\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"10\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,0,'blood','[{\"id\":\"2160\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"3366\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3414\",\"count\":1,\"chance\":\"100000\"}]','[]'),
(44,0,'Dragon Sean',0,100000,500000,'{\"type\":47,\"corpse\":6068}',100,0,'[]','[\"earth\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"45\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,0,'blood','[{\"id\":\"2160\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"3366\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3414\",\"count\":1,\"chance\":\"100000\"}]','[]'),
(45,0,'Sean Guard',0,100000,500000,'{\"type\":20,\"corpse\":6068}',110,0,'[\"Grzzzzzzz!\"]','[\"earth\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"45\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,0,'blood','[{\"id\":\"2160\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"3366\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3414\",\"count\":1,\"chance\":\"100000\"}]','[]'),
(46,0,'Legionnaire',0,400000,100000,'{\"type\":309,\"corpse\":6068}',150,0,'[\"Tssss!\"]','[\"earth\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"45\"}]',0,0,0,1,0,0,0,1,1,1,0,105,100,0,'blood','[{\"id\":\"2148\",\"count\":\"76\",\"chance\":\"25500\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"25500\"},{\"id\":\"11328\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"11330\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"11329\",\"count\":1,\"chance\":\"2250\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"11317\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"11298\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"11299\",\"count\":1,\"chance\":\"500\"},{\"id\":\"11295\",\"count\":1,\"chance\":\"450\"},{\"id\":\"2145\",\"count\":1,\"chance\":\"750\"},{\"id\":\"11200\",\"count\":1,\"chance\":\"300\"}]','[]'),
(47,0,'Lizard Zaogun',0,1700,2955,'{\"type\":343,\"corpse\":11278}',100,0,'[]','[\"earth\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"5\"},{\"name\":\"Holy\",\"percent\":\"1\"},{\"name\":\"Death\",\"percent\":\"10\"},{\"name\":\"Fire\",\"percent\":\"45\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,1,1,1,0,35,35,0,'blood','[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"12500\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"12500\"},{\"id\":\"11325\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"11200\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"5881\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2149\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"11324\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"11298\",\"count\":1,\"chance\":\"500\"}]','[]'),
(48,0,'Slick Water Elemental',0,100000,550000,'{\"type\":286,\"corpse\":8965}',130,0,'[\"Blubb\",\"Splipsh Splash\"]','[\"ice\"]','[{\"name\":\"Physical\",\"percent\":\"40\"}]',0,0,0,1,0,0,0,1,1,1,0,70,70,0,'undead','[{\"id\":\"2160\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"3366\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3414\",\"count\":1,\"chance\":\"100000\"}]','[]'),
(49,0,'Crystal Spider',0,100000,400000,'{\"type\":263,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7344}',185,1,'[\"Screeech!\"]','[\"ice\",\"fire\",\"paralyze\",\"drunk\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,500,250,0,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(50,0,'Norgle Glacierbeard',0,100000,400000,'{\"type\":257,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7349}',173,0,'[\"I\'ll extinguish you warmbloods.\",\"REVENGE!\",\"Far too hot.\",\"Revenge is sweetest when served cold.\"]','[\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,500,350,0,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(51,0,'Avalanche',0,100000,550000,'{\"type\":261,\"corpse\":7349}',188,0,'[]','[\"name\",\"name\"]','[{\"name\":\"Fire\",\"percent\":\"30\"}]',0,0,0,1,0,0,0,0,0,0,0,27,26,0,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(52,0,'Chakoya Toolshaper',0,100000,400000,'{\"type\":249,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7320}',175,0,'[\"Chikuva!!\",\"Jinuma jamjam!\"]','[\"energy\"]','[]',0,0,0,1,0,0,0,0,1,1,0,30,30,0,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(53,0,'Drasilla Sean',0,100000,500000,'{\"type\":275,\"corpse\":6068}',175,0,'[\"FCHHHHHHHH!\",\"GROOOOAAAAAAAAR!\"]','[\"fire\",\"poison\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,33,32,0,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(54,0,'Water Sean',0,100000,400000,'{\"type\":286,\"corpse\":6068}',160,0,'[\"Renat Ulderek.\",\"Ikem Rambo Zambo.\"]','[\"fire\",\"poison\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,33,32,0,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(55,0,'Event Zombie',0,280,15000,'{\"type\":311,\"corpse\":9875}',15,0,'[\"Mst.... klll....\",\"Whrrrr... ssss.... mmm.... grrrrl\",\"Dnnnt... cmmm... clsrrr....\",\"Httt.... hmnnsss...\"]','[\"death\",\"energy\",\"ice\",\"earth\",\"lifedrain\",\"paralyze\"]','[]',0,0,0,1,0,0,0,0,1,1,0,10,15,1,'undead','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"52\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2056\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2205\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(56,0,'Acid Blob',0,250,250,'{\"type\":314,\"corpse\":9965}',1,0,'[]','[\"death\",\"earth\"]','[{\"name\":\"Ice\",\"percent\":\"8\"}]',0,0,0,1,0,0,0,0,1,1,0,10,10,0,'venom','[{\"id\":\"9967\",\"count\":\"1\",\"chance\":\"28000\"}]','[{\"name\":\"Acid Blob\",\"chance\":\"8\"}]'),
(57,0,'Crazed Beggar',300,35,100,'{\"type\":153,\"head\":59,\"body\":38,\"legs\":38,\"feet\":97,\"addons\":3,\"corpse\":3058}',1,0,'[\"You are one of THEM! Die!\",\"Wanna buy roses??\"]','[]','[{\"name\":\"Physical\",\"percent\":\"5\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"10\"}]',1,1,1,0,0,0,0,1,1,1,0,16,11,0,'blood','[{\"id\":\"2148\",\"count\":\"9\",\"chance\":\"30000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"19000\"},{\"id\":\"2237\",\"count\":1,\"chance\":\"27000\"},{\"id\":\"2744\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2370\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2690\",\"count\":1,\"chance\":\"11290\"},{\"id\":\"2567\",\"count\":1,\"chance\":\"33000\"},{\"id\":\"1681\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"3500\"}]','[]'),
(58,0,'Medusa',0,4050,4500,'{\"type\":330,\"corpse\":10524}',10,0,'[\"You will ssuch a fine ssstatue!\",\"There isss no chhhanccce of esscape\",\"Are you tired or why are you moving thhat sslow\"]','[\"earth\",\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"60000\"},{\"id\":\"7590\",\"count\":\"2\",\"chance\":\"60000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2536\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"2004\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7887\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7885\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7884\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7413\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"8473\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"2143\",\"count\":\"2\",\"chance\":\"50000\"}]','[]'),
(59,0,'Damaged Worker Golem',0,95,260,'{\"type\":304,\"corpse\":9801}',25,0,'[\"Klonk klonk klonk\",\"Failure! Failire!\",\"Good morning citizen. How may I serve you?\",\"Target identified: Rat! Termination initiated!\"]','[\"invisible\",\"paralyze\"]','[{\"name\":\"Earth\",\"percent\":\"50\"},{\"name\":\"Holy\",\"percent\":\"30\"},{\"name\":\"Physical\",\"percent\":\"40\"},{\"name\":\"Ice\",\"percent\":\"25\"},{\"name\":\"Death\",\"percent\":\"30\"}]',0,0,0,1,0,0,0,0,1,1,0,45,40,1,'undead','[{\"id\":\"8309\",\"count\":\"3\",\"chance\":\"500\"},{\"id\":\"2148\",\"count\":\"83\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5880\",\"count\":1,\"chance\":\"700\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2207\",\"count\":1,\"chance\":\"1500\"}]','[]'),
(60,0,'Death Blob',0,300,320,'{\"type\":315,\"corpse\":9963}',1,0,'[]','[]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,10,10,0,'undead','[{\"id\":\"9968\",\"count\":\"1\",\"chance\":\"18000\"}]','[{\"name\":\"Death Blob\",\"chance\":\"10\"}]'),
(61,0,'Gang Member',420,70,295,'{\"type\":151,\"head\":114,\"body\":19,\"legs\":42,\"feet\":20,\"corpse\":3058}',1,0,'[\"I don\'t like the way you look!\",\"You\'re wearing the wrong colours!\",\"This is our territory!\"]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,16,14,0,'blood','[{\"id\":\"2148\",\"count\":\"23\",\"chance\":\"65000\"},{\"id\":\"2468\",\"count\":1,\"chance\":\"19000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2389\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"38000\"},{\"id\":\"2689\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(62,0,'Gozzler',800,180,240,'{\"type\":313,\"corpse\":9938}',1,1,'[\"Huhuhuhuuu!\",\"Let the fun begin!\",\"Yihahaha!\",\"I\'ll bite you! Nyehehehehe!\"]','[\"invisible\"]','[{\"name\":\"Death\",\"percent\":\"50\"},{\"name\":\"Holy\",\"percent\":\"50\"}]',1,0,0,1,0,0,0,0,1,1,0,20,25,1,'blood','[{\"id\":\"2015\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2148\",\"count\":\"53\",\"chance\":\"100000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2051\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2409\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2146\",\"count\":1,\"chance\":\"300\"}]','[]'),
(63,0,'Haunted Treeling',0,310,450,'{\"type\":310,\"corpse\":9867}',15,0,'[\"Knarrrz\",\"Huuhuuhuuhuuaarrr\",\"Knorrrrrr\"]','[\"earth\"]','[{\"name\":\"Death\",\"percent\":\"1\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Holy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,50,1,'undead','[{\"id\":\"2787\",\"count\":\"2\",\"chance\":\"25000\"},{\"id\":\"2250\",\"count\":\"1\",\"chance\":\"65000\"},{\"id\":\"7443\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2790\",\"count\":\"1\",\"chance\":\"23000\"},{\"id\":\"2148\",\"count\":\"92\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2788\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2146\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"300\"}]','[]'),
(64,0,'Hellspawn',0,2550,3500,'{\"type\":322,\"corpse\":9923}',70,0,'[\"Your fragile bones are like toothpicks to me.\",\"You little weasel will not live to see another day.\",\"I\'m just a messenger of what\'s yet to come.\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"15\"},{\"name\":\"Energy\",\"percent\":\"15\"},{\"name\":\"Fire\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,55,50,1,'blood','[{\"id\":\"2666\",\"count\":\"6\",\"chance\":\"50000\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2148\",\"count\":\"180\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"9970\",\"count\":\"4\",\"chance\":\"1500\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7421\",\"count\":1,\"chance\":\"400\"},{\"id\":\"9948\",\"count\":1,\"chance\":\"400\"},{\"id\":\"9969\",\"count\":1,\"chance\":\"600\"},{\"id\":\"7452\",\"count\":1,\"chance\":\"400\"}]','[]'),
(65,0,'Infernalist',0,4000,3650,'{\"type\":130,\"head\":78,\"body\":76,\"legs\":94,\"feet\":115,\"addons\":2,\"corpse\":6080}',20,0,'[\"Nothing will remain but your scorched bones!\",\"Some like it hot!\",\"Feel the heat of battle!\"]','[\"energy\",\"fire\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"95\"},{\"name\":\"Holy\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,1,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"100000\"},{\"id\":\"8840\",\"count\":\"5\",\"chance\":\"15000\"},{\"id\":\"9971\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"7891\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5904\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7760\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"9980\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"100\"},{\"id\":\"7410\",\"count\":1,\"chance\":\"200\"}]','[{\"name\":\"fire elemental\",\"chance\":\"13\"}]'),
(66,0,'Mad Scientist',0,205,325,'{\"type\":133,\"head\":97,\"body\":0,\"legs\":38,\"feet\":97,\"addons\":1,\"corpse\":6080}',1,0,'[\"Die in the name of Science!\",\"I will study your corpse\",\"You will regret interrupting my studies!\",\"Let me test this!\"]','[\"drown\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"10\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Holy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,20,25,1,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2787\",\"count\":\"3\",\"chance\":\"1500\"},{\"id\":\"2308\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2687\",\"count\":\"5\",\"chance\":\"400\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7762\",\"count\":\"1\",\"chance\":\"800\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"1600\"},{\"id\":\"6324\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2190\",\"count\":1,\"chance\":\"100\"},{\"id\":\"7440\",\"count\":1,\"chance\":\"250\"}]','[]'),
(67,0,'Mercury Blob',0,180,150,'{\"type\":316,\"corpse\":9964}',1,0,'[\"Crackle\"]','[\"death\"]','[{\"name\":\"Fire\",\"percent\":\"15\"},{\"name\":\"Earth\",\"percent\":\"70\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Physical\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"75\"}]',0,0,0,1,0,0,0,0,1,1,0,10,10,0,'undead','[{\"id\":\"9966\",\"count\":\"1\",\"chance\":\"35000\"}]','[{\"name\":\"Mercury Blob\",\"chance\":\"10\"}]'),
(68,0,'Mutated Rat',0,450,550,'{\"type\":305,\"corpse\":9871}',13,0,'[\"Grrrrrrrrrrrrrr!\",\"Fcccccchhhhhh\"]','[\"death\",\"earth\",\"paralyze\",\"lifedrain\",\"drunk\",\"drown\",\"invisible\"]','[{\"name\":\"Holy\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'blood','[{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"100000\"},{\"id\":\"2320\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2335\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2799\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"7618\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2510\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"8900\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"200\"}]','[]'),
(69,0,'Mutated Human',0,150,240,'{\"type\":323,\"corpse\":9107}',13,0,'[\"Take that creature off my back!! I can fell it!\",\"HEEEEEEEELP!\",\"You will be the next infected one... GRAAAAAAAAARRR!\",\"Science... is a curse.\",\"Run as fast as you can.\",\"Oh by the gods! What is this... aaaaaargh!\"]','[\"death\",\"earth\",\"paralyze\",\"lifedrain\",\"drunk\",\"drown\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'blood','[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"3976\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2671\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2226\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2484\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"2801\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2406\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2161\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7910\",\"count\":1,\"chance\":\"700\"}]','[]'),
(70,0,'Mutated Tiger',0,750,1100,'{\"type\":318,\"corpse\":9913}',13,0,'[\"GRAAARRRRRR\",\"CHHHHHHHHHHH\"]','[\"paralyze\",\"drunk\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"20\"},{\"name\":\"Earth\",\"percent\":\"80\"}]',0,0,0,1,0,0,0,1,1,1,0,35,35,1,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2509\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"\",\"count\":\"2\",\"chance\":\"8000\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"7454\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"7436\",\"count\":1,\"chance\":\"250\"}]','[]'),
(71,0,'The Mutated Pumpkin',0,30000,100000,'{\"type\":292,\"corpse\":8960}',1,0,'[\"I had the Halloween Hare for breakfast!\",\"Your soul will be mine...wait, wrong line\",\"Trick or treat? I saw death!\",\"No wait! Don\'t kill me! It\'s me, your friend!\",\"Bunnies, bah! I\'m the real thing!\",\"Muahahahaha!\",\"I\'ve come to avenge all those mutilated pumpkins!\",\"Wait until I get you!\",\"Fear the spirit of Halloween!\"]','[\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,1,1,1,'fire','[{\"id\":\"9006\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"3976\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"8860\",\"count\":1,\"chance\":\"9666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"6492\",\"count\":1,\"chance\":\"8666\"},{\"id\":\"6524\",\"count\":1,\"chance\":\"9633\"}]','[]'),
(72,0,'Nightmare Scion',0,1350,1400,'{\"type\":321,\"corpse\":9919}',70,1,'[\"Weeeheeheee!\"]','[\"earth\",\"death\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"45\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,1,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"1500\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"24000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"12000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"37500\"},{\"id\":\"6574\",\"count\":1,\"chance\":\"200\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"5500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2491\",\"count\":1,\"chance\":\"800\"},{\"id\":\"8871\",\"count\":1,\"chance\":\"250\"},{\"id\":\"7451\",\"count\":1,\"chance\":\"100\"}]','[]'),
(73,0,'Vampire Bride',0,1050,1200,'{\"type\":312,\"corpse\":9660}',23,0,'[\"Kneel before your Mistress!\",\"Dead is the new alive.\",\"Come, let me kiss you, darling. Oh wait, I meant kill.\",\"Enjoy the pain - I know you love it.\"]','[\"death\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"10\"},{\"name\":\"Earth\",\"percent\":\"80\"},{\"name\":\"Ice\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,23,17,1,'blood','[{\"id\":\"2148\",\"count\":\"84\",\"chance\":\"100000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"8500\"},{\"id\":\"2145\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2127\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2186\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"9837\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"5670\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"300\"}]','[]'),
(74,0,'War Golem',0,2550,4300,'{\"type\":326,\"corpse\":10005}',25,1,'[\"Azerus barada nikto!\",\"Klonk klonk klonk\",\"Engaging Enemy!\",\"Threat level processed.\",\"Charging weapon systems!\",\"Auto repair in progress.\",\"The battle is joined!\",\"Termination initialized!\",\"Rrrtttarrrttarrrtta\"]','[\"invisible\",\"paralyze\"]','[{\"name\":\"Earth\",\"percent\":\"50\"},{\"name\":\"Holy\",\"percent\":\"30\"},{\"name\":\"Fire\",\"percent\":\"45\"},{\"name\":\"Energy\",\"percent\":\"25\"},{\"name\":\"Physical\",\"percent\":\"40\"},{\"name\":\"Ice\",\"percent\":\"25\"},{\"name\":\"Death\",\"percent\":\"30\"}]',0,0,0,1,0,0,0,0,1,1,0,45,40,1,'undead','[{\"id\":\"8309\",\"count\":\"5\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"170\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7893\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"9980\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"700\"},{\"id\":\"5880\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"7403\",\"count\":1,\"chance\":\"2350\"},{\"id\":\"7422\",\"count\":1,\"chance\":\"1111\"}]','[]'),
(75,0,'Werewolf',0,1450,1955,'{\"type\":308,\"corpse\":6080}',50,0,'[\"BLOOD!\",\"HRAAAAAAAAAARRRRRR!\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"10\"},{\"name\":\"Energy\",\"percent\":\"5\"},{\"name\":\"Earth\",\"percent\":\"5\"},{\"name\":\"Death\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,55,50,1,'blood','[{\"id\":\"2148\",\"count\":\"96\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"84\",\"chance\":\"100000\"},{\"id\":\"5897\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2805\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"9809\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"7439\",\"count\":1,\"chance\":\"800\"},{\"id\":\"7419\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7383\",\"count\":1,\"chance\":\"300\"}]','[{\"name\":\"war wolf\",\"chance\":\"100\"},{\"name\":\"war wolf\",\"chance\":\"100\"},{\"name\":\"war wolf\",\"chance\":\"100\"}]'),
(76,0,'zombie',0,280,500,'{\"type\":311,\"corpse\":9875}',1,0,'[\"Mst.... klll....\",\"Whrrrr... ssss.... mmm.... grrrrl\",\"Dnnnt... cmmm... clsrrr....\",\"Httt.... hmnnsss...\"]','[\"death\",\"energy\",\"ice\",\"earth\",\"lifedrain\",\"paralyze\"]','[]',0,0,0,1,0,0,0,0,1,1,0,10,15,1,'undead','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"52\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2056\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2205\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(77,0,'Pythius the rotten',0,100,8350,'{\"type\":231,\"corpse\":6306}',40,0,'[\"YOU\'LL NEVER GET MY TREASURE!\"]','[\"death\",\"earth\",\"fire\",\"drown\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"10\"},{\"name\":\"Ice\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,30,35,1,'undead','[]','[{\"name\":\"Undead Gladiator\",\"chance\":\"8\"}]'),
(78,0,'Lavahole',0,1200,9950,'{\"typeEx\":389}',1,0,'[]','[\"physical\",\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,0,0,0,0,1,1,0,0,1,1,1,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"}]','[]'),
(79,0,'Yalahari',0,5,150,'{\"type\":309,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6080}',24,0,'[\"Welcome to Yalahar, outsider.\",\"Our wisdom and knowledge are unequalled in this world.\",\"One day Yalahar will return to its former glory.\",\"That knowledge would overburden your fragile mind.\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"25\"},{\"name\":\"Ice\",\"percent\":\"20\"},{\"name\":\"Fire\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"20\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Physical\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,20,30,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"}]','[]'),
(80,0,'Diseased Dan',0,300,2000,'{\"type\":299,\"corpse\":8951}',15,0,'[\"Tchhh!\",\"Slurp!\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"30\"},{\"name\":\"Death\",\"percent\":\"5\"},{\"name\":\"Fire\",\"percent\":\"85\"}]',0,0,0,1,0,0,0,1,1,1,0,15,10,0,'venom','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"59\",\"chance\":\"100000\"},{\"id\":\"8472\",\"count\":1,\"chance\":\"5100\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"4900\"},{\"id\":\"8873\",\"count\":1,\"chance\":\"600\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"8912\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"8873\",\"count\":1,\"chance\":\"500\"},{\"id\":\"8891\",\"count\":1,\"chance\":\"300\"}]','[]'),
(81,0,'bandit',450,65,245,'{\"type\":129,\"head\":58,\"body\":59,\"legs\":45,\"feet\":114,\"corpse\":6080}',1,0,'[\"Your money or your life!\",\"Hand me your purse!\"]','[]','[]',1,1,1,1,0,0,0,1,1,1,0,15,11,0,'blood','[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"100000\"},{\"id\":\"2388\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2787\",\"count\":\"2\",\"chance\":\"20000\"}]','[]'),
(82,0,'Seagull',250,0,25,'{\"type\":223,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6076}',1,0,'[]','[]','[]',1,0,1,0,0,0,0,1,1,1,0,5,5,0,'blood','[]','[]'),
(83,0,'Undead Gladiator',0,800,1000,'{\"type\":306,\"corpse\":5527}',15,0,'[]','[\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"100\"},{\"name\":\"Earth\",\"percent\":\"50\"},{\"name\":\"Energy\",\"percent\":\"40\"},{\"name\":\"Death\",\"percent\":\"35\"}]',0,0,0,1,0,0,0,0,1,1,0,35,25,1,'blood','[{\"id\":\"2148\",\"count\":\"76\",\"chance\":\"100000\"},{\"id\":\"2671\",\"count\":\"5\",\"chance\":\"33333\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"2066\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"9999\"},{\"id\":\"6500\",\"count\":\"3\",\"chance\":\"4555\"},{\"id\":\"2557\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2558\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"5801\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"5480\",\"count\":1,\"chance\":\"1666\"}]','[]'),
(84,0,'The Incendier',0,2900,25600,'{\"type\":243,\"corpse\":6324}',40,0,'[]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"100\"},{\"name\":\"Energy\",\"percent\":\"40\"},{\"name\":\"Physical\",\"percent\":\"24\"},{\"name\":\"Death\",\"percent\":\"22\"}]',0,0,0,1,0,0,0,0,1,1,0,40,35,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2147\",\"count\":\"4\",\"chance\":\"8888\"},{\"id\":\"7894\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"7899\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"4222\"},{\"id\":\"2239\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"7666\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"40111\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"20111\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"9800\"},{\"id\":\"2145\",\"count\":\"8\",\"chance\":\"15000\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"13550\"}]','[]'),
(85,0,'Bones',0,3750,9500,'{\"type\":231,\"corpse\":6306}',40,0,'[\"Your new name is breakfast.\",\"Keep that dog away!\",\"Out Fluffy! Out! Bad dog!\"]','[\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,55,50,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"50000\"},{\"id\":\"5741\",\"count\":\"1\",\"chance\":\"50000\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"6570\",\"count\":\"3\",\"chance\":\"5538\"},{\"id\":\"6571\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"4851\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2207\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7430\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"4000\"}]','[{\"name\":\"\",\"chance\":\"\"}]'),
(86,0,'Grynch Clan Goblin',0,4,80,'{\"type\":61,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6002}',90,1,'[\"T\'was not me hand in your pocket!\",\"Look! Cool stuff in house. Let\'s get it!\",\"Uhh! Nobody home!\",\"Me just borrowed it!\",\"Me no steal! Me found it!\",\"Me had it for five minutes. It\'s family heirloom now!\",\"Nice human won\'t hurt little, good goblin?\",\"Gimmegimme!\",\"Invite me in you lovely house plx!\",\"Other Goblin stole it!\",\"All presents mine!\",\"Me got ugly ones purse\",\"Free itans plz!\",\"Not me! Not me!\",\"Guys, help me here! Guys? Guys???\",\"That only much dust in me pocket! Honest!\",\"Can me have your stuff?\",\"Halp, Big dumb one is after me!\",\"Uh, So many shiny things!\",\"Utani hur hur hur!\",\"Mee? Stealing? Never!!!\",\"Oh what fun it is to steal a one-horse open sleigh!\",\"Must have it! Must have it!\",\"Where me put me lockpick?\",\"Catch me if you can!\"]','[\"fire\",\"invisible\"]','[]',0,0,0,0,0,0,0,1,0,1,0,12,10,0,'blood','[{\"id\":\"2148\",\"count\":\"16\",\"chance\":\"100000\"},{\"id\":\"2676\",\"count\":\"100\",\"chance\":\"1050\"},{\"id\":\"6501\",\"count\":\"2\",\"chance\":\"13256\"},{\"id\":\"2675\",\"count\":\"3\",\"chance\":\"13256\"},{\"id\":\"2687\",\"count\":\"5\",\"chance\":\"13256\"},{\"id\":\"2679\",\"count\":\"4\",\"chance\":\"13256\"},{\"id\":\"2674\",\"count\":\"3\",\"chance\":\"13256\"},{\"id\":\"2678\",\"count\":\"19\",\"chance\":\"1050\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2695\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2688\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"6394\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"6393\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2111\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"6497\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"6277\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1988\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2163\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"4839\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1852\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2172\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2661\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"5890\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"5894\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"5902\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"6091\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2551\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5792\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2560\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1684\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"4873\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2102\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2159\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5900\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"5022\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2160\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2534\",\"count\":1,\"chance\":\"500\"}]','[]'),
(87,0,'Hacker',0,45,430,'{\"type\":8,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5980}',15,1,'[\"Feel the wrath of me dos attack!\",\"You\'re next!\",\"Gimme free gold!\",\"Me sooo smart!\",\"Me have a cheating link for you!\",\"Me is GM!\",\"Gimme your password!\",\"Me just need the code!\",\"Me not stink!\",\"Me other char is highlevel!\"]','[\"energy\",\"fire\",\"poison\",\"drunk\"]','[]',0,0,0,1,0,0,0,1,1,1,0,12,15,1,'blood','[{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2671\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"6570\",\"count\":1,\"chance\":\"5538\"},{\"id\":\"6571\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"5000\"}]','[]'),
(88,0,'Primitive',0,45,200,'{\"type\":143,\"head\":1,\"body\":1,\"legs\":1,\"feet\":1,\"corpse\":6080}',40,0,'[\"We don\'t need a future!\",\"I\'ll rook you all!\",\"They thought they\'d beaten us!\",\"You are history!\",\"There can only be one world!\",\"Valor who?\",\"Die noob!\",\"There are no dragons!\",\"I\'ll quit forever! Again ...\",\"You all are noobs!\",\"Beware of the cyclops!\",\"Just had a disconnect.\",\"Magic is only good for girls!\",\"We\'ll be back!\"]','[\"energy\",\"fire\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,25,20,1,'blood','[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2482\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2526\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"6570\",\"count\":1,\"chance\":\"5538\"},{\"id\":\"6571\",\"count\":1,\"chance\":\"1538\"}]','[{\"name\":\"\",\"chance\":\"\"}]'),
(89,0,'Tibia Bug',250,50,270,'{\"type\":45,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5990}',10,0,'[\"My father was a year 2k bug.\",\"Psst, I\'ll make you rich.\",\"You are bugged ... by me!\"]','[\"energy\",\"fire\",\"drunk\"]','[]',1,1,1,0,0,0,0,0,1,1,0,15,10,0,'venom','[{\"id\":\"2148\",\"count\":\"11\",\"chance\":\"100000\"},{\"id\":\"6570\",\"count\":1,\"chance\":\"5538\"},{\"id\":\"6571\",\"count\":1,\"chance\":\"1538\"}]','[{\"name\":\"tibia bug\",\"chance\":\"15\"}]'),
(90,0,'Undead Minion',620,550,850,'{\"type\":37,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5963}',5,0,'[]','[\"fire\",\"poison\",\"lifedrain\",\"drunk\"]','[]',0,1,0,1,0,0,0,0,1,1,0,25,25,1,'undead','[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"6570\",\"count\":1,\"chance\":\"5538\"},{\"id\":\"6571\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"5000\"}]','[]'),
(91,0,'amazon',390,60,110,'{\"type\":137,\"head\":113,\"body\":120,\"legs\":114,\"feet\":132,\"corpse\":6081}',1,0,'[\"Yeeee ha!\",\"Your head shall be mine!\"]','[]','[]',1,1,0,1,0,0,0,1,1,1,0,12,12,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2691\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(92,0,'valkyrie',450,85,190,'{\"type\":139,\"head\":113,\"body\":57,\"legs\":95,\"feet\":113,\"corpse\":6081}',1,0,'[\"Another head for me!\",\"Stand still!\",\"One more head for me!\",\"Head off!\"]','[]','[{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Holy\",\"percent\":\"7\"},{\"name\":\"Fire\",\"percent\":\"10\"}]',1,1,0,1,0,0,0,1,1,1,0,14,16,0,'blood','[{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2674\",\"count\":\"4\",\"chance\":\"10000\"},{\"id\":\"3965\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2147\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2145\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1800\"}]','[]'),
(93,0,'Xenia',450,255,290,'{\"type\":139,\"head\":113,\"body\":57,\"legs\":95,\"feet\":113,\"corpse\":6081}',1,0,'[\"Stand still!\",\"One more head for me!\",\"Head off!\"]','[]','[{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Fire\",\"percent\":\"10\"},{\"name\":\"Holy\",\"percent\":\"7\"}]',0,1,0,1,0,0,0,1,1,1,0,20,20,0,'blood','[{\"id\":\"2148\",\"count\":\"42\",\"chance\":\"100000\"},{\"id\":\"2420\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"29000\"}]','[]'),
(94,0,'Master Vip Warlock',0,6700,3500,'{\"type\":130,\"head\":19,\"body\":71,\"legs\":128,\"feet\":128,\"addons\":1,\"corpse\":6080}',23,0,'[\"Learn the secret of our magic! YOUR death!\",\"Even a rat is a better mage than you.\",\"We don\'t like intruders!\"]','[\"energy\",\"fire\",\"ice\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"90\"}]',0,0,0,1,0,0,0,1,1,1,0,20,20,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"200\"},{\"id\":\"1986\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2600\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2689\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2151\",\"count\":\"2\",\"chance\":\"1900\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"80000\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"1900\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"2900\"},{\"id\":\"2679\",\"count\":\"4\",\"chance\":\"26000\"},{\"id\":\"2047\",\"count\":1,\"chance\":\"19000\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2792\",\"count\":\"5\",\"chance\":\"6666\"},{\"id\":\"2793\",\"count\":\"2\",\"chance\":\"6666\"},{\"id\":\"2656\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7898\",\"count\":1,\"chance\":\"2444\"},{\"id\":\"7895\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"2111\"},{\"id\":\"2123\",\"count\":1,\"chance\":\"2000\"}]','[{\"name\":\"stone golem\",\"chance\":\"10\"}]'),
(95,0,'Master Vip Hydra',0,4700,2850,'{\"type\":121,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6048}',10,0,'[\"MORRE DIABO!\",\"HISSSS\"]','[\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,35,25,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"65000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"90000\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"5000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"4850\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"4000\"},{\"id\":\"2536\",\"count\":1,\"chance\":\"555\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[]'),
(96,0,'Master Vip Medusa',0,7000,4500,'{\"type\":330,\"corpse\":10524}',10,0,'[\"You will ssuch a fine ssstatue!\",\"There isss no chhhanccce of esscape\",\"Are you tired or why are you moving thhat sslow\"]','[\"earth\",\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"60000\"},{\"id\":\"7590\",\"count\":\"2\",\"chance\":\"60000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2536\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"2004\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"2\",\"chance\":\"60000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7887\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"7885\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7884\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7413\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"6100\"},{\"id\":\"8473\",\"count\":\"2\",\"chance\":\"60000\"},{\"id\":\"2143\",\"count\":\"2\",\"chance\":\"60000\"}]','[]'),
(97,0,'Master Vip Grim Reaper',0,7700,4800,'{\"type\":300,\"corpse\":8955}',75,0,'[\"MORRE DIABO!\",\"Come a little closer!\",\"The end is near!\"]','[\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"10\"},{\"name\":\"Ice\",\"percent\":\"5\"},{\"name\":\"Death\",\"percent\":\"30\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'undead','[{\"id\":\"2148\",\"count\":\"98\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"40000\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2150\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"18500\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"7800\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"3300\"},{\"id\":\"5909\",\"count\":\"1\",\"chance\":\"3800\"},{\"id\":\"2521\",\"count\":1,\"chance\":\"8500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5022\",\"count\":\"4\",\"chance\":\"40000\"},{\"id\":\"8889\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"7418\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"8500\"},{\"id\":\"8910\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"8777\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[]'),
(98,0,'Master Vip Frost Dragon',390,6000,2250,'{\"type\":248,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7091}',20,0,'[\"MORRE DIABO!\",\"HISSSS\"]','[\"ice\",\"fire\",\"earth\",\"paralyze\",\"lifedrain\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,1,1,1,0,45,45,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2672\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"2500\"},{\"id\":\"2547\",\"count\":\"10\",\"chance\":\"2222\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"2222\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"7402\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"3300\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"3300\"}]','[]'),
(99,0,'Master Vip Demon',10000,9000,9000,'{\"type\":35,\"corpse\":5995}',28,1,'[\"MORRE DIABO!\",\"I SMELL FEEEEEAAAR!\",\"CHAMEK ATH UTHUL ARAK!\",\"Your resistance is futile!\",\"Your soul will be mine!\"]','[\"fire\",\"drown\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,55,1,'fire','[{\"id\":\"6300\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2003\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"3900\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"4600\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"13000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"4\",\"chance\":\"5500\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"11000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"32000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"2350\"},{\"id\":\"7393\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[{\"name\":\"fire elemental\",\"chance\":\"12\"}]'),
(100,0,'Master Boss',0,20000,75000,'{\"type\":12,\"head\":95,\"body\":95,\"legs\":95,\"feet\":95,\"addons\":3,\"corpse\":5527}',140,1,'[\"The Power of The Baiak Server!\",\"OMG You Is Noob !! MUAHAHAHAHAHAHAHA!\"]','[\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"90\"}]',0,0,0,1,0,0,0,1,1,1,0,120,100,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"16060\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"7500\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"5600\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"10518\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"4\",\"chance\":\"12000\"},{\"id\":\"5903\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"15000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2415\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"12610\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"8925\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2352\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"12609\",\"count\":1,\"chance\":\"2500\"}]','[{\"name\":\"Master Vip Demon\",\"chance\":\"20\"}]'),
(101,0,'carrion worm',280,70,145,'{\"type\":192,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6069}',1,0,'[]','[]','[{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"5\"}]',0,1,0,0,0,0,0,0,1,1,0,13,13,0,'blood','[{\"id\":\"2148\",\"count\":\"49\",\"chance\":\"100000\"},{\"id\":\"3976\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1200\"}]','[]'),
(102,0,'Rotworm',305,100,65,'{\"type\":26,\"corpse\":5967}',1,0,'[]','[]','[]',0,1,0,0,0,0,0,0,1,1,0,11,8,0,'blood','[{\"id\":\"2148\",\"count\":\"88\",\"chance\":\"80750\"},{\"id\":\"3976\",\"count\":\"5\",\"chance\":\"50000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"18000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"80000\"},{\"id\":\"2480\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2412\",\"count\":1,\"chance\":\"5000\"}]','[]'),
(103,0,'Rotworm Queen',0,85,105,'{\"type\":295,\"corpse\":8947}',1,0,'[\"...\"]','[]','[]',0,0,0,0,0,0,0,0,1,1,0,15,10,0,'blood','[{\"id\":\"2148\",\"count\":\"86\",\"chance\":\"100000\"},{\"id\":\"3976\",\"count\":\"47\",\"chance\":\"25000\"}]','[{\"name\":\"Rotworm\",\"chance\":\"10\"}]'),
(104,0,'kongra',0,115,340,'{\"type\":116,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6043}',1,1,'[\"Hugah!\",\"Ungh! Ungh!\",\"Huaauaauaauaa!\"]','[]','[{\"name\":\"Fire\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"10\"},{\"name\":\"Energy\",\"percent\":\"5\"}]',0,0,0,1,0,0,0,1,1,1,0,14,18,0,'blood','[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"1294\",\"count\":\"3\",\"chance\":\"2500\"},{\"id\":\"5883\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2676\",\"count\":\"11\",\"chance\":\"5000\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"4300\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1667\"}]','[]'),
(105,0,'Hairman the huge',0,335,600,'{\"type\":116,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6043}',5,1,'[\"Hugah!\",\"Ungh! Ungh!\",\"Huaauaauaauaa!\"]','[\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"10\"},{\"name\":\"Fire\",\"percent\":\"20\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"5\"}]',0,0,0,1,0,0,0,0,1,1,0,25,20,1,'blood','[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"100000\"},{\"id\":\"5883\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2676\",\"count\":\"2\",\"chance\":\"7000\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"9300\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"5000\"}]','[]'),
(106,0,'merlkin',0,145,230,'{\"type\":117,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6044}',1,0,'[\"Ugh! Ugh! Ugh!\",\"Holy banana!\",\"Chakka! Chakka!\"]','[\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"10\"},{\"name\":\"Holy\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,10,16,0,'blood','[{\"id\":\"2148\",\"count\":\"62\",\"chance\":\"100000\"},{\"id\":\"2150\",\"count\":\"1\",\"chance\":\"1538\"},{\"id\":\"2675\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"5883\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2676\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"3966\",\"count\":1,\"chance\":\"2333\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"3038\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"6222\"}]','[]'),
(107,0,'sibang',0,115,225,'{\"type\":118,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6045}',1,1,'[\"Eeeeek! Eeeeek\",\"Huh! Huh! Huh!\",\"Ahhuuaaa!\"]','[\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"25\"},{\"name\":\"Holy\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,12,15,0,'blood','[{\"id\":\"2678\",\"count\":\"5\",\"chance\":\"3000\"},{\"id\":\"5883\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2675\",\"count\":\"5\",\"chance\":\"6667\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2682\",\"count\":1,\"chance\":\"6980\"},{\"id\":\"1294\",\"count\":\"3\",\"chance\":\"3500\"}]','[]'),
(108,0,'giant spider',0,900,1300,'{\"type\":38,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":5977}',25,1,'[]','[\"earth\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'VENOM','[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"100000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"5879\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"7901\",\"count\":1,\"chance\":\"1777\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2545\",\"count\":\"13\",\"chance\":\"8000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"2900\"}]','[{\"name\":\"poison spider\",\"chance\":\"20\"}]'),
(109,0,'poison spider',270,22,26,'{\"type\":36,\"corpse\":5974}',1,0,'[]','[\"earth\"]','[]',1,1,1,0,0,0,0,1,1,1,0,6,2,0,'VENOM','[{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"80000\"}]','[]'),
(110,0,'scorpion',310,45,45,'{\"type\":43,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5988}',1,0,'[]','[\"earth\"]','[{\"name\":\"Energy\",\"percent\":\"20\"}]',1,1,1,0,0,0,0,1,1,1,0,5,10,0,'VENOM','[]','[]'),
(111,0,'spider',210,12,20,'{\"type\":30,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5961}',1,0,'[]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,2,2,0,'VENOM','[{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"90000\"}]','[]'),
(112,0,'tarantula',485,120,225,'{\"type\":219,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6060}',30,1,'[]','[]','[{\"name\":\"Earth\",\"percent\":\"100\"},{\"name\":\"Energy\",\"percent\":\"10\"}]',1,1,0,1,0,0,0,0,1,1,0,17,15,0,'VENOM','[{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"100000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"2800\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"1000\"}]','[]'),
(113,0,'The Old Widow',0,2800,3200,'{\"type\":208,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5977}',50,1,'[]','[\"earth\",\"fire\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,33,30,1,'venom','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"40000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"5879\",\"count\":\"1\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2457\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"8000\"}]','[{\"name\":\"giant spider\",\"chance\":\"13\"}]'),
(114,0,'Achad',0,70,185,'{\"type\":146,\"head\":93,\"body\":93,\"legs\":57,\"feet\":97,\"addons\":3,\"corpse\":7349}',1,0,'[]','[]','[]',0,0,0,1,0,0,0,1,0,0,0,19,20,0,'blood','[]','[]'),
(115,0,'Axeitus Headbanger',0,140,365,'{\"type\":71,\"corpse\":7349}',1,0,'[]','[]','[]',0,0,0,1,0,0,0,0,0,0,0,17,15,0,'blood','[]','[]'),
(116,0,'Bloodpaw',0,50,100,'{\"type\":42,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7349}',1,0,'[]','[]','[]',0,0,0,0,0,0,0,0,0,0,0,8,3,0,'blood','[]','[]'),
(117,0,'Bovinus',0,60,150,'{\"type\":25,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7349}',1,0,'[]','[]','[]',0,0,0,0,0,0,0,0,0,0,0,11,9,0,'blood','[]','[]'),
(118,0,'Cursed Gladiator',0,215,435,'{\"type\":100,\"corpse\":7349}',1,0,'[\"Death where are you?\"]','[\"name\",\"name\"]','[]',0,0,0,1,0,0,0,0,0,0,0,26,25,0,'undead','[]','[]'),
(119,0,'Frostfur',0,35,65,'{\"type\":52,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7349}',1,0,'[]','[]','[]',0,0,0,0,0,0,0,0,0,0,0,3,2,0,'blood','[]','[]'),
(120,0,'Orcus the Cruel',0,280,480,'{\"type\":59,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7349}',5,0,'[]','[\"name\",\"name\"]','[]',0,0,0,1,0,0,0,0,0,0,0,40,39,0,'blood','[]','[]'),
(121,0,'Rocky',0,190,250,'{\"type\":95,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7349}',1,0,'[]','[\"name\",\"name\"]','[]',0,0,0,1,0,0,0,1,0,0,0,30,30,0,'undead','[]','[]'),
(122,0,'The Hairy One',0,115,325,'{\"type\":116,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7349}',10,0,'[\"Hugah!\"]','[]','[]',0,0,0,0,0,0,0,0,0,0,0,5,3,0,'blood','[]','[]'),
(123,0,'Kreebosh the Exile',0,350,880,'{\"type\":103,\"corpse\":7349}',25,0,'[]','[\"name\",\"name\",\"name\",\"name\",\"name\"]','[]',0,0,0,1,0,0,0,1,0,0,0,40,30,0,'blood','[]','[{\"name\":\"Green Djinn\",\"chance\":\"20\"}]'),
(124,0,'Slim',0,580,1025,'{\"type\":101,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7349}',1,0,'[\"Knooorrr!\"]','[\"poison\",\"paralyze\"]','[]',0,0,0,1,0,0,0,0,1,1,0,38,36,0,'undead','[]','[]'),
(125,0,'Spirit of Fire',0,950,2140,'{\"type\":242,\"corpse\":7349}',1,0,'[]','[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,25,25,1,'blood','[]','[]'),
(126,0,'Spirit of Water',0,850,1430,'{\"type\":11,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7349}',1,0,'[]','[\"fire\",\"poison\",\"paralyze\",\"invisible\"]','[]',0,0,0,0,0,0,0,0,1,1,0,0,0,0,'undead','[]','[]'),
(127,0,'The Dark Dancer',0,435,805,'{\"type\":58,\"corpse\":7349}',1,0,'[]','[\"name\",\"name\",\"name\",\"name\",\"name\"]','[]',0,0,0,1,0,0,0,0,1,1,0,12,11,0,'blood','[]','[{\"name\":\"Ghoul\",\"chance\":\"20\"}]'),
(128,0,'The Hag',0,510,715,'{\"type\":264,\"head\":78,\"body\":97,\"legs\":95,\"feet\":95,\"corpse\":7349}',1,0,'[\"If you think I am to old to fight then you\'re wrong!\",\"I\'ve forgotten more things then you have ever learned!\",\"Let me teach you a few things youngster!\",\"I\'ll teach you respect for the old!\"]','[\"name\"]','[]',0,0,0,1,0,0,0,0,0,0,0,25,24,0,'blood','[]','[{\"name\":\"Ghost\",\"chance\":\"26\"},{\"name\":\"Crypt Shambler\",\"chance\":\"26\"}]'),
(129,0,'Darakan the Executioner',0,1600,3500,'{\"type\":255,\"head\":78,\"body\":114,\"legs\":114,\"feet\":114,\"corpse\":7349}',1,0,'[\"FIGHT LIKE A BARBARIAN!\",\"VICTORY IS MINE!\",\"I AM your father!\",\"To be the man you have to beat the man!\"]','[\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"33\"}]',0,0,0,1,0,0,0,0,1,1,0,31,30,0,'blood','[]','[]'),
(130,0,'Fallen Mooh\'tah Master Ghar',0,4400,8000,'{\"type\":29,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7349}',33,0,'[\"I will finish you!\",\"You are no match for a master of the Mooh\'Tha!\"]','[]','[]',0,0,0,1,0,0,0,0,1,1,0,40,30,0,'blood','[]','[]'),
(131,0,'Gnorre Chyllson',0,4000,7100,'{\"type\":251,\"head\":11,\"body\":9,\"legs\":11,\"feet\":85,\"addons\":1,\"corpse\":7349}',80,0,'[\"I am like the merciless northwind\",\"Snow will be your death shroud.\"]','[\"earth\",\"ice\",\"fire\",\"paralyze\",\"invisible\"]','[{\"name\":\"Holy\",\"percent\":\"25\"}]',0,0,0,1,0,0,0,0,1,1,0,30,35,0,'blood','[]','[]'),
(132,0,'Svoren the Mad',0,3000,6300,'{\"type\":254,\"head\":80,\"body\":99,\"legs\":118,\"feet\":38,\"corpse\":7349}',20,0,'[\"NO mommy NO. Leave me alone!\"]','[\"energy\",\"fire\",\"poison\"]','[]',0,0,0,1,0,0,0,0,1,1,0,35,45,0,'blood','[]','[]'),
(133,0,'The Masked Marauder',0,3500,6800,'{\"type\":234,\"corpse\":7349}',15,0,'[\"Didn\'t you leave your house door open?\",\"Oops, your shoelaces are open!\"]','[\"fire\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,35,45,1,'blood','[]','[]'),
(134,0,'The Obliverator',0,6000,10500,'{\"type\":35,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7349}',30,0,'[\"NO ONE WILL BEAT ME!\"]','[\"fire\",\"invisible\"]','[{\"name\":\"Death\",\"percent\":\"15\"},{\"name\":\"Energy\",\"percent\":\"50\"}]',0,0,0,1,0,0,0,0,1,1,0,45,40,0,'fire','[]','[{\"name\":\"fire elemental\",\"chance\":\"25\"}]'),
(135,0,'The Pit Lord',0,2500,4500,'{\"type\":55,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7349}',30,1,'[\"I\'LL GET YOU ALL!\",\"I won\'t let you escape!\",\"I\'ll crush you beneath my feet!\"]','[\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"80\"}]',0,0,0,1,0,0,0,0,1,1,0,44,60,0,'blood','[]','[]'),
(136,0,'Webster',0,1200,1750,'{\"type\":263,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7349}',40,0,'[\"You are lost!\",\"Come my little morsel.\"]','[\"ice\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,34,39,0,'undead','[]','[]'),
(137,0,'Bear',300,23,80,'{\"type\":16,\"corpse\":5975}',1,0,'[\"grrrr\",\"groar\"]','[]','[{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"7\"}]',1,1,0,0,0,0,0,1,1,1,0,6,6,0,'blood','[{\"id\":\"5896\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"25000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"46750\"},{\"id\":\"3976\",\"count\":\"3\",\"chance\":\"3000\"},{\"id\":\"5902\",\"count\":1,\"chance\":\"1700\"}]','[]'),
(138,0,'Panda',300,23,80,'{\"type\":123,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6049}',10,0,'[\"Grrrr\",\"Groar\"]','[\"earth\"]','[{\"name\":\"Fire\",\"percent\":\"1\"}]',1,1,0,0,0,0,0,1,1,1,0,8,8,0,'blood','[{\"id\":\"2671\",\"count\":\"10\",\"chance\":\"33333\"},{\"id\":\"2666\",\"count\":\"15\",\"chance\":\"33333\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"}]','[]'),
(139,0,'polar bear',315,28,85,'{\"type\":42,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5987}',1,0,'[\"Grrrrrr\",\"GROARRR!\"]','[]','[{\"name\":\"Ice\",\"percent\":\"20\"},{\"name\":\"Fire\",\"percent\":\"20\"}]',1,1,0,0,0,0,0,1,1,1,0,10,7,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2671\",\"count\":\"4\",\"chance\":\"90000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"80000\"}]','[]'),
(140,0,'Braindeath',0,895,1225,'{\"type\":256,\"corpse\":6037}',25,0,'[\"You have disturbed my thoughts!\",\"Let me turn you into something more useful!\",\"Let me taste your brain!\",\"You will be punished!\"]','[\"earth\",\"death\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"13\"},{\"name\":\"Physical\",\"percent\":\"9\"}]',0,0,0,1,0,0,0,0,1,1,0,26,13,0,'undead','[{\"id\":\"2509\",\"count\":\"1\",\"chance\":\"6000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"100000\"},{\"id\":\"2445\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2518\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2181\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2451\",\"count\":1,\"chance\":\"300\"},{\"id\":\"5898\",\"count\":\"1\",\"chance\":\"1700\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"80000\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"6000\"},{\"id\":\"2175\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2394\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"32\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"80000\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"1333\"}]','[{\"name\":\"Vampire\",\"chance\":\"10\"}]'),
(141,0,'Beholder',0,170,260,'{\"type\":17,\"corpse\":5992}',1,0,'[\"Eye for eye!\",\"Here\'s looking at you!\",\"Let me take a look at you!\",\"You\'ve got the look!\"]','[\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"100\"},{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,10,15,0,'venom','[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"35000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"7250\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"2750\"},{\"id\":\"2175\",\"count\":1,\"chance\":\"5650\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"90000\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"3800\"},{\"id\":\"5898\",\"count\":1,\"chance\":\"775\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"750\"},{\"id\":\"2181\",\"count\":1,\"chance\":\"725\"},{\"id\":\"2518\",\"count\":1,\"chance\":\"250\"}]','[{\"name\":\"Skeleton\",\"chance\":\"12\"}]'),
(142,0,'Elder Beholder',0,280,1100,'{\"type\":108,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6037}',25,0,'[\"Let me take a look at you!\",\"Inferior creatures, bow before my power!\"]','[\"poison\",\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,23,13,0,'blood','[{\"id\":\"2509\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"100000\"},{\"id\":\"2445\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2518\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2181\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2451\",\"count\":1,\"chance\":\"300\"},{\"id\":\"5898\",\"count\":1,\"chance\":\"556\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2175\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"32\",\"chance\":\"80000\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"1333\"}]','[{\"name\":\"gazer\",\"chance\":\"10\"},{\"name\":\"crypt shambler\",\"chance\":\"15\"}]'),
(143,0,'gazer',0,90,120,'{\"type\":109,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6036}',10,1,'[\"Mommy!?\",\"Buuuuhaaaahhaaaaa!\",\"Me need mana!\"]','[\"poison\",\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,15,4,0,'VENOM','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2403\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(144,0,'The Evil Eye',0,1500,1200,'{\"type\":210,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6037}',10,0,'[\"653768764!\",\"Let me take a look at you!\",\"Inferior creatures, bow before my power!\",\"659978 54764!\"]','[\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,23,19,0,'blood','[{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"100000\"},{\"id\":\"2445\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2451\",\"count\":1,\"chance\":\"800\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"5898\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"80000\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"1333\"}]','[{\"name\":\"demon skeleton\",\"chance\":\"13\"},{\"name\":\"ghost\",\"chance\":\"12\"}]'),
(145,0,'Eye of the seven',0,90,1,'{\"type\":109,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6036}',1,0,'[]','[\"physical\",\"holy\",\"energy\",\"fire\",\"death\",\"earth\",\"ice\",\"poison\",\"lifedrain\"]','[]',0,0,0,1,0,0,0,0,1,1,0,1999,1999,0,'VENOM','[]','[]'),
(146,0,'spit nettle',0,20,150,'{\"type\":221,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6062}',1,0,'[]','[\"energy\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,0,0,0,0,0,1,1,0,13,30,0,'venom','[]','[]'),
(147,0,'The abomination',0,25000,38050,'{\"type\":238,\"corpse\":6532}',60,0,'[\"Blubb\"]','[\"earth\",\"energy\",\"invisible\"]','[{\"name\":\"Death\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'venom','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"2857\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(148,0,'Son of Verminor',0,5900,8500,'{\"type\":19,\"corpse\":1496}',1,0,'[\"Blub!\",\"Blub! Blub!\",\"Come\'on Daddy! Help me\"]','[\"poison\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,32,23,1,'venom','[]','[]'),
(149,0,'slime2',0,260,150,'{\"type\":19,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":1496}',1,0,'[\"Blubb\"]','[\"poison\"]','[]',0,0,0,1,0,0,0,0,1,1,0,10,3,0,'VENOM','[]','[]'),
(150,0,'slime',0,160,150,'{\"type\":19,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":1496}',1,0,'[]','[\"earth\"]','[{\"name\":\"Ice\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,0,0,0,'VENOM','[]','[{\"name\":\"slime2\",\"chance\":\"10\"}]'),
(151,0,'Bog Raider',0,800,1300,'{\"type\":299,\"corpse\":8951}',40,0,'[\"Tchhh!\",\"Slurp!\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"25\"},{\"name\":\"Death\",\"percent\":\"20\"},{\"name\":\"Fire\",\"percent\":\"80\"}]',0,0,0,1,0,0,0,1,1,1,0,15,10,0,'venom','[{\"id\":\"2148\",\"count\":\"121\",\"chance\":\"100000\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"3100\"},{\"id\":\"8472\",\"count\":1,\"chance\":\"2900\"},{\"id\":\"8872\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"8912\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"8873\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"8891\",\"count\":1,\"chance\":\"1300\"}]','[]'),
(152,0,'Tiquandas Revenge',0,2635,2400,'{\"type\":120,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6047}',5,1,'[]','[\"earth\",\"invisible\"]','[{\"name\":\"Death\",\"percent\":\"10\"},{\"name\":\"Ice\",\"percent\":\"8\"},{\"name\":\"Physical\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,45,30,1,'VENOM','[{\"id\":\"2666\",\"count\":\"50\",\"chance\":\"60000\"},{\"id\":\"2804\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2802\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2792\",\"count\":\"8\",\"chance\":\"8000\"},{\"id\":\"5015\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7732\",\"count\":\"3\",\"chance\":\"50000\"}]','[]'),
(153,0,'chicken',220,0,15,'{\"type\":111,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6042}',1,0,'[\"gokgoooook\",\"cluck cluck\"]','[]','[]',1,1,1,0,0,0,0,1,0,1,0,2,1,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2695\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"3976\",\"count\":\"18\",\"chance\":\"50000\"},{\"id\":\"5890\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(154,0,'Dire Penguin',0,120,173,'{\"type\":250,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7334}',1,0,'[]','[\"fire\",\"outfit\"]','[]',0,0,0,0,0,0,0,0,1,1,0,0,0,0,'blood','[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"18000\"},{\"id\":\"2669\",\"count\":\"1\",\"chance\":\"12000\"}]','[]'),
(155,0,'flamingo',250,0,25,'{\"type\":212,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6054}',1,0,'[]','[]','[]',1,1,1,0,0,0,0,1,0,1,0,6,1,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"}]','[]'),
(156,0,'Penguin',300,1,33,'{\"type\":250,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7334}',1,0,'[]','[]','[]',1,1,0,0,0,0,0,1,1,1,0,0,0,0,'blood','[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"12000\"},{\"id\":\"2669\",\"count\":\"1\",\"chance\":\"32000\"},{\"id\":\"2669\",\"count\":\"1\",\"chance\":\"320\"},{\"id\":\"2667\",\"count\":\"2\",\"chance\":\"320\"}]','[]'),
(157,0,'terror bird',490,150,300,'{\"type\":218,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6057}',30,0,'[\"CRAAAHHH!\",\"Gruuuh Gruuuh.\",\"Carrah Carrah!\"]','[]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"20\"}]',1,1,0,1,0,0,0,0,1,1,0,21,13,1,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2129\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"30000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2511\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"3970\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"20000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"33333\"}]','[]'),
(158,0,'Bazir',0,30000,110000,'{\"type\":35,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":2916}',155,1,'[\"COME HERE! FREE ITEMS FOR EVERYONE!\",\"BOW TO THE POWER OF THE RUTHLESS SEVEN!\",\"Slay your friends and I will spare you!\",\"DON\'T BE AFRAID! I AM COMING IN PEACE!\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,160,160,1,'fire','[{\"id\":\"2142\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2231\",\"count\":\"1\",\"chance\":\"9000\"},{\"id\":\"2144\",\"count\":\"15\",\"chance\":\"15000\"},{\"id\":\"2158\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2195\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2186\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2192\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2125\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2124\",\"count\":\"1\",\"chance\":\"5500\"},{\"id\":\"2520\",\"count\":\"1\",\"chance\":\"15500\"},{\"id\":\"2462\",\"count\":\"1\",\"chance\":\"11000\"},{\"id\":\"2387\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2434\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2167\",\"count\":\"1\",\"chance\":\"13500\"},{\"id\":\"2432\",\"count\":\"1\",\"chance\":\"17000\"},{\"id\":\"2393\",\"count\":\"1\",\"chance\":\"12500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"99900\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"88800\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"77700\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"66600\"},{\"id\":\"2179\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2470\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2033\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2418\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2182\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2155\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2188\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2396\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2177\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2162\",\"count\":\"1\",\"chance\":\"11500\"},{\"id\":\"2472\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2178\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2176\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"2171\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2200\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"1982\",\"count\":\"1\",\"chance\":\"2600\"},{\"id\":\"2214\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2123\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2170\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2402\",\"count\":\"1\",\"chance\":\"15500\"},{\"id\":\"2150\",\"count\":\"20\",\"chance\":\"13500\"},{\"id\":\"2145\",\"count\":\"5\",\"chance\":\"9500\"},{\"id\":\"2149\",\"count\":\"10\",\"chance\":\"15500\"},{\"id\":\"2146\",\"count\":\"10\",\"chance\":\"13500\"},{\"id\":\"2165\",\"count\":\"1\",\"chance\":\"9500\"},{\"id\":\"2197\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2174\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2151\",\"count\":\"7\",\"chance\":\"14000\"},{\"id\":\"2112\",\"count\":\"1\",\"chance\":\"14500\"},{\"id\":\"2421\",\"count\":\"1\",\"chance\":\"13500\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"3955\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2185\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2143\",\"count\":\"15\",\"chance\":\"12500\"}]','[{\"name\":\"Bazir\",\"chance\":\"15\"}]'),
(159,0,'Arabian',10000,20000,30000,'{\"type\":146,\"head\":114,\"body\":20,\"legs\":22,\"feet\":2,\"addons\":3,\"corpse\":6080}',155,1,'[\"Become to Desert\",\"LEAVE!\",\"Attack ! Scarabs\",\"I am Arabian! Leave Now!\",\"DOOOWWN\"]','[\"fire\",\"drown\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,55,1,'fire','[{\"id\":\"2514\",\"count\":1,\"chance\":\"1900\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"200\"},{\"id\":\"10521\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"3800\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"1350\"},{\"id\":\"7369\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"3100\"}]','[{\"name\":\"Ferumbras\",\"chance\":\"12\"}]'),
(160,0,'The Fire Elemental',850,1000,12000,'{\"type\":242,\"corpse\":8964}',55,0,'[]','[\"fire\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,20,0,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2147\",\"count\":\"3\",\"chance\":\"3200\"},{\"id\":\"8299\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"8921\",\"count\":1,\"chance\":\"1800\"}]','[]'),
(161,0,'Infernatil',0,85000,270000,'{\"type\":35,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":2916}',193,1,'[\"Worship Zathroth pathetic mortal!\",\"Your soul will be mine!\",\"ASHES TO ASHES!\",\"YOU WILL ALL BURN!\",\"THE DAY OF RECKONING IS AT HAND!\",\"BOW TO THE POWER OF THE RUTHLESS SEVEN!\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,150,165,1,'fire','[{\"id\":\"2142\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2231\",\"count\":\"1\",\"chance\":\"9000\"},{\"id\":\"2144\",\"count\":\"15\",\"chance\":\"15000\"},{\"id\":\"2158\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2195\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2192\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2125\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2124\",\"count\":\"1\",\"chance\":\"5500\"},{\"id\":\"2520\",\"count\":\"1\",\"chance\":\"15500\"},{\"id\":\"2462\",\"count\":\"1\",\"chance\":\"11000\"},{\"id\":\"2387\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2434\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2167\",\"count\":\"1\",\"chance\":\"13500\"},{\"id\":\"2432\",\"count\":\"1\",\"chance\":\"17000\"},{\"id\":\"2393\",\"count\":\"1\",\"chance\":\"12500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"99900\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"88800\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"77700\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"66600\"},{\"id\":\"2179\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2470\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2033\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2418\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2155\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2396\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2177\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2162\",\"count\":\"1\",\"chance\":\"11500\"},{\"id\":\"2472\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2178\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2186\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2176\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"2171\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2200\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"1982\",\"count\":\"1\",\"chance\":\"2600\"},{\"id\":\"2214\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2123\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2170\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2402\",\"count\":\"1\",\"chance\":\"15500\"},{\"id\":\"2436\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2150\",\"count\":\"20\",\"chance\":\"13500\"},{\"id\":\"2145\",\"count\":\"5\",\"chance\":\"9500\"},{\"id\":\"2149\",\"count\":\"10\",\"chance\":\"15500\"},{\"id\":\"2146\",\"count\":\"10\",\"chance\":\"13500\"},{\"id\":\"2182\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2165\",\"count\":\"1\",\"chance\":\"9500\"},{\"id\":\"2197\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2174\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2151\",\"count\":\"7\",\"chance\":\"14000\"},{\"id\":\"2112\",\"count\":\"1\",\"chance\":\"14500\"},{\"id\":\"2421\",\"count\":\"1\",\"chance\":\"13500\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2185\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"3955\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2188\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2143\",\"count\":\"15\",\"chance\":\"12500\"}]','[{\"name\":\"hellfire fighter\",\"chance\":\"8\"}]'),
(162,0,'Zoralurk',0,30000,55000,'{\"type\":12,\"head\":0,\"body\":98,\"legs\":86,\"feet\":94,\"corpse\":6068}',90,1,'[\"I AM ZORALURK, THE DEMON WITH A THOUSAND FACES!\",\"BRING IT, COCKROACHES!\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,65,55,1,'UNDEAD','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"50000\"},{\"id\":\"2143\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"2407\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"6530\",\"count\":1,\"chance\":\"16000\"},{\"id\":\"7342\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2641\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2407\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"60000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"16033\"},{\"id\":\"2408\",\"count\":1,\"chance\":\"6000\"}]','[{\"name\":\"demon\",\"chance\":\"50\"}]'),
(163,0,'Dark Wizard',50,2600,2100,'{\"type\":145,\"head\":114,\"body\":114,\"legs\":114,\"feet\":114,\"addons\":3,\"corpse\":6080}',48,0,'[\"You will not live to tell anyone!\",\"You are my game today!\"]','[\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,1,0,1,0,0,0,1,1,1,0,10,8,0,'blood','[{\"id\":\"2649\",\"count\":\"2\",\"chance\":\"100000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"4444\"},{\"id\":\"2544\",\"count\":\"17\",\"chance\":\"10000\"},{\"id\":\"2545\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2579\",\"count\":1,\"chance\":\"2222\"}]','[]'),
(164,0,'The Spirit',0,2600,2100,'{\"type\":235,\"head\":20,\"corpse\":6348}',65,0,'[\"Revenge ... is so ... sweet!\",\"Life...force!\",\"Feed me your... lifeforce!\"]','[\"earth\",\"death\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,20,25,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"6667\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"5909\",\"count\":\"1\",\"chance\":\"2222\"},{\"id\":\"2134\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2071\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"2857\"},{\"id\":\"5944\",\"count\":\"1\",\"chance\":\"1429\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"909\"}]','[]'),
(165,0,'Apocalypse',0,35000,80000,'{\"type\":12,\"head\":38,\"body\":114,\"legs\":0,\"feet\":94,\"corpse\":6068}',80,1,'[\"BOW TO THE POWER OF THE RUTHLESS SEVEN!\",\"DESTRUCTION!\",\"CHAOS!\",\"DEATH TO ALL!\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,145,188,1,'fire','[{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"2231\",\"count\":\"1\",\"chance\":\"9000\"},{\"id\":\"2144\",\"count\":\"15\",\"chance\":\"15000\"},{\"id\":\"2158\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2195\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2192\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2125\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2124\",\"count\":\"1\",\"chance\":\"5500\"},{\"id\":\"2520\",\"count\":\"1\",\"chance\":\"15500\"},{\"id\":\"2462\",\"count\":\"1\",\"chance\":\"11000\"},{\"id\":\"2387\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2434\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2167\",\"count\":\"1\",\"chance\":\"13500\"},{\"id\":\"2432\",\"count\":\"1\",\"chance\":\"17000\"},{\"id\":\"2393\",\"count\":\"1\",\"chance\":\"12500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"99900\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"88800\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"77700\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"66600\"},{\"id\":\"2179\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2470\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2033\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2418\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2155\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2396\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2177\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2162\",\"count\":\"1\",\"chance\":\"11500\"},{\"id\":\"2472\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2178\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2186\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2176\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"2171\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2200\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"1982\",\"count\":\"1\",\"chance\":\"2600\"},{\"id\":\"2214\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2123\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2170\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2402\",\"count\":\"1\",\"chance\":\"15500\"},{\"id\":\"2150\",\"count\":\"20\",\"chance\":\"13500\"},{\"id\":\"2145\",\"count\":\"5\",\"chance\":\"9500\"},{\"id\":\"2149\",\"count\":\"10\",\"chance\":\"15500\"},{\"id\":\"2146\",\"count\":\"10\",\"chance\":\"13500\"},{\"id\":\"2182\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2165\",\"count\":\"1\",\"chance\":\"9500\"},{\"id\":\"2197\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2174\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2151\",\"count\":\"7\",\"chance\":\"14000\"},{\"id\":\"2112\",\"count\":\"1\",\"chance\":\"14500\"},{\"id\":\"2421\",\"count\":\"1\",\"chance\":\"13500\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2185\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"3955\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2188\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2143\",\"count\":\"15\",\"chance\":\"12500\"}]','[]'),
(166,0,'King of Baiak',10000,20000,300000,'{\"type\":332,\"corpse\":5995}',155,1,'[\"This is my Castle\",\"LEAVE!\",\"Attack ! Soldiers!\",\"I am King of Baiak! Leave Now!\",\"DOOOWWN\"]','[\"fire\",\"drown\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,55,1,'fire','[{\"id\":\"2514\",\"count\":1,\"chance\":\"1900\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"200\"},{\"id\":\"10521\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"3800\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"1350\"},{\"id\":\"7369\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"3100\"},{\"id\":\"6391\",\"count\":1,\"chance\":\"6666\"}]','[{\"name\":\"Ferumbras\",\"chance\":\"12\"}]'),
(167,0,'Ghazbaran',0,15000,60000,'{\"type\":12,\"head\":0,\"body\":123,\"legs\":97,\"feet\":94,\"corpse\":6068}',98,1,'[\"COME AND GIVE ME SOME AMUSEMENT!\",\"IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?\",\"I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!\",\"FLAWLESS VICTORY!\"]','[\"energy\",\"earth\",\"fire\",\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"15\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,65,70,1,'fire','[{\"id\":\"2160\",\"count\":\"4\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"5943\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2003\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7431\",\"count\":1,\"chance\":\"14000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"60000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"14033\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[{\"name\":\"deathslicer\",\"chance\":\"100\"},{\"name\":\"deathslicer\",\"chance\":\"100\"},{\"name\":\"deathslicer\",\"chance\":\"100\"},{\"name\":\"deathslicer\",\"chance\":\"100\"}]'),
(168,0,'Dont Lure',0,15000,500000,'{\"type\":12,\"head\":0,\"body\":123,\"legs\":97,\"feet\":94,\"corpse\":6068}',1,1,'[\"COME AND GIVE ME SOME AMUSEMENT!\",\"IS THAT THE BEST YOU HAVE TO OFFER, TIBIANS?\",\"I AM GHAZBARAN OF THE TRIANGLE... AND I AM HERE TO CHALLENGE YOU ALL!\",\"FLAWLESS VICTORY!\"]','[\"energy\",\"earth\",\"fire\",\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"15\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,65,70,1,'fire','[{\"id\":\"2160\",\"count\":\"4\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"5943\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2003\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7431\",\"count\":1,\"chance\":\"14000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"60000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"14033\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[{\"name\":\"deathslicer\",\"chance\":\"100\"},{\"name\":\"deathslicer\",\"chance\":\"100\"},{\"name\":\"deathslicer\",\"chance\":\"100\"},{\"name\":\"deathslicer\",\"chance\":\"100\"}]'),
(169,0,'Morgaroth',0,15000,55500,'{\"type\":12,\"head\":0,\"body\":94,\"legs\":79,\"feet\":79,\"corpse\":6068}',90,0,'[\"MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS\",\"The triangle of terror will rise!\",\"Zathroth look at the destruction i am causing in your name!\",\"I AM MORGAROTH, LORD OF THE TRIANGLE... AND YOU ARE LOST!\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"35\"}]',0,0,0,1,0,0,0,0,1,1,0,70,70,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"50000\"},{\"id\":\"2143\",\"count\":\"5\",\"chance\":\"5000\"},{\"id\":\"2144\",\"count\":\"13\",\"chance\":\"4500\"},{\"id\":\"2149\",\"count\":\"4\",\"chance\":\"5500\"},{\"id\":\"2186\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"1429\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"4700\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7431\",\"count\":1,\"chance\":\"7900\"},{\"id\":\"\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"5943\",\"count\":1,\"chance\":\"3400\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"10333\"},{\"id\":\"2421\",\"count\":1,\"chance\":\"7509\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[{\"name\":\"demon\",\"chance\":\"25\"}]'),
(170,0,'Abominator',0,50000,40000,'{\"type\":12,\"head\":0,\"body\":94,\"legs\":79,\"feet\":79,\"corpse\":6068}',140,1,'[\"I AM ABOMINATOR, LORD OF THE TRIANGLE... AND YOU ARE LOST!\",\"MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!\",\"THE TRIANGLE OF TERROR WILL RISE!\",\"ZATHROTH! LOOK AT THE DESTRUCTION I AM CAUSING IN YOUR NAME!\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"100\"},{\"name\":\"Earth\",\"percent\":\"100\"},{\"name\":\"Energy\",\"percent\":\"100\"},{\"name\":\"Death\",\"percent\":\"60\"},{\"name\":\"Physical\",\"percent\":\"40\"}]',0,0,0,1,0,0,0,0,1,1,0,65,55,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"20000\"},{\"id\":\"2150\",\"count\":\"16\",\"chance\":\"4000\"},{\"id\":\"2148\",\"count\":\"83\",\"chance\":\"40000\"},{\"id\":\"7388\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2130\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"8871\",\"count\":1,\"chance\":\"3100\"},{\"id\":\"2158\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2155\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2210\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"9970\",\"count\":\"13\",\"chance\":\"6000\"},{\"id\":\"6500\",\"count\":\"2\",\"chance\":\"6000\"},{\"id\":\"2143\",\"count\":\"7\",\"chance\":\"5000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7368\",\"count\":\"25\",\"chance\":\"8000\"},{\"id\":\"2144\",\"count\":\"12\",\"chance\":\"4000\"},{\"id\":\"2145\",\"count\":\"5\",\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"5650\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"8100\"},{\"id\":\"7412\",\"count\":1,\"chance\":\"4200\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"8904\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"20000\"},{\"id\":\"8901\",\"count\":1,\"chance\":\"4400\"},{\"id\":\"2415\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"8926\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"6500\",\"count\":\"2\",\"chance\":\"6000\"},{\"id\":\"8902\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2488\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2143\",\"count\":\"7\",\"chance\":\"7000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"8879\",\"count\":1,\"chance\":\"3400\"},{\"id\":\"2146\",\"count\":\"18\",\"chance\":\"9000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"8918\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"7000\"}]','[{\"name\":\"Demon\",\"chance\":\"33\"}]'),
(171,0,'Dark Abominator',0,50000,50000,'{\"type\":12,\"head\":0,\"body\":94,\"legs\":79,\"feet\":79,\"corpse\":6068}',140,1,'[\"I AM DARK ABOMINATOR, LORD OF THE TRIANGLE... AND YOU ARE LOST!\",\"MY SEED IS FEAR AND MY HARVEST ARE YOUR SOULS!\",\"THE TRIANGLE OF TERROR WILL RISE!\",\"WELCOME TO HELL! YOU GO DIE!!\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"100\"},{\"name\":\"Earth\",\"percent\":\"100\"},{\"name\":\"Energy\",\"percent\":\"100\"},{\"name\":\"Death\",\"percent\":\"60\"},{\"name\":\"Physical\",\"percent\":\"40\"}]',0,0,0,1,0,0,0,0,1,1,0,65,55,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"20000\"},{\"id\":\"2150\",\"count\":\"16\",\"chance\":\"4000\"},{\"id\":\"7388\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2130\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"8871\",\"count\":1,\"chance\":\"3100\"},{\"id\":\"2158\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2155\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2210\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"9970\",\"count\":\"13\",\"chance\":\"6000\"},{\"id\":\"6500\",\"count\":\"2\",\"chance\":\"6000\"},{\"id\":\"2143\",\"count\":\"7\",\"chance\":\"5000\"},{\"id\":\"7368\",\"count\":\"25\",\"chance\":\"8000\"},{\"id\":\"2144\",\"count\":\"12\",\"chance\":\"4000\"},{\"id\":\"2145\",\"count\":\"5\",\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"5650\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"8100\"},{\"id\":\"7412\",\"count\":1,\"chance\":\"4200\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"8904\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"20000\"},{\"id\":\"8901\",\"count\":1,\"chance\":\"4400\"},{\"id\":\"2415\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"8926\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"6500\",\"count\":\"2\",\"chance\":\"6000\"},{\"id\":\"8902\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2488\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2143\",\"count\":\"7\",\"chance\":\"7000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"8879\",\"count\":1,\"chance\":\"3400\"},{\"id\":\"2146\",\"count\":\"18\",\"chance\":\"9000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"8918\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"7000\"}]','[{\"name\":\"Demon\",\"chance\":\"33\"}]'),
(172,0,'Quara Squicher',0,600,10000,'{\"type\":77,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6063}',165,0,'[\"Shhhhhhh!\",\"Leave to SEA!!\"]','[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"drunk\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,35,30,0,'blood','[{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2147\",\"count\":\"3\",\"chance\":\"1538\"}]','[]'),
(173,0,'orshabaal',0,10000,20500,'{\"type\":201,\"corpse\":5995}',65,1,'[\"PRAISED BE MY MASTERS, THE RUTHLESS SEVEN!\",\"YOU ARE DOOMED!\",\"ORSHABAAL IS BACK!\",\"Be prepared for the day my masters will come for you!\",\"SOULS FOR ORSHABAAL!\"]','[\"earth\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Death\",\"percent\":\"35\"}]',0,0,0,1,0,0,0,1,1,1,0,48,50,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"10059\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"5906\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"5954\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2182\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2421\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2144\",\"count\":\"4\",\"chance\":\"4000\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"9700\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"1428\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"2333\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"7050\"},{\"id\":\"2418\",\"count\":1,\"chance\":\"833\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[{\"name\":\"demon\",\"chance\":\"25\"}]'),
(174,0,'Magician',0,15000,200000,'{\"type\":133,\"head\":39,\"body\":0,\"legs\":19,\"feet\":20,\"addons\":3,\"corpse\":3058}',55,1,'[\"Feel the power of my runes!\",\"Killing you is getting expensive\",\"My secrets are mine alone!\"]','[\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"10\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Holy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,20,20,0,'blood','[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"100000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5934\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"7762\",\"count\":1,\"chance\":\"600\"}]','[]'),
(175,0,'Lobisomen',0,300,11400,'{\"type\":308,\"corpse\":6080}',100,0,'[\"BLOOD!\",\"HRAAAAAAAAAARRRRRR!\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"10\"},{\"name\":\"Energy\",\"percent\":\"5\"},{\"name\":\"Earth\",\"percent\":\"5\"},{\"name\":\"Death\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,55,50,1,'blood','[{\"id\":\"2148\",\"count\":\"96\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"84\",\"chance\":\"100000\"},{\"id\":\"5897\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2805\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"9809\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"7439\",\"count\":1,\"chance\":\"800\"},{\"id\":\"7419\",\"count\":1,\"chance\":\"500\"},{\"id\":\"7383\",\"count\":1,\"chance\":\"300\"}]','[{\"name\":\"fire elemental\",\"chance\":\"100\"},{\"name\":\"ghoul\",\"chance\":\"100\"},{\"name\":\"ghost\",\"chance\":\"100\"}]'),
(176,0,'Fada',1000,2900,2600,'{\"type\":141,\"head\":20,\"body\":0,\"legs\":0,\"feet\":0,\"addons\":3,\"corpse\":6080}',48,0,'[\"You will not live to tell anyone!\",\"You are my game today!\"]','[\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,1,0,1,0,0,0,1,1,1,0,10,8,0,'blood','[{\"id\":\"2649\",\"count\":\"2\",\"chance\":\"12500\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"2500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"555\"},{\"id\":\"2544\",\"count\":\"17\",\"chance\":\"1250\"},{\"id\":\"2545\",\"count\":\"3\",\"chance\":\"1250\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2579\",\"count\":1,\"chance\":\"277\"}]','[]'),
(177,0,'Shadow Warrior',0,2800,3000,'{\"type\":134,\"head\":0,\"body\":114,\"legs\":114,\"feet\":0,\"addons\":3,\"corpse\":6080}',98,0,'[\"I am Shadow Warrior. Come to Hell\"]','[\"poison\"]','[]',0,0,0,1,0,0,0,1,1,1,0,10,8,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"5875\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2544\",\"count\":\"15\",\"chance\":\"10000\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2201\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(178,0,'Captain Cutler',775,450,15000,'{\"type\":98,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6080}',155,0,'[]','[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"drunk\",\"invisible\"]','[]',0,1,0,1,0,0,0,0,1,1,0,20,25,1,'blood','[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"50000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2489\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2521\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"6096\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"6095\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5926\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5091\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"5462\",\"count\":1,\"chance\":\"450\"},{\"id\":\"5792\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"6098\",\"count\":\"1\",\"chance\":\"5000\"}]','[{\"name\":\"Spirit of Jack\",\"chance\":\"12\"}]'),
(179,0,'Lord Frost Dragon',390,2500,2100,'{\"type\":248,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7091}',40,0,'[\"CHHHRRRR\",\"HISSSS\"]','[\"ice\",\"fire\",\"earth\",\"paralyze\",\"lifedrain\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,1,1,1,0,45,45,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2672\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"2500\"},{\"id\":\"2547\",\"count\":\"10\",\"chance\":\"2222\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"2222\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"7402\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[]'),
(180,0,'dog',220,0,20,'{\"type\":32,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5971}',1,0,'[\"huf!huf\"]','[]','[]',1,1,1,0,0,0,0,1,0,1,0,2,1,0,'blood','[]','[]'),
(181,0,'hellhound',0,6800,7500,'{\"type\":240,\"corpse\":6332}',45,0,'[\"GROOOWL!\",\"GRRRRR!\"]','[\"fire\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"40\"},{\"name\":\"Energy\",\"percent\":\"25\"}]',0,0,0,1,0,0,0,0,1,1,0,35,35,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"2671\",\"count\":\"5\",\"chance\":\"50000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"7200\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2144\",\"count\":\"3\",\"chance\":\"9999\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2430\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2383\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2410\",\"count\":\"11\",\"chance\":\"15000\"},{\"id\":\"6558\",\"count\":\"2\",\"chance\":\"8888\"},{\"id\":\"6553\",\"count\":1,\"chance\":\"1600\"}]','[]'),
(182,0,'war wolf',50,55,140,'{\"type\":3,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6009}',1,0,'[\"Grrrrrrr\",\"Yoooohhuuuu!\"]','[]','[]',0,1,0,1,0,0,0,0,1,1,0,16,10,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2671\",\"count\":\"5\",\"chance\":\"33333\"},{\"id\":\"5897\",\"count\":\"1\",\"chance\":\"6666\"}]','[]'),
(183,0,'winter wolf',260,20,30,'{\"type\":52,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5997}',1,0,'[]','[]','[{\"name\":\"Ice\",\"percent\":\"5\"},{\"name\":\"Holy\",\"percent\":\"7\"},{\"name\":\"Death\",\"percent\":\"4\"}]',1,1,1,0,0,0,0,0,1,1,0,6,2,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"33333\"}]','[]'),
(184,0,'wolf',255,18,25,'{\"type\":27,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5968}',1,0,'[]','[]','[{\"name\":\"Earth\",\"percent\":\"3\"},{\"name\":\"Holy\",\"percent\":\"7\"}]',1,1,1,0,0,0,0,1,1,1,0,8,8,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"90000\"},{\"id\":\"5897\",\"count\":\"1\",\"chance\":\"6666\"}]','[]'),
(185,0,'Ghasty Dragon',255,18,4000,'{\"type\":351,\"corpse\":11356}',1,0,'[]','[]','[{\"name\":\"Earth\",\"percent\":\"3\"},{\"name\":\"Holy\",\"percent\":\"7\"}]',1,1,1,0,0,0,0,1,1,1,0,8,8,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"90000\"},{\"id\":\"5897\",\"count\":\"1\",\"chance\":\"6666\"}]','[]'),
(186,0,'phelps',305,100000,480000,'{\"type\":267,\"corpse\":6068}',175,0,'[\"Chikuva!\",\"Quisavu tukavi!\",\"Si siyoqua jamjam!\",\"Achuq! jinuma!\",\"Si ji jusipa!\"]','[\"energy\"]','[]',0,1,0,1,0,0,0,0,1,1,0,30,30,0,'blood','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(187,0,'Chakoya Windcaller',305,48,84,'{\"type\":260,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7320}',25,0,'[\"Chikuva!\",\"Siqsiq ji jusipa!\",\"Jagura taluka taqua!\"]','[\"energy\"]','[]',0,1,0,1,0,0,0,0,1,1,0,30,30,0,'blood','[{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"3333\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7158\",\"count\":\"1\",\"chance\":\"250\"}]','[]'),
(188,0,'blood crab',505,160,290,'{\"type\":200,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6075}',1,0,'[]','[\"poison\",\"lifedrain\",\"invisible\"]','[]',1,0,0,1,0,0,0,0,1,1,0,15,10,0,'blood','[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"39\",\"chance\":\"40000\"},{\"id\":\"2667\",\"count\":\"2\",\"chance\":\"4789\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"6827\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"5839\"},{\"id\":\"2143\",\"count\":\"2\",\"chance\":\"4000\"}]','[]'),
(189,0,'crab',305,30,55,'{\"type\":112,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6039}',1,0,'[\"crab crab!\"]','[\"poison\"]','[]',1,1,1,0,0,0,0,0,1,1,0,5,5,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2671\",\"count\":\"4\",\"chance\":\"100000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"}]','[]'),
(190,0,'Ice Golem',0,295,385,'{\"type\":261,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7282}',8,0,'[\"Chrr.\"]','[\"fire\",\"ice\",\"holy\",\"death\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"25\"}]',0,0,0,1,0,0,0,0,1,1,0,26,25,0,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2144\",\"count\":\"1\",\"chance\":\"4200\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"3666\"},{\"id\":\"2145\",\"count\":\"1\",\"chance\":\"3333\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2146\",\"count\":\"1\",\"chance\":\"4200\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"2050\"},{\"id\":\"2479\",\"count\":1,\"chance\":\"2555\"},{\"id\":\"7449\",\"count\":1,\"chance\":\"1999\"},{\"id\":\"2383\",\"count\":1,\"chance\":\"3111\"}]','[]'),
(191,0,'Yeti',0,460,950,'{\"type\":110,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6038}',25,0,'[\"Yooodelaaahooohooo!\",\"Yooodelaaaheeeheee!\"]','[\"energy\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,33,28,1,'blood','[{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"5\",\"chance\":\"33333\"},{\"id\":\"2111\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"2425\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"4848\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2688\",\"count\":\"4\",\"chance\":\"2500\"}]','[]'),
(192,0,'acolyte Of The Cult',0,300,390,'{\"type\":194,\"head\":114,\"body\":121,\"legs\":121,\"feet\":57,\"corpse\":6080}',5,0,'[\"Praise voodoo!\"]','[\"fire\",\"poison\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,10,0,'blood','[{\"id\":\"2148\",\"count\":\"54\",\"chance\":\"40000\"},{\"id\":\"2149\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2201\",\"count\":1,\"chance\":\"1793\"},{\"id\":\"6087\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2181\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"5810\",\"count\":1,\"chance\":\"555\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"5801\",\"count\":1,\"chance\":\"909\"}]','[{\"name\":\"Skeleton\",\"chance\":\"10\"}]'),
(193,0,'Arachir The Ancient One',0,1800,430,'{\"type\":194,\"head\":114,\"body\":94,\"legs\":94,\"feet\":57,\"corpse\":6080}',40,0,'[]','[\"invisible\"]','[{\"name\":\"Holy\",\"percent\":\"30\"},{\"name\":\"Earth\",\"percent\":\"15\"},{\"name\":\"Ice\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,20,20,0,'undead','[{\"id\":\"2148\",\"count\":\"57\",\"chance\":\"20000\"},{\"id\":\"5810\",\"count\":1,\"chance\":\"850\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"1962\",\"count\":1,\"chance\":\"2750\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"6089\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2183\",\"count\":1,\"chance\":\"750\"},{\"id\":\"7426\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2655\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5801\",\"count\":1,\"chance\":\"100\"},{\"id\":\"7424\",\"count\":1,\"chance\":\"50\"}]','[{\"name\":\"Ghoul\",\"chance\":\"10\"}]'),
(194,0,'Enlightened of the Cult',0,500,700,'{\"type\":193,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6080}',1,0,'[]','[\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,15,1,'blood','[{\"id\":\"2148\",\"count\":\"82\",\"chance\":\"47831\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"1111\"},{\"id\":\"5801\",\"count\":1,\"chance\":\"909\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"909\"},{\"id\":\"7426\",\"count\":1,\"chance\":\"1009\"},{\"id\":\"2656\",\"count\":1,\"chance\":\"400\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"6087\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"5810\",\"count\":1,\"chance\":\"555\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"1538\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"5669\",\"count\":1,\"chance\":\"400\"}]','[{\"name\":\"Crypt Shambler\",\"chance\":\"10\"},{\"name\":\"Ghost\",\"chance\":\"10\"}]'),
(195,0,'Novice Of The Cult',0,100,285,'{\"type\":133,\"head\":114,\"body\":95,\"legs\":114,\"feet\":114,\"corpse\":6080}',1,0,'[\"Fear us!\",\"You will not tell anyone what you have seen.\",\"Your curiosity will be punished!\"]','[\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\"]','[]',0,0,1,1,0,0,0,1,1,1,0,10,15,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2661\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2145\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"5810\",\"count\":1,\"chance\":\"555\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"18427\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2199\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2190\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"6087\",\"count\":1,\"chance\":\"5000\"}]','[{\"name\":\"Chicken\",\"chance\":\"10\"}]'),
(196,0,'Grandfather Tridian',0,1400,1800,'{\"type\":193,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6080}',13,0,'[]','[\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,25,1,'undead','[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"90000\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2656\",\"count\":1,\"chance\":\"400\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"6087\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"5810\",\"count\":1,\"chance\":\"555\"},{\"id\":\"2789\",\"count\":\"8\",\"chance\":\"4500\"},{\"id\":\"5669\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"8922\",\"count\":1,\"chance\":\"13000\"}]','[{\"name\":\"Crypt Shambler\",\"chance\":\"20\"},{\"name\":\"Ghost\",\"chance\":\"30\"}]'),
(197,0,'Ungreez',10000,500,8200,'{\"type\":35,\"corpse\":5995}',30,0,'[\"I\'ll teach you that even heros can die\",\"You wil die Begging like the others did\"]','[\"energy\",\"fire\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"25\"}]',0,0,0,1,0,0,0,0,1,1,0,55,50,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"3000\"}]','[]'),
(198,0,'Dark Torturer',0,4650,7350,'{\"type\":234,\"corpse\":6328}',33,0,'[\"You like it, don\'t you?\",\"IahaEhheAie!\"]','[\"fire\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"55\"},{\"name\":\"Earth\",\"percent\":\"60\"},{\"name\":\"Death\",\"percent\":\"40\"}]',0,0,0,1,0,0,0,1,1,1,0,60,50,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"50000\"},{\"id\":\"2671\",\"count\":\"5\",\"chance\":\"33333\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"14555\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"9555\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"3266\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"9971\",\"count\":1,\"chance\":\"4050\"},{\"id\":\"7368\",\"count\":\"2\",\"chance\":\"5500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"9999\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"6500\",\"count\":1,\"chance\":\"6555\"},{\"id\":\"2557\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2558\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"7388\",\"count\":1,\"chance\":\"1150\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"1650\"},{\"id\":\"7412\",\"count\":1,\"chance\":\"1050\"},{\"id\":\"5801\",\"count\":1,\"chance\":\"3100\"},{\"id\":\"5480\",\"count\":1,\"chance\":\"2188\"}]','[]'),
(199,0,'Demon',10000,6000,8200,'{\"type\":35,\"corpse\":5995}',28,1,'[\"MUHAHAHAHA!\",\"I SMELL FEEEEEAAAR!\",\"CHAMEK ATH UTHUL ARAK!\",\"Your resistance is futile!\",\"Your soul will be mine!\"]','[\"fire\",\"drown\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,55,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"1900\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"7500\"},{\"id\":\"5906\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"5954\",\"count\":\"1\",\"chance\":\"2345\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"1982\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"3800\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"3800\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"2600\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"13000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"4\",\"chance\":\"5500\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"11000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"32000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"1350\"},{\"id\":\"7382\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7393\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"3100\"},{\"id\":\"2418\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"6666\"}]','[{\"name\":\"fire elemental\",\"chance\":\"12\"}]'),
(200,0,'Lord of Demon',10000,4000,7000,'{\"type\":35,\"corpse\":5995}',40,1,'[\"MUHAHAHAHA!\",\"I SMELL FEEEEEAAAR!\",\"CHAMEK ATH UTHUL ARAK!\",\"Your resistance is futile!\",\"Your soul will be mine!\"]','[\"fire\",\"drown\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,55,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"7500\"},{\"id\":\"5906\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"5954\",\"count\":\"1\",\"chance\":\"2345\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"1982\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"3800\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"3800\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"2600\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"13000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"4\",\"chance\":\"5500\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"11000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"32000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7382\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7393\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2418\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"6666\"}]','[{\"name\":\"fire elemental\",\"chance\":\"12\"}]'),
(201,0,'fire devil',530,110,200,'{\"type\":40,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5985}',1,0,'[\"Hot, eh?\",\"Hell, oh hell!\"]','[\"fire\"]','[]',1,1,0,1,0,0,0,0,1,1,0,15,13,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"833\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2568\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2691\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2150\",\"count\":\"2\",\"chance\":\"1666\"},{\"id\":\"2191\",\"count\":1,\"chance\":\"833\"}]','[]'),
(202,0,'Fury',0,4500,4100,'{\"type\":149,\"head\":94,\"body\":77,\"legs\":96,\"feet\":0,\"addons\":3,\"corpse\":6081}',95,0,'[\"Fire hot!\",\"Ahhhhrrrrr\",\"Carnage!\"]','[\"fire\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"15\"},{\"name\":\"Holy\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,35,35,1,'blood','[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"55\",\"chance\":\"100000\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"3666\"},{\"id\":\"6558\",\"count\":\"1\",\"chance\":\"27555\"},{\"id\":\"6558\",\"count\":\"1\",\"chance\":\"16555\"},{\"id\":\"2666\",\"count\":\"1\",\"chance\":\"50000\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"5500\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"8888\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"6200\"},{\"id\":\"6558\",\"count\":\"1\",\"chance\":\"5555\"},{\"id\":\"2181\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"9811\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2143\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"2156\",\"count\":1,\"chance\":\"3900\"},{\"id\":\"7404\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"5911\",\"count\":1,\"chance\":\"9800\"}]','[]'),
(203,0,'Hand of Cursed Fate',0,5000,10500,'{\"type\":230,\"corpse\":6312}',40,1,'[]','[\"death\",\"energy\",\"fire\",\"poison\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,35,25,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"35000\"},{\"id\":\"2152\",\"count\":\"5\",\"chance\":\"40000\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"8974\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2148\",\"count\":\"65\",\"chance\":\"100000\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"13500\"},{\"id\":\"2153\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(204,0,'blue djinn',0,215,330,'{\"type\":80,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6020}',1,0,'[\"Simsalabim\",\"Feel the power of my magic, tiny mortal!\",\"Be careful what you wish for.\",\"Wishes can come true.\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"85\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Holy\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,10,20,0,'blood','[{\"id\":\"1978\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2745\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2146\",\"count\":\"4\",\"chance\":\"2500\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2684\",\"count\":\"5\",\"chance\":\"50000\"},{\"id\":\"2146\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2663\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"1971\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2063\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"5912\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(205,0,'efreet',0,325,550,'{\"type\":103,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6032}',10,0,'[\"I grant you a deathwish!\",\"Muhahahaha!\",\"I wish you a merry trip to hell!\",\"Tell me your last wish!\",\"Good wishes are for fairytales\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"90\"},{\"name\":\"Earth\",\"percent\":\"10\"},{\"name\":\"Energy\",\"percent\":\"60\"},{\"name\":\"Death\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,20,15,0,'blood','[{\"id\":\"2155\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"100000\"},{\"id\":\"2673\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2063\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2149\",\"count\":\"2\",\"chance\":\"7000\"},{\"id\":\"2663\",\"count\":1,\"chance\":\"200\"},{\"id\":\"1860\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"80000\"},{\"id\":\"2442\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"1111\"}]','[{\"name\":\"green djinn\",\"chance\":\"15\"}]'),
(206,0,'green djinn',0,225,330,'{\"type\":51,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6016}',1,0,'[\"I grant you a deathwish!\",\"Muhahahaha!\",\"I wish you a merry trip to hell!\",\"Tell me your last wish!\",\"Good wishes are for fairytales\"]','[\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"25\"},{\"name\":\"Earth\",\"percent\":\"40\"},{\"name\":\"Energy\",\"percent\":\"60\"}]',0,0,0,1,0,0,0,0,1,1,0,10,18,0,'VENOM','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2747\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"1111\"},{\"id\":\"2062\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(207,0,'marid',0,325,550,'{\"type\":104,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6033}',1,0,'[\"Simsalabim\",\"Feel the power of my magic, tiny mortal!\",\"Be careful what you wish for.\",\"Wishes can come true.\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"90\"},{\"name\":\"Earth\",\"percent\":\"40\"},{\"name\":\"Energy\",\"percent\":\"60\"},{\"name\":\"Holy\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,15,22,0,'blood','[{\"id\":\"2158\",\"count\":\"1\",\"chance\":\"300\"},{\"id\":\"1872\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2442\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2183\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"5912\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2070\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2148\",\"count\":\"14\",\"chance\":\"100000\"},{\"id\":\"2146\",\"count\":\"3\",\"chance\":\"7000\"},{\"id\":\"2063\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2677\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"10000\"}]','[{\"name\":\"blue djinn\",\"chance\":\"15\"}]'),
(208,0,'Frost Dragon',0,2300,3800,'{\"type\":248,\"corpse\":7091}',20,0,'[\"YOU WILL FREEZE!\",\"ZCHHHHH!\",\"I am so cool\",\"Chill out!.\"]','[\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"90\"},{\"name\":\"Earth\",\"percent\":\"50\"}]',0,0,0,1,0,0,0,1,1,1,0,35,22,1,'undead','[{\"id\":\"2152\",\"count\":\"50\",\"chance\":\"23000\"},{\"id\":\"2672\",\"count\":\"5\",\"chance\":\"11500\"},{\"id\":\"2547\",\"count\":\"6\",\"chance\":\"4100\"},{\"id\":\"2796\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2479\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"200\"},{\"id\":\"7402\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"100\"}]','[]'),
(209,0,'Wyrm',0,1450,1825,'{\"type\":291,\"corpse\":8941}',35,0,'[\"GRRR!\",\"GRROARR!\"]','[\"energy\",\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"20\"},{\"name\":\"Earth\",\"percent\":\"75\"}]',0,0,0,1,0,0,0,1,1,1,0,30,30,0,'blood','[{\"id\":\"2672\",\"count\":\"3\",\"chance\":\"9000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"30000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"8921\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"7411\",\"count\":1,\"chance\":\"1444\"},{\"id\":\"2546\",\"count\":\"10\",\"chance\":\"6000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"7430\",\"count\":1,\"chance\":\"1654\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"5332\"},{\"id\":\"8871\",\"count\":1,\"chance\":\"2400\"}]','[]'),
(210,0,'Sea Serpent',390,2300,3200,'{\"type\":275,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":8307}',65,0,'[\"CHHHRRRR\",\"HISSSS\"]','[\"ice\",\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"30\"}]',0,0,0,1,0,0,0,1,1,1,0,20,16,1,'blood','[{\"id\":\"2148\",\"count\":\"71\",\"chance\":\"40000\"},{\"id\":\"2146\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7391\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2672\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"7888\",\"count\":1,\"chance\":\"3100\"},{\"id\":\"8887\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"7424\",\"count\":1,\"chance\":\"2600\"}]','[]'),
(211,0,'dragon lord',0,2100,1900,'{\"type\":39,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5984}',13,0,'[\"ZCHHHHH\",\"YOU WILL BURN!\"]','[\"fire\",\"paralyze\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Earth\",\"percent\":\"80\"}]',0,0,0,1,0,0,0,1,1,1,0,35,22,1,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"2672\",\"count\":\"5\",\"chance\":\"80000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"1188\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"933\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2547\",\"count\":\"7\",\"chance\":\"8222\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"6666\"},{\"id\":\"5948\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2149\",\"count\":\"2\",\"chance\":\"833\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"3222\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"2033\"},{\"id\":\"7402\",\"count\":1,\"chance\":\"1833\"},{\"id\":\"2414\",\"count\":1,\"chance\":\"1309\"},{\"id\":\"5882\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(212,0,'dragon',0,700,1000,'{\"type\":34,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5973}',1,0,'[\"GROOAAARRR\",\"FCHHHHH\"]','[\"fire\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"80\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,1,'blood','[{\"id\":\"2672\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2455\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2434\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"7430\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2546\",\"count\":\"10\",\"chance\":\"4000\"},{\"id\":\"5877\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"90000\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2516\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2145\",\"count\":\"3\",\"chance\":\"1538\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2409\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"5920\",\"count\":\"2\",\"chance\":\"5000\"}]','[]'),
(213,0,'hydra',0,1900,2250,'{\"type\":121,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6048}',10,0,'[\"FCHHHHH\",\"HISSSS\"]','[\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,35,25,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"65000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"90000\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"5000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"4850\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"4000\"},{\"id\":\"2536\",\"count\":1,\"chance\":\"555\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[]'),
(214,0,'dragon hatchling',0,185,380,'{\"type\":271,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7621}',1,0,'[\"Fchu?\"]','[\"fire\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"15\"},{\"name\":\"Earth\",\"percent\":\"70\"}]',0,0,0,1,0,0,0,1,1,1,0,20,25,1,'blood','[{\"id\":\"7618\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2672\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2148\",\"count\":\"26\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"}]','[]'),
(215,0,'dragon lord hatchling',0,645,750,'{\"type\":272,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7622}',1,0,'[\"Zchu?\"]','[\"fire\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,38,25,1,'blood','[{\"id\":\"7620\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2672\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"7891\",\"count\":1,\"chance\":\"200\"}]','[]'),
(216,0,'frost dragon hatchling',0,745,800,'{\"type\":283,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7969}',1,0,'[\"Rooawwrr\",\"Fchu?\"]','[\"fire\",\"earth\",\"ice\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"5\"}]',0,0,0,1,0,0,0,1,1,1,0,38,25,1,'undead','[{\"id\":\"7618\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2672\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2148\",\"count\":\"26\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"}]','[]'),
(217,0,'Demodras',0,3100,4500,'{\"type\":204,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5984}',40,0,'[\"ZCHHHHH\",\"I WILL SET THE WORLD IN FIRE!\",\"I WILL PROTECT MY BROOD!\"]','[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,25,35,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2672\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"588\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"333\"},{\"id\":\"2547\",\"count\":\"10\",\"chance\":\"2222\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"2222\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"6666\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2149\",\"count\":\"2\",\"chance\":\"833\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"2222\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"5948\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"5882\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"5919\",\"count\":1,\"chance\":\"100000\"}]','[{\"name\":\"dragon\",\"chance\":\"17\"}]'),
(218,0,'dwarf geomancer',0,245,380,'{\"type\":66,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6015}',1,0,'[\"Hail Durin!\",\"Earth is the strongest element.\",\"Dust to dust.\"]','[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,15,15,1,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2673\",\"count\":\"3\",\"chance\":\"6666\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2787\",\"count\":\"3\",\"chance\":\"20000\"}]','[]'),
(219,0,'dwarf guard',650,165,245,'{\"type\":70,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6013}',1,0,'[\"Hail Durin!\"]','[\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"25\"},{\"name\":\"Earth\",\"percent\":\"10\"}]',1,1,0,1,0,0,0,0,1,1,0,30,25,1,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2787\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5880\",\"count\":\"2\",\"chance\":\"2500\"},{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"90000\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2150\",\"count\":\"2\",\"chance\":\"4000\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(220,0,'dwarf soldier',360,70,135,'{\"type\":71,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6014}',1,0,'[\"Hail Durin!\"]','[]','[{\"name\":\"Earth\",\"percent\":\"10\"}]',1,1,0,1,0,0,0,0,1,1,0,20,9,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"100000\"},{\"id\":\"2543\",\"count\":\"10\",\"chance\":\"20000\"},{\"id\":\"2481\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2455\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2554\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"7363\",\"count\":\"8\",\"chance\":\"6000\"},{\"id\":\"5880\",\"count\":\"2\",\"chance\":\"2500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2525\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2213\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(221,0,'dwarf',320,45,90,'{\"type\":69,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6007}',1,0,'[\"Hail Durin!\"]','[]','[{\"name\":\"Earth\",\"percent\":\"10\"}]',1,1,1,0,0,0,0,0,1,1,0,10,8,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"100000\"},{\"id\":\"2388\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"5880\",\"count\":\"2\",\"chance\":\"2500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2787\",\"count\":\"2\",\"chance\":\"20000\"}]','[]'),
(222,0,'Foreman Kneebiter',0,570,445,'{\"type\":70,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6013}',1,0,'[]','[\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"90\"},{\"name\":\"Physical\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,22,15,0,'blood','[{\"id\":\"5880\",\"count\":\"2\",\"chance\":\"2500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"90000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"6666\"}]','[]'),
(223,0,'Mad Technomancer',0,55,1000,'{\"type\":66,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6015}',1,0,'[\"I\'m going to make them an offer they can\'t refuse.\",\"My masterplan cannot fail!\",\"Gentlemen, you can\'t fight here! This is the War Room!\"]','[\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"80\"},{\"name\":\"Fire\",\"percent\":\"60\"},{\"name\":\"Energy\",\"percent\":\"10\"},{\"name\":\"Holy\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,1,1,1,0,15,15,1,'blood','[{\"id\":\"7699\",\"count\":1,\"chance\":\"100000\"}]','[]'),
(224,0,'dworc fleshhunter',100,35,85,'{\"type\":215,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6058}',10,0,'[\"Grak brrretz!\",\"Grow truk grrrrr.\",\"Prek tars, dekklep zurk.\"]','[\"poison\"]','[]',0,1,1,0,0,0,0,1,1,1,0,8,3,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"40000\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"3956\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3952\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2420\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2007\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(225,0,'dworc venomsniper',100,30,80,'{\"type\":216,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6059}',10,0,'[\"grak brrretz!\",\"grow truk grrrrr.\",\"prek tars, dekklep zurk.\"]','[\"poison\"]','[]',0,1,1,0,0,0,0,1,1,1,0,15,3,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"40000\"},{\"id\":\"3983\",\"count\":1,\"chance\":\"200\"},{\"id\":\"3975\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2420\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2007\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(226,0,'dworc voodoomaster',80,50,80,'{\"type\":214,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6055}',10,1,'[\"grak brrretz!\",\"grow truk grrrrr.\",\"prek tars, dekklep zurk.\"]','[\"poison\"]','[]',0,1,1,0,0,0,0,1,1,1,0,8,3,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"40000\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"3973\",\"count\":1,\"chance\":\"100\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3967\",\"count\":1,\"chance\":\"50\"},{\"id\":\"3955\",\"count\":1,\"chance\":\"80\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2420\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2007\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(227,0,'elephant',500,160,320,'{\"type\":211,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6052}',10,0,'[\"Hooooot-Toooooot!\",\"Tooooot.\",\"Troooooot!\"]','[]','[{\"name\":\"Physical\",\"percent\":\"25\"},{\"name\":\"Ice\",\"percent\":\"20\"}]',1,1,0,1,0,0,0,0,1,1,0,34,20,1,'blood','[{\"id\":\"3973\",\"count\":1,\"chance\":\"900\"},{\"id\":\"3956\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"33333\"}]','[]'),
(228,0,'mammoth',0,160,320,'{\"type\":199,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6074}',10,0,'[\"Moohhhhooooo!\"]','[]','[{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Physical\",\"percent\":\"15\"},{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,1,1,0,0,0,0,1,1,0,30,25,0,'blood','[{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"33333\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"10000\"}]','[]'),
(229,0,'elf arcanist',0,175,220,'{\"type\":63,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6011}',5,0,'[\"Feel my wrath!\",\"For the Daughter of the Stars!\",\"I\'ll bring balance upon you!\",\"Tha\'shi Cenath!\",\"Vihil Ealuel!\"]','[\"energy\",\"fire\",\"poison\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,15,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2578\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2682\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2802\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2600\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2689\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"5922\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2544\",\"count\":\"10\",\"chance\":\"20000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2032\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2062\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2154\",\"count\":1,\"chance\":\"1333\"}]','[]'),
(230,0,'elf scout',360,75,160,'{\"type\":64,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6012}',3,0,'[\"Tha\'shi Ab\'Dendriel!\",\"Feel the sting of my arrows!\",\"Thy blood will quench the soil\'s thirst!\",\"Evicor guide my arrow.\",\"Your existence will end here!\"]','[\"outfit\",\"drunk\",\"invisible\"]','[]',1,1,0,1,0,0,0,0,1,1,0,18,7,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2544\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2681\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"80000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"5921\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(231,0,'elf',320,42,100,'{\"type\":62,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6003}',1,0,'[\"Ulathil beia Thratha!\",\"Bahaha aka!\",\"You are not welcome here.\",\"Flee as long as you can.\",\"Death to the defilers!\"]','[\"outfit\",\"drunk\",\"invisible\"]','[]',1,1,1,0,0,0,0,0,1,1,0,12,6,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"100000\"},{\"id\":\"2544\",\"count\":\"6\",\"chance\":\"100000\"},{\"id\":\"2480\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2005\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2674\",\"count\":\"4\",\"chance\":\"100000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"5921\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(232,0,'dharalion',0,1200,1200,'{\"type\":203,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6011}',10,1,'[\"You desecrated this temple!\",\"Noone will stop my ascension!\",\"My powers are divine!\",\"Muahahaha!\"]','[\"fire\",\"poison\",\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,25,15,1,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2578\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2682\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2802\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2600\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2689\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2544\",\"count\":\"10\",\"chance\":\"20000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2032\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2062\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2154\",\"count\":1,\"chance\":\"1333\"}]','[{\"name\":\"demon skeleton\",\"chance\":\"6\"}]'),
(233,0,'Energy Elemental',0,450,500,'{\"type\":293,\"corpse\":1495}',15,0,'[]','[\"ice\",\"fire\",\"energy\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"25\"},{\"name\":\"Holy\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,1,1,1,0,50,50,0,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"8303\",\"count\":\"2\",\"chance\":\"1500\"},{\"id\":\"7439\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"2150\",\"count\":\"3\",\"chance\":\"4500\"},{\"id\":\"8920\",\"count\":1,\"chance\":\"1000\"}]','[]'),
(234,0,'Massive Energy Elemental',0,850,1100,'{\"type\":290,\"corpse\":1495}',40,0,'[]','[\"ice\",\"energy\",\"fire\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"}]',0,0,0,1,0,0,0,1,1,1,0,30,30,0,'undead','[]','[]'),
(235,0,'Overcharged Energy Elemental',0,450,500,'{\"type\":293,\"corpse\":8966}',25,0,'[]','[\"energy\",\"fire\",\"ice\"]','[]',0,0,0,1,0,0,0,1,1,1,0,25,25,0,'undead','[{\"id\":2148,\"count\":\"100\",\"chance\":\"50000\"},{\"id\":2148,\"count\":\"22\",\"chance\":\"50000\"},{\"id\":7838,\"count\":\"3\",\"chance\":\"6250\"},{\"id\":8303,\"count\":1,\"chance\":\"2063\"}]','[]'),
(236,0,'Energy Overlord',0,2800,4000,'{\"type\":290,\"corpse\":8966}',35,0,'[]','[\"ice\",\"energy\",\"poison\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,40,40,0,'undead','[]','[]'),
(237,0,'Cat',200,0,20,'{\"type\":276,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":2839}',1,0,'[\"Mew!\",\"Meow Meow!\"]','[]','[]',1,1,1,0,0,0,0,0,0,1,0,2,0,0,'blood','[]','[]'),
(238,0,'lion',320,30,80,'{\"type\":41,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5986}',1,0,'[\"Grrrrh\"]','[]','[]',1,1,0,0,0,0,0,1,1,1,0,13,6,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"80000\"}]','[]'),
(239,0,'tiger',420,40,75,'{\"type\":125,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6051}',10,1,'[]','[]','[]',1,1,0,1,0,0,0,0,1,1,0,15,5,1,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"33333\"}]','[]'),
(240,0,'coral frog',305,20,60,'{\"type\":226,\"head\":114,\"body\":98,\"legs\":97,\"feet\":114,\"corpse\":6079}',5,0,'[\"ribbit!\"]','[]','[]',1,0,1,0,0,0,0,0,1,1,0,5,1,0,'blood','[{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"60000\"},{\"id\":\"3976\",\"count\":\"5\",\"chance\":\"53500\"}]','[]'),
(241,0,'crimson frog',305,20,60,'{\"type\":226,\"head\":94,\"body\":78,\"legs\":94,\"feet\":78,\"corpse\":6079}',5,0,'[\"Ribbit!Ribbit!\"]','[]','[]',1,0,1,0,0,0,0,0,1,1,0,8,8,0,'blood','[{\"id\":\"2148\",\"count\":\"3\",\"chance\":\"60000\"},{\"id\":\"3976\",\"count\":\"6\",\"chance\":\"53500\"}]','[]'),
(242,0,'orchid frog',0,20,60,'{\"type\":226,\"head\":109,\"body\":14,\"legs\":109,\"feet\":114,\"corpse\":6079}',5,0,'[\"Ribbit!Ribbit!\"]','[]','[]',0,0,1,0,0,0,0,0,1,1,0,3,2,0,'blood','[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"60000\"},{\"id\":\"3976\",\"count\":\"7\",\"chance\":\"53500\"}]','[]'),
(243,0,'toad',400,60,135,'{\"type\":222,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6077}',10,0,'[\"Ribbit!Ribbit!\"]','[\"poison\"]','[]',1,0,1,1,0,0,0,1,1,1,0,10,12,0,'blood','[{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"60000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"12000\"},{\"id\":\"2667\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2382\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"400\"}]','[]'),
(244,0,'Jagged Earth Elemental',0,1300,1500,'{\"type\":285,\"corpse\":8933}',30,0,'[\"Stomp STOMP\"]','[\"paralyze\",\"invisible\",\"earth\"]','[{\"name\":\"Death\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,0,'undead','[{\"id\":\"2148\",\"count\":\"140\",\"chance\":\"100000\"},{\"id\":\"8298\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"5880\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"2149\",\"count\":\"2\",\"chance\":\"2200\"}]','[]'),
(245,0,'Muddy Earth Elemental',0,450,650,'{\"type\":301,\"corpse\":8933}',20,0,'[]','[\"paralyze\",\"invisible\",\"earth\"]','[{\"name\":\"Death\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"20\"},{\"name\":\"Physical\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,30,30,0,'undead','[{\"id\":\"2148\",\"count\":\"44\",\"chance\":\"100000\"},{\"id\":\"5880\",\"count\":\"1\",\"chance\":\"1800\"},{\"id\":\"8298\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(246,0,'Massive Earth Elemental',0,850,1330,'{\"type\":285,\"corpse\":8933}',35,0,'[]','[\"paralyze\",\"invisible\",\"earth\",\"energy\"]','[{\"name\":\"Death\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"20\"},{\"name\":\"Physical\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,30,30,0,'undead','[{\"id\":\"2148\",\"count\":\"114\",\"chance\":\"100000\"},{\"id\":\"1294\",\"count\":\"9\",\"chance\":\"9000\"}]','[]'),
(247,0,'Earth Overlord',0,2800,4000,'{\"type\":285,\"corpse\":8933}',55,0,'[]','[\"paralyze\",\"invisible\",\"earth\",\"energy\"]','[{\"name\":\"Death\",\"percent\":\"30\"},{\"name\":\"Physical\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,30,30,0,'undead','[{\"id\":\"2148\",\"count\":\"130\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"6000\"},{\"id\":\"8305\",\"count\":1,\"chance\":\"2200\"}]','[]'),
(248,0,'gargoyle',0,150,450,'{\"type\":95,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6027}',15,0,'[\"Harrrr Harrrr!\",\"Stone sweet stone.\",\"Feel my claws, softskin.\",\"Chhhhhrrrrk!\",\"There is a stone in your shoe!\"]','[\"fire\",\"poison\",\"lifedrain\"]','[]',0,0,0,1,0,0,0,1,1,1,0,20,26,1,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2489\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"100000\"}]','[]'),
(249,0,'stone golem',590,280,270,'{\"type\":67,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6005}',1,0,'[]','[\"fire\",\"poison\",\"paralyze\"]','[]',1,1,0,1,0,0,0,0,1,1,0,18,10,1,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"5880\",\"count\":\"2\",\"chance\":\"2500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1295\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1294\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2395\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2580\",\"count\":1,\"chance\":\"5000\"}]','[]'),
(250,0,'grorlam',0,2400,3000,'{\"type\":205,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6005}',30,1,'[]','[\"poison\",\"paralyze\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Holy\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,40,35,1,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1295\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1294\",\"count\":\"20\",\"chance\":\"20000\"},{\"id\":\"2395\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2580\",\"count\":1,\"chance\":\"5000\"}]','[]'),
(251,0,'ghost',100,120,150,'{\"type\":48,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5993}',1,0,'[\"Huh!\",\"Shhhhhh\",\"Buuuuuh\"]','[\"physical\",\"earth\",\"death\",\"lifedrain\",\"paralyze\"]','[]',0,0,0,1,0,0,0,0,1,1,0,10,10,0,'UNDEAD','[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"100000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2404\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"5909\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2804\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2532\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2182\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1962\",\"count\":1,\"chance\":\"5000\"}]','[]'),
(252,0,'Phantasm',0,0,65,'{\"type\":241,\"head\":20,\"corpse\":6344}',15,0,'[\"Oh my, you forgot to put your pants on!\",\"Weeheeheeheehee!\",\"Its nothing but a dream!\",\"Give in!\"]','[]','[]',0,0,1,1,0,0,0,0,1,1,0,20,25,1,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"}]','[]'),
(253,0,'phantasm',0,4400,3950,'{\"type\":241,\"head\":20,\"corpse\":6344}',30,0,'[\"Oh my, you forgot to put your pants on!\",\"Weeheeheeheehee!\",\"Its nothing but a dream!\",\"Give in!\"]','[\"physical\",\"death\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"50\"},{\"name\":\"Ice\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,0,0,1,'undead','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"70000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"90000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2804\",\"count\":\"2\",\"chance\":\"9500\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5944\",\"count\":\"1\",\"chance\":\"9500\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"8500\"}]','[{\"name\":\"Phantasm summon\",\"chance\":\"20\"}]'),
(254,0,'pirate ghost',0,250,275,'{\"type\":196,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6071}',5,0,'[\"Yooh Ho Hooh Ho!\",\"Hell is waiting for You!\"]','[\"physical\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,1,1,0,0,0,0,1,1,0,25,20,0,'UNDEAD','[{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"52000\"},{\"id\":\"2655\",\"count\":1,\"chance\":\"666\"},{\"id\":\"2237\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2236\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"666\"},{\"id\":\"2383\",\"count\":1,\"chance\":\"800\"},{\"id\":\"1951\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"5917\",\"count\":1,\"chance\":\"916\"}]','[]'),
(255,0,'spectre',0,1350,1350,'{\"type\":235,\"head\":20,\"corpse\":6348}',15,0,'[\"Revenge ... is so ... sweet!\",\"Life...force!\",\"Feed me your... lifeforce!\"]','[\"earth\",\"death\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,20,25,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"6667\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"5909\",\"count\":\"1\",\"chance\":\"2222\"},{\"id\":\"2134\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2071\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"2857\"},{\"id\":\"5944\",\"count\":\"1\",\"chance\":\"1429\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"909\"}]','[]'),
(256,0,'Wisp',0,0,115,'{\"type\":294,\"corpse\":6324}',1,1,'[\"Crackle!\",\"Tsshh\"]','[\"death\",\"paralyze\"]','[]',0,0,0,0,0,0,0,1,1,1,0,15,10,0,'undead','[{\"id\":\"10521\",\"count\":1,\"chance\":\"200\"}]','[]'),
(257,0,'Frost Giant',490,150,270,'{\"type\":257,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7330}',8,0,'[\"Hmm Humansoup\",\"Stand still ya tasy snack!\",\"Joh Thun!\",\"Brore Smode!\",\"Horre Sjan Flan!\"]','[\"ice\"]','[]',0,1,0,1,0,0,0,0,1,1,0,23,22,0,'undead','[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"1955\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"3444\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"5333\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"2777\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"2055\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"33333\"}]','[]'),
(258,0,'Frost Giantess',490,150,275,'{\"type\":265,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7330}',3,0,'[\"Ymirs Mjalle!\",\"No run so much, must stay fat!\",\"Horre, Sjan Flan!\",\"Damned fast food.\",\"Come kiss the cook!\"]','[\"ice\"]','[{\"name\":\"Fire\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"10\"}]',0,1,0,1,0,0,0,0,1,1,0,23,22,0,'undead','[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"1955\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"2055\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"5333\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"4444\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"2777\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"3444\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"33333\"}]','[]'),
(259,0,'Cyclops Drone',490,200,325,'{\"type\":280,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":7848}',1,0,'[\"Fee! Fie! Foe! Fum!\",\"Luttl pest!\"]','[]','[{\"name\":\"Fire\",\"percent\":\"10\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"8\"}]',1,1,0,1,0,0,0,0,1,1,0,25,25,0,'blood','[{\"id\":\"2148\",\"count\":\"24\",\"chance\":\"100000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7588\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2129\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"}]','[]'),
(260,0,'Behemoth',0,2500,4000,'{\"type\":55,\"corpse\":5999}',30,1,'[\"You\'re so little!\",\"Human flesh - delicious!\",\"Crush the intruders!\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"80\"},{\"name\":\"Holy\",\"percent\":\"30\"},{\"name\":\"Fire\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"10\"},{\"name\":\"Physical\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,45,40,1,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"29500\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"29500\"},{\"id\":\"2023\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"7368\",\"count\":\"2\",\"chance\":\"7000\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"7650\"},{\"id\":\"2416\",\"count\":1,\"chance\":\"15750\"},{\"id\":\"2489\",\"count\":1,\"chance\":\"2650\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2666\",\"count\":\"6\",\"chance\":\"6500\"},{\"id\":\"5893\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"900\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"925\"},{\"id\":\"2174\",\"count\":1,\"chance\":\"850\"},{\"id\":\"5930\",\"count\":1,\"chance\":\"350\"},{\"id\":\"2454\",\"count\":1,\"chance\":\"550\"},{\"id\":\"7396\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"450\"},{\"id\":\"7413\",\"count\":1,\"chance\":\"150\"}]','[]'),
(261,0,'cyclops',490,150,260,'{\"type\":22,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":5962}',1,0,'[\"Il lorstok human!\",\"Toks utat.\",\"Human, uh whil dyh!\",\"Youh ah trak!\",\"Let da mashing begin!\"]','[]','[{\"name\":\"Energy\",\"percent\":\"25\"},{\"name\":\"Holy\",\"percent\":\"20\"}]',1,1,0,1,0,0,0,0,1,1,0,15,15,1,'blood','[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2209\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2129\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2511\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"33333\"}]','[]'),
(262,0,'Stonecracker',0,3500,4000,'{\"type\":55,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":5999}',45,1,'[\"HUAHAHA\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"15\"},{\"name\":\"Holy\",\"percent\":\"30\"},{\"name\":\"Physical\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,45,40,1,'undead','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2023\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"7368\",\"count\":\"7\",\"chance\":\"1200\"},{\"id\":\"2174\",\"count\":\"1\",\"chance\":\"800\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2231\",\"count\":\"1\",\"chance\":\"7000\"},{\"id\":\"5930\",\"count\":\"2\",\"chance\":\"4000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"9488\"},{\"id\":\"2454\",\"count\":1,\"chance\":\"6688\"},{\"id\":\"2150\",\"count\":\"2\",\"chance\":\"4000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2463\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2553\",\"count\":\"1\",\"chance\":\"6000\"},{\"id\":\"2666\",\"count\":\"6\",\"chance\":\"40000\"},{\"id\":\"2489\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2416\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2161\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"5930\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"5893\",\"count\":\"1\",\"chance\":\"1200\"}]','[]'),
(263,0,'Roaring Water Elemental',0,1300,1750,'{\"type\":11,\"corpse\":8965}',85,0,'[]','[\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"50\"},{\"name\":\"Holy\",\"percent\":\"30\"}]',0,0,0,1,0,0,0,1,1,1,0,30,30,0,'undead','[]','[]'),
(264,0,'Ice Overlord',0,1950,4000,'{\"type\":11,\"corpse\":8965}',85,0,'[]','[\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"25\"},{\"name\":\"Holy\",\"percent\":\"25\"}]',0,0,0,1,0,0,0,1,1,1,0,30,30,0,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"8300\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"8878\",\"count\":1,\"chance\":\"1666\"}]','[]'),
(265,0,'Water Elemental',0,450,550,'{\"type\":286,\"corpse\":2016}',30,0,'[]','[\"ice\",\"fire\",\"poison\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"70\"},{\"name\":\"Holy\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"30\"}]',0,0,0,1,0,0,0,1,1,1,0,30,30,0,'undead','[]','[]'),
(266,0,'Massive Water Elemental',0,1950,2350,'{\"type\":11,\"corpse\":2016}',85,0,'[]','[\"fire\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"100\"},{\"name\":\"Ice\",\"percent\":\"100\"},{\"name\":\"Holy\",\"percent\":\"30\"},{\"name\":\"Death\",\"percent\":\"60\"}]',0,0,0,1,0,0,0,1,1,1,0,30,30,0,'undead','[]','[]'),
(267,0,'ancient scarab',0,720,1000,'{\"type\":79,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6021}',55,1,'[]','[\"earth\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,20,25,1,'VENOM','[{\"id\":\"2150\",\"count\":\"4\",\"chance\":\"1200\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"100000\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"600\"},{\"id\":\"2148\",\"count\":\"22\",\"chance\":\"99900\"},{\"id\":\"2135\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2159\",\"count\":\"4\",\"chance\":\"555\"},{\"id\":\"2142\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2440\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2540\",\"count\":\"1\",\"chance\":\"500\"}]','[{\"name\":\"larva\",\"chance\":\"15\"}]'),
(268,0,'bug',250,18,29,'{\"type\":45,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5990}',1,0,'[]','[]','[]',1,1,1,0,0,0,0,0,1,1,0,3,2,0,'venom','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"4\",\"chance\":\"100000\"},{\"id\":\"2679\",\"count\":\"3\",\"chance\":\"50000\"}]','[]'),
(269,0,'centipede',335,30,70,'{\"type\":124,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6050}',1,0,'[]','[\"poison\"]','[]',1,1,1,1,0,0,0,0,1,1,0,3,4,0,'venom','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"32\",\"chance\":\"100000\"},{\"id\":\"2480\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2412\",\"count\":1,\"chance\":\"2222\"}]','[]'),
(270,0,'Cockroach',0,0,1,'{\"type\":284,\"corpse\":8593}',1,0,'[]','[\"poison\"]','[]',0,0,1,0,0,0,0,1,0,1,0,0,0,0,'venom','[{\"id\":\"8616\",\"count\":1,\"chance\":\"99999\"}]','[]'),
(271,0,'Bugzin',250,2000000,29,'{\"type\":45,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5990}',10,0,'[]','[]','[]',0,1,1,0,0,0,0,0,1,1,0,3,2,0,'venom','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"4\",\"chance\":\"100000\"},{\"id\":\"2679\",\"count\":\"3\",\"chance\":\"50000\"}]','[]'),
(272,0,'larva',355,40,70,'{\"type\":82,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6023}',1,0,'[]','[\"poison\",\"paralyze\"]','[]',1,1,1,0,0,0,0,0,1,1,0,14,14,0,'VENOM','[{\"id\":\"2148\",\"count\":\"8\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"1\",\"chance\":\"80000\"}]','[]'),
(273,0,'butterfly',0,0,2,'{\"type\":228,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":4313}',40,0,'[]','[\"poison\",\"paralyze\",\"drunk\"]','[]',0,0,0,1,0,0,0,1,1,1,0,4,0,0,'venom','[]','[]'),
(274,0,'scarab',395,120,320,'{\"type\":83,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6024}',1,1,'[]','[\"earth\",\"paralyze\"]','[{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Physical\",\"percent\":\"15\"},{\"name\":\"Energy\",\"percent\":\"10\"}]',1,1,0,1,0,0,0,1,1,1,0,15,12,1,'VENOM','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"80000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2544\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2439\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2442\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2159\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2149\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2150\",\"count\":\"3\",\"chance\":\"2000\"}]','[]'),
(275,0,'wasp',280,25,35,'{\"type\":44,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5989}',120,0,'[\"Bsssssss\"]','[\"poison\"]','[]',1,1,1,0,0,0,0,0,1,1,0,8,4,0,'VENOM','[{\"id\":\"5902\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(276,0,'lizard sentinel',0,110,265,'{\"type\":114,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6040}',10,0,'[\"Tssss!\"]','[\"earth\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"10\"},{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,1,1,0,0,0,1,1,1,0,20,20,0,'blood','[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"100000\"},{\"id\":\"2182\",\"count\":1,\"chance\":\"1950\"},{\"id\":\"2425\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"3974\",\"count\":1,\"chance\":\"1466\"},{\"id\":\"3965\",\"count\":1,\"chance\":\"1150\"},{\"id\":\"5876\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2147\",\"count\":\"4\",\"chance\":\"4000\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"5881\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(277,0,'lizard snakecharmer',0,210,325,'{\"type\":115,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6041}',1,0,'[\"I ssssmell warm blood!\",\"Shhhhhhhh\"]','[\"poison\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,1,1,0,0,0,1,1,1,0,15,17,0,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2154\",\"count\":1,\"chance\":\"1955\"},{\"id\":\"2191\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2182\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"5876\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2181\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2150\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"5881\",\"count\":\"1\",\"chance\":\"5000\"}]','[{\"name\":\"cobra\",\"chance\":\"15\"}]'),
(278,0,'lizard templar',0,115,410,'{\"type\":113,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":4251}',1,0,'[\"Hissss!\"]','[\"earth\"]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,20,25,0,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"3973\",\"count\":1,\"chance\":\"300\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"5876\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3974\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2457\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"3963\",\"count\":1,\"chance\":\"433\"},{\"id\":\"5881\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(279,0,'minotaur archer',390,65,100,'{\"type\":24,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5982}',1,0,'[\"Ruan Wihmpy!\",\"Kaplar!\"]','[]','[]',1,1,0,0,0,0,0,1,1,1,0,8,7,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"28\",\"chance\":\"100000\"},{\"id\":\"2543\",\"count\":\"18\",\"chance\":\"70000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"50000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2481\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"5878\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2455\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"7363\",\"count\":\"8\",\"chance\":\"6000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2648\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(280,0,'minotaur guard',550,160,185,'{\"type\":29,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5983}',1,0,'[\"Kirll Karrrl!\",\"Kaplar!\"]','[]','[]',1,1,0,1,0,0,0,0,1,1,0,25,15,1,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"70000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"5878\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2580\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2648\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(281,0,'minotaur mage',0,150,155,'{\"type\":23,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5981}',1,0,'[\"#W Learrn tha secrret uf deathhh!\",\"Kaplar!\"]','[\"energy\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,18,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"5878\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2404\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2362\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2817\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2311\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2648\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"7425\",\"count\":1,\"chance\":\"1000\"}]','[]'),
(282,0,'minotaur',330,50,100,'{\"type\":25,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5969}',1,0,'[\"kaplar!\"]','[]','[]',1,1,1,0,0,0,0,0,1,1,0,11,11,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"28\",\"chance\":\"100000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2554\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"5878\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2172\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(283,0,'Apprentice Sheng',0,100,95,'{\"type\":23,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5981}',1,0,'[\"I will protect the secrets of my master!\",\"This isle will become ours alone!\",\"Kaplar!\"]','[\"energy\"]','[]',0,0,0,1,0,0,0,0,1,1,0,13,12,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"5878\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2404\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2362\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2817\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2311\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"7425\",\"count\":1,\"chance\":\"1000\"}]','[{\"name\":\"hyena\",\"chance\":\"100\"}]'),
(284,0,'The Horned Fox',0,200,265,'{\"type\":202,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":5983}',1,0,'[\"You will never get me!\",\"I\'ll be back!\",\"Catch me, if you can!\",\"Help me, boys!\"]','[\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,16,17,1,'blood','[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"2410\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2667\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"5804\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2207\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1818\"}]','[{\"name\":\"minotaur archer\",\"chance\":\"13\"},{\"name\":\"minotaur guard\",\"chance\":\"13\"}]'),
(285,0,'general murius',0,1300,1200,'{\"type\":202,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5983}',10,0,'[\"Feel the power of the Mooh\'Tah!\",\"You will get what you deserve!\",\"For the king!\",\"Guards!\"]','[\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,22,16,1,'blood','[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"2410\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2667\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1988\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2148\",\"count\":\"1\",\"chance\":\"2857\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2207\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1818\"}]','[{\"name\":\"minotaur archer\",\"chance\":\"15\"},{\"name\":\"minotaur guard\",\"chance\":\"12\"}]'),
(286,0,'Squirrel',200,0,15,'{\"type\":74,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":3119}',1,0,'[\"ChChCh\"]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,1,0,0,'blood','[{\"id\":\"2684\",\"count\":\"4\",\"chance\":\"70000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"6541\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"6542\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"6543\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"6544\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"6545\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"1989\",\"count\":1,\"chance\":\"250\"}]','[]'),
(287,0,'Goblin Demon',290,25,50,'{\"type\":35,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":2916}',1,0,'[\"MUHAHAHAHA!\",\"I SMELL FEEEEEAAAR!\",\"CHAMEK ATH UTHUL ARAK!\",\"Your resistance is futile!\",\"Your soul will be mine!\"]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,8,6,0,'blood','[{\"id\":\"2230\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"2449\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2379\",\"count\":\"1\",\"chance\":\"18000\"},{\"id\":\"2667\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2148\",\"count\":\"9\",\"chance\":\"50000\"},{\"id\":\"2467\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2461\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2235\",\"count\":\"1\",\"chance\":\"7000\"},{\"id\":\"2406\",\"count\":\"1\",\"chance\":\"9000\"},{\"id\":\"2559\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"1294\",\"count\":\"3\",\"chance\":\"30000\"}]','[]'),
(288,0,'badger',200,5,20,'{\"type\":105,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6034}',1,0,'[]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,3,1,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2671\",\"count\":\"1\",\"chance\":\"50000\"}]','[]'),
(289,0,'bat',250,10,30,'{\"type\":122,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6053}',1,0,'[]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,6,1,0,'blood','[{\"id\":\"5894\",\"count\":\"1\",\"chance\":\"2000\"}]','[]'),
(290,0,'deer',260,0,25,'{\"type\":31,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5970}',1,0,'[]','[]','[]',1,1,1,0,0,0,0,1,0,1,0,2,2,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"100000\"}]','[]'),
(291,0,'The Halloween Hare',0,0,2000,'{\"type\":74,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0}',1,0,'[]','[\"name\",\"name\",\"name\",\"name\",\"name\",\"name\",\"name\",\"name\",\"name\",\"name\"]','[]',0,0,0,1,0,0,0,0,1,0,0,999,999,0,'blood','[]','[]'),
(292,0,'hyaena',275,20,60,'{\"type\":94,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6026}',1,0,'[]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,3,1,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"90000\"}]','[]'),
(293,0,'pig',255,0,150,'{\"type\":60,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6000}',1,0,'[]','[]','[]',1,1,1,0,0,0,0,1,0,1,0,2,2,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2671\",\"count\":\"4\",\"chance\":\"100000\"}]','[]'),
(294,0,'rabbit',220,0,15,'{\"type\":74,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6017}',1,0,'[]','[]','[]',1,1,1,0,0,0,0,1,0,1,0,2,1,0,'blood','[{\"id\":\"2684\",\"count\":\"4\",\"chance\":\"70000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"20000\"}]','[]'),
(295,0,'Silver Rabbit',220,0,15,'{\"type\":262,\"head\":69,\"body\":66,\"legs\":69,\"feet\":66,\"corpse\":7338}',1,0,'[]','[]','[]',1,1,0,0,0,0,0,0,1,1,0,7,6,0,'blood','[{\"id\":\"2362\",\"count\":\"1\",\"chance\":\"65000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"65000\"}]','[]'),
(296,0,'skunk',200,3,20,'{\"type\":106,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6035}',1,0,'[]','[\"poison\"]','[]',1,1,1,0,0,0,0,1,1,1,0,5,1,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2671\",\"count\":\"1\",\"chance\":\"50000\"}]','[]'),
(297,0,'dark monk',50,145,1200,'{\"type\":225,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6080}',1,1,'[\"This is where your path will end!\",\"Your end has come.\",\"You are no match for us!\"]','[\"outfit\",\"drunk\",\"invisible\"]','[]',0,1,0,1,0,0,0,0,1,1,0,23,22,1,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2439\",\"count\":1,\"chance\":\"400\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2177\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2689\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2440\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(298,0,'monk',600,200,240,'{\"type\":57,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6080}',1,1,'[\"\'Repent heretic!, Feel my kick!. A prayer for Zathroth\"]','[\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Death\",\"percent\":\"50\"}]',1,0,0,1,0,0,0,0,1,1,0,22,20,1,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2689\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"1428\"}]','[]'),
(299,0,'tha exp carrier',600,2000,1000000,'{\"type\":57,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6080}',60,1,'[\"Come kill me and get exp ^^\"]','[\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,0,0,1,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2689\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"1428\"}]','[]'),
(300,0,'Training Vip',0,0,9000000,'{\"typeEx\":5787,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":3128}',1,0,'[\"Bate que nem homem porra!\",\"Feel my kick!\",\"Voce nunca vai me mata.\"]','[\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,0,0,0,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2689\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"1428\"}]','[]'),
(301,0,'fernfang',0,320,250,'{\"type\":206,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6080}',10,1,'[\"You desecrated this place!\",\"I will cleanse this isle!\",\"Grrrrrrr\",\"Yoooohhuuuu!\"]','[\"poison\",\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,10,15,1,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2689\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"1428\"}]','[{\"name\":\"war wolf\",\"chance\":\"13\"}]'),
(302,0,'Saco de Pancada',0,0,9000000,'{\"typeEx\":5787,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":3128}',1,0,'[\"Bate que nem homem porra!\",\"Feel my kick!\",\"Voce nunca vai me mata.\"]','[\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,0,0,0,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2689\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"1428\"}]','[]'),
(303,0,'necromancer',0,580,580,'{\"type\":9,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6080}',1,0,'[\"Your corpse will be mine!\",\"Taste the sweetness of death!\"]','[\"earth\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Energy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,20,20,1,'blood','[{\"id\":\"2186\",\"count\":1,\"chance\":\"110\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2032\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2804\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2182\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2412\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2229\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2747\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2663\",\"count\":1,\"chance\":\"909\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"666\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"5000\"}]','[{\"name\":\"ghoul\",\"chance\":\"17\"},{\"name\":\"ghost\",\"chance\":\"15\"},{\"name\":\"mummy\",\"chance\":\"13\"}]'),
(304,0,'priestess',0,420,390,'{\"type\":58,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6081}',1,0,'[\"Your energy is mine.\",\"Now, your life has come to an end, hahahha!\",\"Throw the soul on the altar!\"]','[\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"40\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,19,10,1,'blood','[{\"id\":\"2674\",\"count\":\"2\",\"chance\":\"7500\"},{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2183\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1977\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2032\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2070\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2529\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"23000\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2802\",\"count\":\"1\",\"chance\":\"14000\"},{\"id\":\"2803\",\"count\":\"1\",\"chance\":\"6000\"},{\"id\":\"2420\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2143\",\"count\":\"2\",\"chance\":\"5000\"},{\"id\":\"2760\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2791\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2192\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2114\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2134\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2151\",\"count\":\"2\",\"chance\":\"4000\"},{\"id\":\"2145\",\"count\":\"2\",\"chance\":\"1666\"}]','[{\"name\":\"ghoul\",\"chance\":\"8\"}]'),
(305,0,'necropharus',0,1100,800,'{\"type\":209,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6080}',10,0,'[\"You will rise as my servant!\",\"Praise to my master Urgith!\"]','[\"poison\",\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,25,25,1,'blood','[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"5809\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"3969\",\"count\":1,\"chance\":\"150\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"220\"},{\"id\":\"2804\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2186\",\"count\":1,\"chance\":\"500\"},{\"id\":\"5809\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2483\",\"count\":\"1\",\"chance\":\"8500\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"22500\"},{\"id\":\"2231\",\"count\":\"1\",\"chance\":\"6000\"},{\"id\":\"2230\",\"count\":\"1\",\"chance\":\"30000\"},{\"id\":\"2449\",\"count\":\"1\",\"chance\":\"19900\"},{\"id\":\"2541\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2412\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2229\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2747\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"833\"},{\"id\":\"2663\",\"count\":1,\"chance\":\"909\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"666\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"5000\"}]','[{\"name\":\"ghoul\",\"chance\":\"20\"},{\"name\":\"ghost\",\"chance\":\"17\"},{\"name\":\"mummy\",\"chance\":\"15\"}]'),
(306,0,'orc berserker',590,195,210,'{\"type\":8,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5980}',15,1,'[\"Utani Tempo Hur\"]','[\"poison\"]','[]',1,1,0,1,0,0,0,0,1,1,0,12,15,1,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2378\",\"count\":1,\"chance\":\"5000\"}]','[]'),
(307,0,'orc leader',640,270,450,'{\"type\":59,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6001}',5,0,'[\"Ulderek futgyr human!\"]','[\"fire\",\"outfit\",\"drunk\",\"invisible\"]','[]',1,1,0,1,0,0,0,0,1,1,0,30,20,1,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"2410\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"2419\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2667\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"1988\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"1\",\"chance\":\"2857\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2207\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1818\"}]','[]'),
(308,0,'orc rider',390,110,180,'{\"type\":4,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6010}',60,1,'[\"Grrrrrrr\",\"Orc arga Huummmak!\"]','[]','[]',0,1,0,1,0,0,0,0,1,1,0,20,9,1,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"50000\"},{\"id\":\"2129\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1988\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2428\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2480\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2425\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2513\",\"count\":1,\"chance\":\"6666\"}]','[]'),
(309,0,'orc shaman',0,110,115,'{\"type\":6,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":5978}',1,0,'[]','[\"energy\",\"poison\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,0,0,0,0,1,1,1,0,10,8,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2458\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2817\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2389\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2079\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2190\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"1000\"}]','[{\"name\":\"snake\",\"chance\":\"25\"}]'),
(310,0,'orc spearman',310,38,105,'{\"type\":50,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5996}',1,0,'[\"Ugaar!\"]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,12,6,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"80000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"80000\"},{\"id\":\"2468\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2220\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2420\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2389\",\"count\":\"1\",\"chance\":\"6666\"}]','[]'),
(311,0,'orc warlord',0,670,950,'{\"type\":2,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6008}',15,0,'[\"Ranat Ulderek!\",\"Orc buta bana!\",\"Ikem rambo zambo!\",\"Futchi maruk buta!\"]','[\"fire\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,35,22,1,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"50000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2667\",\"count\":\"1\",\"chance\":\"6667\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2428\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1988\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2434\",\"count\":1,\"chance\":\"833\"},{\"id\":\"2497\",\"count\":1,\"chance\":\"667\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"556\"},{\"id\":\"2499\",\"count\":1,\"chance\":\"333\"},{\"id\":\"2500\",\"count\":1,\"chance\":\"250\"},{\"id\":\"2537\",\"count\":1,\"chance\":\"200\"}]','[]'),
(312,0,'orc warrior',360,50,125,'{\"type\":7,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5979}',1,0,'[\"Grow truk grrrr.\",\"Trak grrrr brik.\",\"Alk!\"]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,14,8,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"40000\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2420\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2007\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(313,0,'orc',300,25,70,'{\"type\":5,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":5966}',1,0,'[\"Grak brrretz!\",\"Grow truk grrrrr.\",\"Prek tars, dekklep zurk.\"]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,8,4,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"33333\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2480\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2526\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(314,0,'Warlord Ruzad',0,1700,1950,'{\"type\":2,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6008}',25,0,'[\"Ranat Ulderek!\",\"Orc buta bana!\",\"Ikem rambo zambo!\",\"Futchi maruk buta!\"]','[\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"80\"},{\"name\":\"Energy\",\"percent\":\"30\"}]',0,0,0,1,0,0,0,0,1,1,0,35,32,1,'blood','[{\"id\":\"2148\",\"count\":\"59\",\"chance\":\"50000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2667\",\"count\":\"1\",\"chance\":\"6667\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"8970\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"7333\"},{\"id\":\"2399\",\"count\":\"18\",\"chance\":\"6666\"},{\"id\":\"2428\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"1988\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"18180\"},{\"id\":\"2497\",\"count\":1,\"chance\":\"6670\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"5506\"}]','[{\"name\":\"Orc Berserker\",\"chance\":\"10\"}]'),
(315,0,'Goblin Leader',290,50,75,'{\"type\":61,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6002}',1,0,'[\"Go go, Gobo attack !!\",\"Me the greenest and the meanest!\",\"Me have power to crush you!\",\"Goblinkiller! Catch him !!\"]','[]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"20\"}]',1,1,1,0,0,0,0,1,1,1,0,12,10,0,'blood','[{\"id\":\"3976\",\"count\":\"7\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"14\",\"chance\":\"100000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2559\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1294\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2667\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2235\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(316,0,'Goblin Scavenger',310,37,60,'{\"type\":297,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6002}',1,0,'[\"Shiny, Shiny!\",\"You mean!\",\"All mine!\",\"Uhh!\"]','[]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"20\"}]',1,1,1,0,0,0,0,1,1,1,0,10,8,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"9\",\"chance\":\"100000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2559\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1294\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2667\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2235\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(317,0,'goblin',290,25,50,'{\"type\":61,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6002}',1,0,'[\"Me have him!\",\"Zig Zag! Gobo attack!\",\"Help! Goblinkiller!\",\"Bugga! Bugga!\",\"Me green, me mean!\"]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,8,6,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2420\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2559\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1294\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2667\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2235\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(318,0,'Goblin Assassin',360,52,75,'{\"type\":296,\"corpse\":6002}',1,0,'[\"Goblin Powahhh!\"]','[]','[{\"name\":\"Energy\",\"percent\":\"10\"},{\"name\":\"Holy\",\"percent\":\"5\"}]',1,1,1,0,0,0,0,1,1,1,0,15,15,0,'blood','[{\"id\":\"2148\",\"count\":\"9\",\"chance\":\"100000\"},{\"id\":\"2667\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2235\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"1294\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2406\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2559\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(319,0,'Assasin',450,105,175,'{\"type\":129,\"head\":95,\"body\":95,\"legs\":95,\"feet\":95,\"corpse\":6080}',2,1,'[\"Die!\",\"Feel the hand of death!\",\"You are on my deathlist!\"]','[\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"8\"},{\"name\":\"Death\",\"percent\":\"5\"}]',0,1,0,1,0,0,0,0,1,1,0,20,15,1,'blood','[{\"id\":\"2513\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2404\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"80000\"},{\"id\":\"3969\",\"count\":\"1\",\"chance\":\"200\"},{\"id\":\"2403\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"3968\",\"count\":\"1\",\"chance\":\"1300\"},{\"id\":\"3969\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2510\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2145\",\"count\":\"1\",\"chance\":\"200\"},{\"id\":\"2457\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"7366\",\"count\":\"4\",\"chance\":\"1500\"},{\"id\":\"2509\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2050\",\"count\":\"2\",\"chance\":\"30000\"}]','[]'),
(320,0,'black knight',0,1600,1800,'{\"type\":131,\"head\":95,\"body\":95,\"legs\":95,\"feet\":95,\"addons\":3,\"corpse\":6080}',60,0,'[\"MINE!\",\"NO PRISONERS!\",\"NO MERCY!\",\"By Bolg\'s Blood!\",\"You\'re no match for me!\"]','[\"poison\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"95\"},{\"name\":\"Energy\",\"percent\":\"80\"},{\"name\":\"Death\",\"percent\":\"20\"},{\"name\":\"Physical\",\"percent\":\"25\"}]',0,0,0,1,0,0,0,0,1,1,0,30,25,1,'blood','[{\"id\":\"2457\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2489\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2490\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2389\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2691\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"100000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2430\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2414\",\"count\":1,\"chance\":\"909\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"555\"},{\"id\":\"2133\",\"count\":1,\"chance\":\"800\"}]','[]'),
(321,0,'hero',0,1200,1400,'{\"type\":73,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6080}',24,0,'[\"Let\'s have a fight!\",\"Welcome to my battleground.\",\"Have you seen princess Lumelia?\",\"I will sing a tune at your grave.\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"30\"},{\"name\":\"Physical\",\"percent\":\"25\"},{\"name\":\"Holy\",\"percent\":\"25\"},{\"name\":\"Earth\",\"percent\":\"50\"},{\"name\":\"Energy\",\"percent\":\"25\"},{\"name\":\"Ice\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,20,30,1,'blood','[{\"id\":\"2491\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2661\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2681\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2121\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"5911\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2519\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2488\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2071\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2544\",\"count\":\"13\",\"chance\":\"20000\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2744\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(322,0,'hunter',0,150,150,'{\"type\":129,\"head\":95,\"body\":116,\"legs\":121,\"feet\":115,\"corpse\":6080}',1,0,'[\"Guess who we\'re hunting, haha!\"]','[\"poison\"]','[]',0,0,0,1,0,0,0,1,1,1,0,10,8,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"5875\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2544\",\"count\":\"15\",\"chance\":\"10000\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"2147\",\"count\":\"2\",\"chance\":\"3333\"},{\"id\":\"2675\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2690\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2201\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(323,0,'nomad',420,60,160,'{\"type\":146,\"head\":114,\"body\":20,\"legs\":22,\"feet\":2,\"corpse\":6080}',1,0,'[\"We are swift as the wind of the desert\",\"We are the true sons of the desert!\"]','[]','[]',1,1,0,1,0,0,0,1,1,1,0,13,10,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2544\",\"count\":\"15\",\"chance\":\"10000\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"2147\",\"count\":\"2\",\"chance\":\"3333\"},{\"id\":\"2675\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2690\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2201\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(324,0,'smuggler',390,48,130,'{\"type\":134,\"head\":95,\"body\":0,\"legs\":113,\"feet\":115,\"corpse\":6080}',1,0,'[\"I will silence you forever!\",\"You saw something you shouldn\'t!\"]','[]','[]',1,1,0,1,0,0,0,1,1,1,0,13,10,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2544\",\"count\":\"15\",\"chance\":\"10000\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"2147\",\"count\":\"2\",\"chance\":\"3333\"},{\"id\":\"2675\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2690\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2201\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(325,0,'stalker',0,90,150,'{\"type\":128,\"head\":95,\"body\":116,\"legs\":95,\"feet\":114,\"corpse\":6080}',1,0,'[]','[\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,10,14,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2425\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(326,0,'poacher',450,150,150,'{\"type\":129,\"head\":95,\"body\":116,\"legs\":121,\"feet\":115,\"addons\":1,\"corpse\":6080}',1,0,'[\"You will not live to tell anyone!\",\"You are my game today!\"]','[\"poison\"]','[]',0,1,0,1,0,0,0,1,1,1,0,10,8,0,'blood','[{\"id\":\"2649\",\"count\":\"2\",\"chance\":\"100000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"4444\"},{\"id\":\"2544\",\"count\":\"17\",\"chance\":\"10000\"},{\"id\":\"2545\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2579\",\"count\":1,\"chance\":\"2222\"}]','[]'),
(327,0,'wild warrior',420,55,120,'{\"type\":131,\"head\":57,\"body\":57,\"legs\":57,\"feet\":57,\"corpse\":6080}',1,1,'[\"An enemy!\",\"Gimme your money!\"]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,18,9,0,'blood','[{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"2511\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2530\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"909\"},{\"id\":\"2110\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(328,0,'Man in the Cave',0,555,770,'{\"type\":128,\"head\":95,\"body\":116,\"legs\":95,\"feet\":114,\"addons\":2,\"corpse\":6080}',1,0,'[\"THE MONKS ARE MINE!\",\"I will rope you up! All of you!\",\"You have been roped up!\",\"A MIC to rule them all!\"]','[\"fire\",\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,25,30,0,'blood','[{\"id\":\"2148\",\"count\":\"27\",\"chance\":\"100000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2691\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"5913\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"7463\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"7386\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"7458\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2173\",\"count\":1,\"chance\":\"500\"}]','[{\"name\":\"Monk\",\"chance\":\"20\"}]'),
(329,0,'Rukor Zad',450,380,380,'{\"type\":129,\"head\":95,\"body\":95,\"legs\":95,\"feet\":95,\"addons\":3,\"corpse\":6080}',15,1,'[\"I can kill a man in a thousand ways, and thats only with a spoon!\",\"You shouldn\'t have come here\"]','[\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"8\"},{\"name\":\"Death\",\"percent\":\"5\"}]',0,0,0,1,0,0,0,0,1,1,0,20,25,1,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"80000\"},{\"id\":\"3969\",\"count\":1,\"chance\":\"100000\"}]','[]'),
(330,0,'Smuggler baron silvertoe',390,170,280,'{\"type\":134,\"head\":95,\"body\":0,\"legs\":113,\"feet\":115,\"corpse\":6080}',5,0,'[\"i will make your dead look like an accident!\",\"you should not have interferred with my bussiness\"]','[]','[]',0,0,0,1,0,0,0,0,1,1,0,13,10,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"20000\"}]','[{\"name\":\"Wild Warrior\",\"chance\":\"20\"}]'),
(331,0,'ashmunrah',0,3100,5000,'{\"type\":88,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6031}',28,0,'[\"Ahhhh all those long years.\",\"No mortal or undead will steal my secrets.\"]','[\"earth\",\"death\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,30,25,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"4845\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"100000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2140\",\"count\":1,\"chance\":\"1000\"}]','[{\"name\":\"ancient scarab\",\"chance\":\"13\"},{\"name\":\"green djinn\",\"chance\":\"12\"}]'),
(332,0,'dipthrah',0,2900,4200,'{\"type\":87,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6031}',35,0,'[\"Come closer to learn the final lesson.\",\"You can\'t escape death forever.\"]','[\"physical\",\"death\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,25,25,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2353\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"150\",\"chance\":\"100000\"},{\"id\":\"2158\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2146\",\"count\":\"3\",\"chance\":\"4000\"}]','[{\"name\":\"priestess\",\"chance\":\"15\"}]'),
(333,0,'Mahrdis',0,3050,3900,'{\"type\":89,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6025}',30,0,'[\"Ashes to ashes!\",\"Fire, Fire!\",\"The eternal flame demands its due!\",\"Burnnnnnnnnn!\",\"May my flames engulf you!\"]','[\"death\",\"fire\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,30,25,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2146\",\"count\":1,\"chance\":\"1600\"},{\"id\":\"2353\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2141\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2539\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"2147\",\"count\":\"3\",\"chance\":\"10000\"}]','[{\"name\":\"fire elemental\",\"chance\":\"15\"}]'),
(334,0,'omruc',0,2950,4300,'{\"type\":84,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6025}',75,0,'[\"Now chhhou shhhee me ... Now chhhou don\'t!!\",\"Catchhhh me if chhhou can.\"]','[\"death\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,25,20,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2144\",\"count\":1,\"chance\":\"1850\"},{\"id\":\"2354\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2544\",\"count\":\"21\",\"chance\":\"13000\"},{\"id\":\"2545\",\"count\":\"20\",\"chance\":\"10000\"},{\"id\":\"2546\",\"count\":\"15\",\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"2444\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7365\",\"count\":\"2\",\"chance\":\"8000\"},{\"id\":\"2547\",\"count\":\"3\",\"chance\":\"7000\"},{\"id\":\"2145\",\"count\":\"3\",\"chance\":\"4000\"}]','[{\"name\":\"Stalker\",\"chance\":\"10\"}]'),
(335,0,'rahemos',0,3100,3700,'{\"type\":84,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6025}',40,0,'[\"It\'s a kind of magic.\",\"Abrah Kadabrah!\",\"Nothing hidden in my warpings.\",\"It\'s not a trick, it\'s Rahemos.\",\"Meet my dear friend from hell.\",\"I will make you believe in magic.\"]','[\"death\",\"ice\",\"earth\",\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"95\"},{\"name\":\"Energy\",\"percent\":\"95\"}]',0,0,0,1,0,0,0,0,1,1,0,35,30,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"1444\"},{\"id\":\"2348\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2153\",\"count\":1,\"chance\":\"2400\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2150\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"2184\",\"count\":1,\"chance\":\"1300\"}]','[{\"name\":\"demon\",\"chance\":\"12\"}]'),
(336,0,'thalas',0,2950,4100,'{\"type\":86,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6025}',50,0,'[\"You will become a feast for my maggots.\",\"Death and decay!\"]','[]','[]',0,0,0,1,0,0,0,0,1,1,0,30,20,1,'venom','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2351\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2409\",\"count\":1,\"chance\":\"4444\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"6000\"},{\"id\":\"2451\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2255\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"4000\"}]','[{\"name\":\"slime\",\"chance\":\"100\"},{\"name\":\"slime\",\"chance\":\"100\"},{\"name\":\"slime\",\"chance\":\"100\"},{\"name\":\"slime\",\"chance\":\"100\"},{\"name\":\"slime\",\"chance\":\"100\"},{\"name\":\"slime\",\"chance\":\"100\"},{\"name\":\"slime\",\"chance\":\"100\"},{\"name\":\"slime\",\"chance\":\"100\"}]'),
(337,0,'vashresamun',0,2945,4000,'{\"type\":90,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6025}',45,1,'[\"Come my maidens, we have visitors!\",\"Are you enjoying my music?\",\"If music is the food of death, drop dead.\"]','[\"death\",\"invisible\",\"lifedrain\"]','[{\"name\":\"Fire\",\"percent\":\"20\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,30,20,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2646\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2349\",\"count\":1,\"chance\":\"2349\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2445\",\"count\":1,\"chance\":\"1222\"},{\"id\":\"2139\",\"count\":1,\"chance\":\"1333\"}]','[{\"name\":\"banshee\",\"chance\":\"12\"}]'),
(338,0,'Brutus Bloodbeard',0,1100,1900,'{\"type\":98,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6080}',40,0,'[]','[\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,25,1,'blood','[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"40000\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"40000\"},{\"id\":\"6099\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"9999\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"9000\"}]','[]'),
(339,0,'Lethal Lissy',0,2700,3000,'{\"type\":155,\"head\":114,\"body\":0,\"legs\":57,\"feet\":114,\"addons\":3,\"corpse\":6081}',40,0,'[]','[\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,25,1,'blood','[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"40000\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"40000\"},{\"id\":\"6100\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"9999\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"9000\"}]','[{\"name\":\"Pirate Buccaneers\",\"chance\":\"30\"}]'),
(340,0,'Deadeye Devious',0,800,2200,'{\"type\":151,\"head\":114,\"body\":76,\"legs\":33,\"feet\":116,\"addons\":2,\"corpse\":6080}',40,0,'[\"Let\'s kill \'em\",\"Arrrgh!\",\"You\'ll never take me alive!\"]','[\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,25,1,'blood','[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"40000\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"40000\"},{\"id\":\"6102\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"9999\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"9000\"}]','[]'),
(341,0,'Ron the Ripper',0,1000,2500,'{\"type\":151,\"head\":95,\"body\":94,\"legs\":115,\"feet\":115,\"addons\":1,\"corpse\":6080}',40,0,'[]','[\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,25,1,'blood','[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"40000\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"40000\"},{\"id\":\"6101\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"9999\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"2379\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"9000\"}]','[]'),
(342,0,'pirate Buccaneer',595,250,425,'{\"type\":97,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6080}',5,0,'[\"Give up!\"]','[]','[]',1,0,0,1,0,0,0,1,1,1,0,23,25,1,'blood','[{\"id\":\"2148\",\"count\":\"43\",\"chance\":\"40000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"2057\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2238\",\"count\":1,\"chance\":\"10045\"},{\"id\":\"6095\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"5553\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"5926\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5091\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"5792\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"6126\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"6098\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"6097\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(343,0,'pirate Corsair',775,350,675,'{\"type\":98,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6080}',5,0,'[]','[\"invisible\"]','[]',0,1,0,1,0,0,0,0,1,1,0,20,25,1,'blood','[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"50000\"},{\"id\":\"2385\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2489\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2521\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"6096\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"6095\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5926\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5091\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"5462\",\"count\":1,\"chance\":\"450\"},{\"id\":\"5792\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"6098\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(344,0,'pirate cutthroat',495,175,325,'{\"type\":96,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6080}',5,0,'[]','[]','[]',0,1,1,1,0,0,0,0,1,1,0,23,25,0,'blood','[{\"id\":\"2148\",\"count\":\"53\",\"chance\":\"50000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"5918\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"6095\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"5710\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5553\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5927\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5091\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"5792\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"6126\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"6098\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"6097\",\"count\":\"1\",\"chance\":\"3000\"}]','[]'),
(345,0,'pirate marauder',490,125,210,'{\"type\":93,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6080}',5,0,'[\"Plundeeeeer!\"]','[]','[]',0,1,0,1,0,0,0,0,1,1,0,20,15,0,'blood','[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"42000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"5917\",\"count\":1,\"chance\":\"916\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"6098\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"6095\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"5926\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5091\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"5792\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"6126\",\"count\":\"1\",\"chance\":\"1428\"},{\"id\":\"6098\",\"count\":\"1\",\"chance\":\"1428\"},{\"id\":\"6097\",\"count\":\"1\",\"chance\":\"1428\"}]','[]'),
(346,0,'The plasmother',0,8900,16050,'{\"type\":238,\"corpse\":6532}',45,0,'[\"Blubb\"]','[\"poison\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'venom','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"2857\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"6535\",\"count\":1,\"chance\":\"100000\"}]','[]'),
(347,0,'Dracola',0,7750,16200,'{\"type\":231,\"corpse\":6306}',65,0,'[\"FEEEED MY ETERNAL HUNGER!\"]','[\"earth\",\"fire\",\"death\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,55,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"25000\"},{\"id\":\"6546\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2236\",\"count\":1,\"chance\":\"6667\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7420\",\"count\":1,\"chance\":\"1900\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"1818\"},{\"id\":\"5944\",\"count\":\"1\",\"chance\":\"1538\"},{\"id\":\"2547\",\"count\":\"15\",\"chance\":\"4000\"}]','[]'),
(348,0,'The Countess Sorrow',0,5150,13500,'{\"type\":241,\"head\":20,\"corpse\":6344}',60,0,'[\"Oh my, you forgot to put your pants on!\",\"Weeheeheeheehee!\",\"Welcome to my nightmare!\",\"Its nothing but a dream!\",\"Give in!\"]','[\"physical\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,25,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2804\",\"count\":\"2\",\"chance\":\"10000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"6536\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5944\",\"count\":\"1\",\"chance\":\"1538\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"2500\"}]','[{\"name\":\"Phantasm\",\"chance\":\"30\"}]'),
(349,0,'The Imperor',0,8000,15000,'{\"type\":237,\"corpse\":8635}',55,1,'[\"Muahaha!\",\"He he he!\"]','[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,15,15,1,'fire','[{\"id\":\"2148\",\"count\":\"79\",\"chance\":\"100000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"6534\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"999\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"6577\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2548\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"6529\",\"count\":\"5\",\"chance\":\"5000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"6577\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"833\"},{\"id\":\"2464\",\"count\":1,\"chance\":\"7887\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"5666\"},{\"id\":\"7899\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7900\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7891\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"7777\"},{\"id\":\"2150\",\"count\":\"1\",\"chance\":\"8888\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"4555\"}]','[{\"name\":\"diabolic imp\",\"chance\":\"30\"}]'),
(350,0,'Massacre',0,14000,30000,'{\"type\":244,\"corpse\":6336}',85,1,'[]','[\"earth\",\"energy\",\"fire\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,60,60,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"6\",\"chance\":\"70000\"},{\"id\":\"2666\",\"count\":\"8\",\"chance\":\"40000\"},{\"id\":\"2452\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"9429\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"6540\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2522\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"5944\",\"count\":\"1\",\"chance\":\"17000\"}]','[{\"name\":\"juggernaut\",\"chance\":\"30\"}]'),
(351,0,'Guardian of The Sea',480,400,45000,'{\"type\":72,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6064}',150,0,'[\"I Am Guardian of The Sea\",\"Shrrrr\"]','[\"ice\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,1,0,1,0,0,0,1,1,1,0,20,20,0,'blood','[{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2200\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"2118\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"3333\"},{\"id\":\"2229\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2656\",\"count\":1,\"chance\":\"500\"}]','[{\"name\":\"Spirit of Jack\",\"chance\":\"5\"}]'),
(352,0,'Quara Abominator',670,550,55000,'{\"type\":46,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6065}',150,0,'[]','[\"fire\",\"lifedrain\",\"paralyze\",\"ice\",\"invisible\"]','[]',0,1,0,1,0,0,0,0,1,1,0,15,15,0,'undead','[{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2150\",\"count\":\"3\",\"chance\":\"2222\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2000\"}]','[]'),
(353,0,'Spirit of Jack',495,175,15025,'{\"type\":96,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6080}',5,0,'[]','[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,1,1,1,0,0,0,0,1,1,0,23,25,0,'blood','[{\"id\":\"2148\",\"count\":\"53\",\"chance\":\"50000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"5918\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"6095\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"5710\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5553\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5927\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5091\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2509\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"5792\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"6126\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"6098\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"6097\",\"count\":\"1\",\"chance\":\"3000\"}]','[]'),
(354,0,'Fire Overlord',0,2800,4000,'{\"type\":243,\"corpse\":8964}',40,0,'[]','[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"15\"},{\"name\":\"Energy\",\"percent\":\"25\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,25,25,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"8888\"},{\"id\":\"8304\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"8877\",\"count\":1,\"chance\":\"900\"},{\"id\":\"7899\",\"count\":1,\"chance\":\"1210\"}]','[]'),
(355,0,'Massive Fire Elemental',0,950,1800,'{\"type\":242,\"corpse\":1492}',20,0,'[]','[\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,25,25,1,'fire','[]','[]'),
(356,0,'Blistering fire elemental',850,1300,1500,'{\"type\":242,\"corpse\":8964}',5,0,'[]','[\"fire\"]','[]',1,1,0,1,0,0,0,0,1,1,0,20,20,0,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2147\",\"count\":\"3\",\"chance\":\"3200\"},{\"id\":\"8299\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"8921\",\"count\":1,\"chance\":\"1800\"}]','[]'),
(357,0,'Blazing fire elemental',850,580,580,'{\"type\":49,\"corpse\":8964}',1,0,'[]','[\"fire\"]','[]',1,1,0,1,0,0,0,0,1,1,0,20,20,0,'fire','[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"8299\",\"count\":1,\"chance\":\"900\"}]','[]'),
(358,0,'Fire Elemental',650,280,280,'{\"type\":49,\"corpse\":1492}',1,0,'[]','[\"fire\",\"death\",\"invisible\"]','[]',1,1,0,1,0,0,0,0,1,1,0,0,0,0,'fire','[]','[]'),
(359,0,'Hellfire Fighter',0,2200,3800,'{\"type\":243,\"corpse\":6324}',23,0,'[\"Fire!\"]','[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"75\"},{\"name\":\"Energy\",\"percent\":\"25\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,35,35,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2147\",\"count\":\"4\",\"chance\":\"8888\"},{\"id\":\"5944\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2239\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"1111\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"2111\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"7899\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"7894\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2145\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"3550\"}]','[]'),
(360,0,'quara constrictor scout',670,250,450,'{\"type\":46,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6065}',35,0,'[]','[\"fire\",\"ice\"]','[]',0,1,0,1,0,0,0,0,1,1,0,15,15,0,'undead','[{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2150\",\"count\":\"3\",\"chance\":\"2222\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"1800\"}]','[]'),
(361,0,'quara hydromancer scout',0,800,1100,'{\"type\":47,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6066}',30,0,'[\"Qua hah tsh!\"]','[\"ice\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,18,15,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2240\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2143\",\"count\":\"2\",\"chance\":\"1333\"},{\"id\":\"2144\",\"count\":\"2\",\"chance\":\"1429\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"1538\"},{\"id\":\"2150\",\"count\":\"2\",\"chance\":\"1000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"500\"}]','[]'),
(362,0,'quara mantassin scout',480,100,220,'{\"type\":72,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6064}',25,0,'[\"Zuerk Pachak!\",\"Shrrrr\"]','[\"ice\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,1,0,1,0,0,0,0,1,1,0,15,15,0,'blood','[{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"3333\"},{\"id\":\"2229\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2146\",\"count\":\"1\",\"chance\":\"1400\"}]','[]'),
(363,0,'quara pincher scout',0,600,775,'{\"type\":77,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6063}',15,0,'[\"Clank clank!\",\"Clap!\"]','[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,35,30,0,'blood','[{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2147\",\"count\":\"3\",\"chance\":\"1538\"}]','[]'),
(364,0,'quara predator scout',0,400,890,'{\"type\":20,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6067}',35,0,'[\"Gnarrr!\"]','[\"ice\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,29,20,1,'blood','[{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2145\",\"count\":\"1\",\"chance\":\"1429\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"4000\"}]','[]'),
(365,0,'quara constrictor',670,250,450,'{\"type\":46,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6065}',150,0,'[]','[\"fire\",\"ice\"]','[]',0,1,0,1,0,0,0,0,1,1,0,15,15,0,'undead','[{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2150\",\"count\":\"3\",\"chance\":\"2222\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2000\"}]','[]'),
(366,0,'quara hydromancer',0,800,1100,'{\"type\":47,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6066}',45,0,'[\"Qua hah tsh!\"]','[\"ice\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,18,15,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2189\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"5741\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2240\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"3333\"},{\"id\":\"2143\",\"count\":\"2\",\"chance\":\"1333\"},{\"id\":\"2144\",\"count\":\"2\",\"chance\":\"1429\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"1900\"},{\"id\":\"2150\",\"count\":\"2\",\"chance\":\"1000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(367,0,'quara mantassin',480,400,800,'{\"type\":72,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6064}',150,0,'[\"Zuerk Pachak!\",\"Shrrrr\"]','[\"ice\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,1,0,1,0,0,0,1,1,1,0,15,15,0,'blood','[{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2200\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"2118\"},{\"id\":\"7892\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"3333\"},{\"id\":\"2229\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"1250\"},{\"id\":\"2656\",\"count\":1,\"chance\":\"500\"}]','[]'),
(368,0,'quara pincher',0,1200,1800,'{\"type\":77,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6063}',10,0,'[\"Clank clank!\",\"Clap!\"]','[\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,40,35,0,'blood','[{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2381\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2147\",\"count\":\"3\",\"chance\":\"1538\"}]','[]'),
(369,0,'quara predator',0,1600,2200,'{\"type\":20,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6067}',45,0,'[\"Gnarrr!\"]','[\"ice\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,45,40,1,'blood','[{\"id\":\"2670\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"7368\",\"count\":\"3\",\"chance\":\"1900\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"7897\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2145\",\"count\":\"1\",\"chance\":\"1429\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"7368\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"5741\",\"count\":1,\"chance\":\"1100\"}]','[]'),
(370,0,'Thul',0,1800,3000,'{\"type\":46,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6065}',1,0,'[\"Gaaahhh!\"]','[\"ice\"]','[]',0,0,0,1,0,0,0,0,1,1,0,40,35,0,'undead','[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"5895\",\"count\":\"1\",\"chance\":\"100000\"},{\"id\":\"5741\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"7383\",\"count\":1,\"chance\":\"1200\"}]','[{\"name\":\"massive water elemental\",\"chance\":\"8\"}]'),
(371,0,'cave rat',250,10,30,'{\"type\":56,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5964}',1,0,'[\"Meeeeep!\",\"Meep!\"]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,7,9,0,'blood','[{\"id\":\"3976\",\"count\":\"6\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(372,0,'rat',200,5,20,'{\"type\":21,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5964}',1,0,'[]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,5,7,0,'blood','[{\"id\":\"3976\",\"count\":\"6\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"7\",\"chance\":\"80000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(373,0,'Munster',250,23,58,'{\"type\":56,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":2813}',1,0,'[\"Meeeeep!\"]','[]','[]',0,0,1,0,0,0,0,1,1,1,0,4,2,0,'blood','[{\"id\":\"2148\",\"count\":\"16\",\"chance\":\"100000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2687\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2650\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"5000\"}]','[{\"name\":\"Rat\",\"chance\":\"20\"}]'),
(374,0,'cobra',275,30,65,'{\"type\":81,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":3007}',1,0,'[\"zzzzzz\"]','[\"poison\"]','[]',1,1,1,0,0,0,0,0,1,1,0,4,1,0,'blood','[{\"id\":\"2220\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(375,0,'crocodile',350,40,105,'{\"type\":119,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6046}',1,0,'[]','[]','[{\"name\":\"Physical\",\"percent\":\"5\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"}]',1,1,0,1,0,0,0,1,1,1,0,5,13,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"3982\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"3982\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"3983\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"}]','[]'),
(376,0,'serpent spawn',0,5000,5000,'{\"type\":220,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":4323}',60,1,'[\"Ssssolus for the one\",\"HISSSS\",\"Tsssse one will risssse again\",\"I bring you deathhhh, mortalssss\"]','[\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,1,'VENOM','[{\"id\":\"2182\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"800\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"500\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"3971\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"300\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2182\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2796\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2547\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2146\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2479\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"400\"}]','[]'),
(377,0,'snake',205,10,15,'{\"type\":28,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":2817}',1,0,'[\"Zzzzzzt\"]','[\"poison\"]','[]',1,1,1,0,0,0,0,0,1,1,0,1,0,0,'blood','[]','[]'),
(378,0,'wyvern',0,515,795,'{\"type\":239,\"corpse\":6302}',48,0,'[\"Shiiiiiek\"]','[\"earth\",\"drunk\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,1,1,1,0,18,25,1,'blood','[{\"id\":\"2148\",\"count\":\"67\",\"chance\":\"100000\"},{\"id\":\"2672\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2547\",\"count\":\"3\",\"chance\":\"1667\"},{\"id\":\"2647\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7408\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2127\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2187\",\"count\":1,\"chance\":\"1111\"},{\"id\":\"2146\",\"count\":\"1\",\"chance\":\"1000\"}]','[]'),
(379,0,'Mimic',0,70,50,'{\"type\":92,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":1740}',390,0,'[]','[]','[]',0,0,1,0,0,0,0,0,1,1,0,3,2,0,'blood','[{\"id\":\"2148\",\"count\":\"3\",\"chance\":\"100000\"}]','[]'),
(380,0,'betrayed wraith',0,3500,4200,'{\"type\":233,\"corpse\":6316}',25,1,'[\"Rrrah!\"]','[\"death\",\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"50\"}]',0,0,0,1,0,0,0,0,1,1,0,15,15,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"40000\"},{\"id\":\"7365\",\"count\":\"6\",\"chance\":\"5500\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"2394\",\"count\":1,\"chance\":\"14000\"},{\"id\":\"5799\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2173\",\"count\":1,\"chance\":\"900\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2226\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"5741\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7416\",\"count\":1,\"chance\":\"850\"},{\"id\":\"2145\",\"count\":\"3\",\"chance\":\"6222\"},{\"id\":\"3976\",\"count\":\"2\",\"chance\":\"4333\"}]','[]'),
(381,0,'bonebeast',0,580,515,'{\"type\":101,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6030}',1,0,'[\"Cccchhhhhhhhh!\",\"Knooorrrrr!\"]','[\"death\",\"earth\",\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,35,20,1,'UNDEAD','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"5925\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2541\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2450\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(382,0,'demon skeleton',620,240,400,'{\"type\":37,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5963}',5,0,'[]','[\"fire\",\"poison\",\"lifedrain\",\"death\",\"drunk\"]','[]',1,1,0,1,0,0,0,0,1,1,0,25,25,1,'undead','[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2515\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2482\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2194\",\"count\":1,\"chance\":\"700\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(383,0,'lost soul',0,4000,8500,'{\"type\":232,\"corpse\":6310}',30,1,'[\"Forgive Meeeee!\",\"Mouuuurn meeee!\"]','[\"fire\",\"poison\",\"death\",\"paralyze\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"50\"}]',0,0,0,1,0,0,0,0,1,1,0,35,35,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"59000\"},{\"id\":\"2227\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2480\",\"count\":1,\"chance\":\"6667\"},{\"id\":\"5806\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2463\",\"count\":1,\"chance\":\"3933\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"7413\",\"count\":1,\"chance\":\"900\"},{\"id\":\"6526\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"5801\",\"count\":1,\"chance\":\"2738\"},{\"id\":\"2197\",\"count\":\"5\",\"chance\":\"2500\"}]','[]'),
(384,0,'pirate skeleton',0,85,190,'{\"type\":195,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6070}',5,0,'[]','[\"fire\",\"invisible\"]','[]',0,0,1,1,0,0,0,0,1,1,0,19,18,0,'UNDEAD','[{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"40000\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"9727\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"6095\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"5927\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"18402\"},{\"id\":\"2449\",\"count\":1,\"chance\":\"8491\"}]','[]'),
(385,0,'skeleton',300,35,50,'{\"type\":33,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5972}',1,0,'[]','[\"poison\",\"lifedrain\"]','[]',1,1,1,0,0,0,0,0,1,1,0,9,2,0,'UNDEAD','[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"90000\"},{\"id\":\"2480\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2388\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2511\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2376\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(386,0,'Skeleton warrior',350,45,65,'{\"type\":298,\"corpse\":2843}',1,0,'[]','[\"death\"]','[{\"name\":\"Holy\",\"percent\":\"10\"}]',1,1,0,0,0,0,0,0,1,1,0,9,2,0,'undead','[{\"id\":\"2148\",\"count\":\"15\",\"chance\":\"90000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2511\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2787\",\"count\":\"3\",\"chance\":\"90000\"},{\"id\":\"2789\",\"count\":1,\"chance\":\"4000\"}]','[]'),
(387,0,'undead dragon',0,7200,8350,'{\"type\":231,\"corpse\":6306}',40,0,'[\"FEEEED MY ETERNAL HUNGER!\"]','[\"death\",\"earth\",\"fire\",\"drown\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"10\"},{\"name\":\"Ice\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,30,35,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"5\",\"chance\":\"49000\"},{\"id\":\"2236\",\"count\":1,\"chance\":\"6667\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"1818\"},{\"id\":\"5944\",\"count\":\"1\",\"chance\":\"1538\"},{\"id\":\"2547\",\"count\":\"15\",\"chance\":\"4000\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"2888\"},{\"id\":\"2454\",\"count\":1,\"chance\":\"2400\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"5400\"},{\"id\":\"8910\",\"count\":1,\"chance\":\"4444\"}]','[]'),
(388,0,'dark apprentice',0,100,225,'{\"type\":133,\"head\":39,\"body\":0,\"legs\":19,\"feet\":20,\"addons\":1,\"corpse\":3058}',1,0,'[\"Outch!\",\"I must dispose of my masters enemies!\",\"Oops, I did it again.\",\"From the spirits that I called Sir, deliver me!\"]','[\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,19,10,0,'blood','[{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5934\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(389,0,'dark magician',0,185,325,'{\"type\":133,\"head\":39,\"body\":0,\"legs\":19,\"feet\":20,\"addons\":2,\"corpse\":3058}',5,1,'[\"Feel the power of my runes!\",\"Killing you is getting expensive\",\"My secrets are mine alone!\"]','[\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"10\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Holy\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,20,20,0,'blood','[{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"100000\"},{\"id\":\"7620\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5934\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"7762\",\"count\":1,\"chance\":\"600\"}]','[]'),
(390,0,'Ice Witch',0,580,540,'{\"type\":149,\"head\":0,\"body\":47,\"legs\":105,\"feet\":105,\"addons\":0,\"corpse\":6081}',1,0,'[\"So you think you are cool?\",\"I hope it is not too cold for you! HeHeHe.\",\"Freeze!\"]','[\"ice\",\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"40\"},{\"name\":\"Holy\",\"percent\":\"30\"}]',0,0,0,1,0,0,0,0,1,1,0,70,75,0,'undead','[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"7449\",\"count\":1,\"chance\":\"1222\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"7387\",\"count\":1,\"chance\":\"1444\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7896\",\"count\":1,\"chance\":\"1900\"},{\"id\":\"2423\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2796\",\"count\":\"3\",\"chance\":\"9999\"},{\"id\":\"2663\",\"count\":1,\"chance\":\"1222\"},{\"id\":\"7459\",\"count\":1,\"chance\":\"1000\"}]','[]'),
(391,0,'Ferumbras',0,12000,35000,'{\"type\":229,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6078}',35,1,'[\"NOONE WILL STOP ME THIS TIME!\",\"THE POWER IS MINE!\",\"I returned from death and you dream about defeating me?\"]','[\"physical\",\"energy\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"90\"}]',0,0,0,1,0,0,0,1,1,1,0,30,30,1,'venom','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"4060\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2550\"},{\"id\":\"2408\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2400\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"4\",\"chance\":\"4000\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"3400\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"1428\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"2387\",\"count\":1,\"chance\":100000},{\"id\":\"5903\",\"count\":1,\"chance\":\"100000\"}]','[{\"name\":\"demon\",\"chance\":\"15\"}]'),
(392,0,'warlock',0,4000,3500,'{\"type\":130,\"head\":19,\"body\":71,\"legs\":128,\"feet\":128,\"addons\":1,\"corpse\":6080}',23,0,'[\"Learn the secret of our magic! YOUR death!\",\"Even a rat is a better mage than you.\",\"We don\'t like intruders!\"]','[\"energy\",\"fire\",\"ice\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"90\"}]',0,0,0,1,0,0,0,1,1,1,0,20,20,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"993\"},{\"id\":\"1986\",\"count\":1,\"chance\":\"777\"},{\"id\":\"2600\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2689\",\"count\":\"1\",\"chance\":\"11000\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"1999\"},{\"id\":\"2151\",\"count\":\"2\",\"chance\":\"1100\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"80000\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"1400\"},{\"id\":\"2178\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2679\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2047\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2792\",\"count\":\"5\",\"chance\":\"6666\"},{\"id\":\"2793\",\"count\":\"2\",\"chance\":\"6666\"},{\"id\":\"2656\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7898\",\"count\":1,\"chance\":\"1444\"},{\"id\":\"7895\",\"count\":1,\"chance\":\"1222\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"1111\"},{\"id\":\"2123\",\"count\":1,\"chance\":\"1000\"}]','[{\"name\":\"stone golem\",\"chance\":\"10\"}]'),
(393,0,'witch',0,120,300,'{\"type\":54,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6081}',1,0,'[\"Horax pokti!\",\"Hihihihi!\",\"Herba budinia ex!\"]','[\"energy\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,12,8,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2129\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"833\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2651\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2696\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2405\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2442\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2324\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2418\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2199\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2801\",\"count\":\"1\",\"chance\":\"1333\"}]','[]'),
(394,0,'Elverick',200,30000,20,'{\"type\":127,\"head\":114,\"body\":114,\"legs\":0,\"feet\":0,\"corpse\":5527}',390,0,'[]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,5,7,0,'blood','[{\"id\":\"2160\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2523\",\"count\":\"1\",\"chance\":\"100000\"},{\"id\":\"2471\",\"count\":1,\"chance\":\"100000\"}]','[]'),
(395,0,'Zarabustor',0,8000,5100,'{\"type\":130,\"head\":19,\"body\":71,\"legs\":128,\"feet\":128,\"addons\":1,\"corpse\":6080}',23,0,'[\"Killing is a splendid diversion for my studies.\"]','[\"energy\",\"fire\",\"ice\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"90\"}]',0,0,0,1,0,0,0,1,1,1,0,20,25,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"7368\",\"count\":\"3\",\"chance\":\"40000\"},{\"id\":\"2146\",\"count\":\"3\",\"chance\":\"13800\"},{\"id\":\"1980\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2656\",\"count\":1,\"chance\":\"36000\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"18877\"},{\"id\":\"2123\",\"count\":1,\"chance\":\"12000\"}]','[{\"name\":\"warlock\",\"chance\":\"15\"},{\"name\":\"green djinn\",\"chance\":\"15\"}]'),
(396,0,'Yakchal',0,600,12400,'{\"type\":149,\"head\":0,\"body\":47,\"legs\":105,\"feet\":105,\"addons\":3,\"corpse\":6081}',20,0,'[\"YOU BETTER DIE TO MY MINIONS BECAUSE YOU\'LL WHISH YOU DID IF I COME FOR YOU!\",\"You are mine!\",\"I will make you all pay!\"]','[\"ice\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,50,65,0,'undead','[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5912\",\"count\":1,\"chance\":\"28000\"},{\"id\":\"7387\",\"count\":1,\"chance\":\"7777\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"7896\",\"count\":1,\"chance\":\"25000\"},{\"id\":\"7897\",\"count\":1,\"chance\":\"21000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"13777\"},{\"id\":\"7410\",\"count\":1,\"chance\":\"7777\"}]','[{\"name\":\"ice golem\",\"chance\":\"25\"}]'),
(397,0,'Annihilon',0,100000,60000,'{\"type\":12,\"head\":19,\"body\":104,\"legs\":96,\"feet\":96,\"corpse\":6068}',80,1,'[\"Annihilation!\"]','[\"lifedrain\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,60,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"2150\",\"count\":\"20\",\"chance\":\"5515\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2158\",\"count\":1,\"chance\":\"4300\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"7600\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(398,0,'Hellgorak',0,10000,40000,'{\"type\":12,\"head\":19,\"body\":96,\"legs\":21,\"feet\":81,\"corpse\":6068}',70,0,'[\"??\",\"??\"]','[\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"55\"},{\"name\":\"Energy\",\"percent\":\"40\"},{\"name\":\"Earth\",\"percent\":\"40\"},{\"name\":\"Holy\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"50\"},{\"name\":\"Fire\",\"percent\":\"55\"}]',0,0,0,1,0,0,0,0,1,1,0,65,70,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"20000\"},{\"id\":\"2150\",\"count\":\"16\",\"chance\":\"4000\"},{\"id\":\"2148\",\"count\":\"83\",\"chance\":\"40000\"},{\"id\":\"7388\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2130\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"8871\",\"count\":1,\"chance\":\"3100\"},{\"id\":\"2158\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2155\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2210\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"9970\",\"count\":\"13\",\"chance\":\"6000\"},{\"id\":\"6500\",\"count\":\"2\",\"chance\":\"6000\"},{\"id\":\"2143\",\"count\":\"7\",\"chance\":\"5000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7368\",\"count\":\"25\",\"chance\":\"8000\"},{\"id\":\"2144\",\"count\":\"12\",\"chance\":\"4000\"},{\"id\":\"2145\",\"count\":\"5\",\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"5650\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"8100\"},{\"id\":\"7412\",\"count\":1,\"chance\":\"4200\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"8904\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"20000\"},{\"id\":\"8901\",\"count\":1,\"chance\":\"4400\"},{\"id\":\"2415\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"8926\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"6500\",\"count\":\"2\",\"chance\":\"6000\"},{\"id\":\"8902\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2488\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2143\",\"count\":\"7\",\"chance\":\"7000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"8879\",\"count\":1,\"chance\":\"3400\"},{\"id\":\"2146\",\"count\":\"18\",\"chance\":\"9000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"8918\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"7000\"}]','[]'),
(399,0,'Latrivan',0,10000,40000,'{\"type\":12,\"head\":120,\"body\":128,\"legs\":121,\"feet\":111,\"corpse\":6068}',60,0,'[\"I might reward you for killing my brother ~ with a swift dead!\"]','[\"fire\"]','[{\"name\":\"Energy\",\"percent\":\"35\"}]',0,0,0,1,0,0,0,0,1,1,0,45,35,1,'fire','[{\"id\":\"2148\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"6\",\"chance\":\"80000\"},{\"id\":\"2144\",\"count\":\"28\",\"chance\":\"7777\"},{\"id\":\"7440\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"12222\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"13\",\"chance\":\"6500\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"6555\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"8200\"}]','[]'),
(400,0,'Madareth',0,100000,55000,'{\"type\":12,\"head\":77,\"body\":116,\"legs\":82,\"feet\":79,\"corpse\":6068}',80,0,'[\"I AM GOING TO PLAY WITH YOURSELF!\"]','[\"energy\",\"fire\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,0,1,1,0,46,40,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"12650\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"7650\"},{\"id\":\"2145\",\"count\":1,\"chance\":\"5800\"}]','[]'),
(401,0,'Zugurosh',0,10000,95000,'{\"type\":12,\"head\":2,\"body\":35,\"legs\":57,\"feet\":91,\"corpse\":6068}',60,0,'[\"You will run out of resources soon enough!!\",\"One little mistake and your all are mine!\",\"I sense your strength fading!\"]','[\"death\",\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"25\"}]',0,0,0,1,0,0,0,0,1,1,0,55,45,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"100000\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"7777\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"4444\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"5555\"},{\"id\":\"2402\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2477\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"11\",\"chance\":\"6000\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"9700\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"1428\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"2333\"},{\"id\":\"2158\",\"count\":1,\"chance\":\"4444\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"6500\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"9999\"}]','[]'),
(402,0,'Ushuriel',0,10000,50000,'{\"type\":12,\"head\":0,\"body\":95,\"legs\":19,\"feet\":112,\"corpse\":6068}',65,1,'[]','[\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,45,50,1,'fire','[{\"id\":\"2136\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"20000\"},{\"id\":\"2150\",\"count\":\"16\",\"chance\":\"4000\"},{\"id\":\"2148\",\"count\":\"83\",\"chance\":\"40000\"},{\"id\":\"7388\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2130\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"8871\",\"count\":1,\"chance\":\"3100\"},{\"id\":\"2158\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2155\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2210\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"9970\",\"count\":\"13\",\"chance\":\"6000\"},{\"id\":\"6500\",\"count\":\"2\",\"chance\":\"6000\"},{\"id\":\"2143\",\"count\":\"7\",\"chance\":\"5000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7368\",\"count\":\"25\",\"chance\":\"8000\"},{\"id\":\"2144\",\"count\":\"12\",\"chance\":\"4000\"},{\"id\":\"2145\",\"count\":\"5\",\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"5650\"},{\"id\":\"8932\",\"count\":1,\"chance\":\"900\"},{\"id\":\"8925\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"8100\"},{\"id\":\"7412\",\"count\":1,\"chance\":\"4200\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"8904\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"20000\"},{\"id\":\"8901\",\"count\":1,\"chance\":\"4400\"},{\"id\":\"2415\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2208\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"8926\",\"count\":1,\"chance\":\"900\"},{\"id\":\"2645\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"6500\",\"count\":\"2\",\"chance\":\"6000\"},{\"id\":\"8902\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2136\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2488\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2143\",\"count\":\"7\",\"chance\":\"7000\"},{\"id\":\"7590\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"8879\",\"count\":1,\"chance\":\"3400\"},{\"id\":\"2146\",\"count\":\"18\",\"chance\":\"9000\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"8918\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"7000\"}]','[]'),
(403,0,'Golgordan',0,10000,40000,'{\"type\":12,\"head\":108,\"body\":100,\"legs\":105,\"feet\":114,\"corpse\":6068}',65,0,'[\"Latrivan your fool\"]','[\"death\"]','[{\"name\":\"Holy\",\"percent\":\"15\"},{\"name\":\"Physical\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,54,48,1,'fire','[]','[]'),
(404,0,'thornback tortoise',490,150,300,'{\"type\":198,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6073}',1,0,'[]','[]','[{\"name\":\"Physical\",\"percent\":\"10\"},{\"name\":\"Earth\",\"percent\":\"15\"},{\"name\":\"Ice\",\"percent\":\"10\"}]',0,1,0,1,0,0,0,0,1,1,0,18,18,1,'blood','[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"5678\",\"count\":\"3\",\"chance\":\"14000\"},{\"id\":\"2667\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2789\",\"count\":\"4\",\"chance\":\"2000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2787\",\"count\":\"2\",\"chance\":\"15000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"17000\"}]','[]'),
(405,0,'Tortoise',445,90,150,'{\"type\":197,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":6072}',1,0,'[]','[]','[{\"name\":\"Physical\",\"percent\":\"10\"},{\"name\":\"Earth\",\"percent\":\"15\"},{\"name\":\"Ice\",\"percent\":\"10\"}]',0,1,1,1,0,0,0,0,1,1,0,15,15,0,'blood','[{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"15000\"},{\"id\":\"5899\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"5678\",\"count\":\"3\",\"chance\":\"14000\"},{\"id\":\"6131\",\"count\":1,\"chance\":\"909\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2417\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2510\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(406,0,'deathslicer',0,340,2000,'{\"type\":102,\"corpse\":2253}',75,0,'[]','[\"physical\",\"holy\",\"energy\",\"fire\",\"death\",\"earth\",\"ice\",\"poison\",\"lifedrain\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,1,1,0,0,0,1,1,1,0,1999,1999,1,'undead','[]','[]'),
(407,0,'flamethrower',0,1200,9950,'{\"typeEx\":1551}',1,0,'[]','[\"physical\",\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,0,0,0,0,1,1,0,0,1,1,1,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"}]','[]'),
(408,0,'magicthrower',0,1200,9950,'{\"typeEx\":1551}',1,0,'[]','[\"physical\",\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,0,0,0,0,1,1,0,0,1,1,1,'undead','[]','[]'),
(409,0,'plaguethrower',0,1300,9950,'{\"typeEx\":1551}',1,0,'[]','[\"physical\",\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,0,0,0,0,1,1,0,0,1,1,1,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"}]','[]'),
(410,0,'Poisonthrower',0,1200,9950,'{\"typeEx\":1551}',1,0,'[]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,0,0,0,0,1,1,0,0,1,1,1,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"}]','[]'),
(411,0,'Shredderthrower',0,18,100,'{\"typeEx\":1551,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":1740}',1,0,'[]','[\"physical\",\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,0,0,0,0,1,1,0,0,1,1,1,'undead','[]','[]'),
(412,0,'Troll Champion',340,30,75,'{\"type\":281,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7926}',1,0,'[\"Meee maity!\",\"Grrrr\",\"Whaaaz up!?\",\"Gruntz!\"]','[]','[{\"name\":\"Energy\",\"percent\":\"22\"},{\"name\":\"Holy\",\"percent\":\"11\"}]',1,1,1,0,0,0,0,1,1,1,0,8,8,0,'blood','[{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"6000\"},{\"id\":\"2380\",\"count\":\"1\",\"chance\":\"1800\"},{\"id\":\"2643\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2461\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2666\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2120\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2389\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2448\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2512\",\"count\":\"1\",\"chance\":\"1500\"}]','[]'),
(413,0,'frost troll',300,23,55,'{\"type\":53,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5998}',1,0,'[\"Brrrr\",\"Broar!\"]','[]','[]',1,1,1,0,0,0,0,1,1,1,0,9,7,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2382\",\"count\":1,\"chance\":\"33333\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2651\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2384\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2667\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"40000\"}]','[]'),
(414,0,'Island troll',290,20,50,'{\"type\":15,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5960}',1,0,'[\"Hmmm, turtles\",\"HHmmm, dogs\",\"Groar\",\"Gruntz!\"]','[]','[]',1,0,1,1,0,0,0,1,1,1,0,9,7,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2389\",\"count\":\"1\",\"chance\":\"33333\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"23333\"},{\"id\":\"2172\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"5901\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"30000\"},{\"id\":\"2380\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(415,0,'swamp troll',320,65,55,'{\"type\":76,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6018}',1,0,'[\"Grrrr\",\"Groar!\",\"Me strong! Me ate spinach!\"]','[]','[{\"name\":\"Earth\",\"percent\":\"8\"}]',1,1,1,0,0,0,0,1,1,1,0,10,6,0,'VENOM','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"12\",\"chance\":\"100000\"},{\"id\":\"2667\",\"count\":\"1\",\"chance\":\"90000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2580\",\"count\":1,\"chance\":\"20000\"}]','[]'),
(416,0,'troll',290,20,50,'{\"type\":15,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5960}',1,0,'[\"Grrrr\",\"Groar\",\"Gruntz!\",\"Hmmm, bugs.\",\"Hmmm, dogs.\"]','[]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Holy\",\"percent\":\"10\"}]',1,1,1,0,0,0,0,1,1,1,0,8,6,0,'blood','[{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2389\",\"count\":\"1\",\"chance\":\"33333\"},{\"id\":\"2643\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"23333\"},{\"id\":\"2172\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2512\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"30000\"},{\"id\":\"2380\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2448\",\"count\":1,\"chance\":\"10000\"}]','[]'),
(417,0,'Big Boss Trolliver',0,105,150,'{\"type\":281,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7926}',1,0,'[]','[]','[{\"name\":\"Energy\",\"percent\":\"22\"},{\"name\":\"Holy\",\"percent\":\"11\"}]',0,0,1,0,0,0,0,1,1,1,0,12,10,0,'blood','[{\"id\":\"2148\",\"count\":\"57\",\"chance\":\"6000\"},{\"id\":\"2666\",\"count\":\"3\",\"chance\":\"1500\"},{\"id\":\"2389\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2448\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(418,0,'banshee',0,900,1000,'{\"type\":78,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6019}',1,0,'[\"Are you ready to rock?\",\"That\'s what I call easy listening!\",\"Let the music play!\",\"I will mourn your death!\",\"IIIIEEEeeeeeehhhHHHHH!\",\"Dance for me your dance of death!\",\"Feel my gentle kiss of death.\"]','[\"death\",\"earth\",\"fire\",\"lifedrain\",\"paralyze\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,20,15,1,'undead','[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"2144\",\"count\":\"3\",\"chance\":\"1000\"},{\"id\":\"2657\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"1533\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2654\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2655\",\"count\":1,\"chance\":\"1533\"},{\"id\":\"2656\",\"count\":1,\"chance\":\"1800\"}]','[]'),
(419,0,'Blightwalker',0,3350,8900,'{\"type\":246,\"corpse\":6354}',25,0,'[\"I can see you decaying!\",\"Let me taste your mortality!\"]','[\"earth\",\"death\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"15\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Energy\",\"percent\":\"40\"}]',0,0,0,1,0,0,0,0,1,1,0,15,15,1,'undead','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2694\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2260\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"5902\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2386\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"6500\",\"count\":\"2\",\"chance\":\"2222\"},{\"id\":\"5944\",\"count\":\"1\",\"chance\":\"1667\"},{\"id\":\"2550\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"7884\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"7885\",\"count\":1,\"chance\":\"1400\"}]','[]'),
(420,0,'Crypt Shambler',0,195,330,'{\"type\":100,\"corpse\":6029}',1,0,'[\"Uhhhhhhh!\",\"Aaaaahhhh!\",\"Hoooohhh!\",\"Chhhhhhh!\"]','[\"lifedrain\",\"paralyze\"]','[{\"name\":\"Death\",\"percent\":\"100\"},{\"name\":\"Earth\",\"percent\":\"100\"}]',0,0,0,1,0,0,0,0,1,1,0,10,15,1,'undead','[{\"id\":\"2148\",\"count\":\"35\",\"chance\":\"18000\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"18000\"},{\"id\":\"2230\",\"count\":1,\"chance\":\"50000\"},{\"id\":\"2541\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2450\",\"count\":1,\"chance\":\"900\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2227\",\"count\":1,\"chance\":\"21500\"},{\"id\":\"2399\",\"count\":\"3\",\"chance\":\"700\"},{\"id\":\"2459\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"}]','[]'),
(421,0,'ghoul',450,85,100,'{\"type\":18,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5976}',1,0,'[]','[\"death\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Energy\",\"percent\":\"30\"}]',1,1,0,1,0,0,0,0,1,1,0,17,8,0,'blood','[{\"id\":\"2148\",\"count\":\"64\",\"chance\":\"100000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"100000\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2483\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2473\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2398\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"5913\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2460\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2229\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2403\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(422,0,'Lich',0,900,880,'{\"type\":99,\"head\":95,\"body\":116,\"legs\":119,\"feet\":115,\"corpse\":6028}',23,0,'[\"Doomed be the living!\",\"You will endure agony beyond thy death!\",\"Death awaits all!\",\"Thy living flesh offends me!\",\"Death and Decay!\"]','[\"death\",\"earth\",\"paralyze\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"80\"}]',0,0,0,1,0,0,0,0,1,1,0,20,20,1,'UNDEAD','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2656\",\"count\":1,\"chance\":\"709\"},{\"id\":\"2144\",\"count\":\"6\",\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2535\",\"count\":1,\"chance\":\"588\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"888\"},{\"id\":\"2143\",\"count\":\"2\",\"chance\":\"4000\"},{\"id\":\"2237\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"1\",\"chance\":\"80000\"},{\"id\":\"2175\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"900\"},{\"id\":\"3961\",\"count\":1,\"chance\":\"1000\"}]','[{\"name\":\"bonebeast\",\"chance\":\"17\"}]'),
(423,0,'mummy',0,150,240,'{\"type\":65,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6004}',1,0,'[]','[\"earth\",\"death\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,20,14,0,'UNDEAD','[{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"2161\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"2134\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"2857\"},{\"id\":\"2529\",\"count\":1,\"chance\":\"2557\"},{\"id\":\"5914\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2529\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2144\",\"count\":\"2\",\"chance\":\"5000\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2169\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"2500\"}]','[]'),
(424,0,'vampire',100,305,475,'{\"type\":68,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6006}',18,1,'[\"BLOOD!\",\"Let me kiss your neck.\",\"I smell warm blood.\",\"I call you, my bats! Come!\"]','[\"earth\",\"death\",\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"35\"}]',0,0,0,1,0,0,0,0,1,1,0,23,17,1,'undead','[{\"id\":\"2148\",\"count\":\"9\",\"chance\":\"100000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2383\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"5905\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2172\",\"count\":1,\"chance\":\"200\"},{\"id\":\"2127\",\"count\":1,\"chance\":\"200\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"4\",\"chance\":\"2500\"},{\"id\":\"2032\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2229\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2412\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2747\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"2534\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2144\",\"count\":\"3\",\"chance\":\"1538\"},{\"id\":\"2479\",\"count\":1,\"chance\":\"1428\"}]','[]'),
(425,0,'Grim Reaper',0,4500,4100,'{\"type\":300,\"corpse\":8955}',75,0,'[\"Death!\",\"Come a little closer!\",\"The end is near!\"]','[\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Death\",\"percent\":\"60\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'undead','[{\"id\":\"2148\",\"count\":\"98\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"40000\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2150\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"18500\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"6800\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"5909\",\"count\":\"1\",\"chance\":\"2800\"},{\"id\":\"2521\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5022\",\"count\":\"4\",\"chance\":\"40000\"},{\"id\":\"8889\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"7418\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"8910\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"7777\"}]','[]'),
(426,0,'The Count',0,1750,4600,'{\"type\":287,\"corpse\":8937}',75,0,'[]','[\"lifedrain\",\"death\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'undead','[{\"id\":\"2148\",\"count\":\"98\",\"chance\":\"40000\"},{\"id\":\"8752\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"2300\"}]','[{\"name\":\"banshee\",\"chance\":\"50\"}]'),
(427,0,'Gravelord Oshuran',0,2400,3100,'{\"type\":99,\"head\":95,\"body\":116,\"legs\":119,\"feet\":115,\"corpse\":6028}',30,0,'[\"Your mortality is disgusting\"]','[\"death\",\"earth\",\"paralyze\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"80\"}]',0,0,0,1,0,0,0,0,1,1,0,20,20,1,'UNDEAD','[{\"id\":\"2148\",\"count\":\"40\",\"chance\":\"100000\"},{\"id\":\"7893\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2656\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"8978\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2144\",\"count\":\"2\",\"chance\":\"66666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"8888\"},{\"id\":\"2143\",\"count\":\"1\",\"chance\":\"44444\"},{\"id\":\"2148\",\"count\":\"57\",\"chance\":\"80000\"},{\"id\":\"8904\",\"count\":1,\"chance\":\"13000\"}]','[{\"name\":\"bonebeast\",\"chance\":\"17\"}]'),
(428,0,'Arachir the ancient one',0,1800,1600,'{\"type\":287,\"corpse\":8937}',40,0,'[\"I was the shadow that haunted the cradle of humanity!\",\"I exist since eons and you want to defy me?\",\"Can you feel the passage of time, mortal?\"]','[\"lifedrain\",\"death\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'undead','[{\"id\":\"2148\",\"count\":\"98\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"5\",\"chance\":\"50000\"},{\"id\":\"8978\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2216\",\"count\":1,\"chance\":\"11111\"},{\"id\":\"7598\",\"count\":1,\"chance\":\"9800\"},{\"id\":\"2534\",\"count\":1,\"chance\":\"6300\"},{\"id\":\"2144\",\"count\":\"2\",\"chance\":\"8980\"}]','[{\"name\":\"Lich\",\"chance\":\"100\"}]'),
(429,0,'Diblis the fair',0,1800,1600,'{\"type\":287,\"corpse\":8937}',30,0,'[\"I envy you to be slain by someone as beautiful as me.\",\"I will drain your ugly corpses of the last drop of blood.\"]','[\"lifedrain\",\"death\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'undead','[{\"id\":\"2148\",\"count\":\"98\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"5\",\"chance\":\"50000\"},{\"id\":\"8978\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2216\",\"count\":1,\"chance\":\"14111\"},{\"id\":\"7598\",\"count\":1,\"chance\":\"12800\"},{\"id\":\"2534\",\"count\":1,\"chance\":\"8300\"},{\"id\":\"2144\",\"count\":\"2\",\"chance\":\"8980\"},{\"id\":\"8903\",\"count\":1,\"chance\":\"7777\"}]','[{\"name\":\"Banshee\",\"chance\":\"50\"}]'),
(430,0,'Sir Valorcrest',0,1800,1600,'{\"type\":287,\"corpse\":8937}',25,0,'[\"I challenge you!\"]','[\"lifedrain\",\"death\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,35,38,1,'undead','[{\"id\":\"2148\",\"count\":\"93\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"5\",\"chance\":\"50000\"},{\"id\":\"8978\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2216\",\"count\":1,\"chance\":\"17111\"},{\"id\":\"7598\",\"count\":1,\"chance\":\"16800\"},{\"id\":\"2534\",\"count\":1,\"chance\":\"6300\"}]','[{\"name\":\"Vampire\",\"chance\":\"30\"}]'),
(431,0,'Zevelon Duskbringer',0,1800,1600,'{\"type\":287,\"corpse\":8937}',45,0,'[\"Human blood is not suitable for drinking\",\"Your short live is coming to an end\",\"Ashari Mortals. Come and stay forever!\"]','[\"lifedrain\",\"death\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'undead','[{\"id\":\"2148\",\"count\":\"75\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"5\",\"chance\":\"50000\"},{\"id\":\"8978\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2216\",\"count\":1,\"chance\":\"11111\"},{\"id\":\"7598\",\"count\":1,\"chance\":\"9800\"},{\"id\":\"2534\",\"count\":1,\"chance\":\"6300\"}]','[{\"name\":\"Vampire\",\"chance\":\"40\"}]'),
(432,0,'Demon Vip',10000,8000,8200,'{\"type\":35,\"corpse\":5995}',28,1,'[\"MUHAHAHAHA!\",\"I SMELL FEEEEEAAAR!\",\"CHAMEK ATH UTHUL ARAK!\",\"Your resistance is futile!\",\"Your soul will be mine!\"]','[\"fire\",\"drown\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,55,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"3900\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"7500\"},{\"id\":\"5906\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"5954\",\"count\":\"1\",\"chance\":\"2345\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"1982\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"4600\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"13000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"4\",\"chance\":\"5500\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"11000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"32000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"2350\"},{\"id\":\"7382\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7393\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"2418\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[{\"name\":\"fire elemental\",\"chance\":\"12\"}]'),
(433,0,'hydra vip',0,3900,2250,'{\"type\":121,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6048}',10,0,'[\"FCHHHHH\",\"HISSSS\"]','[\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,35,25,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"65000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"90000\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"5000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"4850\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"4000\"},{\"id\":\"2536\",\"count\":1,\"chance\":\"555\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[]'),
(434,0,'Grim Reaper Vip',0,10000,4100,'{\"type\":300,\"corpse\":8955}',75,0,'[\"Death!\",\"Come a little closer!\",\"The end is near!\"]','[\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Death\",\"percent\":\"60\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'undead','[{\"id\":\"2148\",\"count\":\"98\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"40000\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2150\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"18500\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"7800\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"3300\"},{\"id\":\"5909\",\"count\":\"1\",\"chance\":\"3800\"},{\"id\":\"2521\",\"count\":1,\"chance\":\"8500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5022\",\"count\":\"4\",\"chance\":\"40000\"},{\"id\":\"8889\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"7418\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"8500\"},{\"id\":\"8910\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"8777\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[]'),
(435,0,'Frost Dragon Vip',390,4100,1800,'{\"type\":248,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7091}',20,0,'[\"CHHHRRRR\",\"HISSSS\"]','[\"ice\",\"fire\",\"earth\",\"paralyze\",\"lifedrain\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,45,45,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2672\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"2500\"},{\"id\":\"2547\",\"count\":\"10\",\"chance\":\"2222\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"2222\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"7402\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"3300\"},{\"id\":\"2492\",\"count\":\"1\",\"chance\":\"3300\"}]','[]'),
(436,0,'warlock vip',0,6000,3500,'{\"type\":130,\"head\":19,\"body\":71,\"legs\":128,\"feet\":128,\"addons\":1,\"corpse\":6080}',23,0,'[\"Learn the secret of our magic! YOUR death!\",\"Even a rat is a better mage than you.\",\"We don\'t like intruders!\"]','[\"energy\",\"fire\",\"ice\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"90\"}]',0,0,0,1,0,0,0,1,1,1,0,20,20,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"200\"},{\"id\":\"1986\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2600\",\"count\":1,\"chance\":\"10500\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2689\",\"count\":\"1\",\"chance\":\"11000\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2151\",\"count\":\"2\",\"chance\":\"1900\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"50\",\"chance\":\"80000\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"1900\"},{\"id\":\"2178\",\"count\":\"1\",\"chance\":\"2900\"},{\"id\":\"2679\",\"count\":\"4\",\"chance\":\"26000\"},{\"id\":\"2047\",\"count\":1,\"chance\":\"19000\"},{\"id\":\"2411\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2792\",\"count\":\"5\",\"chance\":\"6666\"},{\"id\":\"2793\",\"count\":\"2\",\"chance\":\"6666\"},{\"id\":\"2656\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"7898\",\"count\":1,\"chance\":\"2444\"},{\"id\":\"7895\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2466\",\"count\":1,\"chance\":\"2111\"},{\"id\":\"2123\",\"count\":1,\"chance\":\"2000\"}]','[{\"name\":\"stone golem\",\"chance\":\"10\"}]'),
(437,0,'Medusa Vip',0,6050,4500,'{\"type\":330,\"corpse\":10524}',10,0,'[\"You will ssuch a fine ssstatue!\",\"There isss no chhhanccce of esscape\",\"Are you tired or why are you moving thhat sslow\"]','[\"earth\",\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"60000\"},{\"id\":\"7590\",\"count\":\"2\",\"chance\":\"60000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2536\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"2004\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7887\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7885\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7884\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7413\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"8473\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"2143\",\"count\":\"2\",\"chance\":\"50000\"}]','[]'),
(438,0,'Bossing of Baiak',0,19000,50000,'{\"type\":12,\"head\":95,\"body\":95,\"legs\":95,\"feet\":95,\"addons\":3,\"corpse\":5527}',140,1,'[\"The Power of The Baiak Server!\",\"OMG You Is Noob !! MUAHAHAHAHAHAHAHA!\"]','[\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"90\"}]',0,0,0,1,0,0,0,1,1,1,0,120,100,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"16060\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"7500\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"5600\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"4\",\"chance\":\"12000\"},{\"id\":\"5903\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"15000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2415\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[{\"name\":\"Demon Vip\",\"chance\":\"20\"}]'),
(439,0,'Ferumbras Vip',0,14000,35000,'{\"type\":229,\"corpse\":6078}',50,1,'[\"NOONE WILL STOP ME THIS TIME!\",\"THE POWER IS MINE!\"]','[\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Fire\",\"percent\":\"90\"}]',0,0,0,1,0,0,0,1,1,1,0,120,100,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"16060\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"12050\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"7000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"4\",\"chance\":\"12000\"},{\"id\":\"5903\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"15000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2415\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[{\"name\":\"Demon\",\"chance\":\"12\"}]'),
(440,0,'Demon Vip II',10000,8500,7500,'{\"type\":35,\"corpse\":5995}',28,1,'[\"MUHAHAHAHA!\",\"I SMELL FEEEEEAAAR!\",\"CHAMEK ATH UTHUL ARAK!\",\"Your resistance is futile!\",\"Your soul will be mine!\"]','[\"fire\",\"drown\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,55,1,'fire','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"3\",\"chance\":\"33333\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"4900\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"7500\"},{\"id\":\"5906\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"5954\",\"count\":\"1\",\"chance\":\"2345\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"1982\",\"count\":1,\"chance\":\"1300\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"2300\"},{\"id\":\"7591\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"4800\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"4600\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"1100\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"13000\"},{\"id\":\"2678\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2151\",\"count\":\"4\",\"chance\":\"5500\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"3200\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"11000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"32000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"2350\"},{\"id\":\"7382\",\"count\":1,\"chance\":\"300\"},{\"id\":\"7393\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"2418\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[{\"name\":\"fire elemental\",\"chance\":\"12\"}]'),
(441,0,'hydra vip II',0,4100,2450,'{\"type\":121,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":6048}',10,0,'[\"FCHHHHH\",\"HISSSS\"]','[\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,35,25,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"100000\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"1700\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2475\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"65000\"},{\"id\":\"2666\",\"count\":\"4\",\"chance\":\"90000\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"5000\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"1800\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"4850\",\"count\":1,\"chance\":\"1200\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"4000\"},{\"id\":\"2536\",\"count\":1,\"chance\":\"555\"},{\"id\":\"2168\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"800\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[]'),
(442,0,'Grim Reaper Vip II',0,7100,4300,'{\"type\":300,\"corpse\":8955}',75,0,'[\"Death!\",\"Come a little closer!\",\"The end is near!\"]','[\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Death\",\"percent\":\"60\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'undead','[{\"id\":\"2148\",\"count\":\"98\",\"chance\":\"40000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"40000\"},{\"id\":\"2152\",\"count\":\"4\",\"chance\":\"20000\"},{\"id\":\"2150\",\"count\":\"3\",\"chance\":\"10000\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"6558\",\"count\":1,\"chance\":\"18500\"},{\"id\":\"6500\",\"count\":\"1\",\"chance\":\"7800\"},{\"id\":\"6300\",\"count\":1,\"chance\":\"3300\"},{\"id\":\"5909\",\"count\":\"1\",\"chance\":\"3800\"},{\"id\":\"2521\",\"count\":1,\"chance\":\"8500\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"5022\",\"count\":\"4\",\"chance\":\"40000\"},{\"id\":\"8889\",\"count\":1,\"chance\":\"2100\"},{\"id\":\"7418\",\"count\":1,\"chance\":\"2200\"},{\"id\":\"7589\",\"count\":1,\"chance\":\"8500\"},{\"id\":\"8910\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"8473\",\"count\":1,\"chance\":\"8777\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"}]','[]'),
(443,0,'Frost Dragon Vip II',390,5400,2000,'{\"type\":248,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7091}',20,0,'[\"CHHHRRRR\",\"HISSSS\"]','[\"ice\",\"fire\",\"earth\",\"paralyze\",\"lifedrain\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,1,1,1,0,45,45,1,'undead','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2672\",\"count\":\"5\",\"chance\":\"20000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"7290\",\"count\":1,\"chance\":\"1400\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"2500\"},{\"id\":\"2547\",\"count\":\"10\",\"chance\":\"2222\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"2222\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"1333\"},{\"id\":\"7441\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"7402\",\"count\":1,\"chance\":\"1666\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"3300\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"3300\"}]','[]'),
(444,0,'Medusa Vip II',0,6500,4900,'{\"type\":330,\"corpse\":10524}',40,0,'[\"You will ssuch a fine ssstatue!\",\"There isss no chhhanccce of esscape\",\"Are you tired or why are you moving thhat sslow\"]','[\"earth\",\"paralyze\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,1,1,1,0,25,25,1,'blood','[{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"2671\",\"count\":\"3\",\"chance\":\"60000\"},{\"id\":\"7590\",\"count\":\"2\",\"chance\":\"60000\"},{\"id\":\"2476\",\"count\":1,\"chance\":\"30000\"},{\"id\":\"2536\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"2149\",\"count\":\"3\",\"chance\":\"5000\"},{\"id\":\"2004\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2152\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"9808\",\"count\":1,\"chance\":\"400\"},{\"id\":\"7887\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"7885\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7884\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"7413\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"4100\"},{\"id\":\"8473\",\"count\":\"2\",\"chance\":\"50000\"},{\"id\":\"2143\",\"count\":\"2\",\"chance\":\"50000\"}]','[]'),
(445,0,'Dragon Lord Vip II',0,5100,2300,'{\"type\":39,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":5984}',13,0,'[\"ZCHHHHH\",\"YOU WILL BURN!\"]','[\"fire\",\"paralyze\",\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"20\"},{\"name\":\"Earth\",\"percent\":\"80\"}]',0,0,0,1,0,0,0,1,1,1,0,35,22,1,'blood','[{\"id\":\"2148\",\"count\":\"70\",\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"80\",\"chance\":\"100000\"},{\"id\":\"2672\",\"count\":\"5\",\"chance\":\"80000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"1818\"},{\"id\":\"1976\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2413\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2498\",\"count\":1,\"chance\":\"1188\"},{\"id\":\"2492\",\"count\":1,\"chance\":\"933\"},{\"id\":\"7378\",\"count\":\"2\",\"chance\":\"2000\"},{\"id\":\"2547\",\"count\":\"7\",\"chance\":\"8222\"},{\"id\":\"2796\",\"count\":\"1\",\"chance\":\"6666\"},{\"id\":\"5948\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"100000\"},{\"id\":\"2149\",\"count\":\"2\",\"chance\":\"833\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"1428\"},{\"id\":\"2146\",\"count\":\"2\",\"chance\":\"3222\"},{\"id\":\"2528\",\"count\":1,\"chance\":\"2033\"},{\"id\":\"7402\",\"count\":1,\"chance\":\"1833\"},{\"id\":\"2414\",\"count\":1,\"chance\":\"1309\"},{\"id\":\"5882\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(446,0,'Trainer',0,150,2400000,'{\"type\":57,\"head\":20,\"body\":30,\"legs\":40,\"feet\":50,\"corpse\":3128}',1,0,'[]','[\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,0,0,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2467\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2044\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2689\",\"count\":\"3\",\"chance\":\"20000\"},{\"id\":\"2401\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2166\",\"count\":1,\"chance\":\"1428\"}]','[]'),
(447,0,'Druid',0,2500,1500,'{\"type\":128,\"head\":78,\"body\":120,\"legs\":68,\"feet\":97,\"addons\":1,\"corpse\":3128}',85,1,'[\"Let\'s have a fight!\",\"Welcome to my battleground.\",\"Have you seen princess Lumelia?\",\"I will sing a tune at your grave.\"]','[\"energy\",\"fire\",\"poison\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,50,35,1,'blood','[{\"id\":\"2544\",\"count\":\"13\",\"chance\":\"27000\"},{\"id\":\"2456\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2487\",\"count\":\"1\",\"chance\":\"600\"},{\"id\":\"2491\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2488\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2519\",\"count\":\"1\",\"chance\":\"400\"},{\"id\":\"2392\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"60000\"},{\"id\":\"2681\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2652\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2071\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"18000\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2744\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2661\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"1949\",\"count\":\"1\",\"chance\":\"45000\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2391\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2121\",\"count\":\"1\",\"chance\":\"5000\"}]','[{\"name\":\"fire elemental\",\"chance\":\"17\"}]'),
(448,0,'Master Vip',0,2500,200000,'{\"type\":12,\"corpse\":3128}',85,1,'[\"Let\'s have a fight!\",\"Welcome to my battleground.\",\"Have you seen princess Lumelia?\",\"I will sing a tune at your grave.\"]','[\"energy\",\"fire\",\"poison\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[{\"name\":\"Ice\",\"percent\":\"10\"}]',0,0,0,1,0,0,0,0,1,1,0,20,20,1,'blood','[{\"id\":\"2544\",\"count\":\"13\",\"chance\":\"27000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"2487\",\"count\":1,\"chance\":\"600\"},{\"id\":\"2491\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2488\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2519\",\"count\":1,\"chance\":\"400\"},{\"id\":\"2392\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"60000\"},{\"id\":\"2681\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2071\",\"count\":1,\"chance\":\"15000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"18000\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"500\"},{\"id\":\"2744\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2661\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"1949\",\"count\":1,\"chance\":\"45000\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2391\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2121\",\"count\":1,\"chance\":\"5000\"}]','[{\"name\":\"Fire Elemental\",\"chance\":\"17\"}]'),
(449,0,'Forest Dragon',0,1100,1200,'{\"type\":34,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":2844}',8,0,'[\"GROOAAARRR\",\"FCHHHHH\"]','[\"fire\",\"poison\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,38,25,1,'blood','[{\"id\":\"2413\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2546\",\"count\":\"10\",\"chance\":\"8000\"},{\"id\":\"2455\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2387\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2672\",\"count\":\"3\",\"chance\":\"45000\"},{\"id\":\"2434\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2516\",\"count\":\"1\",\"chance\":\"300\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"80000\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"50000\"},{\"id\":\"2177\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2397\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2398\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2647\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2409\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2406\",\"count\":\"1\",\"chance\":\"25000\"},{\"id\":\"2145\",\"count\":\"1\",\"chance\":\"400\"},{\"id\":\"2457\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"2509\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2187\",\"count\":\"1\",\"chance\":\"1000\"}]','[]'),
(450,0,'Knight',0,2500,2500,'{\"type\":131,\"head\":113,\"body\":95,\"legs\":113,\"feet\":116,\"addons\":1,\"corpse\":3128}',85,1,'[\"Power by Melee!\"]','[\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,50,75,1,'blood','[{\"id\":\"2544\",\"count\":\"13\",\"chance\":\"27000\"},{\"id\":\"2456\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2487\",\"count\":\"1\",\"chance\":\"600\"},{\"id\":\"2491\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2488\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2519\",\"count\":\"1\",\"chance\":\"400\"},{\"id\":\"2392\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"60000\"},{\"id\":\"2681\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2652\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2071\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"18000\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2744\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2661\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"1949\",\"count\":\"1\",\"chance\":\"45000\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2391\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2121\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(451,0,'Paladin',0,2500,2000,'{\"type\":129,\"head\":95,\"body\":121,\"legs\":40,\"feet\":97,\"addons\":1,\"corpse\":3128}',70,1,'[\"Exori San\"]','[\"energy\",\"fire\",\"poison\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,50,35,1,'blood','[{\"id\":\"2544\",\"count\":\"13\",\"chance\":\"27000\"},{\"id\":\"2456\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2487\",\"count\":\"1\",\"chance\":\"600\"},{\"id\":\"2491\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2488\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2519\",\"count\":\"1\",\"chance\":\"400\"},{\"id\":\"2392\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"60000\"},{\"id\":\"2681\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2652\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2071\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"18000\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2744\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2661\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"1949\",\"count\":\"1\",\"chance\":\"45000\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2391\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2121\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(452,0,'Sorcerer',0,2500,1500,'{\"type\":130,\"head\":21,\"body\":113,\"legs\":57,\"feet\":116,\"addons\":1,\"corpse\":3128}',85,1,'[\"Noob!!\"]','[\"invisible\"]','[{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"50\"},{\"name\":\"Fire\",\"percent\":\"50\"},{\"name\":\"Ice\",\"percent\":\"50\"},{\"name\":\"Death\",\"percent\":\"50\"},{\"name\":\"Physical\",\"percent\":\"50\"}]',0,0,0,1,0,0,0,0,1,1,0,50,45,1,'blood','[{\"id\":\"2544\",\"count\":\"13\",\"chance\":\"27000\"},{\"id\":\"2456\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2487\",\"count\":\"1\",\"chance\":\"600\"},{\"id\":\"2491\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2488\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2519\",\"count\":\"1\",\"chance\":\"400\"},{\"id\":\"2392\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"60000\"},{\"id\":\"2681\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2652\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2071\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"18000\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2744\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2661\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"1949\",\"count\":\"1\",\"chance\":\"45000\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2391\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2121\",\"count\":\"1\",\"chance\":\"5000\"}]','[{\"name\":\"orc berserker\",\"chance\":\"40\"}]'),
(453,0,'Guard',0,800,1000,'{\"type\":131,\"head\":76,\"body\":76,\"legs\":76,\"feet\":95,\"addons\":2,\"corpse\":3128}',85,1,'[\"Leave!\",\"Leave this town!\",\"Leave now!\",\"INTRUDER!\"]','[\"energy\",\"fire\",\"poison\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,50,35,1,'blood','[{\"id\":\"2544\",\"count\":\"13\",\"chance\":\"27000\"},{\"id\":\"2456\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2487\",\"count\":\"1\",\"chance\":\"600\"},{\"id\":\"2491\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2488\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2519\",\"count\":\"1\",\"chance\":\"400\"},{\"id\":\"2392\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"60000\"},{\"id\":\"2681\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2652\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2071\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"18000\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2744\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2661\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"1949\",\"count\":\"1\",\"chance\":\"45000\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2391\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2121\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(454,0,'Mercenary',0,1600,1800,'{\"type\":131,\"head\":95,\"body\":95,\"legs\":95,\"feet\":95,\"addons\":3,\"corpse\":3128}',85,0,'[\"MINE!\",\"NO PRISONERS!\",\"NO MERCY!\",\"By Bolg\'s Blood!\",\"You\'re no match for me!\"]','[\"energy\",\"fire\",\"poison\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,60,42,1,'blood','[{\"id\":\"2417\",\"count\":\"1\",\"chance\":\"7000\"},{\"id\":\"2195\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2478\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2691\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2489\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2490\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2414\",\"count\":\"1\",\"chance\":\"300\"},{\"id\":\"2148\",\"count\":\"60\",\"chance\":\"33300\"},{\"id\":\"2148\",\"count\":\"90\",\"chance\":\"22200\"},{\"id\":\"2381\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2476\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2430\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2477\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2463\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2120\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2133\",\"count\":\"1\",\"chance\":\"800\"},{\"id\":\"2389\",\"count\":\"3\",\"chance\":\"30000\"},{\"id\":\"2457\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2475\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(455,0,'Thief',0,500,500,'{\"type\":128,\"head\":57,\"body\":57,\"legs\":57,\"feet\":57,\"addons\":2,\"corpse\":3128}',35,0,'[\"Sneak Sneak!\",\"Let me look in your backpack!\"]','[\"energy\",\"fire\",\"poison\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,50,35,1,'blood','[{\"id\":\"2544\",\"count\":\"13\",\"chance\":\"27000\"},{\"id\":\"2456\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2487\",\"count\":\"1\",\"chance\":\"600\"},{\"id\":\"2491\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2488\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2519\",\"count\":\"1\",\"chance\":\"400\"},{\"id\":\"2392\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"60000\"},{\"id\":\"2681\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2652\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2071\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"18000\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2744\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2661\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"1949\",\"count\":\"1\",\"chance\":\"45000\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2391\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2121\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(456,0,'Toxiros',0,30000,125000,'{\"type\":133,\"head\":38,\"body\":120,\"legs\":42,\"feet\":95,\"addons\":3,\"corpse\":3128}',160,1,'[\"Got antidote?\",\"The path of poisen!\",\"I\'m Toxic!\",\"My dear scarab..\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,50,50,1,'fire','[{\"id\":\"2142\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2144\",\"count\":\"15\",\"chance\":\"15000\"},{\"id\":\"2158\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2192\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2434\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"99900\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"88800\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"77700\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"66600\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2418\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2155\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2186\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"1982\",\"count\":1,\"chance\":\"2600\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"2123\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"2402\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2150\",\"count\":\"20\",\"chance\":\"13500\"},{\"id\":\"2145\",\"count\":\"5\",\"chance\":\"9500\"},{\"id\":\"2149\",\"count\":\"10\",\"chance\":\"15500\"},{\"id\":\"2146\",\"count\":\"10\",\"chance\":\"13500\"},{\"id\":\"2182\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2174\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2151\",\"count\":\"7\",\"chance\":\"14000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"14500\"},{\"id\":\"2421\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"3955\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2143\",\"count\":\"15\",\"chance\":\"12500\"}]','[]'),
(457,0,'Pyramo',0,30000,125000,'{\"type\":133,\"head\":38,\"body\":77,\"legs\":113,\"feet\":113,\"addons\":3,\"corpse\":3128}',160,1,'[\"You fear fire, I can feel it!\",\"Feel the heat!\",\"Hot Eh?\",\"HA HA HA HA HA..\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,145,188,1,'fire','[{\"id\":\"2142\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2144\",\"count\":\"15\",\"chance\":\"15000\"},{\"id\":\"2158\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2192\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2434\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"99900\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"88800\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"77700\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"66600\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2418\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2155\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2186\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"1982\",\"count\":1,\"chance\":\"2600\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"2123\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"2402\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2150\",\"count\":\"20\",\"chance\":\"13500\"},{\"id\":\"2145\",\"count\":\"5\",\"chance\":\"9500\"},{\"id\":\"2149\",\"count\":\"10\",\"chance\":\"15500\"},{\"id\":\"2146\",\"count\":\"10\",\"chance\":\"13500\"},{\"id\":\"2182\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2174\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2151\",\"count\":\"7\",\"chance\":\"14000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"14500\"},{\"id\":\"2421\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"3955\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2143\",\"count\":\"15\",\"chance\":\"12500\"}]','[]'),
(458,0,'Lazarus',0,30000,125000,'{\"type\":133,\"head\":57,\"body\":87,\"legs\":19,\"feet\":0,\"addons\":3,\"corpse\":3128}',160,1,'[\"VOLTAGE!!\",\"The keeper of ENERGY\",\"BRrZzzZzZZZ\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,145,188,1,'fire','[{\"id\":\"2142\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2231\",\"count\":1,\"chance\":\"9000\"},{\"id\":\"2144\",\"count\":\"15\",\"chance\":\"15000\"},{\"id\":\"2158\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2195\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2192\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2125\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2124\",\"count\":1,\"chance\":\"5500\"},{\"id\":\"2520\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"2462\",\"count\":1,\"chance\":\"11000\"},{\"id\":\"2387\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2434\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2167\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2432\",\"count\":1,\"chance\":\"17000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"12500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"99900\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"88800\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"77700\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"66600\"},{\"id\":\"2179\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2470\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2033\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2418\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2155\",\"count\":1,\"chance\":\"1500\"},{\"id\":\"2396\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2177\",\"count\":1,\"chance\":\"1000\"},{\"id\":\"2162\",\"count\":1,\"chance\":\"11500\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"7500\"},{\"id\":\"2164\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2178\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2186\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2176\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2171\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"2200\",\"count\":1,\"chance\":\"4500\"},{\"id\":\"1982\",\"count\":1,\"chance\":\"2600\"},{\"id\":\"2214\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"2123\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2170\",\"count\":1,\"chance\":\"13000\"},{\"id\":\"2402\",\"count\":1,\"chance\":\"15500\"},{\"id\":\"2436\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2150\",\"count\":\"20\",\"chance\":\"13500\"},{\"id\":\"2145\",\"count\":\"5\",\"chance\":\"9500\"},{\"id\":\"2149\",\"count\":\"10\",\"chance\":\"15500\"},{\"id\":\"2146\",\"count\":\"10\",\"chance\":\"13500\"},{\"id\":\"2182\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"2165\",\"count\":1,\"chance\":\"9500\"},{\"id\":\"2197\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2174\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2151\",\"count\":\"7\",\"chance\":\"14000\"},{\"id\":\"2112\",\"count\":1,\"chance\":\"14500\"},{\"id\":\"2421\",\"count\":1,\"chance\":\"13500\"},{\"id\":\"2377\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2185\",\"count\":1,\"chance\":\"3500\"},{\"id\":\"3955\",\"count\":1,\"chance\":\"100\"},{\"id\":\"2188\",\"count\":1,\"chance\":\"2500\"},{\"id\":\"2143\",\"count\":\"15\",\"chance\":\"12500\"}]','[]'),
(459,0,'Zathroth',0,9999,28000,'{\"type\":145,\"head\":20,\"body\":95,\"legs\":114,\"feet\":114,\"addons\":3,\"corpse\":3128}',85,1,'[\"Want to feel some Aim?\",\"You can Run but never Hide!\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,1,1,1,0,110,90,1,'venom','[{\"id\":\"2142\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2144\",\"count\":\"15\",\"chance\":\"15000\"},{\"id\":\"2158\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2195\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2186\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2192\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2125\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2124\",\"count\":\"1\",\"chance\":\"5500\"},{\"id\":\"2520\",\"count\":\"1\",\"chance\":\"15500\"},{\"id\":\"2462\",\"count\":\"1\",\"chance\":\"11000\"},{\"id\":\"2387\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2434\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2167\",\"count\":\"1\",\"chance\":\"13500\"},{\"id\":\"2432\",\"count\":\"1\",\"chance\":\"17000\"},{\"id\":\"2393\",\"count\":\"1\",\"chance\":\"12500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"99900\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"88800\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"77700\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"66600\"},{\"id\":\"2179\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2470\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2033\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2418\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2182\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2155\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2188\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2396\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2177\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2162\",\"count\":\"1\",\"chance\":\"11500\"},{\"id\":\"2472\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"2514\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2178\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2176\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"2171\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"2200\",\"count\":\"1\",\"chance\":\"4500\"},{\"id\":\"1982\",\"count\":\"1\",\"chance\":\"2600\"},{\"id\":\"2214\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2123\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2170\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2402\",\"count\":\"1\",\"chance\":\"15500\"},{\"id\":\"2436\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2150\",\"count\":\"20\",\"chance\":\"13500\"},{\"id\":\"2145\",\"count\":\"5\",\"chance\":\"9500\"},{\"id\":\"2149\",\"count\":\"10\",\"chance\":\"15500\"},{\"id\":\"2146\",\"count\":\"10\",\"chance\":\"13500\"},{\"id\":\"2165\",\"count\":\"1\",\"chance\":\"9500\"},{\"id\":\"2197\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2174\",\"count\":\"1\",\"chance\":\"2500\"},{\"id\":\"2151\",\"count\":\"7\",\"chance\":\"14000\"},{\"id\":\"2112\",\"count\":\"1\",\"chance\":\"14500\"},{\"id\":\"2421\",\"count\":\"1\",\"chance\":\"13500\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"3955\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2185\",\"count\":\"1\",\"chance\":\"3500\"},{\"id\":\"2143\",\"count\":\"15\",\"chance\":\"12500\"}]','[{\"name\":\"warlock\",\"chance\":\"25\"}]'),
(460,0,'Goshnar',0,4000,10000,'{\"type\":2,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":2967}',167,1,'[\"Renat Ulderek.\",\"Ikem King Zambo.\"]','[\"fire\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,55,28,1,'blood','[{\"id\":\"2465\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2478\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2497\",\"count\":\"1\",\"chance\":\"200\"},{\"id\":\"2490\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2434\",\"count\":\"1\",\"chance\":\"200\"},{\"id\":\"2667\",\"count\":\"2\",\"chance\":\"10000\"},{\"id\":\"2148\",\"count\":\"45\",\"chance\":\"19000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"2428\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2463\",\"count\":\"1\",\"chance\":\"6000\"},{\"id\":\"2647\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2200\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2419\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"2165\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"2000\"}]','[{\"name\":\"goshnar\",\"chance\":\"50\"}]'),
(461,0,'Durin',400,4000,10000,'{\"type\":70,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":2983}',168,1,'[\"Fear my Axe!\"]','[\"poison\",\"outfit\",\"drunk\",\"invisible\"]','[]',1,1,0,1,0,0,0,0,1,1,0,37,15,1,'blood','[{\"id\":\"2208\",\"count\":\"1\",\"chance\":\"200\"},{\"id\":\"2417\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2513\",\"count\":\"1\",\"chance\":\"7500\"},{\"id\":\"2387\",\"count\":\"1\",\"chance\":\"600\"},{\"id\":\"2148\",\"count\":\"30\",\"chance\":\"50000\"},{\"id\":\"2643\",\"count\":\"1\",\"chance\":\"40000\"},{\"id\":\"2483\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2150\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2457\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2787\",\"count\":\"2\",\"chance\":\"55000\"}]','[{\"name\":\"dwarf guard\",\"chance\":\"50\"}]'),
(462,0,'Demora',0,400,2000,'{\"type\":35,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":2916}',100,0,'[\"MWIAHAIA!\",\"Your soul will be mine someday!\"]','[\"energy\",\"fire\",\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,65,40,1,'fire','[{\"id\":\"2520\",\"count\":\"1\",\"chance\":\"700\"},{\"id\":\"2462\",\"count\":\"1\",\"chance\":\"1200\"},{\"id\":\"2387\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2432\",\"count\":\"1\",\"chance\":\"4000\"},{\"id\":\"2795\",\"count\":\"6\",\"chance\":\"20000\"},{\"id\":\"2393\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"70000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"60000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"50000\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"40000\"},{\"id\":\"2179\",\"count\":\"1\",\"chance\":\"1100\"},{\"id\":\"2470\",\"count\":\"1\",\"chance\":\"400\"},{\"id\":\"2418\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2396\",\"count\":\"1\",\"chance\":\"600\"},{\"id\":\"2472\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2514\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"200\"},{\"id\":\"2176\",\"count\":\"1\",\"chance\":\"3000\"},{\"id\":\"2171\",\"count\":\"1\",\"chance\":\"700\"},{\"id\":\"1982\",\"count\":\"1\",\"chance\":\"1300\"},{\"id\":\"2214\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2149\",\"count\":\"1\",\"chance\":\"11000\"},{\"id\":\"2165\",\"count\":\"1\",\"chance\":\"1400\"},{\"id\":\"2151\",\"count\":\"1\",\"chance\":\"3500\"}]','[{\"name\":\"fire devil\",\"chance\":\"15\"}]'),
(463,0,'Lumenia',0,1350,1500,'{\"type\":141,\"head\":71,\"body\":132,\"legs\":71,\"feet\":1,\"corpse\":3065}',40,0,'[\"Let\'s have a fight!\",\"Wheres my Hero?\",\"OHH I NEED MY HERO...\",\"Welcome to my battleground!\"]','[\"energy\",\"fire\",\"poison\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,50,35,1,'blood','[{\"id\":\"2544\",\"count\":\"13\",\"chance\":\"27000\"},{\"id\":\"2456\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"2487\",\"count\":\"1\",\"chance\":\"600\"},{\"id\":\"2491\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2488\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2519\",\"count\":\"1\",\"chance\":\"400\"},{\"id\":\"2392\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2148\",\"count\":\"100\",\"chance\":\"60000\"},{\"id\":\"2681\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2652\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2071\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2666\",\"count\":\"2\",\"chance\":\"18000\"},{\"id\":\"2164\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2744\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2120\",\"count\":\"1\",\"chance\":\"20000\"},{\"id\":\"2661\",\"count\":\"1\",\"chance\":\"12000\"},{\"id\":\"1949\",\"count\":\"1\",\"chance\":\"45000\"},{\"id\":\"2377\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2391\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2121\",\"count\":\"1\",\"chance\":\"5000\"}]','[]'),
(464,0,'Dracula',0,2000,5000,'{\"type\":68,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":2956}',40,0,'[\"BLOOD!\",\"Let me kiss your neck.\",\"I smell warm blood.\",\"I call you, my bats! Come!\"]','[\"poison\",\"lifedrain\",\"paralyze\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,38,27,1,'undead','[{\"id\":\"2144\",\"count\":\"1\",\"chance\":\"1500\"},{\"id\":\"2032\",\"count\":\"1\",\"chance\":\"11000\"},{\"id\":\"2172\",\"count\":\"1\",\"chance\":\"200\"},{\"id\":\"2127\",\"count\":\"1\",\"chance\":\"200\"},{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"15000\"},{\"id\":\"2747\",\"count\":\"1\",\"chance\":\"18000\"},{\"id\":\"2396\",\"count\":\"1\",\"chance\":\"300\"},{\"id\":\"2412\",\"count\":\"1\",\"chance\":\"15000\"},{\"id\":\"2649\",\"count\":\"1\",\"chance\":\"8000\"},{\"id\":\"2229\",\"count\":\"1\",\"chance\":\"10000\"},{\"id\":\"2383\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2479\",\"count\":\"1\",\"chance\":\"400\"},{\"id\":\"2534\",\"count\":\"1\",\"chance\":\"100\"}]','[{\"name\":\"vampire\",\"chance\":\"50\"}]'),
(465,0,'Alezzo',0,4000,6000,'{\"type\":115,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":4262}',1,0,'[\"Shhhhhhhh.\",\"I ssssmell warm blood!\"]','[\"poison\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,1,1,0,0,0,1,1,1,0,15,22,0,'blood','[{\"id\":\"2654\",\"count\":\"1\",\"chance\":\"9000\"},{\"id\":\"3971\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2817\",\"count\":\"1\",\"chance\":\"70000\"},{\"id\":\"2237\",\"count\":\"1\",\"chance\":\"19900\"},{\"id\":\"2148\",\"count\":\"25\",\"chance\":\"80000\"},{\"id\":\"2177\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2168\",\"count\":\"1\",\"chance\":\"200\"},{\"id\":\"2181\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2150\",\"count\":\"1\",\"chance\":\"500\"},{\"id\":\"2182\",\"count\":\"1\",\"chance\":\"100\"},{\"id\":\"2154\",\"count\":\"1\",\"chance\":\"200\"}]','[{\"name\":\"cobra\",\"chance\":\"25\"}]'),
(466,0,'Prince Almirith',0,2400,5000,'{\"type\":63,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":2979}',20,0,'[\"Im the Prince of this Forest!\",\"This is my forest!\",\"How did you get here?\",\"Stand still!\"]','[\"energy\",\"fire\",\"poison\",\"outfit\",\"drunk\",\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,20,15,0,'blood','[{\"id\":\"2544\",\"count\":\"3\",\"chance\":\"6000\"},{\"id\":\"2260\",\"count\":\"1\",\"chance\":\"18000\"},{\"id\":\"2032\",\"count\":\"1\",\"chance\":\"5500\"},{\"id\":\"2689\",\"count\":\"1\",\"chance\":\"14000\"},{\"id\":\"2047\",\"count\":\"1\",\"chance\":\"22000\"},{\"id\":\"2198\",\"count\":\"1\",\"chance\":\"2000\"},{\"id\":\"2747\",\"count\":\"1\",\"chance\":\"7000\"},{\"id\":\"2652\",\"count\":\"1\",\"chance\":\"7000\"},{\"id\":\"2600\",\"count\":\"1\",\"chance\":\"9000\"},{\"id\":\"2177\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2682\",\"count\":\"1\",\"chance\":\"22000\"},{\"id\":\"2642\",\"count\":\"1\",\"chance\":\"13000\"},{\"id\":\"1949\",\"count\":\"1\",\"chance\":\"30000\"},{\"id\":\"2802\",\"count\":\"1\",\"chance\":\"5000\"},{\"id\":\"2401\",\"count\":\"1\",\"chance\":\"11000\"},{\"id\":\"2189\",\"count\":\"1\",\"chance\":\"1000\"},{\"id\":\"2154\",\"count\":\"1\",\"chance\":\"200\"}]','[]'),
(467,0,'Elf Warlord',800,1200,2000,'{\"type\":64,\"corpse\":2981}',1,0,'[\"Protect the Prince!!\",\"Intruder!\"]','[\"outfit\",\"drunk\",\"invisible\"]','[]',0,1,0,1,0,0,0,0,1,1,0,18,7,0,'blood','[{\"id\":\"2544\",\"count\":\"12\",\"chance\":\"30000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"4000\"},{\"id\":\"2148\",\"count\":\"55\",\"chance\":\"30000\"},{\"id\":\"2681\",\"count\":1,\"chance\":\"18000\"},{\"id\":\"2397\",\"count\":1,\"chance\":\"6000\"},{\"id\":\"2545\",\"count\":\"3\",\"chance\":\"15000\"},{\"id\":\"2642\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2484\",\"count\":1,\"chance\":\"12000\"},{\"id\":\"2482\",\"count\":1,\"chance\":\"8000\"},{\"id\":\"2031\",\"count\":1,\"chance\":\"14000\"}]','[]'),
(468,0,'Random Noob',390,480000,1950,'{\"type\":129,\"head\":36,\"body\":83,\"legs\":116,\"feet\":78,\"corpse\":2212}',85,0,'[\"Come here, free itenz!\",\"Come, look! A bug!\",\"I found a bug! Come and look!\"]','[]','[]',0,0,0,1,0,0,0,1,1,1,0,93,90,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2544\",\"count\":\"15\",\"chance\":\"10000\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"2147\",\"count\":\"2\",\"chance\":\"3333\"},{\"id\":\"2675\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2690\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2201\",\"count\":1,\"chance\":\"2500\"}]','[{\"name\":\"Magebomb\",\"chance\":\"100\"},{\"name\":\"Magebomb\",\"chance\":\"100\"},{\"name\":\"Magebomb\",\"chance\":\"100\"},{\"name\":\"Magebomb\",\"chance\":\"100\"},{\"name\":\"Magebomb\",\"chance\":\"100\"}]'),
(469,0,'Training Monk',0,0,200000,'{\"type\":312,\"corpse\":9660}',1,0,'[]','[\"invisible\"]','[]',0,0,0,1,0,0,0,0,1,1,0,0,0,0,'blood','[]','[]'),
(470,0,'Dragao De Gelo',390,400000,150000,'{\"type\":248,\"head\":0,\"body\":0,\"legs\":0,\"feet\":0,\"corpse\":7091}',120,0,'[\"CHHHRRRR\",\"HISSSS\"]','[\"ice\",\"fire\",\"earth\",\"paralyze\",\"lifedrain\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"15\"}]',0,0,0,1,0,0,0,1,1,1,0,45,45,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"6000\"}]','[]'),
(471,0,'Magebomb',390,480000,1900,'{\"type\":134,\"head\":95,\"body\":0,\"legs\":113,\"feet\":115,\"corpse\":6080}',75,0,'[\"Noob!\",\"Noob 2x!\"]','[]','[]',0,0,0,1,0,0,0,1,1,1,0,73,70,0,'blood','[{\"id\":\"2148\",\"count\":\"20\",\"chance\":\"100000\"},{\"id\":\"2465\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2461\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2649\",\"count\":1,\"chance\":\"10000\"},{\"id\":\"2671\",\"count\":\"2\",\"chance\":\"20000\"},{\"id\":\"3976\",\"count\":\"10\",\"chance\":\"50000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"100000\"},{\"id\":\"2456\",\"count\":1,\"chance\":\"6666\"},{\"id\":\"2544\",\"count\":\"15\",\"chance\":\"10000\"},{\"id\":\"2546\",\"count\":\"5\",\"chance\":\"10000\"},{\"id\":\"2147\",\"count\":\"2\",\"chance\":\"3333\"},{\"id\":\"2675\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2690\",\"count\":\"4\",\"chance\":\"6666\"},{\"id\":\"2050\",\"count\":1,\"chance\":\"20000\"},{\"id\":\"2478\",\"count\":1,\"chance\":\"3333\"},{\"id\":\"2652\",\"count\":1,\"chance\":\"2222\"},{\"id\":\"2201\",\"count\":1,\"chance\":\"2500\"}]','[{\"name\":\"Magebomb\",\"chance\":\"0\"}]'),
(472,0,'Capeta',10000,400000,150000,'{\"type\":35,\"corpse\":5995}',128,1,'[\"MUHAHAHAHA!\",\"I SMELL FEEEEEAAAR!\",\"CHAMEK ATH UTHUL ARAK!\",\"Your resistance is futile!\",\"Your soul will be mine!\"]','[\"fire\",\"drown\",\"paralyze\",\"invisible\"]','[{\"name\":\"Physical\",\"percent\":\"30\"},{\"name\":\"Energy\",\"percent\":\"50\"},{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Death\",\"percent\":\"20\"}]',0,0,0,1,0,0,0,0,1,1,0,55,55,1,'fire','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"1987\",\"count\":1,\"chance\":\"5000\"},{\"id\":\"2393\",\"count\":1,\"chance\":\"6000\"}]','[{\"name\":\"fire elemental\",\"chance\":\"12\"}]'),
(473,0,'Morte',0,400000,150000,'{\"type\":300,\"corpse\":8955}',75,0,'[\"Death!\",\"Come a little closer!\",\"The end is near!\"]','[\"lifedrain\",\"paralyze\",\"invisible\"]','[{\"name\":\"Earth\",\"percent\":\"20\"},{\"name\":\"Ice\",\"percent\":\"10\"},{\"name\":\"Death\",\"percent\":\"60\"}]',0,0,0,1,0,0,0,0,1,1,0,30,30,1,'undead','[{\"id\":\"2160\",\"count\":\"10\",\"chance\":\"100000\"},{\"id\":\"2514\",\"count\":1,\"chance\":\"2000\"},{\"id\":\"2472\",\"count\":1,\"chance\":\"2000\"}]','[]'),
(474,0,'Mr.Ever',0,100,300,'{\"type\":128,\"corpse\":6080}',15,0,'[]','[\"name\"]','[]',0,0,0,1,0,0,0,0,1,1,0,15,15,1,'blood','[]','[]');
/*!40000 ALTER TABLE `myaac_monsters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_news`
--

DROP TABLE IF EXISTS `myaac_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 - news, 2 - ticker, 3 - article',
  `date` int(11) NOT NULL DEFAULT 0,
  `category` tinyint(4) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `last_modified_by` int(11) NOT NULL DEFAULT 0,
  `last_modified_date` int(11) NOT NULL DEFAULT 0,
  `comments` varchar(50) NOT NULL DEFAULT '',
  `article_text` varchar(300) NOT NULL DEFAULT '',
  `article_image` varchar(100) NOT NULL DEFAULT '',
  `hide` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_news`
--

LOCK TABLES `myaac_news` WRITE;
/*!40000 ALTER TABLE `myaac_news` DISABLE KEYS */;
INSERT INTO `myaac_news` VALUES
(1,'Ol√°','<p>Bem-vindo(a) ao Baiak Pesado!</p>',1,1776530937,1,4,4,1778268607,'https://my-aac.org','','',0),
(2,'Castle 24 Horas','<h3 data-path-to-node=\"3\"><strong data-path-to-node=\"3\" data-index-in-node=\"0\">(Castelo 24 Horas): &Eacute;</strong>&nbsp;proibido o uso de MC. Cada jogador pode utilizar apenas <strong data-path-to-node=\"4\" data-index-in-node=\"64\">um &uacute;nico personagem</strong> dentro da &aacute;rea de batalha do evento.</h3>\r\n<h3 data-path-to-node=\"5\"><strong data-path-to-node=\"5\" data-index-in-node=\"0\">Puni&ccedil;&otilde;es:</strong></h3>\r\n<p data-path-to-node=\"6\">&nbsp; &nbsp; &nbsp;Ap&oacute;s muita an&aacute;lise e diversos testes, fizemos algumas mudan&ccedil;as no Castle:</p>\r\n<ul data-path-to-node=\"7\">\r\n<li>\r\n<p data-path-to-node=\"7,0,0\"><strong data-path-to-node=\"7,0,0\" data-index-in-node=\"0\">Pris&atilde;o:</strong> Qualquer uso de bug, abuso de cave ou viola&ccedil;&atilde;o das regras do servidor resultar&aacute; em puni&ccedil;&atilde;o m&iacute;nima de <strong data-path-to-node=\"7,0,0\" data-index-in-node=\"109\">24 horas de pris&atilde;o</strong>.</p>\r\n</li>\r\n<li>\r\n<p data-path-to-node=\"7,1,0\"><strong data-path-to-node=\"7,1,0\" data-index-in-node=\"0\">Racismo:</strong> Qualquer atitude considerada racista ser&aacute; punida com, no m&iacute;nimo, <strong data-path-to-node=\"7,1,0\" data-index-in-node=\"74\">24 horas de pris&atilde;o</strong>.</p>\r\n</li>\r\n</ul>\r\n<p data-path-to-node=\"8\">&nbsp; &nbsp; &nbsp;‚öîÔ∏è <strong data-path-to-node=\"8\" data-index-in-node=\"3\">Joguem com responsabilidade e divirtam-se! &nbsp;‚öîÔ∏è</strong></p>\r\n<p data-path-to-node=\"9\"><strong data-path-to-node=\"9\" data-index-in-node=\"0\">&nbsp; &nbsp; üî•ADM PESADOüî•</strong></p>',2,1776530937,1,4,4,1778857323,'','','',0),
(3,'Castle 48 Horas','<h3 data-path-to-node=\"3\"><strong data-path-to-node=\"3\" data-index-in-node=\"0\">(Castelo 48 Horas): &Eacute;</strong>&nbsp;proibido o uso de MC. Cada jogador pode utilizar apenas&nbsp;<strong data-path-to-node=\"4\" data-index-in-node=\"64\">um &uacute;nico personagem</strong> dentro da &aacute;rea de batalha do evento.</h3>\r\n<h3 data-path-to-node=\"5\"><strong data-path-to-node=\"5\" data-index-in-node=\"0\">Puni&ccedil;&otilde;es:</strong></h3>\r\n<p data-path-to-node=\"6\">&nbsp; &nbsp; &nbsp;Ap&oacute;s muita an&aacute;lise e diversos testes, fizemos algumas mudan&ccedil;as no Castle:</p>\r\n<ul data-path-to-node=\"7\">\r\n<li>\r\n<p data-path-to-node=\"7,0,0\"><strong data-path-to-node=\"7,0,0\" data-index-in-node=\"0\">Pris&atilde;o:</strong> Qualquer uso de bug, abuso de cave ou viola&ccedil;&atilde;o das regras do servidor resultar&aacute; em puni&ccedil;&atilde;o m&iacute;nima de <strong data-path-to-node=\"7,0,0\" data-index-in-node=\"109\">24 horas de pris&atilde;o</strong>.</p>\r\n</li>\r\n<li>\r\n<p data-path-to-node=\"7,1,0\"><strong data-path-to-node=\"7,1,0\" data-index-in-node=\"0\">Racismo:</strong> Qualquer atitude considerada racista ser&aacute; punida com, no m&iacute;nimo, <strong data-path-to-node=\"7,1,0\" data-index-in-node=\"74\">24 horas de pris&atilde;o</strong>.</p>\r\n</li>\r\n</ul>\r\n<p data-path-to-node=\"8\">&nbsp; &nbsp; &nbsp;‚öîÔ∏è <strong data-path-to-node=\"8\" data-index-in-node=\"3\">Joguem com responsabilidade e divirtam-se! &nbsp;‚öîÔ∏è</strong></p>\r\n<p data-path-to-node=\"9\"><strong data-path-to-node=\"9\" data-index-in-node=\"0\">&nbsp; &nbsp; üî•ADM PESADOüî•</strong></p>',2,1777291478,1,4,4,1778857313,'0','','',0),
(6,'ABERTURA','<p>Nosso servidor iniciar&aacute; &aacute;s 18 horas dia 16/05/2026</p>',2,1778671760,3,4,4,1778846336,'0','','',0);
/*!40000 ALTER TABLE `myaac_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_news_categories`
--

DROP TABLE IF EXISTS `myaac_news_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_news_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `icon_id` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_news_categories`
--

LOCK TABLES `myaac_news_categories` WRITE;
/*!40000 ALTER TABLE `myaac_news_categories` DISABLE KEYS */;
INSERT INTO `myaac_news_categories` VALUES
(1,'','',0,0),
(2,'','',1,0),
(3,'','',2,0),
(4,'','',3,0),
(5,'','',4,0);
/*!40000 ALTER TABLE `myaac_news_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_notepad`
--

DROP TABLE IF EXISTS `myaac_notepad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_notepad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_notepad`
--

LOCK TABLES `myaac_notepad` WRITE;
/*!40000 ALTER TABLE `myaac_notepad` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_notepad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_pages`
--

DROP TABLE IF EXISTS `myaac_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `body` text NOT NULL,
  `date` int(11) NOT NULL DEFAULT 0,
  `player_id` int(11) NOT NULL DEFAULT 0,
  `php` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0 - plain html, 1 - php',
  `enable_tinymce` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 - enabled, 0 - disabled',
  `access` tinyint(4) NOT NULL DEFAULT 0,
  `hide` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_pages`
--

LOCK TABLES `myaac_pages` WRITE;
/*!40000 ALTER TABLE `myaac_pages` DISABLE KEYS */;
INSERT INTO `myaac_pages` VALUES
(2,'commands','Commands','<table class=\"myaac-table\" style=\"border-collapse: collapse; width: 100%; height: 72px; border-width: 1px;\" border=\"1\"><colgroup><col style=\"width: 50%;\"><col style=\"width: 50%;\"></colgroup>\n	<thead>\n	<tr style=\"height: 18px;\">\n		<td style=\"height: 18px; border-width: 1px; text-align: center;\"><span style=\"color: #ffffff;\"><strong>Words</strong></span></td>\n		<td style=\"height: 18px; border-width: 1px; text-align: center;\"><strong>Description</strong></td>\n	</tr>\n	</thead>\n	<tbody>\n	<tr style=\"height: 18px;\">\n		<td style=\"height: 18px; border-width: 1px;\">!example</td>\n		<td style=\"height: 18px; border-width: 1px;\">This is just an example</td>\n	</tr>\n	<tr style=\"height: 18px;\">\n		<td style=\"height: 18px; border-width: 1px;\">!buyhouse</td>\n		<td style=\"height: 18px; border-width: 1px;\">Buy house you are looking at</td>\n	</tr>\n	<tr style=\"height: 18px;\">\n		<td style=\"height: 18px; border-width: 1px;\"><em>!aol</em></td>\n		<td style=\"height: 18px; border-width: 1px;\">Buy AoL</td>\n	</tr>\n	</tbody>\n</table>\n',1776530940,1,0,1,0,0),
(3,'rules_on_the_page','Rules','1. Names\na) Names which contain insulting (e.g. \"Bastard\"), racist (e.g. \"Nigger\"), extremely right-wing (e.g. \"Hitler\"), sexist (e.g. \"Bitch\") or offensive (e.g. \"Copkiller\") language.\nb) Names containing parts of sentences (e.g. \"Mike returns\"), nonsensical combinations of letters (e.g. \"Fgfshdsfg\") or invalid formattings (e.g. \"Thegreatknight\").\nc) Names that obviously do not describe a person (e.g. \"Christmastree\", \"Matrix\"), names of real life celebrities (e.g. \"Britney Spears\"), names that refer to real countries (e.g. \"Swedish Druid\"), names which were created to fake other players\' identities (e.g. \"Arieswer\" instead of \"Arieswar\") or official positions (e.g. \"System Admin\").\n\n2. Cheating\na) Exploiting obvious errors of the game (\"bugs\"), for instance to duplicate items. If you find an error you must report it to CipSoft immediately.\nb) Intentional abuse of weaknesses in the gameplay, for example arranging objects or players in a way that other players cannot move them.\nc) Using tools to automatically perform or repeat certain actions without any interaction by the player (\"macros\").\nd) Manipulating the client program or using additional software to play the game.\ne) Trying to steal other players\\\' account data (\"hacking\").\nf) Playing on more than one account at the same time (\"multi-clienting\").\ng) Offering account data to other players or accepting other players\' account data (\"account-trading/sharing\").\n\n3. Gamemasters\na) Threatening a gamemaster because of his or her actions or position as a gamemaster.\nb) Pretending to be a gamemaster or to have influence on the decisions of a gamemaster.\nc) Intentionally giving wrong or misleading information to a gamemaster concerning his or her investigations or making false reports about rule violations.\n\n4. Player Killing\na) Excessive killing of characters who are not marked with a \"skull\" on worlds which are not PvP-enforced. Please note that killing marked characters is not a reason for a banishment.\n\nA violation of the Tibia Rules may lead to temporary banishment of characters and accounts. In severe cases removal or modification of character skills, attributes and belongings, as well as the permanent removal of accounts without any compensation may be considered. The sanction is based on the seriousness of the rule violation and the previous record of the player. It is determined by the gamemaster imposing the banishment.\n\nThese rules may be changed at any time. All changes will be announced on the official website.\n',1776530940,1,0,0,0,1),
(4,'rules','Server Rules','<b>{{ config.lua.serverName }} Rules</b><br/>1. Names<br />\na) Names which contain insulting (e.g. \"Bastard\"), racist (e.g. \"Nigger\"), extremely right-wing (e.g. \"Hitler\"), sexist (e.g. \"Bitch\") or offensive (e.g. \"Copkiller\") language.<br />\nb) Names containing parts of sentences (e.g. \"Mike returns\"), nonsensical combinations of letters (e.g. \"Fgfshdsfg\") or invalid formattings (e.g. \"Thegreatknight\").<br />\nc) Names that obviously do not describe a person (e.g. \"Christmastree\", \"Matrix\"), names of real life celebrities (e.g. \"Britney Spears\"), names that refer to real countries (e.g. \"Swedish Druid\"), names which were created to fake other players\' identities (e.g. \"Arieswer\" instead of \"Arieswar\") or official positions (e.g. \"System Admin\").<br />\n<br />\n2. Cheating<br />\na) Exploiting obvious errors of the game (\"bugs\"), for instance to duplicate items. If you find an error you must report it to CipSoft immediately.<br />\nb) Intentional abuse of weaknesses in the gameplay, for example arranging objects or players in a way that other players cannot move them.<br />\nc) Using tools to automatically perform or repeat certain actions without any interaction by the player (\"macros\").<br />\nd) Manipulating the client program or using additional software to play the game.<br />\ne) Trying to steal other players\\\' account data (\"hacking\").<br />\nf) Playing on more than one account at the same time (\"multi-clienting\").<br />\ng) Offering account data to other players or accepting other players\' account data (\"account-trading/sharing\").<br />\n<br />\n3. Gamemasters<br />\na) Threatening a gamemaster because of his or her actions or position as a gamemaster.<br />\nb) Pretending to be a gamemaster or to have influence on the decisions of a gamemaster.<br />\nc) Intentionally giving wrong or misleading information to a gamemaster concerning his or her investigations or making false reports about rule violations.<br />\n<br />\n4. Player Killing<br />\na) Excessive killing of characters who are not marked with a \"skull\" on worlds which are not PvP-enforced. Please note that killing marked characters is not a reason for a banishment.<br />\n<br />\nA violation of the Tibia Rules may lead to temporary banishment of characters and accounts. In severe cases removal or modification of character skills, attributes and belongings, as well as the permanent removal of accounts without any compensation may be considered. The sanction is based on the seriousness of the rule violation and the previous record of the player. It is determined by the gamemaster imposing the banishment.<br />\n<br />\nThese rules may be changed at any time. All changes will be announced on the official website.<br />\n',1776530940,1,0,1,0,0);
/*!40000 ALTER TABLE `myaac_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_paypal`
--

DROP TABLE IF EXISTS `myaac_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_paypal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `txn_id` varchar(30) NOT NULL,
  `email` varchar(255) NOT NULL,
  `account_id` int(11) NOT NULL,
  `price` float NOT NULL,
  `currency` varchar(10) NOT NULL,
  `points` int(11) NOT NULL,
  `payer_status` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_paypal`
--

LOCK TABLES `myaac_paypal` WRITE;
/*!40000 ALTER TABLE `myaac_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_settings`
--

DROP TABLE IF EXISTS `myaac_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=1491 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_settings`
--

LOCK TABLES `myaac_settings` WRITE;
/*!40000 ALTER TABLE `myaac_settings` DISABLE KEYS */;
INSERT INTO `myaac_settings` VALUES
(1325,'core','date_timezone','Europe/Warsaw'),
(1326,'core','friendly_urls','true'),
(1327,'core','csrf_protection','true'),
(1328,'core','google_analytics_id',''),
(1329,'core','template','tibiacom'),
(1330,'core','template_allow_change','false'),
(1331,'core','charset','utf-8'),
(1332,'core','meta_description','Tibia is a free massive multiplayer online role playing game (MMORPG).'),
(1333,'core','meta_keywords','free online game, free multiplayer game, ots, open tibia server'),
(1334,'core','footer',''),
(1335,'core','footer_load_time','true'),
(1336,'core','visitors_counter','true'),
(1337,'core','visitors_counter_ttl','10'),
(1338,'core','views_counter','true'),
(1339,'core','session_prefix','myaac_'),
(1340,'core','backward_support','true'),
(1341,'core','anonymous_usage_statistics','true'),
(1342,'core','html_head',''),
(1343,'core','html_body',''),
(1344,'core','html_footer',''),
(1345,'core','client','860'),
(1346,'core','towns','0=No Town\r\n1=Sample Town'),
(1347,'core','genders','Female, Male'),
(1348,'core','account_types','None, Normal, Tutor, Senior Tutor, Gamemaster, Community Manager, God'),
(1349,'core','vocations_amount','4'),
(1350,'core','vocations','None, Sorcerer, Druid, Paladin, Knight, Master Sorcerer, Elder Druid,Royal Paladin, Elite Knight'),
(1351,'core','mail_enabled','false'),
(1352,'core','mail_address','no-reply@your-server.org'),
(1353,'core','mail_signature_plain','--\r\nSent by MyAAC,\r\nhttps://my-aac.org'),
(1354,'core','mail_signature_html','&lt;br/&gt;\r\nSent by MyAAC,&lt;br/&gt;\r\n&lt;a href=&quot;https://my-aac.org&quot;&gt;my-aac.org&lt;/a&gt;'),
(1355,'core','mail_option','0'),
(1356,'core','smtp_host',''),
(1357,'core','smtp_port','25'),
(1358,'core','smtp_auth','true'),
(1359,'core','smtp_user','admin@example.org'),
(1360,'core','smtp_pass',''),
(1361,'core','smtp_security','0'),
(1362,'core','smtp_debug','false'),
(1363,'core','account_welcome_mail','true'),
(1364,'core','account_mail_verify','false'),
(1365,'core','mail_send_when_change_password','true'),
(1366,'core','mail_send_when_generate_reckey','true'),
(1367,'core','mail_lost_account_interval','60'),
(1368,'core','account_management','true'),
(1369,'core','account_login_by_email','false'),
(1370,'core','account_login_by_email_fallback','false'),
(1371,'core','account_create_auto_login','false'),
(1372,'core','account_create_character_create','true'),
(1373,'core','account_mail_unique','true'),
(1374,'core','account_premium_days','0'),
(1375,'core','account_premium_points','0'),
(1376,'core','account_coins','0'),
(1377,'core','account_mail_change','2'),
(1378,'core','account_mail_block_plus_sign','true'),
(1379,'core','account_country','true'),
(1380,'core','account_country_recognize','true'),
(1381,'core','account_countries_most_popular','pl,se,br,us,gb'),
(1382,'core','characters_per_account','10'),
(1383,'core','character_samples','1=Sorcerer Sample\r\n2=Druid Sample\r\n3=Paladin Sample\r\n4=Knight Sample'),
(1384,'core','character_towns','1'),
(1385,'core','create_character_name_min_length','3'),
(1386,'core','create_character_name_max_length','21'),
(1387,'core','create_character_name_blocked_prefix','admin ,administrator ,gm ,cm ,god ,tutor'),
(1388,'core','create_character_name_blocked_names','admin,administrator,gm,cm,god,tutor'),
(1389,'core','create_character_name_blocked_words','admin,administrator,gamemaster,game master,game-master,game\'master,fuck,sux,suck,noob,tutor'),
(1390,'core','create_character_name_monsters_check','true'),
(1391,'core','create_character_name_npc_check','true'),
(1392,'core','create_character_name_spells_check','true'),
(1393,'core','use_character_sample_skills','false'),
(1394,'core','account_mail_confirmed_reward_premium_days','0'),
(1395,'core','account_mail_confirmed_reward_premium_points','0'),
(1396,'core','account_mail_confirmed_reward_coins','0'),
(1397,'core','guild_management','true'),
(1398,'core','guild_need_level','1'),
(1399,'core','guild_need_premium','true'),
(1400,'core','guild_image_size_kb','80'),
(1401,'core','guild_description_default','New guild. Leader must edit this text :)'),
(1402,'core','guild_description_chars_limit','1000'),
(1403,'core','guild_description_lines_limit','6'),
(1404,'core','guild_motd_chars_limit','150'),
(1405,'core','news_author','true'),
(1406,'core','news_limit','5'),
(1407,'core','news_ticker_limit','5'),
(1408,'core','news_date_format','j.n.Y'),
(1409,'core','forum','site'),
(1410,'core','forum_level_required','0'),
(1411,'core','forum_post_interval','30'),
(1412,'core','forum_posts_per_page','20'),
(1413,'core','forum_threads_per_page','20'),
(1414,'core','forum_table_prefix','myaac_'),
(1415,'core','highscores_per_page','100'),
(1416,'core','highscores_cache_ttl','15'),
(1417,'core','highscores_skills_box','true'),
(1418,'core','highscores_vocation_box','true'),
(1419,'core','highscores_vocation','true'),
(1420,'core','highscores_online_status','false'),
(1421,'core','highscores_frags','false'),
(1422,'core','highscores_balance','false'),
(1423,'core','highscores_outfit','true'),
(1424,'core','highscores_country_box','false'),
(1425,'core','highscores_groups_hidden','3'),
(1426,'core','highscores_ids_hidden','1, 5, 6, 7, 8, 9'),
(1427,'core','characters_search_limit','15'),
(1428,'core','characters_level','true'),
(1429,'core','characters_experience','false'),
(1430,'core','characters_magic_level','false'),
(1431,'core','characters_balance','false'),
(1432,'core','characters_marriage','true'),
(1433,'core','characters_outfit','true'),
(1434,'core','characters_creation_date','true'),
(1435,'core','characters_quests','false'),
(1436,'core','quests','Some Quest=123\r\nSome Quest Two=456'),
(1437,'core','characters_skills','true'),
(1438,'core','characters_equipment','true'),
(1439,'core','characters_frags','false'),
(1440,'core','characters_deleted','false'),
(1441,'core','online_cache_ttl','15'),
(1442,'core','online_record','true'),
(1443,'core','online_vocations','false'),
(1444,'core','online_vocations_images','true'),
(1445,'core','online_skulls','true'),
(1446,'core','online_outfit','true'),
(1447,'core','online_afk','false'),
(1448,'core','online_datacenter','Poland - Warsaw'),
(1449,'core','team_style','2'),
(1450,'core','team_status','true'),
(1451,'core','team_lastlogin','true'),
(1452,'core','team_world','false'),
(1453,'core','team_outfit','true'),
(1454,'core','monsters_images_preview','false'),
(1455,'core','monsters_items_url','https://tibia.fandom.com/wiki/'),
(1456,'core','monsters_loot_percentage','true'),
(1457,'core','bans_per_page','20'),
(1458,'core','last_kills_limit','50'),
(1459,'core','experience_table_columns','3'),
(1460,'core','experience_table_rows','200'),
(1461,'core','signature_enabled','true'),
(1462,'core','signature_type','tibian'),
(1463,'core','signature_cache_time','5'),
(1464,'core','signature_browser_cache','60'),
(1465,'core','item_images_url','https://item-images.ots.me/1092/'),
(1466,'core','item_images_extension','.gif'),
(1467,'core','outfit_images_url','https://outfit-images.ots.me/latest/outfit.php'),
(1468,'core','monsters_images_url','images/monsters/'),
(1469,'core','monsters_images_extension','.gif'),
(1470,'core','multiworld','false'),
(1471,'core','status_enabled','true'),
(1472,'core','status_ip','127.0.0.1'),
(1473,'core','status_port','7171'),
(1474,'core','status_timeout','1'),
(1475,'core','status_interval','60'),
(1476,'core','admin_plugins_manage_enable','true'),
(1477,'core','admin_pages_php_enable','false'),
(1478,'core','admin_panel_modules','statistics,web_status,server_status,lastlogin,created,points,coins,balance'),
(1479,'core','gifts_system','true'),
(1480,'core','donate_column','premium_points'),
(1481,'core','account_generate_new_reckey','true'),
(1482,'core','account_generate_new_reckey_price','20'),
(1483,'core','account_change_character_name','true'),
(1484,'core','account_change_character_name_price','30'),
(1485,'core','account_change_character_sex','true'),
(1486,'core','account_change_character_sex_price','30'),
(1487,'core','account_login_ipban_protection','true'),
(1488,'core','account_login_attempts_limit','5'),
(1489,'core','account_login_ban_time','30'),
(1490,'gesior-shop-system','gifts_enabled','true');
/*!40000 ALTER TABLE `myaac_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_shop_history`
--

DROP TABLE IF EXISTS `myaac_shop_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_shop_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `offer_name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `coins_before` int(11) NOT NULL DEFAULT 0,
  `coins_after` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_shop_history`
--

LOCK TABLES `myaac_shop_history` WRITE;
/*!40000 ALTER TABLE `myaac_shop_history` DISABLE KEYS */;
INSERT INTO `myaac_shop_history` VALUES
(1,5,10,2,'Crystal Coin',10,480,470,'2026-05-09 19:29:25','pending'),
(2,5,10,2,'Crystal Coin',10,470,460,'2026-05-09 19:33:43','pending');
/*!40000 ALTER TABLE `myaac_shop_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_shop_offers`
--

DROP TABLE IF EXISTS `myaac_shop_offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_shop_offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 1,
  `itemid` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=item,1=premium,2=coins',
  `image` varchar(255) DEFAULT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `category` varchar(100) DEFAULT 'General',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_shop_offers`
--

LOCK TABLES `myaac_shop_offers` WRITE;
/*!40000 ALTER TABLE `myaac_shop_offers` DISABLE KEYS */;
INSERT INTO `myaac_shop_offers` VALUES
(1,'30 dias Premium','Adiciona 30 dias de conta premium',100,30,0,1,NULL,0,'Premium'),
(2,'Crystal Coin','Crystal Coin para seu personagem',10,1,2160,0,NULL,0,'Items'),
(3,'Demon Helmet','Elmo do Demonio',50,1,2497,0,NULL,0,'Items');
/*!40000 ALTER TABLE `myaac_shop_offers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_spells`
--

DROP TABLE IF EXISTS `myaac_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_spells` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `spell` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `words` varchar(255) NOT NULL DEFAULT '',
  `category` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 - attack, 2 - healing, 3 - summon, 4 - supply, 5 - support',
  `type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '1 - instant, 2 - conjure, 3 - rune',
  `level` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `soul` tinyint(4) NOT NULL DEFAULT 0,
  `conjure_id` int(11) NOT NULL DEFAULT 0,
  `conjure_count` tinyint(4) NOT NULL DEFAULT 0,
  `reagent` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `premium` tinyint(4) NOT NULL DEFAULT 0,
  `vocations` varchar(100) NOT NULL DEFAULT '',
  `hide` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_spells`
--

LOCK TABLES `myaac_spells` WRITE;
/*!40000 ALTER TABLE `myaac_spells` DISABLE KEYS */;
INSERT INTO `myaac_spells` VALUES
(1,'','Annihilation','exori gran ico',0,1,0,0,300,0,0,0,0,0,0,'[4,8]',0),
(2,'','Apprentice\'s Strike','exori min flam',0,1,0,0,6,0,0,0,0,0,0,'[1,2,5,6]',0),
(3,'','Berserk','exori',0,1,0,0,115,0,0,0,0,0,0,'[4,8]',0),
(4,'','Brutal Strike','exori ico',0,1,0,0,30,0,0,0,0,0,0,'[4,8]',0),
(5,'','Buzz','exori infir vis',0,1,0,0,6,0,0,0,0,0,0,'[1,5]',0),
(6,'','Chill Out','exevo infir frigo hur',0,1,0,0,8,0,0,0,0,0,0,'[2,6]',0),
(7,'','Curse','utori mort',0,1,0,0,30,0,0,0,0,0,0,'[1,5]',0),
(8,'','Death Strike','exori mort',0,1,0,0,20,0,0,0,0,0,0,'[1,5]',0),
(9,'','Divine Caldera','exevo mas san',0,1,0,0,160,0,0,0,0,0,0,'[3,7]',0),
(10,'','Divine Missile','exori san',0,1,0,0,20,0,0,0,0,0,0,'[3,7]',0),
(11,'','Electrify','utori vis',0,1,0,0,30,0,0,0,0,0,0,'[1,5]',0),
(12,'','Energy Beam','exevo vis lux',0,1,0,0,40,0,0,0,0,0,0,'[1,5]',0),
(13,'','Energy Strike','exori vis',0,1,0,0,20,0,0,0,0,0,0,'[1,2,5,6]',0),
(14,'','Energy Wave','exevo vis hur',0,1,0,0,170,0,0,0,0,0,0,'[1,5]',0),
(15,'','Envenom','utori pox',0,1,0,0,30,0,0,0,0,0,0,'[2,6]',0),
(16,'','Eternal Winter','exevo gran mas frigo',0,1,0,0,1050,0,0,0,0,0,0,'[2,6]',0),
(17,'','Ethereal Spear','exori con',0,1,0,0,25,0,0,0,0,0,0,'[3,7]',0),
(18,'','Fierce Berserk','exori gran',0,1,0,0,340,0,0,0,0,0,0,'[4,8]',0),
(19,'','Fire Wave','exevo flam hur',0,1,0,0,25,0,0,0,0,0,0,'[1,5]',0),
(20,'','Flame Strike','exori flam',0,1,0,0,20,0,0,0,0,0,0,'[1,2,5,6]',0),
(21,'','Front Sweep','exori min',0,1,0,0,200,0,0,0,0,0,0,'[4,8]',0),
(22,'','Great Energy Beam','exevo gran vis lux',0,1,0,0,110,0,0,0,0,0,0,'[1,5]',0),
(23,'','Groundshaker','exori mas',0,1,0,0,160,0,0,0,0,0,0,'[4,8]',0),
(24,'','Hell\'s Core','exevo gran mas flam',0,1,0,0,1100,0,0,0,0,0,0,'[1,5]',0),
(25,'','Holy Flash','utori san',0,1,0,0,30,0,0,0,0,0,0,'[3,7]',0),
(26,'','Ice Strike','exori frigo',0,1,0,0,20,0,0,0,0,0,0,'[1,5,2,6]',0),
(27,'','Ice Wave','exevo frigo hur',0,1,0,0,25,0,0,0,0,0,0,'[2,6]',0),
(28,'','Ignite','utori flam',0,1,0,0,30,0,0,0,0,0,0,'[1,5]',0),
(29,'','Inflict Wound','utori kor',0,1,0,0,30,0,0,0,0,0,0,'[4,8]',0),
(30,'','Lightning','exori amp vis',0,1,0,0,60,0,0,0,0,0,0,'[1,5]',0),
(31,'','Mud Attack','exori infir tera',0,1,0,0,6,0,0,0,0,0,0,'[2,6]',0),
(32,'','Physical Strike','exori moe ico',0,1,0,0,20,0,0,0,0,0,0,'[2,6]',0),
(33,'','Practice Fire Wave','exevo dis flam hur',0,1,0,0,5,0,0,0,0,0,0,'[0]',0),
(34,'','Rage of the Skies','exevo gran mas vis',0,1,0,0,600,0,0,0,0,0,0,'[1,5]',0),
(35,'','Scorch','exevo infir flam hur',0,1,0,0,8,0,0,0,0,0,0,'[1,5]',0),
(36,'','Strong Energy Strike','exori gran vis',0,1,0,0,60,0,0,0,0,0,0,'[1,5]',0),
(37,'','Strong Ethereal Spear','exori gran con',0,1,0,0,55,0,0,0,0,0,0,'[3,7]',0),
(38,'','Strong Ice Strike','exori gran frigo',0,1,0,0,60,0,0,0,0,0,0,'[2,6]',0),
(39,'','Strong Ice Wave','exevo gran frigo hur',0,1,0,0,170,0,0,0,0,0,0,'[2,6]',0),
(40,'','Strong Terra Strike','exori gran tera',0,1,0,0,60,0,0,0,0,0,0,'[2,6]',0),
(41,'','Terra Strike','exori tera',0,1,0,0,20,0,0,0,0,0,0,'[1,5,2,6]',0),
(42,'','Terra Wave','exevo tera hur',0,1,0,0,210,0,0,0,0,0,0,'[2,6]',0),
(43,'','Ultimate Energy Strike','exori max vis',0,1,0,0,100,0,0,0,0,0,0,'[1,5]',0),
(44,'','Ultimate Flame Strike','exori max flam',0,1,0,0,100,0,0,0,0,0,0,'[1,5]',0),
(45,'','Ultimate Ice Strike','exori max frigo',0,1,0,0,100,0,0,0,0,0,0,'[2,6]',0),
(46,'','Ultimate Terra Strike','exori max tera',0,1,0,0,100,0,0,0,0,0,0,'[2,6]',0),
(47,'','Whirlwind Throw','exori hur',0,1,0,0,40,0,0,0,0,0,0,'[4,8]',0),
(48,'','Wrath of Nature','exevo gran mas tera',0,1,0,0,700,0,0,0,0,0,0,'[2,6]',0),
(49,'','Bruise Bane','exura infir ico',0,1,0,0,10,0,0,0,0,0,0,'[4,8]',0),
(50,'','Cure Bleeding','exana kor',0,1,0,0,30,0,0,0,0,0,0,'[2,4,6,8]',0),
(51,'','Cure Burning','exana flam',0,1,0,0,30,0,0,0,0,0,0,'[2,6]',0),
(52,'','Cure Curse','exana mort',0,1,0,0,40,0,0,0,0,0,0,'[3,7]',0),
(53,'','Cure Electrification','exana vis',0,1,0,0,30,0,0,0,0,0,0,'[2,6]',0),
(54,'','Cure Poison','exana pox',0,1,0,0,30,0,0,0,0,0,0,'[1,2,3,4,5,6,7,8]',0),
(55,'','Divine Healing','exura san',0,1,0,0,160,0,0,0,0,0,0,'[3,7]',0),
(56,'','Heal Friend','exura sio',0,1,0,0,140,0,0,0,0,0,0,'[2,6]',0),
(57,'','Intense Healing','exura gran',0,1,0,0,70,0,0,0,0,0,0,'[1,2,3,5,6,7]',0),
(58,'','Intense Recovery','utura gran',0,1,0,0,165,0,0,0,0,0,0,'[3,4,7,8]',0),
(59,'','Intense Wound Cleansing','exura gran ico',0,1,0,0,200,0,0,0,0,0,0,'[4,8]',0),
(60,'','Light Healing','exura',0,1,0,0,20,0,0,0,0,0,0,'[1,2,3,5,6,7]',0),
(61,'','Magic Patch','exura infir',0,1,0,0,6,0,0,0,0,0,0,'[1,2,3,5,6,7]',0),
(62,'','Mass Healing','exura gran mas res',0,1,0,0,150,0,0,0,0,0,0,'[2,6]',0),
(63,'','Practice Healing','exura dis',0,1,0,0,5,0,0,0,0,0,0,'[0]',0),
(64,'','Recovery','utura',0,1,0,0,75,0,0,0,0,0,0,'[3,4,7,8]',0),
(65,'','Salvation','exura gran san',0,1,0,0,210,0,0,0,0,0,0,'[3,7]',0),
(66,'','Ultimate Healing','exura vita',0,1,0,0,160,0,0,0,0,0,0,'[1,2,5,6]',0),
(67,'','Wound Cleansing','exura ico',0,1,0,0,40,0,0,0,0,0,0,'[4,8]',0),
(68,'','Blood Rage','utito tempo',0,1,0,0,290,0,0,0,0,0,0,'[4,8]',0),
(69,'','Cancel Invisibility','exana ina',0,1,0,0,200,0,0,0,0,0,0,'[3,7]',0),
(70,'','Challenge','exeta res',0,1,0,0,30,0,0,0,0,0,0,'[8]',0),
(71,'','Charge','utani tempo hur',0,1,0,0,100,0,0,0,0,0,0,'[4,8]',0),
(72,'','Creature Illusion','utevo res ina',0,1,0,0,100,0,0,0,0,0,0,'[1,2,5,6]',0),
(73,'','Find Person','exiva',0,1,0,0,20,0,0,0,0,0,0,'[1,2,3,4,5,6,7,8]',0),
(74,'','Food','exevo pan',0,1,0,0,120,1,0,0,0,0,0,'[2,6]',0),
(75,'','Great Light','utevo gran lux',0,1,0,0,60,0,0,0,0,0,0,'[1,2,3,4,5,6,7,8]',0),
(76,'','Haste','utani hur',0,1,0,0,60,0,0,0,0,0,0,'[1,2,3,4,5,6,7,8]',0),
(77,'','Invisibility','utana vid',0,1,0,0,440,0,0,0,0,0,0,'[1,2,5,6]',0),
(78,'','Levitate','exani hur',0,1,0,0,50,0,0,0,0,0,0,'[1,2,3,4,5,6,7,8]',0),
(79,'','Light','utevo lux',0,1,0,0,20,0,0,0,0,0,0,'[1,2,3,4,5,6,7,8]',0),
(80,'','Magic Rope','exani tera',0,1,0,0,20,0,0,0,0,0,0,'[1,2,3,4,5,6,7,8]',0),
(81,'','Magic Shield','utamo vita',0,1,0,0,50,0,0,0,0,0,0,'[1,2,5,6]',0),
(82,'','Protector','utamo tempo',0,1,0,0,200,0,0,0,0,0,0,'[4,8]',0),
(83,'','Sharpshooter','utito tempo san',0,1,0,0,450,0,0,0,0,0,0,'[3,7]',0),
(84,'','Strong Haste','utani gran hur',0,1,0,0,100,0,0,0,0,0,0,'[1,2,5,6]',0),
(85,'','Summon Creature','utevo res',0,1,0,0,0,0,0,0,0,0,0,'[1,2,5,6]',0),
(86,'','Swift Foot','utamo tempo san',0,1,0,0,400,0,0,0,0,0,0,'[3,7]',0),
(87,'','Ultimate Light','utevo vis lux',0,1,0,0,140,0,0,0,0,0,0,'[1,2,5,6]',0),
(88,'','Enchant Party','utori mas sio',0,1,0,0,0,0,0,0,0,0,0,'[1,5]',0),
(89,'','Heal Party','utura mas sio',0,1,0,0,0,0,0,0,0,0,0,'[2,6]',0),
(90,'','Protect Party','utamo mas sio',0,1,0,0,0,0,0,0,0,0,0,'[3,7]',0),
(91,'','Train Party','utito mas sio',0,1,0,0,0,0,0,0,0,0,0,'[4,8]',0),
(92,'','Animate Dead Rune','adana mort',0,1,0,0,600,5,0,0,0,0,0,'[1,2,5,6]',0),
(93,'','Arrow Call','exevo infir con',0,1,0,0,10,1,0,0,0,0,0,'[3,7]',0),
(94,'','Avalanche Rune','adori mas frigo',0,1,0,0,530,3,0,0,0,0,0,'[2,6]',0),
(95,'','Blank Rune','adori blank',0,1,0,0,50,1,0,0,0,0,0,'[2,6,3,7,1,5]',0),
(96,'','Chameleon Rune','adevo ina',0,1,0,0,600,2,0,0,0,0,0,'[2,6]',0),
(97,'','Conjure Arrow','exevo con',0,1,0,0,100,1,0,0,0,0,0,'[3,7]',0),
(98,'','Conjure Bolt','exevo con mort',0,1,0,0,140,2,0,0,0,0,0,'[3,7]',0),
(99,'','Conjure Explosive Arrow','exevo con flam',0,1,0,0,290,3,0,0,0,0,0,'[3,7]',0),
(100,'','Conjure Piercing Bolt','exevo con grav',0,1,0,0,180,3,0,0,0,0,0,'[3,7]',0),
(101,'','Conjure Poisoned Arrow','exevo con pox',0,1,0,0,130,2,0,0,0,0,0,'[3,7]',0),
(102,'','Conjure Power Bolt','exevo con vis',0,1,0,0,700,4,0,0,0,0,0,'[7]',0),
(103,'','Conjure Sniper Arrow','exevo con hur',0,1,0,0,160,3,0,0,0,0,0,'[3,7]',0),
(104,'','Convince Creature Rune','adeta sio',0,1,0,0,200,3,0,0,0,0,0,'[2,6]',0),
(105,'','Cure Poison Rune','adana pox',0,1,0,0,200,1,0,0,0,0,0,'[2,6]',0),
(106,'','Destroy Field Rune','adito grav',0,1,0,0,120,2,0,0,0,0,0,'[1,2,3,5,6,7]',0),
(107,'','Disintegrate Rune','adito tera',0,1,0,0,200,3,0,0,0,0,0,'[1,2,3,5,6,7]',0),
(108,'','Enchant Spear','exeta con',0,1,0,0,350,3,0,0,0,0,0,'[3,7]',0),
(109,'','Enchant Staff','exeta vis',0,1,0,0,80,0,0,0,0,0,0,'[5]',0),
(110,'','Energy Bomb Rune','adevo mas vis',0,1,0,0,880,5,0,0,0,0,0,'[1,5]',0),
(111,'','Energy Field Rune','adevo grav vis',0,1,0,0,320,2,0,0,0,0,0,'[1,2,5,6]',0),
(112,'','Energy Wall Rune','adevo mas grav vis',0,1,0,0,1000,5,0,0,0,0,0,'[1,2,5,6]',0),
(113,'','Explosion Rune','adevo mas hur',0,1,0,0,570,4,0,0,0,0,0,'[1,2,5,6]',0),
(114,'','Fire Field Rune','adevo grav flam',0,1,0,0,240,1,0,0,0,0,0,'[1,2,5,6]',0),
(115,'','Fire Bomb Rune','adevo mas flam',0,1,0,0,600,4,0,0,0,0,0,'[1,2,5,6]',0),
(116,'','Fire Wall Rune','adevo mas grav flam',0,1,0,0,780,4,0,0,0,0,0,'[1,2,5,6]',0),
(117,'','Fireball Rune','adori flam',0,1,0,0,460,3,0,0,0,0,0,'[1,5]',0),
(118,'','Great Fireball Rune','adori mas flam',0,1,0,0,530,3,0,0,0,0,0,'[1,5]',0),
(119,'','Heavy Magic Missile Rune','adori vis',0,1,0,0,350,2,0,0,0,0,0,'[1,5,2,6]',0),
(120,'','Holy Missile Rune','adori san',0,1,0,0,300,3,0,0,0,0,0,'[3,7]',0),
(121,'','Icicle Rune','adori frigo',0,1,0,0,460,3,0,0,0,0,0,'[2,6]',0),
(122,'','Intense Healing Rune','adura gran',0,1,0,0,120,2,0,0,0,0,0,'[2,6]',0),
(123,'','Light Magic Missile Rune','adori min vis',0,1,0,0,120,1,0,0,0,0,0,'[1,2,5,6]',0),
(124,'','Light Stone Shower Rune','adori infir mas tera',0,1,0,0,6,3,0,0,0,0,0,'[1,2,3,5,6,7]',0),
(125,'','Lightest Missile Rune','adori infir vis',0,1,0,0,6,0,0,0,0,0,0,'[1,2,3,5,6,7]',0),
(126,'','Magic Wall Rune','adevo grav tera',0,1,0,0,750,5,0,0,0,0,0,'[1,5]',0),
(127,'','Paralyze Rune','adana ani',0,1,0,0,1400,3,0,0,0,0,0,'[2,6]',0),
(128,'','Poison Bomb Rune','adevo mas pox',0,1,0,0,520,2,0,0,0,0,0,'[2,6]',0),
(129,'','Poison Field Rune','adevo grav pox',0,1,0,0,200,1,0,0,0,0,0,'[1,2,5,6]',0),
(130,'','Poison Wall Rune','adevo mas grav pox',0,1,0,0,640,3,0,0,0,0,0,'[1,2,5,6]',0),
(131,'','Practice Magic Missile Rune','adori dis min vis',0,1,0,0,5,0,0,0,0,0,0,'[0]',0),
(132,'','Soulfire Rune','adevo res flam',0,1,0,0,420,3,0,0,0,0,0,'[1,2,5,6]',0),
(133,'','Stalagmite Rune','adori tera',0,1,0,0,350,2,0,0,0,0,0,'[1,5,2,6]',0),
(134,'','Stone Shower Rune','adori mas tera',0,1,0,0,430,3,0,0,0,0,0,'[2,6]',0),
(135,'','Sudden Death Rune','adori gran mort',0,1,0,0,985,5,0,0,0,0,0,'[1,5]',0),
(136,'','Thunderstorm Rune','adori mas vis',0,1,0,0,430,3,0,0,0,0,0,'[1,5]',0),
(137,'','Ultimate Healing Rune','adura vita',0,1,0,0,400,3,0,0,0,0,0,'[2,6]',0),
(138,'','Wild Growth Rune','adevo grav vita',0,1,0,0,600,5,0,0,0,0,0,'[2,6]',0),
(139,'','Edit Door','aleta grav',0,1,0,0,0,0,0,0,0,0,0,'[]',0),
(140,'','Invite Guests','aleta sio',0,1,0,0,0,0,0,0,0,0,0,'[]',0),
(141,'','Kick Guest','alana sio',0,1,0,0,0,0,0,0,0,0,0,'[]',0),
(142,'','Invite Subowners','aleta som',0,1,0,0,0,0,0,0,0,0,0,'[]',0),
(143,'','Exevo Frozen Hur','exevo frozen hur',0,1,2000,0,500,0,0,0,0,0,0,'[1,2,6,5]',0),
(144,'','Exevo Gran Solar','exevo gran solar',0,1,2000,0,500,0,0,0,0,0,0,'[3,7]',0),
(145,'','Exori Gran Flam','exori gran flam',0,1,2000,0,500,0,0,0,0,0,0,'[null,8]',0),
(146,'','Avalanche Rune Rune','',0,3,0,0,0,0,0,0,0,2274,0,'[]',0),
(147,'','Energy Bomb Rune Rune','',0,3,0,0,0,0,0,0,0,2262,0,'[]',0),
(148,'','Energy Field Rune Rune','',0,3,0,0,0,0,0,0,0,2277,0,'[]',0),
(149,'','Energy Wall Rune Rune','',0,3,0,0,0,0,0,0,0,2279,0,'[]',0),
(150,'','Explosion Rune Rune','',0,3,0,0,0,0,0,0,0,2313,0,'[]',0),
(151,'','Fire Bomb Rune Rune','',0,3,0,0,0,0,0,0,0,2305,0,'[]',0),
(152,'','Fire Field Rune Rune','',0,3,0,0,0,0,0,0,0,2301,0,'[]',0),
(153,'','Fire Wall Rune Rune','',0,3,0,0,0,0,0,0,0,2303,0,'[]',0),
(154,'','Fireball Rune Rune','',0,3,0,0,0,0,0,0,0,2302,0,'[]',0),
(155,'','Great Fireball Rune Rune','',0,3,0,0,0,0,0,0,0,2304,0,'[]',0),
(156,'','Heavy Magic Missile Rune Rune','',0,3,0,0,0,0,0,0,0,2311,0,'[]',0),
(157,'','Holy Missile Rune Rune','',0,3,0,0,0,0,0,0,0,2295,0,'[3,7]',0),
(158,'','Icicle Rune Rune','',0,3,0,0,0,0,0,0,0,2271,0,'[]',0),
(159,'','Light Magic Missile Rune Rune','',0,3,0,0,0,0,0,0,0,2287,0,'[]',0),
(160,'','Light Stone Shower Rune Rune','',0,3,0,0,0,0,0,0,0,23722,0,'[]',0),
(161,'','Lightest Magic Missile Rune Rune','',0,3,0,0,0,0,0,0,0,19392,0,'[]',0),
(162,'','Lightest Missile Rune Rune','',0,3,0,0,0,0,0,0,0,23723,0,'[]',0),
(163,'','Magic Wall Rune Rune','',0,3,0,0,0,0,0,0,0,2293,0,'[]',0),
(164,'','Poison Bomb Rune Rune','',0,3,0,0,0,0,0,0,0,2286,0,'[]',0),
(165,'','Poison Field Rune Rune','',0,3,0,0,0,0,0,0,0,2285,0,'[]',0),
(166,'','Poison Wall Rune Rune','',0,3,0,0,0,0,0,0,0,2289,0,'[]',0),
(167,'','Soulfire Rune Rune','',0,3,0,0,0,0,0,0,0,2308,0,'[]',0),
(168,'','Stalagmite Rune Rune','',0,3,0,0,0,0,0,0,0,2292,0,'[]',0),
(169,'','Stone Shower Rune Rune','',0,3,0,0,0,0,0,0,0,2288,0,'[]',0),
(170,'','Sudden Death Rune Rune','',0,3,0,0,0,0,0,0,0,2268,0,'[]',0),
(171,'','Mega Sudden Death Rune Rune','',0,3,0,0,0,0,0,0,0,2263,0,'[]',0),
(172,'','Thunderstorm Rune Rune','',0,3,0,0,0,0,0,0,0,2315,0,'[]',0),
(173,'','Paralyze Rune Rune','',0,3,0,0,1400,0,0,0,0,2278,0,'[2,6]',0),
(174,'','Wild Growth Rune Rune','',0,3,0,0,0,0,0,0,0,2269,0,'[2,6]',0),
(175,'','Cure Poison Rune Rune','',0,3,0,0,0,0,0,0,0,2266,0,'[]',0),
(176,'','Intense Healing Rune Rune','',0,3,0,0,0,0,0,0,0,2265,0,'[]',0),
(177,'','Ultimate Healing Rune Rune','',0,3,0,0,0,0,0,0,0,2273,0,'[]',0),
(178,'','Animate Dead Rune Rune','',0,3,0,0,0,0,0,0,0,2316,0,'[]',0),
(179,'','Convince Creature Rune Rune','',0,3,0,0,0,0,0,0,0,2290,0,'[]',0),
(180,'','Chameleon Rune Rune','',0,3,0,0,0,0,0,0,0,2291,0,'[]',0),
(181,'','Disintegrate Rune Rune','',0,3,0,0,0,0,0,0,0,2310,0,'[]',0),
(182,'','Destroy Field Rune Rune','',0,3,0,0,0,0,0,0,0,2261,0,'[]',0);
/*!40000 ALTER TABLE `myaac_spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_visitors`
--

DROP TABLE IF EXISTS `myaac_visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_visitors` (
  `ip` varchar(45) NOT NULL,
  `lastvisit` int(11) NOT NULL DEFAULT 0,
  `page` varchar(2048) NOT NULL,
  `user_agent` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_visitors`
--

LOCK TABLES `myaac_visitors` WRITE;
/*!40000 ALTER TABLE `myaac_visitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `myaac_visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myaac_weapons`
--

DROP TABLE IF EXISTS `myaac_weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `myaac_weapons` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `vocations` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myaac_weapons`
--

LOCK TABLES `myaac_weapons` WRITE;
/*!40000 ALTER TABLE `myaac_weapons` DISABLE KEYS */;
INSERT INTO `myaac_weapons` VALUES
(1294,0,0,'[]'),
(2111,0,0,'[]'),
(2181,26,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(2182,7,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(2183,33,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(2185,19,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(2186,13,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(2187,33,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(2188,19,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(2189,26,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(2190,7,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(2191,13,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(2377,20,0,'{\"4\":true}'),
(2378,0,0,'{\"4\":true}'),
(2381,25,0,'[]'),
(2387,25,0,'{\"4\":true}'),
(2389,0,0,'[]'),
(2390,140,0,'{\"4\":true}'),
(2391,50,0,'{\"4\":true}'),
(2392,30,0,'[]'),
(2393,55,0,'{\"4\":true}'),
(2396,0,0,'[]'),
(2399,0,0,'[]'),
(2400,80,0,'[]'),
(2407,30,0,'[]'),
(2408,120,0,'{\"4\":true}'),
(2410,0,0,'[]'),
(2413,0,0,'{\"4\":true}'),
(2414,60,0,'[]'),
(2415,95,0,'{\"4\":true}'),
(2421,85,0,'[]'),
(2423,20,0,'[]'),
(2424,45,0,'[]'),
(2425,20,0,'[]'),
(2426,25,0,'[]'),
(2427,55,0,'[]'),
(2429,20,0,'[]'),
(2430,25,0,'[]'),
(2431,90,0,'[]'),
(2432,35,0,'[]'),
(2434,25,0,'[]'),
(2435,20,0,'[]'),
(2436,30,0,'[]'),
(2438,30,0,'[]'),
(2440,25,0,'{\"4\":true}'),
(2443,70,0,'{\"4\":true}'),
(2444,65,0,'{\"4\":true}'),
(2445,35,0,'[]'),
(2446,45,0,'[]'),
(2447,50,0,'{\"4\":true}'),
(2451,35,0,'[]'),
(2452,70,0,'{\"4\":true}'),
(2453,30,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(2454,65,0,'{\"4\":true}'),
(2543,0,0,'[]'),
(2544,0,0,'[]'),
(2545,0,0,'[]'),
(2546,0,0,'[]'),
(2547,55,0,'[]'),
(3961,40,0,'[]'),
(3962,30,0,'[]'),
(3965,20,0,'[]'),
(5803,75,0,'{\"3\":true}'),
(6528,75,0,'{\"4\":true}'),
(6529,110,0,'[]'),
(6553,75,0,'{\"4\":true}'),
(7363,30,0,'[]'),
(7364,20,0,'[]'),
(7365,40,0,'[]'),
(7366,8,0,'{\"3\":true}'),
(7367,100,0,'{\"3\":true}'),
(7368,8,0,'{\"3\":true}'),
(7378,25,0,'[]'),
(7379,25,0,'[]'),
(7380,35,0,'{\"4\":true}'),
(7381,20,0,'[]'),
(7382,60,0,'{\"4\":true}'),
(7383,50,0,'[]'),
(7384,60,0,'[]'),
(7385,20,0,'[]'),
(7386,40,0,'{\"4\":true}'),
(7387,25,0,'[]'),
(7388,55,0,'[]'),
(7389,60,0,'[]'),
(7390,75,0,'[]'),
(7391,50,0,'{\"4\":true}'),
(7392,35,0,'[]'),
(7402,45,0,'{\"4\":true}'),
(7403,65,0,'{\"4\":true}'),
(7404,40,0,'[]'),
(7405,70,0,'{\"4\":true}'),
(7406,35,0,'{\"4\":true}'),
(7407,30,0,'{\"4\":true}'),
(7408,25,0,'[]'),
(7409,50,0,'[]'),
(7410,55,0,'[]'),
(7411,50,0,'[]'),
(7412,45,0,'[]'),
(7413,40,0,'{\"4\":true}'),
(7414,60,0,'{\"4\":true}'),
(7415,60,0,'[]'),
(7416,55,0,'[]'),
(7417,65,0,'[]'),
(7418,70,0,'[]'),
(7419,40,0,'[]'),
(7420,70,0,'[]'),
(7421,65,0,'[]'),
(7422,75,0,'[]'),
(7423,85,0,'{\"4\":true}'),
(7424,100,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(7425,20,0,'[]'),
(7426,40,0,'[]'),
(7427,45,0,'[]'),
(7428,55,0,'{\"4\":true}'),
(7429,75,0,'[]'),
(7430,30,0,'[]'),
(7431,80,0,'[]'),
(7432,20,0,'[]'),
(7433,65,0,'[]'),
(7434,75,0,'[]'),
(7435,85,0,'[]'),
(7436,45,0,'{\"4\":true}'),
(7437,30,0,'[]'),
(7449,25,0,'{\"4\":true}'),
(7450,120,0,'{\"4\":true}'),
(7451,35,0,'[]'),
(7452,30,0,'{\"4\":true}'),
(7453,85,0,'{\"4\":true}'),
(7454,30,0,'{\"4\":true}'),
(7455,80,0,'[]'),
(7456,35,0,'[]'),
(7744,0,0,'[]'),
(7745,50,0,'[]'),
(7746,60,0,'[]'),
(7747,35,0,'{\"4\":true}'),
(7748,45,0,'{\"4\":true}'),
(7749,20,0,'[]'),
(7750,25,0,'[]'),
(7751,60,0,'[]'),
(7752,35,0,'{\"4\":true}'),
(7753,65,0,'{\"4\":true}'),
(7754,20,0,'[]'),
(7755,35,0,'[]'),
(7756,60,0,'[]'),
(7757,35,0,'[]'),
(7758,50,0,'{\"4\":true}'),
(7763,0,0,'[]'),
(7764,50,0,'[]'),
(7765,60,0,'[]'),
(7766,35,0,'{\"4\":true}'),
(7767,45,0,'{\"4\":true}'),
(7768,20,0,'[]'),
(7769,25,0,'[]'),
(7770,60,0,'[]'),
(7771,35,0,'{\"4\":true}'),
(7772,65,0,'{\"4\":true}'),
(7773,20,0,'[]'),
(7774,35,0,'[]'),
(7775,60,0,'[]'),
(7776,35,0,'[]'),
(7777,50,0,'{\"4\":true}'),
(7838,20,0,'[]'),
(7839,20,0,'[]'),
(7840,20,0,'[]'),
(7850,20,0,'[]'),
(7854,0,0,'[]'),
(7855,50,0,'[]'),
(7856,60,0,'[]'),
(7857,35,0,'{\"4\":true}'),
(7858,45,0,'{\"4\":true}'),
(7859,20,0,'[]'),
(7860,25,0,'[]'),
(7861,60,0,'[]'),
(7862,35,0,'{\"4\":true}'),
(7863,65,0,'{\"4\":true}'),
(7864,20,0,'[]'),
(7865,35,0,'[]'),
(7866,60,0,'[]'),
(7867,35,0,'[]'),
(7868,50,0,'{\"4\":true}'),
(7869,0,0,'[]'),
(7870,50,0,'[]'),
(7871,60,0,'[]'),
(7872,35,0,'{\"4\":true}'),
(7873,45,0,'{\"4\":true}'),
(7874,20,0,'[]'),
(7875,25,0,'[]'),
(7876,60,0,'[]'),
(7877,35,0,'{\"4\":true}'),
(7878,65,0,'{\"4\":true}'),
(7879,20,0,'[]'),
(7880,35,0,'[]'),
(7881,60,0,'[]'),
(7882,35,0,'[]'),
(7883,50,0,'{\"4\":true}'),
(8849,45,0,'{\"3\":true}'),
(8850,60,0,'{\"3\":true}'),
(8851,130,0,'{\"3\":true}'),
(8852,100,0,'{\"3\":true}'),
(8853,80,0,'{\"3\":true}'),
(8854,80,0,'{\"3\":true}'),
(8855,50,0,'{\"3\":true}'),
(8856,60,0,'{\"3\":true}'),
(8857,40,0,'{\"3\":true}'),
(8858,70,0,'{\"3\":true}'),
(8910,42,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(8911,22,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(8912,37,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(8920,37,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(8921,22,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(8922,42,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}'),
(8924,110,0,'[]'),
(8925,130,0,'[]'),
(8926,120,0,'{\"4\":true}'),
(8927,120,0,'[]'),
(8928,100,0,'[]'),
(8929,100,0,'{\"4\":true}'),
(8930,100,0,'[]'),
(8931,120,0,'[]'),
(8932,100,0,'{\"4\":true}'),
(11305,60,0,'[]'),
(11306,50,0,'{\"4\":true}'),
(11307,55,0,'[]'),
(11308,55,0,'{\"4\":true}'),
(11309,20,0,'{\"4\":true}'),
(11323,25,0,'[]'),
(12318,8,0,'{\"2\":true,\"6\":true,\"1\":true,\"5\":true}');
/*!40000 ALTER TABLE `myaac_weapons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_autolootconfig`
--

DROP TABLE IF EXISTS `player_autolootconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_autolootconfig` (
  `player_id` int(11) NOT NULL,
  `config` blob NOT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_autolootconfig`
--

LOCK TABLES `player_autolootconfig` WRITE;
/*!40000 ALTER TABLE `player_autolootconfig` DISABLE KEYS */;
INSERT INTO `player_autolootconfig` VALUES
(1,'\0\0\0\0\0\0'),
(2,'\0\0\0\0\0\0'),
(3,'\0\0\0\0\0'),
(4,'\0\0\0\0\0\0'),
(7,'\0\0\0\0\0\0'),
(9,'\0\0\0\0\0\0'),
(10,'\0\0\0\0\0'),
(11,'\0\0\0\0\0\0'),
(12,'\0\0\0\0\0\0'),
(13,'\0\0\0\0\0\0'),
(14,'\0\0\0\0\0\0'),
(15,'\0\0\0\0\0\0'),
(16,'\0\0\0\0\0\0'),
(17,'\0\0\0\0\0\0'),
(18,'\0\0\0\0\0\0'),
(19,'\0\0\0\0\0\0'),
(20,'\0\0\0\0\0\0'),
(21,'\0\0\0\0\0\0'),
(22,'\0\0\0\0\0\0'),
(23,'\0\0\0\0\0\0'),
(24,'\0\0\0\0\0\0'),
(25,'\0\0\0\0\0\0'),
(26,'\0\0\0\0\0\0'),
(27,'\0®	\0\0“	\0\0#\0mastermind shield\nmagic plate armor\0'),
(28,'\0\0\0\0\0\0'),
(31,'\0\0\0\0\0'),
(32,'\0\0\0\0\0'),
(33,'\0\0\0\0\0\0'),
(34,'\0\0\0\0\0\0'),
(35,'\0\0\0\0\0\0'),
(37,'\0\0\0\0\0\0'),
(41,'\0\0\0\0\0\0'),
(44,'\0\0\0\0\0\0'),
(45,'\0\0\0\0\0'),
(48,'\0\0\0\0\0\0'),
(49,'\0\0\0\0\0\0'),
(50,'\0\0\0\0\0\0'),
(54,'\0\0\0\0\0\0'),
(55,'\0\0\0\0\0\0'),
(56,'\0\0\0\0\0'),
(57,'\0\0\0\0\0\0'),
(58,'\0\0\0\0\0\0'),
(59,'\0\0\0\0\0\0'),
(60,'\0\0\0\0\0\0'),
(61,'\0“	\0\0\0mastermind shield\0'),
(62,'\0®	\0\0“	\0\0ÿ	\0\0⁄	\0\0>\0magic plate armor\nmastermind shield\ndemon shield\ngreat shield\n\0'),
(64,'\0\0\0\0\0'),
(65,'\0\0\0\0\0\0'),
(67,'\0\0\0\0\0'),
(68,'\0\0\0\0\0\0'),
(69,'\0®	\0\0“	\0\0$\0mastermind shield\nmagic plate armor \0'),
(71,'\0\0\0\0\0'),
(72,'\0\0\0\0\0\0'),
(73,'\0®	\0\0“	\0\0#\0magic plate armor\nmastermind shield\0'),
(74,'\0\0\0\0\0\0'),
(75,'\0®	\0\0“	\0\0#\0mastermind shield\nmagic plate armor\0'),
(76,'\0®	\0\0“	\0\0$\0magic plate armor\nmastermind shield\n\0'),
(77,'\0\0\0\0\0'),
(78,'\0\0\0\0\0'),
(79,'\0\0\0\0\0\0'),
(80,'\0\0\0\0\0\0'),
(81,'\0\0\0\0\0\0'),
(82,'\0\0\0\0\0'),
(83,'\0\0\0\0\0\0'),
(84,'\0®	\0\0“	\0\0#\0mastermind shield\nmagic plate armor\0\0'),
(85,'\0®	\0\0“	\0\0#\0mastermind shield\nmagic plate armor\0\0'),
(86,'\0\0\0\0\0\0'),
(88,'\0\0\0\0\0\0'),
(89,'\0\0\0\0\0\0'),
(90,'\0\0\0\0\0\0'),
(91,'\0\0\0\0\0\0'),
(92,'\0\0\0\0\0\0'),
(94,'\0\0\0\0\0\0'),
(95,'\0\0\0\0\0\0'),
(96,'\0\0\0\0\0\0'),
(97,'\0\0\0\0\0\0'),
(98,'\0\0\0\0\0\0'),
(100,'\0\0\0\0\0\0'),
(101,'\0\0\0\0\0\0'),
(104,'\0\0\0\0\0\0'),
(105,'\0\0\0\0\0\0'),
(106,'\0\0\0\0\0\0'),
(107,'\0\0\0\0\0\0'),
(109,'\0\0\0\0\0\0'),
(110,'\0®	\0\0“	\0\0#\0magic plate armor\nmastermind shield\0'),
(111,'\0\0\0\0\0\0'),
(112,'\0\0\0\0\0\0'),
(113,'\0\0\0\0\0\0'),
(114,'\0\0\0\0\0'),
(115,'\0\0\0\0\0\0'),
(116,'\0\0\0\0\0\0'),
(117,'\0\0\0\0\0\0'),
(118,'\0\0\0\0\0\0'),
(119,'\0\0\0\0\0\0'),
(120,'\0\0\0\0\0'),
(121,'\0®	\0\0“	\0\0%\0Mastermind shield \nMagic plate armor \0\0'),
(122,'\0\0\0\0\0\0'),
(123,'\0¶	\0\0®	\0\0“	\0\0ÿ	\0\0<\0magic plate armor\nmastermind shield\ngolden legs\ndemon shield\0'),
(124,'\0\0\0\0\0'),
(125,'\0\0\0\0\0\0'),
(126,'\0\0\0\0\0\0'),
(127,'\0\0\0\0\0\0'),
(128,'\0\0\0\0\0\0'),
(129,'\0\0\0\0\0\0'),
(130,'\0\0\0\0\0\0'),
(131,'\0\0\0\0\0\0'),
(132,'\0\0\0\0\0\0'),
(133,'\0\0\0\0\0\0'),
(135,'\0\0\0\0\0\0'),
(137,'\0\0\0\0\0\0'),
(138,'\0\0\0\0\0\0'),
(139,'\0\0\0\0\0\0'),
(140,'\0\0\0\0\0\0'),
(142,'\0\0\0\0\0'),
(143,'\0\0\0\0\0\0'),
(145,'\0\0\0\0\0\0'),
(146,'\0\0\0\0\0\0'),
(147,'\0\0\0\0\0\0'),
(148,'\0\0\0\0\0\0'),
(150,'\0\0\0crystal coins\n\0'),
(151,'\0®	\0\0“	\0\0#\0magic plate armor\nmastermind shield\0'),
(152,'\0\0\0\0\0\0'),
(153,'\0\0\0\0\0\0'),
(154,'\0\0\0\0\0\0'),
(155,'\0\0\0\0\0\0'),
(156,'\0\0\0\0\0'),
(157,'\0\0\0\0\0\0'),
(160,'\0\0\0\0\0'),
(162,'\0\0\0\0\0\0'),
(163,'\0\0\0\0\0'),
(164,'\0\0\0\0\0'),
(165,'\0\0\0\0\0'),
(166,'\0\0\0\0\0'),
(167,'\0\0\0\0\0'),
(168,'\0\0\0\0\0\0'),
(169,'\0\0\0\0\0\0'),
(170,'\0\0\0\0\0\0'),
(171,'\0\0\0\0\0\0'),
(172,'\0\0\0\0\0\0'),
(173,'\0\0\0\0\0'),
(175,'\0\0\0\0\0'),
(176,'\0\0\0\0\0'),
(177,'\0\0\0\0\0'),
(178,'\0\0\0\0\0\0'),
(179,'\0®	\0\0“	\0\0#\0mastermind shield\nmagic plate armor\0'),
(181,'\0\0\0\0\0\0'),
(182,'\0\0\0\0\0\0'),
(183,'\0\0\0\0\0\0'),
(184,'\0\0\0\0\0\0'),
(185,'\0\0\0\0\0\0'),
(186,'\0\0\0\0\0\0'),
(187,'\0\0\0\0\0\0'),
(188,'\0\0\0\0\0\0'),
(189,'\0\0\0\0\0'),
(190,'\0\0\0\0\0'),
(191,'\0\0\0\0\0\0'),
(192,'\0\0\0\0\0\0');
/*!40000 ALTER TABLE `player_autolootconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_deaths`
--

DROP TABLE IF EXISTS `player_deaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_deaths` (
  `player_id` int(11) NOT NULL,
  `time` bigint(20) unsigned NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `killed_by` varchar(255) NOT NULL,
  `is_player` tinyint(4) NOT NULL DEFAULT 1,
  `mostdamage_by` varchar(100) NOT NULL,
  `mostdamage_is_player` tinyint(4) NOT NULL DEFAULT 0,
  `unjustified` tinyint(4) NOT NULL DEFAULT 0,
  `mostdamage_unjustified` tinyint(4) NOT NULL DEFAULT 0,
  KEY `player_id` (`player_id`),
  KEY `killed_by` (`killed_by`),
  KEY `mostdamage_by` (`mostdamage_by`),
  CONSTRAINT `player_deaths_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_deaths`
--

LOCK TABLES `player_deaths` WRITE;
/*!40000 ALTER TABLE `player_deaths` DISABLE KEYS */;
INSERT INTO `player_deaths` VALUES
(58,1778938660,32,'Dementador',0,'Dementador',0,0,0),
(58,1778939247,215,'Sean Guard',0,'Sean Guard',0,0,0),
(31,1778940331,115,'Demon',0,'Demon',0,0,0),
(31,1778940501,202,'Tartarus',0,'Tartarus',0,0,0),
(31,1778940511,200,'carniphila',0,'carniphila',0,0,0),
(31,1778940521,199,'Orc Champion',0,'Orc Champion',0,0,0),
(31,1778940543,197,'Worker Golem',0,'Worker Golem',0,0,0),
(61,1778945121,554,'Snake War',0,'Snake War',0,0,0),
(68,1778946803,70,'Grim Reaper',0,'Grim Reaper',0,0,0),
(68,1778947875,176,'Tartarus',0,'Tartarus',0,0,0),
(72,1778950819,26,'Rotworm Queen',0,'Rotworm Queen',0,0,0),
(73,1778951731,377,'Tartarus',0,'Tartarus',0,0,0),
(73,1778951968,382,'Dementador',0,'Dementador',0,0,0),
(57,1778953588,1401,'Dodge',1,'Dodge',1,1,0),
(59,1778956007,1358,'Orc Champion',0,'Orc Champion',0,0,0),
(67,1778957835,1724,'Destroyer',0,'Destroyer',0,0,0),
(61,1778958428,590,'Orc Champion',0,'Orc Champion',0,0,0),
(61,1778958687,586,'Tartarus',0,'Tartarus',0,0,0),
(61,1778959237,584,'Worker Golem',0,'Worker Golem',0,0,0),
(62,1778959320,907,'Arkhothep',0,'Arkhothep',0,0,0),
(62,1778959416,902,'Arkhothep',0,'morguthis',0,0,0),
(62,1778959437,899,'Dementador',0,'Dementador',0,0,0),
(62,1778959544,897,'Nightmare',0,'Nightmare',0,0,0),
(57,1778960592,1522,'Dodge',1,'Dodge',1,1,0),
(59,1778960622,1411,'Dodge',1,'Dodge',1,1,0),
(80,1778964299,42,'Bulma Necromancer',0,'Bulma Necromancer',0,0,0),
(62,1778966546,998,'Legionnaire',0,'Demondras',0,0,0),
(78,1778966708,1560,'Snake War',0,'Snake War',0,0,0),
(61,1778967701,584,'Snake War',0,'Snake War',0,0,0),
(78,1778968087,1561,'Diabolic Imp',0,'minishabaal',0,0,0),
(78,1778968115,1556,'Destroyer Tanker',0,'Snake War',0,0,0),
(78,1778968137,1551,'Snake War',0,'Snake War',0,0,0),
(78,1778968210,1547,'Drasilla Sean',0,'Drasilla Sean',0,0,0),
(59,1778971523,1511,'Mozila Firefox',1,'Mozila Firefox',1,1,0),
(57,1778971533,1604,'Mozila Firefox',1,'Mozila Firefox',1,1,0),
(86,1778978320,39,'Dementador',0,'Dementador',0,0,0),
(88,1778982020,163,'Snake War',0,'Destroyer Tanker',0,0,0),
(88,1778982044,160,'Bulma Necromancer',0,'Bulma Necromancer',0,0,0),
(83,1778986303,812,'Morgaroth',0,'Mr. Punish',0,0,0),
(83,1778986456,811,'Mr. Punish',0,'Johnsons Baby',1,0,0),
(83,1778986513,805,'Mr. Punish',0,'Mr. Punish',0,0,0),
(85,1778986606,679,'Mr. Punish',0,'Johnsons Baby',1,0,0),
(83,1778986731,799,'Mr. Punish',0,'Mr. Punish',0,0,0),
(85,1778988282,703,'Hades',0,'Snake War',0,0,0),
(85,1778988340,701,'Snake War',0,'Snake War',0,0,0),
(96,1778990169,53,'Bulma Necromancer',0,'Bulma Necromancer',0,0,0),
(67,1779000307,4780,'Morte',0,'Morte',0,0,0),
(67,1779001346,5889,'Morte',0,'Morte',0,0,0),
(67,1779004038,8206,'Morte',0,'Morte',0,0,0),
(85,1779004790,8098,'phelps',0,'phelps',0,0,0),
(84,1779004838,3822,'phelps',0,'phelps',0,0,0),
(84,1779004952,3811,'phelps',0,'phelps',0,0,0),
(84,1779005765,3799,'Huggies',1,'Huggies',1,0,0),
(84,1779005930,3788,'phelps',0,'phelps',0,0,0),
(67,1779007269,8845,'Morte',0,'Morte',0,0,0),
(83,1779015515,8014,'Diabolic Imp',0,'Snake War',0,0,0),
(34,1779018091,1189,'Mozila Firefox',1,'Mozila Firefox',1,1,0),
(34,1779018098,1176,'Mozila Firefox',1,'Mozila Firefox',1,1,0),
(34,1779018103,1164,'Mozila Firefox',1,'Mozila Firefox',1,1,0),
(34,1779018110,1152,'Mozila Firefox',1,'Mozila Firefox',1,1,0),
(34,1779018117,1140,'Mozila Firefox',1,'Mozila Firefox',1,1,0),
(100,1779026505,327,'Spirit of Jack',0,'Guardian of The Sea',0,0,0),
(101,1779027028,8,'dragon',0,'dragon',0,0,0),
(100,1779027834,388,'Dark Abominator',0,'Dark Abominator',0,0,0),
(100,1779028171,386,'Quara Abominator',0,'Quara Abominator',0,0,0),
(100,1779028394,392,'Ghazbaran',0,'Ghazbaran',0,0,0),
(100,1779028938,406,'Ghazbaran',0,'Ghazbaran',0,0,0),
(82,1779029533,159,'Diablo',0,'Diablo',0,0,0),
(91,1779031994,46,'Bulma Necromancer',0,'Bulma Necromancer',0,0,0),
(91,1779032220,45,'Bulma Necromancer',0,'Bulma Necromancer',0,0,0),
(91,1779032449,102,'Bulma Necromancer',0,'Bulma Necromancer',0,0,0),
(91,1779032461,100,'Bulma Necromancer',0,'Bulma Necromancer',0,0,0),
(84,1779036050,3776,'Koi',1,'Huggies',1,0,0),
(85,1779036070,9859,'Koi',1,'Koi',1,0,0),
(82,1779039400,767,'Bulma Necromancer',0,'Bulma Necromancer',0,0,0),
(82,1779039733,764,'Hades',0,'Snake War',0,0,0),
(107,1779051901,1098,'Diabolic Imp',0,'Diabolic Imp',0,0,0),
(107,1779052045,1095,'Mr. Punish',0,'Mr. Punish',0,0,0),
(107,1779052252,1097,'Mr. Punish',0,'Dont Lure',0,0,0),
(107,1779052470,1100,'Mr. Punish',0,'Mr. Punish',0,0,0),
(107,1779056190,1437,'Grim Reaper Vip',0,'Grim Reaper Vip',0,0,0),
(69,1779059940,584,'Snake War',0,'Destroyer Tanker',0,0,0),
(69,1779061902,710,'Arkhothep',0,'Arkhothep',0,0,0),
(69,1779121780,848,'Diabolic Imp',0,'Diabolic Imp',0,0,0),
(113,1779150960,8,'Rotworm',0,'dragon',0,0,0),
(69,1779203007,1074,'Nightmare',0,'Nightmare',0,0,0),
(120,1779204355,189,'Orc Champion',0,'Orc Champion',0,0,0),
(110,1779206854,678,'Fluffy',0,'Fluffy',0,0,0),
(110,1779207013,710,'Fluffy',0,'Fluffy',0,0,0),
(110,1779207050,706,'Dementador',0,'Dementador',0,0,0),
(110,1779207879,785,'Nightmare',0,'Nightmare',0,0,0),
(110,1779208412,804,'Fire Elemental',0,'Demon',0,0,0),
(123,1779258301,699,'Diabolic Imp',0,'Diabolic Imp',0,0,0),
(123,1779258682,840,'Destroyer',0,'Destroyer',0,0,0),
(123,1779259220,931,'Dementador',0,'Dementador',0,0,0),
(123,1779260553,1052,'Destroyer',0,'Bad Boy',1,0,0),
(124,1779261350,938,'Fluffy',0,'Fluffy',0,0,0),
(124,1779261400,932,'Dementador',0,'Dementador',0,0,0),
(123,1779261407,1080,'Dementador',0,'Dementador',0,0,0),
(124,1779261455,933,'Dementador',0,'Dementador',0,0,0),
(124,1779262180,1140,'Destroyer',0,'Destroyer',0,0,0),
(124,1779263157,1310,'Destroyer',0,'Destroyer',0,0,0),
(138,1779395091,50,'Grim Reaper Vip II',0,'Grim Reaper Vip II',0,0,0),
(69,1779398996,1076,'Tartarus',0,'Tartarus',0,0,0),
(135,1779408141,272,'Diablo',0,'Diablo',0,0,0),
(135,1779408378,270,'Tartarus',0,'Tartarus',0,0,0),
(135,1779408493,362,'Tartarus',0,'Tartarus',0,0,0),
(139,1779416757,8,'Dementator',0,'Dementator',0,0,0),
(139,1779416816,7,'Avalanche',0,'Avalanche',0,0,0),
(139,1779417254,7,'Dementator',0,'Dementator',0,0,0),
(139,1779418276,7,'Demon',0,'Demon',0,0,0),
(135,1779423522,927,'Orc Champion',0,'Orc Champion',0,0,0),
(142,1779478027,177,'Orc Champion',0,'Orc Champion',0,0,0),
(135,1779489469,1122,'Avalanche',0,'Avalanche',0,0,0),
(143,1779495577,148,'Drasilla',0,'Drasilla',0,0,0),
(75,1779500221,1810,'Morte',0,'Morte',0,0,0),
(146,1779508394,73,'Grim Reaper',0,'Grim Reaper',0,0,0),
(75,1779556445,1843,'Morte',0,'Morte',0,0,0),
(75,1779557005,1854,'Morte',0,'Morte',0,0,0),
(75,1779558649,1968,'Kraken',0,'Kraken',0,0,0),
(75,1779560218,2002,'field item',0,'field item',0,0,0),
(148,1779581770,2213,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(28,1779587740,597,'Orc Champion',0,'Orc Champion',0,0,0),
(28,1779587823,619,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(28,1779587858,656,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(148,1779588533,2636,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(35,1779589317,326,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(35,1779589553,663,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(35,1779589762,656,'Boss Sphinx',0,'Boss Sphinx',0,0,0),
(37,1779590026,158,'Carnivora',0,'Carnivora',0,0,0),
(37,1779590062,274,'Carnivora',0,'Carnivora',0,0,0),
(37,1779590340,766,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(41,1779591191,166,'Carnivora',0,'Carnivora',0,0,0),
(41,1779591344,598,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(41,1779591443,747,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(41,1779591458,742,'Boss Rot Elemental',0,'Boss Rot Elemental',0,0,0),
(150,1779596410,2754,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(148,1779596412,2735,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(150,1779644429,4679,'Hercules',0,'Hercules',0,0,0),
(148,1779654967,4953,'Hercules',0,'Hercules',0,0,0),
(150,1779654978,4933,'Hercules',0,'Hercules',0,0,0),
(56,1779656321,3771,'Boss Sphinx',0,'Boss Sphinx',0,0,0),
(148,1779658263,5005,'Infernatil',0,'Infernatil',0,0,0),
(150,1779658267,4966,'Infernatil',0,'Infernatil',0,0,0),
(154,1779658343,8,'Rotworm',0,'Rotworm',0,0,0),
(56,1779666692,3784,'Lexus pro',1,'Lexus big',1,0,0),
(150,1779668354,5150,'Hercules',0,'Hercules',0,0,0),
(155,1779668404,238,'Infernatil',0,'Infernatil',0,0,0),
(155,1779668493,237,'Infernatil',0,'Infernatil',0,0,0),
(27,1779668609,5499,'War Destroyer Golem',0,'War Destroyer Golem',0,0,0),
(155,1779668948,274,'Carnivora',0,'Carnivora',0,0,0),
(156,1779673473,913,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(156,1779673578,925,'Hercules',0,'Hercules',0,0,0),
(156,1779673590,919,'Tartarus',0,'Tartarus',0,0,0),
(156,1779673926,1062,'Hercules',0,'Hercules',0,0,0),
(32,1779745415,1175,'Hercules',0,'Hercules',0,0,0),
(167,1779749389,538,'Infernatil',0,'Infernatil',0,0,0),
(167,1779749425,535,'Infernatil',0,'Infernatil',0,0,0),
(167,1779749740,546,'Morte',0,'Morte',0,0,0),
(156,1779749788,5519,'Nikki Sixx',1,'Nikki Sixx',1,1,0),
(167,1779750348,1083,'Hercules',0,'Hercules',0,0,0),
(167,1779751510,1444,'Infernatil',0,'Infernatil',0,0,0),
(155,1779754947,313,'Carnivora',0,'Carnivora',0,0,0),
(56,1779757216,3800,'Koi',1,'Koi',1,0,0),
(28,1779757218,1063,'Koi',1,'Koi',1,0,0),
(165,1779757968,401,'Frost Dragon',0,'Frost Dragon',0,0,0),
(32,1779758892,1215,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(32,1779759121,1240,'Koi',1,'Koi',1,0,0),
(32,1779759143,1232,'Koi',1,'Koi',1,0,0),
(163,1779761754,868,'Frost Dragon',0,'Frost Dragon',0,0,0),
(172,1779763280,159,'Tartarus',0,'Tartarus',0,0,0),
(173,1779786887,1381,'Grim Reaper Vip',0,'Grim Reaper Vip',0,0,0),
(160,1779794624,1305,'Infernatil',0,'Infernatil',0,0,0),
(166,1779794795,1499,'Abominator',0,'Abominator',0,0,0),
(166,1779795072,1491,'Infernatil',0,'Infernatil',0,0,0),
(160,1779796672,1395,'Morte',0,'Morte',0,0,0),
(56,1779799049,3777,'Mozila Firefox',1,'Mozila Firefox',1,1,0),
(77,1779803944,2065,'Dementator',0,'Dementator',0,0,0),
(77,1779804376,2067,'Draculian',0,'Cursed Demon',0,0,0),
(77,1779804473,2056,'Morte',0,'Morte',0,0,0),
(77,1779804504,2045,'Daemon',0,'Daemon',0,0,0),
(77,1779804575,2035,'Tartarus',0,'Tartarus',0,0,0),
(173,1779808454,1377,'Tartarus',0,'Tartarus',0,0,0),
(173,1779808708,1393,'Dementator',0,'Tanka',1,0,0),
(173,1779808731,1388,'Morte',0,'Morte',0,0,0),
(173,1779811227,1699,'Hercules',0,'Hercules',0,0,0),
(177,1779812680,1018,'Kraken',0,'Kraken',0,0,0),
(177,1779812700,1015,'Carnivora',0,'Carnivora',0,0,0),
(177,1779812722,1013,'Daemon',0,'Daemon',0,0,0),
(177,1779812914,1028,'Avalanche',0,'Avalanche',0,0,0),
(177,1779813099,1025,'Infernatil',0,'Infernatil',0,0,0),
(27,1779820019,5594,'Tafariel',0,'Tafariel',0,0,0),
(27,1779820087,5560,'Infernatil',0,'Infernatil',0,0,0),
(176,1779823247,1235,'Tartarus',0,'Tartarus',0,0,0),
(176,1779823258,1231,'Furyosa',0,'Furyosa',0,0,0),
(176,1779823456,1267,'Koi',1,'Koi',1,1,0),
(27,1779830712,5527,'Verminor',0,'Verminor',0,0,0),
(176,1779832286,2678,'Boss Sphinx',0,'Boss Sphinx',0,0,0),
(176,1779832401,2670,'Infernatil',0,'Infernatil',0,0,0),
(73,1779834706,377,'Bazir',0,'Bazir',0,0,0),
(179,1779835175,1000,'Infernatil',0,'Infernatil',0,0,0),
(171,1779835651,4434,'Infernatil',0,'Infernatil',0,0,0),
(32,1779837580,1396,'Aimazing',1,'Aimazing',1,1,0),
(165,1779847913,1708,'Infernatil',0,'Infernatil',0,0,0),
(163,1779849285,1260,'Hercules',0,'Hercules',0,0,0),
(184,1779849979,121,'Carnivora',0,'Carnivora',0,0,0),
(184,1779850252,233,'Morte',0,'Morte',0,0,0),
(184,1779850261,231,'Morte',0,'Morte',0,0,0),
(184,1779850326,281,'Morte',0,'Morte',0,0,0),
(184,1779850641,539,'Morte',0,'Morte',0,0,0),
(186,1779863138,63,'Dementator',0,'Dementator',0,0,0),
(186,1779863184,62,'Draken Spellweaver',0,'Draken Warmaster',0,0,0),
(138,1779883518,117,'Boss Glooth Bomb',0,'Boss Glooth Bomb',0,0,0),
(166,1779887647,3174,'Dementator',0,'Dementator',0,0,0),
(163,1779888299,2252,'Master Grim Reaper',0,'Master Grim Reaper',0,0,0),
(179,1779903150,1720,'Avalanche',0,'Avalanche',0,0,0),
(160,1779905788,4060,'Cimed',1,'Cimed',1,0,0),
(164,1779906616,3896,'Cimed',1,'Cimed',1,0,0),
(171,1779909235,4411,'Tormentor',0,'Incinerator',0,0,0),
(171,1779909309,4384,'Incinerator',0,'Incinerator',0,0,0),
(151,1779909622,3292,'Incinerator',0,'Incinerator',0,0,0),
(171,1779909772,4357,'Infernatil',0,'Infernatil',0,0,0),
(151,1779909842,3283,'Verminor',0,'Verminor',0,0,0),
(151,1779909981,3276,'Lord Ferumbras',0,'Lord Ferumbras',0,0,0),
(171,1779910159,4331,'Bazir',0,'Infernatil',0,0,0),
(155,1779910375,3838,'Cimed',1,'Cimed',1,1,0),
(165,1779910737,3334,'Cimed',1,'Cimed',1,1,0),
(64,1779910857,8132,'Infernatil',0,'Bazir',0,0,0),
(151,1779910905,3274,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(179,1779912413,2452,'Infernatil',0,'Infernatil',0,0,0),
(190,1779914797,80,'Hercules',0,'Hercules',0,0,0),
(151,1779915126,3611,'Xenhort',1,'Xenhort',1,1,0),
(190,1779915710,532,'Hercules',0,'Hercules',0,0,0),
(64,1779917571,8109,'Morgaroth',0,'Bazir',0,0,0),
(45,1779918764,1149,'Hercules',0,'Hercules',0,0,0),
(45,1779919310,1157,'Xenhort',1,'Xenhort',1,0,0),
(189,1779919882,2294,'Avalanche',0,'Avalanche',0,0,0),
(114,1779919959,7788,'Koi',1,'Koi',1,0,0),
(189,1779920195,2341,'Lord Ferumbras',0,'Lord Ferumbras',0,0,0),
(189,1779920997,2470,'Son Of Chaos',0,'Son Of Chaos',0,0,0),
(189,1779921909,2527,'Son Of Chaos',0,'Son Of Chaos',0,0,0),
(189,1779924491,2729,'Tafariel',0,'Tafariel',0,0,0),
(178,1779924698,2117,'Tafariel',0,'Tafariel',0,0,0),
(178,1779925277,2104,'Tafariel',0,'Tafariel',0,0,0),
(191,1779925834,1268,'Tafariel',0,'Tafariel',0,0,0),
(191,1779926487,1298,'Choucha Prime',1,'Choucha Prime',1,0,0),
(178,1779927059,2121,'Bazir',0,'Infernatil',0,0,0),
(191,1779927146,1328,'Bazir',0,'Infernatil',0,0,0),
(165,1779928408,3333,'Lord Ferumbras',0,'Lord Ferumbras',0,0,0),
(166,1779929306,3172,'Infernatil',0,'Infernatil',0,0,0),
(178,1779929374,2137,'Infernatil',0,'Infernatil',0,0,0),
(56,1779929846,3754,'Koi',1,'Koi',1,1,0),
(114,1779930585,7788,'Pandemic Virus',0,'Pandemic Virus',0,0,0),
(191,1779930622,1352,'Massacre',0,'Infernatil',0,0,0),
(27,1779931610,5495,'Koi',1,'Koi',1,1,0),
(28,1779933169,1072,'Mozila Firefox',1,'Mozila Firefox',1,0,0),
(64,1779934766,8087,'Morte',0,'Morte',0,0,0),
(64,1779934803,8063,'Morte',0,'Morte',0,0,0),
(64,1779935211,8038,'Mozila Firefox',1,'Mozila Firefox',1,1,0),
(114,1779935273,7815,'Pandemic Virus',0,'Pandemic Virus',0,0,0),
(45,1779935486,2029,'Destroyer Golem',0,'Destroyer Golem',0,0,0),
(114,1779962773,7875,'Pandemic Virus',0,'Pandemic Virus',0,0,0),
(179,1779995778,2947,'Infernatil',0,'Infernatil',0,0,0),
(179,1779997429,2957,'Morgaroth',0,'Abominator',0,0,0),
(192,1780001762,153,'Cimed',1,'Cimed',1,1,0),
(192,1780001767,151,'Cimed',1,'Cimed',1,1,0),
(192,1780001771,149,'Cimed',1,'Cimed',1,1,0),
(192,1780001774,147,'Cimed',1,'Cimed',1,1,0),
(192,1780001779,145,'Cimed',1,'Cimed',1,1,0),
(191,1780012607,1344,'Koi',1,'Koi',1,1,0),
(114,1780013115,8017,'Grim Heer',1,'Mozila Firefox',1,1,0),
(57,1780016978,1621,'Infernatil',0,'Bazir',0,0,0),
(59,1780016983,1532,'Morgaroth',0,'Bazir',0,0,0),
(45,1780019836,2077,'Tafariel',0,'Tafariel',0,0,0),
(175,1780019950,880,'Massacre',0,'Massacre',0,0,0),
(45,1780020063,2067,'Massacre',0,'Massacre',0,0,0),
(175,1780020089,881,'Abominator',0,'Abominator',0,0,0),
(175,1780020212,911,'Lord Ferumbras',0,'Lord Ferumbras',0,0,0),
(59,1780020382,1545,'Tafariel',0,'Tafariel',0,0,0),
(57,1780020386,1634,'Massacre',0,'Massacre',0,0,0),
(178,1780020396,2138,'Tafariel',0,'Tafariel',0,0,0);
/*!40000 ALTER TABLE `player_deaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_debugasserts`
--

DROP TABLE IF EXISTS `player_debugasserts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_debugasserts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `assert_line` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_debugasserts_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_debugasserts`
--

LOCK TABLES `player_debugasserts` WRITE;
/*!40000 ALTER TABLE `player_debugasserts` DISABLE KEYS */;
INSERT INTO `player_debugasserts` VALUES
(10,4,'Debug Assertion 8.60 Objects.cpp 277','Sat May 16 11:13:56 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i5 -3470 @ 3\nVideo Card: Intel (R) HD GR\nLast Packet Types: 100 010 031 100 020 131 132 140 132 132\nLast Packet: 010 111 000 000 016 050 000 000 100 113 000 083 000 007 055 027\nPlayer Name: Account Manager (Baiakeiros)\nPlayer Action: 053 046 049 056 057 046 049 055 056 046 056 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 100) (MainWindow = 40927120), reason:\nCommunication.cpp 1681: exception occurred (PlayerX = 113) (PlayerY = 83), reason:\nCommunication.cpp 1659: exception occurred (xmin = 0) (ymin = 0), reason:\nCommunication.cpp 1638: exception occurred (Type = 11784) (OldType = 1722), reason:\nObjects.cpp 280: exception occurred (Type = 11784) (Flag = 10), reason:\nObjects.cpp 277: assertion failed (Type = 11784) (ObjectProperties->high() = 11703), reason:\nIn(Type,ObjectProperties->low(),ObjectProperties->high())','Comment: ','2026-05-16 14:25:26'),
(11,64,'Debug Assertion 8.60 Communication.cpp 2792','Sat May 16 10:05:43 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in MEX\nProcessor: AMD RYZEN 5 5\nVideo Card: ATI Radeon AMD RX 66\nLast Packet Types: 170 109 132 131 132 131 132 131 132 131\nLast Packet: 170 038 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [148,54,8]\nPlayer Name: Koi (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 55908280), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-16 15:06:02'),
(12,64,'Debug Assertion 8.60 Communication.cpp 2792','Sat May 16 10:06:04 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in MEX\nProcessor: AMD RYZEN 5 5\nVideo Card: ATI Radeon AMD RX 66\nLast Packet Types: 170 109 101 109 109 111 162 109 109 109\nLast Packet: 170 039 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [153,47,8]\nPlayer Name: Koi (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 54818832), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-16 15:06:14'),
(13,72,'Debug Assertion 8.60 Communication.cpp 2792','Sat May 16 13:59:53 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: AMD RYZEN 5 5\nVideo Card: NVIDIA GeForce RTX 2060\nLast Packet Types: 170 131 134 161 107 109 109 140 133 107\nLast Packet: 170 079 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [153,54,8]\nPlayer Name: Agrotaigo (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 55321688), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-16 16:59:43'),
(14,83,'Debug Assertion 8.60 Communication.cpp 2792','Sat May 16 19:41:41 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: AMD RYZEN 7 5\nVideo Card: NVIDIA GeForce RTX 3060 \nLast Packet Types: 170 162 162 162 109 132 131 132 131 132\nLast Packet: 170 011 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [148,53,7]\nPlayer Name: Pampers (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 57017312), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-16 22:42:04'),
(15,83,'Debug Assertion 8.60 Communication.cpp 2792','Sat May 16 19:58:17 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: AMD RYZEN 7 5\nVideo Card: NVIDIA GeForce RTX 3060 \nLast Packet Types: 170 142 142 142 142 142 142 131 170 160\nLast Packet: 170 074 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [150,60,7]\nPlayer Name: Pampers (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 55191736), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-16 22:58:57'),
(16,85,'Debug Assertion 8.60 Communication.cpp 2792','Sat May 16 20:15:22 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: AMD RYZEN 7 5\nVideo Card: NVIDIA GeForce RTX 3060 \nLast Packet Types: 170 131 170 160 160 180 162 170 160 162\nLast Packet: 170 078 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [230,115,5]\nPlayer Name: Huggies (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 55912136), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-16 23:16:09'),
(17,90,'Debug Assertion 8.60 Communication.cpp 1626','Sat May 16 23:08:13 2026','Graphic Engine: DirectX5 (0)\nOperating System: Windows Vista Family in BRA\nProcessor: AMD RYZEN 5 4\nVideo Card: NVIDIA GeForce RTX 3060\nLast Packet Types: 100 010 031 100 020 010 010 010 000 000\nLast Packet: 010 084 000 000 016 050 000 000 100 152 000 055 000 007 161 001\nPlayer Position: [152,55,7]\nPlayer Name: Gaguinho (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 100) (MainWindow = 44834528), reason:\nCommunication.cpp 1681: exception occurred (PlayerX = 152) (PlayerY = 55), reason:\nCommunication.cpp 1659: exception occurred (xmin = 0) (ymin = 0), reason:\nCommunication.cpp 1638: exception occurred (Type = 0) (OldType = 97), reason:\nCommunication.cpp 1626: client recieved field with type 0 (8,6,0)','','2026-05-17 02:17:44'),
(18,90,'Debug Assertion 8.60 Control.cpp 1325','Sat May 16 23:15:37 2026','Graphic Engine: DirectX5 (0)\nOperating System: Windows Vista Family in BRA\nProcessor: AMD RYZEN 5 4\nVideo Card: NVIDIA GeForce RTX 3060\nLast Packet Types: 000 160 031 100 020 010 010 000 000 000\nLast Packet: 160 185 000 000 000 185 000 000 000 246 194 000 000 104 016 000\nPlayer Name: Gaguinho (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 0) (MainWindow = 44480312), reason:\nControl.cpp 1325: unknown packet type during game (Type = 0)','Comment: ','2026-05-17 02:17:44'),
(19,107,'Debug Assertion 8.60 Communication.cpp 1626','Sun May 17 16:21:59 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i7 -3770 @ 3\nVideo Card: NVIDIA GeForce RTX 2060\nLast Packet Types: 100 010 031 100 020 000 000 000 000 000\nLast Packet: 010 032 000 000 016 050 000 000 100 152 000 055 000 007 161 001\nPlayer Position: [152,55,7]\nPlayer Name: Soul War (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 100) (MainWindow = 11239184), reason:\nCommunication.cpp 1681: exception occurred (PlayerX = 152) (PlayerY = 55), reason:\nCommunication.cpp 1659: exception occurred (xmin = 0) (ymin = 0), reason:\nCommunication.cpp 1638: exception occurred (Type = 0) (OldType = 97), reason:\nCommunication.cpp 1626: client recieved field with type 0 (8,6,0)','Comment: ','2026-05-17 19:26:08'),
(20,110,'Debug Assertion 8.60 Communication.cpp 1626','Mon May 18 16:36:37 2026','Graphic Engine: OpenGL (1)\nOperating System: Windows Vista Family in USA\nProcessor: Intel Core i5 13TH GEN \nVideo Card: NVIDIA GeForce RTX 3050\nLast Packet Types: 100 010 031 100 020 109 102 109 108 102\nLast Packet: 010 079 000 000 016 050 000 000 100 152 000 055 000 007 161 001\nPlayer Position: [152,55,7]\nPlayer Name: Donat (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 100) (MainWindow = 16626016), reason:\nCommunication.cpp 1681: exception occurred (PlayerX = 152) (PlayerY = 55), reason:\nCommunication.cpp 1659: exception occurred (xmin = 0) (ymin = 0), reason:\nCommunication.cpp 1638: exception occurred (Type = 0) (OldType = 97), reason:\nCommunication.cpp 1626: client recieved field with type 0 (8,6,0)','Comment: ','2026-05-18 12:41:46'),
(21,119,'Debug Assertion 8.60 Communication.cpp 1626','Tue May 19 17:42:37 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in USA\nProcessor: Intel Xeon E5-2680 V\nVideo Card: NVIDIA GeForce RTX 3050\nLast Packet Types: 100 010 031 100 020 010 010 000 000 000\nLast Packet: 010 125 000 000 016 050 000 000 100 152 000 055 000 007 161 001\nPlayer Position: [152,55,7]\nPlayer Name: Demtry (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 100) (MainWindow = 41582320), reason:\nCommunication.cpp 1681: exception occurred (PlayerX = 152) (PlayerY = 55), reason:\nCommunication.cpp 1659: exception occurred (xmin = 0) (ymin = 0), reason:\nCommunication.cpp 1638: exception occurred (Type = 0) (OldType = 97), reason:\nCommunication.cpp 1626: client recieved field with type 0 (8,6,0)','Comment: ','2026-05-19 14:49:38'),
(22,123,'Debug Assertion 8.60 Container.h 226','Tue May 19 15:02:28 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i5 -4460 @ 3\nVideo Card: ATI Radeon RX 580 SE\nLast Packet Types: 100 010 180 031 100 020 000 000 000 000\nLast Packet: 180 019 034 000 083 112 101 099 116 097 116 111 114 032 049 055\nPlayer Name: Adestrador De Cadela (L.930 RP | 0/50)\nPlayer Action: 049 055 055 046 053 052 046 049 052 055 046 057 049 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 100) (MainWindow = 14778200), reason:\nCommunication.cpp 1681: exception occurred (PlayerX = 1647) (PlayerY = 2731), reason:\nCommunication.cpp 1659: exception occurred (xmin = 0) (ymin = 0), reason:\nCommunication.cpp 1638: exception occurred (Type = 97) (OldType = 231), reason:\nCommunication.cpp 1592: exception occurred (Type = 97) (CreatureID = 1075478841), reason:\nObjects.cpp 604: exception occurred (Number = 939), reason:\nContainer.h 226: index out of range (original i: 939, i: 938, min: 1, d: 367)','Comment: ','2026-05-20 04:22:25'),
(23,27,'Debug Assertion 8.60 Communication.cpp 2792','Thu May 21 15:06:47 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i5 -3330 @ 3\nVideo Card: Intel (R) HD GR\nLast Packet Types: 170 102 101 109 162 102 101 109 102 103\nLast Packet: 170 025 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [166,603,15]\nPlayer Name: Mozila Firefox (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 53637528), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-21 18:52:23'),
(24,114,'Debug Assertion 8.60 Communication.cpp 2792','Thu May 21 19:56:05 2026','Graphic Engine: OpenGL (1)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i7 -2600K @ \nVideo Card: NVIDIA GeForce GTX 750\nLast Packet Types: 170 160 160 160 160 160 160 160 160 160\nLast Packet: 170 003 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [30,102,7]\nPlayer Name: Mage Rushmax (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 53441376), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-21 22:56:41'),
(25,114,'Debug Assertion 8.60 Communication.cpp 2792','Thu May 21 20:15:44 2026','Graphic Engine: OpenGL (1)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i7 -2600K @ \nVideo Card: NVIDIA GeForce GTX 750\nLast Packet Types: 170 180 131 180 143 180 180 131 180 180\nLast Packet: 170 002 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [45,253,7]\nPlayer Name: Mage Rushmax (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 53862552), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-21 23:18:57'),
(26,113,'Debug Assertion 8.60 Communication.cpp 2792','Thu May 21 20:30:49 2026','Graphic Engine: OpenGL (1)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i7 -2600K @ \nVideo Card: NVIDIA GeForce GTX 750\nLast Packet Types: 170 187 030 187 030 187 030 187 030 187\nLast Packet: 170 006 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [39,275,7]\nPlayer Name: Mage Rushmax (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 53159624), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-21 23:34:10'),
(27,114,'Debug Assertion 8.60 Communication.cpp 2792','Thu May 21 21:00:11 2026','Graphic Engine: OpenGL (1)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i7 -2600K @ \nVideo Card: NVIDIA GeForce GTX 750\nLast Packet Types: 170 180 180 180 187 030 180 180 180 180\nLast Packet: 170 001 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [357,114,7]\nPlayer Name: Mage Rushmax (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 52888864), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-22 00:12:35'),
(28,114,'Debug Assertion 8.60 Communication.cpp 2792','Fri May 22 19:34:35 2026','Graphic Engine: OpenGL (1)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i7 -2600K @ \nVideo Card: NVIDIA GeForce GTX 750\nLast Packet Types: 170 180 180 180 180 180 131 180 180 180\nLast Packet: 170 003 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [298,187,6]\nPlayer Name: Mage Rushmax (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 53266912), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-22 22:35:35'),
(29,114,'Debug Assertion 8.60 Communication.cpp 2792','Fri May 22 21:07:19 2026','Graphic Engine: OpenGL (1)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i7 -2600K @ \nVideo Card: NVIDIA GeForce GTX 750\nLast Packet Types: 170 160 133 180 180 180 160 160 160 160\nLast Packet: 170 006 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [277,162,6]\nPlayer Name: Mage Rushmax (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 52637760), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-23 00:11:47'),
(30,114,'Debug Assertion 8.60 Communication.cpp 2792','Fri May 22 21:29:27 2026','Graphic Engine: OpenGL (1)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i7 -2600K @ \nVideo Card: NVIDIA GeForce GTX 750\nLast Packet Types: 170 180 180 180 180 140 180 132 131 106\nLast Packet: 170 009 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [277,155,6]\nPlayer Name: Mage Rushmax (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 53725728), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-23 00:31:33'),
(31,114,'Debug Assertion 8.60 Communication.cpp 2792','Fri May 22 21:59:30 2026','Graphic Engine: OpenGL (1)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i7 -2600K @ \nVideo Card: NVIDIA GeForce GTX 750\nLast Packet Types: 170 180 180 131 180 109 180 180 180 180\nLast Packet: 180 026 018 000 089 111 117 032 097 114 101 032 101 120 104 097\nPlayer Position: [2054,398,7]\nPlayer Name: Mage Rushmax (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 53684008), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-23 01:00:20'),
(32,114,'Debug Assertion 8.60 Communication.cpp 2792','Fri May 22 22:01:25 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i7 -2600K @ \nVideo Card: NVIDIA GeForce GTX 750\nLast Packet Types: 170 103 109 160 160 160 160 180 162 162\nLast Packet: 170 007 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [2100,390,7]\nPlayer Name: Mage Rushmax (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 52950176), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-23 01:02:09'),
(33,151,'Debug Assertion 8.60 Communication.cpp 2792','Tue May 26 17:42:54 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 160 160 160 160 160 160 160 160 160\nLast Packet: 170 034 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [303,179,6]\nPlayer Name: Cimed (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 52239072), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-26 20:45:19'),
(34,179,'Debug Assertion 8.60 Communication.cpp 2792','Tue May 26 18:08:51 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 180 104 109 104 109 104 109 104 109\nLast Packet: 170 118 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [143,49,7]\nPlayer Name: Aimazing (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 51971392), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-26 21:11:32'),
(35,179,'Debug Assertion 8.60 Communication.cpp 2792','Tue May 26 18:10:03 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 103 109 103 109 103 109 103 109 162\nLast Packet: 170 120 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [266,381,7]\nPlayer Name: Aimazing (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 51800184), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-26 21:12:57'),
(36,179,'Debug Assertion 8.60 Communication.cpp 2792','Tue May 26 18:19:47 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 107 160 160 160 160 109 102 109 180\nLast Packet: 170 127 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [173,61,7]\nPlayer Name: Aimazing (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 52098392), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-26 21:22:22'),
(37,179,'Debug Assertion 8.60 Communication.cpp 2792','Tue May 26 19:11:52 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 163 108 180 180 106 160 140 180 132\nLast Packet: 170 168 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [1040,826,7]\nPlayer Name: Aimazing (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 52291320), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-26 22:16:02'),
(38,179,'Debug Assertion 8.60 Communication.cpp 2792','Tue May 26 19:41:02 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 180 160 133 131 134 180 140 180 132\nLast Packet: 180 026 018 000 089 111 117 032 097 114 101 032 101 120 104 097\nPlayer Position: [223,418,15]\nPlayer Name: Aimazing (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 52114168), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-26 22:43:34'),
(39,179,'Debug Assertion 8.60 Communication.cpp 2792','Tue May 26 19:47:01 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 180 107 180 107 180 107 131 180 180\nLast Packet: 170 003 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [314,424,15]\nPlayer Name: Aimazing (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 57529296), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-26 22:49:33'),
(40,151,'Debug Assertion 8.60 Communication.cpp 2792','Tue May 26 20:44:04 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 104 109 160 160 160 160 104 109 103\nLast Packet: 170 008 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [135,56,7]\nPlayer Name: Cimed (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 52053872), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-26 23:46:36'),
(41,4,'Debug Assertion 8.60 NWin32Exception.cpp 50','Wed May 27 14:12:21 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i5 -3470 @ 3\nVideo Card: Intel (R) HD GR\nLast Packet Types: 187 030 104 109 103 109 101 109 103 109\nLast Packet: 030 187 036 000 089 071 069 067 065 108 104 049 100 108 078 115\nPlayer Position: [286,122,7]\nPlayer Name: ADM Pesado (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nPlayer.cpp 465: exception occurred, reason:\nControl.cpp 1728: exception occurred (MessageType: 0 MaW: 32EF770 MoW: 0), reason:\nControl.cpp 1723: exception occurred, reason:\nControl.cpp 386: exception occurred (Force?1:0 = 0), reason:\nMainWindow.cpp 138: exception occurred (Surface = 1), reason:\nNWin32Exception.cpp 50: win32 exception occurred, reason:\naccess violation (write attempt at 4EA5B499)','Comment: ','2026-05-27 17:12:53'),
(42,179,'Debug Assertion 8.60 Communication.cpp 2792','Wed May 27 15:03:57 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 131 180 180 107 180 107 160 160 160\nLast Packet: 170 012 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [21,56,4]\nPlayer Name: Aimazing (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 70875792), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-27 18:06:59'),
(43,179,'Debug Assertion 8.60 NWin32Exception.cpp 50','Wed May 27 15:08:27 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 140 180 132 131 106 108 131 131 160 133\nLast Packet: 131 025 000 052 000 004 052 000 131 025 000 052 000 004 010 000\nPlayer Position: [26,51,4]\nPlayer Name: Aimazing (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nPlayer.cpp 465: exception occurred, reason:\nControl.cpp 1728: exception occurred (MessageType: 0 MaW: 44D9CF0 MoW: 0), reason:\nControl.cpp 1723: exception occurred, reason:\nControl.cpp 386: exception occurred (Force?1:0 = 0), reason:\nMainWindow.cpp 138: exception occurred (Surface = 1), reason:\nNWin32Exception.cpp 50: win32 exception occurred, reason:\naccess violation (write attempt at 4EA5B499)','Comment: ','2026-05-27 18:17:00'),
(44,151,'Debug Assertion 8.60 Communication.cpp 2792','Wed May 27 16:07:10 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 180 107 104 109 107 107 107 107 107\nLast Packet: 170 012 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [130,51,6]\nPlayer Name: Cimed (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 59563896), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-27 19:10:01'),
(45,151,'Debug Assertion 8.60 Communication.cpp 2792','Wed May 27 16:08:18 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 109 109 101 109 109 104 109 104 109\nLast Packet: 170 015 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [124,50,6]\nPlayer Name: Cimed (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 70753280), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-27 19:10:50'),
(46,151,'Debug Assertion 8.60 Communication.cpp 2792','Wed May 27 16:09:49 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 109 180 109 109 180 187 030 109 109\nLast Packet: 170 022 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [220,114,5]\nPlayer Name: Cimed (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 70429792), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-27 19:12:13'),
(47,151,'Debug Assertion 8.60 Communication.cpp 2792','Wed May 27 16:14:38 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 160 160 160 160 187 030 160 160 160\nLast Packet: 170 027 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [884,560,15]\nPlayer Name: Cimed (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 70646408), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-27 19:17:05'),
(48,151,'Debug Assertion 8.60 Communication.cpp 2792','Wed May 27 16:15:36 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 187 160 160 160 160 030 160 160 160\nLast Packet: 170 028 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [885,559,15]\nPlayer Name: Cimed (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 57728648), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-27 19:18:05'),
(49,151,'Debug Assertion 8.60 Communication.cpp 2792','Wed May 27 16:18:26 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 143 107 107 107 107 143 131 107 107\nLast Packet: 170 030 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [154,50,7]\nPlayer Name: Cimed (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 58449864), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-27 19:20:48'),
(50,190,'Debug Assertion 8.60 Objects.cpp 277','Wed May 27 17:33:43 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i5 -3470 @ 3\nVideo Card: Intel (R) HD GR\nLast Packet Types: 100 010 031 100 020 010 010 010 000 000\nLast Packet: 010 028 000 000 016 050 000 000 100 152 000 055 000 007 136 068\nPlayer Name: Loirah Kah (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 100) (MainWindow = 40665936), reason:\nCommunication.cpp 1681: exception occurred (PlayerX = 152) (PlayerY = 55), reason:\nCommunication.cpp 1659: exception occurred (xmin = 0) (ymin = 0), reason:\nCommunication.cpp 1638: exception occurred (Type = 17544) (OldType = 0), reason:\nObjects.cpp 280: exception occurred (Type = 17544) (Flag = 10), reason:\nObjects.cpp 277: assertion failed (Type = 17544) (ObjectProperties->high() = 11703), reason:\nIn(Type,ObjectProperties->low(),ObjectProperties->high())','Comment: ','2026-05-27 20:49:25'),
(51,114,'Debug Assertion 8.60 Communication.cpp 2792','Wed May 27 19:13:21 2026','Graphic Engine: OpenGL (1)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i7 -2600K @ \nVideo Card: NVIDIA GeForce GTX 750\nLast Packet Types: 170 163 181 163 108 180 180 106 106 160\nLast Packet: 170 023 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [310,195,6]\nPlayer Name: Mage Rushmax (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 53818720), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-27 22:13:49'),
(52,179,'Debug Assertion 8.60 Communication.cpp 2792','Wed May 27 20:03:35 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 163 180 109 163 180 163 180 163 180\nLast Packet: 180 026 050 000 084 104 105 115 032 097 099 116 105 111 110 032\nPlayer Position: [626,15,7]\nPlayer Name: Aimazing (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 70899408), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-27 23:06:33'),
(53,151,'Debug Assertion 8.60 Communication.cpp 2792','Wed May 27 20:36:53 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 140 180 132 131 106 108 131 131 131\nLast Packet: 170 047 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [462,52,13]\nPlayer Name: Aimazing (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 69915432), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-28 18:50:29'),
(54,179,'Debug Assertion 8.60 Communication.cpp 2792','Wed May 27 20:36:53 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 140 180 132 131 106 108 131 131 131\nLast Packet: 170 047 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [462,52,13]\nPlayer Name: Aimazing (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 69915432), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-28 18:51:36'),
(55,192,'Debug Assertion 8.60 NWin32Exception.cpp 50','Thu May 28 17:08:45 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 161 131 161 140 180 132 131 106 108 161\nLast Packet: 131 203 001 051 000 013 004 000 161 040 021 010 000 021 069 010\nPlayer Position: [458,52,13]\nPlayer Name: Kina Of King (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nPlayer.cpp 465: exception occurred, reason:\nControl.cpp 1728: exception occurred (MessageType: 0 MaW: 42C83C8 MoW: 0), reason:\nControl.cpp 1723: exception occurred, reason:\nControl.cpp 386: exception occurred (Force?1:0 = 0), reason:\nMainWindow.cpp 138: exception occurred (Surface = 1), reason:\nNWin32Exception.cpp 50: win32 exception occurred, reason:\naccess violation (write attempt at 4EA5B499)','Comment: ','2026-05-28 20:11:24'),
(56,151,'Debug Assertion 8.60 Communication.cpp 2792','Thu May 28 17:57:20 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows 7 Business Edition 64 Bit in BRA\nProcessor: Intel Pentium G2030 @ 3\nVideo Card: NVIDIA GeForce 210\nLast Packet Types: 170 102 103 109 109 102 109 103 109 102\nLast Packet: 170 005 000 000 000 010 000 065 068 077 032 080 101 115 097 100\nPlayer Position: [36,648,7]\nPlayer Name: Cimed (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nNetwork.cpp 946: exception occurred (ErrorCode = 0), reason:\nControl.cpp 1331: exception occurred (Type = 170) (MainWindow = 72511792), reason:\nCommunication.cpp 2798: exception occurred (Mode = 0) (Channel = 0), reason:\nCommunication.cpp 2792: unknown talk mode (Mode = 0), reason:\n[bug0000649]','Comment: ','2026-05-28 21:00:06'),
(57,4,'Debug Assertion 8.60 NWin32Exception.cpp 50','Thu May 28 23:16:54 2026','Graphic Engine: DirectX9 (2)\nOperating System: Windows Vista Family in BRA\nProcessor: Intel Core i5 -3470 @ 3\nVideo Card: Intel (R) HD GR\nLast Packet Types: 160 162 143 180 160 160 180 162 146 180\nLast Packet: 160 100 000 000 000 100 000 000 000 064 066 015 000 000 000 000\nPlayer Position: [192,6,7]\nPlayer Name: ADM Pesado (Baiak Pesado)\nPlayer Action: 056 050 046 051 056 046 050 056 046 049 052 054 058 055 049 055 050\nPlayer.cpp 361: exception occurred, reason:\nMainFrm.cpp 508: exception occurred (nIDEvent = 1), reason:\nControl.cpp 1437: exception occurred, reason:\nGUI.cpp 1033: exception occurred (i = 0), reason:\nGUI.cpp 1093: exception occurred (elapsed = 127), reason:\nGUI.cpp 2090: exception occurred, reason:\nNWin32Exception.cpp 50: win32 exception occurred, reason:\naccess violation (read attempt at 000000CF)','Comment: ','2026-05-29 02:17:21');
/*!40000 ALTER TABLE `player_debugasserts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_depotitems`
--

DROP TABLE IF EXISTS `player_depotitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_depotitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) unsigned NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  CONSTRAINT `player_depotitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_depotitems`
--

LOCK TABLES `player_depotitems` WRITE;
/*!40000 ALTER TABLE `player_depotitems` DISABLE KEYS */;
INSERT INTO `player_depotitems` VALUES
(4,101,1,2595,1,'(\0Reward from boss: boss dazed leaf golem.'),
(56,101,1,2595,1,'#\0Reward from boss: boss blood beast.'),
(56,102,1,2595,1,'(\0Reward from boss: boss dazed leaf golem.'),
(56,103,1,2595,1,'-\0Reward from boss: boss deathling spellsinger.'),
(56,104,1,2595,1,'$\0Reward from boss: boss feral sphinx.'),
(56,105,1,2595,1,'#\0Reward from boss: boss glooth bomb.'),
(56,106,1,2595,1,'&\0Reward from boss: boss ripper spectre.'),
(56,107,1,2595,1,'!\0Reward from boss: boss manticore.'),
(56,108,1,2595,1,'\0Reward from boss: boss lamassu.'),
(56,109,1,2595,1,'+\0Reward from boss: boss knowledge elemental.'),
(56,110,1,2595,1,'(\0Reward from boss: boss animated feather.'),
(56,111,1,2595,1,',\0Reward from boss: boss black sphinx acolyte.'),
(56,112,1,2595,1,'\0Reward from boss: boss brokul.'),
(56,113,1,2595,1,')\0Reward from boss: boss burning gladiator.'),
(56,114,1,2595,1,'(\0Reward from boss: boss humongous fungus.'),
(56,115,1,2595,1,' \0Reward from boss: boss ink blob.'),
(56,116,1,2595,1,'#\0Reward from boss: boss thanatursus.'),
(56,117,1,2595,1,')\0Reward from boss: boss sun marked goanna.'),
(56,118,1,2595,1,'\0Reward from boss: boss sphinx.'),
(56,119,1,2595,1,'%\0Reward from boss: boss rot elemental.'),
(56,120,1,2595,1,')\0Reward from boss: boss burning gladiator.'),
(56,121,101,2152,24,''),
(56,122,101,7443,1,''),
(56,123,101,12435,1,''),
(56,124,101,2346,1,''),
(56,125,101,9971,7,''),
(56,126,102,2152,13,'\r'),
(56,127,102,9004,1,'à\0\0'),
(56,128,102,12435,1,''),
(56,129,102,10559,1,''),
(56,130,102,9971,16,''),
(56,131,103,2152,18,''),
(56,132,103,9004,1,'à\0\0'),
(56,133,103,12614,1,''),
(56,134,103,2346,1,''),
(56,135,103,9971,5,''),
(56,136,104,2152,28,''),
(56,137,104,12435,1,''),
(56,138,104,2346,1,''),
(56,139,104,9971,13,'\r'),
(56,140,105,2152,10,'\n'),
(56,141,105,12614,1,''),
(56,142,105,2346,1,''),
(56,143,105,9971,8,''),
(56,144,106,2152,21,''),
(56,145,106,9971,3,''),
(56,146,106,2346,1,''),
(56,147,106,2160,29,''),
(56,148,106,10559,1,''),
(56,149,107,2152,16,''),
(56,150,107,9971,3,''),
(56,151,107,12435,1,''),
(56,152,107,2160,75,'K'),
(56,153,107,10559,1,''),
(56,154,108,2152,37,'%'),
(56,155,108,9971,4,''),
(56,156,108,12435,1,''),
(56,157,108,7443,2,''),
(56,158,109,2152,22,''),
(56,159,109,8978,1,''),
(56,160,109,12435,1,''),
(56,161,109,9971,12,''),
(56,162,109,7443,1,''),
(56,163,110,2152,36,'$'),
(56,164,110,7443,1,''),
(56,165,111,2152,11,''),
(56,166,111,7440,1,''),
(56,167,111,12435,1,''),
(56,168,111,9971,28,''),
(56,169,111,10559,1,''),
(56,170,112,2152,25,''),
(56,171,112,8978,1,''),
(56,172,112,7440,1,''),
(56,173,112,7443,2,''),
(56,174,113,2152,25,''),
(56,175,113,9971,1,''),
(56,176,113,12435,1,''),
(56,177,113,7443,2,''),
(56,178,114,2152,21,''),
(56,179,114,9004,1,'à\0\0'),
(56,180,114,12435,1,''),
(56,181,114,9971,19,''),
(56,182,114,10559,1,''),
(56,183,115,2152,12,''),
(56,184,115,7443,1,''),
(56,185,115,12614,1,''),
(56,186,115,10559,1,''),
(56,187,115,9971,2,''),
(56,188,116,2152,38,'&'),
(56,189,116,12435,1,''),
(56,190,116,2346,1,''),
(56,191,116,9971,23,''),
(56,192,117,2152,11,''),
(56,193,117,12614,1,''),
(56,194,117,10559,1,''),
(56,195,117,9971,15,''),
(56,196,118,2152,12,''),
(56,197,118,12435,1,''),
(56,198,118,9971,62,'>'),
(56,199,118,10559,1,''),
(56,200,119,2152,13,'\r'),
(56,201,119,12435,1,''),
(56,202,119,10559,1,''),
(56,203,119,9971,22,''),
(56,204,120,2152,22,''),
(62,101,1,11244,1,''),
(62,102,1,11244,1,''),
(62,103,1,11244,1,''),
(64,101,1,2595,1,'!\0Reward from boss: boss manticore.'),
(64,102,1,2595,1,'(\0Reward from boss: boss animated feather.'),
(64,103,1,2595,1,'#\0Reward from boss: boss thanatursus.'),
(64,104,1,2595,1,')\0Reward from boss: boss sun marked goanna.'),
(64,105,1,2595,1,'\0Reward from boss: boss sphinx.'),
(64,106,1,2595,1,'%\0Reward from boss: boss rot elemental.'),
(64,107,1,2595,1,'(\0Reward from boss: boss humongous fungus.'),
(64,108,1,2595,1,' \0Reward from boss: boss ink blob.'),
(64,109,1,2595,1,'#\0Reward from boss: boss thanatursus.'),
(64,110,1,2595,1,')\0Reward from boss: boss sun marked goanna.'),
(64,111,1,2595,1,'\0Reward from boss: boss sphinx.'),
(64,112,1,2595,1,'%\0Reward from boss: boss rot elemental.'),
(64,113,101,2152,29,''),
(64,114,101,2157,10,'\n'),
(64,115,101,2160,11,''),
(64,116,101,10559,1,''),
(64,117,102,2152,19,''),
(64,118,102,9971,1,''),
(64,119,102,2346,1,''),
(64,120,102,7443,2,''),
(64,121,103,2152,18,''),
(64,122,103,10559,1,''),
(64,123,104,2152,39,'\''),
(64,124,105,2152,25,''),
(64,125,105,9971,1,''),
(64,126,106,2152,13,'\r'),
(64,127,106,10559,1,''),
(64,128,107,2152,14,''),
(64,129,108,2152,37,'%'),
(64,130,109,2152,18,''),
(64,131,110,2152,16,''),
(64,132,110,10559,1,''),
(64,133,111,2152,39,'\''),
(64,134,112,2152,10,'\n'),
(67,101,1,2595,1,' \0Reward from boss: boss ink blob.'),
(67,102,1,2595,1,')\0Reward from boss: boss burning gladiator.'),
(67,103,1,2595,1,'\0Reward from boss: boss brokul.'),
(67,104,101,2152,16,''),
(67,105,102,2152,15,''),
(67,106,102,10559,1,''),
(67,107,103,2152,22,''),
(75,101,0,2353,1,'\r∑\0'),
(75,102,0,2123,1,''),
(75,103,0,2123,1,''),
(75,104,0,11303,1,''),
(75,105,0,11303,1,''),
(75,106,0,2495,1,''),
(75,107,0,2495,1,''),
(75,108,0,2495,1,''),
(75,109,0,6537,1,''),
(75,110,1,8879,1,''),
(75,111,1,2421,1,''),
(75,112,1,5919,2,''),
(75,113,1,5903,1,''),
(75,114,1,2112,1,''),
(75,115,1,2421,1,''),
(75,116,1,5943,3,''),
(75,117,1,1988,1,''),
(75,118,1,7388,1,''),
(75,119,117,2522,1,''),
(75,120,117,7412,1,''),
(75,121,117,7388,1,''),
(75,122,117,7412,1,''),
(75,123,117,7388,1,''),
(75,124,117,7412,1,''),
(75,125,117,7388,1,''),
(75,126,117,2415,1,''),
(75,127,117,7388,1,''),
(75,128,117,7411,1,''),
(75,129,117,2453,1,''),
(75,130,117,5461,1,''),
(75,131,117,2112,1,''),
(75,132,117,6540,1,''),
(75,133,117,2452,1,''),
(75,134,117,7431,1,''),
(75,135,117,5943,1,''),
(75,136,117,2421,1,''),
(114,101,1,2595,1,'&\0Reward from boss: boss ripper spectre.'),
(114,102,1,2595,1,')\0Reward from boss: boss sun marked goanna.'),
(114,103,1,2595,1,'\0Reward from boss: boss sphinx.'),
(114,104,101,2152,32,' '),
(114,105,101,9971,1,''),
(114,106,101,2160,39,'\''),
(114,107,102,2152,29,''),
(114,108,102,12614,1,''),
(114,109,102,2346,1,''),
(114,110,102,9971,12,''),
(114,111,103,2152,34,'\"'),
(114,112,103,9971,2,''),
(114,113,103,2346,1,''),
(114,114,103,2160,36,'$'),
(176,101,1,2595,1,'%\0Reward from boss: boss rot elemental.'),
(176,102,101,2152,34,'\"');
/*!40000 ALTER TABLE `player_depotitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_depotlockeritems`
--

DROP TABLE IF EXISTS `player_depotlockeritems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_depotlockeritems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'any given range eg 0-100 will be reserved for depot lockers and all > 100 will be then normal items inside depots',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(6) NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  CONSTRAINT `player_depotlockeritems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_depotlockeritems`
--

LOCK TABLES `player_depotlockeritems` WRITE;
/*!40000 ALTER TABLE `player_depotlockeritems` DISABLE KEYS */;
INSERT INTO `player_depotlockeritems` VALUES
(64,101,1,1988,1,''),
(64,102,101,7364,1,''),
(64,103,101,8849,1,''),
(64,104,101,7618,1,''),
(64,105,101,7620,1,''),
(69,101,1,1988,1,''),
(69,102,1,2124,1,''),
(69,103,101,2453,1,''),
(69,104,101,2120,1,''),
(69,105,101,2554,1,''),
(69,106,101,2789,41,')'),
(155,101,1,9775,1,''),
(155,102,1,10310,1,''),
(155,103,1,2173,1,'\0'),
(155,104,1,2120,1,''),
(155,105,1,2173,1,'\0'),
(155,106,1,5950,1,''),
(155,107,1,2157,10,'\n'),
(155,108,101,2446,1,''),
(155,109,106,2641,1,''),
(155,110,106,9777,1,''),
(155,111,106,2123,1,''),
(155,112,106,12318,1,''),
(155,113,106,12647,1,''),
(155,114,106,9776,1,''),
(155,115,106,11393,1,''),
(155,116,106,9778,1,'');
/*!40000 ALTER TABLE `player_depotlockeritems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_inboxitems`
--

DROP TABLE IF EXISTS `player_inboxitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_inboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) unsigned NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  CONSTRAINT `player_inboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_inboxitems`
--

LOCK TABLES `player_inboxitems` WRITE;
/*!40000 ALTER TABLE `player_inboxitems` DISABLE KEYS */;
INSERT INTO `player_inboxitems` VALUES
(62,101,1,2446,1,'');
/*!40000 ALTER TABLE `player_inboxitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_items`
--

DROP TABLE IF EXISTS `player_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_items` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `pid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) unsigned NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  KEY `player_id` (`player_id`),
  KEY `sid` (`sid`),
  CONSTRAINT `player_items_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_items`
--

LOCK TABLES `player_items` WRITE;
/*!40000 ALTER TABLE `player_items` DISABLE KEYS */;
INSERT INTO `player_items` VALUES
(33,1,101,2457,1,''),
(33,3,102,1988,1,''),
(33,4,103,2463,1,''),
(33,5,104,7364,4,''),
(33,6,105,2516,1,''),
(33,7,106,2647,1,''),
(33,10,107,2124,1,''),
(33,102,108,1988,1,''),
(33,102,109,1988,1,''),
(33,102,110,2120,1,''),
(33,102,111,2554,1,''),
(33,102,112,7618,1,''),
(33,102,113,7620,1,''),
(33,102,114,2157,5,''),
(33,102,115,2789,50,'2'),
(33,108,116,7618,1,''),
(33,108,117,7620,1,''),
(33,108,118,2157,5,''),
(33,108,119,2789,50,'2'),
(33,109,120,2120,1,''),
(33,109,121,2554,1,''),
(33,109,122,7618,1,''),
(33,109,123,7620,1,''),
(33,109,124,2157,5,''),
(33,109,125,2789,50,'2'),
(44,1,101,2457,1,''),
(44,3,102,1988,1,''),
(44,4,103,2463,1,''),
(44,5,104,2453,1,''),
(44,6,105,2516,1,''),
(44,7,106,2647,1,''),
(44,10,107,2124,1,''),
(44,102,108,1988,1,''),
(44,102,109,1988,1,''),
(44,102,110,2120,1,''),
(44,102,111,2554,1,''),
(44,102,112,7618,1,''),
(44,102,113,7620,1,''),
(44,102,114,2157,5,''),
(44,102,115,2789,50,'2'),
(44,108,116,7618,1,''),
(44,108,117,7620,1,''),
(44,108,118,2157,5,''),
(44,109,119,2120,1,''),
(44,109,120,2554,1,''),
(44,109,121,7618,1,''),
(44,109,122,7620,1,''),
(44,109,123,2157,5,''),
(44,109,124,2789,50,'2'),
(48,1,101,2457,1,''),
(48,3,102,1988,1,''),
(48,4,103,2463,1,''),
(48,5,104,7364,2,''),
(48,6,105,2516,1,''),
(48,7,106,2647,1,''),
(48,10,107,2124,1,''),
(48,102,108,1988,1,''),
(48,102,109,2120,1,''),
(48,102,110,2554,1,''),
(48,102,111,7618,1,''),
(48,102,112,7620,1,''),
(48,102,113,2157,5,''),
(48,102,114,2789,50,'2'),
(48,108,115,2120,1,''),
(48,108,116,2554,1,''),
(48,108,117,7618,1,''),
(48,108,118,7620,1,''),
(48,108,119,2157,5,''),
(48,108,120,2789,50,'2'),
(49,1,101,2457,1,''),
(49,3,102,1988,1,''),
(49,4,103,2463,1,''),
(49,5,104,2453,1,''),
(49,6,105,2516,1,''),
(49,7,106,2647,1,''),
(49,10,107,2124,1,''),
(49,102,108,1988,1,''),
(49,102,109,2120,1,''),
(49,102,110,2554,1,''),
(49,102,111,7618,1,''),
(49,102,112,7620,1,''),
(49,102,113,2157,5,''),
(49,102,114,2789,50,'2'),
(49,108,115,2120,1,''),
(49,108,116,2554,1,''),
(49,108,117,7618,1,''),
(49,108,118,7620,1,''),
(49,108,119,2157,5,''),
(49,108,120,2789,50,'2'),
(50,1,101,2457,1,''),
(50,3,102,1988,1,''),
(50,4,103,2463,1,''),
(50,5,104,2453,1,''),
(50,6,105,2516,1,''),
(50,7,106,2647,1,''),
(50,10,107,2124,1,''),
(50,102,108,1988,1,''),
(50,102,109,2120,1,''),
(50,102,110,2554,1,''),
(50,102,111,7618,1,''),
(50,102,112,7620,1,''),
(50,102,113,2157,5,''),
(50,102,114,2789,50,'2'),
(50,108,115,2120,1,''),
(50,108,116,2554,1,''),
(50,108,117,7618,1,''),
(50,108,118,7620,1,''),
(50,108,119,2157,5,''),
(50,108,120,2789,50,'2'),
(55,1,101,2457,1,''),
(55,3,102,1988,1,''),
(55,4,103,2463,1,''),
(55,5,104,2453,1,''),
(55,6,105,2516,1,''),
(55,7,106,2647,1,''),
(55,10,107,2124,1,''),
(55,102,108,2120,1,''),
(55,102,109,2554,1,''),
(55,102,110,7618,1,''),
(55,102,111,7620,1,''),
(55,102,112,2157,5,''),
(55,102,113,2789,50,'2'),
(54,1,101,2457,1,''),
(54,2,102,2173,1,'\0'),
(54,3,103,1988,1,''),
(54,4,104,2463,1,''),
(54,5,105,2453,1,''),
(54,6,106,2516,1,''),
(54,7,107,2647,1,''),
(54,8,108,2195,1,''),
(54,10,109,2124,1,''),
(54,103,110,2195,1,''),
(54,103,111,2173,1,'\0'),
(54,103,112,2120,1,''),
(54,103,113,2554,1,''),
(54,103,114,7618,1,''),
(54,103,115,7620,1,''),
(54,103,116,2157,5,''),
(54,103,117,2789,50,'2'),
(58,1,101,2457,1,''),
(58,3,102,1988,1,''),
(58,4,103,8871,1,''),
(58,5,104,2453,1,''),
(58,6,105,2514,1,''),
(58,7,106,2647,1,''),
(58,8,107,2195,1,''),
(58,9,108,2124,1,''),
(58,102,109,8904,1,''),
(58,102,110,2195,1,''),
(58,102,111,2112,1,''),
(58,102,112,2269,1,''),
(58,102,113,2293,1,''),
(58,102,114,2273,1,''),
(58,102,115,2268,1,''),
(58,102,116,7590,1,''),
(58,102,117,2160,98,'b'),
(58,102,118,2120,1,''),
(58,102,119,2554,1,''),
(58,102,120,2157,4,''),
(58,102,121,2789,38,'&'),
(60,1,101,2457,1,''),
(60,3,102,1988,1,''),
(60,4,103,2463,1,''),
(60,5,104,7364,1,''),
(60,6,105,2516,1,''),
(60,7,106,2647,1,''),
(60,10,107,2124,1,''),
(60,102,108,2120,1,''),
(60,102,109,2554,1,''),
(60,102,110,7618,1,''),
(60,102,111,7620,1,''),
(60,102,112,2157,5,''),
(60,102,113,2789,50,'2'),
(65,1,101,2457,1,''),
(65,3,102,1988,1,''),
(65,4,103,2463,1,''),
(65,5,104,2516,1,''),
(65,6,105,7364,1,''),
(65,7,106,2647,1,''),
(65,9,107,2124,1,''),
(65,102,108,2120,1,''),
(65,102,109,2554,1,''),
(65,102,110,7618,1,''),
(65,102,111,7620,1,''),
(65,102,112,2157,5,''),
(65,102,113,2789,50,'2'),
(72,1,101,2457,1,''),
(72,2,102,2173,1,'\0'),
(72,3,103,1988,1,''),
(72,4,104,2463,1,''),
(72,5,105,8849,1,''),
(72,7,106,2647,1,''),
(72,9,107,2124,1,''),
(72,10,108,7364,1,''),
(72,103,109,2516,1,''),
(72,103,110,2160,98,'b'),
(72,103,111,2120,1,''),
(72,103,112,2554,1,''),
(72,103,113,7618,1,''),
(72,103,114,7620,1,''),
(72,103,115,2157,4,''),
(72,103,116,2789,44,','),
(80,1,101,2457,1,''),
(80,3,102,1988,1,''),
(80,4,103,8871,1,''),
(80,5,104,2453,1,''),
(80,6,105,2516,1,''),
(80,7,106,2647,1,''),
(80,8,107,2195,1,''),
(80,10,108,2124,1,''),
(80,102,109,2120,1,''),
(80,102,110,2554,1,''),
(80,102,111,7618,1,''),
(80,102,112,7620,1,''),
(80,102,113,2157,5,''),
(80,102,114,2789,48,'0'),
(81,1,101,2457,1,''),
(81,2,102,2173,1,'\0'),
(81,3,103,1988,1,''),
(81,4,104,2463,1,''),
(81,5,105,8849,1,''),
(81,7,106,2647,1,''),
(81,8,107,2195,1,''),
(81,9,108,2124,1,''),
(81,10,109,7364,1,''),
(81,103,110,2516,1,''),
(81,103,111,2120,1,''),
(81,103,112,2554,1,''),
(81,103,113,7618,1,''),
(81,103,114,7620,1,''),
(81,103,115,2157,5,''),
(62,1,101,2498,1,''),
(62,2,102,2173,1,'\0'),
(62,3,103,11244,1,''),
(62,4,104,2472,1,''),
(62,5,105,2522,1,''),
(62,6,106,7417,1,''),
(62,7,107,2470,1,''),
(62,8,108,2195,1,''),
(62,10,109,2157,21,''),
(62,103,110,2152,40,'('),
(62,103,111,2160,7,''),
(62,103,112,2160,100,'d'),
(62,103,113,10521,1,''),
(62,103,114,9774,1,''),
(62,103,115,3940,1,''),
(62,103,116,10522,1,''),
(62,103,117,2789,77,'M'),
(62,103,118,7620,1,''),
(62,103,119,8473,1,''),
(86,1,101,2457,1,''),
(86,2,102,2173,1,'\0'),
(86,3,103,1988,1,''),
(86,4,104,2463,1,''),
(86,6,105,8849,1,''),
(86,7,106,7730,1,''),
(86,8,107,2195,1,''),
(86,9,108,2124,1,''),
(86,10,109,7364,1,''),
(86,103,110,2160,99,'c'),
(86,103,111,2516,1,''),
(86,103,112,2120,1,''),
(86,103,113,2554,1,''),
(86,103,114,7618,2,''),
(86,103,115,7620,1,''),
(86,103,116,2157,4,''),
(86,103,117,2789,45,'-'),
(78,1,101,2457,1,''),
(78,3,102,1988,1,''),
(78,4,103,2463,1,''),
(78,6,104,8849,1,''),
(78,7,105,2647,1,''),
(78,8,106,2195,1,''),
(78,9,107,2124,1,''),
(78,10,108,7364,1,''),
(78,102,109,2167,1,''),
(78,102,110,2148,60,'<'),
(78,102,111,2152,34,'\"'),
(78,102,112,2165,1,''),
(78,102,113,2160,32,' '),
(78,102,114,2293,1,''),
(78,102,115,8472,1,''),
(78,102,116,2120,1,''),
(88,1,101,2457,1,''),
(88,2,102,2173,1,'\0'),
(88,3,103,1988,1,''),
(88,4,104,2463,1,''),
(88,5,105,2453,1,''),
(88,6,106,2516,1,''),
(88,7,107,2647,1,''),
(88,8,108,2195,1,''),
(88,9,109,2124,1,''),
(88,10,110,2160,98,'b'),
(88,103,111,2120,1,''),
(88,103,112,2554,1,''),
(88,103,113,7618,1,''),
(88,103,114,7620,1,''),
(88,103,115,2789,50,'2'),
(90,1,101,2457,1,''),
(90,2,102,2173,1,'\0'),
(90,3,103,1988,1,''),
(90,4,104,2463,1,''),
(90,5,105,2453,1,''),
(90,6,106,2516,1,''),
(90,7,107,2647,1,''),
(90,10,108,2124,1,''),
(90,103,109,2160,99,'c'),
(90,103,110,2120,1,''),
(90,103,111,2554,1,''),
(90,103,112,7618,1,''),
(90,103,113,7620,1,''),
(90,103,114,2157,4,''),
(90,103,115,2789,50,'2'),
(92,1,101,2457,1,''),
(92,2,102,2173,1,'\0'),
(92,3,103,1988,1,''),
(92,4,104,2463,1,''),
(92,6,105,8849,1,''),
(92,7,106,2647,1,''),
(92,8,107,2195,1,''),
(92,9,108,2124,1,''),
(92,10,109,7364,1,''),
(92,103,110,2160,100,'d'),
(92,103,111,2160,100,'d'),
(92,103,112,7618,1,''),
(92,103,113,7620,1,''),
(92,103,114,2157,3,''),
(92,103,115,2789,46,'.'),
(94,1,101,2457,1,''),
(94,3,102,1988,1,''),
(94,4,103,2463,1,''),
(94,5,104,7364,1,''),
(94,6,105,2516,1,''),
(94,7,106,2647,1,''),
(94,10,107,2124,1,''),
(94,102,108,2120,1,''),
(94,102,109,2554,1,''),
(94,102,110,7618,1,''),
(94,102,111,7620,1,''),
(94,102,112,2157,5,''),
(94,102,113,2789,50,'2'),
(96,3,101,1987,1,''),
(96,4,102,2463,1,''),
(96,5,103,2453,1,''),
(96,6,104,2516,1,''),
(96,10,105,2124,1,''),
(97,1,101,2457,1,''),
(97,3,102,1988,1,''),
(97,4,103,2463,1,''),
(97,5,104,2453,1,''),
(97,6,105,2516,1,''),
(97,7,106,2647,1,''),
(97,10,107,2124,1,''),
(97,102,108,2120,1,''),
(97,102,109,2554,1,''),
(97,102,110,7618,1,''),
(97,102,111,7620,1,''),
(97,102,112,2157,5,''),
(97,102,113,2789,50,'2'),
(61,1,101,2457,1,''),
(61,2,102,2173,1,'\0'),
(61,3,103,1988,1,''),
(61,4,104,2466,1,''),
(61,5,105,8926,1,''),
(61,6,106,2516,1,''),
(61,7,107,2470,1,''),
(61,8,108,2195,1,''),
(61,10,109,2124,1,''),
(61,103,110,2514,1,''),
(61,103,111,1988,1,''),
(61,103,112,7417,1,''),
(61,103,113,8473,1,''),
(61,103,114,2160,83,'S'),
(61,103,115,2120,1,''),
(61,103,116,2554,1,''),
(61,103,117,7620,1,''),
(61,111,118,1988,1,''),
(61,118,119,1988,1,''),
(98,1,101,2457,1,''),
(98,2,102,2173,1,'\0'),
(98,3,103,1988,1,''),
(98,4,104,2463,1,''),
(98,5,105,8849,1,''),
(98,7,106,2647,1,''),
(98,8,107,2195,1,''),
(98,9,108,2124,1,''),
(98,10,109,7364,1,''),
(98,103,110,2516,1,''),
(98,103,111,2120,1,''),
(98,103,112,2554,1,''),
(98,103,113,7618,1,''),
(98,103,114,7620,1,''),
(98,103,115,2157,5,''),
(98,103,116,2789,50,'2'),
(89,1,101,2457,1,''),
(89,3,102,1988,1,''),
(89,4,103,2463,1,''),
(89,5,104,2456,1,''),
(89,7,105,2647,1,''),
(89,9,106,2124,1,''),
(89,10,107,7364,1,''),
(89,102,108,2516,1,''),
(89,102,109,2152,98,'b'),
(89,102,110,2160,91,'['),
(89,102,111,2120,1,''),
(89,102,112,2554,1,''),
(89,102,113,2157,4,''),
(89,102,114,2789,50,'2'),
(101,3,101,1987,1,''),
(100,1,101,2457,1,''),
(100,3,102,1987,1,''),
(100,6,103,2514,1,''),
(100,7,104,2647,1,''),
(100,8,105,2195,1,''),
(104,1,101,2457,1,''),
(104,3,102,1988,1,''),
(104,4,103,2463,1,''),
(104,5,104,2453,1,''),
(104,6,105,2516,1,''),
(104,7,106,2647,1,''),
(104,10,107,2124,1,''),
(104,102,108,2120,1,''),
(104,102,109,2554,1,''),
(104,102,110,7618,1,''),
(104,102,111,7620,1,''),
(104,102,112,2157,5,''),
(104,102,113,2789,50,'2'),
(91,1,101,2457,1,''),
(91,2,102,2173,1,'\0'),
(91,3,103,1988,1,''),
(91,4,104,2463,1,''),
(91,6,105,8849,1,''),
(91,7,106,2647,1,''),
(91,8,107,2195,1,''),
(91,10,108,7364,1,''),
(91,103,109,2160,96,'`'),
(91,103,110,2124,1,''),
(91,103,111,2516,1,''),
(91,103,112,7618,1,''),
(91,103,113,7620,1,''),
(91,103,114,2157,4,''),
(91,103,115,2789,47,'/'),
(31,1,101,11302,1,''),
(31,2,102,2173,1,'\0'),
(31,3,103,1988,1,''),
(31,4,104,11301,1,''),
(31,5,105,7424,1,''),
(31,6,106,2516,1,''),
(31,7,107,11304,1,''),
(31,8,108,11303,1,''),
(31,9,109,2204,1,''),
(31,10,110,2124,1,''),
(31,103,111,2148,44,','),
(31,103,112,2152,99,'c'),
(31,103,113,2160,95,'_'),
(31,103,114,2157,7,''),
(31,103,115,2647,1,''),
(31,103,116,2293,1,''),
(31,103,117,2268,1,''),
(31,103,118,2269,1,''),
(31,103,119,2453,1,''),
(31,103,120,7590,1,''),
(31,103,121,1988,1,''),
(31,103,122,1988,1,''),
(31,103,123,2120,1,''),
(31,103,124,2554,1,''),
(31,103,125,2789,50,'2'),
(31,121,126,7618,1,''),
(31,121,127,7620,1,''),
(31,122,128,2120,1,''),
(31,122,129,2554,1,''),
(31,122,130,7618,1,''),
(31,122,131,7620,1,''),
(31,122,132,2789,50,'2'),
(105,1,101,2457,1,''),
(105,3,102,1988,1,''),
(105,4,103,2463,1,''),
(105,5,104,2453,1,''),
(105,6,105,2516,1,''),
(105,7,106,2647,1,''),
(105,10,107,2124,1,''),
(105,102,108,2120,1,''),
(105,102,109,2554,1,''),
(105,102,110,7618,1,''),
(105,102,111,7620,1,''),
(105,102,112,2157,5,''),
(105,102,113,2789,50,'2'),
(106,1,101,2457,1,''),
(106,3,102,1988,1,''),
(106,4,103,2463,1,''),
(106,5,104,2453,1,''),
(106,6,105,2516,1,''),
(106,7,106,2647,1,''),
(106,10,107,2124,1,''),
(106,102,108,2160,92,'\\'),
(106,102,109,2120,1,''),
(106,102,110,2554,1,''),
(106,102,111,7618,1,''),
(106,102,112,7620,1,''),
(106,102,113,2157,4,''),
(106,102,114,2789,50,'2'),
(82,1,101,2457,1,''),
(82,2,102,2173,1,'\0'),
(82,3,103,1988,1,''),
(82,4,104,2463,1,''),
(82,5,105,2453,1,''),
(82,6,106,2516,1,''),
(82,7,107,2647,1,''),
(82,8,108,2195,1,''),
(82,10,109,2124,1,''),
(82,103,110,2148,10,'\n'),
(82,103,111,2152,95,'_'),
(82,103,112,1988,1,''),
(82,103,113,2268,1,''),
(82,103,114,2160,96,'`'),
(82,103,115,7590,1,''),
(82,103,116,2120,1,''),
(82,103,117,2554,1,''),
(82,103,118,7618,1,''),
(82,103,119,7620,1,''),
(82,103,120,2157,4,''),
(82,103,121,2789,50,'2'),
(85,1,101,11302,1,''),
(85,2,102,2173,1,'\0'),
(85,3,103,1988,1,''),
(85,4,104,11301,1,''),
(85,5,105,2514,1,''),
(85,6,106,7368,1,''),
(85,7,107,11304,1,''),
(85,8,108,11303,1,''),
(85,10,109,7364,1,''),
(85,103,110,2152,92,'\\'),
(85,103,111,2160,95,'_'),
(85,103,112,2167,1,''),
(85,103,113,2472,1,''),
(85,103,114,12328,1,''),
(85,103,115,2167,1,''),
(85,103,116,1988,1,''),
(85,103,117,8472,1,''),
(85,103,118,2120,1,''),
(85,103,119,2554,1,''),
(85,103,120,7620,1,''),
(85,103,121,2789,5,''),
(85,116,122,8849,1,''),
(85,116,123,2167,1,''),
(85,116,124,1988,1,''),
(85,116,125,1988,1,''),
(85,116,126,1988,1,''),
(85,116,127,1988,1,''),
(84,1,101,11302,1,''),
(84,2,102,2173,1,'\0'),
(84,3,103,11244,1,''),
(84,4,104,11301,1,''),
(84,5,105,2516,1,''),
(84,6,106,7424,1,''),
(84,7,107,11304,1,''),
(84,8,108,11303,1,''),
(84,103,109,2514,1,''),
(84,103,110,2472,1,''),
(84,103,111,11244,1,''),
(84,103,112,2160,17,''),
(84,103,113,2157,39,'\''),
(84,111,114,11244,1,''),
(84,111,115,11244,1,''),
(84,111,116,11244,1,''),
(84,111,117,11244,1,''),
(84,111,118,11244,1,''),
(84,111,119,11244,1,''),
(84,111,120,11244,1,''),
(84,111,121,11244,1,''),
(84,111,122,11244,1,''),
(84,111,123,11244,1,''),
(84,111,124,11244,1,''),
(84,111,125,11244,1,''),
(84,111,126,11244,1,''),
(84,111,127,11244,1,''),
(84,111,128,11244,1,''),
(84,111,129,11244,1,''),
(84,111,130,11244,1,''),
(84,111,131,11244,1,''),
(84,111,132,11244,1,''),
(84,111,133,11244,1,''),
(84,111,134,1988,1,''),
(84,111,135,11244,1,''),
(84,134,136,2268,1,''),
(84,134,137,7590,1,''),
(84,134,138,2554,1,''),
(84,134,139,2789,18,''),
(83,1,101,11302,1,''),
(83,2,102,2173,1,'\0'),
(83,3,103,1988,1,''),
(83,4,104,11301,1,''),
(83,5,105,2514,1,''),
(83,6,106,7417,1,''),
(83,7,107,11304,1,''),
(83,8,108,11303,1,''),
(83,10,109,2514,1,''),
(83,103,110,2160,10,'\n'),
(83,103,111,2173,1,'\0'),
(83,103,112,8473,1,''),
(83,103,113,2173,1,'\0'),
(83,103,114,2554,1,''),
(83,103,115,7620,1,''),
(83,103,116,2789,6,''),
(107,1,101,5903,1,''),
(107,2,102,2171,1,''),
(107,3,103,1988,1,''),
(107,4,104,8871,1,''),
(107,5,105,2522,1,''),
(107,6,106,7424,1,''),
(107,8,107,2195,1,''),
(107,9,108,2124,1,''),
(107,10,109,7590,1,''),
(107,103,110,2148,30,''),
(107,103,111,2152,68,'D'),
(107,103,112,2160,35,'#'),
(107,103,113,2157,8,''),
(107,103,114,5903,1,''),
(107,103,115,2789,37,'%'),
(107,103,116,2554,1,''),
(107,103,117,2120,1,''),
(107,103,118,3940,1,''),
(107,103,119,9774,1,''),
(107,103,120,10522,1,''),
(107,118,121,3940,1,''),
(107,119,122,2293,1,''),
(107,119,123,2268,1,''),
(107,120,124,2457,1,''),
(107,121,125,3940,1,''),
(107,125,126,3940,1,''),
(107,126,127,3940,1,''),
(107,127,128,3940,1,''),
(107,128,129,3940,1,''),
(107,129,130,3940,1,''),
(107,130,131,3940,1,''),
(107,131,132,3940,1,''),
(107,132,133,3940,1,''),
(107,133,134,3940,1,''),
(107,134,135,3940,1,''),
(107,135,136,3940,1,''),
(107,136,137,3940,1,''),
(107,137,138,3940,1,''),
(107,138,139,3940,1,''),
(107,139,140,3940,1,''),
(107,140,141,3940,1,''),
(107,141,142,3940,1,''),
(107,142,143,3940,1,''),
(107,143,144,3940,1,''),
(107,144,145,3940,1,''),
(107,145,146,3940,1,''),
(107,146,147,3940,1,''),
(107,147,148,3940,1,''),
(107,148,149,3940,1,''),
(107,149,150,3940,1,''),
(107,150,151,3940,1,''),
(107,151,152,3940,1,''),
(107,152,153,3940,1,''),
(107,153,154,3940,1,''),
(107,154,155,3940,1,''),
(107,155,156,3940,1,''),
(107,156,157,3940,1,''),
(107,157,158,3940,1,''),
(107,158,159,3940,1,''),
(107,159,160,3940,1,''),
(107,160,161,3940,1,''),
(107,161,162,3940,1,''),
(107,162,163,3940,1,''),
(107,163,164,3940,1,''),
(107,164,165,3940,1,''),
(107,165,166,3940,1,''),
(107,166,167,3940,1,''),
(109,1,101,2457,1,''),
(109,3,102,1988,1,''),
(109,4,103,2463,1,''),
(109,5,104,2453,1,''),
(109,6,105,2516,1,''),
(109,7,106,2647,1,''),
(109,10,107,2124,1,''),
(109,102,108,2120,1,''),
(109,102,109,2554,1,''),
(109,102,110,7618,1,''),
(109,102,111,7620,1,''),
(109,102,112,2157,5,''),
(109,102,113,2789,50,'2'),
(111,1,101,2457,1,''),
(111,3,102,1988,1,''),
(111,4,103,2463,1,''),
(111,5,104,2446,1,''),
(111,6,105,2516,1,''),
(111,7,106,2647,1,''),
(111,10,107,2124,1,''),
(111,102,108,2120,1,''),
(111,102,109,2554,1,''),
(111,102,110,7618,1,''),
(111,102,111,7620,1,''),
(111,102,112,2157,5,''),
(111,102,113,2789,50,'2'),
(112,1,101,2457,1,''),
(112,3,102,1988,1,''),
(112,4,103,2463,1,''),
(112,5,104,7364,1,''),
(112,6,105,2516,1,''),
(112,7,106,2647,1,''),
(112,10,107,2124,1,''),
(112,102,108,2120,1,''),
(112,102,109,2554,1,''),
(112,102,110,7618,1,''),
(112,102,111,7620,1,''),
(112,102,112,2157,5,''),
(112,102,113,2789,50,'2'),
(95,1,101,2457,1,''),
(95,3,102,1988,1,''),
(95,4,103,2463,1,''),
(95,5,104,2453,1,''),
(95,6,105,2516,1,''),
(95,7,106,2647,1,''),
(95,10,107,2124,1,''),
(95,102,108,2120,1,''),
(95,102,109,2554,1,''),
(95,102,110,7618,1,''),
(95,102,111,7620,1,''),
(95,102,112,2157,5,''),
(95,102,113,2789,50,'2'),
(115,1,101,2457,1,''),
(115,3,102,1988,1,''),
(115,4,103,2463,1,''),
(115,6,104,8849,1,''),
(115,7,105,2647,1,''),
(115,10,106,7364,1,''),
(115,102,107,2124,1,''),
(115,102,108,2516,1,''),
(115,102,109,2195,1,''),
(115,102,110,2173,1,'\0'),
(115,102,111,2554,1,''),
(115,102,112,7618,1,''),
(115,102,113,7620,1,''),
(115,102,114,2789,50,'2'),
(117,1,101,2457,1,''),
(117,3,102,1988,1,''),
(117,4,103,2463,1,''),
(117,5,104,7364,1,''),
(117,6,105,2516,1,''),
(117,7,106,2647,1,''),
(117,10,107,2124,1,''),
(117,102,108,2120,1,''),
(117,102,109,2554,1,''),
(117,102,110,7618,1,''),
(117,102,111,7620,1,''),
(117,102,112,2789,50,'2'),
(116,1,101,2457,1,''),
(116,3,102,1988,1,''),
(116,4,103,2463,1,''),
(116,5,104,2453,1,''),
(116,6,105,2516,1,''),
(116,7,106,2647,1,''),
(116,10,107,2124,1,''),
(116,102,108,2120,1,''),
(116,102,109,2554,1,''),
(116,102,110,7618,1,''),
(116,102,111,7620,1,''),
(116,102,112,2789,50,'2'),
(119,1,101,2457,1,''),
(119,3,102,1988,1,''),
(119,4,103,2463,1,''),
(119,5,104,2453,1,''),
(119,6,105,2516,1,''),
(119,7,106,2647,1,''),
(119,10,107,2124,1,''),
(119,102,108,2120,1,''),
(119,102,109,2554,1,''),
(119,102,110,7618,1,''),
(119,102,111,7620,1,''),
(119,102,112,2157,5,''),
(119,102,113,2789,50,'2'),
(120,1,101,2498,1,''),
(120,3,102,1988,1,''),
(120,4,103,2463,1,''),
(120,5,104,2446,1,''),
(120,6,105,2514,1,''),
(120,7,106,2647,1,''),
(120,8,107,2195,1,''),
(120,10,108,2124,1,''),
(120,102,109,2148,50,'2'),
(120,102,110,2152,19,''),
(120,102,111,2160,13,'\r'),
(120,102,112,2516,1,''),
(120,102,113,2164,20,'\0'),
(120,102,114,2164,20,'\0'),
(120,102,115,7589,1,''),
(120,102,116,8473,1,''),
(120,102,117,10521,1,''),
(120,102,118,2160,100,'d'),
(120,102,119,2120,1,''),
(120,102,120,2554,1,''),
(120,102,121,7618,1,''),
(120,102,122,7620,1,''),
(120,102,123,2157,4,''),
(120,102,124,2789,48,'0'),
(120,117,125,2160,31,''),
(120,117,126,2397,1,''),
(120,117,127,7430,1,''),
(120,117,128,2473,1,''),
(120,117,129,1987,1,''),
(120,129,130,2511,1,''),
(120,129,131,2480,1,''),
(120,129,132,2457,1,''),
(120,129,133,2509,1,''),
(110,1,101,2457,1,''),
(110,3,102,1987,1,''),
(110,4,103,11301,1,''),
(110,5,104,2514,1,''),
(110,8,105,2195,1,''),
(127,1,101,2457,1,''),
(127,3,102,1988,1,''),
(127,4,103,2463,1,''),
(127,5,104,2453,1,''),
(127,6,105,2516,1,''),
(127,7,106,2647,1,''),
(127,10,107,2124,1,''),
(127,102,108,2120,1,''),
(127,102,109,2554,1,''),
(127,102,110,7618,1,''),
(127,102,111,7620,1,''),
(127,102,112,2789,50,'2'),
(125,1,101,2457,1,''),
(125,3,102,1988,1,''),
(125,4,103,2463,1,''),
(125,5,104,2453,1,''),
(125,6,105,2516,1,''),
(125,7,106,2647,1,''),
(125,10,107,2124,1,''),
(125,102,108,2120,1,''),
(125,102,109,2554,1,''),
(125,102,110,7618,1,''),
(125,102,111,7620,1,''),
(125,102,112,2789,50,'2'),
(131,1,101,2457,1,''),
(131,3,102,1988,1,''),
(131,4,103,2463,1,''),
(131,5,104,2453,1,''),
(131,6,105,2516,1,''),
(131,7,106,2647,1,''),
(131,10,107,2124,1,''),
(131,102,108,2120,1,''),
(131,102,109,2554,1,''),
(131,102,110,7618,1,''),
(131,102,111,7620,1,''),
(131,102,112,2789,50,'2'),
(133,1,101,2457,1,''),
(133,3,102,1988,1,''),
(133,4,103,2463,1,''),
(133,5,104,2453,1,''),
(133,6,105,2516,1,''),
(133,7,106,2647,1,''),
(133,10,107,2124,1,''),
(133,102,108,2120,1,''),
(133,102,109,2554,1,''),
(133,102,110,7618,1,''),
(133,102,111,7620,1,''),
(133,102,112,2789,50,'2'),
(132,1,101,2457,1,''),
(132,3,102,1988,1,''),
(132,4,103,2463,1,''),
(132,5,104,2453,1,''),
(132,6,105,2516,1,''),
(132,7,106,2647,1,''),
(132,10,107,2124,1,''),
(132,102,108,2120,1,''),
(132,102,109,2554,1,''),
(132,102,110,7618,1,''),
(132,102,111,7620,1,''),
(132,102,112,2789,50,'2'),
(126,1,101,2457,1,''),
(126,3,102,1988,1,''),
(126,4,103,2463,1,''),
(126,5,104,2453,1,''),
(126,6,105,2516,1,''),
(126,7,106,2647,1,''),
(126,10,107,2124,1,''),
(126,102,108,2120,1,''),
(126,102,109,2554,1,''),
(126,102,110,7618,1,''),
(126,102,111,7620,1,''),
(126,102,112,2789,50,'2'),
(129,1,101,2457,1,''),
(129,3,102,1988,1,''),
(129,4,103,2463,1,''),
(129,5,104,2453,1,''),
(129,6,105,2516,1,''),
(129,7,106,2647,1,''),
(129,10,107,2124,1,''),
(129,102,108,2120,1,''),
(129,102,109,2554,1,''),
(129,102,110,7618,1,''),
(129,102,111,7620,1,''),
(129,102,112,2789,50,'2'),
(130,1,101,2457,1,''),
(130,3,102,1988,1,''),
(130,4,103,2463,1,''),
(130,5,104,2453,1,''),
(130,6,105,2516,1,''),
(130,7,106,2647,1,''),
(130,10,107,2124,1,''),
(130,102,108,2120,1,''),
(130,102,109,2554,1,''),
(130,102,110,7618,1,''),
(130,102,111,7620,1,''),
(130,102,112,2789,50,'2'),
(128,1,101,2457,1,''),
(128,3,102,1988,1,''),
(128,4,103,2463,1,''),
(128,5,104,2453,1,''),
(128,6,105,2516,1,''),
(128,7,106,2647,1,''),
(128,10,107,2124,1,''),
(128,102,108,2120,1,''),
(128,102,109,2554,1,''),
(128,102,110,7618,1,''),
(128,102,111,7620,1,''),
(128,102,112,2789,50,'2'),
(123,1,101,2457,1,''),
(123,3,102,1988,1,''),
(123,4,103,2463,1,''),
(123,5,104,7424,1,''),
(123,6,105,2516,1,''),
(123,7,106,2647,1,''),
(123,8,107,2195,1,''),
(123,10,108,2124,1,''),
(123,102,109,2148,49,'1'),
(123,102,110,2152,71,'G'),
(123,102,111,2514,1,''),
(123,102,112,2472,1,''),
(123,102,113,2160,40,'('),
(123,102,114,2514,1,''),
(123,102,115,2514,1,''),
(123,102,116,2514,1,''),
(123,102,117,2514,1,''),
(123,102,118,2472,1,''),
(123,102,119,1988,1,''),
(123,102,120,2269,1,''),
(123,102,121,2268,1,''),
(123,102,122,2261,1,''),
(123,102,123,2293,1,''),
(123,102,124,7590,1,''),
(123,102,125,2120,1,''),
(123,102,126,2554,1,''),
(123,102,127,7620,1,''),
(123,102,128,2789,32,' '),
(123,119,129,2453,1,''),
(123,119,130,2157,11,''),
(123,119,131,1988,1,''),
(124,1,101,2457,1,''),
(124,3,102,1988,1,''),
(124,4,103,2463,1,''),
(124,5,104,7368,1,''),
(124,6,105,2516,1,''),
(124,7,106,2647,1,''),
(124,8,107,2195,1,''),
(124,9,108,2124,1,''),
(124,10,109,2546,16,''),
(124,102,110,2167,1,''),
(124,102,111,2148,15,''),
(124,102,112,2152,94,'^'),
(124,102,113,2160,32,' '),
(124,102,114,8849,1,''),
(124,102,115,7364,1,''),
(124,102,116,2293,1,''),
(124,102,117,8472,1,''),
(124,102,118,2261,1,''),
(124,102,119,2120,1,''),
(124,102,120,2554,1,''),
(124,102,121,2157,6,''),
(124,102,122,2789,39,'\''),
(137,1,101,2457,1,''),
(137,2,102,2173,1,'\0'),
(137,3,103,1988,1,''),
(137,4,104,2463,1,''),
(137,6,105,8849,1,''),
(137,7,106,2647,1,''),
(137,8,107,2195,1,''),
(137,9,108,2124,1,''),
(137,10,109,7364,1,''),
(137,103,110,2516,1,''),
(137,103,111,2120,1,''),
(137,103,112,2554,1,''),
(137,103,113,7618,1,''),
(137,103,114,7620,1,''),
(137,103,115,2157,5,''),
(137,103,116,2789,49,'1'),
(118,1,101,2457,1,''),
(118,2,102,2173,1,'\0'),
(118,3,103,1988,1,''),
(118,4,104,2463,1,''),
(118,6,105,8849,1,''),
(118,7,106,2647,1,''),
(118,8,107,2195,1,''),
(118,9,108,2124,1,''),
(118,10,109,7364,1,''),
(118,103,110,2516,1,''),
(118,103,111,2120,1,''),
(118,103,112,2554,1,''),
(118,103,113,7618,1,''),
(118,103,114,7620,1,''),
(118,103,115,2157,5,''),
(118,103,116,2789,50,'2'),
(121,1,101,2457,1,''),
(121,2,102,2173,1,'\0'),
(121,3,103,1988,1,''),
(121,4,104,2463,1,''),
(121,5,105,2516,1,''),
(121,6,106,7368,1,''),
(121,7,107,2647,1,''),
(121,8,108,2195,1,''),
(121,9,109,2124,1,''),
(121,10,110,7364,1,''),
(121,103,111,11244,1,''),
(121,103,112,2514,1,''),
(121,103,113,2514,1,''),
(121,103,114,2514,1,''),
(121,103,115,2472,1,''),
(121,103,116,2514,1,''),
(121,103,117,2514,1,''),
(121,103,118,2514,1,''),
(121,103,119,2514,1,''),
(121,103,120,2514,1,''),
(121,103,121,2472,1,''),
(121,103,122,2472,1,''),
(121,103,123,2514,1,''),
(121,103,124,2514,1,''),
(121,103,125,2120,1,''),
(121,103,126,2554,1,''),
(121,103,127,7618,1,''),
(121,103,128,7620,1,''),
(121,103,129,2157,9,'	'),
(121,103,130,2789,50,'2'),
(121,111,131,2514,1,''),
(121,111,132,2514,1,''),
(121,111,133,2514,1,''),
(121,111,134,2514,1,''),
(121,111,135,2514,1,''),
(121,111,136,2514,1,''),
(121,111,137,2514,1,''),
(121,111,138,2152,100,'d'),
(121,111,139,2160,99,'c'),
(121,111,140,8849,1,''),
(69,1,101,9778,1,''),
(69,3,102,5950,1,''),
(69,4,103,9776,1,''),
(69,5,104,12647,1,''),
(69,6,105,12318,1,''),
(69,7,106,9777,1,''),
(69,8,107,2641,1,''),
(69,9,108,2123,1,''),
(69,10,109,11393,1,''),
(69,102,110,2514,1,''),
(69,102,111,2514,1,''),
(69,102,112,2514,1,''),
(69,102,113,2514,1,''),
(69,102,114,2514,1,''),
(69,102,115,2514,1,''),
(69,102,116,2514,1,''),
(69,102,117,2514,1,''),
(69,102,118,2472,1,''),
(69,102,119,2514,1,''),
(69,102,120,2514,1,''),
(69,102,121,2514,1,''),
(69,102,122,2514,1,''),
(69,102,123,2472,1,''),
(69,102,124,10521,1,''),
(69,124,125,10521,1,''),
(69,124,126,7590,3,''),
(69,125,127,10521,1,''),
(69,125,128,2268,1,''),
(69,127,129,10521,1,''),
(140,1,101,2457,1,''),
(140,3,102,1988,1,''),
(140,4,103,2463,1,''),
(140,5,104,2453,1,''),
(140,6,105,2516,1,''),
(140,7,106,2647,1,''),
(140,10,107,2124,1,''),
(140,102,108,2120,1,''),
(140,102,109,2554,1,''),
(140,102,110,7618,1,''),
(140,102,111,7620,1,''),
(140,102,112,2157,5,''),
(140,102,113,2789,50,'2'),
(142,1,101,2457,1,''),
(142,3,102,1988,1,''),
(142,4,103,2463,1,''),
(142,6,104,8849,1,''),
(142,7,105,2647,1,''),
(142,8,106,2195,1,''),
(142,9,107,2124,1,''),
(142,10,108,7364,1,''),
(142,102,109,2516,1,''),
(142,102,110,2120,1,''),
(142,102,111,2554,1,''),
(142,102,112,7618,1,''),
(142,102,113,7620,1,''),
(142,102,114,2157,4,''),
(142,102,115,2789,50,'2'),
(139,3,101,1987,1,''),
(143,1,101,2457,1,''),
(143,3,102,1988,1,''),
(143,4,103,2463,1,''),
(143,5,104,2453,1,''),
(143,6,105,2516,1,''),
(143,7,106,2647,1,''),
(143,8,107,2195,1,''),
(143,10,108,2124,1,''),
(143,102,109,2520,1,''),
(143,102,110,2520,1,''),
(143,102,111,2470,1,''),
(143,102,112,7590,1,''),
(143,102,113,2514,1,''),
(143,102,114,2160,100,'d'),
(143,102,115,2120,1,''),
(143,102,116,2554,1,''),
(143,102,117,2157,4,''),
(143,102,118,2789,50,'2'),
(135,1,101,7903,1,''),
(135,2,102,2173,1,'\0'),
(135,3,103,3939,1,''),
(135,4,104,7884,1,''),
(135,5,105,8909,1,''),
(135,6,106,8855,1,''),
(135,7,107,7885,1,''),
(135,8,108,7886,1,''),
(135,9,109,2204,1,''),
(135,10,110,7839,1,''),
(135,103,111,8472,2,''),
(135,103,112,2122,1,''),
(135,103,113,2160,60,'<'),
(135,103,114,2157,4,''),
(135,103,115,7368,13,'\r'),
(145,1,101,2457,1,''),
(145,3,102,1988,1,''),
(145,4,103,2463,1,''),
(145,5,104,2453,1,''),
(145,6,105,2516,1,''),
(145,7,106,2647,1,''),
(145,10,107,2124,1,''),
(145,102,108,2120,1,''),
(145,102,109,2554,1,''),
(145,102,110,7618,1,''),
(145,102,111,7620,1,''),
(145,102,112,2157,5,''),
(145,102,113,2789,50,'2'),
(146,1,101,2457,1,''),
(146,2,102,2173,1,'\0'),
(146,3,103,1988,1,''),
(146,4,104,2463,1,''),
(146,6,105,8849,1,''),
(146,7,106,2647,1,''),
(146,8,107,2195,1,''),
(146,10,108,7364,1,''),
(146,103,109,2516,1,''),
(146,103,110,2124,1,''),
(146,103,111,2120,1,''),
(146,103,112,2554,1,''),
(146,103,113,7618,1,''),
(146,103,114,7620,1,''),
(146,103,115,2157,5,''),
(146,103,116,2789,50,'2'),
(147,1,101,2457,1,''),
(147,3,102,1988,1,''),
(147,4,103,2463,1,''),
(147,5,104,2453,1,''),
(147,6,105,2516,1,''),
(147,7,106,2647,1,''),
(147,8,107,2195,1,''),
(147,10,108,2124,1,''),
(147,102,109,2120,1,''),
(147,102,110,2554,1,''),
(147,102,111,7618,1,''),
(147,102,112,7620,1,''),
(147,102,113,2157,5,''),
(147,102,114,2789,50,'2'),
(152,2,101,2173,1,'\0'),
(152,3,102,1988,1,''),
(152,4,103,2463,1,''),
(152,5,104,2453,1,''),
(152,6,105,2516,1,''),
(152,7,106,2647,1,''),
(152,8,107,2195,1,''),
(152,10,108,2124,1,''),
(152,102,109,2457,1,''),
(152,102,110,2120,1,''),
(152,102,111,2554,1,''),
(152,102,112,7618,1,''),
(152,102,113,7620,1,''),
(152,102,114,2157,5,''),
(152,102,115,2789,50,'2'),
(153,1,101,2457,1,''),
(153,3,102,1988,1,''),
(153,4,103,2463,1,''),
(153,5,104,2516,1,''),
(153,7,105,2647,1,''),
(153,9,106,2124,1,''),
(153,10,107,7364,1,''),
(153,102,108,2120,1,''),
(153,102,109,2554,1,''),
(153,102,110,7618,1,''),
(153,102,111,7620,1,''),
(153,102,112,2157,5,''),
(153,102,113,2789,47,'/'),
(34,1,101,11302,1,''),
(34,2,102,2173,1,'\0'),
(34,3,103,1988,1,''),
(34,4,104,11301,1,''),
(34,5,105,7417,1,''),
(34,6,106,2526,1,''),
(34,7,107,11304,1,''),
(34,8,108,11303,1,''),
(34,10,109,2124,1,''),
(34,103,110,2148,40,'('),
(34,103,111,2152,93,']'),
(34,103,112,2446,1,''),
(34,103,113,2293,1,''),
(34,103,114,2160,63,'?'),
(34,103,115,8473,1,''),
(34,103,116,2120,1,''),
(34,103,117,2554,1,''),
(34,103,118,7618,1,''),
(34,103,119,7620,1,''),
(34,103,120,2157,3,''),
(34,103,121,2789,29,''),
(35,8,101,2641,1,''),
(35,10,102,2152,98,'b'),
(37,10,101,2124,1,''),
(41,1,101,9778,1,''),
(41,2,102,11393,1,''),
(41,3,103,1988,1,''),
(41,4,104,9776,1,''),
(41,5,105,12318,1,''),
(41,6,106,12647,1,''),
(41,7,107,9777,1,''),
(41,9,108,2123,1,''),
(41,10,109,2124,1,''),
(41,103,110,2148,80,'P'),
(41,103,111,2160,18,''),
(41,103,112,5950,1,''),
(41,103,113,7590,1,''),
(41,103,114,2120,1,''),
(41,103,115,2554,1,''),
(41,103,116,7620,1,''),
(41,103,117,2157,9,'	'),
(41,103,118,2789,26,'\Z'),
(41,112,119,2463,1,''),
(41,112,120,2173,1,'\0'),
(41,112,121,2453,1,''),
(41,112,122,2647,1,''),
(41,112,123,2457,1,''),
(41,112,124,2516,1,''),
(41,112,125,2453,1,''),
(154,3,101,1987,1,''),
(150,1,101,9778,1,''),
(150,2,102,11393,1,''),
(150,3,103,5950,1,''),
(150,4,104,9776,1,''),
(150,5,105,12318,1,''),
(150,6,106,12647,1,''),
(150,7,107,9777,1,''),
(150,8,108,2641,1,''),
(150,9,109,2123,1,''),
(150,10,110,2268,1,''),
(150,103,111,2152,56,'8'),
(150,103,112,2160,3,''),
(150,103,113,2160,100,'d'),
(150,103,114,2157,44,','),
(150,103,115,7590,2,''),
(150,103,116,7368,1,''),
(150,103,117,2453,1,''),
(150,103,118,1988,1,''),
(150,103,119,2641,1,''),
(150,118,120,2120,1,''),
(150,118,121,2554,1,''),
(150,118,122,7618,1,''),
(150,118,123,7620,1,''),
(150,118,124,2157,4,''),
(150,118,125,2789,50,'2'),
(148,1,101,7903,1,''),
(148,3,102,3939,1,''),
(148,4,103,7884,1,''),
(148,5,104,8909,1,''),
(148,6,105,8855,1,''),
(148,7,106,7885,1,''),
(148,8,107,7886,1,''),
(148,9,108,2122,1,''),
(148,10,109,7839,1,''),
(148,102,110,2148,10,'\n'),
(148,102,111,2152,98,'b'),
(148,102,112,2160,70,'F'),
(148,102,113,8472,1,''),
(148,102,114,1988,1,''),
(148,102,115,2195,1,''),
(148,102,116,7364,1,''),
(148,114,117,1987,1,''),
(148,114,118,12318,1,''),
(148,114,119,7618,1,''),
(148,114,120,7620,1,''),
(148,114,121,2157,3,''),
(157,1,101,2457,1,''),
(157,3,102,1988,1,''),
(157,4,103,2463,1,''),
(157,5,104,7364,1,''),
(157,6,105,2516,1,''),
(157,7,106,2647,1,''),
(157,10,107,2124,1,''),
(157,102,108,2120,1,''),
(157,102,109,2554,1,''),
(157,102,110,7618,1,''),
(157,102,111,7620,1,''),
(157,102,112,2157,5,''),
(157,102,113,2789,50,'2'),
(168,1,101,2498,1,''),
(168,3,102,1988,1,''),
(168,4,103,2463,1,''),
(168,5,104,2446,1,''),
(168,6,105,2516,1,''),
(168,7,106,2647,1,''),
(168,10,107,2124,1,''),
(168,102,108,2120,1,''),
(168,102,109,2554,1,''),
(168,102,110,7618,1,''),
(168,102,111,7620,1,''),
(168,102,112,2157,5,''),
(168,102,113,2789,50,'2'),
(169,1,101,2457,1,''),
(169,3,102,1988,1,''),
(169,4,103,2463,1,''),
(169,5,104,2453,1,''),
(169,6,105,2516,1,''),
(169,7,106,2647,1,''),
(169,10,107,2124,1,''),
(169,102,108,2120,1,''),
(169,102,109,2554,1,''),
(169,102,110,7618,1,''),
(169,102,111,7620,1,''),
(169,102,112,2157,5,''),
(169,102,113,2789,50,'2'),
(167,1,101,9778,1,''),
(167,2,102,11393,1,''),
(167,3,103,1988,1,''),
(167,4,104,9776,1,''),
(167,5,105,12318,1,''),
(167,6,106,12647,1,''),
(167,7,107,9777,1,''),
(167,8,108,2641,1,''),
(167,9,109,2123,1,''),
(167,10,110,2160,41,')'),
(167,103,111,2173,1,'\0'),
(167,103,112,5801,1,''),
(167,103,113,2148,95,'_'),
(167,103,114,2152,79,'O'),
(167,103,115,12328,1,''),
(167,103,116,5950,1,''),
(167,103,117,2164,20,'\0'),
(167,103,118,2269,1,''),
(167,103,119,5801,1,''),
(167,103,120,2197,5,'\0'),
(167,103,121,2305,2,''),
(167,103,122,2310,1,''),
(167,103,123,2261,1,''),
(167,103,124,2157,3,''),
(167,103,125,2789,38,'&'),
(167,116,126,2463,1,''),
(167,116,127,2498,1,''),
(167,116,128,2514,1,''),
(167,116,129,2453,1,''),
(167,116,130,2124,1,''),
(167,116,131,7896,1,''),
(167,116,132,11303,1,''),
(167,119,133,7590,1,''),
(167,119,134,2268,1,''),
(167,119,135,2278,1,''),
(167,119,136,2293,1,''),
(75,1,101,9778,1,''),
(75,2,102,11393,1,''),
(75,3,103,3940,1,''),
(75,4,104,9776,1,''),
(75,5,105,12318,1,''),
(75,6,106,12647,1,''),
(75,7,107,9777,1,''),
(75,8,108,2641,1,''),
(75,9,109,2123,1,''),
(75,10,110,11244,1,''),
(75,103,111,2514,1,''),
(75,103,112,2472,1,''),
(75,103,113,2514,1,''),
(75,103,114,2472,1,''),
(75,103,115,2514,1,''),
(75,103,116,2472,1,''),
(75,110,117,2160,2,''),
(75,110,118,2157,5,''),
(75,110,119,3940,1,''),
(75,110,120,9774,1,''),
(75,110,121,9774,1,''),
(75,110,122,9774,1,''),
(75,110,123,10522,1,''),
(75,110,124,10522,1,''),
(75,110,125,10522,1,''),
(75,110,126,10521,1,''),
(75,110,127,10521,1,''),
(75,110,128,10521,1,''),
(75,110,129,1988,1,''),
(75,110,130,1988,1,''),
(75,110,131,1988,1,''),
(75,110,132,5926,1,''),
(75,110,133,5926,1,''),
(75,110,134,2263,1,''),
(75,110,135,3940,1,''),
(75,110,136,2293,3,''),
(75,110,137,2269,1,''),
(75,110,138,5950,1,''),
(75,110,139,2268,1,''),
(75,110,140,2197,5,'\0'),
(75,110,141,2197,5,'\0'),
(75,110,142,2346,1,''),
(75,110,143,7590,1,''),
(75,138,144,8904,1,''),
(75,138,145,5741,1,''),
(75,138,146,2171,1,''),
(75,138,147,7424,1,''),
(122,1,101,2457,1,''),
(122,2,102,2173,1,'\0'),
(122,3,103,1988,1,''),
(122,4,104,2463,1,''),
(122,5,105,7368,1,''),
(122,6,106,2516,1,''),
(122,7,107,2647,1,''),
(122,8,108,2195,1,''),
(122,10,109,2124,1,''),
(122,103,110,7364,1,''),
(122,103,111,2120,1,''),
(122,103,112,2554,1,''),
(122,103,113,7618,1,''),
(122,103,114,7620,1,''),
(122,103,115,2157,5,''),
(122,103,116,2789,46,'.'),
(76,1,101,11302,1,''),
(76,2,102,2171,1,''),
(76,3,103,10521,1,''),
(76,4,104,11301,1,''),
(76,5,105,2446,1,''),
(76,6,106,2522,1,''),
(76,7,107,11304,1,''),
(76,8,108,2195,1,''),
(76,10,109,1988,1,''),
(76,103,110,2514,1,''),
(76,103,111,2472,1,''),
(76,103,112,2514,1,''),
(76,103,113,2514,1,''),
(76,103,114,2514,1,''),
(76,103,115,2514,1,''),
(76,103,116,2514,1,''),
(76,103,117,2514,1,''),
(76,103,118,2514,1,''),
(76,103,119,2514,1,''),
(76,109,120,2165,1,'Á\"\0'),
(76,109,121,7620,1,''),
(76,109,122,8473,1,''),
(76,109,123,10522,1,''),
(76,109,124,3940,1,''),
(76,109,125,9774,1,''),
(76,109,126,1988,1,''),
(76,109,127,2273,1,''),
(76,109,128,2152,91,'['),
(76,109,129,2160,23,''),
(76,109,130,1987,1,''),
(76,109,131,2173,1,'\0'),
(76,109,132,2157,5,''),
(76,109,133,2789,43,'+'),
(76,130,134,2165,1,'Ø”\0'),
(76,130,135,2165,1,''),
(76,130,136,2165,1,''),
(76,130,137,2165,1,''),
(76,130,138,2165,1,''),
(76,130,139,2165,1,''),
(76,130,140,2165,1,'Ëé\0'),
(170,1,101,2457,1,''),
(170,3,102,1988,1,''),
(170,4,103,2463,1,''),
(170,5,104,2453,1,''),
(170,6,105,2516,1,''),
(170,7,106,2647,1,''),
(170,10,107,2124,1,''),
(170,102,108,2120,1,''),
(170,102,109,2554,1,''),
(170,102,110,7618,1,''),
(170,102,111,7620,1,''),
(170,102,112,2157,5,''),
(170,102,113,2789,50,'2'),
(71,1,101,2457,1,''),
(71,2,102,2173,1,'\0'),
(71,3,103,1988,1,''),
(71,4,104,2463,1,''),
(71,5,105,7424,1,''),
(71,6,106,2516,1,''),
(71,7,107,2647,1,''),
(71,8,108,2195,1,''),
(71,9,109,2204,1,''),
(71,10,110,2124,1,''),
(71,103,111,2148,79,'O'),
(71,103,112,2152,97,'a'),
(71,103,113,2453,1,''),
(71,103,114,7590,1,''),
(71,103,115,2124,1,''),
(71,103,116,2120,1,''),
(71,103,117,2554,1,''),
(71,103,118,7618,1,''),
(71,103,119,7620,1,''),
(71,103,120,2789,50,'2'),
(113,1,101,2457,1,''),
(113,2,102,2173,1,'\0'),
(113,3,103,1988,1,''),
(113,4,104,2463,1,''),
(113,6,105,8849,1,''),
(113,7,106,2647,1,''),
(113,10,107,7364,1,''),
(113,103,108,2120,1,''),
(113,103,109,2554,1,''),
(113,103,110,7620,1,''),
(113,103,111,2789,42,'*'),
(156,1,101,7903,1,''),
(156,2,102,7887,199,'«\0'),
(156,3,103,1988,1,''),
(156,4,104,7884,1,''),
(156,5,105,8909,1,''),
(156,6,106,8855,1,''),
(156,7,107,7885,1,''),
(156,8,108,7886,1,''),
(156,9,109,2122,1,''),
(156,10,110,7839,1,''),
(156,103,111,2148,29,''),
(156,103,112,2152,9,'	'),
(156,103,113,2160,27,''),
(156,103,114,8472,1,''),
(156,103,115,2173,1,'\0'),
(156,103,116,3939,1,''),
(156,103,117,2120,1,''),
(156,103,118,2554,1,''),
(156,103,119,7618,1,''),
(156,103,120,7620,1,''),
(156,103,121,2157,5,''),
(156,116,122,7364,1,''),
(156,116,123,2656,1,''),
(156,116,124,2470,1,''),
(156,116,125,2514,1,''),
(156,116,126,2498,1,''),
(156,116,127,2173,1,'\0'),
(156,116,128,2195,1,''),
(156,116,129,7368,3,''),
(68,1,101,2457,1,''),
(68,3,102,1988,1,''),
(68,4,103,2463,1,''),
(68,5,104,2516,1,''),
(68,6,105,7368,1,''),
(68,7,106,2647,1,''),
(68,8,107,2195,1,''),
(68,9,108,2204,1,''),
(68,10,109,7364,1,''),
(68,102,110,2124,1,''),
(68,102,111,8472,1,''),
(68,102,112,2160,82,'R'),
(68,102,113,7618,1,''),
(68,102,114,7620,1,''),
(68,102,115,2157,3,''),
(68,102,116,2789,50,'2'),
(67,1,101,2457,1,''),
(67,2,102,2173,1,'\0'),
(67,3,103,1988,1,''),
(67,4,104,2463,1,''),
(67,5,105,7424,1,''),
(67,6,106,2516,1,''),
(67,7,107,2647,1,''),
(67,8,108,2195,1,''),
(67,10,109,2124,1,''),
(67,103,110,2346,1,''),
(67,103,111,9971,47,'/'),
(67,103,112,7443,2,''),
(67,103,113,7440,2,''),
(67,103,114,2453,1,''),
(67,103,115,2160,15,''),
(67,103,116,2268,1,''),
(67,103,117,7590,1,''),
(67,103,118,2157,13,'\r'),
(67,103,119,2789,38,'&'),
(79,1,101,2457,1,''),
(79,3,102,1988,1,''),
(79,4,103,2463,1,''),
(79,5,104,2453,1,''),
(79,6,105,2516,1,''),
(79,7,106,2647,1,''),
(79,10,107,2124,1,''),
(79,102,108,2120,1,''),
(79,102,109,2554,1,''),
(79,102,110,7618,1,''),
(79,102,111,7620,1,''),
(79,102,112,2789,50,'2'),
(77,1,101,7903,1,''),
(77,2,102,7887,21,'\0'),
(77,3,103,3939,1,''),
(77,4,104,7884,1,''),
(77,5,105,8909,1,''),
(77,6,106,8855,1,''),
(77,7,107,7885,1,''),
(77,8,108,7886,1,''),
(77,9,109,2122,1,''),
(77,10,110,7839,1,''),
(77,103,111,2167,1,''),
(77,103,112,2173,1,'\0'),
(77,103,113,2160,20,''),
(77,103,114,2157,4,''),
(77,103,115,8472,1,''),
(77,103,116,9693,1,''),
(77,103,117,2173,1,'\0'),
(77,103,118,7368,1,''),
(177,1,101,2457,1,''),
(177,3,102,1988,1,''),
(177,4,103,2463,1,''),
(177,6,104,8849,1,''),
(177,7,105,2470,1,''),
(177,10,106,2546,8,''),
(177,102,107,7364,6,''),
(177,102,108,7368,2,''),
(177,102,109,7457,1,''),
(177,102,110,2514,1,''),
(177,102,111,2672,90,'Z'),
(177,102,112,2160,1,''),
(177,102,113,2124,1,''),
(177,102,114,2173,1,'\0'),
(177,102,115,2160,100,'d'),
(177,102,116,2120,1,''),
(177,102,117,2554,1,''),
(177,102,118,7618,1,''),
(177,102,119,7620,1,''),
(177,102,120,2157,3,''),
(177,102,121,2789,34,'\"'),
(181,1,101,7903,1,''),
(181,2,102,7887,200,'»\0'),
(181,3,103,1988,1,''),
(181,4,104,7884,1,''),
(181,5,105,8909,1,''),
(181,6,106,8855,1,''),
(181,7,107,7885,1,''),
(181,8,108,7886,1,''),
(181,9,109,2122,1,''),
(181,10,110,7839,1,''),
(181,103,111,2160,92,'\\'),
(181,103,112,3939,1,''),
(181,103,113,2173,1,'\0'),
(181,103,114,2120,1,''),
(181,103,115,2554,1,''),
(181,103,116,7618,1,''),
(181,103,117,7620,1,''),
(181,103,118,2157,4,''),
(181,103,119,2789,50,'2'),
(181,112,120,2124,1,''),
(73,1,101,2457,1,''),
(73,2,102,2173,1,'\0'),
(73,3,103,1988,1,''),
(73,4,104,2463,1,''),
(73,5,105,2453,1,''),
(73,6,106,2516,1,''),
(73,7,107,2647,1,''),
(73,9,108,2124,1,''),
(73,10,109,1988,1,''),
(73,103,110,2514,1,''),
(73,103,111,2268,1,''),
(73,103,112,2152,78,'N'),
(73,103,113,2160,41,')'),
(73,103,114,1988,1,''),
(73,103,115,2157,6,''),
(73,103,116,2789,47,'/'),
(73,109,117,1988,1,''),
(73,109,118,1988,1,''),
(73,109,119,1988,1,''),
(73,109,120,1988,1,''),
(73,109,121,1988,1,''),
(73,109,122,1988,1,''),
(73,109,123,1988,1,''),
(73,109,124,1988,1,''),
(73,114,125,2554,1,''),
(73,114,126,2120,1,''),
(73,114,127,7590,1,''),
(73,114,128,2269,1,''),
(73,114,129,2278,1,''),
(73,114,130,2261,1,''),
(73,114,131,2293,1,''),
(73,114,132,2268,1,''),
(182,1,101,2457,1,''),
(182,3,102,1988,1,''),
(182,4,103,2463,1,''),
(182,5,104,2453,1,''),
(182,6,105,2516,1,''),
(182,7,106,2647,1,''),
(182,10,107,2124,1,''),
(182,102,108,2120,1,''),
(182,102,109,2554,1,''),
(182,102,110,7618,1,''),
(182,102,111,7620,1,''),
(182,102,112,2157,5,''),
(182,102,113,2789,50,'2'),
(183,1,101,2475,1,''),
(183,3,102,1988,1,''),
(183,5,103,2453,1,''),
(183,6,104,2520,1,''),
(183,8,105,2645,1,''),
(183,9,106,2204,1,''),
(183,10,107,2124,1,''),
(183,102,108,2268,1,''),
(183,102,109,2152,95,'_'),
(183,102,110,2160,93,']'),
(183,102,111,7590,1,''),
(183,102,112,2120,1,''),
(183,102,113,2554,1,''),
(183,102,114,7618,1,''),
(183,102,115,2157,4,''),
(183,102,116,2789,50,'2'),
(184,1,101,7903,1,''),
(184,2,102,7887,146,'í\0'),
(184,3,103,1988,1,''),
(184,4,104,7884,1,''),
(184,5,105,8909,1,''),
(184,6,106,8855,1,''),
(184,7,107,7885,1,''),
(184,8,108,7886,1,''),
(184,9,109,2122,1,''),
(184,10,110,7839,1,''),
(184,103,111,2148,10,'\n'),
(184,103,112,2152,98,'b'),
(184,103,113,8472,1,''),
(184,103,114,7368,1,''),
(184,103,115,3939,1,''),
(184,103,116,2120,1,''),
(184,103,117,2554,1,''),
(184,103,118,7618,1,''),
(184,103,119,7620,1,''),
(184,103,120,2157,4,''),
(184,103,121,2789,50,'2'),
(184,115,122,2160,43,'+'),
(185,1,101,2457,1,''),
(185,3,102,1988,1,''),
(185,4,103,2463,1,''),
(185,5,104,2453,1,''),
(185,6,105,2516,1,''),
(185,7,106,2647,1,''),
(185,10,107,2124,1,''),
(185,102,108,2120,1,''),
(185,102,109,2554,1,''),
(185,102,110,7618,1,''),
(185,102,111,7620,1,''),
(185,102,112,2157,5,''),
(185,102,113,2789,50,'2'),
(186,1,101,2457,1,''),
(186,2,102,2173,1,'\0'),
(186,3,103,1988,1,''),
(186,4,104,2463,1,''),
(186,5,105,7364,1,''),
(186,6,106,2516,1,''),
(186,7,107,2647,1,''),
(186,9,108,2124,1,''),
(186,103,109,2160,97,'a'),
(186,103,110,2120,1,''),
(186,103,111,2554,1,''),
(186,103,112,7618,1,''),
(186,103,113,7620,1,''),
(186,103,114,2157,4,''),
(186,103,115,2789,50,'2'),
(176,1,101,9778,1,''),
(176,2,102,11393,1,''),
(176,3,103,5950,1,''),
(176,4,104,9776,1,''),
(176,5,105,12318,1,''),
(176,6,106,2516,1,''),
(176,7,107,9777,1,''),
(176,8,108,2641,1,''),
(176,9,109,2123,1,''),
(176,10,110,12647,1,''),
(176,103,111,2148,20,''),
(176,103,112,2152,94,'^'),
(176,103,113,2167,1,''),
(176,103,114,1988,1,''),
(176,103,115,2457,1,''),
(176,103,116,11303,1,''),
(176,103,117,2647,1,''),
(176,103,118,8871,1,''),
(176,103,119,2453,1,''),
(176,114,120,10559,1,''),
(176,114,121,2123,1,''),
(176,114,122,2160,61,'='),
(176,114,123,2187,1,''),
(176,114,124,2123,1,''),
(176,114,125,2124,1,''),
(176,114,126,11303,1,''),
(176,114,127,7366,1,''),
(176,114,128,2260,1,''),
(176,114,129,7590,1,''),
(176,114,130,2268,1,''),
(176,114,131,7368,1,''),
(176,114,132,2120,1,''),
(176,114,133,2554,1,''),
(176,114,134,7618,1,''),
(176,114,135,7620,3,''),
(176,114,136,2157,10,'\n'),
(187,1,101,2457,1,''),
(187,3,102,1988,1,''),
(187,4,103,2463,1,''),
(187,5,104,2453,1,''),
(187,6,105,2516,1,''),
(187,7,106,2647,1,''),
(187,10,107,2124,1,''),
(187,102,108,2120,1,''),
(187,102,109,2554,1,''),
(187,102,110,7618,1,''),
(187,102,111,7620,1,''),
(187,102,112,2157,5,''),
(187,102,113,2789,50,'2'),
(138,3,101,1987,1,''),
(138,6,102,8849,1,''),
(138,7,103,11304,1,''),
(138,9,104,2124,1,''),
(163,1,101,2457,1,''),
(163,3,102,1988,1,''),
(163,4,103,2463,1,''),
(163,6,104,8849,1,''),
(163,7,105,2647,1,''),
(163,8,106,2195,1,''),
(163,9,107,2124,1,''),
(163,10,108,7364,1,''),
(163,102,109,12328,1,''),
(163,102,110,2160,82,'R'),
(163,102,111,7620,1,''),
(163,102,112,8472,1,''),
(163,102,113,2293,1,''),
(163,102,114,2516,1,''),
(163,102,115,2120,1,''),
(163,102,116,2554,1,''),
(163,102,117,7618,1,''),
(163,102,118,2157,4,''),
(163,102,119,2789,21,''),
(188,1,101,2457,1,''),
(188,3,102,1988,1,''),
(188,4,103,2463,1,''),
(188,5,104,7364,1,''),
(188,6,105,2516,1,''),
(188,7,106,2647,1,''),
(188,10,107,2124,1,''),
(188,102,108,2120,1,''),
(188,102,109,2554,1,''),
(188,102,110,7618,1,''),
(188,102,111,7620,1,''),
(188,102,112,2157,5,''),
(188,102,113,2789,50,'2'),
(190,1,101,9778,1,''),
(190,2,102,11393,1,''),
(190,3,103,5950,1,''),
(190,4,104,9776,1,''),
(190,5,105,12318,1,''),
(190,6,106,12647,1,''),
(190,7,107,9777,1,''),
(190,8,108,2641,1,''),
(190,9,109,2123,1,''),
(190,10,110,2124,1,''),
(190,103,111,1988,1,''),
(190,111,112,2152,84,'T'),
(190,111,113,2268,1,''),
(190,111,114,2278,1,''),
(190,111,115,2293,1,''),
(190,111,116,7590,1,''),
(190,111,117,2160,75,'K'),
(190,111,118,2120,1,''),
(190,111,119,2554,1,''),
(190,111,120,7618,1,''),
(190,111,121,7620,1,''),
(190,111,122,2157,4,''),
(190,111,123,2789,33,'!'),
(32,1,101,7903,1,''),
(32,2,102,2173,1,'\0'),
(32,3,103,3939,1,''),
(32,4,104,7884,1,''),
(32,5,105,8909,1,''),
(32,6,106,8855,1,''),
(32,7,107,7885,1,''),
(32,8,108,7886,1,''),
(32,10,109,7839,1,''),
(32,103,110,2167,1,''),
(32,103,111,2122,1,''),
(32,103,112,2167,1,''),
(32,103,113,2293,3,''),
(32,103,114,2160,22,''),
(32,103,115,2268,3,''),
(32,103,116,2173,1,'\0'),
(32,103,117,2167,1,''),
(32,103,118,2167,1,''),
(32,103,119,1988,1,''),
(32,119,120,8472,1,''),
(32,119,121,1988,1,''),
(32,119,122,2160,48,'0'),
(32,119,123,2293,1,''),
(32,119,124,2516,1,''),
(32,119,125,2120,1,''),
(32,119,126,7618,1,''),
(32,119,127,7620,1,''),
(32,119,128,2157,4,''),
(32,119,129,2789,46,'.'),
(189,1,101,7903,1,''),
(189,2,102,7887,146,'í\0'),
(189,3,103,3939,1,''),
(189,4,104,7884,1,''),
(189,5,105,8909,1,''),
(189,6,106,8855,1,''),
(189,7,107,7885,1,''),
(189,8,108,7886,1,''),
(189,9,109,2204,1,''),
(189,10,110,7839,1,''),
(189,103,111,2122,1,''),
(189,103,112,7840,1,''),
(189,103,113,1988,1,''),
(189,103,114,2167,1,''),
(189,103,115,2160,74,'J'),
(189,103,116,7887,200,'»\0'),
(189,103,117,3971,1,''),
(189,103,118,3971,1,''),
(189,103,119,7887,200,'»\0'),
(189,103,120,2214,1,''),
(189,103,121,2197,5,'\0'),
(189,103,122,7887,200,'»\0'),
(189,103,123,10219,5,'\0'),
(189,103,124,7368,2,''),
(189,103,125,10559,4,''),
(189,103,126,2346,1,''),
(189,103,127,7440,1,''),
(189,103,128,2157,93,']'),
(189,103,129,7888,200,'»\0'),
(189,103,130,2273,1,''),
(189,103,131,2268,1,''),
(189,103,132,2293,1,''),
(189,103,133,8472,1,''),
(189,103,134,2261,1,''),
(189,103,135,2195,1,''),
(189,103,136,2520,1,''),
(189,103,137,2547,1,''),
(189,103,138,2455,1,''),
(189,103,139,2516,1,''),
(189,103,140,2124,1,''),
(189,113,141,7364,1,''),
(189,113,142,8853,1,''),
(189,113,143,2798,5,''),
(189,113,144,7866,1,''),
(189,113,145,7861,1,''),
(189,113,146,7858,1,''),
(189,113,147,7958,1,''),
(189,113,148,8853,1,''),
(189,113,149,7840,1,''),
(189,113,150,7958,1,''),
(189,113,151,2173,1,'\0'),
(189,113,152,8849,1,''),
(189,113,153,2120,1,''),
(189,113,154,2554,1,''),
(189,113,155,7618,1,''),
(189,113,156,7620,1,''),
(189,113,157,2157,3,''),
(189,113,158,2789,35,'#'),
(160,1,101,9778,1,''),
(160,2,102,11393,1,''),
(160,3,103,5950,1,''),
(160,4,104,9776,1,''),
(160,5,105,12647,1,''),
(160,6,106,12318,1,''),
(160,7,107,9777,1,''),
(160,8,108,2641,1,''),
(160,9,109,2123,1,''),
(160,10,110,12328,1,''),
(160,103,111,1988,1,''),
(160,111,112,2268,1,''),
(160,111,113,2293,1,''),
(160,111,114,2160,75,'K'),
(160,111,115,7590,1,''),
(160,111,116,2120,1,''),
(160,111,117,2554,1,''),
(160,111,118,2157,4,''),
(160,111,119,2789,36,'$'),
(162,1,101,2457,1,''),
(162,2,102,2173,1,'\0'),
(162,3,103,1988,1,''),
(162,4,104,2463,1,''),
(162,5,105,2446,1,''),
(162,6,106,2516,1,''),
(162,7,107,2647,1,''),
(162,8,108,2195,1,''),
(162,10,109,2124,1,''),
(162,103,110,2120,1,''),
(162,103,111,2554,1,''),
(162,103,112,7618,1,''),
(162,103,113,7620,1,''),
(162,103,114,2157,5,''),
(162,103,115,2789,50,'2'),
(164,1,101,9778,1,''),
(164,2,102,11393,1,''),
(164,3,103,1988,1,''),
(164,4,104,9776,1,''),
(164,5,105,12647,1,''),
(164,6,106,12318,1,''),
(164,7,107,9777,1,''),
(164,8,108,2641,1,''),
(164,9,109,2123,1,''),
(164,10,110,2160,5,''),
(164,103,111,2148,19,''),
(164,103,112,2152,1,''),
(164,103,113,12328,1,''),
(164,103,114,5950,1,''),
(164,103,115,2269,1,''),
(164,103,116,2268,1,''),
(164,103,117,2278,1,''),
(164,103,118,2293,1,''),
(164,103,119,7590,1,''),
(164,103,120,2120,1,''),
(164,103,121,2554,1,''),
(164,103,122,7618,1,''),
(164,103,123,7620,1,''),
(164,103,124,2157,63,'?'),
(164,103,125,2789,34,'\"'),
(164,114,126,2457,1,''),
(164,114,127,2173,1,'\0'),
(164,114,128,2516,1,''),
(164,114,129,2463,1,''),
(164,114,130,2195,1,''),
(164,114,131,2647,1,''),
(164,114,132,2453,1,''),
(166,1,101,2501,1,''),
(166,2,102,2173,1,'\0'),
(166,3,103,1988,1,''),
(166,4,104,11301,1,''),
(166,5,105,2526,1,''),
(166,6,106,7417,1,''),
(166,7,107,11304,1,''),
(166,8,108,11303,1,''),
(166,10,109,2152,85,'U'),
(166,103,110,2148,20,''),
(166,103,111,9775,1,''),
(166,103,112,2420,1,''),
(166,103,113,2293,1,''),
(166,103,114,12328,1,''),
(166,103,115,8473,1,''),
(166,103,116,2160,66,'B'),
(166,103,117,2120,1,''),
(166,103,118,2554,1,''),
(166,103,119,7620,1,''),
(166,103,120,2157,4,''),
(166,103,121,2789,12,''),
(166,111,122,8932,1,''),
(166,111,123,10502,1,''),
(166,111,124,2138,1,''),
(166,111,125,2503,1,''),
(166,111,126,2538,1,''),
(166,111,127,9932,1,''),
(166,111,128,2504,1,''),
(165,1,101,7903,1,''),
(165,3,102,1988,1,''),
(165,4,103,7884,1,''),
(165,5,104,8909,1,''),
(165,6,105,8855,1,''),
(165,7,106,7885,1,''),
(165,8,107,7886,1,''),
(165,9,108,2122,1,''),
(165,10,109,7839,1,''),
(165,102,110,2152,89,'Y'),
(165,102,111,3939,1,''),
(165,102,112,12328,1,''),
(165,102,113,3939,1,''),
(165,102,114,2293,1,''),
(165,102,115,8472,1,''),
(165,102,116,2160,65,'A'),
(165,102,117,2516,1,''),
(165,102,118,2120,1,''),
(165,102,119,2554,1,''),
(165,102,120,2157,4,''),
(165,102,121,2789,17,''),
(165,111,122,2122,1,''),
(165,111,123,7886,1,''),
(165,111,124,8855,1,''),
(165,111,125,7884,1,''),
(165,111,126,7839,1,''),
(165,111,127,7885,1,''),
(165,111,128,8909,1,''),
(165,111,129,7903,1,''),
(28,1,101,7903,1,''),
(28,2,102,2173,1,'\0'),
(28,3,103,3939,1,''),
(28,4,104,7884,1,''),
(28,5,105,8909,1,''),
(28,6,106,8855,1,''),
(28,7,107,7885,1,''),
(28,8,108,7886,1,''),
(28,9,109,2204,1,''),
(28,10,110,7839,1,''),
(28,103,111,2152,20,''),
(28,103,112,8472,1,''),
(28,103,113,2160,39,'\''),
(28,103,114,2293,1,''),
(28,103,115,2157,99,'c'),
(28,103,116,2122,1,''),
(28,103,117,2195,1,''),
(192,3,101,1987,1,''),
(151,1,101,7903,1,''),
(151,2,102,2173,1,'\0'),
(151,3,103,3939,1,''),
(151,4,104,7884,1,''),
(151,5,105,8909,1,''),
(151,6,106,8855,1,''),
(151,7,107,7885,1,''),
(151,8,108,7886,1,''),
(151,10,109,7839,1,''),
(151,103,110,2167,1,''),
(151,103,111,2122,1,''),
(151,103,112,2148,5,''),
(151,103,113,2152,26,'\Z'),
(151,103,114,1987,1,''),
(151,103,115,2173,1,'\0'),
(151,103,116,2671,72,'H'),
(151,103,117,2666,10,'\n'),
(151,103,118,2160,14,''),
(151,103,119,9774,1,''),
(151,103,120,12328,1,''),
(151,103,121,8472,1,''),
(151,103,122,2554,1,''),
(151,103,123,2120,1,''),
(151,103,124,2157,23,''),
(151,114,125,2167,1,''),
(151,114,126,2167,1,''),
(151,114,127,2167,1,''),
(151,114,128,2167,1,''),
(151,114,129,2167,1,''),
(151,114,130,2167,1,''),
(151,114,131,2167,1,''),
(151,114,132,2167,1,''),
(179,1,101,9778,1,''),
(179,2,102,11393,1,''),
(179,3,103,5950,1,''),
(179,4,104,9776,1,''),
(179,5,105,12647,1,''),
(179,6,106,12318,1,''),
(179,7,107,9777,1,''),
(179,8,108,2641,1,''),
(179,9,109,2123,1,''),
(179,10,110,12328,1,''),
(179,103,111,2157,1,''),
(179,103,112,2160,95,'_'),
(179,103,113,2120,1,''),
(179,103,114,2554,1,''),
(179,103,115,2263,1,''),
(179,103,116,2293,3,''),
(179,103,117,2671,6,''),
(179,103,118,2666,53,'5'),
(179,103,119,2268,1,''),
(179,103,120,7590,1,''),
(179,103,121,1988,1,''),
(179,121,122,1988,1,''),
(179,122,123,1988,1,''),
(179,123,124,1988,1,''),
(179,124,125,1988,1,''),
(179,125,126,1988,1,''),
(179,126,127,1988,1,''),
(179,127,128,1988,1,''),
(179,128,129,1988,1,''),
(179,129,130,1988,1,''),
(179,130,131,1988,1,''),
(179,131,132,1988,1,''),
(179,132,133,1988,1,''),
(179,133,134,1988,1,''),
(179,134,135,1988,1,''),
(179,135,136,1988,1,''),
(179,136,137,1988,1,''),
(179,137,138,1988,1,''),
(179,138,139,1988,1,''),
(179,139,140,1988,1,''),
(179,140,141,1988,1,''),
(179,141,142,1988,1,''),
(179,142,143,1988,1,''),
(179,143,144,1988,1,''),
(179,144,145,1988,1,''),
(172,1,101,2457,1,''),
(172,2,102,2173,1,'\0'),
(172,3,103,1988,1,''),
(172,4,104,2463,1,''),
(172,5,105,2453,1,''),
(172,6,106,2516,1,''),
(172,7,107,2647,1,''),
(172,8,108,2195,1,''),
(172,9,109,2204,1,''),
(172,10,110,2124,1,''),
(172,103,111,2173,1,'\0'),
(172,103,112,2173,1,'\0'),
(172,103,113,2268,6,''),
(172,103,114,2173,1,'\0'),
(172,103,115,2160,40,'('),
(172,103,116,2120,1,''),
(172,103,117,2554,1,''),
(172,103,118,7618,1,''),
(172,103,119,7620,1,''),
(172,103,120,2157,4,''),
(172,103,121,2789,37,'%'),
(56,1,101,9778,1,''),
(56,2,102,11393,1,''),
(56,3,103,1988,1,''),
(56,4,104,9776,1,''),
(56,5,105,12318,1,''),
(56,6,106,12647,1,''),
(56,7,107,9777,1,''),
(56,8,108,2195,1,''),
(56,10,109,2124,1,''),
(56,103,110,12614,3,''),
(56,103,111,2263,1,''),
(56,103,112,7440,1,''),
(56,103,113,2160,67,'C'),
(56,103,114,10559,3,''),
(56,103,115,8981,1,''),
(56,103,116,7424,1,''),
(56,103,117,2453,1,''),
(56,103,118,7590,2,''),
(56,103,119,2120,1,''),
(56,103,120,2554,1,''),
(56,103,121,2157,2,''),
(27,1,101,9778,1,''),
(27,2,102,11393,1,''),
(27,3,103,1988,1,''),
(27,4,104,9776,1,''),
(27,5,105,12318,1,''),
(27,6,106,12647,1,''),
(27,7,107,9777,1,''),
(27,8,108,2641,1,''),
(27,10,109,2160,2,''),
(27,103,110,6391,1,''),
(27,103,111,2514,1,''),
(27,103,112,2514,1,''),
(27,103,113,2167,1,''),
(27,103,114,2152,26,'\Z'),
(27,103,115,2420,1,''),
(27,103,116,2263,1,''),
(27,103,117,2346,1,''),
(27,103,118,10559,6,''),
(27,103,119,1988,1,''),
(27,103,120,2268,1,''),
(27,103,121,2269,1,''),
(27,103,122,7590,1,''),
(27,103,123,2120,1,''),
(27,103,124,2554,1,''),
(27,103,125,2157,40,'('),
(27,119,126,2123,1,''),
(27,119,127,2516,1,''),
(27,119,128,7939,1,''),
(27,119,129,7899,1,''),
(27,119,130,7894,1,''),
(27,119,131,7891,1,''),
(27,119,132,1988,1,''),
(27,132,133,1988,1,''),
(27,133,134,1988,1,''),
(27,134,135,1988,1,''),
(45,1,101,11302,1,''),
(45,2,102,2173,1,'\0'),
(45,3,103,1988,1,''),
(45,4,104,11301,1,''),
(45,5,105,7417,1,''),
(45,6,106,2526,1,''),
(45,7,107,11304,1,''),
(45,8,108,11303,1,''),
(45,9,109,2124,1,''),
(45,10,110,2160,91,'['),
(45,103,111,2152,96,'`'),
(45,103,112,11303,1,''),
(45,103,113,2526,1,''),
(45,103,114,7451,1,''),
(45,103,115,8926,1,''),
(45,103,116,7417,1,''),
(45,103,117,8473,1,''),
(45,103,118,2120,1,''),
(45,103,119,2554,1,''),
(45,103,120,7620,1,''),
(45,103,121,2157,2,''),
(175,1,101,7903,1,''),
(175,2,102,7887,1,''),
(175,3,103,3939,1,''),
(175,4,104,7884,1,''),
(175,5,105,8909,1,''),
(175,6,106,8855,1,''),
(175,7,107,7885,1,''),
(175,8,108,7886,1,''),
(175,9,109,2122,1,''),
(175,10,110,7839,1,''),
(175,103,111,2148,10,'\n'),
(175,103,112,2152,98,'b'),
(175,103,113,8472,1,''),
(175,103,114,2157,3,''),
(175,103,115,1988,1,''),
(175,103,116,2457,1,''),
(175,103,117,2463,1,''),
(175,103,118,2647,1,''),
(175,103,119,8849,1,''),
(175,103,120,7364,1,''),
(175,103,121,2173,1,'\0'),
(175,103,122,2195,1,''),
(175,115,123,2124,1,''),
(175,115,124,2516,1,''),
(175,115,125,2173,1,'\0'),
(175,115,126,2160,64,'@'),
(175,115,127,2120,1,''),
(175,115,128,2554,1,''),
(175,115,129,7618,1,''),
(175,115,130,7620,1,''),
(64,1,101,7903,1,''),
(64,2,102,7887,1,''),
(64,3,103,3939,1,''),
(64,4,104,7884,1,''),
(64,5,105,8909,1,''),
(64,6,106,8855,1,''),
(64,7,107,7885,1,''),
(64,8,108,7886,1,''),
(64,9,109,2122,1,''),
(64,10,110,7839,1,''),
(64,103,111,2167,1,''),
(64,103,112,2148,39,'\''),
(64,103,113,2173,1,'\0'),
(64,103,114,7735,1,''),
(64,103,115,10310,1,''),
(64,103,116,12328,1,''),
(64,103,117,6131,1,''),
(64,103,118,11259,1,''),
(64,103,119,2160,38,'&'),
(64,103,120,2157,1,''),
(64,103,121,2346,1,''),
(64,103,122,12614,2,''),
(64,103,123,12435,1,''),
(64,103,124,9971,32,' '),
(64,103,125,10559,2,''),
(64,103,126,7443,6,''),
(64,103,127,9971,100,'d'),
(64,103,128,8472,1,''),
(64,103,129,2554,1,''),
(64,103,130,2120,1,''),
(64,103,131,2293,1,''),
(191,1,101,11302,1,''),
(191,2,102,2173,1,'\0'),
(191,3,103,1988,1,''),
(191,4,104,11301,1,''),
(191,5,105,12318,1,''),
(191,6,106,6391,1,''),
(191,7,107,11304,1,''),
(191,8,108,11303,1,''),
(191,9,109,2124,1,''),
(191,10,110,7590,1,''),
(191,103,111,2453,1,''),
(191,103,112,2148,80,'P'),
(191,103,113,2152,81,'Q'),
(191,103,114,2420,1,''),
(191,103,115,2269,1,''),
(191,103,116,2293,1,''),
(191,103,117,2160,41,')'),
(191,103,118,2526,1,''),
(191,103,119,2263,1,''),
(191,103,120,2268,1,''),
(191,103,121,7440,2,''),
(191,103,122,2120,1,''),
(191,103,123,2554,1,''),
(191,103,124,7618,1,''),
(191,103,125,7620,1,''),
(191,103,126,2157,3,''),
(191,103,127,2789,50,'2'),
(171,1,101,2501,1,''),
(171,2,102,2138,1,''),
(171,3,103,9774,1,''),
(171,4,104,2503,1,''),
(171,5,105,2538,1,''),
(171,6,106,8932,1,''),
(171,7,107,2504,1,''),
(171,8,108,9932,1,''),
(171,9,109,10502,1,''),
(171,10,110,2152,92,'\\'),
(171,103,111,2148,40,'('),
(171,103,112,12328,1,''),
(171,103,113,7460,1,''),
(171,103,114,7735,1,''),
(171,103,115,2157,100,'d'),
(171,103,116,2595,1,'$\0Reward from boss: boss feral sphinx.'),
(171,103,117,2160,44,','),
(171,103,118,8473,1,''),
(171,103,119,7620,1,''),
(171,116,120,2595,1,'(\0Reward from boss: boss dazed leaf golem.'),
(171,120,121,2595,1,'-\0Reward from boss: boss deathling spellsinger.'),
(4,2,101,2173,1,'\0'),
(4,3,102,5950,1,''),
(4,5,103,7460,1,''),
(4,10,104,5808,1,''),
(4,102,105,8855,1,''),
(4,102,106,7590,2,''),
(4,102,107,2148,60,'<'),
(4,102,108,7735,1,''),
(4,102,109,9775,1,''),
(4,102,110,2157,13,'\r'),
(4,102,111,7440,6,''),
(4,102,112,2167,1,''),
(4,102,113,2305,2,''),
(4,102,114,8472,1,''),
(4,109,115,2477,1,''),
(4,109,116,11302,1,''),
(4,109,117,12435,8,''),
(4,109,118,12614,4,''),
(4,109,119,2263,2,''),
(4,109,120,1988,1,''),
(4,109,121,9932,1,''),
(4,109,122,8932,1,''),
(4,109,123,10502,1,''),
(4,109,124,2503,1,''),
(4,109,125,2504,1,''),
(4,109,126,2138,1,''),
(4,109,127,2501,1,''),
(4,109,128,2538,1,''),
(4,120,129,10559,11,''),
(4,120,130,2346,1,''),
(4,120,131,7367,1,''),
(4,120,132,7368,1,''),
(4,120,133,7840,1,''),
(4,120,134,2544,1,''),
(4,120,135,2160,48,'0'),
(4,120,136,7735,1,''),
(4,120,137,7890,1,''),
(4,120,138,12614,1,''),
(4,120,139,2122,1,''),
(4,120,140,11255,1,''),
(4,120,141,7890,1,''),
(4,120,142,7735,1,''),
(4,120,143,2453,1,''),
(4,120,144,2390,1,''),
(4,120,145,8855,1,''),
(4,120,146,2543,1,''),
(4,120,147,7378,1,''),
(4,120,148,2389,1,''),
(178,1,101,11302,1,''),
(178,2,102,2173,1,'\0'),
(178,3,103,1988,1,''),
(178,4,104,11301,1,''),
(178,5,105,7424,1,''),
(178,6,106,2526,1,''),
(178,7,107,11304,1,''),
(178,8,108,11303,1,''),
(178,9,109,2124,1,''),
(178,103,110,7900,1,''),
(178,103,111,7424,1,''),
(178,103,112,2420,1,''),
(178,103,113,1988,1,''),
(178,103,114,2160,28,''),
(178,103,115,2268,1,''),
(178,103,116,2293,3,''),
(178,103,117,2269,2,''),
(178,103,118,7590,1,''),
(178,103,119,2120,1,''),
(178,103,120,2554,1,''),
(178,113,121,12328,1,''),
(178,113,122,2453,1,''),
(178,113,123,7735,1,''),
(178,113,124,7735,1,''),
(178,113,125,7958,1,''),
(178,113,126,7891,1,''),
(178,113,127,7899,1,''),
(178,113,128,6391,1,''),
(178,113,129,7894,1,''),
(178,113,130,7939,1,''),
(178,113,131,6391,1,''),
(178,113,132,2157,1,''),
(59,1,101,11302,1,''),
(59,3,102,1988,1,''),
(59,4,103,11301,1,''),
(59,5,104,7424,1,''),
(59,6,105,2526,1,''),
(59,7,106,11304,1,''),
(59,8,107,11303,1,''),
(59,10,108,2124,1,''),
(59,102,109,12318,1,''),
(59,102,110,7424,1,''),
(59,102,111,7590,1,''),
(59,102,112,2160,42,'*'),
(59,102,113,2160,100,'d'),
(59,102,114,2120,1,''),
(59,102,115,2554,1,''),
(59,102,116,2157,3,''),
(59,102,117,2789,33,'!'),
(57,1,101,11302,1,''),
(57,3,102,1988,1,''),
(57,4,103,11301,1,''),
(57,5,104,7424,1,''),
(57,6,105,2526,1,''),
(57,7,106,11304,1,''),
(57,8,107,11303,1,''),
(57,10,108,2124,1,''),
(57,102,109,12318,1,''),
(57,102,110,7424,1,''),
(57,102,111,2148,80,'P'),
(57,102,112,2152,58,':'),
(57,102,113,2453,1,''),
(57,102,114,2160,42,'*'),
(57,102,115,7590,1,''),
(57,102,116,2120,1,''),
(57,102,117,2554,1,''),
(57,102,118,2157,4,''),
(57,102,119,2789,27,''),
(114,1,101,9778,1,''),
(114,2,102,11393,1,''),
(114,3,103,9774,1,''),
(114,4,104,9776,1,''),
(114,5,105,12318,1,''),
(114,6,106,12647,1,''),
(114,7,107,9777,1,''),
(114,8,108,2641,1,''),
(114,9,109,2123,1,''),
(114,10,110,2157,43,'+'),
(114,103,111,2173,1,'\0'),
(114,103,112,2160,37,'%'),
(114,103,113,12614,6,''),
(114,103,114,2167,1,''),
(114,103,115,2263,1,''),
(114,103,116,10559,1,''),
(114,103,117,2167,1,''),
(114,103,118,2167,1,''),
(114,103,119,7590,1,''),
(114,103,120,12328,1,''),
(114,103,121,2273,1,''),
(114,103,122,5950,1,''),
(114,122,123,11301,1,''),
(114,122,124,7424,1,''),
(114,122,125,2516,1,''),
(173,1,101,2501,1,''),
(173,2,102,2138,1,''),
(173,3,103,9775,1,''),
(173,4,104,2503,1,''),
(173,5,105,2390,1,''),
(173,6,106,2538,1,''),
(173,7,107,2504,1,''),
(173,8,108,9932,1,''),
(173,9,109,10502,1,''),
(173,10,110,7735,1,''),
(173,103,111,2148,80,'P'),
(173,103,112,2152,93,']'),
(173,103,113,2160,91,'['),
(173,103,114,2124,1,''),
(173,103,115,1988,1,''),
(173,103,116,2157,2,''),
(173,103,117,7620,1,''),
(173,103,118,7618,1,''),
(173,103,119,2554,1,''),
(173,103,120,2120,1,''),
(173,103,121,5801,1,''),
(173,103,122,8473,2,''),
(173,103,123,2498,1,''),
(173,103,124,8932,1,''),
(173,121,125,2472,1,''),
(173,121,126,2195,1,''),
(173,121,127,2514,1,''),
(173,121,128,2470,1,''),
(173,121,129,2487,1,''),
(173,121,130,2645,1,''),
(173,121,131,7396,1,''),
(173,121,132,7368,6,''),
(173,121,133,2446,1,''),
(173,121,134,2645,1,''),
(173,121,135,2475,1,''),
(173,121,136,2487,1,''),
(173,121,137,2645,1,''),
(173,121,138,2475,1,''),
(173,121,139,5801,1,''),
(173,121,140,2520,1,''),
(173,121,141,2520,1,''),
(173,121,142,2475,1,''),
(173,121,143,2475,1,''),
(173,121,144,2645,1,''),
(173,121,145,5801,1,''),
(173,121,146,5801,1,''),
(173,145,147,5801,1,''),
(155,1,101,2501,1,''),
(155,2,102,2138,1,''),
(155,3,103,1988,1,''),
(155,4,104,2503,1,''),
(155,5,105,2538,1,''),
(155,6,106,8932,1,''),
(155,7,107,2504,1,''),
(155,8,108,9932,1,''),
(155,9,109,10502,1,''),
(155,10,110,8473,2,''),
(155,103,111,2152,89,'Y'),
(155,103,112,2157,1,''),
(155,103,113,9774,1,''),
(155,103,114,1988,1,''),
(155,114,115,2160,11,''),
(155,114,116,9774,1,''),
(155,114,117,3940,1,''),
(155,114,118,3940,1,''),
(155,114,119,2157,44,','),
(155,114,120,2157,100,'d'),
(155,114,121,2157,100,'d'),
(155,114,122,2789,46,'.'),
(155,114,123,7620,1,''),
(155,114,124,2554,1,''),
(155,114,125,2261,1,''),
(155,114,126,2293,1,''),
(155,118,127,2514,1,''),
(155,118,128,2472,1,''),
(155,118,129,2514,1,''),
(155,118,130,2472,1,''),
(155,118,131,2421,1,''),
(155,118,132,2522,1,'');
/*!40000 ALTER TABLE `player_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_mounts`
--

DROP TABLE IF EXISTS `player_mounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_mounts` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `mount_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`,`mount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_mounts`
--

LOCK TABLES `player_mounts` WRITE;
/*!40000 ALTER TABLE `player_mounts` DISABLE KEYS */;
INSERT INTO `player_mounts` VALUES
(3,1),
(10,1);
/*!40000 ALTER TABLE `player_mounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_namelocks`
--

DROP TABLE IF EXISTS `player_namelocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_namelocks` (
  `player_id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `namelocked_at` bigint(20) NOT NULL,
  `namelocked_by` int(11) NOT NULL,
  PRIMARY KEY (`player_id`),
  KEY `namelocked_by` (`namelocked_by`),
  CONSTRAINT `player_namelocks_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `player_namelocks_ibfk_2` FOREIGN KEY (`namelocked_by`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_namelocks`
--

LOCK TABLES `player_namelocks` WRITE;
/*!40000 ALTER TABLE `player_namelocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_namelocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_outfits`
--

DROP TABLE IF EXISTS `player_outfits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_outfits` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `outfit_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `addons` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`,`outfit_id`),
  CONSTRAINT `player_outfits_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_outfits`
--

LOCK TABLES `player_outfits` WRITE;
/*!40000 ALTER TABLE `player_outfits` DISABLE KEYS */;
INSERT INTO `player_outfits` VALUES
(27,130,3),
(27,138,3),
(35,143,3),
(35,147,3),
(45,131,3),
(45,139,3),
(56,130,3),
(56,138,3),
(64,129,3),
(64,137,3),
(77,130,3),
(77,133,3),
(77,134,3),
(77,138,3),
(77,141,3),
(77,142,3),
(83,288,3),
(83,289,3),
(84,130,3),
(84,138,3),
(85,152,3),
(85,156,3),
(88,130,3),
(88,138,3),
(107,130,3),
(107,138,3),
(110,152,3),
(110,156,3),
(151,288,3),
(151,289,3),
(165,143,3),
(165,147,3),
(166,145,3),
(166,149,3),
(178,143,3),
(178,147,3),
(179,145,3),
(179,149,3),
(179,154,3),
(179,158,3);
/*!40000 ALTER TABLE `player_outfits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_rewarditems`
--

DROP TABLE IF EXISTS `player_rewarditems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_rewarditems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL COMMENT 'range 0-100 will be reserved for adding items to player who are offline and all > 100 is for items saved from reward chest',
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) unsigned NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  CONSTRAINT `player_rewarditems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_rewarditems`
--

LOCK TABLES `player_rewarditems` WRITE;
/*!40000 ALTER TABLE `player_rewarditems` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_rewarditems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_spells`
--

DROP TABLE IF EXISTS `player_spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_spells` (
  `player_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  KEY `player_id` (`player_id`),
  CONSTRAINT `player_spells_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_spells`
--

LOCK TABLES `player_spells` WRITE;
/*!40000 ALTER TABLE `player_spells` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_storage`
--

DROP TABLE IF EXISTS `player_storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_storage` (
  `player_id` int(11) NOT NULL DEFAULT 0,
  `key` int(10) unsigned NOT NULL DEFAULT 0,
  `value` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`,`key`),
  CONSTRAINT `player_storage_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_storage`
--

LOCK TABLES `player_storage` WRITE;
/*!40000 ALTER TABLE `player_storage` DISABLE KEYS */;
INSERT INTO `player_storage` VALUES
(1,30030,-1),
(1,30031,-1),
(4,1705,1),
(4,1708,1),
(4,12435,100),
(4,12614,100),
(4,13545,1779197362),
(4,20000,1),
(4,20019,382),
(4,20090,1793),
(4,20193,7),
(4,20197,65),
(4,30000,1),
(4,30030,-1),
(4,30031,-1),
(4,40000,1),
(4,50000,1),
(4,60000,1),
(4,66001,0),
(4,66002,0),
(4,66004,0),
(4,66005,0),
(4,66006,0),
(4,66007,0),
(4,66008,0),
(4,66009,0),
(4,66012,0),
(4,66013,0),
(4,66014,0),
(4,66016,0),
(4,66017,0),
(4,66018,0),
(4,66019,0),
(4,66020,0),
(4,75391,1780001792),
(4,87400,-1),
(4,124514,1776779998),
(4,5020440,1779782802),
(4,5030440,1779785804),
(4,5040000,1779749445),
(4,5050000,1779748526),
(4,5060440,1779804129),
(4,5070440,1779806593),
(4,5080440,1779807247),
(4,5110000,1779740357),
(4,5120440,1779808401),
(4,5130440,1779809165),
(4,5140440,1779812667),
(4,5150440,1779813381),
(4,5154340,1779725515),
(4,5160440,1779894290),
(4,5190440,1779726943),
(4,5200000,1779739042),
(4,5224440,1779894198),
(7,30030,-1),
(7,30031,-1),
(9,30030,-1),
(9,30031,-1),
(27,1701,1),
(27,1711,1),
(27,1712,1),
(27,1715,1),
(27,5000,1),
(27,6003,1),
(27,6005,1),
(27,12435,96),
(27,12614,100),
(27,13545,1782000516),
(27,20067,83347),
(27,20090,75),
(27,20197,48),
(27,30030,-1),
(27,30031,-1),
(27,66001,0),
(27,66002,0),
(27,66003,0),
(27,66004,0),
(27,66005,0),
(27,66006,0),
(27,66007,0),
(27,66008,0),
(27,66009,0),
(27,66010,0),
(27,66011,0),
(27,66012,0),
(27,66013,0),
(27,66014,0),
(27,66015,0),
(27,66016,0),
(27,66017,0),
(27,66018,0),
(27,66019,0),
(27,66020,0),
(27,75391,1779978023),
(27,124514,1779760244),
(27,722362,1779680477),
(27,5020440,1779831509),
(27,5030440,1779831565),
(27,5040000,1779831439),
(27,5050000,1779831269),
(27,5060440,1779831616),
(27,5070440,1779831652),
(27,5080440,1779831690),
(27,5090440,1779831718),
(27,5100000,1779831220),
(27,5110000,1779831160),
(27,5120440,1779831772),
(27,5130440,1779831809),
(27,5140440,1779831956),
(27,5150440,1779831990),
(27,5154340,1779830907),
(27,5160440,1779832033),
(27,5170440,1779832068),
(27,5190440,1779831068),
(27,5200000,1779831114),
(27,5224440,1779830847),
(27,5224441,1779557957),
(28,12614,99),
(28,13545,1781538350),
(28,20067,13583),
(28,20090,5),
(28,20197,1050),
(28,30030,-1),
(28,30031,-1),
(28,66001,0),
(28,66002,0),
(28,66003,0),
(28,66004,0),
(28,66006,0),
(28,66007,0),
(28,66008,0),
(28,66009,0),
(28,66012,0),
(28,66013,0),
(28,66014,0),
(28,66015,0),
(28,66016,0),
(28,5020440,1779831509),
(28,5030440,1779831565),
(28,5040000,1779831439),
(28,5060440,1779831616),
(28,5070440,1779831652),
(28,5080440,1779831690),
(28,5090440,1779831718),
(28,5120440,1779831772),
(28,5130440,1779831809),
(28,5140440,1779831956),
(28,5150440,1779831990),
(28,5154340,1779660884),
(28,5160440,1779832033),
(28,5170440,1779832068),
(28,5224440,1779660560),
(28,5224441,1779557991),
(31,20067,9729),
(31,20197,28),
(31,30030,-1),
(31,30031,-1),
(31,75391,1778960675),
(32,12435,100),
(32,12614,100),
(32,20067,23659),
(32,20197,18),
(32,30030,-1),
(32,30031,-1),
(32,722362,1779683442),
(33,30030,-1),
(33,30031,-1),
(34,13545,1781529862),
(34,20067,7606),
(34,30030,-1),
(34,30031,-1),
(35,20067,215),
(35,20193,2),
(35,30030,-1),
(35,30031,-1),
(35,66018,16292),
(35,5154340,1779661758),
(35,5224440,1779661596),
(37,20067,399),
(37,20193,3),
(37,30030,-1),
(37,30031,-1),
(37,66017,377225),
(37,5224440,1779662396),
(41,20067,132),
(41,30030,-1),
(41,30031,-1),
(41,66017,17168),
(41,5224440,1779663454),
(44,30030,-1),
(44,30031,-1),
(45,13545,1781547189),
(45,20067,7961),
(45,20197,11),
(45,29001,1),
(45,29003,1),
(45,30030,-1),
(45,30031,-1),
(48,30030,-1),
(48,30031,-1),
(49,30030,-1),
(49,30031,-1),
(50,30030,-1),
(50,30031,-1),
(54,20067,2),
(54,30030,-1),
(54,30031,-1),
(55,30030,-1),
(55,30031,-1),
(56,12435,1),
(56,12614,100),
(56,20019,5),
(56,20067,36503),
(56,20197,118),
(56,30030,-1),
(56,30031,-1),
(56,66001,0),
(56,66002,0),
(56,66003,0),
(56,66004,0),
(56,66005,0),
(56,66006,0),
(56,66007,0),
(56,66008,0),
(56,66009,0),
(56,66010,0),
(56,66011,0),
(56,66012,0),
(56,66013,0),
(56,66014,0),
(56,66016,0),
(56,66017,0),
(56,66018,0),
(56,66019,0),
(56,66020,0),
(56,722362,-1),
(56,5020440,1779831509),
(56,5030440,1779831565),
(56,5040000,1779831439),
(56,5050000,1779831269),
(56,5060440,1779831616),
(56,5070440,1779831652),
(56,5080440,1779831690),
(56,5100000,1779831220),
(56,5110000,1779831160),
(56,5120440,1779831772),
(56,5130440,1779831809),
(56,5140440,1779831956),
(56,5150440,1779831990),
(56,5154340,1779830907),
(56,5160440,1779832033),
(56,5170440,1779832068),
(56,5190440,1779831068),
(56,5200000,1779831114),
(56,5224440,1779830847),
(57,20067,8198),
(57,20197,9),
(57,29001,1),
(57,29002,1),
(57,29003,1),
(57,30030,-1),
(57,30031,-1),
(58,20067,441),
(58,30030,-1),
(58,30031,-1),
(59,20067,8391),
(59,29001,1),
(59,29002,1),
(59,29003,1),
(59,30030,-1),
(59,30031,-1),
(60,30030,-1),
(60,30031,-1),
(61,13545,1781551283),
(61,20019,11),
(61,20067,23125),
(61,30018,1),
(61,30030,-1),
(61,30031,-1),
(62,13545,1781536707),
(62,20067,6222),
(62,20090,5),
(62,20193,2),
(62,30018,1),
(62,30030,-1),
(62,30031,-1),
(64,1704,1),
(64,1705,1),
(64,1706,1),
(64,1712,1),
(64,1716,1),
(64,6006,1),
(64,12435,100),
(64,12614,100),
(64,20000,1),
(64,20019,166),
(64,20067,30768),
(64,20090,10),
(64,20193,2),
(64,20197,93),
(64,30000,1),
(64,30018,1),
(64,30030,-1),
(64,30031,-1),
(64,40000,1),
(64,50000,1),
(64,60000,1),
(64,66001,0),
(64,66010,0),
(64,66011,0),
(64,66014,0),
(64,66017,0),
(64,66018,0),
(64,66019,0),
(64,66020,0),
(64,70000,1),
(64,722362,1779835170),
(64,5030440,1779806533),
(64,5080440,1779898900),
(64,5100000,1779748900),
(64,5110000,1779748798),
(64,5154340,1779827854),
(64,5190440,1779827893),
(64,5200000,1779827927),
(64,5224440,1779827812),
(65,30030,-1),
(65,30031,-1),
(67,1704,1),
(67,12435,1),
(67,13545,1781537240),
(67,20067,15284),
(67,20197,193),
(67,23510,1779171571),
(67,30030,-1),
(67,30031,-1),
(67,66004,0),
(67,66005,0),
(67,66011,0),
(67,66017,177618),
(67,75391,1778945696),
(67,5040000,1779848019),
(67,5050000,1779848193),
(67,5110000,1779848396),
(67,5224440,1779847523),
(68,13545,1781539016),
(68,20067,21),
(68,20197,2),
(68,30030,-1),
(68,30031,-1),
(68,75391,1778985564),
(69,13545,1781650014),
(69,20000,1),
(69,20019,266),
(69,20067,589),
(69,20090,9),
(69,20193,6),
(69,20197,57),
(69,25786,1779399075),
(69,30000,1),
(69,30018,1),
(69,30030,-1),
(69,30031,-1),
(69,40000,1),
(69,50000,1),
(69,60000,1),
(69,70000,1),
(69,80000,1),
(71,20067,8890),
(71,20197,18),
(71,30030,-1),
(71,30031,-1),
(71,75391,1778960642),
(72,30030,-1),
(72,30031,-1),
(73,13545,1781543244),
(73,20067,118),
(73,20197,350),
(73,30030,-1),
(73,30031,-1),
(73,75391,1778951891),
(73,87400,-1),
(75,1704,1),
(75,12435,1),
(75,13545,1781548336),
(75,20000,1),
(75,20019,644),
(75,20067,12895),
(75,20090,77),
(75,20161,2),
(75,20193,7),
(75,20197,96),
(75,23510,1779731750),
(75,25786,1779556137),
(75,30000,1),
(75,30018,1),
(75,30030,-1),
(75,30031,-1),
(75,40000,1),
(75,50000,1),
(75,60000,1),
(75,70000,1),
(75,80000,1),
(75,226300,1),
(76,20067,85),
(76,20193,2),
(76,30030,-1),
(76,30031,-1),
(77,1704,1),
(77,13545,1781547258),
(77,20067,4662),
(77,20197,186),
(77,23510,1779977278),
(77,30030,-1),
(77,30031,-1),
(77,75391,1779804026),
(78,13545,1781545615),
(78,20019,91),
(78,20067,3930),
(78,20090,95),
(78,25786,1778953444),
(78,30018,1),
(78,30030,-1),
(78,30031,-1),
(79,30030,-1),
(79,30031,-1),
(80,20067,4),
(80,30030,-1),
(80,30031,-1),
(81,30030,-1),
(81,30031,-1),
(82,20067,11238),
(82,20197,11),
(82,30030,-1),
(82,30031,-1),
(83,13545,1781569511),
(83,20000,1),
(83,20019,241),
(83,20067,18604),
(83,20090,9),
(83,25786,1778981821),
(83,30000,1),
(83,30018,1),
(83,30030,-1),
(83,30031,-1),
(83,40000,1),
(83,50000,1),
(83,60000,1),
(83,80000,1),
(84,13545,1781570627),
(84,20000,1),
(84,20019,146),
(84,20067,11318),
(84,20090,332),
(84,20197,4),
(84,30000,1),
(84,30018,1),
(84,30030,-1),
(84,30031,-1),
(84,40000,1),
(84,50000,1),
(84,60000,1),
(84,70000,1),
(84,75391,1779033280),
(84,80000,1),
(85,1712,1),
(85,13545,1781570637),
(85,20000,1),
(85,20019,292),
(85,20067,13024),
(85,20090,236),
(85,20197,39),
(85,30000,1),
(85,30018,1),
(85,30030,-1),
(85,30031,-1),
(85,40000,1),
(85,50000,1),
(85,60000,1),
(85,75391,1779032801),
(85,80000,1),
(86,20067,2),
(86,25786,1778978300),
(86,30030,-1),
(86,30031,-1),
(88,13545,1781573930),
(88,20067,4),
(88,20193,2),
(88,20197,9),
(88,25786,1778982110),
(88,30030,-1),
(88,30031,-1),
(89,30030,-1),
(89,30031,-1),
(90,20197,5),
(90,30030,-1),
(90,30031,-1),
(91,20067,12),
(91,30030,-1),
(91,30031,-1),
(92,20067,2),
(92,30030,-1),
(92,30031,-1),
(94,30030,-1),
(94,30031,-1),
(95,30030,-1),
(95,30031,-1),
(96,30030,-1),
(96,30031,-1),
(97,30030,-1),
(97,30031,-1),
(98,20067,2),
(98,30030,-1),
(98,30031,-1),
(100,20019,277),
(100,20067,1320),
(100,30030,-1),
(100,30031,-1),
(101,30030,-1),
(101,30031,-1),
(104,30030,-1),
(104,30031,-1),
(105,30030,-1),
(105,30031,-1),
(106,30030,-1),
(106,30031,-1),
(107,13545,1781638291),
(107,20000,1),
(107,20019,148),
(107,20067,5399),
(107,20090,9),
(107,20197,486),
(107,30000,1),
(107,30018,1),
(107,30030,-1),
(107,30031,-1),
(107,40000,1),
(109,30030,-1),
(109,30031,-1),
(110,13545,1781702625),
(110,20067,1001),
(110,20108,2),
(110,30030,-1),
(110,30031,-1),
(110,75391,1779115783),
(111,30030,-1),
(111,30031,-1),
(112,30030,-1),
(112,30031,-1),
(113,20197,4),
(113,30018,1),
(113,30030,-1),
(113,30031,-1),
(114,1712,1),
(114,12435,100),
(114,12614,100),
(114,20000,1),
(114,20019,250),
(114,20067,100001),
(114,20090,123),
(114,20193,2),
(114,20197,85),
(114,30000,1),
(114,30018,1),
(114,30030,-1),
(114,30031,-1),
(114,40000,1),
(114,50000,1),
(114,60000,1),
(114,66010,2206),
(114,66016,0),
(114,66017,0),
(114,66018,0),
(114,66019,0),
(114,70000,1),
(114,75391,1779828823),
(114,80000,1),
(114,87400,-1),
(114,300067,1),
(114,722362,1779768714),
(114,5100000,1779833176),
(114,5120440,1779833211),
(114,5154340,1779833002),
(114,5190440,1779833092),
(114,5224440,1779831769),
(115,30030,-1),
(115,30031,-1),
(116,30030,-1),
(116,30031,-1),
(117,30030,-1),
(117,30031,-1),
(118,30030,-1),
(118,30031,-1),
(119,30030,-1),
(119,30031,-1),
(120,20067,142),
(120,30018,1),
(120,30030,-1),
(120,30031,-1),
(121,13545,1781834999),
(121,20067,71),
(121,30030,-1),
(121,30031,-1),
(122,20067,49),
(122,30030,-1),
(122,30031,-1),
(123,20067,5596),
(123,20197,42),
(123,30030,1),
(123,30031,-1),
(123,75391,1779254436),
(124,20067,4525),
(124,20197,39),
(124,30030,-1),
(124,30031,-1),
(124,75391,1779254450),
(125,30030,-1),
(125,30031,-1),
(126,30030,-1),
(126,30031,-1),
(127,30030,-1),
(127,30031,-1),
(128,30030,-1),
(128,30031,-1),
(129,30030,-1),
(129,30031,-1),
(130,30030,-1),
(130,30031,-1),
(131,30030,-1),
(131,30031,-1),
(132,30030,-1),
(132,30031,-1),
(133,30030,-1),
(133,30031,-1),
(135,13545,1782000535),
(135,20019,2),
(135,20067,393),
(135,20197,19),
(135,30018,1),
(135,30030,-1),
(135,30031,-1),
(137,30030,-1),
(137,30031,-1),
(138,20067,2),
(138,30030,-1),
(138,30031,-1),
(138,5130440,1779955517),
(139,20197,5),
(139,30030,-1),
(139,30031,-1),
(140,30030,-1),
(140,30031,-1),
(142,13545,1782069816),
(142,20067,46),
(142,30030,-1),
(142,30031,-1),
(143,20019,2),
(143,20067,10),
(143,20090,102),
(143,30030,-1),
(143,30031,-1),
(145,30030,-1),
(145,30031,-1),
(146,20067,15),
(146,30030,-1),
(146,30031,-1),
(147,30030,-1),
(147,30031,-1),
(148,20067,779),
(148,20197,61),
(148,30030,-1),
(148,30031,-1),
(150,20019,14),
(150,20067,4870),
(150,30030,-1),
(150,30031,-1),
(151,1708,1),
(151,1712,1),
(151,13545,1782161171),
(151,20019,119),
(151,20067,7035),
(151,20090,95),
(151,20193,3),
(151,20197,2123),
(151,30018,1),
(151,30030,-1),
(151,30031,-1),
(151,75391,1779828804),
(152,30030,-1),
(152,30031,-1),
(153,30030,-1),
(153,30031,-1),
(154,30030,-1),
(154,30031,-1),
(155,1704,1),
(155,20067,2954),
(155,20193,9),
(155,30018,1),
(155,30030,-1),
(155,30031,-1),
(156,13545,1782266006),
(156,20067,151),
(156,20197,6688),
(156,30018,1),
(156,30030,-1),
(156,30031,-1),
(157,30030,-1),
(157,30031,-1),
(160,1704,1),
(160,1712,1),
(160,20019,142),
(160,20067,49979),
(160,20090,96),
(160,20197,10001),
(160,23510,1779969168),
(160,30030,-1),
(160,30031,-1),
(160,300197,1),
(162,30030,-1),
(162,30031,-1),
(163,1704,1),
(163,1712,1),
(163,20019,37),
(163,20067,21316),
(163,20090,109),
(163,20197,10001),
(163,23510,1780020694),
(163,30030,-1),
(163,30031,-1),
(163,300197,1),
(164,1704,1),
(164,1712,1),
(164,12435,1),
(164,20019,51),
(164,20067,44519),
(164,20090,237),
(164,20197,10001),
(164,23510,1780021564),
(164,30030,-1),
(164,30031,-1),
(164,300197,1),
(165,1704,1),
(165,1708,1),
(165,1712,1),
(165,20019,42),
(165,20067,36750),
(165,20090,138),
(165,20197,10001),
(165,23510,1780020683),
(165,30030,-1),
(165,30031,-1),
(165,300197,1),
(166,1704,1),
(166,1708,1),
(166,1712,1),
(166,20019,138),
(166,20067,6699),
(166,20090,98),
(166,20116,2),
(166,20130,2),
(166,20197,10001),
(166,23510,1779969176),
(166,30030,-1),
(166,30031,-1),
(166,75391,1779885385),
(166,300197,1),
(167,1704,1),
(167,1712,1),
(167,13545,1782340648),
(167,20019,39),
(167,20067,769),
(167,20090,97),
(167,20197,66),
(167,23510,1779922513),
(167,30030,-1),
(167,30031,-1),
(167,87400,-1),
(168,20197,19),
(168,30030,-1),
(168,30031,-1),
(169,30030,-1),
(169,30031,-1),
(170,30030,-1),
(170,30031,-1),
(171,1705,1),
(171,1712,1),
(171,1717,1),
(171,6007,1),
(171,12614,100),
(171,20019,15),
(171,20067,38969),
(171,30030,-1),
(171,30031,-1),
(171,124514,1779914454),
(172,20067,933),
(172,30030,-1),
(172,30031,-1),
(172,87400,-1),
(173,13545,1782359909),
(173,20067,12626),
(173,20193,3),
(173,30018,1),
(173,30030,-1),
(173,30031,-1),
(173,87400,-1),
(175,13545,1782400611),
(175,20067,14198),
(175,20193,2),
(175,30018,1),
(175,30030,-1),
(175,30031,-1),
(176,13545,1782405272),
(176,20019,100),
(176,20067,2444),
(176,20090,81),
(176,20197,7),
(176,30018,1),
(176,30030,-1),
(176,30031,-1),
(176,66017,0),
(176,66018,368706),
(176,722362,1779838049),
(176,5154340,1779904233),
(176,5224440,1779904145),
(177,20019,34),
(177,20067,336),
(177,20197,8),
(177,25786,1779809045),
(177,30018,1),
(177,30030,-1),
(177,30031,-1),
(178,1701,1),
(178,1705,1),
(178,1711,1),
(178,1715,1),
(178,5000,1),
(178,6001,1),
(178,6005,1),
(178,20019,18),
(178,20067,9788),
(178,20197,58),
(178,29003,1),
(178,30030,-1),
(178,30031,-1),
(178,722362,1779925443),
(179,1708,1),
(179,1712,1),
(179,13545,1782423537),
(179,20000,1),
(179,20019,343),
(179,20067,51056),
(179,20090,108),
(179,20193,2),
(179,20197,7442),
(179,25786,1780002685),
(179,30000,1),
(179,30018,1),
(179,30030,-1),
(179,30031,-1),
(179,40000,1),
(179,50000,1),
(179,60000,1),
(179,70000,1),
(179,75391,1779904835),
(179,80000,1),
(179,226300,1),
(181,30030,-1),
(181,30031,-1),
(182,30030,-1),
(182,30031,-1),
(183,20067,4),
(183,30030,-1),
(183,30031,-1),
(183,87400,-1),
(184,20067,2),
(184,30030,-1),
(184,30031,-1),
(185,30030,-1),
(185,30031,-1),
(186,20067,34),
(186,30030,-1),
(186,30031,-1),
(187,30030,-1),
(187,30031,-1),
(188,30030,-1),
(188,30031,-1),
(189,13545,1782516347),
(189,20067,2775),
(189,20197,2205),
(189,30030,-1),
(189,30031,-1),
(189,66003,0),
(189,66006,0),
(189,66008,0),
(189,66009,0),
(189,722362,1779923530),
(189,5130440,1779988115),
(189,5140440,1779988036),
(189,5160440,1779987888),
(189,5170440,1779987801),
(190,20019,3),
(190,20067,206),
(190,20193,2),
(190,20197,3),
(190,30030,-1),
(190,30031,-1),
(191,1715,1),
(191,6005,1),
(191,20067,2668),
(191,30030,-1),
(191,30031,-1),
(191,722362,1779927054),
(192,13545,1782591346),
(192,20067,280),
(192,20197,47),
(192,30030,-1),
(192,30031,-1);
/*!40000 ALTER TABLE `player_storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_storeinboxitems`
--

DROP TABLE IF EXISTS `player_storeinboxitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_storeinboxitems` (
  `player_id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT 0,
  `itemtype` smallint(5) unsigned NOT NULL,
  `count` smallint(6) NOT NULL DEFAULT 0,
  `attributes` blob NOT NULL,
  UNIQUE KEY `player_id_2` (`player_id`,`sid`),
  CONSTRAINT `player_storeinboxitems_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_storeinboxitems`
--

LOCK TABLES `player_storeinboxitems` WRITE;
/*!40000 ALTER TABLE `player_storeinboxitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_storeinboxitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT 1,
  `account_id` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 1,
  `reset` int(11) NOT NULL DEFAULT 0,
  `vocation` int(11) NOT NULL DEFAULT 0,
  `health` int(11) NOT NULL DEFAULT 150,
  `healthmax` int(11) NOT NULL DEFAULT 150,
  `experience` bigint(20) unsigned NOT NULL DEFAULT 0,
  `lookbody` int(11) NOT NULL DEFAULT 0,
  `lookfeet` int(11) NOT NULL DEFAULT 0,
  `lookhead` int(11) NOT NULL DEFAULT 0,
  `looklegs` int(11) NOT NULL DEFAULT 0,
  `looktype` int(11) NOT NULL DEFAULT 136,
  `lookaddons` int(11) NOT NULL DEFAULT 0,
  `lookmount` smallint(5) unsigned NOT NULL DEFAULT 0,
  `currentmount` smallint(5) unsigned NOT NULL DEFAULT 0,
  `randomizemount` tinyint(4) NOT NULL DEFAULT 0,
  `direction` tinyint(3) unsigned NOT NULL DEFAULT 2,
  `maglevel` int(11) NOT NULL DEFAULT 0,
  `mana` int(11) NOT NULL DEFAULT 0,
  `manamax` int(11) NOT NULL DEFAULT 0,
  `manaspent` bigint(20) unsigned NOT NULL DEFAULT 0,
  `soul` int(10) unsigned NOT NULL DEFAULT 0,
  `town_id` int(11) NOT NULL DEFAULT 1,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  `conditions` blob DEFAULT NULL,
  `cap` int(11) NOT NULL DEFAULT 400,
  `sex` int(11) NOT NULL DEFAULT 0,
  `lastlogin` bigint(20) unsigned NOT NULL DEFAULT 0,
  `lastip` int(10) unsigned NOT NULL DEFAULT 0,
  `save` tinyint(4) NOT NULL DEFAULT 1,
  `skull` tinyint(4) NOT NULL DEFAULT 0,
  `skulltime` bigint(20) NOT NULL DEFAULT 0,
  `lastlogout` bigint(20) unsigned NOT NULL DEFAULT 0,
  `blessings` tinyint(4) NOT NULL DEFAULT 0,
  `onlinetime` bigint(20) NOT NULL DEFAULT 0,
  `deletion` bigint(20) NOT NULL DEFAULT 0,
  `balance` bigint(20) unsigned NOT NULL DEFAULT 0,
  `offlinetraining_time` smallint(5) unsigned NOT NULL DEFAULT 43200,
  `offlinetraining_skill` int(11) NOT NULL DEFAULT -1,
  `stamina` smallint(5) unsigned NOT NULL DEFAULT 2520,
  `skill_fist` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_fist_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_club` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_club_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_sword` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_sword_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_axe` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_axe_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_dist` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_dist_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_shielding` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_shielding_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `skill_fishing` int(10) unsigned NOT NULL DEFAULT 10,
  `skill_fishing_tries` bigint(20) unsigned NOT NULL DEFAULT 0,
  `token_protected` tinyint(4) NOT NULL DEFAULT 0,
  `token_hash` varchar(64) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT 0,
  `hide` tinyint(1) NOT NULL DEFAULT 0,
  `comment` varchar(5000) NOT NULL DEFAULT '',
  `total_frags` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `account_id` (`account_id`),
  KEY `vocation` (`vocation`),
  CONSTRAINT `players_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES
(1,'Account Manager',1,1,1,0,0,150,150,0,0,0,0,0,110,0,0,0,0,2,0,0,0,0,0,1,50,50,7,'',400,0,1778550009,706206397,1,0,0,1778644755,0,95523,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',0,0,'',0),
(4,'ADM Pesado',6,4,1,0,0,100,100,0,0,0,0,0,1372,3,0,184,0,1,0,100,100,0,0,1,305,122,7,'',0,0,1780024562,3124544424,1,0,0,1780023859,31,555856,0,1050000,43200,-1,2516,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,'',1776530937,0,'',0),
(5,'Rook Sample',1,4,1,0,0,150,150,0,118,114,38,57,130,0,0,0,0,2,0,0,0,0,100,1,1000,1000,7,'',400,1,1776530938,2130706433,1,0,0,1776530938,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1776530938,1,'',0),
(6,'Sorcerer Sample',1,4,8,0,1,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,1000,1000,7,'',500,1,1776530938,2130706433,1,0,0,1776530938,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1776530938,1,'',0),
(7,'Druid Sample',1,4,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,3,8,90,90,0,100,1,998,999,7,'',500,1,1779385223,3124544424,1,0,0,1779385225,0,5,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1776530938,1,'',0),
(8,'Paladin Sample',1,4,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,1000,1000,7,'',500,1,1776530938,2130706433,1,0,0,1776530938,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1776530938,1,'',0),
(9,'Knight Sample',1,4,8,0,4,185,185,4200,118,114,38,57,131,0,0,0,0,2,8,90,90,0,100,1,1000,1000,7,'',500,1,1777657118,2800665256,1,0,0,1777657118,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1776530938,1,'',0),
(27,'Mozila Firefox',1,14,5466,0,2,27475,27475,2719459886080,20,0,0,0,130,2,0,0,0,1,116,163830,163830,64288267,100,1,292,121,7,'\0\0\0\0\0\0\0\\>\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0d\0\0\Z\0\0\0\0\0\0\"\0D\0\0333?\r\0\0`¬333?\0\0`¬˛',55080,1,1780012593,3124544424,1,0,1780711773,1780017833,31,302341,0,524939721,43200,-1,2515,10,0,10,0,10,0,10,0,10,0,32,240451,10,0,0,'',1778597668,0,'',11),
(28,'Account Maanager',1,15,1065,0,3,10755,10755,20032675338,58,0,38,0,129,0,0,0,0,1,28,15945,15945,5320583,100,1,146,53,7,'',21640,1,1779933172,3124544424,1,0,0,1779933173,0,106400,0,0,43200,-1,2516,10,0,10,0,10,0,10,0,119,410697,77,51338,10,0,0,'',1778597972,0,'',0),
(29,'Mogli',1,16,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778605955,0,'',0),
(30,'Sixseven',1,17,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778606011,0,'',0),
(31,'Magi',1,18,2772,0,2,14005,14005,354284803389,118,114,38,57,130,0,0,0,0,1,112,81150,83010,1262878,100,1,232,125,5,'Ä\0\0\0\0\0\0\0|å\0\Z\0\0\0\0\0\0\"\0˛',28140,1,1779034379,706206397,1,0,1779077142,1779034404,31,14228935926,0,0,43200,-1,2203,10,0,10,0,10,0,10,0,10,0,13,269,10,0,0,'',1778609856,0,'',0),
(32,'Prince of Persia',1,19,4135,0,3,41455,41455,1176886689006,118,114,38,57,129,0,0,0,0,0,33,61995,61995,11476622,100,1,458,52,13,'\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\"\0˛',83040,1,1779919100,1030153261,1,0,1779957069,1779837580,31,358582,0,269655372,43200,-1,2520,10,0,10,0,10,0,10,0,132,645231,88,113115,10,0,0,'',1778631634,0,'',1),
(33,'Vitinho Dashow',1,20,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,158,55,7,'\0\0\0ˇˇˇˇd\0\0\0\Z\0\0\0\0\0\0\"\0˛',500,1,0,0,1,0,0,1778644752,0,7114578997,0,0,43200,-1,2512,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778644721,0,'',0),
(34,'Sofredor',1,21,1127,0,4,16970,16970,23792940309,76,0,0,76,131,0,0,0,0,2,9,5685,5685,4847132,100,1,149,53,7,'',28475,1,1779587257,3124544424,1,0,0,1779587270,31,55262,0,0,43200,-1,2520,10,0,10,0,101,187015,10,0,10,0,73,2057,10,0,0,'',1778671413,0,'',0),
(35,'Sofredor Um',1,21,652,0,2,3405,3405,4581054255,78,0,38,78,143,3,0,0,0,0,58,19260,19410,56495,100,1,152,49,8,'\0 \0\0ˇˇˇˇ®\r\0\Z\0\0\0\0\0\0\"\0p\0\0\0\0\0 \0\0\0\0∏\0\0\0\0\0!\0\0\0\0˛\0\0\0\0\0\0\0R\0\0\Z\0\0\0\0\0\0\"\0Ò\0\0333?\r\0\0`¬333?\0\0`¬˛\0\0\0ˇˇˇˇË\0\0\Z\0\'\0\0\0\0\"\0˛\0\0\0ˇˇˇˇË\0\0\Z\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0X	\0\Z\0\0\0\0\0\0\"\0˛\0\0\0ˇˇˇˇË\0\0\Z\0,\0\0\0\0\"\0˛\0\0\0ˇˇˇˇË\0\0\Z\0\0\0\0\0\"\0˛',6940,1,1779589908,3124544424,1,0,0,1779589910,31,918,0,0,43200,-1,2504,10,0,10,0,10,0,10,0,10,0,15,45,10,0,0,'',1778671434,0,'',0),
(36,'Sofredor Dois',1,21,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778671447,0,'',0),
(37,'Sofredor Tres',1,21,819,0,2,4240,4240,9104582378,118,114,38,57,130,0,0,0,0,0,45,24083,24420,8743,100,1,152,50,8,'\0\0\0\0\0\0\0‹á\0\Z\0\0\0\0\0\0\"\0\0\0\0\0\n¨\r\0\0∞˛ˇˇ†\0\0\n†\0\0±˛ˇˇ†\0\0\n†\0\0≤˛ˇˇ†\0\0\n†\0\0≥˛ˇˇ†\0\0\n†\0\0¥˛ˇˇ†\0\0\n†\0\0µ˛ˇˇ†\0\0\n†\0\0∂˛ˇˇ†\0\0\n†\0\0∑˛ˇˇ†\0\0\n†\0\0∏˛ˇˇ†\0\0\n†\0\0π˛ˇˇ†\0\0\n†\0\0∫˛ˇˇ†\0\0\n†\0\0ª˛ˇˇ†\0\0\n†\0\0º˛ˇˇ†\0\0\n†\0\0Ω˛ˇˇ†\0\0\n†\0\0æ˛ˇˇ†\0\0\n†\0\0ø˛ˇˇ†\0\0\n†\0\0¿˛ˇˇ†\0\0\n†\0\0¡˛ˇˇ†\0\0\n†\0\0¬˛ˇˇ†\0\0\n†\0\0√˛ˇˇ†\0\0\n†\0\0ƒ˛ˇˇ†\0\0\n†\0\0≈˛ˇˇ†\0\0\n†\0\0∆˛ˇˇ†\0\0\n†\0\0«˛ˇˇ†\0\0\n†\0\0»˛ˇˇ†\0\0\n†\0\0…˛ˇˇ†\0\0\n†\0\0 ˛ˇˇ†\0\0\n†\0\0À˛ˇˇ†\0\0\n†\0\0Ã˛ˇˇ†\0\0\n†\0\0Õ˛ˇˇ†\0\0\n†\0\0Œ˛ˇˇ†\0\0\n†\0\0œ˛ˇˇ†\0\0\n†\0\0–˛ˇˇ†\0\0\n†\0\0—˛ˇˇ†\0\0\n†\0\0“˛ˇˇ†\0\0\n†\0\0”˛ˇˇ†\0\0\n†\0\0‘˛ˇˇ†\0\0\n†\0\0’˛ˇˇ†\0\0\n†\0\0÷˛ˇˇ†\0\0\n†\0\0◊˛ˇˇ†\0\0\n†\0\0ÿ˛ˇˇ†\0\0\n†\0\0Ÿ˛ˇˇ†\0\0\n†\0\0⁄˛ˇˇ†\0\0\n†\0\0€˛ˇˇ†\0\0\n†\0\0‹˛ˇˇ†\0\0\n†\0\0›˛ˇˇ†\0\0\n†\0\0ﬁ˛ˇˇ†\0\0\n†\0\0ﬂ˛ˇˇ†\0\0\n†\0\0‡˛ˇˇ†\0\0\n†\0\0·˛ˇˇ†\0\0\n†\0\0‚˛ˇˇ†\0\0\n†\0\0„˛ˇˇ†\0\0\n†\0\0‰˛ˇˇ†\0\0\n†\0\0Â˛ˇˇ†\0\0\n†\0\0Ê˛ˇˇ†\0\0\n†\0\0Á˛ˇˇ†\0\0\n†\0\0Ë˛ˇˇ†\0\0\n†\0\0È˛ˇˇ†\0\0\n†\0\0Í˛ˇˇ†\0\0\n†\0\0Î˛ˇˇ†\0\0\n†\0\0Ï˛ˇˇ†\0\0\n†\0\0Ì˛ˇˇ†\0\0\n†\0\0Ó˛ˇˇ†\0\0\n†\0\0Ô˛ˇˇ†\0\0\n†\0\0˛ˇˇ†\0\0\n†\0\0Ò˛ˇˇ†\0\0\n†\0\0Ú˛ˇˇ†\0\0\n†\0\0Û˛ˇˇ†\0\0\n†\0\0Ù˛ˇˇ†\0\0\n†\0\0ı˛ˇˇ†\0\0\n†\0\0ˆ˛ˇˇ†\0\0\n†\0\0˜˛ˇˇ†\0\0\n†\0\0¯˛ˇˇ†\0\0\n†\0\0˘˛ˇˇ†\0\0\n†\0\0˙˛ˇˇ†\0\0\n†\0\0˚˛ˇˇ†\0\0\n†\0\0¸˛ˇˇ†\0\0\n†\0\0˝˛ˇˇ†\0\0\n†\0\0˛˛ˇˇ†\0\0\n†\0\0ˇ˛ˇˇ†\0\0\n†\0\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0	ˇˇˇ†\0\0\n†\0\0\nˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0\rˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0\Zˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0 ˇˇˇ†\0\0\n†\0\0!ˇˇˇ†\0\0\n†\0\0\"ˇˇˇ†\0\0\n†\0\0#ˇˇˇ†\0\0\n†\0\0$ˇˇˇ†\0\0\n†\0\0%ˇˇˇ†\0\0\n†\0\0&ˇˇˇ†\0\0\n†\0\0\'ˇˇˇ†\0\0\n†\0\0(ˇˇˇ†\0\0\n†\0\0)ˇˇˇ†\0\0\n†\0\0*ˇˇˇ†\0\0\n†\0\0+ˇˇˇ†\0\0\n†\0\0,ˇˇˇ†\0\0\n†\0\0-ˇˇˇ†\0\0\n†\0\0.ˇˇˇ†\0\0\n†\0\0/ˇˇˇ†\0\0\n†\0\00ˇˇˇ†\0\0\n†\0\01ˇˇˇ†\0\0\n†\0\02ˇˇˇ†\0\0\n†\0\03ˇˇˇ†\0\0\n†\0\04ˇˇˇ†\0\0\n†\0\05ˇˇˇ†\0\0\n†\0\06ˇˇˇ†\0\0\n†\0\07ˇˇˇ†\0\0\n†\0\08ˇˇˇ†\0\0\n†\0\09ˇˇˇ†\0\0\n†\0\0:ˇˇˇ†\0\0\n†\0\0;ˇˇˇ†\0\0\n†\0\0<ˇˇˇ†\0\0\n†\0\0=ˇˇˇ†\0\0\n†\0\0>ˇˇˇ†\0\0\n†\0\0?ˇˇˇ†\0\0\n†\0\0@ˇˇˇ†\0\0\n†\0\0Aˇˇˇ†\0\0\n†\0\0Bˇˇˇ†\0\0\n†\0\0Cˇˇˇ†\0\0\n†\0\0Dˇˇˇ†\0\0\n†\0\0Eˇˇˇ†\0\0\n†\0\0Fˇˇˇ†\0\0\n†\0\0Gˇˇˇ†\0\0\n†\0\0Hˇˇˇ†\0\0\n†\0\0Iˇˇˇ†\0\0\n†\0\0Jˇˇˇ†\0\0\n†\0\0Kˇˇˇ†\0\0\n†\0\0Lˇˇˇ†\0\0\n†\0\0Mˇˇˇ†\0\0\n†\0\0Nˇˇˇ†\0\0\n†\0\0Oˇˇˇ†\0\0\n†\0\0Pˇˇˇ†\0\0\n†\0\0Qˇˇˇ†\0\0\n†\0\0Rˇˇˇ†\0\0\n†\0\0Sˇˇˇ†\0\0\n†\0\0Tˇˇˇ†\0\0\n†\0\0Uˇˇˇ†\0\0\n†\0\0Vˇˇˇ†\0\0\n†\0\0Wˇˇˇ†\0\0\n†\0\0Xˇˇˇ†\0\0\n†\0\0Yˇˇˇ†\0\0\n†\0\0Zˇˇˇ†\0\0\n†\0\0[ˇˇˇ†\0\0\n†\0\0\\ˇˇˇ†\0\0\n†\0\0]ˇˇˇ†\0\0\n†\0\0^ˇˇˇ†\0\0\n†\0\0_ˇˇˇ†\0\0\n†\0\0`ˇˇˇ†\0\0\n†\0\0aˇˇˇ†\0\0\n†\0\0bˇˇˇ†\0\0\n†\0\0cˇˇˇ†\0\0\n†\0\0dˇˇˇ†\0\0\n†\0\0eˇˇˇ†\0\0\n†\0\0fˇˇˇ†\0\0\n†\0\0gˇˇˇ†\0\0\n†\0\0hˇˇˇ†\0\0\n†\0\0iˇˇˇ†\0\0\n†\0\0jˇˇˇ†\0\0\n†\0\0kˇˇˇ†\0\0\n†\0\0lˇˇˇ†\0\0\n†\0\0mˇˇˇ†\0\0\n†\0\0nˇˇˇ†\0\0\n†\0\0oˇˇˇ†\0\0\n†\0\0pˇˇˇ†\0\0\n†\0\0qˇˇˇ†\0\0\n†\0\0rˇˇˇ†\0\0\n†\0\0sˇˇˇ†\0\0\n†\0\0tˇˇˇ†\0\0\n†\0\0uˇˇˇ†\0\0\n†\0\0vˇˇˇ†\0\0\n†\0\0wˇˇˇ†\0\0\n†\0\0xˇˇˇ†\0\0\n†\0\0yˇˇˇ†\0\0\n†\0\0zˇˇˇ†\0\0\n†\0\0{ˇˇˇ†\0\0\n†\0\0|ˇˇˇ†\0\0\n†\0\0}ˇˇˇ†\0\0\n†\0\0~ˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0Äˇˇˇ†\0\0\n†\0\0Åˇˇˇ†\0\0\n†\0\0Çˇˇˇ†\0\0\n†\0\0Éˇˇˇ†\0\0\n†\0\0Ñˇˇˇ†\0\0\n†\0\0Öˇˇˇ†\0\0\n†\0\0Üˇˇˇ†\0\0\n†\0\0áˇˇˇ†\0\0\n†\0\0àˇˇˇ†\0\0\n†\0\0âˇˇˇ†\0\0\n†\0\0äˇˇˇ†\0\0\n†\0\0ãˇˇˇ†\0\0\n†\0\0åˇˇˇ†\0\0\n†\0\0çˇˇˇ†\0\0\n†\0\0éˇˇˇ†\0\0\n†\0\0èˇˇˇ†\0\0\n†\0\0êˇˇˇ†\0\0\n†\0\0ëˇˇˇ†\0\0\n†\0\0íˇˇˇ†\0\0\n†\0\0ìˇˇˇ†\0\0\n†\0\0îˇˇˇ†\0\0\n†\0\0ïˇˇˇ†\0\0\n†\0\0ñˇˇˇ†\0\0\n†\0\0óˇˇˇ†\0\0\n†\0\0òˇˇˇ†\0\0\n†\0\0ôˇˇˇ†\0\0\n†\0\0öˇˇˇ†\0\0\n†\0\0õˇˇˇ†\0\0\n†\0\0úˇˇˇ†\0\0\n†\0\0ùˇˇˇ†\0\0\n†\0\0ûˇˇˇ†\0\0\n†\0\0üˇˇˇ†\0\0\n†\0\0†ˇˇˇ†\0\0\n†\0\0°ˇˇˇ†\0\0\n†\0\0¢ˇˇˇ†\0\0\n†\0\0£ˇˇˇ†\0\0\n†\0\0§ˇˇˇ†\0\0\n†\0\0•ˇˇˇ†\0\0\n†\0\0¶ˇˇˇ†\0\0\n†\0\0ßˇˇˇ†\0\0\n†\0\0®ˇˇˇ†\0\0\n†\0\0©ˇˇˇ†\0\0\n†\0\0™ˇˇˇ†\0\0\n†\0\0´ˇˇˇ†\0\0\n†\0\0¨ˇˇˇ†\0\0\n†\0\0≠ˇˇˇ†\0\0\n†\0\0Æˇˇˇ†\0\0\n†\0\0Øˇˇˇ†\0\0\n†\0\0∞ˇˇˇ†\0\0\n†\0\0±ˇˇˇ†\0\0\n†\0\0≤ˇˇˇ†\0\0\n†\0\0≥ˇˇˇ†\0\0\n†\0\0¥ˇˇˇ†\0\0\n†\0\0µˇˇˇ†\0\0\n†\0\0∂ˇˇˇ†\0\0\n†\0\0∑ˇˇˇ†\0\0\n†\0\0∏ˇˇˇ†\0\0\n†\0\0πˇˇˇ†\0\0\n†\0\0∫ˇˇˇ†\0\0\n†\0\0ªˇˇˇ†\0\0\n†\0\0ºˇˇˇ†\0\0\n†\0\0Ωˇˇˇ†\0\0\n†\0\0æˇˇˇ†\0\0\n†\0\0øˇˇˇ†\0\0\n†\0\0¿ˇˇˇ†\0\0\n†\0\0¡ˇˇˇ†\0\0\n†\0\0¬ˇˇˇ†\0\0\n†\0\0√ˇˇˇ†\0\0\n†\0\0ƒˇˇˇ†\0\0\n†\0\0≈ˇˇˇ†\0\0\n†\0\0∆ˇˇˇ†\0\0\n†\0\0«ˇˇˇ†\0\0\n†\0\0»ˇˇˇ†\0\0\n†\0\0…ˇˇˇ†\0\0\n†\0\0 ˇˇˇ†\0\0\n†\0\0Àˇˇˇ†\0\0\n†\0\0Ãˇˇˇ†\0\0\n†\0\0Õˇˇˇ†\0\0\n†\0\0Œˇˇˇ†\0\0\n†\0\0œˇˇˇ†\0\0\n†\0\0–ˇˇˇ†\0\0\n†\0\0—ˇˇˇ†\0\0\n†\0\0“ˇˇˇ†\0\0\n†\0\0”ˇˇˇ†\0\0\n†\0\0‘ˇˇˇ†\0\0\n†\0\0’ˇˇˇ†\0\0\n†\0\0÷ˇˇˇ†\0\0\n†\0\0◊ˇˇˇ†\0\0\n†\0\0ÿˇˇˇ†\0\0\n†\0\0Ÿˇˇˇ†\0\0\n†\0\0⁄ˇˇˇ†\0\0\n†\0\0€ˇˇˇ†\0\0\n†\0\0‹ˇˇˇ†\0\0\n†\0\0›ˇˇˇ†\0\0\n†\0\0ﬁˇˇˇ†\0\0\n†\0\0ﬂˇˇˇ†\0\0\n†\0\0‡ˇˇˇ†\0\0\n†\0\0·ˇˇˇ†\0\0\n†\0\0‚ˇˇˇ†\0\0\n†\0\0„ˇˇˇ†\0\0\n†\0\0‰ˇˇˇ†\0\0\n†\0\0Âˇˇˇ†\0\0\n†\0\0Êˇˇˇ†\0\0\n†\0\0Áˇˇˇ†\0\0\n†\0\0Ëˇˇˇ†\0\0\n†\0\0Èˇˇˇ†\0\0\n†\0\0Íˇˇˇ†\0\0\n†\0\0Îˇˇˇ†\0\0\n†\0\0Ïˇˇˇ†\0\0\n†\0\0Ìˇˇˇ†\0\0\n†\0\0Óˇˇˇ†\0\0\n†\0\0Ôˇˇˇ†\0\0\n†\0\0ˇˇˇ†\0\0\n†\0\0Òˇˇˇ†\0\0\n†\0\0Úˇˇˇ†\0\0\n†\0\0Ûˇˇˇ†\0\0\n†\0\0Ùˇˇˇ†\0\0\n†\0\0ıˇˇˇ†\0\0\n†\0\0ˆˇˇˇ†\0\0\n†\0\0˜ˇˇˇ†\0\0\n†\0\0¯ˇˇˇ†\0\0\n†\0\0˘ˇˇˇ†\0\0\n†\0\0˙ˇˇˇ†\0\0\n†\0\0˚ˇˇˇ†\0\0\n†\0\0¸ˇˇˇ†\0\0\n†\0\0˝ˇˇˇ†\0\0\n†\0\0˛ˇˇˇ†\0\0\n†\0\0ˇˇˇˇ†\0\0˛\0\0\0ˇˇˇˇxÊ\0\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0\\µ\0\Z\0\0\0\0\0\0\"\0˛',8610,1,1779591088,3124544424,1,0,0,1779591110,31,1902,0,0,43200,-1,2508,10,0,10,0,10,0,10,0,10,0,11,47,10,0,0,'',1778671459,0,'',0),
(38,'Sofredor Quatro',1,21,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778671474,0,'',0),
(39,'Sofredor Cindo',1,21,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778671485,0,'',0),
(40,'Sofredor Seis',1,21,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778671498,0,'',0),
(41,'Sofredor Sete',1,21,737,0,2,3830,3830,6643249922,118,114,38,57,130,0,0,0,0,2,43,21960,21960,27687,100,1,156,55,7,'\0\0\0\0\0\0\0,√\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0à\0\0\Z\0\0\0\0\0\0\"\0h\0\0333?\r\0\0`¬333?\0\0`¬˛',7790,1,1779591458,3124544424,1,0,0,1779591543,31,429,0,0,43200,-1,2509,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778671523,0,'',0),
(42,'Sofredor Oito',1,21,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778671537,0,'',0),
(43,'Sofredor Nove',1,21,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778671547,0,'',0),
(44,'Darkis',1,22,8,0,2,185,185,4200,118,114,38,57,136,0,0,0,0,2,8,90,90,0,100,1,158,55,7,'\0\0\0ˇˇˇˇd\0\0\0\Z\0\0\0\0\0\0\"\0˛',500,0,0,0,1,0,0,1778694024,0,5336081887,0,0,43200,-1,2514,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778693863,0,'',0),
(45,'Nightmare Sanguine',1,23,2054,0,4,30875,30875,144100610540,75,114,114,57,131,3,0,0,0,0,10,10320,10320,80449325,100,1,291,123,7,'\0\0\0\0\0\0\0¯*\0\0\Z\0\0\0\0\0\0\"\0˘\0\0öôô>\r\0\0¿¡öôô>\0\0¿¡˛',51650,1,1780020065,3124544424,1,0,0,1780020188,31,127052,0,38838680,43200,-1,2513,10,0,10,0,112,699421,10,0,10,0,84,73786,10,0,0,'',1778707924,0,'',0),
(46,'Sabrosa',1,24,8,0,2,185,185,4200,118,114,38,57,136,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,0,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778720890,0,'',0),
(47,'Kokies',1,25,8,0,1,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778783519,0,'',0),
(48,'Floki',1,26,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,147,53,7,'\0\0\0ˇˇˇˇd\0\0\0\Z\0\0\0\0\0\0\"\0˛',500,1,0,0,1,0,0,1778811982,0,3557623961,0,0,43200,-1,2516,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778811956,0,'',0),
(49,'Lord Xucreza',1,27,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,159,53,7,'\0\0\0ˇˇˇˇd\0\0\0\Z\0\0\0\0\0\0\"\0˛',500,1,0,0,1,0,0,1778858993,0,3557717935,0,0,43200,-1,2516,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778858921,0,'',0),
(50,'Two One',1,28,8,0,1,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,143,54,7,'\0\0\0ˇˇˇˇd\0\0\0\Z\0\0\0\0\0\0\"\0˛',500,1,0,0,1,0,0,1778870680,0,3557741342,0,0,43200,-1,2516,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778870606,0,'',0),
(51,'Ivokz Mazdax',1,29,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778892867,0,'',0),
(52,'Ebola Com Gonoreia',1,29,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778892887,0,'',0),
(53,'Lord Paulistinha',1,30,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778937752,0,'',0),
(54,'Assassin Of Massacre',1,30,25,0,1,270,270,229800,118,114,38,57,1824,0,0,0,0,1,8,580,600,2400,100,1,148,53,7,'',670,1,1778938248,1943773229,1,0,0,1778938394,0,146,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778937792,0,'',0),
(55,'Henrique',1,31,8,0,1,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,153,54,7,'',500,1,1778938202,2849655729,1,0,0,1778938263,0,61,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778938177,0,'',0),
(56,'Grim Heer',1,32,3737,0,2,18830,18830,868828309132,95,83,82,95,130,2,0,0,0,0,104,111960,111960,20316007,100,1,291,121,7,'\0\0\0\0\0\0\0îˇ\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0PF\0\0\Z\0\0\0\0\0\0\"\0–\0\0333?\r\0\0`¬333?\0\0`¬˛',37790,1,1780012589,3124544424,1,0,1780104124,1780017724,31,134583,0,119409680,43200,-1,2515,10,0,10,0,10,0,10,0,10,0,26,44764,10,0,0,'',1778938247,0,'',1),
(57,'Hydrazinha',1,33,1624,0,2,8265,8265,71131905624,95,95,38,95,142,0,0,0,0,0,80,46940,48570,2223746,100,1,153,54,7,'\0\0\0\0\0\0\0<Í\0\Z\0\0\0\0\0\0\"\0˛',16660,0,1780026161,3124544424,1,0,0,1780026266,0,56332,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,16,197,10,0,0,'',1778938381,0,'',0),
(58,'Mateusz Dragon Wielki',1,30,213,0,2,1210,1210,157177821,118,114,38,57,130,0,0,0,0,3,47,6240,6240,79815,100,1,153,54,7,'\0\0\0\0\0\0\0(\0\Z\0\0\0\0\0\0\"\0˛\0 \0\0ˇˇˇˇÑ=\0\Z\0\0\0\0\0\0\"\0p\0\0\0\0\0 \0\0\0\0∏\0\0\0\0\0!\0\0\0\0˛\0\0\0\0\0\0\0î\0\0\Z\0\0\0\0\0\0\"\0ä\0\0333?\r\0\0`¬333?\0\0`¬˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0\0\"\0˛',2550,1,1778939249,1943773229,1,0,0,1778939313,0,902,0,0,43200,-1,2509,10,0,10,0,10,0,10,0,10,0,10,87,10,0,0,'',1778938389,0,'',0),
(59,'Medusinha',1,34,1535,0,2,7820,7820,60157334019,96,0,95,96,149,0,0,0,0,3,82,45900,45900,3284981,100,1,153,55,7,'\0\0\0\0\0\0\0\0Ù\0\Z\0\0\0\0\0\0\"\0˛',15770,0,1780026161,3124544424,1,0,0,1780026263,0,56945,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,13,256,10,0,0,'',1778938759,0,'',0),
(60,'Charlovin Degrade',1,35,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,158,55,7,'',500,1,1778940883,3823781065,1,0,0,1778940944,0,61,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778940877,0,'',0),
(61,'Murito',1,36,666,0,8,9987,10055,4894469114,118,114,38,57,131,0,0,0,0,0,11,2750,3380,94719380,100,1,462,52,13,'\0\0\0ˇˇˇˇlË\0\0\Z\0\0\0\0\0\0\"\0˛',16950,1,1778970347,706206397,1,0,0,1778970345,31,82468,0,95332,43200,-1,2479,10,0,10,0,39,619,107,442643,10,0,83,18709,10,0,0,'',1778941163,0,'',0),
(62,'Azeroth',1,37,995,0,8,14970,14990,16345555358,118,114,38,57,134,0,0,0,0,2,10,4965,5025,34836678,200,1,147,55,7,'',25175,1,1778966547,3452241709,1,0,0,1778966892,31,36317,0,744791,43200,-1,2232,10,0,10,0,95,93060,10,0,10,0,52,81,10,0,0,'',1778942450,0,'',0),
(63,'Jess',1,18,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778943692,0,'',0),
(64,'Koi',1,38,8014,0,7,80245,80245,8573610259607,114,128,114,114,129,3,0,0,0,1,38,119197,120180,454810320,200,1,155,55,7,'',160620,1,1780024558,2853624509,1,0,1780595682,1780024688,31,1018559,0,951891575,43200,-1,2520,29,1560,10,0,10,0,10,0,136,4059627,86,126361,10,0,0,'',1778943741,0,'',8),
(65,'Obito',1,39,8,0,3,44,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,153,44,8,'\0\0\0ˇˇˇˇP√\0\0\Z\0\0\0\0\0\0\"\0˛',500,1,1778944626,971661165,1,0,0,1778944682,0,56,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778944115,0,'',0),
(66,'The Punisher',1,40,8,0,4,185,185,4200,118,114,38,57,131,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778944620,0,'',0),
(67,'Dodge',1,39,8792,0,2,40545,44105,11322261444269,85,79,38,57,150,0,0,0,0,0,102,255417,263610,9834808,100,1,150,55,7,'\0\0\0\0\0\0\04!\0\0\Z\0\0\0\0\0\0\"\0˛',88340,0,1779775371,2162843501,1,0,1779872306,1779777906,31,61414,0,7618316,43200,-1,2514,10,0,10,0,10,0,10,0,10,0,22,4986,10,0,0,'',1778944721,0,'',0),
(68,'Madara',1,41,174,0,3,1845,1845,85840135,118,114,38,57,1824,0,0,0,0,2,11,2520,2580,33747,100,1,37,45,6,'',3820,1,1779775202,2162843501,1,0,0,1779775339,0,16534,0,0,43200,-1,2520,30,1095,10,0,10,0,10,0,102,118363,21,53,10,0,0,'',1778946053,0,'',0),
(69,'Xamansmz',1,42,1073,0,6,5510,5510,20509295463,118,114,38,57,130,0,0,0,0,2,107,31920,32040,20791281,200,1,119,51,6,'',11150,1,1779399017,1099048369,1,0,0,1779399225,0,74871,0,8512296,43200,-1,2514,25,1792,14,219,10,0,10,0,10,0,32,263779,10,0,0,'',1778946625,0,'',0),
(70,'Jezy',1,36,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778946657,0,'',0),
(71,'Senshii',1,43,2701,0,2,13650,13650,327695387340,118,114,38,57,130,0,0,0,0,1,110,80440,80880,49086876,100,1,232,125,5,'',27430,1,1779757638,706206397,1,0,0,1779757639,31,66008,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,90,10,0,0,'',1778947199,0,'',0),
(72,'Agrotaigo',1,44,44,0,3,545,545,1269956,118,114,38,57,1824,0,0,0,0,3,7,630,630,11944,100,1,156,54,7,'\0 \0\0ˇˇˇˇ‹^\0\Z\0\0\0\0\0\0\"\0†\0\0\0\0\0 \0\0\0\0†\0\0\0\0\0!\0\0\0\0˛',1220,1,1778951073,3104744356,1,0,0,1778951095,0,304,0,0,43200,-1,2514,23,227,10,0,10,0,10,0,30,32,19,103,10,0,0,'',1778950723,0,'',0),
(73,'Demoli',1,44,375,0,1,2020,2020,869295167,118,114,38,57,1824,0,0,0,0,3,46,11100,11100,96601,100,1,1077,951,7,'\0 \0\0ˇˇˇˇ∏Û\0\Z\0\0\0\0\0\0\"\0p\0\0\0\0\0 \0\0\0\0∏\0\0\0\0\0!\0\0\0\0˛',4170,1,1779834707,3731876282,1,0,0,1779835248,0,1473,0,6380,43200,-1,2516,10,0,10,0,10,0,10,0,10,0,10,83,10,0,0,'',1778951092,0,'',0),
(75,'Polomon Segundo',1,45,1998,0,6,10135,10135,132705053672,118,114,38,57,130,0,0,0,0,0,99,46784,59790,9414418,200,1,154,40,8,'\0\0\0ˇˇˇˇ¯ß\0\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0Xå\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0PF\0\0\Z\0\0\0\0\0\0\"\0M\0\0333?\r\0\0`¬333?\0\0`¬˛',20400,1,1779753157,745038281,1,0,0,1779753384,31,207612,0,17308418,43200,-1,2516,12,72,10,0,16,501,10,0,10,0,27,32391,10,0,0,'',1778951555,0,'',0),
(76,'Baby',1,46,626,0,4,9279,9455,4057054200,118,114,38,57,136,0,0,0,0,0,8,3180,3180,1272900,100,1,474,52,13,'\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\"\0˛',15950,0,1779752208,745038281,1,0,0,1779755680,0,758323,0,244235,43200,-1,2520,10,0,10,0,132,4339642,10,0,10,0,105,631837,10,0,0,'',1778951998,0,'',0),
(77,'Utito Tempo Sann',1,47,2023,0,3,20335,20335,137623566113,114,114,97,114,133,3,0,0,0,1,33,29745,30315,54384047,100,1,150,50,7,'\0\0\0\0\0\0\0X\0\0\Z\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>\0\0\0Vˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0˛\0\0\0\0\0\0\00u\0\0\Z\0\0\0\0\0\0\"\0Á\0\0öôô>\r\0\0¿¡öôô>\0\0¿¡˛',40800,1,1779804576,332595075,1,0,0,1779804607,31,93433,0,21585543,43200,-1,2492,11,52,10,0,10,0,10,0,125,1510905,85,37616,10,0,0,'',1778952242,0,'',0),
(78,'Hammer Of Steel',1,48,1905,0,7,19155,19155,114950086581,128,114,132,109,141,0,0,0,0,1,31,28545,28545,29722595,200,1,147,65,7,'Ä\0\0\0\0\0\0\0L\0\Z\0\0\0\0\0\0\"\0˛\0\0\0ˇˇˇˇ<s\0\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0–\0\0\Z\0\0\0\0\0\0\"\0†\0\0öôô>\r\0\0¿¡öôô>\0\0¿¡˛\0\0\0ˇˇˇˇ‹\0\0\Z\0-\0\0\0\0\"\0˛\0\0\0ˇˇˇˇ‹\0\0\Z\0\0\0\0\0\"\0˛\0\0\0ˇˇˇˇË\0\0\Z\0\0\0\0\0\"\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0\0\"\0˛',38440,0,1778968211,2857614769,1,0,0,1778979113,31,26387,0,8690173,43200,255,2178,15,109,10,0,10,0,10,0,114,36287,10,0,10,0,0,'',1778952861,0,'',0),
(79,'Exevo Gran Mass Frigo',1,47,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,156,52,7,'',500,1,1779803773,332595075,1,0,0,1779803784,0,11,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778954265,0,'',0),
(80,'Roxy Floxy',1,49,60,0,2,445,445,3347720,94,114,94,94,1824,0,0,0,0,0,14,1650,1650,964,100,1,149,50,8,'\0 \0\0ˇˇˇˇ *\0\Z\0\0\0\0\0\0\"\0p\0\0\0\0\0 \0\0\0\0∏\0\0\0\0\0!\0\0\0\0˛',1020,1,1778964301,36837715,1,0,0,1778964549,0,530,0,0,43200,-1,2514,10,0,10,0,10,0,10,0,10,0,13,100,10,0,0,'',1778963970,0,'',0),
(81,'Headshot',1,50,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,157,55,7,'',500,1,1778966096,2059741371,1,0,0,1778966099,0,69,0,0,43200,-1,2516,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778965704,0,'',0),
(82,'Druideira',1,50,756,0,2,3925,3925,7152695102,118,114,38,57,130,0,0,0,0,1,100,22530,22530,17453166,100,1,146,54,7,'\0\0\0\0\0\0\0@\0\0\Z\0\0\0\0\0\0\"\0Ç\0\0333?\r\0\0`¬333?\0\0`¬˛\0\0\0\0\0\0\0`ﬁ\0\Z\0\0\0\0\0\0\"\0˛',7980,1,1779039734,2059741371,1,0,0,1779039747,0,52280,0,312468,43200,-1,2385,10,0,10,0,10,0,10,0,10,0,28,500,10,0,0,'',1778966093,0,'',0),
(83,'Pampers',1,51,7990,0,8,119915,119915,8496724508303,114,0,114,114,288,3,0,0,0,1,11,40000,40000,13352442,200,1,148,56,7,'',200050,0,1779030157,474735546,1,0,0,1779043275,31,39687,0,0,43200,-1,2492,10,0,10,0,95,463,10,0,10,0,63,1780,10,0,0,'',1778970468,0,'',0),
(84,'Johnsons Baby',1,52,3765,0,6,18970,18970,888084729231,114,114,114,0,130,3,0,0,0,1,99,112650,112800,19771192,200,1,143,54,7,'\0\0\0\0\0\0\0Ï \0\Z\0\0\0\0\0\0\"\0˛',38070,1,1779043212,474735546,1,0,0,1779043273,0,54442,0,0,43200,-1,2471,10,0,10,0,10,0,10,0,10,0,26,29694,10,0,0,'',1778970749,0,'',0),
(85,'Huggies',1,53,9829,0,7,98395,98395,15821039066323,114,0,114,114,152,3,0,0,0,3,31,147405,147405,3687174,200,1,151,58,7,'\0\0\0\0\0\0\0%\0\0\Z\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\06\0\0\0Ñˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0˛\0\0\0ˇˇˇˇ‹\0\0\Z\0á\0\0\0\0\"\0˛\0\0\0ˇˇˇˇ‹\0\0\Z\0\0\0\0\0\"\0˛\0\0\0ˇˇˇˇ‹\0\0\Z\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0Ù~\0\0\Z\0\0\0\0\0\0\"\02\0\0öôô>\r\0\0¿¡öôô>\0\0¿¡˛\0\0\0ˇˇˇˇ‹\0\0\Z\0\0\0\0\0\"\0˛\0\0\0ˇˇˇˇ‹\0\0\Z\0\0\0\0\0\"\0˛\0\0\0ˇˇˇˇË\0\0\Z\0\0\0\0\0\"\0˛',196920,1,1779043197,474735546,1,0,0,1779043209,31,53681,0,0,43200,-1,2520,12,22,10,0,10,0,10,0,109,46226,62,5879,10,0,0,'',1778970800,0,'',0),
(86,'Avaliadordepessa',1,54,59,0,3,695,695,3231695,114,0,0,67,1825,0,0,0,0,1,8,855,855,966,100,1,150,50,7,'',1520,0,1778978322,2292522088,1,0,0,1778978424,0,437,0,0,43200,-1,2516,16,92,10,0,10,0,10,0,52,1259,11,12,10,0,0,'',1778977925,0,'',0),
(87,'Vitor Pereira',1,55,8,0,4,185,185,4200,118,114,38,57,131,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778979230,0,'',0),
(88,'Eterno Murilo Snow',1,56,200,0,2,1145,1145,130654860,118,114,38,57,130,3,0,0,0,0,23,2164,5850,420,100,1,151,57,7,'\0 \0\0ˇˇˇˇàÑ\0\Z\0\0\0\0\0\0\"\0p\0\0\0\0\0 \0\0\0\0∏\0\0\0\0\0!\0\0\0\0˛',2420,1,1778982045,2409300145,1,0,0,1778982973,0,1267,0,0,43200,-1,2508,10,0,10,0,10,0,10,0,10,0,12,7,10,0,0,'',1778981693,0,'',0),
(89,'Zoroak',1,57,38,0,3,485,485,791400,118,114,38,57,129,0,0,0,0,3,8,540,540,0,100,1,153,54,7,'',1100,1,1779004842,3233543850,1,0,0,1779012703,31,23057,0,0,43200,-1,2514,25,606,10,0,10,0,10,0,115,543652,15,80,10,0,0,'',1778983337,0,'',0),
(90,'Gaguinho',1,58,92,0,2,605,605,12565800,118,114,38,57,130,0,0,0,0,0,14,2610,2610,842,100,1,126,49,6,'',1340,1,1778984263,2974788909,1,0,0,1778984618,0,475,0,0,43200,-1,2514,10,0,10,0,10,0,10,0,10,0,11,20,10,0,0,'',1778983697,0,'',0),
(91,'Misterio',1,58,99,0,3,1095,1095,15351665,118,114,38,57,129,0,0,0,0,2,9,1455,1455,10186,100,1,307,197,8,'',2320,1,1779032542,2974788909,1,0,0,1779032570,0,14363,0,0,43200,-1,2506,10,0,10,0,10,0,10,0,106,239069,10,0,10,0,0,'',1778984615,0,'',0),
(92,'Ryozo',1,59,8,0,3,185,185,4200,94,0,114,114,128,0,0,0,0,3,8,90,90,0,100,1,155,55,7,'\0 \0\0ˇˇˇˇ¯÷\r\0\Z\0\0\0\0\0\0\"\0†\0\0\0\0\0 \0\0\0\0†\0\0\0\0\0!\0\0\0\0˛',500,1,1778985579,2151047696,1,0,0,1778985849,0,270,0,0,43200,-1,2518,21,77,10,0,10,0,10,0,36,157,10,0,10,0,0,'',1778985377,0,'',0),
(93,'Madre',1,60,8,0,2,185,185,4200,118,114,38,57,136,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,0,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778985424,0,'',0),
(94,'Jotinha',1,61,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,153,54,7,'',500,1,1778987876,2165956653,1,0,0,1778987936,0,60,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778987838,0,'',0),
(95,'Nego Preto',1,62,32,0,2,305,305,466200,118,114,38,57,130,0,0,0,0,2,8,810,810,2400,100,1,143,54,7,'',740,1,1779149194,361824689,1,0,0,1779149196,0,396,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,30,10,0,0,'',1778989944,0,'',0),
(96,'Two Onee',1,63,52,0,1,405,405,2098059,118,114,38,57,130,0,0,0,0,3,10,1410,1410,182,100,1,159,53,7,'',940,1,1778990170,467047603,1,0,0,1778990236,0,276,0,0,43200,-1,2516,10,0,10,0,10,0,10,0,10,0,10,57,10,0,0,'',1778989954,0,'',0),
(97,'El wuazonbb',1,64,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,156,51,7,'',500,1,1778998140,253184190,1,0,0,1778998200,0,60,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1778998111,0,'',0),
(98,'Archerhur',1,65,44,0,3,536,545,1246200,118,114,38,57,129,0,0,0,0,2,8,630,630,0,100,1,292,150,7,'',1220,1,1779011715,1468736945,1,0,0,1779011888,0,236,0,0,43200,-1,2516,10,0,10,0,10,0,10,0,32,179,10,0,10,0,0,'',1779011566,0,'',0),
(99,'Qansar',1,66,8,0,4,185,185,4200,118,114,38,57,131,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779023531,0,'',0),
(100,'Winchester',1,67,401,0,1,2150,2150,1065151208,118,114,38,57,150,0,0,0,0,2,63,11880,11880,642557,100,1,158,55,7,'',4430,0,1779028940,121480237,1,0,0,1779029008,0,4201,0,8053786,43200,-1,2460,16,176,10,0,10,0,10,0,10,0,14,345,10,0,0,'',1779024200,0,'',0),
(101,'King',1,68,7,0,3,175,175,3780,118,114,38,57,129,0,0,0,0,1,7,75,75,11364,100,1,153,50,7,'',480,1,1779027032,1684886462,1,0,0,1779027035,0,70,0,0,43200,-1,2516,20,245,10,0,10,0,10,0,10,0,12,33,10,0,0,'',1779026833,0,'',0),
(102,'Prince',1,68,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779026860,0,'',0),
(103,'Bonnie Bennette',1,69,8,0,2,185,185,4200,118,114,38,57,136,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,0,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779029985,0,'',0),
(104,'Zeeh Joga Facil',1,70,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,150,50,7,'',500,1,1779031217,2661054651,1,0,0,1779031256,0,39,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779031179,0,'',0),
(105,'Wuachumirufa',1,71,8,0,2,185,185,4200,118,114,38,57,136,0,0,0,0,2,8,90,90,0,100,1,147,53,7,'',500,0,1779035944,1320047793,1,0,0,1779036005,0,61,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779035912,0,'',0),
(106,'Black Druid',1,72,53,0,2,410,410,2333400,118,114,38,57,136,0,0,0,0,1,10,1420,1440,2999,100,1,157,58,7,'\0\0\0ˇˇˇˇ\\D\0\0\Z\0\0\0\0\0\0\"\0˛',950,0,1779036245,3208502970,1,0,0,1779036332,31,124,0,0,43200,-1,2516,10,0,10,0,10,0,10,0,10,0,11,20,10,0,0,'',1779036154,0,'',0),
(107,'Soul War',1,73,1433,0,5,7310,7310,48861638124,91,0,0,91,130,3,0,0,0,2,95,42840,42840,2601371,200,1,152,55,7,'',14750,1,1779052475,3290141363,1,0,0,1779056190,0,10259,0,0,43200,-1,2374,10,0,10,0,10,0,10,0,10,0,16,947,10,0,0,'',1779045627,0,'',0),
(108,'Others',1,74,8,0,1,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779048956,0,'',0),
(109,'Black Skull',1,75,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,153,54,7,'',500,1,1779057182,471549873,1,0,0,1779057223,0,41,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779057148,0,'',0),
(110,'Donat',1,76,796,0,2,4125,4125,8349794529,87,87,87,87,152,3,0,0,0,0,88,23730,23730,4795299,100,1,152,55,7,'',8380,1,1779207882,2838851406,1,0,0,1779208412,0,133827,0,311871,43200,-1,2447,10,0,10,0,10,0,10,0,10,0,16,555,10,0,0,'',1779107740,0,'',0),
(111,'Fornoek',1,77,8,0,4,185,185,4200,118,114,38,57,136,0,0,0,0,2,8,90,90,0,100,1,150,50,7,'',500,0,1779126665,2399061660,1,0,0,1779126726,0,61,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779126618,0,'',0),
(112,'Nega Ju',1,78,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,153,50,7,'',500,1,1779129161,2805279438,1,0,0,1779129222,0,61,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779129154,0,'',0),
(113,'Loko do pally',1,79,106,0,7,1135,1165,19259148,118,114,38,57,129,0,0,0,0,1,7,1560,1560,16865,101,1,150,59,7,'\0 \0\0ˇˇˇˇ¸≤\0\Z\0\0\0\0\0\0\"\0∏\0\0\n\0\0\0 \0\0\0\0∏\0\0\n\0\0\0!\0\0\0\0˛\0@\0\0ˇˇˇˇ,@\0\Z\0\0\0\0\0\0\"\0\0\0\0ò:\0\0˛',2460,1,1779760237,1964385981,1,0,0,1779760406,0,4465,0,0,43200,-1,2520,32,1716,10,0,10,0,10,0,42,42,17,2,10,0,0,'',1779149082,0,'',0),
(114,'Mage Rushmax',1,79,7993,0,6,40110,40110,8504883193491,118,114,38,57,130,0,0,0,0,0,116,239640,239640,542193,200,1,147,51,7,'\0\0\0\0\0\0\0Ña\0\Z\0\0\0\0\0\0\"\0˛',80350,1,1780026160,1964385981,1,0,1780223811,1780027273,31,860191,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,29,13421,10,0,0,'',1779153818,0,'',3),
(115,'Loko Do Pallyz',1,80,8,0,3,176,185,4200,118,114,38,57,136,0,0,0,0,1,8,90,90,0,100,1,150,52,8,'\0\0\0ˇˇˇˇxÊ\0\0\Z\0\0\0\0\0\0\"\0˛',500,0,1779157588,1964385981,1,0,0,1779157620,0,32,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,19,16,10,0,10,0,0,'',1779157549,0,'',0),
(116,'Mateusxx',1,80,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,3,8,90,90,0,100,1,150,49,7,'',500,1,1779157702,1964385981,1,0,0,1779157706,0,4,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779157662,0,'',0),
(117,'Lokazaoo',1,80,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,0,8,90,90,0,100,1,143,53,7,'',500,1,1779157697,1964385981,1,0,0,1779157700,0,3,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779157687,0,'',0),
(118,'Cain',1,81,43,0,3,532,535,1210200,118,114,38,57,129,0,0,0,0,0,8,615,615,0,100,1,151,53,7,'',1200,1,1779337408,3779820979,1,0,0,1779337495,0,558,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,47,17,10,0,10,0,0,'',1779175344,0,'',0),
(119,'Demtry',1,82,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,1,8,90,90,0,100,1,153,49,8,'',500,1,1779202177,3767738565,1,0,0,1779202320,0,208,0,0,43200,-1,2516,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779201705,0,'',0),
(120,'Kina Rex',1,83,188,0,8,2885,2885,107824636,118,114,38,57,131,0,0,0,0,0,8,930,990,1234047,100,1,151,53,7,'',5000,1,1779204357,1270858929,1,0,0,1779204662,31,1644,0,2610,43200,-1,2501,10,0,10,0,48,86,10,0,10,0,13,55,10,0,0,'',1779202988,0,'',0),
(121,'Sakamoto',1,42,375,0,3,3855,3855,866645700,118,114,38,57,129,0,0,0,0,3,16,5535,5595,252554,100,1,143,52,7,'\0\0\0ˇˇˇˇ»2\0\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0ƒ	\0\0\Z\0\0\0\0\0\0\"\0\n\0\0öôô>\r\0\0¿¡öôô>\0\0¿¡˛',7840,1,1779396981,1099048369,1,0,0,1779397012,0,3412,0,10256,43200,-1,2520,21,47,10,0,10,0,10,0,115,413902,76,53703,10,0,0,'',1779204064,0,'',0),
(122,'Star',1,84,8,0,3,185,185,4200,88,79,114,79,137,0,0,0,0,0,10,90,90,331,100,1,470,52,13,'\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\"\0˛',500,0,1779752258,745038281,1,0,0,1779755680,0,287782,0,0,43200,-1,2516,17,16,10,0,10,0,10,0,135,4005042,96,85483,10,0,0,'',1779232856,0,'',0),
(123,'Kiboom',1,85,1414,0,2,7215,7215,46996717538,118,114,38,57,130,0,0,0,0,1,80,42270,42270,609998,100,1,74,711,11,'\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\"\0˛',14560,1,1779261407,3649439423,1,0,0,1779263482,31,11928,0,4280000,43200,-1,2413,14,231,10,0,10,0,10,0,10,0,15,743,10,0,0,'',1779247987,0,'',0),
(124,'Bad Boy',1,86,1302,0,3,13095,13125,36642655904,118,114,38,57,134,0,0,0,0,1,25,19500,19500,3027375,94,1,156,53,7,'',26380,1,1779263334,3649439423,1,0,0,1779263556,31,9755,0,420210,43200,-1,2419,10,0,10,0,10,0,10,0,98,42547,16,76,10,0,0,'',1779253354,0,'',0),
(125,'Grana Um',1,87,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,147,53,7,'',500,1,1779260853,3649439423,1,0,0,1779260858,0,5,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779260634,0,'',0),
(126,'Grana Umm',1,87,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,147,53,7,'',500,1,1779260896,3649439423,1,0,0,1779260900,0,4,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779260652,0,'',0),
(127,'Grana Uh',1,87,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,146,51,7,'',500,1,1779260847,3649439423,1,0,0,1779260853,0,6,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779260663,0,'',0),
(128,'Grana Uoo',1,87,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,3,8,90,90,0,100,1,147,54,7,'',500,1,1779260968,3649439423,1,0,0,1779260988,0,20,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779260679,0,'',0),
(129,'Grana Ummp',1,87,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,3,8,90,90,0,100,1,150,54,7,'',500,1,1779260900,3649439423,1,0,0,1779260908,0,8,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779260691,0,'',0),
(130,'Grana Umoo',1,87,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,0,8,90,90,0,100,1,150,53,7,'',500,1,1779260908,3649439423,1,0,0,1779260968,0,60,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779260706,0,'',0),
(131,'Grana Umfj',1,87,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,3,8,90,90,0,100,1,148,54,7,'',500,1,1779260858,3649439423,1,0,0,1779260882,0,24,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779260717,0,'',0),
(132,'Grana Umjk',1,87,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,3,8,90,90,0,100,1,146,51,7,'',500,1,1779260891,3649439423,1,0,0,1779260896,0,5,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779260727,0,'',0),
(133,'Grana Umjj',1,87,8,0,2,185,185,4200,118,114,38,57,136,0,0,0,0,3,8,90,90,0,100,1,149,54,7,'',500,0,1779260882,3649439423,1,0,0,1779260891,0,9,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779260736,0,'',0),
(134,'Ozzy',1,88,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779287358,0,'',0),
(135,'Alef Junior',1,89,1119,0,7,11295,11295,23242359992,126,114,114,57,1824,0,0,0,0,0,18,16755,16755,70799,114,1,146,55,7,'',22720,1,1779507119,2023482669,1,0,1779609047,1779507460,31,190288,0,6720000,43200,-1,2519,51,52917,10,0,10,0,10,0,128,75230,57,1829,10,0,0,'',1779300630,0,'',2),
(136,'Stiick',1,90,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779306216,0,'',0),
(137,'Brunin Catarina',1,91,8,0,3,131,185,4200,118,114,38,57,128,0,0,0,0,2,8,90,90,0,100,1,152,47,9,'\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\"\0˛\0 \0\0ˇˇˇˇº⁄\0\Z\0\0\0\0\0\0\"\0†\0\0\0\0\0 \0\0\0\0†\0\0\0\0\0!\0\0\0\0˛',500,1,1779319278,3331677617,1,0,0,1779319379,0,101,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,38,307,10,0,10,0,0,'',1779319141,0,'',0),
(138,'Kritical',1,92,115,0,3,1255,1255,24536819,118,114,38,57,136,0,0,0,0,3,7,1695,1695,11290,100,1,155,55,7,'',2640,0,1779883521,2105124141,1,0,0,1779883526,0,737,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,57,1116,10,0,10,0,0,'',1779394804,0,'',0),
(139,'Mttheusx',1,93,7,0,2,180,180,3780,0,0,0,0,130,0,0,0,0,2,5,60,60,2238,100,1,143,56,7,'',490,1,1779485815,3741819949,1,0,0,1779485887,0,20074,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779416435,0,'',0),
(140,'Duoner',1,94,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,1,8,90,90,0,100,1,144,55,7,'',500,1,1779432454,847444411,1,0,0,1779432587,0,133,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779432092,0,'',0),
(141,'Dage',1,95,8,0,4,185,185,4200,118,114,38,57,131,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779475535,0,'',0),
(142,'Shanks',1,96,175,0,3,1855,1855,87085291,118,114,38,57,129,0,0,0,0,2,14,2595,2595,105313,100,1,152,55,7,'',3840,1,1779477430,1888592804,1,0,0,1779478027,0,597,0,931,43200,-1,2514,10,0,10,0,10,0,10,0,54,862,10,0,10,0,0,'',1779477382,0,'',0),
(143,'Crazy Enopes',1,97,348,0,2,1845,1885,691785462,118,114,38,57,130,0,0,0,0,2,36,10290,10290,26920,100,1,282,220,7,'\0 \0\0ˇˇˇˇf\n\0\Z\0\0\0\0\0\0\"\0p\0\0\0\0\0 \0\0\0\0∏\0\0\0\0\0!\0\0\0\0˛',3900,1,1779495579,181742533,1,0,0,1779496347,0,1174,0,0,43200,-1,2505,10,0,10,0,10,0,10,0,10,0,13,221,10,0,0,'',1779494744,0,'',0),
(144,'Crazy Paladin',1,97,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779494856,0,'',0),
(145,'Expzin',1,98,8,0,2,185,185,4200,118,114,38,57,128,0,0,0,0,2,8,90,90,0,100,1,152,53,7,'',500,1,1779507998,741531059,1,0,0,1779508045,0,47,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779507902,0,'',0),
(146,'Old Pally',1,98,163,0,3,1735,1735,69913394,118,114,38,57,129,0,0,0,0,2,9,2255,2415,29467,100,1,151,53,7,'',3600,1,1779508394,741531059,1,0,0,1779508571,0,517,0,0,43200,-1,2516,13,46,10,0,10,0,10,0,51,246,10,29,10,0,0,'',1779508043,0,'',0),
(147,'Klaus',1,99,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,3,8,90,90,0,100,1,147,48,7,'',500,1,1779530276,3154921905,1,0,0,1779530342,0,66,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779530099,0,'',0),
(148,'Lexus pro',1,100,5195,0,3,42647,52055,2334281046191,94,0,88,0,133,0,0,0,0,3,31,77895,77895,30345061,100,1,153,50,7,'\0\0\0ˇˇˇˇ®ﬁ\0\0\Z\0\0\0\0\0\0\"\0˛',104240,1,1779668388,757101246,1,0,0,1779668431,31,194377,0,0,43200,-1,2388,10,0,10,0,10,0,10,0,123,855983,27,143,10,0,0,'',1779558570,0,'',0),
(149,'Lexus Max',1,100,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,3,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779560331,0,'',0),
(150,'Lexus big',1,101,5119,0,2,25740,25740,2233357669253,0,88,88,94,133,0,0,0,0,0,100,153420,153420,20778884,100,1,153,49,7,'',51610,1,1779668359,757101246,1,0,0,1779668411,31,204564,0,15197899,43200,-1,2386,10,0,10,0,10,0,10,0,10,0,19,428,10,0,0,'',1779560521,0,'',0),
(151,'Cimed',1,102,4260,0,7,42705,42705,1287100314372,88,82,114,82,289,2,0,0,0,1,32,63270,63870,56044498,200,1,148,56,7,'\0 \0\0ˇˇˇˇ‡E\0\Z\0\0\0\0\0\0\"\0∏\0\0\n\0\0\0 \0\0\0\0∏\0\0\n\0\0\0!\0\0\0\0˛\0\0\0\0\0\0\0)\0\0\Z\0\0\0\0\0\0\"\0%\n\0\0öôô>\r\0\0¿¡öôô>\0\0¿¡˛',85540,1,1780002006,2852786623,1,0,1783820776,1779921623,31,51750,0,17521481,43200,-1,2520,53,3481,10,0,10,0,10,0,118,249138,70,7261,10,0,0,'',1779567071,0,'',45),
(152,'Tomas Turbano',1,103,8,0,2,185,185,4200,118,114,38,57,136,0,0,0,0,3,8,90,90,0,100,1,156,53,7,'',500,0,1779574279,2694263731,1,0,0,1779574408,0,271,0,0,43200,-1,2514,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779573989,0,'',0),
(153,'Clickz',1,104,29,0,3,204,395,364200,118,114,38,57,129,0,0,0,0,1,8,405,405,0,100,1,156,45,8,'\0 \0\0ˇˇˇˇ∏R	\0\Z\0\0\0\0\0\0\"\0†\0\0\0\0\0 \0\0\0\0†\0\0\0\0\0!\0\0\0\0˛',920,1,1779583257,1880097467,1,0,0,1779583470,0,213,0,0,43200,-1,2518,21,257,10,0,10,0,10,0,10,0,13,59,10,0,0,'',1779583103,0,'',0),
(154,'Dona Do Cabare',1,105,7,0,1,180,180,3780,118,114,38,57,136,0,0,0,0,1,7,60,60,1288,100,1,152,55,7,'',490,0,1779658288,2863667633,1,0,0,1779658343,0,55,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779657536,0,'',0),
(155,'Killyan',1,106,3826,0,8,57455,57455,932535347633,114,114,0,114,134,0,0,0,0,0,11,19180,19180,159284276,200,1,470,52,13,'\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0To\0\0\Z\0\0\0\0\0\0\"\0!	\0\0öôô>\r\0\0¿¡öôô>\0\0¿¡˛\0\0\0\0\0\0\0%\0\0\Z\0\0\0\0\0\"\0\0\0\0\0\0\0\0,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0˛\0\0\0ˇˇˇˇ‹\0\0\Z\0Ö\0\0\0\0\"\0˛\0\0\0ˇˇˇˇ‹\0\0\Z\0\0\0\0\0\"\0˛',95950,1,1780026159,2201662911,1,0,0,1780056295,31,1212860,0,0,43200,-1,2472,10,0,10,0,127,2130425,10,0,10,0,99,208481,10,0,0,'',1779659511,0,'',0),
(156,'Distancer',1,107,5502,0,7,55125,55125,2773715732919,118,114,38,57,129,0,0,0,0,1,33,82500,82500,64298749,200,1,156,48,7,'',110380,1,1779763034,1125633466,1,0,0,1779764217,31,161730,0,632258029,43200,-1,2501,10,0,10,0,10,0,10,0,126,1542274,24,7,10,0,0,'',1779669282,0,'',0),
(157,'Oi Tiu',1,108,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,146,51,7,'',500,1,1779681180,4217597363,1,0,0,1779681241,0,61,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779680775,0,'',0),
(158,'Hannah',1,109,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779714764,0,'',0),
(159,'Hanzel',1,109,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779714801,1,'',0),
(160,'Hanna',1,109,4093,0,1,20610,20610,1141283561067,91,91,114,114,150,0,0,0,0,0,125,118341,122640,103674866,100,1,355,116,7,'\0\0\0\0\0\0\0d\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\08J\0\0\Z\0\0\0\0\0\0\"\0¬\0\0333?\r\0\0`¬333?\0\0`¬˛',41350,0,1779925821,2652858302,1,0,0,1779926953,31,255116,0,170328287,43200,-1,2497,10,0,10,0,10,0,10,0,10,0,32,213106,10,0,0,'',1779714818,0,'',0),
(161,'Hanny',1,109,8,0,2,185,185,4200,118,114,38,57,136,0,0,0,0,3,8,90,90,0,100,1,0,0,0,'',500,0,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779714834,0,'',0),
(162,'Kinghel',1,109,8,0,4,185,185,4200,118,114,38,57,131,0,0,0,0,2,8,90,90,0,100,1,154,56,7,'',500,1,1779926955,2652858302,1,0,0,1779927649,0,694,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779714846,1,'',0),
(163,'Hanzell',1,110,2238,0,3,22485,22485,186424329537,91,91,114,114,129,0,0,0,0,0,34,33540,33540,57063073,100,1,152,55,7,'',45100,1,1779888266,2652858302,1,0,0,1779888299,0,197579,0,2716246,43200,-1,2507,16,123,10,0,10,0,10,0,126,1817838,10,86,10,0,0,'',1779715630,0,'',0),
(164,'Hannahh',1,111,3955,0,2,19920,19920,1030213756478,91,91,114,114,136,0,0,0,0,0,126,113369,118500,31021017,100,1,1021,637,4,'',39970,0,1779928447,2652858302,1,0,0,1779928753,31,258141,0,132288109,43200,-1,2457,10,0,10,0,10,0,10,0,10,0,33,591061,10,0,0,'',1779715667,0,'',0),
(165,'Gretel',1,112,3313,0,3,33235,33235,605063640409,91,91,114,114,147,3,0,0,0,3,35,49155,49665,24987785,100,1,150,59,7,'\0 \0\0ˇˇˇˇT!\r\0\Z\0\0\0\0\0\0\"\0†\0\0\0\0\0 \0\0\0\0†\0\0\0\0\0!\0\0\0\0˛\0\0\0ˇˇˇˇX\0\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0X\0\0\Z\0\0\0\0\0\0\"\0Ì\0\0öôô>\r\0\0¿¡öôô>\0\0¿¡˛',66600,0,1779928412,2652858302,1,0,0,1779928408,31,294313,0,443063958,43200,-1,2515,10,0,10,0,10,0,10,0,127,801433,69,21882,10,0,0,'',1779716526,0,'',0),
(166,'Assasixd',1,113,3153,0,4,47360,47360,521498342472,91,91,114,114,145,3,0,0,0,0,12,15715,15815,154979508,100,1,152,59,7,'\0 \0\0ˇˇˇˇD≠\0\Z\0\0\0\0\0\0\"\0∏\0\0\0\0\0 \0\0\0\0p\0\0\0\0\0!\0\0\0\0˛',79125,1,1779929310,2652858302,1,0,0,1779929306,0,292489,0,96537419,43200,-1,2496,10,0,10,0,114,354580,10,0,10,0,88,86936,10,0,0,'',1779716950,0,'',0),
(167,'Nikki Sixx',1,114,1709,0,2,8690,8690,82933541477,85,85,85,85,136,0,0,0,0,1,71,51120,51120,813436,100,1,152,54,7,'\0\0\0ˇˇˇˇlk\0\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0X\0\Z\0\0\0\0\0\0\"\0˛\0 \0\0ˇˇˇˇ`+\0\Z\0\0\0\0\0\0\"\0p\0\0\0\0\0 \0\0\0\0∏\0\0\0\0\0!\0\0\0\0˛',17510,0,1779751511,3650899898,1,0,1779839330,1779752942,31,6249,0,13443047,43200,-1,2442,10,0,10,0,10,0,10,0,10,0,17,1168,10,0,0,'',1779747787,0,'',1),
(168,'Betin',1,115,436,0,4,6115,6605,1363143450,118,114,38,57,131,0,0,0,0,2,8,2230,2230,0,100,1,42,180,10,'',11200,1,1779749344,2210404017,1,0,0,1779749879,0,658,0,0,43200,-1,2513,10,0,10,0,43,5,10,0,10,0,14,136,10,0,0,'',1779749127,0,'',0),
(169,'Tupikina',1,116,69,0,2,490,490,5044200,118,114,38,57,136,0,0,0,0,3,10,1920,1920,1199,100,1,143,54,7,'',1110,0,1779751112,2218322256,1,0,0,1779751279,0,167,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,13,215,10,0,0,'',1779751017,0,'',0),
(170,'Jhobii',1,117,8,0,1,185,185,4200,118,114,38,57,136,0,0,0,0,2,8,90,90,0,100,1,155,55,7,'',500,0,1779757463,3759137210,1,0,0,1779757489,0,66,0,0,43200,-1,2516,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779757312,0,'',0),
(171,'Tanka',1,118,4305,0,4,64640,64640,1328135384265,118,114,38,57,131,0,0,0,0,0,12,21475,21575,231238116,100,1,152,59,7,'',107925,1,1780024558,2853624509,1,0,0,1780024735,31,157171,0,150000,43200,-1,2520,67,6191,10,0,112,123110,10,0,10,0,48,898,10,0,0,'',1779757712,0,'',0),
(172,'Flam Teste',1,119,158,0,2,935,935,63689529,118,114,38,57,130,0,0,0,0,1,80,4435,4590,616839,100,1,155,55,7,'\0 \0\0ˇˇˇˇ\r\0\Z\0\0\0\0\0\0\"\0p\0\0\0\0\0 \0\0\0\0∏\0\0\0\0\0!\0\0\0\0˛',2000,1,1780013508,1605653693,1,0,0,1780013571,31,3612,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,24,8250,10,0,0,'',1779762404,0,'',0),
(173,'Toys',1,120,3873,0,8,57084,58160,967190947395,118,114,38,57,1824,0,0,0,0,3,11,19415,19415,191946874,200,1,278,184,6,'\0\0\0\0\0\0\0xi\0\0\Z\0\0\0\0\0\0\"\0=	\0\0öôô>\r\0\0¿¡öôô>\0\0¿¡˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0\0\"\0˛\0\0\0ˇˇˇˇ\0\0\0\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0–\0\0\Z\0\0\0\0\0\"\0\0\0\0\0\0\0\0%\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0˛\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\"\0˛',97125,1,1780045055,1605653693,1,0,0,1780056295,31,296539,0,183899840,43200,-1,2182,10,0,10,0,107,401755,10,0,10,0,52,2777,10,0,0,'',1779765848,0,'',0),
(174,'King Caldeira',1,120,8,0,3,185,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779765867,0,'',0),
(175,'Bkzerah',1,119,905,0,7,9155,9155,12301824316,118,114,38,57,1824,0,0,0,0,2,30,13035,13545,7106561,100,1,127,57,7,'',18440,1,1780020377,1605653693,1,0,0,1780020641,31,11902,0,353666,43200,-1,2511,10,0,10,0,10,0,10,0,118,415129,41,1150,10,0,0,'',1779768867,0,'',0),
(176,'Volka',1,121,2664,0,5,13465,13465,314432188114,118,114,38,57,130,0,0,0,0,3,92,79750,79770,1225396,200,1,369,118,7,'',27060,1,1779875787,700229933,1,0,0,1779876030,31,71073,0,43117732,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,25,25535,10,0,0,'',1779807996,0,'',0),
(177,'Skeps Koyote',1,121,1029,0,7,10395,10395,18084811829,10,12,9,11,129,0,0,0,0,2,23,15405,15405,1552002,106,1,613,100,6,'\0 \0\0ˇˇˇˇ¿∞\0\Z\0\0\0\0\0\0\"\0∏\0\0\n\0\0\0 \0\0\0\0∏\0\0\n\0\0\0!\0\0\0\0˛\0\0\0ˇˇˇˇ¥‹\0\0\Z\0\0\0\0\0\0\"\0˛Ä\0\0\0\0\0\0\0‹Û\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0d\0\0\Z\0\0\0\0\0\"\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0-\0\0\0‹ˇˇˇ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0˛\0\0\0\0\0\0\0<s\0\0\Z\0\0\0\0\0\0\"\0é\0\0öôô>\r\0\0¿¡öôô>\0\0¿¡˛',20920,1,1779813498,700229933,1,0,0,1779813601,31,4122,0,1926777,43200,-1,2457,18,129,10,0,10,0,10,0,90,46368,18,121,10,0,0,'',1779808344,0,'',0),
(178,'Choucha Prime',1,122,2125,0,2,10770,10770,159505715352,95,114,38,95,143,3,0,0,0,2,93,63600,63600,3515323,100,1,158,53,7,'\0\0\0\0\0\0\04\0\Z\0\0\0\0\0\0\"\0˛',21670,1,1780026161,3124544424,1,0,0,1780026255,31,256734,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,22,2787,10,0,0,'',1779828505,0,'',0),
(179,'Aimazing',1,123,2999,0,5,15140,15140,448680868910,124,78,78,114,145,3,0,0,0,3,114,89820,89820,43871564,200,1,148,53,7,'\0 \0\0ˇˇˇˇu\0\Z\0\0\0\0\0\0\"\0†\0\0\n\0\0\0 \0\0\0\0–\0\0\n\0\0\0!\0\0\0\0˛',30410,1,1780002359,2852786623,1,0,1787795700,1780002788,31,63458,0,8840939,43200,-1,2492,28,26284,10,0,10,0,10,0,10,0,32,41930,10,0,0,'',1779829617,0,'',91),
(180,'Momonga',1,124,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,3,8,90,90,0,100,1,0,0,0,'',500,1,0,0,1,0,0,0,0,0,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779829992,0,'',0),
(181,'Gus tavo',1,125,136,0,3,1465,1465,40924200,118,114,38,57,129,0,0,0,0,3,8,2010,2010,0,100,1,158,55,7,'\0\0\0ˇˇˇˇ$w\0\0\Z\0\0\0\0\0\0\"\0˛\0 \0\0ˇˇˇˇ†J\0\Z\0\0\0\0\0\0\"\0†\0\0\0\0\0 \0\0\0\0†\0\0\0\0\0!\0\0\0\0˛',3060,1,1779834472,2407769288,1,0,0,1779834475,31,209,0,0,43200,-1,2511,10,0,10,0,10,0,10,0,74,6816,15,140,10,0,0,'',1779833658,0,'',0),
(182,'Peidjado Roots',1,126,90,0,2,595,595,11524200,124,95,114,132,128,0,0,0,0,1,12,2550,2550,3286,100,1,310,200,8,'',1320,1,1779835635,3900974513,1,0,0,1779835769,0,581,0,0,43200,-1,2514,10,0,10,0,10,0,10,0,10,0,13,35,10,0,0,'',1779834934,0,'',0),
(183,'Yazuka',1,127,99,0,2,640,640,15580200,118,114,38,57,130,0,0,0,0,0,23,0,2820,10138,100,1,149,58,7,'\0\0\0ˇˇˇˇ§8\0\0\Z\0\0\0\0\0\0\"\0˛',1410,1,1779840932,973393474,1,0,0,1779841144,0,1338,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,12,140,10,0,0,'',1779835899,0,'',0),
(184,'Candy',1,128,535,0,3,5455,5455,2532314702,85,114,0,85,136,0,0,0,0,1,14,7995,7995,71968,100,1,161,47,7,'',11040,0,1779850729,2773645237,1,0,0,1779850921,31,1432,0,0,43200,-1,2492,10,0,10,0,10,0,10,0,67,5380,18,130,10,0,0,'',1779849309,0,'',0),
(185,'Intocable Joo',1,129,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,3,8,90,90,0,100,1,153,50,7,'',500,1,1779857608,4121830833,1,0,0,1779857669,0,61,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779857602,0,'',0),
(186,'Boyka',1,130,61,0,3,715,715,3544134,118,114,38,57,129,0,0,0,0,1,7,885,885,12140,100,1,150,54,7,'',1560,1,1779863186,572311452,1,0,0,1779863192,0,301,0,0,43200,-1,2513,26,251,10,0,18,198,10,0,10,0,18,200,10,0,0,'',1779862710,0,'',0),
(187,'Ainz Ooal Gown',1,131,8,0,2,185,185,4200,118,114,38,57,130,0,0,0,0,0,8,90,90,0,100,1,160,50,7,'',500,1,1779876614,643877248,1,0,0,1779876680,0,66,0,0,43200,-1,2518,10,0,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779876496,0,'',0),
(188,'Muerto tibia',1,132,8,0,3,95,185,4200,118,114,38,57,129,0,0,0,0,2,8,90,90,0,100,1,148,57,7,'',500,1,1779901717,38719945,1,0,0,1779901910,0,281,0,0,43200,-1,2516,10,30,10,0,10,0,10,0,10,0,10,0,10,0,0,'',1779901555,0,'',0),
(189,'Xenhort',1,133,2712,0,3,27225,27225,332033798416,118,114,38,57,129,0,0,0,0,1,27,40650,40650,11325389,100,1,152,55,7,'',54580,1,1779922298,2277036700,1,0,1780009790,1779924491,0,15963,0,14731646,43200,-1,2425,22,227,10,0,10,0,10,0,102,76863,51,1307,10,0,0,'',1779907619,0,'',1),
(190,'Loirah Kah',1,134,627,0,2,3280,3280,4086344658,114,114,79,88,147,0,0,0,0,1,45,17125,18660,102645,100,1,801,269,6,'\0 \0\0ˇˇˇˇ\\ﬁ\0\Z\0\0\0\0\0\0\"\0p\0\0\0\0\0 \0\0\0\0∏\0\0\0\0\0!\0\0\0\0˛\0\0\0ˇˇˇˇ`Í\0\0\Z\0\0\0\0\0\0\"\0˛\0\0\0\0\0\0\0å≠\0\Z\0\0\0\0\0\0\"\0˛\0\0\0ˇˇˇˇÙ\0\0\Z\0 \0\0\0\0\"\0˛\0\0\0ˇˇˇˇÙ\0\0\Z\0\0\0\0\0\"\0˛\0\0\0ˇˇˇˇÙ\0\0\Z\0\0\0\0\0\"\0˛\0\0\0ˇˇˇˇ‹\0\0\Z\0\0\0\0\0\"\0˛',6690,0,1779915711,3084018865,1,0,0,1779915710,31,1517,0,613651,43200,-1,2499,10,0,10,0,10,0,10,0,10,0,12,224,10,0,0,'',1779914395,0,'',0),
(191,'Magito',1,135,1335,0,2,6820,6820,39538430572,118,114,38,57,130,0,0,0,0,0,81,38960,39900,212043,100,1,151,60,7,'\0\0\0\0\0\0\0úc\0\0\Z\0\0\0\0\0\0\"\0˛',13770,1,1780024558,2853624509,1,0,0,1780024735,31,39728,0,0,43200,-1,2520,10,0,10,0,10,0,10,0,10,0,17,727,10,0,0,'',1779919579,0,'',0),
(192,'Kina Of King',1,136,143,0,4,2210,2210,47615116,118,114,38,57,128,0,0,0,0,1,4,705,765,31881,100,1,155,55,7,'\0\0\0\0\0\0\0‘0\0\0\Z\0\0\0\0\0\0\"\0\0\0\0öôô>\r\0\0¿¡öôô>\0\0¿¡˛',3875,1,1780001781,2852786623,1,0,0,1780001801,0,2087,0,0,43200,-1,2245,13,1,10,0,37,553,10,0,10,0,10,71,10,0,0,'',1779998933,0,'',0);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ondelete_players` BEFORE DELETE ON `players`
 FOR EACH ROW BEGIN
    UPDATE `houses` SET `owner` = 0 WHERE `owner` = OLD.`id`;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `players_online`
--

DROP TABLE IF EXISTS `players_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `players_online` (
  `player_id` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `spectators` int(11) NOT NULL DEFAULT 0,
  `broadcasting` tinyint(1) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players_online`
--

LOCK TABLES `players_online` WRITE;
/*!40000 ALTER TABLE `players_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roulette_plays`
--

DROP TABLE IF EXISTS `roulette_plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roulette_plays` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `reward_id` int(11) NOT NULL,
  `reward_count` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = rolling | 1 = pending | 2 = delivered',
  `created_at` bigint(20) NOT NULL DEFAULT unix_timestamp(),
  `updated_at` bigint(20) NOT NULL DEFAULT unix_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `player_id` (`player_id`),
  CONSTRAINT `roulette_plays_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roulette_plays`
--

LOCK TABLES `roulette_plays` WRITE;
/*!40000 ALTER TABLE `roulette_plays` DISABLE KEYS */;
INSERT INTO `roulette_plays` VALUES
(1,4,'40de1107-bbf8-4ce3-be31-874df2ef0f8f',2645,1,2,1779593981,1779593990),
(2,4,'da9feeaf-b567-4dac-a3b6-00dba8cea2c6',2173,1,2,1779593995,1779594004),
(3,4,'0d0220c2-779f-4d3a-af44-d86a71bb9937',2268,1,2,1779594370,1779594379),
(4,4,'32787ff9-ed87-401d-8b24-fe7b0da08c7f',2520,1,2,1779594617,1779594626),
(5,4,'d2a0521d-8897-4afc-9642-636db9a22b0a',5801,1,2,1779594630,1779594639),
(6,4,'7b999d66-aba9-4764-bf3f-1b3cd8d1dab9',2195,1,2,1779644933,1779644942),
(7,4,'a661eb18-7c06-42d5-a6f4-f1c85168ffc3',2171,1,2,1779644946,1779644955),
(8,167,'a9a2bac8-3a43-4f9c-b5fa-50ed9390f8e0',5801,1,2,1779752770,1779752779),
(9,167,'75699f51-9232-4497-8318-6ca2eb77374e',2173,1,2,1779752791,1779752800),
(10,114,'b44fd1da-5292-464b-aa14-2164d7804d16',2167,1,2,1779759641,1779759650),
(11,114,'cd4c1e52-03ed-42ef-aee4-f0b0f1b63c8c',2167,1,2,1779759661,1779759670),
(12,114,'153983e4-65a4-4fbf-9094-ff8142eb15ea',2487,1,2,1779759671,1779759680),
(13,114,'434adda9-9ec3-410b-ac10-db99ae224f5d',2487,1,2,1779761343,1779761352),
(14,114,'b9805fdd-bbf5-4f21-81b8-ef363780d2c5',2171,1,2,1779761354,1779761363),
(15,172,'2be19843-e9d9-4ca6-be49-595af60350bf',2390,1,2,1779762661,1779762670),
(16,172,'f85f5053-c9e5-483c-b733-8c0fb7d9b52d',2173,1,2,1779762680,1779762689),
(17,172,'e70d737f-0a22-401f-9cc5-1518d41dac36',2268,1,2,1779762697,1779762706),
(18,172,'d9b2bae3-cd50-4376-b826-993a3f4d573c',2268,1,2,1779762707,1779762716),
(19,172,'b9226a6e-c753-4688-b086-bd5913347013',2475,1,2,1779762719,1779762728),
(20,172,'11cab94f-1fe8-4470-bd52-524c85a1c39e',2645,1,2,1779762730,1779762739),
(21,172,'a2585c70-b9be-43cf-8354-882722fda412',2477,1,2,1779762743,1779762752),
(22,172,'f4f530f6-9eae-4e03-a399-4c420e486f34',2477,1,2,1779762757,1779762766),
(23,172,'7a75ab29-ad02-4f6f-9264-80f17f101b92',2171,1,2,1779762769,1779762778),
(24,172,'278c97d1-f09e-47c6-ae0e-3c2b4f80a1c4',5801,1,2,1779762781,1779762790),
(25,172,'072d6b3b-a6cf-40b8-95ba-8c5e999145d7',2195,1,2,1779762812,1779762821),
(26,172,'ca993d65-54ff-4bdb-a40e-72c45d15acbc',2520,1,2,1779762834,1779762843),
(27,172,'e92c98e3-a6da-45a1-96f9-d90a3df281e1',5801,1,2,1779762851,1779762860),
(28,172,'0f4a3f5f-2547-4952-a159-071dc90be041',2171,1,2,1779762874,1779762883),
(29,172,'65fcacf0-3cfa-4dd8-bca1-e60fce53dd01',2645,1,2,1779762924,1779762933),
(30,172,'7cc45422-6c58-4919-8cd8-c651a12a2d44',2477,1,2,1779762933,1779762942),
(31,172,'69838240-b534-423e-b41e-c35696e108e4',2268,1,2,1779762942,1779762951),
(32,172,'d55acc67-4eb2-4346-8539-ab127e4273c2',2167,1,2,1779762951,1779762960),
(33,172,'5d22ecea-8feb-4756-a4bb-0d0ece8222c3',2268,1,2,1779762960,1779762969),
(34,172,'b2b515be-3985-43fc-b6e1-adc14009d7a3',2475,1,2,1779762969,1779762978),
(35,172,'b72fa89c-06fe-43e8-a286-93fd24f90229',2171,1,2,1779762979,1779762988),
(36,172,'3d25f5ce-7914-4f01-9afa-aacee82dd26e',2475,1,2,1779762988,1779762997),
(37,172,'4eb0ff17-676e-48ff-8913-5f3598011cdd',2645,1,2,1779762997,1779763006),
(38,172,'3496724e-4682-411e-8949-94c1d63d4424',5801,1,2,1779763006,1779763015),
(39,172,'274c97a1-8f60-4130-8399-fc56d149bca4',5801,1,2,1779763015,1779763024),
(40,172,'516755d6-0364-4e1f-8787-e17911ce5d5d',2171,1,2,1779763024,1779763033),
(41,172,'6846591a-c079-41a7-bdd4-52fe775ecfcc',2173,1,2,1779763033,1779763042),
(42,172,'7977e650-0e17-4774-a143-9b9dcd3f6823',2171,1,2,1779763042,1779763051),
(43,172,'2b32b568-731b-45a3-9c7c-1f9fb69638b7',2645,1,2,1779763051,1779763060),
(44,172,'3a2c1b3f-da79-42b9-9abe-c8afafd31a4f',2173,1,2,1779763061,1779763069),
(45,172,'3adac061-fd82-47e0-9a18-076c5f34102a',2520,1,2,1779763070,1779763079),
(46,172,'84f9292b-ebf2-442e-82c9-790e4964c0e5',2520,1,2,1779763079,1779763088),
(47,172,'09704c43-df61-4279-8db8-d51aaef09e10',5801,1,2,1779763088,1779763097),
(48,172,'0df5ac01-03d9-40c0-a745-39a3f7e4f45a',2268,1,2,1779763097,1779763106),
(49,172,'bfe6bcaa-58d6-42a0-994e-691c67ab52f7',2475,1,2,1779763106,1779763115),
(50,172,'86b794c3-379f-4188-af98-da3f7b13a42c',2487,1,2,1779763115,1779763124),
(51,172,'ab57381e-f219-4dcb-b8ef-c9d3b3f8faad',2195,1,2,1779763124,1779763133),
(52,172,'36d41d70-9051-4d41-820d-eea23f9f6dbe',2645,1,2,1779763133,1779763142),
(53,172,'80b2b68e-47c3-4d45-88a2-27e00e0e90cb',2475,1,2,1779763142,1779763151),
(54,172,'e4da112e-36e6-4a6c-8e08-65b35282befb',2268,1,2,1779763151,1779763160),
(55,173,'8c8eb201-cf1f-4f99-81c3-fdac552bd854',2645,1,2,1779767666,1779767675),
(56,173,'62b73d0b-dddd-42ca-b619-180d89acf750',2645,1,2,1779769145,1779769154),
(57,173,'1a1ae067-fe62-479d-b5f1-3e99c47d2724',2487,1,2,1779769154,1779769163),
(58,114,'b26e0eb1-08c0-47e7-afdf-c8ce951d4c67',2167,1,2,1779832657,1779832665),
(59,114,'640b8e88-552b-4125-802d-905135d5b5d8',2171,1,2,1779832706,1779832715),
(60,73,'82e71e53-165c-4d8e-b47c-15239713036d',2268,1,2,1779835098,1779835107),
(61,4,'108c7446-6b44-45cd-80ad-40a4cfa4cfe0',2477,1,2,1779840879,1779840887),
(62,4,'0d8590bf-18ce-4fcc-80fe-c887312fc5b0',2173,1,2,1779840918,1779840926),
(63,183,'1c9dfd85-121e-434d-a322-a70ee1154f16',2167,1,2,1779840941,1779840950),
(64,183,'0aaa7fa0-b918-4288-9015-9100c9dc8735',2645,1,2,1779840952,1779840961),
(65,183,'60111f80-6f53-4b56-a776-ca4bb2024d51',2645,1,2,1779840965,1779840974),
(66,183,'b98862ed-4dc6-4ff8-b5b6-64ab5b7cadf4',2487,1,2,1779840980,1779840989),
(67,183,'1f5a143f-bc7d-43bc-9c04-a304e78d3bb2',2520,1,2,1779840989,1779840998),
(68,183,'74299ca0-7a2f-4f1d-80c4-09adcb2eb05b',2475,1,2,1779840999,1779841008),
(69,173,'7a174c83-cc1f-4cdd-88df-1af522dc8ec8',2520,1,2,1780011947,1780011956),
(70,173,'439cb4ac-bb8f-475c-b260-f621110fbffa',2645,1,2,1780011959,1780011968),
(71,173,'0b134d5f-ec87-423f-ad70-e083f12caff8',2645,1,2,1780011969,1780011978),
(72,173,'5eb1b31d-66bd-49d3-b197-a6377690c69c',2645,1,2,1780011980,1780011989),
(73,173,'1704a81c-b4a0-4a24-9082-74afadef2c0c',2171,1,2,1780011989,1780011998),
(74,173,'1f93750b-f21b-4c54-b9de-579e2c638cac',2645,1,2,1780011999,1780012016);
/*!40000 ALTER TABLE `roulette_plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `server_config`
--

DROP TABLE IF EXISTS `server_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `server_config` (
  `config` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY (`config`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `server_config`
--

LOCK TABLES `server_config` WRITE;
/*!40000 ALTER TABLE `server_config` DISABLE KEYS */;
INSERT INTO `server_config` VALUES
('db_version','33'),
('motd_hash','9231233FAE2AA3C812B840C5C1ECC91F6ECA8944'),
('motd_num','2'),
('players_record','20');
/*!40000 ALTER TABLE `server_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stripe`
--

DROP TABLE IF EXISTS `stripe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stripe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `points` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `payment_id` varchar(255) NOT NULL,
  `api_version` varchar(255) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stripe`
--

LOCK TABLES `stripe` WRITE;
/*!40000 ALTER TABLE `stripe` DISABLE KEYS */;
/*!40000 ALTER TABLE `stripe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tile_store`
--

DROP TABLE IF EXISTS `tile_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tile_store` (
  `house_id` int(11) NOT NULL,
  `data` longblob NOT NULL,
  KEY `house_id` (`house_id`),
  CONSTRAINT `tile_store_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `houses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tile_store`
--

LOCK TABLES `tile_store` WRITE;
/*!40000 ALTER TABLE `tile_store` DISABLE KEYS */;
INSERT INTO `tile_store` VALUES
(4,'Ø\08\0\0\0\0ã\0'),
(4,'Ø\09\0\0\0\0å\0'),
(4,'≠\0<\0\0\0\0ˇ\0'),
(5,'∏\0F\0\0\0\0ã\0'),
(5,'∏\0G\0\0\0\0å\0'),
(5,'π\0D\0\0\0\0m\0'),
(6,'¥\0\"\0\0\0\0˛\0'),
(7,'§\0 \0\0\0\0\"(\0'),
(7,'©\0!\0\0\0\0á\0'),
(7,'©\0\"\0\0\0\0à\0'),
(8,'û\0\0\0\0\0á\0'),
(8,'õ\0\"\0\0\0\0j\0'),
(8,'û\0 \0\0\0\0à\0'),
(9,'õ\0\0\0\0\0á\0'),
(9,'õ\0\0\0\0\0à\0'),
(9,'ù\0\0\0\0\0 (\0'),
(10,'°\0\0\0\0\0á\0'),
(10,'°\0\0\0\0\0à\0'),
(10,'§\0\Z\0\0\0\0\"(\0'),
(11,'¶\0\0\0\0\0\"(\0'),
(11,'©\0\0\0\0\0á\0'),
(11,'©\0\0\0\0\0à\0'),
(12,'•\0\0\0\0\0 (\0'),
(12,'©\0!\0\0\0\0á\0'),
(12,'©\0\"\0\0\0\0à\0'),
(13,'•\0\0\0\0\0á\0'),
(13,'ß\0\Z\0\0\0\0\"(\0'),
(13,'•\0\0\0\0\0à\0'),
(14,'®\0\0\0\0\0 (\0'),
(14,'•\0!\0\0\0\0á\0'),
(14,'•\0\"\0\0\0\0à\0'),
(15,'à\0\0\0\0\0á\0'),
(15,'à\0\0\0\0\0à\0'),
(15,'è\0\0\0\0\0j\0'),
(16,'à\0 \0\0\0\0á\0'),
(16,'à\0!\0\0\0\0à\0'),
(16,'ç\0$\0\0\0\0m\0'),
(17,'î\0 \0\0\0\0j\0'),
(17,'ó\0\"\0\0\0\0á\0'),
(17,'ó\0#\0\0\0\0à\0'),
(18,'ó\0\Z\0\0\0\0á\0'),
(18,'ó\0\0\0\0\0à\0'),
(18,'î\0\0\0\0\0j\0'),
(19,'h\0$\0\0\0\0j\0'),
(19,'i\0\'\0\0\0\0‡\0'),
(19,'j\0\'\0\0\0\0·\0'),
(20,'_\0#\0\0\0\0⁄\0'),
(20,'_\0$\0\0\0\0€\0'),
(20,'c\0&\0\0\0\0j\0'),
(21,'e\0\0\0\0\0m\0'),
(22,'R\0\Z\0\0\0\0á\0'),
(22,'R\0\0\0\0\0à\0'),
(22,'P\0\0\0\0\0l\0'),
(23,'U\0\0\0\0\0i\0'),
(23,'W\0\0\0\0\0á\0'),
(23,'W\0\0\0\0\0à\0'),
(24,'U\0\"\0\0\0\0l\0'),
(24,'W\0 \0\0\0\0á\0'),
(24,'W\0!\0\0\0\0à\0'),
(25,']\0@\0\0\0\0á\0'),
(25,']\0A\0\0\0\0à\0'),
(25,'`\0@\0\0\0\0\0'),
(26,'`\0G\0\0\0\0á\0'),
(26,'a\0D\0\0\0\0\0'),
(26,'`\0H\0\0\0\0à\0'),
(27,']\0N\0\0\0\0á\0'),
(27,']\0O\0\0\0\0à\0'),
(27,'b\0L\0\0\0\0ˇ\0'),
(28,'f\0I\0\0\0\0á\0'),
(28,'f\0J\0\0\0\0à\0'),
(28,'g\0H\0\0\0\0ˇ\0'),
(29,'h\0E\0\0\0\0\0'),
(29,'i\0F\0\0\0\0á\0'),
(29,'i\0G\0\0\0\0à\0'),
(30,'t\0B\0\0\0\0á\0'),
(30,'t\0C\0\0\0\0à\0'),
(30,'x\0D\0\0\0\0Á\0ã\0\0'),
(31,'u\0I\0\0\0\0ˇ\0'),
(31,'x\0K\0\0\0\0á\0'),
(31,'x\0L\0\0\0\0à\0'),
(32,'~\0A\0\0\0\0\0\0'),
(32,'\0B\0\0\0\0\0\0'),
(32,'Ä\0B\0\0\0\0ì0\0'),
(32,'Å\0B\0\0\0\0F1\0'),
(32,'Å\0C\0\0\0\0á\0'),
(32,'Å\0D\0\0\0\0à\0'),
(33,'y\0:\0\0\0\0ú/\0'),
(34,'{\0-\0\0\0\0ú/\0'),
(35,'Ä\0B\0\0\0\0\0'),
(36,'ç\0@\0\0\0\0⁄\0'),
(36,'ç\0A\0\0\0\0€\0'),
(36,'ë\0A\0\0\0\0\0'),
(37,'î\0A\0\0\0\0\0'),
(37,'ó\0@\0\0\0\0⁄\0'),
(37,'ó\0A\0\0\0\0€\0'),
(38,'ù\0E\0\0\0\0‡\0'),
(38,'û\0E\0\0\0\0·\0'),
(39,'†\0@\0\0\0\0⁄\0'),
(39,'†\0A\0\0\0\0€\0'),
(39,'§\0C\0\0\0\0\0'),
(40,'î\05\0\0\0\0≈\0'),
(40,'ë\0:\0\0\0\0É\0'),
(40,'ë\0;\0\0\0\0Ñ\0'),
(41,'ì\0.\0\0\0\0É\0'),
(41,'ì\0/\0\0\0\0Ñ\0'),
(41,'î\02\0\0\0\0≈\0'),
(42,'ò\0.\0\0\0\0É\0'),
(42,'ò\0/\0\0\0\0Ñ\0'),
(42,'ù\00\0\0\0\0√\0'),
(43,'ò\03\0\0\0\0É\0'),
(43,'ù\03\0\0\0\0√\0'),
(43,'ò\04\0\0\0\0Ñ\0'),
(44,'ò\06\0\0\0\0É\0'),
(44,'ò\07\0\0\0\0Ñ\0'),
(44,'ò\0;\0\0\0\0“	\0'),
(44,'ô\0:\0\0\0\0©\0\0\0\0\0'),
(44,'ô\0;\0\0\0\0®	\0'),
(44,'ö\0:\0\0\0\0\0\0'),
(44,'õ\0:\0\0\0\0‹\0'),
(44,'ù\0:\0\0\0\0ƒ\0'),
(45,'¢\08\0\0\0\0≈\0'),
(45,'§\0:\0\0\0\0É\0'),
(45,'§\0;\0\0\0\0Ñ\0'),
(46,'∆\05\0\0\0\0ã\0'),
(46,'∆\06\0\0\0\0å\0'),
(46,'∆\0:\0\0\0\0˝\0'),
(47,'»\08\0\0\0\0ã\0'),
(47,'»\09\0\0\0\0å\0'),
(47,'À\0:\0\0\0\0˝\0'),
(48,'ƒ\00\0\0\0\0˝\0'),
(49,'…\00\0\0\0\0˝\0'),
(50,'»\0$\0\0\0\0˝\0'),
(51,'–\0$\0\0\0\0˝\0'),
(52,' \0\"\0\0\0\0˝\0'),
(53,'“\0\"\0\0\0\0˝\0'),
(55,'’\0(\0\0\0\0\0'),
(56,'’\0.\0\0\0\0\0'),
(57,'’\02\0\0\0\0\0pd\0'),
(57,'÷\02\0\0\0\0\0pd\0'),
(57,'÷\03\0\0\0\0\0pd\0'),
(57,'◊\02\0\0\0\0\0pd\0'),
(57,'◊\03\0\0\0\0\0pd\0'),
(57,'ÿ\02\0\0\0\0\0pd\0'),
(57,'ÿ\03\0\0\0\0\0pd\0'),
(57,'Ÿ\02\0\0\0\0\0pd\0'),
(57,'Ÿ\03\0\0\0\0\0pd\0'),
(57,'⁄\02\0\0\0\0\0pd\0'),
(57,'⁄\03\0\0\0\0\0pd\0'),
(57,'€\02\0\0\0\0\0pd\0'),
(57,'€\03\0\0\0\0\0pd\0'),
(57,'‹\02\0\0\0\0\0pd\0'),
(57,'‹\03\0\0\0\0\0pd\0'),
(57,'’\05\0\0\0\0\0'),
(57,'’\07\0\0\0\0\0pd\0'),
(57,'÷\04\0\0\0\0\0pd\0'),
(57,'÷\05\0\0\0\0\0pd\0'),
(57,'÷\06\0\0\0\0\0pd\0'),
(57,'÷\07\0\0\0\0\0pd\0ƒ\0\0\0Â\n%\0m\0ƒ\0¬\0˙	\0H\0p+\0xÆ∫\0\0dZ\0!\0é	\0ì\0¬	\0‘	\0\0'),
(57,'◊\04\0\0\0\0\0pd\0'),
(57,'◊\05\0\0\0\0\0pd\0'),
(57,'◊\06\0\0\0\0\0pd\0'),
(57,'◊\07\0\0\0\0\0pd\0'),
(57,'ÿ\04\0\0\0\0\0pd\0'),
(57,'ÿ\05\0\0\0\0\0pd\0'),
(57,'ÿ\06\0\0\0\0\0pd\0'),
(57,'ÿ\07\0\0\0\0\0pd\0'),
(57,'Ÿ\04\0\0\0\0\0pd\0'),
(57,'Ÿ\05\0\0\0\0\0pd\0'),
(57,'Ÿ\06\0\0\0\0\0pd\0'),
(57,'Ÿ\07\0\0\0\0\0pd\0'),
(57,'⁄\04\0\0\0\0\0pd\0'),
(57,'⁄\05\0\0\0\0\0pd\0'),
(57,'⁄\06\0\0\0\0\0pd\0'),
(57,'⁄\07\0\0\0\0\0pd\0'),
(57,'€\04\0\0\0\0\0pd\0'),
(57,'€\05\0\0\0\0\0pd\0'),
(57,'€\06\0\0\0\0\0pd\0'),
(57,'€\07\0\0\0\0\0pd\0'),
(57,'‹\04\0\0\0\0\0pd\0'),
(57,'‹\05\0\0\0\0\0pd\0'),
(57,'‹\06\0\0\0\0\0pd\0'),
(57,'‹\07\0\0\0\0\0pd\0'),
(57,'’\08\0\0\0\0\0pd\0md\0'),
(57,'÷\08\0\0\0\0\0pd\0'),
(57,'◊\08\0\0\0\0\0pd\0'),
(57,'ÿ\08\0\0\0\0\0pd\0'),
(57,'Ÿ\08\0\0\0\0\0pd\0'),
(57,'⁄\08\0\0\0\0\0pd\0'),
(57,'€\08\0\0\0\0\0pd\0'),
(57,'‹\08\0\0\0\0\0pd\0'),
(58,'’\0:\0\0\0\0\0pd\0'),
(58,'’\0;\0\0\0\0\0pd\0'),
(58,'÷\0:\0\0\0\0\0pd\0'),
(58,'÷\0;\0\0\0\0\0pd\0'),
(58,'◊\0:\0\0\0\0\0pd\0'),
(58,'◊\0;\0\0\0\0\0pd\0'),
(58,'ÿ\0:\0\0\0\0\0pd\0'),
(58,'ÿ\0;\0\0\0\0\0pd\0'),
(58,'Ÿ\0:\0\0\0\0\0pd\0'),
(58,'Ÿ\0;\0\0\0\0\0pd\0'),
(58,'⁄\0:\0\0\0\0\0pd\0'),
(58,'⁄\0;\0\0\0\0\0pd\0'),
(58,'€\0:\0\0\0\0\0pd\0'),
(58,'€\0;\0\0\0\0\0pd\0'),
(58,'‹\0:\0\0\0\0\0pd\0'),
(58,'‹\0;\0\0\0\0\0pd\0'),
(58,'’\0<\0\0\0\0\0pd\0'),
(58,'’\0?\0\0\0\0\0'),
(58,'÷\0<\0\0\0\0\0pd\0'),
(58,'÷\0=\0\0\0\0\0pd\0'),
(58,'÷\0>\0\0\0\0\0pd\0Å,\0'),
(58,'÷\0?\0\0\0\0\0pd\0'),
(58,'◊\0<\0\0\0\0\0pd\0'),
(58,'◊\0=\0\0\0\0\0pd\0'),
(58,'◊\0>\0\0\0\0\0pd\0'),
(58,'◊\0?\0\0\0\0\0pd\0'),
(58,'ÿ\0<\0\0\0\0\0pd\0'),
(58,'ÿ\0=\0\0\0\0\0pd\0'),
(58,'ÿ\0>\0\0\0\0\0pd\0'),
(58,'ÿ\0?\0\0\0\0\0pd\0'),
(58,'Ÿ\0<\0\0\0\0\0pd\0'),
(58,'Ÿ\0=\0\0\0\0\0pd\0'),
(58,'Ÿ\0>\0\0\0\0\0pd\0'),
(58,'Ÿ\0?\0\0\0\0\0pd\0'),
(58,'⁄\0<\0\0\0\0\0pd\0'),
(58,'⁄\0=\0\0\0\0\0pd\0'),
(58,'⁄\0>\0\0\0\0\0pd\0'),
(58,'⁄\0?\0\0\0\0\0pd\0'),
(58,'€\0<\0\0\0\0\0pd\0'),
(58,'€\0=\0\0\0\0\0pd\0'),
(58,'€\0>\0\0\0\0\0pd\0'),
(58,'€\0?\0\0\0\0\0pd\0'),
(58,'‹\0<\0\0\0\0\0pd\0'),
(58,'‹\0=\0\0\0\0\0pd\0'),
(58,'‹\0>\0\0\0\0\0pd\0'),
(58,'‹\0?\0\0\0\0\0pd\0'),
(58,'’\0A\0\0\0\0\0pd\0'),
(58,'’\0B\0\0\0\0\0pd\0'),
(58,'÷\0@\0\0\0\0\0pd\0'),
(58,'÷\0A\0\0\0\0\0pd\0'),
(58,'÷\0B\0\0\0\0\0pd\0'),
(58,'◊\0@\0\0\0\0\0pd\0'),
(58,'◊\0A\0\0\0\0\0pd\0'),
(58,'◊\0B\0\0\0\0\0pd\0'),
(58,'ÿ\0@\0\0\0\0\0pd\0'),
(58,'ÿ\0A\0\0\0\0\0pd\0'),
(58,'ÿ\0B\0\0\0\0\0pd\0'),
(58,'Ÿ\0@\0\0\0\0\0pd\0'),
(58,'Ÿ\0A\0\0\0\0\0pd\0'),
(58,'Ÿ\0B\0\0\0\0\0pd\0'),
(58,'⁄\0@\0\0\0\0\0pd\0'),
(58,'⁄\0A\0\0\0\0\0pd\0'),
(58,'⁄\0B\0\0\0\0\0pd\0'),
(58,'€\0@\0\0\0\0\0pd\0'),
(58,'€\0A\0\0\0\0\0pd\0'),
(58,'€\0B\0\0\0\0\0pd\0'),
(58,'‹\0@\0\0\0\0\0pd\0'),
(58,'‹\0A\0\0\0\0\0pd\0'),
(58,'‹\0B\0\0\0\0\0pd\0'),
(59,'Ú\0\0\0j\0'),
(60,'Ú\0\0\0j\0'),
(61,'ˆ\0\0\0j\0'),
(62,'ˇ\0\0\0m\0'),
(63,'\0\0\0m\0'),
(64,'\0\0\0m\0'),
(65,'\0\0\0j\0'),
(66,'\0\0\0j\0'),
(67,'˘\0\0\0m\0'),
(68,'ˇ˘\0\0\0m\0'),
(69,'Û˘\0\0\0j\0'),
(70,'Ì÷\0\0\0m\0'),
(71,'≈\0¯\0\0\0á\0'),
(71,'≈\0˘\0\0\0à\0'),
(71,'…\0ˇ\0\0\0Ï\Z\0'),
(72,' \0/\0\0\0á\0'),
(72,'…\00\0\0\0t\0'),
(72,'…\03\0\0\0t\0'),
(72,' \00\0\0\0à\0'),
(72,'—\03\0\0\0ı\Z\0'),
(73,'›\0&\0\0\0Ï\Z\0'),
(73,'⁄\0,\0\0\0á\0'),
(73,'⁄\0-\0\0\0à\0'),
(74,'“\0\'\0\0\0á\0'),
(74,'“\0(\0\0\0à\0'),
(74,'‘\0*\0\0\0Ï\Z\0'),
(75,'“\0\0\0\0É\0'),
(75,'“\0\0\0\0Ñ\0'),
(75,'ÿ\0\0\0\0É\0'),
(75,'ÿ\0\0\0\0Ñ\0'),
(75,'Ÿ\0 \0\0\0ı\Z\0'),
(76,'“\0\0\0\0â\0'),
(76,'”\0\0\0\0ä\0'),
(76,'“\0\"\0\0\0â\0'),
(76,'”\0\"\0\0\0ä\0'),
(76,'◊\0 \0\0\0ı\Z\0'),
(3154,'ç\0@\0\0\0\0\0'),
(3155,'ñ\0@\0\0\0\0\0\0'),
(3156,'°\0@\0\0\0\0\0'),
(3167,'ó\07\0\0\0\0˘(\0'),
(3167,'ù\07\0\0\0\0˘(\0'),
(3167,'õ\0<\0\0\0\0¯(\0'),
(3168,'£\06\0\0\0\0˘(\0'),
(3168,'•\0;\0\0\0\0˘(\0'),
(3169,'ú\0?\0\0\0\0Ω\0'),
(3173,'è\0F\0\0\0\0ﬁ\0'),
(3173,'è\0G\0\0\0\0ﬂ\0'),
(3173,'ë\0D\0\0\0\0m	\0'),
(3173,'í\0D\0\0\0\0“	\0'),
(3175,'ñ\0B\0\0\0\0pd\0'),
(3175,'ò\0B\0\0\0\0ì0\0'),
(3175,'ô\0A\0\0\0\0F1\0'),
(3175,'ô\0F\0\0\0\0ﬁ\0'),
(3175,'ô\0G\0\0\0\0ﬂ\0'),
(3175,'ö\0F\0\0\0\0ﬁ\0'),
(3175,'ö\0G\0\0\0\0ﬂ\0'),
(3176,'†\0G\0\0\0\0‹\0'),
(3176,'°\0G\0\0\0\0›\0');
/*!40000 ALTER TABLE `tile_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `towns`
--

DROP TABLE IF EXISTS `towns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `towns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `posx` int(11) NOT NULL DEFAULT 0,
  `posy` int(11) NOT NULL DEFAULT 0,
  `posz` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `towns`
--

LOCK TABLES `towns` WRITE;
/*!40000 ALTER TABLE `towns` DISABLE KEYS */;
INSERT INTO `towns` VALUES
(1,'Baiak Yourots',152,55,7),
(2,'Items',225,10,7),
(3,'Editeds',360,116,7),
(4,'Vips',765,30,7),
(5,'Quests',287,149,7),
(6,'Donate',56,233,4),
(7,'Event',272,96,7),
(8,'Castle48hrs',35,646,7),
(9,'Castle24hrs',45,245,7),
(10,'Coliseum',193,227,7),
(11,'Teleport',307,195,8),
(12,'PVP',266,377,7),
(13,'Roleta',311,78,7),
(14,'Bosses',609,322,7);
/*!40000 ALTER TABLE `towns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_ots_comunication`
--

DROP TABLE IF EXISTS `z_ots_comunication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z_ots_comunication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `param1` varchar(255) NOT NULL DEFAULT '',
  `param2` varchar(255) NOT NULL DEFAULT '',
  `param3` varchar(255) NOT NULL DEFAULT '',
  `param4` varchar(255) NOT NULL DEFAULT '',
  `param5` varchar(255) NOT NULL DEFAULT '',
  `param6` varchar(255) NOT NULL DEFAULT '',
  `param7` varchar(255) NOT NULL DEFAULT '',
  `delete_it` int(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_ots_comunication`
--

LOCK TABLES `z_ots_comunication` WRITE;
/*!40000 ALTER TABLE `z_ots_comunication` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_ots_comunication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_polls`
--

DROP TABLE IF EXISTS `z_polls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z_polls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `end` int(11) NOT NULL DEFAULT 0,
  `start` int(11) NOT NULL DEFAULT 0,
  `answers` int(11) NOT NULL DEFAULT 0,
  `votes_all` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_polls`
--

LOCK TABLES `z_polls` WRITE;
/*!40000 ALTER TABLE `z_polls` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_polls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_polls_answers`
--

DROP TABLE IF EXISTS `z_polls_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z_polls_answers` (
  `poll_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL,
  `votes` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_polls_answers`
--

LOCK TABLES `z_polls_answers` WRITE;
/*!40000 ALTER TABLE `z_polls_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_polls_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_attack_log`
--

DROP TABLE IF EXISTS `z_shop_attack_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z_shop_attack_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(45) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `detail` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_attack_log`
--

LOCK TABLES `z_shop_attack_log` WRITE;
/*!40000 ALTER TABLE `z_shop_attack_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `z_shop_attack_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_categories`
--

DROP TABLE IF EXISTS `z_shop_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z_shop_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_categories`
--

LOCK TABLES `z_shop_categories` WRITE;
/*!40000 ALTER TABLE `z_shop_categories` DISABLE KEYS */;
INSERT INTO `z_shop_categories` VALUES
(1,'Items',0),
(2,'Mounts',0),
(3,'Outfits',0),
(4,'Mage',0),
(5,'Knight',0),
(6,'Paladin',0),
(7,'Others',0);
/*!40000 ALTER TABLE `z_shop_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_history`
--

DROP TABLE IF EXISTS `z_shop_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z_shop_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comunication_id` int(11) NOT NULL DEFAULT 0,
  `to_name` varchar(255) NOT NULL DEFAULT '0',
  `to_account` int(11) NOT NULL DEFAULT 0,
  `from_nick` varchar(255) NOT NULL DEFAULT '',
  `from_account` int(11) NOT NULL DEFAULT 0,
  `price` int(11) NOT NULL DEFAULT 0,
  `offer_id` int(11) NOT NULL DEFAULT 0,
  `trans_state` varchar(255) NOT NULL,
  `trans_start` int(11) NOT NULL DEFAULT 0,
  `trans_real` int(11) NOT NULL DEFAULT 0,
  `is_pacc` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_history`
--

LOCK TABLES `z_shop_history` WRITE;
/*!40000 ALTER TABLE `z_shop_history` DISABLE KEYS */;
INSERT INTO `z_shop_history` VALUES
(1,5,'Buduiuba',5,'Buduiuba',5,50,2,'realized',1778418537,1778418958,0),
(2,6,'Buduiuba',5,'Buduiuba',5,50,2,'realized',1778418584,1778418958,0),
(3,7,'Buduiuba',5,'Buduiuba',5,10,1,'realized',1778419293,1778419318,0),
(4,8,'Buduiuba',5,'Buduiuba',5,10,1,'realized',1778419489,1778419498,0),
(5,9,'Natan',3,'Natan',3,10,1,'realized',1778428577,1778428618,0);
/*!40000 ALTER TABLE `z_shop_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `z_shop_offer`
--

DROP TABLE IF EXISTS `z_shop_offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `z_shop_offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL DEFAULT 0,
  `itemid1` int(11) NOT NULL DEFAULT 0,
  `count1` int(11) NOT NULL DEFAULT 0,
  `itemid2` int(11) NOT NULL DEFAULT 0,
  `count2` int(11) NOT NULL DEFAULT 0,
  `category_id` tinyint(1) NOT NULL DEFAULT 0,
  `offer_type` varchar(255) DEFAULT NULL,
  `offer_description` text NOT NULL,
  `offer_name` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `z_shop_offer`
--

LOCK TABLES `z_shop_offer` WRITE;
/*!40000 ALTER TABLE `z_shop_offer` DISABLE KEYS */;
INSERT INTO `z_shop_offer` VALUES
(8,150,12318,1,0,0,4,'item','Pesado Magician Wand exclusiva do servidor','Pesado Magician Wand',0,3),
(9,150,9778,1,0,0,4,'item','Pesado Magician Helmet exclusivo do servidor','Pesado Magician Helmet',0,4),
(10,150,9776,1,0,0,4,'item','Pesado Magician Armor exclusiva do servidor','Pesado Magician Armor',0,5),
(11,150,9777,1,0,0,4,'item','Pesado Magician Legs exclusivas do servidor','Pesado Magician Legs',0,6),
(12,150,2641,1,0,0,4,'item','Pesado Magician Boots exclusivas do servidor','Pesado Magician Boots',0,7),
(13,150,12647,1,0,0,4,'item','Pesado Magician Shield exclusivo do servidor','Pesado Magician Shield',0,8),
(14,150,2123,1,0,0,4,'item','Pesado Magician Ring exclusivo do servidor','Pesado Magician Ring',0,9),
(15,150,11393,1,0,0,4,'item','Pesado Magician Amulet exclusivo do servidor','Pesado Magician Amulet',0,10),
(16,150,5950,1,0,0,4,'item','Pesado Magician Backpack exclusiva do servidor','Pesado Magician Backpack',0,11),
(17,150,8932,1,0,0,5,'item','Pesado Blessed Sword exclusiva do servidor','Pesado Blessed Sword',0,1),
(18,150,2501,1,0,0,5,'item','Pesado Blessed Helmet exclusivo do servidor','Pesado Blessed Helmet',0,2),
(19,150,2503,1,0,0,5,'item','Pesado Blessed Armor exclusiva do servidor','Pesado Blessed Armor',0,3),
(20,150,2504,1,0,0,5,'item','Pesado Blessed Legs exclusivas do servidor','Pesado Blessed Legs',0,4),
(21,150,9932,1,0,0,5,'item','Pesado Blessed Boots exclusivas do servidor','Pesado Blessed Boots',0,5),
(22,150,2538,1,0,0,5,'item','Pesado Blessed Shield exclusivo do servidor','Pesado Blessed Shield',0,6),
(23,150,10502,1,0,0,5,'item','Pesado Blessed Ring exclusivo do servidor','Pesado Blessed Ring',0,7),
(24,150,2138,1,0,0,5,'item','Pesado Blessed Amulet exclusivo do servidor','Pesado Blessed Amulet',0,8),
(25,150,9775,1,0,0,5,'item','Pesado Blessed Backpack exclusiva do servidor','Pesado Blessed Backpack',0,9),
(26,150,8855,1,0,0,6,'item','Pesado Archer Bow exclusivo do servidor','Pesado Archer Bow',0,1),
(27,150,7903,1,0,0,6,'item','Pesado Archer Helmet exclusivo do servidor','Pesado Archer Helmet',0,2),
(28,150,7884,1,0,0,6,'item','Pesado Archer Armor exclusiva do servidor','Pesado Archer Armor',0,3),
(29,150,7885,1,0,0,6,'item','Pesado Archer Legs exclusivas do servidor','Pesado Archer Legs',0,4),
(30,150,7886,1,0,0,6,'item','Pesado Archer Boots exclusivas do servidor','Pesado Archer Boots',0,5),
(31,150,8909,1,0,0,6,'item','Pesado Archer Shield exclusivo do servidor','Pesado Archer Shield',0,6),
(32,150,7839,1,0,0,6,'item','Pesado Archer Arrow exclusiva do servidor','Pesado Archer Arrow',0,7),
(33,150,2122,1,0,0,6,'item','Pesado Archer Ring exclusivo do servidor','Pesado Archer Ring',0,8),
(34,150,7887,1,0,0,6,'item','Pesado Archer Amulet exclusivo do servidor','Pesado Archer Amulet',0,9),
(35,150,3939,1,0,0,6,'item','Pesado Archer Backpack exclusiva do servidor','Pesado Archer Backpack',0,10),
(36,250,10503,1,0,0,1,'item','Lottery Ticket Box','Lottery Ticket Box',0,3),
(37,250,7890,1,0,0,1,'item','Skull Amulet','Skull Amulet',0,4),
(38,250,12328,1,0,0,1,'item','Stamina Potion Full','Stamina Potion Full',0,5),
(39,250,7735,1,0,0,1,'item','Spellwand','Spellwand',0,6),
(40,250,2546,1,0,0,1,'item','Pesado Spear exclusiva do servidor','Pesado Spear',0,7),
(41,150,8929,1,0,0,5,'item','Pesado Blessed Club exclusivo do servidor','Pesado Blessed Club',0,10),
(42,150,8293,1,0,0,5,'item','Pesado Blessed Axe exclusiva do servidor','Pesado Blessed Axe',0,11);
/*!40000 ALTER TABLE `z_shop_offer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-29  9:07:42
