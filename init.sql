-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: atom_timeout
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.04.1-log

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
-- Table structure for table `access_log`
--

DROP TABLE IF EXISTS `access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `access_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `1` (`access_date`,`object_id`),
  KEY `access_log_FI_1` (`object_id`),
  CONSTRAINT `access_log_FK_1` FOREIGN KEY (`object_id`) REFERENCES `object` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_log`
--

LOCK TABLES `access_log` WRITE;
/*!40000 ALTER TABLE `access_log` DISABLE KEYS */;
INSERT INTO `access_log` VALUES (1,358,'2014-04-22 11:36:36'),(2,363,'2014-04-22 11:37:06'),(3,364,'2014-04-22 11:37:17'),(4,364,'2014-04-22 11:37:36'),(5,366,'2014-04-22 11:37:38'),(6,366,'2014-04-22 11:37:51'),(7,358,'2014-04-22 11:37:59'),(8,359,'2014-04-22 11:38:01'),(9,359,'2014-04-22 11:38:09'),(10,361,'2014-04-22 11:38:11'),(11,361,'2014-04-22 11:38:23'),(12,359,'2014-04-22 14:38:15'),(13,359,'2014-04-22 14:38:48');
/*!40000 ALTER TABLE `access_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accession`
--

DROP TABLE IF EXISTS `accession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accession` (
  `id` int(11) NOT NULL,
  `acquisition_type_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `processing_priority_id` int(11) DEFAULT NULL,
  `processing_status_id` int(11) DEFAULT NULL,
  `resource_type_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accession_U_1` (`identifier`),
  KEY `accession_FI_2` (`acquisition_type_id`),
  KEY `accession_FI_3` (`processing_priority_id`),
  KEY `accession_FI_4` (`processing_status_id`),
  KEY `accession_FI_5` (`resource_type_id`),
  CONSTRAINT `accession_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `accession_FK_2` FOREIGN KEY (`acquisition_type_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accession_FK_3` FOREIGN KEY (`processing_priority_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accession_FK_4` FOREIGN KEY (`processing_status_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `accession_FK_5` FOREIGN KEY (`resource_type_id`) REFERENCES `term` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accession`
--

LOCK TABLES `accession` WRITE;
/*!40000 ALTER TABLE `accession` DISABLE KEYS */;
/*!40000 ALTER TABLE `accession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accession_i18n`
--

DROP TABLE IF EXISTS `accession_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accession_i18n` (
  `appraisal` text COLLATE utf8_unicode_ci,
  `archival_history` text COLLATE utf8_unicode_ci,
  `location_information` text COLLATE utf8_unicode_ci,
  `physical_characteristics` text COLLATE utf8_unicode_ci,
  `processing_notes` text COLLATE utf8_unicode_ci,
  `received_extent_units` text COLLATE utf8_unicode_ci,
  `scope_and_content` text COLLATE utf8_unicode_ci,
  `source_of_acquisition` text COLLATE utf8_unicode_ci,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `accession_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `accession` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accession_i18n`
--

LOCK TABLES `accession_i18n` WRITE;
/*!40000 ALTER TABLE `accession_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `accession_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_group`
--

DROP TABLE IF EXISTS `acl_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `acl_group_FI_1` (`parent_id`),
  CONSTRAINT `acl_group_FK_1` FOREIGN KEY (`parent_id`) REFERENCES `acl_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_group`
--

LOCK TABLES `acl_group` WRITE;
/*!40000 ALTER TABLE `acl_group` DISABLE KEYS */;
INSERT INTO `acl_group` VALUES (1,NULL,1,14,'2014-04-22 11:35:21','2014-04-22 11:35:21','en',0),(98,1,2,3,'2014-04-22 11:35:21','2014-04-22 11:35:21','en',0),(99,1,4,13,'2014-04-22 11:35:21','2014-04-22 11:35:21','en',0),(100,99,5,6,'2014-04-22 11:35:21','2014-04-22 11:35:21','en',0),(101,99,7,8,'2014-04-22 11:35:21','2014-04-22 11:35:21','en',0),(102,99,9,10,'2014-04-22 11:35:21','2014-04-22 11:35:21','en',0),(103,99,11,12,'2014-04-22 11:35:21','2014-04-22 11:35:21','en',0);
/*!40000 ALTER TABLE `acl_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_group_i18n`
--

DROP TABLE IF EXISTS `acl_group_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_group_i18n` (
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `acl_group_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `acl_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_group_i18n`
--

LOCK TABLES `acl_group_i18n` WRITE;
/*!40000 ALTER TABLE `acl_group_i18n` DISABLE KEYS */;
INSERT INTO `acl_group_i18n` VALUES (NULL,NULL,1,'en'),('anonymous',NULL,98,'en'),('anónimo',NULL,98,'es'),('anonyme',NULL,98,'fr'),('anónimo',NULL,98,'gl'),('anonimo',NULL,98,'it'),('匿名',NULL,98,'ja'),('ანონიმი',NULL,98,'ka'),('anonimowy',NULL,98,'pl'),('anónimo',NULL,98,'pt'),('anonimno',NULL,98,'sl'),('นิรนาม',NULL,98,'th'),('authenticated',NULL,99,'en'),('autenticado',NULL,99,'es'),('authentifié',NULL,99,'fr'),('autentificado',NULL,99,'gl'),('autenticato',NULL,99,'it'),('認証された',NULL,99,'ja'),('აუთენტური',NULL,99,'ka'),('zweryfikowany',NULL,99,'pl'),('autenticado',NULL,99,'pt'),('autenticado',NULL,99,'pt_BR'),('overjeno',NULL,99,'sl'),('administrator',NULL,100,'en'),('administrador',NULL,100,'es'),('administrateur',NULL,100,'fr'),('administrador',NULL,100,'gl'),('Amministratore',NULL,100,'it'),('管理者',NULL,100,'ja'),('ადმინისტრატორი',NULL,100,'ka'),('administrator',NULL,100,'pl'),('administrador',NULL,100,'pt'),('skrbnik',NULL,100,'sl'),('editor',NULL,101,'en'),('editor',NULL,101,'es'),('auteur de la modification',NULL,101,'fr'),('editor',NULL,101,'gl'),('editore',NULL,101,'it'),('編集者',NULL,101,'ja'),('რედაქტორი',NULL,101,'ka'),('edytor',NULL,101,'pl'),('editor',NULL,101,'pt'),('urednik',NULL,101,'sl'),('contributor',NULL,102,'en'),('contribuidor',NULL,102,'es'),('contributeur',NULL,102,'fr'),('contribuínte',NULL,102,'gl'),('Kontributor',NULL,102,'id'),('soggetto che ha fornito un contributo',NULL,102,'it'),('貢献者',NULL,102,'ja'),('კონტრიბუტორი, დამხმარე, ხელის შემწყობი',NULL,102,'ka'),('kontrybutor',NULL,102,'pl'),('colaborador',NULL,102,'pt'),('sodelavec',NULL,102,'sl'),('translator',NULL,103,'en'),('traductor',NULL,103,'es'),('traducteur',NULL,103,'fr'),('traductor',NULL,103,'gl'),('terjemah',NULL,103,'id'),('traduttore',NULL,103,'it'),('翻訳者',NULL,103,'ja'),('მთარგმნელი',NULL,103,'ka'),('tłumacz',NULL,103,'pl'),('tradutor',NULL,103,'pt'),('prevajalec',NULL,103,'sl'),('three dimensional วัตถุ',NULL,103,'th');
/*!40000 ALTER TABLE `acl_group_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_permission`
--

DROP TABLE IF EXISTS `acl_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grant_deny` int(11) NOT NULL DEFAULT '0',
  `conditional` text COLLATE utf8_unicode_ci,
  `constants` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `acl_permission_FI_1` (`user_id`),
  KEY `acl_permission_FI_2` (`group_id`),
  KEY `acl_permission_FI_3` (`object_id`),
  CONSTRAINT `acl_permission_FK_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acl_permission_FK_2` FOREIGN KEY (`group_id`) REFERENCES `acl_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acl_permission_FK_3` FOREIGN KEY (`object_id`) REFERENCES `object` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_permission`
--

LOCK TABLES `acl_permission` WRITE;
/*!40000 ALTER TABLE `acl_permission` DISABLE KEYS */;
INSERT INTO `acl_permission` VALUES (1,NULL,98,NULL,'read',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(2,NULL,98,1,'readReference',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(3,NULL,99,NULL,'read',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(4,NULL,99,1,'readReference',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(5,NULL,100,NULL,NULL,1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(6,NULL,101,NULL,'create',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(7,NULL,101,NULL,'update',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(8,NULL,101,NULL,'delete',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(9,NULL,101,1,'viewDraft',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(10,NULL,101,1,'publish',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(11,NULL,101,1,'readMaster',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(12,NULL,102,1,'create',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(13,NULL,102,3,'create',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(14,NULL,102,1,'update',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(15,NULL,102,3,'update',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(16,NULL,102,1,'viewDraft',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(17,NULL,102,1,'readMaster',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0),(18,NULL,103,NULL,'translate',1,NULL,NULL,'2014-04-22 11:35:21','2014-04-22 11:35:21',0);
/*!40000 ALTER TABLE `acl_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl_user_group`
--

DROP TABLE IF EXISTS `acl_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `acl_user_group_FI_1` (`user_id`),
  KEY `acl_user_group_FI_2` (`group_id`),
  CONSTRAINT `acl_user_group_FK_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `acl_user_group_FK_2` FOREIGN KEY (`group_id`) REFERENCES `acl_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl_user_group`
--

LOCK TABLES `acl_user_group` WRITE;
/*!40000 ALTER TABLE `acl_user_group` DISABLE KEYS */;
INSERT INTO `acl_user_group` VALUES (1,357,100,0);
/*!40000 ALTER TABLE `acl_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor`
--

DROP TABLE IF EXISTS `actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `corporate_body_identifiers` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_type_id` int(11) DEFAULT NULL,
  `description_status_id` int(11) DEFAULT NULL,
  `description_detail_id` int(11) DEFAULT NULL,
  `description_identifier` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_standard` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `actor_FI_2` (`entity_type_id`),
  KEY `actor_FI_3` (`description_status_id`),
  KEY `actor_FI_4` (`description_detail_id`),
  KEY `actor_FI_5` (`parent_id`),
  CONSTRAINT `actor_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `actor_FK_2` FOREIGN KEY (`entity_type_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `actor_FK_3` FOREIGN KEY (`description_status_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `actor_FK_4` FOREIGN KEY (`description_detail_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `actor_FK_5` FOREIGN KEY (`parent_id`) REFERENCES `actor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor`
--

LOCK TABLES `actor` WRITE;
/*!40000 ALTER TABLE `actor` DISABLE KEYS */;
INSERT INTO `actor` VALUES (3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,2,'en'),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,4,'en'),(357,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,6,'en'),(380,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,8,'en');
/*!40000 ALTER TABLE `actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actor_i18n`
--

DROP TABLE IF EXISTS `actor_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actor_i18n` (
  `authorized_form_of_name` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dates_of_existence` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `history` text COLLATE utf8_unicode_ci,
  `places` text COLLATE utf8_unicode_ci,
  `legal_status` text COLLATE utf8_unicode_ci,
  `functions` text COLLATE utf8_unicode_ci,
  `mandates` text COLLATE utf8_unicode_ci,
  `internal_structures` text COLLATE utf8_unicode_ci,
  `general_context` text COLLATE utf8_unicode_ci,
  `institution_responsible_identifier` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules` text COLLATE utf8_unicode_ci,
  `sources` text COLLATE utf8_unicode_ci,
  `revision_history` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `actor_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `actor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actor_i18n`
--

LOCK TABLES `actor_i18n` WRITE;
/*!40000 ALTER TABLE `actor_i18n` DISABLE KEYS */;
INSERT INTO `actor_i18n` VALUES (NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'en'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,'en'),(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,357,'en'),('hi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,380,'en');
/*!40000 ALTER TABLE `actor_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aip`
--

DROP TABLE IF EXISTS `aip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aip` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `uuid` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size_on_disk` bigint(20) DEFAULT NULL,
  `digital_object_count` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `part_of` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aip_FI_2` (`type_id`),
  KEY `aip_FI_3` (`part_of`),
  CONSTRAINT `aip_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `aip_FK_2` FOREIGN KEY (`type_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `aip_FK_3` FOREIGN KEY (`part_of`) REFERENCES `object` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aip`
--

LOCK TABLES `aip` WRITE;
/*!40000 ALTER TABLE `aip` DISABLE KEYS */;
/*!40000 ALTER TABLE `aip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_information`
--

DROP TABLE IF EXISTS `contact_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_information` (
  `actor_id` int(11) NOT NULL,
  `primary_contact` tinyint(4) DEFAULT NULL,
  `contact_person` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_address` text COLLATE utf8_unicode_ci,
  `website` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `latitude` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `contact_information_FI_1` (`actor_id`),
  CONSTRAINT `contact_information_FK_1` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_information`
--

LOCK TABLES `contact_information` WRITE;
/*!40000 ALTER TABLE `contact_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_information_i18n`
--

DROP TABLE IF EXISTS `contact_information_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_information_i18n` (
  `contact_type` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `contact_information_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `contact_information` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_information_i18n`
--

LOCK TABLES `contact_information_i18n` WRITE;
/*!40000 ALTER TABLE `contact_information_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_information_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deaccession`
--

DROP TABLE IF EXISTS `deaccession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deaccession` (
  `id` int(11) NOT NULL,
  `accession_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `identifier` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deaccession_FI_2` (`accession_id`),
  KEY `deaccession_FI_3` (`scope_id`),
  CONSTRAINT `deaccession_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deaccession_FK_2` FOREIGN KEY (`accession_id`) REFERENCES `accession` (`id`) ON DELETE CASCADE,
  CONSTRAINT `deaccession_FK_3` FOREIGN KEY (`scope_id`) REFERENCES `term` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deaccession`
--

LOCK TABLES `deaccession` WRITE;
/*!40000 ALTER TABLE `deaccession` DISABLE KEYS */;
/*!40000 ALTER TABLE `deaccession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deaccession_i18n`
--

DROP TABLE IF EXISTS `deaccession_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deaccession_i18n` (
  `description` text COLLATE utf8_unicode_ci,
  `extent` text COLLATE utf8_unicode_ci,
  `reason` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `deaccession_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `deaccession` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deaccession_i18n`
--

LOCK TABLES `deaccession_i18n` WRITE;
/*!40000 ALTER TABLE `deaccession_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `deaccession_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `digital_object`
--

DROP TABLE IF EXISTS `digital_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `digital_object` (
  `id` int(11) NOT NULL,
  `information_object_id` int(11) DEFAULT NULL,
  `usage_id` int(11) DEFAULT NULL,
  `mime_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_type_id` int(11) DEFAULT NULL,
  `name` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `sequence` int(11) DEFAULT NULL,
  `byte_size` int(11) DEFAULT NULL,
  `checksum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checksum_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `digital_object_FI_2` (`information_object_id`),
  KEY `digital_object_FI_3` (`usage_id`),
  KEY `digital_object_FI_4` (`media_type_id`),
  KEY `digital_object_FI_5` (`parent_id`),
  CONSTRAINT `digital_object_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `digital_object_FK_2` FOREIGN KEY (`information_object_id`) REFERENCES `information_object` (`id`),
  CONSTRAINT `digital_object_FK_3` FOREIGN KEY (`usage_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `digital_object_FK_4` FOREIGN KEY (`media_type_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `digital_object_FK_5` FOREIGN KEY (`parent_id`) REFERENCES `digital_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `digital_object`
--

LOCK TABLES `digital_object` WRITE;
/*!40000 ALTER TABLE `digital_object` DISABLE KEYS */;
INSERT INTO `digital_object` VALUES (368,364,140,'image/jpeg',136,'m-8000-879_141.jpg','/uploads/r/null/c/b/cb9d85d7fd8930ae06e4b4ba28df1362228850ae9611e7dfcfefd480ec6269d5/',NULL,29876,'cb9d85d7fd8930ae06e4b4ba28df1362228850ae9611e7dfcfefd480ec6269d5','sha256',NULL,1,6),(369,NULL,141,'image/jpeg',136,'m-8000-879_141_141.jpg','/uploads/r/null/7/e/7eadcb84638832042229afc68e2e1487ab991b49b99a42f0ff2be7e61b0301fb/',NULL,29885,'7eadcb84638832042229afc68e2e1487ab991b49b99a42f0ff2be7e61b0301fb','sha256',368,2,3),(370,NULL,142,'image/jpeg',136,'m-8000-879_141_142.jpg','/uploads/r/null/2/0/207e31a302c3c78f36dd62e8b0b5d13c4611b821be00e0666d0355318d5b22b7/',NULL,10694,'207e31a302c3c78f36dd62e8b0b5d13c4611b821be00e0666d0355318d5b22b7','sha256',368,4,5),(371,366,140,'image/png',136,'asa_home_icn.png','/uploads/r/null/1/d/1d7fe6498f9c51946cfe0b6512e5389e3cf5275a42562a2b668095f6a3f2682d/',NULL,3705,'1d7fe6498f9c51946cfe0b6512e5389e3cf5275a42562a2b668095f6a3f2682d','sha256',NULL,7,12),(372,NULL,141,'image/jpeg',136,'asa_home_icn_141.jpg','/uploads/r/null/a/e/ae234f78cad43c6b9c0d40948c2a7c5836fa06abccea317c54d884b435c0849d/',NULL,3496,'ae234f78cad43c6b9c0d40948c2a7c5836fa06abccea317c54d884b435c0849d','sha256',371,8,9),(373,NULL,142,'image/jpeg',136,'asa_home_icn_142.jpg','/uploads/r/null/a/e/ae234f78cad43c6b9c0d40948c2a7c5836fa06abccea317c54d884b435c0849d/',NULL,3496,'ae234f78cad43c6b9c0d40948c2a7c5836fa06abccea317c54d884b435c0849d','sha256',371,10,11),(374,359,140,'image/jpeg',136,'PPCLI.JPG','/uploads/r/null/0/d/0deca3cf196d61e6c4a5c9d45d61187f9aa87a5409741c2180a496ac03f1a830/',NULL,215434,'0deca3cf196d61e6c4a5c9d45d61187f9aa87a5409741c2180a496ac03f1a830','sha256',NULL,13,18),(375,NULL,141,'image/jpeg',136,'PPCLI_141.jpg','/uploads/r/null/8/6/86c0cd89c910fe84640e9a193b0063205b46515c80edb643c768e981b1ff7ae8/',NULL,34370,'86c0cd89c910fe84640e9a193b0063205b46515c80edb643c768e981b1ff7ae8','sha256',374,14,15),(376,NULL,142,'image/jpeg',136,'PPCLI_142.jpg','/uploads/r/null/5/9/5923ddec9c29746f9aa812848df5adb46a5cfcddd8cde7aa506dee1e5ecd7db9/',NULL,13265,'5923ddec9c29746f9aa812848df5adb46a5cfcddd8cde7aa506dee1e5ecd7db9','sha256',374,16,17),(377,361,140,'image/jpeg',136,'b_141.jpg','/uploads/r/null/1/f/1f2c7d8700d725f735d9a4bb29a7b8fdf4733d477fe8bbf30aecef21a52c3ff5/',NULL,28119,'1f2c7d8700d725f735d9a4bb29a7b8fdf4733d477fe8bbf30aecef21a52c3ff5','sha256',NULL,19,24),(378,NULL,141,'image/jpeg',136,'b_141_141.jpg','/uploads/r/null/4/2/42407e122c0600475c048b8f2726b63f4d5fc267519e2866ff25d86386460e43/',NULL,28120,'42407e122c0600475c048b8f2726b63f4d5fc267519e2866ff25d86386460e43','sha256',377,20,21),(379,NULL,142,'image/jpeg',136,'b_141_142.jpg','/uploads/r/null/b/5/b5d838e2789ce56e78b89d985fca881be505c32b360e3486643d712556e9c35e/',NULL,9846,'b5d838e2789ce56e78b89d985fca881be505c32b360e3486643d712556e9c35e','sha256',377,22,23);
/*!40000 ALTER TABLE `digital_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donor` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `donor_FK_1` FOREIGN KEY (`id`) REFERENCES `actor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `information_object_id` int(11) DEFAULT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_FI_2` (`type_id`),
  KEY `event_FI_3` (`information_object_id`),
  KEY `event_FI_4` (`actor_id`),
  CONSTRAINT `event_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_FK_2` FOREIGN KEY (`type_id`) REFERENCES `term` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_FK_3` FOREIGN KEY (`information_object_id`) REFERENCES `information_object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `event_FK_4` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (360,'2014-00-00',NULL,'2014-00-00',NULL,111,359,NULL,'en'),(362,'2012-00-00',NULL,'2012-00-00',NULL,111,361,NULL,'en'),(365,'1999-00-00',NULL,'1999-00-00',NULL,111,364,NULL,'en'),(367,'1980-00-00',NULL,'1980-00-00',NULL,111,366,NULL,'en');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_i18n`
--

DROP TABLE IF EXISTS `event_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_i18n` (
  `name` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `date` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `event_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_i18n`
--

LOCK TABLES `event_i18n` WRITE;
/*!40000 ALTER TABLE `event_i18n` DISABLE KEYS */;
INSERT INTO `event_i18n` VALUES (NULL,NULL,'2014',360,'en'),(NULL,NULL,'2012',362,'en'),(NULL,NULL,'1999',365,'en'),(NULL,NULL,'1980',367,'en');
/*!40000 ALTER TABLE `event_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function`
--

DROP TABLE IF EXISTS `function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `function` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description_status_id` int(11) DEFAULT NULL,
  `description_detail_id` int(11) DEFAULT NULL,
  `description_identifier` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_standard` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `function_FI_2` (`type_id`),
  KEY `function_FI_3` (`parent_id`),
  KEY `function_FI_4` (`description_status_id`),
  KEY `function_FI_5` (`description_detail_id`),
  CONSTRAINT `function_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `function_FK_2` FOREIGN KEY (`type_id`) REFERENCES `term` (`id`),
  CONSTRAINT `function_FK_3` FOREIGN KEY (`parent_id`) REFERENCES `function` (`id`),
  CONSTRAINT `function_FK_4` FOREIGN KEY (`description_status_id`) REFERENCES `term` (`id`),
  CONSTRAINT `function_FK_5` FOREIGN KEY (`description_detail_id`) REFERENCES `term` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function`
--

LOCK TABLES `function` WRITE;
/*!40000 ALTER TABLE `function` DISABLE KEYS */;
/*!40000 ALTER TABLE `function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `function_i18n`
--

DROP TABLE IF EXISTS `function_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `function_i18n` (
  `authorized_form_of_name` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classification` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dates` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `history` text COLLATE utf8_unicode_ci,
  `legislation` text COLLATE utf8_unicode_ci,
  `institution_identifier` text COLLATE utf8_unicode_ci,
  `revision_history` text COLLATE utf8_unicode_ci,
  `rules` text COLLATE utf8_unicode_ci,
  `sources` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `function_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `function` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `function_i18n`
--

LOCK TABLES `function_i18n` WRITE;
/*!40000 ALTER TABLE `function_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `function_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_object`
--

DROP TABLE IF EXISTS `information_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information_object` (
  `id` int(11) NOT NULL,
  `identifier` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `oai_local_identifier` int(11) NOT NULL AUTO_INCREMENT,
  `level_of_description_id` int(11) DEFAULT NULL,
  `collection_type_id` int(11) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `description_status_id` int(11) DEFAULT NULL,
  `description_detail_id` int(11) DEFAULT NULL,
  `description_identifier` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_standard` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `display_standard_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `information_object_U_1` (`oai_local_identifier`),
  KEY `information_object_FI_2` (`level_of_description_id`),
  KEY `information_object_FI_3` (`collection_type_id`),
  KEY `information_object_FI_4` (`repository_id`),
  KEY `information_object_FI_5` (`parent_id`),
  KEY `information_object_FI_6` (`description_status_id`),
  KEY `information_object_FI_7` (`description_detail_id`),
  KEY `information_object_FI_8` (`display_standard_id`),
  CONSTRAINT `information_object_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `information_object_FK_2` FOREIGN KEY (`level_of_description_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `information_object_FK_3` FOREIGN KEY (`collection_type_id`) REFERENCES `term` (`id`),
  CONSTRAINT `information_object_FK_4` FOREIGN KEY (`repository_id`) REFERENCES `repository` (`id`),
  CONSTRAINT `information_object_FK_5` FOREIGN KEY (`parent_id`) REFERENCES `information_object` (`id`),
  CONSTRAINT `information_object_FK_6` FOREIGN KEY (`description_status_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `information_object_FK_7` FOREIGN KEY (`description_detail_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `information_object_FK_8` FOREIGN KEY (`display_standard_id`) REFERENCES `term` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_object`
--

LOCK TABLES `information_object` WRITE;
/*!40000 ALTER TABLE `information_object` DISABLE KEYS */;
INSERT INTO `information_object` VALUES (1,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,14,'en'),(358,'a',2,221,NULL,NULL,1,NULL,NULL,NULL,'ISAD(G) 2nd edition',NULL,2,7,'en'),(359,'f1',3,226,NULL,NULL,358,NULL,NULL,NULL,NULL,NULL,3,4,'en'),(361,'f2',4,226,NULL,NULL,358,NULL,NULL,NULL,NULL,NULL,5,6,'en'),(363,'ef2',5,221,NULL,NULL,1,NULL,NULL,NULL,'ISAD(G) 2nd edition',NULL,8,13,'en'),(364,'f3',6,226,NULL,NULL,363,NULL,NULL,NULL,NULL,NULL,9,10,'en'),(366,'f4',7,226,NULL,NULL,363,NULL,NULL,NULL,NULL,NULL,11,12,'en');
/*!40000 ALTER TABLE `information_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_object_i18n`
--

DROP TABLE IF EXISTS `information_object_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information_object_i18n` (
  `title` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternate_title` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edition` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extent_and_medium` text COLLATE utf8_unicode_ci,
  `archival_history` text COLLATE utf8_unicode_ci,
  `acquisition` text COLLATE utf8_unicode_ci,
  `scope_and_content` text COLLATE utf8_unicode_ci,
  `appraisal` text COLLATE utf8_unicode_ci,
  `accruals` text COLLATE utf8_unicode_ci,
  `arrangement` text COLLATE utf8_unicode_ci,
  `access_conditions` text COLLATE utf8_unicode_ci,
  `reproduction_conditions` text COLLATE utf8_unicode_ci,
  `physical_characteristics` text COLLATE utf8_unicode_ci,
  `finding_aids` text COLLATE utf8_unicode_ci,
  `location_of_originals` text COLLATE utf8_unicode_ci,
  `location_of_copies` text COLLATE utf8_unicode_ci,
  `related_units_of_description` text COLLATE utf8_unicode_ci,
  `institution_responsible_identifier` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rules` text COLLATE utf8_unicode_ci,
  `sources` text COLLATE utf8_unicode_ci,
  `revision_history` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `information_object_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `information_object` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_object_i18n`
--

LOCK TABLES `information_object_i18n` WRITE;
/*!40000 ALTER TABLE `information_object_i18n` DISABLE KEYS */;
INSERT INTO `information_object_i18n` VALUES (NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'en'),('Example Fonds 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,358,'en'),('File 1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,359,'en'),('File 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,361,'en'),('Example Fonds 2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,363,'en'),('File 3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,364,'en'),('File 4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,366,'en');
/*!40000 ALTER TABLE `information_object_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keymap`
--

DROP TABLE IF EXISTS `keymap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keymap` (
  `source_id` text COLLATE utf8_unicode_ci,
  `target_id` int(11) DEFAULT NULL,
  `source_name` text COLLATE utf8_unicode_ci,
  `target_name` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keymap`
--

LOCK TABLES `keymap` WRITE;
/*!40000 ALTER TABLE `keymap` DISABLE KEYS */;
/*!40000 ALTER TABLE `keymap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `menu_FI_1` (`parent_id`),
  CONSTRAINT `menu_FK_1` FOREIGN KEY (`parent_id`) REFERENCES `menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (NULL,NULL,NULL,1,108,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',1,0),(1,'mainMenu',NULL,2,77,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',2,0),(1,'quickLinks',NULL,78,91,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',3,0),(1,'browse',NULL,92,107,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',4,0),(2,'add','accession/add',3,16,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',5,0),(10,'taxonomies','taxonomy/browse',26,27,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',6,0),(2,'import','object/importSelect',29,34,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',7,0),(2,'admin','user/list',35,76,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',9,0),(2,'manage','accession/browse',17,28,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',10,0),(10,'accessions','accession/browse',18,19,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',11,0),(10,'donors','donor/browse',20,21,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',12,0),(10,'browsePhysicalObjects','physicalobject/browse',22,23,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',13,0),(10,'rightsholders','rightsholder/browse',24,25,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',14,0),(5,'addAccessionRecord','accession/add',4,5,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',15,0),(5,'addInformationObject','informationobject/add',6,7,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',16,0),(5,'addActor','actor/add',8,9,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',17,0),(5,'addRepository','repository/add',10,11,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',18,0),(5,'addTerm','term/add',12,13,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',19,0),(5,'addFunction','function/add',14,15,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',20,0),(7,'importXml','object/importSelect?type=xml',30,31,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',21,0),(7,'importCsv','object/importSelect?type=csv',32,33,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',22,0),(9,'users','user/list',36,47,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',23,0),(23,'userProfile','user/index?slug=%currentSlug%',37,38,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',24,0),(23,'userInformationObjectAcl','user/indexInformationObjectAcl?slug=%currentSlug%',39,40,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',25,0),(23,'userActorAcl','user/indexActorAcl?slug=%currentSlug%',41,42,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',26,0),(23,'userRepositoryAcl','user/indexRepositoryAcl?slug=%currentSlug%',43,44,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',27,0),(23,'userTermAcl','user/indexTermAcl?slug=%currentSlug%',45,46,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',28,0),(9,'groups','aclGroup/list',48,59,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',29,0),(29,'groupProfile','aclGroup/index?id=%currentId%',49,50,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',30,0),(29,'groupInformationObjectAcl','aclGroup/indexInformationObjectAcl?id=%currentId%',51,52,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',31,0),(29,'groupActorAcl','aclGroup/indexActorAcl?id=%currentId%',53,54,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',32,0),(29,'groupRepositoryAcl','aclGroup/indexRepositoryAcl?id=%currentId%',55,56,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',33,0),(29,'groupTermAcl','aclGroup/indexTermAcl?id=%currentId%',57,58,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',34,0),(9,'staticPages','staticpage/list',60,61,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',35,0),(9,'menu','menu/list',62,63,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',36,0),(9,'plugins','sfPluginAdminPlugin/plugins',64,65,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',37,0),(9,'themes','sfPluginAdminPlugin/themes',66,67,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',38,0),(9,'settings','settings/list',68,69,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',39,0),(9,'descriptionUpdates','search/descriptionUpdates',70,71,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',40,0),(9,'globalReplace','search/globalReplace',72,73,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',41,0),(3,'home','@homepage',79,80,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',42,0),(3,'about','staticpage/index?slug=about',81,82,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',43,0),(3,'help','http://docs.accesstomemory.org/',83,84,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',44,0),(3,'myProfile','%profile%',85,86,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',45,0),(3,'login','user/login',87,88,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',46,0),(3,'logout','user/logout',89,90,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',47,0),(4,'browseInformationObjects','informationobject/browse',93,94,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',48,0),(4,'browseActors','actor/browse',95,96,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',49,0),(4,'browseRepositories','repository/browse',97,98,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',50,0),(4,'browseFunctions','function/browse',99,100,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',51,0),(4,'browseSubjects','taxonomy/browse?id=35',101,102,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',52,0),(4,'browsePlaces','taxonomy/browse?id=42',103,104,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',53,0),(4,'browseDigitalObjects','digitalobject/browse',105,106,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',54,0),(9,'visibleElements','settings/visibleElements',74,75,'2014-04-22 11:35:22','2014-04-22 11:35:22','en',55,0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_i18n`
--

DROP TABLE IF EXISTS `menu_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_i18n` (
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `menu_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `menu` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_i18n`
--

LOCK TABLES `menu_i18n` WRITE;
/*!40000 ALTER TABLE `menu_i18n` DISABLE KEYS */;
INSERT INTO `menu_i18n` VALUES (NULL,NULL,1,'en'),(NULL,NULL,2,'en'),(NULL,NULL,3,'en'),('Browse',NULL,4,'en'),('Navegar',NULL,4,'es'),('Parcourir',NULL,4,'fr'),('Navegar',NULL,4,'gl'),('Telusur',NULL,4,'id'),('Scorri',NULL,4,'it'),('ブラウズ',NULL,4,'ja'),('დათვალიერება(ამორჩევა)',NULL,4,'ka'),('Blader',NULL,4,'nl'),('Przeglądaj',NULL,4,'pl'),('Navegar',NULL,4,'pt'),('Brskaj',NULL,4,'sl'),('Hinzufügen',NULL,5,'de'),('Add',NULL,5,'en'),('Agregar',NULL,5,'es'),('افزودن',NULL,5,'fa'),('Ajouter',NULL,5,'fr'),('Engadir',NULL,5,'gl'),('Tambah',NULL,5,'id'),('Aggiungi',NULL,5,'it'),('追加',NULL,5,'ja'),('დამატება',NULL,5,'ka'),('추가',NULL,5,'ko'),('Voeg toe',NULL,5,'nl'),('Dodaj',NULL,5,'pl'),('Adicionar',NULL,5,'pt'),('Adicionar',NULL,5,'pt_BR'),('Dodaj',NULL,5,'sl'),('เพิ่ม',NULL,5,'th'),('Taxonomies',NULL,6,'en'),('Taxonomías',NULL,6,'es'),('Référentiels',NULL,6,'fr'),('Taxonomías',NULL,6,'gl'),('Taksonomi',NULL,6,'id'),('Tassonomie',NULL,6,'it'),('分類',NULL,6,'ja'),('ტაქსონომიები  ( კლასიფიცირება)',NULL,6,'ka'),('Taxonomieën',NULL,6,'nl'),('Taksonomie',NULL,6,'pl'),('Taxonomias',NULL,6,'pt'),('Taksonomije',NULL,6,'sl'),('อนุกรมวิธาน',NULL,6,'th'),('importieren',NULL,7,'de'),('Import',NULL,7,'en'),('Importar',NULL,7,'es'),('وارد كردن',NULL,7,'fa'),('Importer',NULL,7,'fr'),('Importar',NULL,7,'gl'),('Importa',NULL,7,'it'),('インポート',NULL,7,'ja'),('იმპორტი',NULL,7,'ka'),('가져오기',NULL,7,'ko'),('import',NULL,7,'nl'),('Importowanie',NULL,7,'pl'),('importar',NULL,7,'pt'),('Importar',NULL,7,'pt_BR'),('Uvoz',NULL,7,'sl'),('นำเข้า',NULL,7,'th'),('Administrator',NULL,9,'de'),('Admin',NULL,9,'en'),('Administrador',NULL,9,'es'),('مدير',NULL,9,'fa'),('Administration',NULL,9,'fr'),('Administrador',NULL,9,'gl'),('Amministrazione',NULL,9,'it'),('管理者',NULL,9,'ja'),('ადმინი',NULL,9,'ka'),('Administrator',NULL,9,'pl'),('Admin',NULL,9,'pt'),('Skrbnik',NULL,9,'sl'),('Manage',NULL,10,'en'),('Administrar',NULL,10,'es'),('Gérer',NULL,10,'fr'),('Administrar',NULL,10,'gl'),('Gestisci',NULL,10,'it'),('運営する',NULL,10,'ja'),('მართვა',NULL,10,'ka'),('Beheer',NULL,10,'nl'),('Zarządzanie',NULL,10,'pl'),('Gerir',NULL,10,'pt'),('Uredi',NULL,10,'sl'),('บริหาร(Manage)',NULL,10,'th'),('Accessions',NULL,11,'en'),('Ingresos',NULL,11,'es'),('Entrées',NULL,11,'fr'),('Ingresos',NULL,11,'gl'),('Acquisizioni',NULL,11,'it'),('受入資料',NULL,11,'ja'),('დაშვებები',NULL,11,'ka'),('Aanwinsten',NULL,11,'nl'),('Dopływy',NULL,11,'pl'),('Incorporação',NULL,11,'pt'),('Prevzemi',NULL,11,'sl'),('การเข้าถึงเอกสาร',NULL,11,'th'),('Donors',NULL,12,'en'),('Donadores',NULL,12,'es'),('Donateurs/Services versants',NULL,12,'fr'),('Donantes',NULL,12,'gl'),('Donatori',NULL,12,'it'),('寄贈者',NULL,12,'ja'),('დონორები',NULL,12,'ka'),('Schenkers',NULL,12,'nl'),('Przekazujący (materiały archiwalne)',NULL,12,'pl'),('Doadores',NULL,12,'pt'),('Donatorji',NULL,12,'sl'),('ผู้บริจาค',NULL,12,'th'),('Physical storage',NULL,13,'en'),('Unidad de almacenaje',NULL,13,'es'),('Localisation physique',NULL,13,'fr'),('Almacenamento físico',NULL,13,'gl'),('Penyimpanan Fisik',NULL,13,'id'),('Deposito',NULL,13,'it'),('物理的記憶',NULL,13,'ja'),('ფიზიკური საცავი',NULL,13,'ka'),('Fysieke opslag',NULL,13,'nl'),('Fizyczne miejsce przechowywania',NULL,13,'pl'),('Depósito físico',NULL,13,'pt'),('Depósito físico',NULL,13,'pt_BR'),('Fizična hramba',NULL,13,'sl'),('การเก็บเอกสารทางกายภาพ',NULL,13,'th'),('Rights holders',NULL,14,'en'),('Titulares de derechos',NULL,14,'es'),('Détenteurs de droits',NULL,14,'fr'),('Titulares de dereitos',NULL,14,'gl'),('Detentori di diritti',NULL,14,'it'),('権利保持者',NULL,14,'ja'),('უფლებების მქონეები(მფლობელები)',NULL,14,'ka'),('Rechthebbenden',NULL,14,'nl'),('Posiadacze praw',NULL,14,'pl'),('Proprietários dos direitos',NULL,14,'pt'),('Imetniki pravic',NULL,14,'sl'),('เจ้าของสิทธิ',NULL,14,'th'),('Accession records',NULL,15,'en'),('Registros de ingresos',NULL,15,'es'),('Notices d\'entrée',NULL,15,'fr'),('Rexistros de ingresos',NULL,15,'gl'),('Registrazioni delle acquisizioni',NULL,15,'it'),('受入記録',NULL,15,'ja'),('დაშვების დოკუმენტები',NULL,15,'ka'),('Aanwinst documentatie',NULL,15,'nl'),('Nabytki',NULL,15,'pl'),('Registos de incorporação',NULL,15,'pt'),('Zapisi o prevzemu',NULL,15,'sl'),('รายงานการเข้าถึงเอกสาร',NULL,15,'th'),('Archivische Beschreibung',NULL,16,'de'),('Archival descriptions',NULL,16,'en'),('Descripción archivística',NULL,16,'es'),('Descriptions archivistiques',NULL,16,'fr'),('Descrición arquivística',NULL,16,'gl'),('Descrizioni archivistiche',NULL,16,'it'),('archivistische beschrijving',NULL,16,'nl'),('Opis archiwalny',NULL,16,'pl'),('descrição arquivística',NULL,16,'pt'),('arhivski opisi',NULL,16,'sl'),('Authority records',NULL,17,'en'),('Registro de autoridad',NULL,17,'es'),('Notices d\'autorité',NULL,17,'fr'),('Rexistros de autoridade',NULL,17,'gl'),('Record d\'autorità',NULL,17,'it'),('geautoriseerd bestand',NULL,17,'nl'),('Hasło wzorcowe',NULL,17,'pl'),('registro de autoridade',NULL,17,'pt'),('normativni zapisi',NULL,17,'sl'),('Archiv',NULL,18,'de'),('Archival institutions',NULL,18,'en'),('Instituciones archivísticas',NULL,18,'es'),('Institutions de conservation',NULL,18,'fr'),('Repositorios',NULL,18,'gl'),('Repositori',NULL,18,'id'),('Istituzione archivistica',NULL,18,'it'),('リポジトリ',NULL,18,'ja'),('საცავები',NULL,18,'ka'),('archiefinstelling',NULL,18,'nl'),('Instytucja archiwalna',NULL,18,'pl'),('instituição arquivística',NULL,18,'pt'),('arhivske ustanove',NULL,18,'sl'),('คลังเก็บ',NULL,18,'th'),('Terms',NULL,19,'en'),('Términos',NULL,19,'es'),('Termes',NULL,19,'fr'),('Termos',NULL,19,'gl'),('Istilah',NULL,19,'id'),('Termini',NULL,19,'it'),('用語',NULL,19,'ja'),('ვადები',NULL,19,'ka'),('Termen',NULL,19,'nl'),('Terminy',NULL,19,'pl'),('Termos',NULL,19,'pt'),('Izrazi',NULL,19,'sl'),('คำศัพท์',NULL,19,'th'),('Funktion',NULL,20,'de'),('Function',NULL,20,'en'),('Función',NULL,20,'es'),('Fonctions',NULL,20,'fr'),('Función',NULL,20,'gl'),('Fungsi',NULL,20,'id'),('Funzione',NULL,20,'it'),('機能',NULL,20,'ja'),('ფუნქცია',NULL,20,'ka'),('Functie',NULL,20,'nl'),('Funkcja',NULL,20,'pl'),('Função',NULL,20,'pt'),('Funkcija',NULL,20,'sl'),('ฟังก์ชั่น',NULL,20,'th'),('XML',NULL,21,'en'),('XML',NULL,21,'es'),('XML',NULL,21,'fr'),('XML',NULL,21,'gl'),('XML',NULL,21,'it'),('XML',NULL,21,'ka'),('XML',NULL,21,'pl'),('XML',NULL,21,'pt'),('XML',NULL,21,'pt_BR'),('XML',NULL,21,'sl'),('CSV',NULL,22,'en'),('CSV',NULL,22,'es'),('CSV',NULL,22,'fr'),('CSV',NULL,22,'gl'),('CSV',NULL,22,'it'),('CSV',NULL,22,'ka'),('CSV',NULL,22,'pl'),('CSV',NULL,22,'pt'),('CSV',NULL,22,'sl'),('Users',NULL,23,'en'),('Usuarios',NULL,23,'es'),('كاربران',NULL,23,'fa'),('Utilisateurs',NULL,23,'fr'),('Usuarios',NULL,23,'gl'),('Utenti',NULL,23,'it'),('ユーザー',NULL,23,'ja'),('მომხმარებლები',NULL,23,'ka'),('Gebruikers',NULL,23,'nl'),('Użytkownicy',NULL,23,'pl'),('Utilizadores',NULL,23,'pt'),('Uporabniki',NULL,23,'sl'),('ผู้ใช้',NULL,23,'th'),('Profile',NULL,24,'en'),('Perfil',NULL,24,'es'),('Profil',NULL,24,'fr'),('Perfil',NULL,24,'gl'),('Profilo',NULL,24,'it'),('プロフィール',NULL,24,'ja'),('პროფილი',NULL,24,'ka'),('Profiel',NULL,24,'nl'),('Profil',NULL,24,'pl'),('Perfil',NULL,24,'pt'),('profil',NULL,24,'sl'),('ประว้ติส่วนตัว',NULL,24,'th'),('Archival description permissions',NULL,25,'en'),('Information object permissions',NULL,25,'es'),('Droits sur la description archivistique',NULL,25,'fr'),('Permisos de descrición arquivística',NULL,25,'gl'),('Permessi per la descrizione archivistica',NULL,25,'it'),('情報オブジェクト許可',NULL,25,'ja'),('საინფორმაციო ობიექტის უფლებამოსილებები',NULL,25,'ka'),('Permissões do objeto informacional',NULL,25,'pt'),('Dovoljenja glede informacijskega objekta',NULL,25,'sl'),('วัตถุข้อมูลการอนุญาต',NULL,25,'th'),('Authority record permissions',NULL,26,'en'),('Permisos del actor',NULL,26,'es'),('Droits de la notice d\'autorité',NULL,26,'fr'),('Permisos de actor',NULL,26,'gl'),('Izin Aktor',NULL,26,'id'),('Permessi per il record d\'autorità',NULL,26,'it'),('主体者の許可',NULL,26,'ja'),('მონაწილის უფლებები',NULL,26,'ka'),('Uprawnienia sprawcy/powoda',NULL,26,'pl'),('Permissões do ator',NULL,26,'pt'),('Dovoljenja za delovalca',NULL,26,'sl'),('Archival institution permissions',NULL,27,'en'),('Permisos Instituciones archivísticas',NULL,27,'es'),('Autorisations de l\'institution de conservation',NULL,27,'fr'),('Permisos de institución arquivística',NULL,27,'gl'),('Permessi dell\'istituto archivistico',NULL,27,'it'),('Dovoljenja glede arhivske ustanove',NULL,27,'sl'),('Taxonomy permissions',NULL,28,'en'),('Permisos para taxonomías',NULL,28,'es'),('Droits sur les référentiels',NULL,28,'fr'),('Permisos de taxonomías',NULL,28,'gl'),('Perijinan Taksonomi',NULL,28,'id'),('Permessi relativi alla tassonomia',NULL,28,'it'),('分類許可',NULL,28,'ja'),('ტაქსონომის ნების დართვა',NULL,28,'ka'),('Taxonomie permissies',NULL,28,'nl'),('Uprawnienia w zakresie taksonomii',NULL,28,'pl'),('Permissões da taxonomia',NULL,28,'pt'),('Dovoljenja za taksonomijo',NULL,28,'sl'),('การอนุญาตอนุกรมวิธาน',NULL,28,'th'),('Groups',NULL,29,'en'),('Grupos',NULL,29,'es'),('Groupes',NULL,29,'fr'),('Grupos',NULL,29,'gl'),('Gruppi',NULL,29,'it'),('グループ',NULL,29,'ja'),('ჯგუფები',NULL,29,'ka'),('Groepen',NULL,29,'nl'),('Grupy',NULL,29,'pl'),('Groupos',NULL,29,'pt'),('Skupine',NULL,29,'sl'),('กลุ่ม',NULL,29,'th'),('Profile',NULL,30,'en'),('Perfil',NULL,30,'es'),('Profil',NULL,30,'fr'),('Perfil',NULL,30,'gl'),('Profilo',NULL,30,'it'),('プロフィール',NULL,30,'ja'),('პროფილი',NULL,30,'ka'),('Profiel',NULL,30,'nl'),('Profil',NULL,30,'pl'),('Perfil',NULL,30,'pt'),('profil',NULL,30,'sl'),('ประว้ติส่วนตัว',NULL,30,'th'),('Archival description permissions',NULL,31,'en'),('Information object permissions',NULL,31,'es'),('Droits sur la description archivistique',NULL,31,'fr'),('Permisos de descrición arquivística',NULL,31,'gl'),('Permessi per la descrizione archivistica',NULL,31,'it'),('情報オブジェクト許可',NULL,31,'ja'),('საინფორმაციო ობიექტის უფლებამოსილებები',NULL,31,'ka'),('Permissões do objeto informacional',NULL,31,'pt'),('Dovoljenja glede informacijskega objekta',NULL,31,'sl'),('วัตถุข้อมูลการอนุญาต',NULL,31,'th'),('Authority record permissions',NULL,32,'en'),('Permisos del actor',NULL,32,'es'),('Droits de la notice d\'autorité',NULL,32,'fr'),('Permisos de actor',NULL,32,'gl'),('Izin Aktor',NULL,32,'id'),('Permessi per il record d\'autorità',NULL,32,'it'),('主体者の許可',NULL,32,'ja'),('მონაწილის უფლებები',NULL,32,'ka'),('Uprawnienia sprawcy/powoda',NULL,32,'pl'),('Permissões do ator',NULL,32,'pt'),('Dovoljenja za delovalca',NULL,32,'sl'),('Archival institution permissions',NULL,33,'en'),('Permisos Instituciones archivísticas',NULL,33,'es'),('Autorisations de l\'institution de conservation',NULL,33,'fr'),('Permisos de institución arquivística',NULL,33,'gl'),('Permessi dell\'istituto archivistico',NULL,33,'it'),('Dovoljenja glede arhivske ustanove',NULL,33,'sl'),('Taxonomy permissions',NULL,34,'en'),('Permisos para taxonomías',NULL,34,'es'),('Droits sur les référentiels',NULL,34,'fr'),('Permisos de taxonomías',NULL,34,'gl'),('Perijinan Taksonomi',NULL,34,'id'),('Permessi relativi alla tassonomia',NULL,34,'it'),('分類許可',NULL,34,'ja'),('ტაქსონომის ნების დართვა',NULL,34,'ka'),('Taxonomie permissies',NULL,34,'nl'),('Uprawnienia w zakresie taksonomii',NULL,34,'pl'),('Permissões da taxonomia',NULL,34,'pt'),('Dovoljenja za taksonomijo',NULL,34,'sl'),('การอนุญาตอนุกรมวิธาน',NULL,34,'th'),('Static pages',NULL,35,'en'),('Páginas estáticas',NULL,35,'es'),('صفحات ايستا',NULL,35,'fa'),('Pages statiques',NULL,35,'fr'),('Páxinas estáticas',NULL,35,'gl'),('Pagine statiche',NULL,35,'it'),('静的ページ',NULL,35,'ja'),('არეულ-დარეული გვერდები',NULL,35,'ka'),('statische pagina\'s',NULL,35,'nl'),('Strony statyczne',NULL,35,'pl'),('Páginas estáticas',NULL,35,'pt'),('Statične strani',NULL,35,'sl'),('หน้าคง',NULL,35,'th'),('Menus',NULL,36,'en'),('Menús',NULL,36,'es'),('Menus',NULL,36,'fr'),('Menús',NULL,36,'gl'),('Menu',NULL,36,'it'),('メニュー',NULL,36,'ja'),('მენიუები',NULL,36,'ka'),('Listy menu',NULL,36,'pl'),('Menus',NULL,36,'pt'),('Meniji',NULL,36,'sl'),('Plugins',NULL,37,'en'),('Plugins',NULL,37,'es'),('Extensions',NULL,37,'fr'),('Plugin',NULL,37,'it'),('プラグイン',NULL,37,'ja'),('ფლაგინები',NULL,37,'ka'),('Wtyczki/pluginy',NULL,37,'pl'),('Componentes',NULL,37,'pt'),('Vtičniki',NULL,37,'sl'),('ปลั๊กอิน',NULL,37,'th'),('Themes',NULL,38,'en'),('Temas',NULL,38,'es'),('Thèmes',NULL,38,'fr'),('Temas',NULL,38,'gl'),('Tema',NULL,38,'id'),('Temi',NULL,38,'it'),('テーマ',NULL,38,'ja'),('თემები',NULL,38,'ka'),('Thema\'s',NULL,38,'nl'),('Motywy',NULL,38,'pl'),('Temas',NULL,38,'pt'),('Temas',NULL,38,'pt_BR'),('Teme',NULL,38,'sl'),('Einstellungen',NULL,39,'de'),('Settings',NULL,39,'en'),('Configuraciones',NULL,39,'es'),('تنظيمات',NULL,39,'fa'),('Paramétrages',NULL,39,'fr'),('Configuraciones',NULL,39,'gl'),('Impostazioni',NULL,39,'it'),('設定',NULL,39,'ja'),('“სეთინგები“, ფუნქციები.',NULL,39,'ka'),('Instellingen',NULL,39,'nl'),('Ustawienia',NULL,39,'pl'),('Configurações',NULL,39,'pt'),('Nastavitve',NULL,39,'sl'),('การตั้งค่า',NULL,39,'th'),('Description updates',NULL,40,'en'),('Actualizaciones de descripción',NULL,40,'es'),('Mises à jour de la description',NULL,40,'fr'),('Actualizacións da descrición',NULL,40,'gl'),('Update Dekripsi',NULL,40,'id'),('Aggiornamenti della descrizione',NULL,40,'it'),('記述のアップデート',NULL,40,'ja'),('განახლებების აღწერა, ან აღწერის განახლებები',NULL,40,'ka'),('Wijzigingen van de beschrijving',NULL,40,'nl'),('Uaktualnienia opisu',NULL,40,'pl'),('Actualizações da descrição',NULL,40,'pt'),('Atualizações da descrição',NULL,40,'pt_BR'),('Posodobitve popisa',NULL,40,'sl'),('อับเดตคำอธิบาย',NULL,40,'th'),('Global search/replace',NULL,41,'en'),('Buscar/reemplazar global',NULL,41,'es'),('Recherche et remplacement globaux',NULL,41,'fr'),('Búsqueda global/Reemprazar',NULL,41,'gl'),('Ricerca/Sostituisci (globale)',NULL,41,'it'),('グローバル 検索/変更',NULL,41,'ja'),('გლობალური ძებნა /შენაცვლება',NULL,41,'ka'),('Pesquisa/substituição global',NULL,41,'pt'),('Pesquisa/substituição global',NULL,41,'pt_BR'),('Išči/zamenjaj v celotnem programu',NULL,41,'sl'),('ค้นหา / แทน ทั่วโลก',NULL,41,'th'),('Startseite',NULL,42,'de'),('Home',NULL,42,'en'),('Inicio',NULL,42,'es'),('صفحه اصلي',NULL,42,'fa'),('Accueil',NULL,42,'fr'),('Inicio',NULL,42,'gl'),('Pagina iniziale',NULL,42,'it'),('ホーム',NULL,42,'ja'),('საწყისი',NULL,42,'ka'),('home',NULL,42,'nl'),('Strona Domowa',NULL,42,'pl'),('Início',NULL,42,'pt'),('Início',NULL,42,'pt_BR'),('Domov',NULL,42,'sl'),('Über',NULL,43,'de'),('About',NULL,43,'en'),('Acerca',NULL,43,'es'),('درباره ما',NULL,43,'fa'),('À propos',NULL,43,'fr'),('Acerca',NULL,43,'gl'),('Tentang Kami',NULL,43,'id'),('Riguardo',NULL,43,'it'),('ついて',NULL,43,'ja'),('შესახებ',NULL,43,'ka'),('Over',NULL,43,'nl'),('O...',NULL,43,'pl'),('Sobre',NULL,43,'pt'),('Sobre',NULL,43,'pt_BR'),('O programu',NULL,43,'sl'),('Hilfe',NULL,44,'de'),('Help',NULL,44,'en'),('Ayuda',NULL,44,'es'),('راهنما',NULL,44,'fa'),('Aide',NULL,44,'fr'),('Axuda',NULL,44,'gl'),('Aiuto',NULL,44,'it'),('ヘルプ',NULL,44,'ja'),('დახმარება',NULL,44,'ka'),('Help',NULL,44,'nl'),('Pomoc',NULL,44,'pl'),('Ajuda',NULL,44,'pt'),('Ajuda',NULL,44,'pt_BR'),('Pomoč',NULL,44,'sl'),('My profile',NULL,45,'en'),('Mi perfil',NULL,45,'es'),('Mon profil',NULL,45,'fr'),('O meu perfil',NULL,45,'gl'),('Il mio profilo',NULL,45,'it'),('私のプロフィール',NULL,45,'ja'),('ჩემი პროფილი',NULL,45,'ka'),('Mijn profiel',NULL,45,'nl'),('Mój profil',NULL,45,'pl'),('O meu perfil',NULL,45,'pt'),('Meu Perfil',NULL,45,'pt_BR'),('Moj profil',NULL,45,'sl'),('ประว้ติส่วนตัว',NULL,45,'th'),('Anmelden',NULL,46,'de'),('Log in',NULL,46,'en'),('Iniciar sesión',NULL,46,'es'),('ورود به سيستم',NULL,46,'fa'),('Ouverture de session',NULL,46,'fr'),('Iniciar sesión',NULL,46,'gl'),('Accedi',NULL,46,'it'),('ログイン',NULL,46,'ja'),('ავტორიზაცია',NULL,46,'ka'),('로그인',NULL,46,'ko'),('Inloggen',NULL,46,'nl'),('Logowanie',NULL,46,'pl'),('Entrar',NULL,46,'pt'),('entrar',NULL,46,'pt_BR'),('Prijava',NULL,46,'sl'),('เข้าสู่ระบบ',NULL,46,'th'),('Abmelden',NULL,47,'de'),('Log out',NULL,47,'en'),('cerrar sesión',NULL,47,'es'),('خروج',NULL,47,'fa'),('Fermeture de session',NULL,47,'fr'),('Pechar sesión',NULL,47,'gl'),('Esci',NULL,47,'it'),('ログアウト',NULL,47,'ja'),('გამოსვლა',NULL,47,'ka'),('uitloggen',NULL,47,'nl'),('Sair',NULL,47,'pt'),('odjava',NULL,47,'sl'),('Archival descriptions',NULL,48,'en'),('Descripción archivística',NULL,48,'es'),('Descriptions archivistiques',NULL,48,'fr'),('Descrición arquivística',NULL,48,'gl'),('Descrizioni archivistiche',NULL,48,'it'),('archivistische beschrijving',NULL,48,'nl'),('descrição arquivística',NULL,48,'pt'),('arhivski opisi',NULL,48,'sl'),('Authority records',NULL,49,'en'),('Registro de autoridad',NULL,49,'es'),('Notices d\'autorité',NULL,49,'fr'),('Rexistros de autoridade',NULL,49,'gl'),('Record d\'autorità',NULL,49,'it'),('geautoriseerd bestand',NULL,49,'nl'),('registro de autoridade',NULL,49,'pt'),('normativni zapisi',NULL,49,'sl'),('Archival institutions',NULL,50,'en'),('Instituciones archivísticas',NULL,50,'es'),('Institutions de conservation',NULL,50,'fr'),('Repositorios',NULL,50,'gl'),('Repositori',NULL,50,'id'),('Istituzione archivistica',NULL,50,'it'),('リポジトリ',NULL,50,'ja'),('საცავები',NULL,50,'ka'),('archiefinstelling',NULL,50,'nl'),('instituição arquivística',NULL,50,'pt'),('arhivske ustanove',NULL,50,'sl'),('คลังเก็บ',NULL,50,'th'),('Funktionen',NULL,51,'de'),('Functions',NULL,51,'en'),('Funciones',NULL,51,'es'),('Fonctions',NULL,51,'fr'),('Funcións',NULL,51,'gl'),('Fungsi',NULL,51,'id'),('Funzioni',NULL,51,'it'),('機能',NULL,51,'ja'),('ფუნქციები',NULL,51,'ka'),('Functies',NULL,51,'nl'),('Funkcja',NULL,51,'pl'),('Funções',NULL,51,'pt'),('Funkcije',NULL,51,'sl'),('ฟังก์ชั่น',NULL,51,'th'),('Themen',NULL,52,'de'),('Subjects',NULL,52,'en'),('Materias',NULL,52,'es'),('Sujets',NULL,52,'fr'),('Materias',NULL,52,'gl'),('Subjek',NULL,52,'id'),('Soggetti',NULL,52,'it'),('主題',NULL,52,'ja'),('სუბიექტები',NULL,52,'ka'),('Onderwerpen',NULL,52,'nl'),('Assuntos',NULL,52,'pt'),('Osebe',NULL,52,'sl'),('หัวข้อ',NULL,52,'th'),('Orte',NULL,53,'de'),('Places',NULL,53,'en'),('Lugares',NULL,53,'es'),('مكان ها',NULL,53,'fa'),('Lieux',NULL,53,'fr'),('Lugares',NULL,53,'gl'),('Tempat',NULL,53,'id'),('Luoghi',NULL,53,'it'),('場所',NULL,53,'ja'),('ადგილები',NULL,53,'ka'),('장소',NULL,53,'ko'),('Plaatsen',NULL,53,'nl'),('Miejsca',NULL,53,'pl'),('locais',NULL,53,'pt'),('locais',NULL,53,'pt_BR'),('Kraji',NULL,53,'sl'),('สถานที',NULL,53,'th'),('Digitales Objekt',NULL,54,'de'),('Digital objects',NULL,54,'en'),('Objetos digitales',NULL,54,'es'),('Objets numériques',NULL,54,'fr'),('Obxectos dixitais',NULL,54,'gl'),('Objek Digital',NULL,54,'id'),('Oggetti digitali',NULL,54,'it'),('ディジタルオブジェクト',NULL,54,'ja'),('ციფრული ობიექტები',NULL,54,'ka'),('디지털 객체',NULL,54,'ko'),('Digitale objecten',NULL,54,'nl'),('Obiekty cyfrowe',NULL,54,'pl'),('Objeto digital',NULL,54,'pt'),('Objeto digital',NULL,54,'pt_BR'),('Digitalni predmeti',NULL,54,'sl'),('วัตถุดิจิตอล',NULL,54,'th'),('Visible elements',NULL,55,'en'),('Elementos visibles',NULL,55,'es'),('Éléments visibles',NULL,55,'fr'),('Elementos visíbeis',NULL,55,'gl'),('Elemen terlihat',NULL,55,'id'),('Elementi visibili',NULL,55,'it'),('見えるエレメント',NULL,55,'ja'),('შესამჩნევი ელემენტები',NULL,55,'ka'),('Elementos visiveis',NULL,55,'pt'),('Elementos visiveis',NULL,55,'pt_BR'),('Vidni elementi',NULL,55,'sl'),('elementsที่สามารถมองเห็นได้,',NULL,55,'th');
/*!40000 ALTER TABLE `menu_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note`
--

DROP TABLE IF EXISTS `note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note` (
  `object_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `scope` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `note_FI_1` (`object_id`),
  KEY `note_FI_2` (`type_id`),
  KEY `note_FI_3` (`user_id`),
  CONSTRAINT `note_FK_1` FOREIGN KEY (`object_id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `note_FK_2` FOREIGN KEY (`type_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `note_FK_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note`
--

LOCK TABLES `note` WRITE;
/*!40000 ALTER TABLE `note` DISABLE KEYS */;
INSERT INTO `note` VALUES (111,123,'QubitTerm',NULL,'en',1,0),(111,121,NULL,NULL,'en',2,0),(113,123,'QubitTerm',NULL,'en',3,0),(113,121,NULL,NULL,'en',4,0),(114,123,'QubitTerm',NULL,'en',5,0),(114,121,NULL,NULL,'en',6,0),(115,123,'QubitTerm',NULL,'en',7,0),(115,121,NULL,NULL,'en',8,0),(117,123,'QubitTerm',NULL,'en',9,0),(117,121,NULL,NULL,'en',10,0),(118,123,'QubitTerm',NULL,'en',11,0),(118,121,NULL,NULL,'en',12,0),(204,123,'QubitTerm',NULL,'en',13,0),(204,121,NULL,NULL,'en',14,0),(206,123,'QubitTerm',NULL,'en',15,0),(206,121,NULL,NULL,'en',16,0),(205,123,'QubitTerm',NULL,'en',17,0),(205,121,NULL,NULL,'en',18,0),(207,123,'QubitTerm',NULL,'en',19,0),(207,121,NULL,NULL,'en',20,0);
/*!40000 ALTER TABLE `note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `note_i18n`
--

DROP TABLE IF EXISTS `note_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `note_i18n` (
  `content` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `note_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `note` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `note_i18n`
--

LOCK TABLES `note_i18n` WRITE;
/*!40000 ALTER TABLE `note_i18n` DISABLE KEYS */;
INSERT INTO `note_i18n` VALUES ('Urheber/Bestandsbildner',1,'de'),('Creator',1,'en'),('Creador',1,'es'),('Producteur',1,'fr'),('Creador',1,'gl'),('Pencipta',1,'id'),('Soggetto produttore',1,'it'),('作成者',1,'ja'),('შემოქმედი',1,'ka'),('Archiefvormer',1,'nl'),('Twórca',1,'pl'),('Produtor',1,'pt'),('Produtor',1,'pt_BR'),('Ustvaril',1,'sl'),('ผู้ผลิตเอกสาร',1,'th'),('ISAD(G) 3.2.1, 3.1.3; DC 1.1 core element (Creator); Rules for Archival Description 1.4B',2,'en'),('Custodian',3,'en'),('Custodiador',3,'es'),('Détenteur',3,'fr'),('Beheerder',3,'nl'),('Custodiador',3,'pt'),('Rules for Archival Description 1.7C',4,'en'),('Publisher',5,'en'),('Editorial',5,'es'),('Editeur',5,'fr'),('Editorial',5,'gl'),('Penerbit',5,'id'),('Editore',5,'it'),('出版社',5,'ja'),('გამომცემელი',5,'ka'),('Uitgever',5,'nl'),('Wydawca',5,'pl'),('Editor',5,'pt'),('Editor',5,'pt_BR'),('Založnik',5,'sl'),('สำนักพิมพ์',5,'th'),('DC 1.1 element (Publisher); Rules for Archival Description 1.4, 1.8B8',6,'en'),('Contributor',7,'en'),('Contribuyente',7,'es'),('Contributeur',7,'fr'),('Contribuínte',7,'gl'),('Kontributor',7,'id'),('Contributo secondario',7,'it'),('貢献者',7,'ja'),('დამხმარე',7,'ka'),('Mederwerker',7,'nl'),('Współautor',7,'pl'),('Colaborador',7,'pt'),('Colaborador',7,'pt_BR'),('Prispeval',7,'sl'),('ผู้บริจาค',7,'th'),('DC 1.1 element (Contributor)',8,'en'),('Collector',9,'en'),('Collectionneur',9,'fr'),('Verzamelaar',9,'nl'),('Coletor',9,'pt'),('Rules for Archival Description 1.4A6, 1.8B8a',10,'en'),('Accumulator',11,'en'),('ISAD(G) 3.1.3; Rules for Archival Description 1.4A6, 1.8B8a',12,'en'),('Reproducer',13,'en'),('Rules for Archival Description 1.4A5',14,'en'),('Broadcaster',15,'en'),('Rules for Archival Description 8.4F',16,'en'),('Distributor',17,'en'),('Rules for Archival Description 1.4, 1.8B8',18,'en'),('Manufacturer',19,'en'),('Rules for Archival Description 1.4G',20,'en');
/*!40000 ALTER TABLE `note_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_harvest`
--

DROP TABLE IF EXISTS `oai_harvest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_harvest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oai_repository_id` int(11) NOT NULL,
  `start_timestamp` datetime DEFAULT NULL,
  `end_timestamp` datetime DEFAULT NULL,
  `last_harvest` datetime DEFAULT NULL,
  `last_harvest_attempt` datetime DEFAULT NULL,
  `metadataPrefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `set` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `oai_harvest_FI_1` (`oai_repository_id`),
  CONSTRAINT `oai_harvest_FK_1` FOREIGN KEY (`oai_repository_id`) REFERENCES `oai_repository` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_harvest`
--

LOCK TABLES `oai_harvest` WRITE;
/*!40000 ALTER TABLE `oai_harvest` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_harvest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oai_repository`
--

DROP TABLE IF EXISTS `oai_repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oai_repository` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `earliest_timestamp` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oai_repository`
--

LOCK TABLES `oai_repository` WRITE;
/*!40000 ALTER TABLE `oai_repository` DISABLE KEYS */;
/*!40000 ALTER TABLE `oai_repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object`
--

DROP TABLE IF EXISTS `object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object` (
  `class_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object`
--

LOCK TABLES `object` WRITE;
/*!40000 ALTER TABLE `object` DISABLE KEYS */;
INSERT INTO `object` VALUES ('QubitInformationObject','2014-04-22 11:35:21','2014-04-22 11:35:21',1,0),('QubitActor','2014-04-22 11:35:21','2014-04-22 11:35:21',3,0),('QubitRepository','2014-04-22 11:35:21','2014-04-22 11:35:21',6,0),('QubitStaticPage','2014-04-22 11:35:23','2014-04-22 11:35:23',7,0),('QubitStaticPage','2014-04-22 11:35:23','2014-04-22 11:35:23',8,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',30,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',31,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',32,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',33,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',34,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',35,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',36,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',37,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',38,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',40,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',41,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',42,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',43,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',44,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',45,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',46,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',47,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',48,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',49,0),('QubitTaxonomy','2014-04-22 11:35:24','2014-04-22 11:35:24',50,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',51,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',52,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',53,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',54,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',55,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',56,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',57,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',59,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',60,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',61,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',62,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',63,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',64,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',65,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',66,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',67,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',68,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',69,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',70,0),('QubitTaxonomy','2014-04-22 11:35:25','2014-04-22 11:35:25',71,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',110,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',111,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',113,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',114,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',115,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',117,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',118,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',119,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',120,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',121,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',122,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',123,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',124,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',125,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',126,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',127,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',128,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',129,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',130,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',131,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',132,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',133,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',135,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',136,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',137,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',138,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',139,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',140,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',141,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',142,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',143,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',144,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',145,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',146,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',147,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',148,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',149,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',150,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',151,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',152,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',153,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',154,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',155,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',156,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',157,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',158,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',159,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',160,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',161,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',162,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',163,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',164,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',165,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',166,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',167,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',168,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',169,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',170,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',171,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',172,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',173,0),('QubitTerm','2014-04-22 11:35:25','2014-04-22 11:35:25',174,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',175,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',176,0),('QubitTerm','2014-04-22 11:35:26','2014-04-22 11:35:26',177,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',178,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',179,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',180,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',181,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',182,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',183,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',184,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',185,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',186,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',187,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',188,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',189,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',190,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',191,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',192,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',193,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',194,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',195,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',196,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',197,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',198,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',199,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',200,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',201,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',202,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',203,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',204,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',205,0),('QubitTerm','2014-04-22 11:35:27','2014-04-22 11:35:27',206,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',207,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',208,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',209,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',210,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',211,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',212,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',213,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',214,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',215,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',216,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',217,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',218,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',219,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',220,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',221,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',222,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',223,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',224,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',225,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',226,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',227,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',228,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',229,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',230,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',231,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',232,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',233,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',234,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',235,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',236,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',237,0),('QubitTerm','2014-04-22 11:35:28','2014-04-22 11:35:28',238,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',239,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',240,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',241,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',242,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',243,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',244,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',245,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',246,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',247,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',248,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',249,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',250,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',251,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',252,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',253,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',254,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',255,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',256,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',257,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',258,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',259,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',260,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',261,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',262,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',263,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',264,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',265,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',266,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',267,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',268,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',269,0),('QubitTerm','2014-04-22 11:35:29','2014-04-22 11:35:29',270,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',271,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',272,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',273,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',274,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',275,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',276,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',277,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',278,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',279,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',280,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',281,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',282,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',283,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',284,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',285,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',286,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',287,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',288,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',289,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',290,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',291,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',292,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',293,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',294,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',295,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',296,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',297,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',298,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',299,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',300,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',301,0),('QubitTerm','2014-04-22 11:35:30','2014-04-22 11:35:30',302,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',303,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',304,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',305,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',306,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',307,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',308,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',309,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',310,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',311,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',312,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',313,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',314,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',315,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',316,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',317,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',318,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',319,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',320,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',321,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',322,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',323,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',324,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',325,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',326,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',327,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',328,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',329,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',330,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',331,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',332,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',333,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',334,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',335,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',336,0),('QubitTerm','2014-04-22 11:35:31','2014-04-22 11:35:31',337,0),('QubitTerm','2014-04-22 11:35:32','2014-04-22 11:35:32',338,0),('QubitTerm','2014-04-22 11:35:32','2014-04-22 11:35:32',339,0),('QubitTerm','2014-04-22 11:35:32','2014-04-22 11:35:32',340,0),('QubitTerm','2014-04-22 11:35:32','2014-04-22 11:35:32',341,0),('QubitTerm','2014-04-22 11:35:32','2014-04-22 11:35:32',342,0),('QubitTerm','2014-04-22 11:35:32','2014-04-22 11:35:32',343,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',344,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',345,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',346,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',347,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',348,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',349,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',350,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',351,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',352,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',353,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',354,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',355,0),('QubitRelation','2014-04-22 11:35:32','2014-04-22 11:35:32',356,0),('QubitUser','2014-04-22 11:35:42','2014-04-22 11:35:42',357,0),('QubitInformationObject','2014-04-22 11:36:36','2014-04-22 11:36:36',358,0),('QubitInformationObject','2014-04-22 11:36:36','2014-04-22 11:38:08',359,0),('QubitEvent','2014-04-22 11:36:36','2014-04-22 11:38:08',360,0),('QubitInformationObject','2014-04-22 11:36:36','2014-04-22 11:38:22',361,0),('QubitEvent','2014-04-22 11:36:36','2014-04-22 11:38:22',362,0),('QubitInformationObject','2014-04-22 11:37:06','2014-04-22 11:37:06',363,0),('QubitInformationObject','2014-04-22 11:37:06','2014-04-22 11:37:35',364,0),('QubitEvent','2014-04-22 11:37:06','2014-04-22 11:37:35',365,0),('QubitInformationObject','2014-04-22 11:37:06','2014-04-22 11:37:50',366,0),('QubitEvent','2014-04-22 11:37:06','2014-04-22 11:37:50',367,0),('QubitDigitalObject','2014-04-22 11:37:35','2014-04-22 11:37:35',368,0),('QubitDigitalObject','2014-04-22 11:37:35','2014-04-22 11:37:35',369,0),('QubitDigitalObject','2014-04-22 11:37:35','2014-04-22 11:37:35',370,0),('QubitDigitalObject','2014-04-22 11:37:50','2014-04-22 11:37:50',371,0),('QubitDigitalObject','2014-04-22 11:37:50','2014-04-22 11:37:50',372,0),('QubitDigitalObject','2014-04-22 11:37:50','2014-04-22 11:37:50',373,0),('QubitDigitalObject','2014-04-22 11:38:08','2014-04-22 14:38:47',374,0),('QubitDigitalObject','2014-04-22 11:38:09','2014-04-22 14:38:47',375,0),('QubitDigitalObject','2014-04-22 11:38:09','2014-04-22 14:38:47',376,0),('QubitDigitalObject','2014-04-22 11:38:22','2014-04-22 11:38:22',377,0),('QubitDigitalObject','2014-04-22 11:38:22','2014-04-22 11:38:22',378,0),('QubitDigitalObject','2014-04-22 11:38:22','2014-04-22 11:38:22',379,0),('QubitRightsHolder','2014-04-22 14:38:31','2014-04-22 14:38:31',380,0),('QubitRights','2014-04-22 14:38:47','2014-04-22 14:38:47',381,0),('QubitRelation','2014-04-22 14:38:47','2014-04-22 14:38:47',382,0);
/*!40000 ALTER TABLE `object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `object_term_relation`
--

DROP TABLE IF EXISTS `object_term_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `object_term_relation` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object_term_relation_FI_2` (`object_id`),
  KEY `object_term_relation_FI_3` (`term_id`),
  CONSTRAINT `object_term_relation_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `object_term_relation_FK_2` FOREIGN KEY (`object_id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `object_term_relation_FK_3` FOREIGN KEY (`term_id`) REFERENCES `term` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `object_term_relation`
--

LOCK TABLES `object_term_relation` WRITE;
/*!40000 ALTER TABLE `object_term_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `object_term_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_name`
--

DROP TABLE IF EXISTS `other_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_name` (
  `object_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `other_name_FI_1` (`object_id`),
  KEY `other_name_FI_2` (`type_id`),
  CONSTRAINT `other_name_FK_1` FOREIGN KEY (`object_id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `other_name_FK_2` FOREIGN KEY (`type_id`) REFERENCES `term` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_name`
--

LOCK TABLES `other_name` WRITE;
/*!40000 ALTER TABLE `other_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `other_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `other_name_i18n`
--

DROP TABLE IF EXISTS `other_name_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `other_name_i18n` (
  `name` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dates` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `other_name_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `other_name` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `other_name_i18n`
--

LOCK TABLES `other_name_i18n` WRITE;
/*!40000 ALTER TABLE `other_name_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `other_name_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physical_object`
--

DROP TABLE IF EXISTS `physical_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physical_object` (
  `id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `physical_object_FI_2` (`type_id`),
  KEY `physical_object_FI_3` (`parent_id`),
  CONSTRAINT `physical_object_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `physical_object_FK_2` FOREIGN KEY (`type_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `physical_object_FK_3` FOREIGN KEY (`parent_id`) REFERENCES `physical_object` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physical_object`
--

LOCK TABLES `physical_object` WRITE;
/*!40000 ALTER TABLE `physical_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `physical_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `physical_object_i18n`
--

DROP TABLE IF EXISTS `physical_object_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `physical_object_i18n` (
  `name` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `location` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `physical_object_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `physical_object` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `physical_object_i18n`
--

LOCK TABLES `physical_object_i18n` WRITE;
/*!40000 ALTER TABLE `physical_object_i18n` DISABLE KEYS */;
/*!40000 ALTER TABLE `physical_object_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property`
--

DROP TABLE IF EXISTS `property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property` (
  `object_id` int(11) NOT NULL,
  `scope` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `property_FI_1` (`object_id`),
  CONSTRAINT `property_FK_1` FOREIGN KEY (`object_id`) REFERENCES `object` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property`
--

LOCK TABLES `property` WRITE;
/*!40000 ALTER TABLE `property` DISABLE KEYS */;
INSERT INTO `property` VALUES (358,NULL,'language','en',1,0),(358,NULL,'languageOfDescription','en',2,0),(358,NULL,'scriptOfDescription','en',3,0),(358,NULL,'script','en',4,0),(363,NULL,'language','en',5,0),(363,NULL,'languageOfDescription','en',6,0),(363,NULL,'scriptOfDescription','en',7,0),(363,NULL,'script','en',8,0),(374,NULL,'displayAsCompound','en',9,0);
/*!40000 ALTER TABLE `property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `property_i18n`
--

DROP TABLE IF EXISTS `property_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `property_i18n` (
  `value` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `property_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `property` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `property_i18n`
--

LOCK TABLES `property_i18n` WRITE;
/*!40000 ALTER TABLE `property_i18n` DISABLE KEYS */;
INSERT INTO `property_i18n` VALUES ('N;',1,'en'),('N;',2,'en'),('N;',3,'en'),('N;',4,'en'),('N;',5,'en'),('N;',6,'en'),('N;',7,'en'),('N;',8,'en'),(NULL,9,'en');
/*!40000 ALTER TABLE `property_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation`
--

DROP TABLE IF EXISTS `relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `relation_FI_2` (`subject_id`),
  KEY `relation_FI_3` (`object_id`),
  KEY `relation_FI_4` (`type_id`),
  CONSTRAINT `relation_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `relation_FK_2` FOREIGN KEY (`subject_id`) REFERENCES `object` (`id`),
  CONSTRAINT `relation_FK_3` FOREIGN KEY (`object_id`) REFERENCES `object` (`id`),
  CONSTRAINT `relation_FK_4` FOREIGN KEY (`type_id`) REFERENCES `term` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation`
--

LOCK TABLES `relation` WRITE;
/*!40000 ALTER TABLE `relation` DISABLE KEYS */;
INSERT INTO `relation` VALUES (344,184,183,177,NULL,NULL,'en'),(345,186,185,177,NULL,NULL,'en'),(346,188,187,177,NULL,NULL,'en'),(347,190,189,177,NULL,NULL,'en'),(348,197,196,177,NULL,NULL,'en'),(349,198,198,177,NULL,NULL,'en'),(350,199,199,177,NULL,NULL,'en'),(351,200,200,177,NULL,NULL,'en'),(352,202,201,177,NULL,NULL,'en'),(353,192,191,177,NULL,NULL,'en'),(354,193,193,177,NULL,NULL,'en'),(355,194,194,177,NULL,NULL,'en'),(356,195,195,177,NULL,NULL,'en'),(382,374,381,168,NULL,NULL,'en');
/*!40000 ALTER TABLE `relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relation_i18n`
--

DROP TABLE IF EXISTS `relation_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relation_i18n` (
  `description` text COLLATE utf8_unicode_ci,
  `date` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `relation_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `relation` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relation_i18n`
--

LOCK TABLES `relation_i18n` WRITE;
/*!40000 ALTER TABLE `relation_i18n` DISABLE KEYS */;
INSERT INTO `relation_i18n` VALUES (NULL,NULL,344,'en'),(NULL,NULL,345,'en'),(NULL,NULL,346,'en'),(NULL,NULL,347,'en'),(NULL,NULL,348,'en'),(NULL,NULL,349,'en'),(NULL,NULL,350,'en'),(NULL,NULL,351,'en'),(NULL,NULL,352,'en'),(NULL,NULL,353,'en'),(NULL,NULL,354,'en'),(NULL,NULL,355,'en'),(NULL,NULL,356,'en'),(NULL,NULL,382,'en');
/*!40000 ALTER TABLE `relation_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository`
--

DROP TABLE IF EXISTS `repository`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository` (
  `id` int(11) NOT NULL,
  `identifier` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc_status_id` int(11) DEFAULT NULL,
  `desc_detail_id` int(11) DEFAULT NULL,
  `desc_identifier` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `upload_limit` float DEFAULT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repository_FI_2` (`desc_status_id`),
  KEY `repository_FI_3` (`desc_detail_id`),
  CONSTRAINT `repository_FK_1` FOREIGN KEY (`id`) REFERENCES `actor` (`id`) ON DELETE CASCADE,
  CONSTRAINT `repository_FK_2` FOREIGN KEY (`desc_status_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `repository_FK_3` FOREIGN KEY (`desc_detail_id`) REFERENCES `term` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository`
--

LOCK TABLES `repository` WRITE;
/*!40000 ALTER TABLE `repository` DISABLE KEYS */;
INSERT INTO `repository` VALUES (6,NULL,NULL,NULL,NULL,NULL,'en');
/*!40000 ALTER TABLE `repository` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_i18n`
--

DROP TABLE IF EXISTS `repository_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_i18n` (
  `geocultural_context` text COLLATE utf8_unicode_ci,
  `collecting_policies` text COLLATE utf8_unicode_ci,
  `buildings` text COLLATE utf8_unicode_ci,
  `holdings` text COLLATE utf8_unicode_ci,
  `finding_aids` text COLLATE utf8_unicode_ci,
  `opening_times` text COLLATE utf8_unicode_ci,
  `access_conditions` text COLLATE utf8_unicode_ci,
  `disabled_access` text COLLATE utf8_unicode_ci,
  `research_services` text COLLATE utf8_unicode_ci,
  `reproduction_services` text COLLATE utf8_unicode_ci,
  `public_facilities` text COLLATE utf8_unicode_ci,
  `desc_institution_identifier` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc_rules` text COLLATE utf8_unicode_ci,
  `desc_sources` text COLLATE utf8_unicode_ci,
  `desc_revision_history` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `repository_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `repository` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_i18n`
--

LOCK TABLES `repository_i18n` WRITE;
/*!40000 ALTER TABLE `repository_i18n` DISABLE KEYS */;
INSERT INTO `repository_i18n` VALUES (NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,'en');
/*!40000 ALTER TABLE `repository_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `restriction` tinyint(4) DEFAULT '1',
  `basis_id` int(11) DEFAULT NULL,
  `act_id` int(11) DEFAULT NULL,
  `rights_holder_id` int(11) DEFAULT NULL,
  `copyright_status_id` int(11) DEFAULT NULL,
  `copyright_status_date` date DEFAULT NULL,
  `copyright_jurisdiction` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `statute_determination_date` date DEFAULT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rights_FI_2` (`basis_id`),
  KEY `rights_FI_3` (`act_id`),
  KEY `rights_FI_4` (`rights_holder_id`),
  KEY `rights_FI_5` (`copyright_status_id`),
  CONSTRAINT `rights_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `rights_FK_2` FOREIGN KEY (`basis_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `rights_FK_3` FOREIGN KEY (`act_id`) REFERENCES `term` (`id`) ON DELETE SET NULL,
  CONSTRAINT `rights_FK_4` FOREIGN KEY (`rights_holder_id`) REFERENCES `actor` (`id`) ON DELETE SET NULL,
  CONSTRAINT `rights_FK_5` FOREIGN KEY (`copyright_status_id`) REFERENCES `term` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
INSERT INTO `rights` VALUES (381,'2014-04-22',NULL,1,173,329,NULL,336,NULL,NULL,NULL,'en');
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights_holder`
--

DROP TABLE IF EXISTS `rights_holder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights_holder` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `rights_holder_FK_1` FOREIGN KEY (`id`) REFERENCES `actor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights_holder`
--

LOCK TABLES `rights_holder` WRITE;
/*!40000 ALTER TABLE `rights_holder` DISABLE KEYS */;
INSERT INTO `rights_holder` VALUES (380);
/*!40000 ALTER TABLE `rights_holder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights_i18n`
--

DROP TABLE IF EXISTS `rights_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights_i18n` (
  `rights_note` text COLLATE utf8_unicode_ci,
  `copyright_note` text COLLATE utf8_unicode_ci,
  `license_identifier` text COLLATE utf8_unicode_ci,
  `license_terms` text COLLATE utf8_unicode_ci,
  `license_note` text COLLATE utf8_unicode_ci,
  `statute_jurisdiction` text COLLATE utf8_unicode_ci,
  `statute_citation` text COLLATE utf8_unicode_ci,
  `statute_note` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `rights_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `rights` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights_i18n`
--

LOCK TABLES `rights_i18n` WRITE;
/*!40000 ALTER TABLE `rights_i18n` DISABLE KEYS */;
INSERT INTO `rights_i18n` VALUES (NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,381,'en');
/*!40000 ALTER TABLE `rights_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting`
--

DROP TABLE IF EXISTS `setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting` (
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editable` tinyint(4) DEFAULT '0',
  `deleteable` tinyint(4) DEFAULT '0',
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting`
--

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;
INSERT INTO `setting` VALUES ('plugins',NULL,0,0,'en',1,0),('version',NULL,0,0,'en',2,0),('milestone',NULL,0,0,'en',3,0),('upload_dir',NULL,0,0,'en',4,0),('reference_image_maxwidth',NULL,1,0,'en',5,0),('hits_per_page',NULL,1,0,'en',6,0),('multi_repository',NULL,1,0,'en',7,0),('sort_treeview_informationobject',NULL,1,0,'en',8,0),('sort_browser_user',NULL,1,0,'en',9,0),('sort_browser_anonymous',NULL,1,0,'en',10,0),('defaultPubStatus',NULL,1,0,'en',11,0),('informationobject','default_template',1,0,'en',12,0),('actor','default_template',1,0,'en',13,0),('repository','default_template',1,0,'en',14,0),('informationobject','ui_label',1,0,'en',15,0),('actor','ui_label',1,0,'en',16,0),('creator','ui_label',1,0,'en',17,0),('repository','ui_label',1,0,'en',18,0),('function','ui_label',1,0,'en',19,0),('term','ui_label',1,0,'en',20,0),('subject','ui_label',1,0,'en',21,0),('collection','ui_label',1,0,'en',22,0),('holdings','ui_label',1,0,'en',23,0),('place','ui_label',1,0,'en',24,0),('name','ui_label',1,0,'en',25,0),('digitalobject','ui_label',1,0,'en',26,0),('physicalobject','ui_label',1,0,'en',27,0),('mediatype','ui_label',1,0,'en',28,0),('materialtype','ui_label',1,0,'en',29,0),('facetstitle','ui_label',1,0,'en',30,0),('en','i18n_languages',1,0,'en',31,0),('fr','i18n_languages',1,1,'en',32,0),('es','i18n_languages',1,1,'en',33,0),('nl','i18n_languages',1,1,'en',34,0),('pt','i18n_languages',1,1,'en',35,0),('oai_enabled','oai',1,0,'en',36,0),('oai_repository_code','oai',1,0,'en',37,0),('resumption_token_limit','oai',1,0,'en',38,0),('inherit_code_informationobject',NULL,1,0,'en',39,0),('toggleDescription',NULL,0,0,'en',40,0),('toggleLogo',NULL,0,0,'en',41,0),('toggleTitle',NULL,0,0,'en',42,0),('check_for_updates',NULL,0,0,'en',43,0),('explode_multipage_files',NULL,0,0,'en',44,0),('show_tooltips',NULL,0,0,'en',45,0),('accession_mask',NULL,0,0,'en',46,0),('accession_counter',NULL,0,0,'en',47,0),('separator_character',NULL,0,0,'en',48,0),('repository_quota',NULL,1,0,'en',49,0),('use_job_scheduler',NULL,0,0,'en',50,0),('sword_deposit_dir',NULL,0,0,'en',51,0),('require_ssl_admin',NULL,0,0,'en',52,0),('require_strong_passwords',NULL,0,0,'en',53,0),('limit_admin_ip',NULL,0,0,'en',54,0),('isad_immediate_source','element_visibility',0,0,'en',55,0),('isad_appraisal_destruction','element_visibility',0,0,'en',56,0),('isad_notes','element_visibility',0,0,'en',57,0),('isad_physical_condition','element_visibility',0,0,'en',58,0),('isad_control_description_identifier','element_visibility',0,0,'en',59,0),('isad_control_institution_identifier','element_visibility',0,0,'en',60,0),('isad_control_rules_conventions','element_visibility',0,0,'en',61,0),('isad_control_status','element_visibility',0,0,'en',62,0),('isad_control_level_of_detail','element_visibility',0,0,'en',63,0),('isad_control_dates','element_visibility',0,0,'en',64,0),('isad_control_languages','element_visibility',0,0,'en',65,0),('isad_control_scripts','element_visibility',0,0,'en',66,0),('isad_control_sources','element_visibility',0,0,'en',67,0),('isad_control_archivists_notes','element_visibility',0,0,'en',68,0),('isad_archival_history','element_visibility',0,0,'en',69,0),('rad_general_notes','element_visibility',0,0,'en',70,0),('rad_conservation_notes','element_visibility',0,0,'en',71,0),('rad_physical_condition','element_visibility',0,0,'en',72,0),('rad_immediate_source','element_visibility',0,0,'en',73,0),('rad_control_description_identifier','element_visibility',0,0,'en',74,0),('rad_control_institution_identifier','element_visibility',0,0,'en',75,0),('rad_control_rules_conventions','element_visibility',0,0,'en',76,0),('rad_control_status','element_visibility',0,0,'en',77,0),('rad_control_level_of_detail','element_visibility',0,0,'en',78,0),('rad_control_dates','element_visibility',0,0,'en',79,0),('rad_control_language','element_visibility',0,0,'en',80,0),('rad_control_script','element_visibility',0,0,'en',81,0),('rad_control_sources','element_visibility',0,0,'en',82,0),('rad_archival_history','element_visibility',0,0,'en',83,0),('digital_object_url','element_visibility',0,0,'en',84,0),('digital_object_file_name','element_visibility',0,0,'en',85,0),('digital_object_media_type','element_visibility',0,0,'en',86,0),('digital_object_mime_type','element_visibility',0,0,'en',87,0),('digital_object_file_size','element_visibility',0,0,'en',88,0),('digital_object_uploaded','element_visibility',0,0,'en',89,0),('physical_storage','element_visibility',0,0,'en',90,0),('rad_title_responsibility_area','element_visibility',0,0,'en',91,0),('rad_edition_area','element_visibility',0,0,'en',92,0),('rad_material_specific_details_area','element_visibility',0,0,'en',93,0),('rad_dates_of_creation_area','element_visibility',0,0,'en',94,0),('rad_physical_description_area','element_visibility',0,0,'en',95,0),('rad_publishers_series_area','element_visibility',0,0,'en',96,0),('rad_archival_description_area','element_visibility',0,0,'en',97,0),('rad_notes_area','element_visibility',0,0,'en',98,0),('rad_standard_number_area','element_visibility',0,0,'en',99,0),('rad_access_points_area','element_visibility',0,0,'en',100,0),('rad_description_control_area','element_visibility',0,0,'en',101,0),('isad_identity_area','element_visibility',0,0,'en',102,0),('isad_context_area','element_visibility',0,0,'en',103,0),('isad_content_and_structure_area','element_visibility',0,0,'en',104,0),('isad_conditions_of_access_use_area','element_visibility',0,0,'en',105,0),('isad_allied_materials_area','element_visibility',0,0,'en',106,0),('isad_notes_area','element_visibility',0,0,'en',107,0),('isad_access_points_area','element_visibility',0,0,'en',108,0),('isad_description_control_area','element_visibility',0,0,'en',109,0),('siteTitle',NULL,0,0,'en',110,0),('siteDescription',NULL,0,0,'en',111,0);
/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_i18n`
--

DROP TABLE IF EXISTS `setting_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_i18n` (
  `value` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `setting_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `setting` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_i18n`
--

LOCK TABLES `setting_i18n` WRITE;
/*!40000 ALTER TABLE `setting_i18n` DISABLE KEYS */;
INSERT INTO `setting_i18n` VALUES ('a:12:{i:0;s:10:\"sfDcPlugin\";i:1;s:16:\"arDominionPlugin\";i:2;s:11:\"sfEacPlugin\";i:3;s:11:\"sfEadPlugin\";i:4;s:13:\"sfIsaarPlugin\";i:5;s:12:\"sfIsadPlugin\";i:6;s:12:\"arDacsPlugin\";i:7;s:12:\"sfIsdfPlugin\";i:8;s:14:\"sfIsdiahPlugin\";i:9;s:12:\"sfModsPlugin\";i:10;s:11:\"sfRadPlugin\";i:11;s:12:\"sfSkosPlugin\";}',1,'en'),('108',2,'en'),('2',3,'en'),('uploads',4,'en'),('480',5,'en'),('10',6,'en'),('1',7,'en'),('none',8,'en'),('lastUpdated',9,'en'),('alphabetic',10,'en'),('159',11,'en'),('isad',12,'en'),('isaar',13,'en'),('isdiah',14,'en'),('Archivische Beschreibung',15,'de'),('Archival description',15,'en'),('Descripción archivística',15,'es'),('Description archivistique',15,'fr'),('Descrición arquivística',15,'gl'),('Deskripsi Arsip',15,'id'),('Descrizione archivistica',15,'it'),('アーカイブズ記述',15,'ja'),('საარქივო აღწერა',15,'ka'),('Archivistische beschrijving',15,'nl'),('Opis archiwalny',15,'pl'),('Descrição arquivística',15,'pt'),('Arhivski popis',15,'sl'),('คำอธิบายจดหมายเหตุ',15,'th'),('Authority record',16,'en'),('Registro de autoridad',16,'es'),('Notice d\'autorité',16,'fr'),('Rexistro de autoridade',16,'gl'),('Pencipta Arsip',16,'id'),('Record d\'autorità',16,'it'),('典拠レコード',16,'ja'),('ავტორიტეტული ჩანაწერი',16,'ka'),('Geauthoriseerde beschrijving',16,'nl'),('Hasło wzorcowe',16,'pl'),('Registro de autoridade',16,'pt'),('Zapis o ustvarjalcu',16,'sl'),('รายการควบคุม',16,'th'),('Urheber/Bestandsbildner',17,'de'),('Creator',17,'en'),('Creador',17,'es'),('Producteur',17,'fr'),('Creador',17,'gl'),('Pencipta',17,'id'),('Soggetto produttore',17,'it'),('作成者',17,'ja'),('შემოქმედი',17,'ka'),('Archiefvormer',17,'nl'),('Twórca',17,'pl'),('Produtor',17,'pt'),('Produtor',17,'pt_BR'),('Ustvaril',17,'sl'),('ผู้ผลิตเอกสาร',17,'th'),('Archiv',18,'de'),('Archival institution',18,'en'),('Institución archivística',18,'es'),('منبع',18,'fa'),('Institution de conservation',18,'fr'),('Institución arquivística',18,'gl'),('Institusi Arsip',18,'id'),('Istituzione archivistica',18,'it'),('アーカイブズ機関',18,'ja'),('საარქივო ინსტიტუცია',18,'ka'),('기록보존소',18,'ko'),('Archiefinstelling',18,'nl'),('Instytucja archiwalna',18,'pl'),('Instituição de arquivo',18,'pt'),('Entidade custodiadora',18,'pt_BR'),('Arhivska ustanova',18,'sl'),('สถาบันจดหมายเหตุ',18,'th'),('Funktion',19,'de'),('Function',19,'en'),('Función',19,'es'),('Fonctions',19,'fr'),('Función',19,'gl'),('Fungsi',19,'id'),('Funzione',19,'it'),('機能',19,'ja'),('ფუნქცია',19,'ka'),('Functie',19,'nl'),('Funkcja',19,'pl'),('Função',19,'pt'),('Funkcija',19,'sl'),('ฟังก์ชั่น',19,'th'),('Begriff',20,'de'),('Term',20,'en'),('Término',20,'es'),('Terme',20,'fr'),('Termo',20,'gl'),('Istilah',20,'id'),('Termine',20,'it'),('用語',20,'ja'),('ვადა',20,'ka'),('Term',20,'nl'),('Termin',20,'pl'),('Termo',20,'pt'),('Izraz',20,'sl'),('คำศัพท์',20,'th'),('Gegenstand',21,'de'),('Subject',21,'en'),('Materia',21,'es'),('Sujet',21,'fr'),('Tema',21,'gl'),('Subjek',21,'id'),('Soggetto',21,'it'),('主題',21,'ja'),('სუბიექტი (თემა, საგანი, სათაური)',21,'ka'),('주제',21,'ko'),('Onderwerp',21,'nl'),('Temat',21,'pl'),('Assunto',21,'pt'),('Assunto',21,'pt_BR'),('Tematika',21,'sl'),('หัวข้อ',21,'th'),('Sammlung',22,'de'),('Fonds',22,'en'),('Fondo',22,'es'),('collection',22,'fr'),('Fondos',22,'gl'),('Fondo',22,'it'),('フォンド',22,'ja'),('ფონდები',22,'ka'),('Archief',22,'nl'),('Zespoły',22,'pl'),('Fundos',22,'pt'),('Fondi',22,'sl'),('เอกสารระดับกลุ่ม',22,'th'),('Bestände (?)',23,'de'),('Holdings',23,'en'),('Fondos',23,'es'),('دربرگيرندگي',23,'fa'),('Fonds',23,'fr'),('Fondos',23,'gl'),('Patrimoni',23,'it'),('所蔵',23,'ja'),('ანაბრები',23,'ka'),('Bestanden',23,'nl'),('Zasoby posiadane',23,'pl'),('Acervo',23,'pt'),('Acervo',23,'pt_BR'),('Arhivsko gradivo',23,'sl'),('สถานที่เก็บเอกสาร',23,'th'),('Ort',24,'de'),('Place',24,'en'),('Lugar',24,'es'),('مكان',24,'fa'),('Lieu',24,'fr'),('Lugar',24,'gl'),('Tempat',24,'id'),('Luogo',24,'it'),('場所',24,'ja'),('ადგილი',24,'ka'),('장소',24,'ko'),('Plaats',24,'nl'),('Miejsce',24,'pl'),('Local',24,'pt'),('local',24,'pt_BR'),('Kraj',24,'sl'),('จัด',24,'th'),('Name',25,'de'),('Name',25,'en'),('Nombre',25,'es'),('نام',25,'fa'),('Nom',25,'fr'),('Nome',25,'gl'),('Nama',25,'id'),('Nome',25,'it'),('名称',25,'ja'),('სახელი',25,'ka'),('이름',25,'ko'),('Naam',25,'nl'),('Nazwa',25,'pl'),('Nome',25,'pt'),('nome',25,'pt_BR'),('Ime',25,'sl'),('ชื่อ',25,'th'),('Digitales Objekt',26,'de'),('Digital object',26,'en'),('Objeto digital',26,'es'),('Objet numérique',26,'fr'),('Obxecto dixital',26,'gl'),('Objek Digital',26,'id'),('Oggetto digitale',26,'it'),('ディジタルオブジェクト',26,'ja'),('ციფრული ობიექტი',26,'ka'),('Digitaal object',26,'nl'),('Obiekt cyfrowy',26,'pl'),('Objeto digital',26,'pt'),('Digitalni objekt',26,'sl'),('วัตถุดิจิตอล',26,'th'),('Physisches Objekt',27,'de'),('Physical storage',27,'en'),('Unidad de almacenaje',27,'es'),('Localisation physique',27,'fr'),('Almacenamento físico',27,'gl'),('Penyimpanan Fisik',27,'id'),('Deposito',27,'it'),('物理的記憶',27,'ja'),('ფიზიკური საცავი',27,'ka'),('Fysieke opslag',27,'nl'),('Fizyczne miejsce przechowywania',27,'pl'),('Depósito físico',27,'pt'),('Depósito físico',27,'pt_BR'),('Fizična hramba',27,'sl'),('การเก็บเอกสารทางกายภาพ',27,'th'),('Medienart',28,'de'),('Media type',28,'en'),('Tipo de soporte',28,'es'),('نوع رسانه',28,'fa'),('Type de support',28,'fr'),('Tipo de medio',28,'gl'),('Tipo di supporto',28,'it'),('メディア種別',28,'ja'),('მედია ტიპი',28,'ka'),('mediatype',28,'nl'),('Typ medium',28,'pl'),('Tipo de suporte',28,'pt'),('Tipo',28,'pt_BR'),('Vrsta medija',28,'sl'),('ประเภทสื่อ',28,'th'),('Materialart',29,'de'),('Material type',29,'en'),('Tipo de material',29,'es'),('Type de document',29,'fr'),('Tipo de material',29,'gl'),('Tipo di materiale',29,'it'),('資料種別',29,'ja'),('მასალის ტიპი',29,'ka'),('Soort materiaal',29,'nl'),('Typ materiału',29,'pl'),('Tipo de material',29,'pt'),('Vrsta gradiva',29,'sl'),('ประเภทเอกสาร',29,'th'),('Narrow your results by:',30,'en'),('Restringir resultados por:',30,'es'),('Affiner les résultats par :',30,'fr'),('Refinar os resultados por:',30,'gl'),('Restringi i risultati per:',30,'it'),('Omejite rezultate:',30,'sl'),('en',31,'en'),('fr',32,'en'),('es',33,'en'),('nl',34,'en'),('pt',35,'en'),('0',36,'en'),('',37,'en'),('100',38,'en'),('1',39,'en'),('1',40,'en'),('1',41,'en'),('0',42,'en'),('1',43,'en'),('0',44,'en'),('1',45,'en'),('%Y-%m-%d/#i',46,'en'),('0',47,'en'),('-',48,'en'),('-1',49,'en'),('0',50,'en'),('/tmp',51,'en'),('0',52,'en'),('0',53,'en'),('',54,'en'),('1',55,'en'),('1',56,'en'),('1',57,'en'),('1',58,'en'),('1',59,'en'),('1',60,'en'),('1',61,'en'),('1',62,'en'),('1',63,'en'),('1',64,'en'),('1',65,'en'),('1',66,'en'),('1',67,'en'),('1',68,'en'),('1',69,'en'),('1',70,'en'),('1',71,'en'),('1',72,'en'),('1',73,'en'),('1',74,'en'),('1',75,'en'),('1',76,'en'),('1',77,'en'),('1',78,'en'),('1',79,'en'),('1',80,'en'),('1',81,'en'),('1',82,'en'),('1',83,'en'),('1',84,'en'),('1',85,'en'),('1',86,'en'),('1',87,'en'),('1',88,'en'),('1',89,'en'),('1',90,'en'),('1',91,'en'),('1',92,'en'),('1',93,'en'),('1',94,'en'),('1',95,'en'),('1',96,'en'),('1',97,'en'),('1',98,'en'),('1',99,'en'),('1',100,'en'),('1',101,'en'),('1',102,'en'),('1',103,'en'),('1',104,'en'),('1',105,'en'),('1',106,'en'),('1',107,'en'),('1',108,'en'),('1',109,'en'),('Qubit',110,'en'),('Test site',111,'en');
/*!40000 ALTER TABLE `setting_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slug`
--

DROP TABLE IF EXISTS `slug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slug` (
  `object_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_U_1` (`object_id`),
  UNIQUE KEY `slug_U_2` (`slug`),
  CONSTRAINT `slug_FK_1` FOREIGN KEY (`object_id`) REFERENCES `object` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slug`
--

LOCK TABLES `slug` WRITE;
/*!40000 ALTER TABLE `slug` DISABLE KEYS */;
INSERT INTO `slug` VALUES (1,'2eamv',1,0),(3,'uste0',2,0),(6,'tqzgv',3,0),(7,'home',4,0),(8,'about',5,0),(30,'9x0fq',6,0),(31,'description-detail-levels',7,0),(32,'actor-entity-types',8,0),(33,'description-statuses',9,0),(34,'levels-of-description',10,0),(35,'subjects',11,0),(36,'actor-name-types',12,0),(37,'note-types',13,0),(38,'repository-types',14,0),(40,'event-types',15,0),(41,'qubit-setting-labels',16,0),(42,'places',17,0),(43,'isdf-function-types',18,0),(44,'historical-events',19,0),(45,'collection-types',20,0),(46,'media-types',21,0),(47,'digital-object-usages',22,0),(48,'physical-object-type',23,0),(49,'relation-type',24,0),(50,'material-type',25,0),(51,'rad-note',26,0),(52,'rad-title-note',27,0),(53,'mods-resource-type',28,0),(54,'dublin-core-types',29,0),(55,'actor-relation-type',30,0),(56,'relation-note-types',31,0),(57,'term-relation-types',32,0),(59,'status-types',33,0),(60,'publication-status',34,0),(61,'function-relation-type',35,0),(62,'accession-resource-type',36,0),(63,'accession-acquisition-type',37,0),(64,'accession-processing-priority',38,0),(65,'accession-processing-status',39,0),(66,'deaccession-scope',40,0),(68,'rights-basis',41,0),(67,'rights-act',42,0),(69,'copyright-status',43,0),(70,'information-object-templates',44,0),(71,'aip-types',45,0),(110,'jyj47',46,0),(111,'creation',47,0),(113,'custody',48,0),(114,'publication',49,0),(115,'contribution',50,0),(117,'collection',51,0),(118,'accumulation',52,0),(119,'title-note',53,0),(174,'language-note',54,0),(120,'publication-note',55,0),(121,'source-note',56,0),(122,'scope-note',57,0),(123,'display-note',58,0),(128,'archival-material',59,0),(129,'published-material',60,0),(130,'artefact-material',61,0),(131,'corporate-body',62,0),(132,'person',63,0),(133,'family',64,0),(135,'audio',65,0),(136,'image',66,0),(137,'text',67,0),(138,'video',68,0),(139,'other',69,0),(166,'external-uri',70,0),(140,'master',71,0),(141,'reference',72,0),(142,'thumbnail',73,0),(143,'compound',74,0),(144,'location',75,0),(145,'container',76,0),(146,'artefact',77,0),(147,'has-physical-object',78,0),(124,'archivists-note',79,0),(126,'other-descriptive-data',80,0),(125,'general-note',81,0),(148,'parallel-form',82,0),(149,'other-form',83,0),(150,'hierarchical',84,0),(151,'temporal',85,0),(152,'family-2',87,0),(153,'associative',88,0),(154,'description',89,0),(155,'date-display',90,0),(156,'alternative-label',91,0),(157,'associative-2',93,0),(177,'converse-term',94,0),(158,'publication-2',96,0),(159,'draft',97,0),(160,'published',98,0),(127,'maintenance-note',99,0),(161,'name-access-points',100,0),(175,'accrual',101,0),(167,'accession',102,0),(168,'right',103,0),(169,'donor',104,0),(176,'related-material-descriptions',105,0),(162,'hierarchical-2',107,0),(163,'temporal-2',109,0),(164,'associative-3',111,0),(165,'standardized-form',112,0),(170,'copyright',113,0),(171,'license',114,0),(172,'statute',115,0),(173,'policy',116,0),(178,'aip-relation',117,0),(179,'artwork-component',118,0),(180,'artwork-material',119,0),(181,'supporting-documentation',120,0),(182,'supporting-technology',121,0),(183,'is-superior-of',122,0),(184,'is-subordinate-of',123,0),(185,'controls',124,0),(186,'is-controlled-by',125,0),(187,'is-owner-of',126,0),(188,'is-owned-by',127,0),(189,'is-predecessor-of',128,0),(190,'is-successor-of',129,0),(191,'is-provider-of',130,0),(192,'is-client-of',131,0),(193,'is-business-partner-of',132,0),(194,'is-associate-of',133,0),(195,'is-friend-of',134,0),(196,'is-parent-of',135,0),(197,'is-child-of',136,0),(198,'is-sibling-of',137,0),(199,'is-spouse-of',138,0),(200,'is-cousin-of',139,0),(201,'is-grandparent-of',140,0),(202,'is-grandchild-of',141,0),(203,'donor-2',143,0),(204,'reproduction',144,0),(205,'distribution',145,0),(206,'broadcasting',146,0),(207,'manufacturing',147,0),(208,'box',148,0),(209,'cardboard-box',149,0),(210,'hollinger-box',150,0),(211,'folder',151,0),(212,'filing-cabinet',152,0),(213,'map-cabinet',153,0),(214,'shelf',154,0),(215,'final',155,0),(216,'revised',156,0),(217,'draft-2',158,0),(218,'full',159,0),(219,'partial',160,0),(220,'minimal',161,0),(221,'fonds',162,0),(222,'subfonds',163,0),(223,'collection-2',165,0),(224,'series',166,0),(225,'subseries',167,0),(226,'file',168,0),(227,'item',169,0),(228,'information-object',170,0),(229,'person-organization',171,0),(230,'creator',172,0),(231,'repository',173,0),(232,'term',174,0),(233,'subject',175,0),(234,'collection-3',177,0),(235,'holdings',178,0),(236,'archival-description',179,0),(237,'authority-record',180,0),(238,'fonds-2',182,0),(239,'archival-institution',183,0),(240,'international',184,0),(241,'national',185,0),(242,'regional',186,0),(243,'provincial-state',187,0),(244,'community',188,0),(245,'religious',189,0),(246,'university',190,0),(247,'municipal',191,0),(248,'aboriginal',192,0),(249,'educational',193,0),(250,'medical',194,0),(251,'military',195,0),(252,'private',196,0),(253,'place',197,0),(254,'name',198,0),(255,'digital-object',199,0),(256,'physical-object',200,0),(257,'physical-storage',201,0),(258,'media-type',202,0),(259,'open-information-management-toolkit',203,0),(260,'conservation-note',204,0),(261,'architectural-drawing',205,0),(262,'cartographic-material',206,0),(263,'graphic-material',207,0),(264,'moving-images',208,0),(265,'multiple-media',209,0),(266,'object',210,0),(267,'philatelic-record',211,0),(268,'sound-recording',212,0),(269,'technical-drawing',213,0),(270,'textual-record',214,0),(271,'edition',215,0),(272,'physical-description',216,0),(273,'conservation',217,0),(274,'accompanying-material',218,0),(275,'publishers-series',219,0),(276,'alpha-numeric-designations',220,0),(277,'rights',221,0),(278,'general-note-2',223,0),(279,'variations-in-title',224,0),(280,'source-of-title-proper',225,0),(281,'parallel-titles-and-other-title-information',226,0),(282,'continuation-of-title',227,0),(283,'statements-of-responsibility',228,0),(284,'attributions-and-conjectures',229,0),(285,'part',230,0),(286,'text-2',232,0),(287,'cartographic',233,0),(288,'notated-music',234,0),(289,'sound-recording-2',236,0),(290,'sound-recording-musical',237,0),(291,'sound-recording-nonmusical',238,0),(292,'still-image',239,0),(293,'moving-image',240,0),(294,'three-dimensional-object',241,0),(295,'software-multimedia',242,0),(296,'mixed-material',243,0),(297,'collection-4',245,0),(298,'dataset',246,0),(299,'event',247,0),(300,'image-2',249,0),(301,'interactive-resource',250,0),(302,'moving-image-2',252,0),(303,'physical-object-2',254,0),(304,'service',255,0),(305,'software',256,0),(306,'sound',257,0),(307,'still-image-2',259,0),(308,'text-3',261,0),(309,'function',262,0),(310,'subfunction',263,0),(311,'business-process',264,0),(312,'activity',265,0),(313,'task',266,0),(314,'transaction',267,0),(315,'public-transfer',268,0),(316,'private-transfer',269,0),(317,'deposit',270,0),(318,'gift',271,0),(319,'purchase',272,0),(320,'transfer',273,0),(321,'high',274,0),(322,'medium',275,0),(323,'low',276,0),(324,'complete',277,0),(325,'incomplete',278,0),(326,'in-progress',279,0),(327,'whole',280,0),(328,'part-2',282,0),(329,'delete',283,0),(330,'discover',284,0),(331,'display',285,0),(332,'disseminate',286,0),(333,'migrate',287,0),(334,'modify',288,0),(335,'replicate',289,0),(336,'under-copyright',290,0),(337,'public-domain',291,0),(338,'unknown',292,0),(339,'isad-g-2nd-ed-international-council-on-archives',293,0),(340,'dublin-core-version-1-1-dublin-core-metadata-initiative',294,0),(341,'mods-version-3-3-u-s-library-of-congress',295,0),(342,'rad-july-2008-version-canadian-council-of-archives',296,0),(343,'dacs-2nd-ed-society-of-american-archivists',297,0),(344,'fyug4',298,0),(345,'xa70o',299,0),(346,'0pabf',300,0),(347,'ce4su',301,0),(348,'7dazw',302,0),(349,'8zp8t',303,0),(350,'veyp6',304,0),(351,'35zy0',305,0),(352,'dnop8',306,0),(353,'wggyd',307,0),(354,'q9qtq',308,0),(355,'u4x4j',309,0),(356,'ul6nx',310,0),(357,'us9br',311,0),(358,'example-fonds-1',312,0),(359,'file-1',313,0),(360,'4wnum',314,0),(361,'file-2',315,0),(362,'ls0xn',316,0),(363,'example-fonds-2',317,0),(364,'file-3',318,0),(365,'fsv9e',319,0),(366,'file-4',320,0),(367,'p8j7k',321,0),(368,'m-8000-879-141-jpg',322,0),(369,'m-8000-879-141-141-jpg',323,0),(370,'m-8000-879-141-142-jpg',324,0),(371,'asa-home-icn-png',325,0),(372,'asa-home-icn-141-jpg',326,0),(373,'asa-home-icn-142-jpg',327,0),(374,'ppcli-jpg',328,0),(375,'ppcli-141-jpg',329,0),(376,'ppcli-142-jpg',330,0),(377,'b-141-jpg',331,0),(378,'b-141-141-jpg',332,0),(379,'b-141-142-jpg',333,0),(380,'hi',334,0),(381,'vmpy4',335,0),(382,'uj9ba',336,0);
/*!40000 ALTER TABLE `slug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page`
--

DROP TABLE IF EXISTS `static_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_page` (
  `id` int(11) NOT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `static_page_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page`
--

LOCK TABLES `static_page` WRITE;
/*!40000 ALTER TABLE `static_page` DISABLE KEYS */;
INSERT INTO `static_page` VALUES (7,'en'),(8,'en');
/*!40000 ALTER TABLE `static_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_page_i18n`
--

DROP TABLE IF EXISTS `static_page_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_page_i18n` (
  `title` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `static_page_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `static_page` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_page_i18n`
--

LOCK TABLES `static_page_i18n` WRITE;
/*!40000 ALTER TABLE `static_page_i18n` DISABLE KEYS */;
INSERT INTO `static_page_i18n` VALUES ('Willkommen','Das ist die standardmäßige Homepage von AtoM. Dabei handelt es sich um eine Beta-Version, die nach wie vor weiter entwickelt und getestet wird.\n\nAtoM ist eine vollständig webbasierte Anwendung zur Archiverschließung. Sie basiert auf den Standards des <a href=\"http://www.ica.org/\">Internationalen Archivrats</a> (ICA). <i>AtoM</i> ist ein Akronym für <i>Access to Memory</i>.\n\nDer ICA und seine <a href=\"http://ica-atom.org/about#partners\">Projekpartner</a> machen diese Anwendung als Open-Source-Software zugänglich, um archivischen Institutionen eine frei zugänglichen und einfach zu benutzende Möglichkeit anzubieten, ihre Bestände online vorzustellen. Auf der Seite <a href=\"about\">Über AtoM</a> erfahren Sie Näheres zum Projekt.\n\n<h2>Hilfe</h2>\n\nBenützen Sie das online <a href=\"http://ica-atom.org/docs\">Benützerhandbuch</a> um mehr über die Funktionen dieses Programms zu erfahren oder wählen Sie die Schaltfläche\n<i>blättern</i>, um einige Beispieldaten zu sehen.',7,'de'),('Welcome','This is the default homepage for AtoM.\n\nAtoM is a fully web based archival description application that is based on <a href=\"http://www.ica.org/\">International Council on Archives</a> (ICA) standards. <i>AtoM</i> is an acronymn for <i>Access to Memory</i>.\n\nThe ICA and its <a href=\"http://ica-atom.org/about#partners\">project collaborators</a> are making this application available as open source software to provide archival institutions with a free and easy to use option for putting their archival collections online. See the <a href=\"about\">about page</a> to learn more about the AtoM project.\n\nSee the online <a href=\"http://ica-atom.org/docs\">documentation</a> to learn more about using the software or press the <i>browse</i> button on the right to view some sample data.',7,'en'),('Bienvenido','Esta es la página por defecto de AtoM.\n\nAtoM es una aplicación diseñada para la descripción de archivos con soporte web completo basada en los estándares del <a href=\"http://www.ica.org/\">Consejo Internacional de Archivos</a> (CIA/ICA). <i>AtoM</i> es el acrónimo de <i>Access to Memory</i> (Acceso a la Memoria).\n\nEl CIA/ICA y sus <a href=\"http://ica-atom.org/about#partners\">colaboradores</a> en el proyecto están desarrollando esta aplicación de recursos de software abierto para que las instituciones archivísticas puedan hospedar online su información de un modo fácil y gratuito. Consulte <a href=\"acerca\">about page</a> para conocer más información acerca del proyecto AtoM.\n\nConsulte la <a href=\"http://ica-atom.org/docs\">documentación</a> online para saber más acerca de cómo usar el software o presione el botón <i>navegar</i> situado en la parte derecha de la pantalla para ver algunos ejemplos',7,'es'),('Bienvenue','Vous êtes sur la page d’accueil d’AtoM. Il s’agit d’une version bêta encore en phase active de développement et de test.\n\nAtoM est une application Web de description archivistique qui repose sur les normes du <a href=\"http://www.ica.org/ \"> Conseil International des Archives</a>(CIA). <i>AtoM</i> est un acronyme signifiant: <i>«  Access to Memory  »</i> [Accès à la Mémoire].\n\nLe CIA et <a href=\"http://ica-atom.org/about#partners\">ses partenaires associés au projet</a> veillent à faire de cette application un logiciel libre afin de fournir aux services d’archives une solution gratuite et facile d’emploi pour la mise en ligne de leurs fonds d’archives. Pour en apprendre plus sur le projet du CIA, voyez la <a href=\"about\">page « À propos »</a>.\n\nConsultez la <a href=\"https://www.ica-atom.org/doc/Main_Page/fr \">documentation en ligne</a> pour en apprendre plus sur l’utilisation du logiciel , ou bien cliquez sur le bouton <i>« Naviguer »</i> à droite pour voir quelques exemples de données en ligne.',7,'fr'),('Benvido','Esta é a páxina por defecto de AtoM. Esta é a versión beta que aínda esta en desenvolvemento e proba.\n\nAtoM é unha aplicación completa baseada na web para a descrición arquivística. Emprega os estándares do <a href=\"http://www.ica.org/\">Consello Internacional de Arquivos </a> (ICA). <i>AtoM</i> é o acrónimo de <i>Acceso á Memoria </i>.\n\nO ICA e os seus <a href=\"http://ica-atom.org/about#partners\">colaboradores no proxecto </a> están traballando para que a aplicación sexa dispoñible como software de código aberto e proporcione ás institucións arquivísticas unha opción de balde e doada de empregar para publicar en liña as súas coleccións arquivísticas. Vexa a <a href=\"about\">páxina about</a> para aprender máis sobre o proxecto AtoM.\n\nVexa a documentación <a href=\"http://ica-atom.org/docs\">online</a> para aprender máis sobre o uso do software e prema o botón <i>examinar</i> á dereita para ver algúns exemplos.',7,'gl'),('Selamat Datang','Ini adalah halaman utama AtoM. Ini adalah versi beta yang masih dalam pengembangan dan pengujian secara aktif.\n\nAtoM adalah aplikasi berbasis web untuk deskripsi arsip yang berdasar pada <a href=\"http://www.ica.org/\"> International Council on Archives</a> (ICA) standar. <i>AtoM</i> adalah singkatan dari <i>Access to Memory</i>.\n\nICA dan rekanannya <a href=\"http://ica-atom.org/about#partners\">proyek  kolaborator</a> membuat aplikasi ini sebagai aplikasi <i>open source</i> agar dapat mendukung institusi arsip secara terbuka dan memudahkan untuk mengelola koleksi arsip mereka secara online.\n\nLihat <a href=\"about\">Tentang AtoM</a> untuk mempelajari lebih lanjut tentang proyek aplikasi AtoM.\n\nLihat online <a href=\"http://ica-atom.org/docs\">dokumentasi</a> untuk mempelajari lebih lanjut menggunakan aplikasi ini atau gunakan <i>browse</i> pada bagian kanan untuk melihat beberapa sample data.',7,'id'),('Benvenuti','Questa è la pagina predefinita di AtoM.\n\nAtoM è un applicazione per la descrizione archivistica interamente online, basata sugli standard dell\'<a href=\"http://www.ica.org/\">International Council on Archives</a> (ICA). AtoM è un acronimo per <i>Access to Memory</i>.\n\nICA e i suoi <a href=\"http://ica-atom.org/about#partners\">collaboratori nel progetto</a> stanno sviluppando questa applicazione open source per fornire alle istituzioni archivistiche una semplice e gratuita opzione per rendere disponibile in linea il loro patrimonio archivistico. Si veda la pagina delle <a href=\"about\">informazioni</a> per ulteriori indicazioni sul progetto AtoM.\n\nÈ possibile consultare la <a href=\"http://ica-atom.org/docs\">documentazione</a> per informazioni su come utilizzare il software o, utilizzando il pulsante <i>naviga</i> sulla destra, è possibile vedere alcuni esempi.',7,'it'),('ようこそ','AtoMは、<a href=\"http://www.ica.org/\">国際文書館評議会</a> （ICA） の基準に基づいた完全にウェブベースのアーカイブズ記述のアプリケーションです。Atomは、Access to Memoryの略語です。\n\nICAと<a href=\"http://ica-atom.org/about#partners\"> プロジェクトの協力者は、</a>アーカイブ機関にこのアプリケーションをアーカイブズコレクションをオンライン化するための手段として使用するための無料で使いやすいオープンソースソフトウェアとして利用できるようにしています。ICA Atomのプロジェクトの詳細を学ぶためには <a href=\"about\">about page</a> を参照してください。\n\nこのソフトウェアの使用法をもっと知るために、<a href=\"http://ica-atom.org/docs\">documentation</a> オンラインマニュアルを参照するか、いくつかのサンプルデータを表示するために右側の <i>browse</i> ボタンをクリックしてしてください',7,'ja'),('მოგესალმებით','თქვენ იმყოფებით AtoM პროგრამის საწყის გვერდზე. ეს გახლავთ ჯერ კიდევ ბეტა ვერსიის პროგრამული უზრუნველყოფა, რომლის დახვეწა და ტესტირება ჯერ კიდევ მიმდინარეობს.\n\nAtoM არის მთლიანად ვებზე დაფუძნებული პროგრამა საარქივო აღწერებისათის, რომელიც დაფუძნებულია <a href=\"http://www.ica.org/\">არქივების საერთაშორისო საბჭოს</a> (ICA) სტანდარტებზე. <i>AtoM</i> არის <i>Access to Memory</i> აკრონიმი.\n\nICA და მისი <a href=\"http://ica-atom.org/about#partners\">პროექტი გათვლილია</a> რათა პროგრამა იყოს უფასო და ღია კოდის სოფტი რათა ნებისმიერ ფონდშემნახველ ორგანიზაციას ქონდეს შესაძლებლობა მარტივად დანერგოს და გამოიყენოს ის ონლაინ კოლექციებისათის. იხილეთ <a href=\"about\">ჩენს შესახებ</a> AtoM პროექტის შესახებ მეტი ინფორმაციისათვის.\n\nიხილეთ <a href=\"http://ica-atom.org/docs\">დოკუმენტაცია</a> რათა გაეცნოთ პროგრამას დეტალურად ან დააჭირეთ <i>მოძიება</i> ღილაკს მარჯვენა მხარეს მაგალითების სანახავად.',7,'ka'),('환영합니다','이 홈페이지는 AtoM 1.0.7.판의 홈페이지이다. 이 보존기록프로그램은 현재 개발시험중인 초기 베타버전이다. \n\nAtoM은 \'국제기록보존기구회의\'(ICA) 표준에 기초한 웹기반 보존기록기술 어플리케이션이다.AtoM은 기억에 대한 접근(Access to Memory)의 약어이다.\n\nICA와 ICA의 \'프로젝트 협력자\'들은 기록보존기관들이 소장 기록물을 쉽게 무료로 온라인으로 정리제공할 수 있게 이 어플리케이션을 오픈소스 소프트웨어로 개발하고 있다. AtoM 프로젝트에 대해 더 알고 싶으면  \'위 페이지\'를 보시오.  \n\n이 소프트웨어 사용에 대해 더 알고 싶으면 온라인 \'도큐멘테이션\'을 보고, 샘플 데이터를 보려면 오른쪽 \'찾아보기\' 단추를 누르시오.    ',7,'ko'),('Welkom','Dit is de standaard homepage voor AtoM. Dit is een beta versie, nog onder ontwikkeling en testen.\n\nAtoM is een volledig web based applicatie voor het beschrijven van archieven, gebaseerd op <a href=\"http://www.ica.org/\">International Council on Archives</a> (ICA) standaarden. <i>AtoM</i> is een acroniem voor <i>Access to Memory</i>.\n\nDe ICA en zijn <a href=\"http://ica-atom.org/about#partners\">project partners</a> stellen deze applicatie beschikbaar als open source software, om archiefinstellingen te voorzien van een vrij en gemakkelijk te gebruiken voorziening om hun archiefcollecties online te zetten. Zie de <a href=\"about\">over pagina</a> voor meer informatie over het AtoM project.\n\nZie de online <a href=\"http://ica-atom.org/docs\">documentatie</a> voor meer informatie over het gebruik van de software of toets de <i>browse</i> knop aan de rechterkant om enkele voorbeelden te bekijken.',7,'nl'),('Witamy','To jest strona domowa AtoM. Jest to wersja beta, nadal podlegająca aktywnym testom i zmianom.\n\nAtoM jest opartym w pełni na technologii web oprogramowaniem do opisu archiwalnego bazującym na standardach <a href=\"http://www.ica.org/\">Międzynarodowej Rady Archiwów (ICA)</a>. <i>AtoM</i> jest akronimem angielskich słów <i>Access to Memory</i>.\n\nMiędzynarodowa Rada Archiwów, wraz z <a href=\"http://ica-atom.org/about#partners\">partnerami projektu</a> tworzą to oprogramowanie na zasadach open source, aby umożliwić instytucjom archiwalnym łatwą i swobodną metodę publikowania swoich kolekcji online.\n\nZapoznajcie się ze stroną <a href=\"about\">O projekcie</a> aby dowiedzieć się więcej na temat AtoM.\n\nZachęcamy również do skorzystania z <a href=\"http://ica-atom.org/docs\">dokumentacji</a> aby dowiedzieć się więcej na temat użytkowania programu lub kliknięcia odnośnika <i>browse</i> po prawej stronie, aby przeglądać przykładowe dane demonstracyjne.',7,'pl'),('Bem-vindo','Esta é a página padrão para o AtoM.\n\nAtoM é um aplicativo de descrição arquivística integralmente voltado para web e baseado em <a href=\"http://www.ica.org/\">Conselho Internacional de Arquivos</a> (CIA) normas. <i>AtoM</i> é um acrônimo para <i>Access to Memory [Acesso à Memória]</i>.\n\nO CIA e seus <a href=\"http://ica-atom.org/about#partners\">colaboradores neste projeto</a> estão disponibilizando este aplicativo como software de fonte aberta para prestar apoio a entidades custodiadoras como uma opção gratuita e de fácil uso para colocar seus acervos arquivísticos online. Veja <a href=\"about\">about page</a> para saber mais sobre o projeto AtoM.\n\nVeja a <a href=\"http://ica-atom.org/docs\">documentação</a> para saber mais como utilizar o software ou pressione o botão <i>navegador</i> no lado direito para ver alguns exemplos.',7,'pt'),('Dobrodošli','To je privzeta domača stran programa AtoM. Gre za beta verzijo, ki se aktivno razvija in testira.\n\nAtoM je v celoti spletni arhivski program, ki temelji na standardih Mednarodnega arhivskega sveta (ICA) <a href=\"http://www.ica.org/\">International Council on Archives</a> (ICA) standards. <i>AtoM</i> Atom je kratica za dostop do pomnilnika.\n\nS pomočjo ICA in <a href=\"http://ica-atom.org/about#partners\">drugih sodelavcev pri projektu</a> je program dostopen kot odprtokodna programska oprema, ki institucijam z arhivi ponuja brezplačno in preprosto možnost objave svojih arhivskih zbirk na spletu. Glejte <a href=\"about\">o strani</a> za več informacij o projektu AtoM.\n\nOglejte si spletno dokumentacijo <a href=\"http://ica-atom.org/docs\">dokumentacija</a> za več informacij o uporabi programa ali kliknite gumb <i>išči</i> na desni strani za ogled primerov.',7,'sl'),('ยินดีต้อนรับ','นี่คือ default homepage ของ AtoM รุ่นเบต้าซึ่งยังอยู่ภายใต้การพัฒนาและการทดสอบ\n\nAtoM เป็นเวปไซที่เป็นคลังเก็บคำอธิบายของจดหมายเหตุ ตาม <a href=\"http://www.ica.org/\">International Council on Archives</a> (ICA) standards. <i>AtoM</i> เป็นตัวย่อมาจากคำว่า <i>Access to Memory</i>.\n\nICA และ<a href=\"http://ica-atom.org/about#partners\"> ผู้ร่วมทำ project </a> ร่วมกันพัฒนาแอพพริเคชันนี้ในรูปแบบของ open source software เพื่อให้สถาบันจดหมายเหตุสามารถรวบจดหมายเหตุออนไลน์ได้ง่ายขึ้นโดยไม่เสียค่าใช้จ่าย ดู<a href=\"about\"> about page </a> เพื่อเรียนรู้เพิ่มเติมเกี่ยวกับ AtoM project\n\nดูออนไลน์ <a href=\"http://ica-atom.org/docs\"> documentation</a>  เพื่อเรียนรู้เพิ่มเติมเกี่ยวกับการใช้ซอฟแวร์ หรือกดปุ่ม <i>browse</i> ที่ด้านบนขวาเพื่อดูข้อมูลตัวอย่าง',7,'th'),('Über','Dies ist die vorgegebene Seite <i>Über</i> der Open-Source Anwendung zur archivischen Erschließung AtoM. Für den Einstieg in AtoM benützen Sie die <a href=\"http://ica-atom.org/docs\">Dokumentation</a>. Hier erfahren Sie, wie Sie die Anwendung an die Gestaltung ihrer Webseite anpassen und editieren können.\n\nAtoM ist ein <a href=\"http://ica-atom.org/about#partners\">gemeinschaftliches Projekt</a>. Es möchte der internationalen archivarischen Gemeinschaft eine freie, auf Open-Source basierende Software-Anwendung zur Verfügung stellen, um Archivbestände in Übereinstimmung mit den ICA-Standards erschließen zu können.\n\nZiel ist es, eine einfache, vielsprachige, komplett webbasierte Anwendung zur Verfügung zu stellen, die es Institutionen erlaubt, ihre Archivbestände online vorzustellen.',8,'de'),('About','This is the default <i>About</i> page for the AtoM open source archival description application. See the online <a href=\"http://ica-atom.org/docs\">documentation</a> to learn how to get started with AtoM, including how to customize and edit this page to suit your own website.\n\nAtoM is a <a href=\"http://ica-atom.org/about#partners\">collaborative project</a> with the aim to provide the international archival community with a free, open source software application to manage archival descriptions in accord with ICA standards.\n\nThe goal is to provide an easy to use, multilingual application that is fully web based and will allow institutions to make their archival collections available online.',8,'en'),('Acerca','Ésta es la página por defecto <i>Acerca</i> de la aplicación para descripción archivística de código abierto AtoM. Para información sobre cómo utilizar AtoM, personalizar y editar esta página según las características de su propio sitio Web, consulte <a href=\"http://ica-atom.org/docs\">documentation</a> .\n\nEl proyecto AtoM <a href=\"http://ica-atom.org/about#partners\">collaborative project</a> tiene por objetivo proporcionar a la comunidad archivística internacional una aplicación gratuita de código abierto para la administración descripciones archivísticas en cumplimiento con estándares ICA.\n\nLa meta es poner a disposición del usuario una aplicación multilingüe, de fácil uso y situada en la red, que permita a las instituciones publicar sus colecciones archivísticas en línea.',8,'es'),('درباره ما',NULL,8,'fa'),('À propos','Vous êtes sur la page <i>À propos</i> du logiciel libre de description archivistique AtoM. Voir la <a href=\"http://ica-atom.org/docs\">documentation en ligne </a> pour apprendre à utiliser AtoM, l\'adapter à vos besoins et modifier cette page afin qu\'elle convienne à votre propre site Web.\n\nAtoM est un <a href=\"http://ica-atom.org/about#partners\">projet collaboratif</a> ayant pour but de fournir à la communauté archivistique internationale une application gratuite, disponible en code source libre, permettant de gérer des descriptions archivistiques conformément aux normes de l\'ICA.\n\nLe but est de fournir une application facile à utiliser, multilingue et entièrement basée sur le Web qui permettra aux institutions de rendre accessible en ligne leurs collections archivistiques.',8,'fr'),('Acerca',NULL,8,'gl'),('Tentang Kami',NULL,8,'id'),('Riguardo','Questa è la pagina predefinita per le <i>Informazioni su</i> AtoM, un\'applicazione open-source per la descrizione archivistica. Si veda la <a href=\"http://ica-atom.org/docs\">documentazione</a> in linea per informazioni su come iniziare con AtoM, come personalizzare e tradurre questa pagina per adattarla al proprio sito web.\n\nAtoM è un <a href=\"http://ica-atom.org/about#partners\">progetto collaborativo</a> con lo scopo di mettere a disposizione della comunità archivistica internazionale un software gratis, libero e open source per gestire le descrizioni archivistiche nel rispetto degli standard ICA.\n\nL\'obiettivo è fornire un\'applicazione semplice e multilingua, accessibile interamente online e che permetta alle istituzioni di rendere fruibili online i propri fondi.',8,'it'),('ついて',NULL,8,'ja'),('შესახებ',NULL,8,'ka'),('큐빗에 대하여','이 디폴트 페이지는 AtoM 오픈소스 보존기록 기술 어플리케이션 소개 페이지이다. 이 AtoM 사용에 대해 배우고 싶으면 온라인 \'도큐멘테이션\'을 보라. 여기에는 이 페이지를 당신의 웹사이트에 맞춰 맞춤편집하는 방법이 포함되어 있다.\n\nAtoM은 국제기록보존 사회에 ICA 표준에 따라 보존기록 기술을 관리할 수 있게 하는 무료 오픈소스 소프트웨어 어플리케이션을 제공하려는 목적으로 추진된 합동 프로젝트이다.\n\n이 프로젝트의 목적은 웹기반으로 하여 기록보존기관이 소장 기록물을 손쉽게 온라인으로 제공할 수 있게 하는 사용하기 쉬운 다중언어 어플리케이션을 제공하는데 있다.',8,'ko'),('Over','Dit is de standaard <i>over...</i> pagina voor de AtoM open-source archivistisch beschrijvingsapplicatie. Kijk naar de online <a href=\"http://ica-atom.org/docs\">documentatie</a> om te leren hoe van start te gaan met deze applicatie, inclusief het aanpassen en bewerken van deze pagina om binnen uw eigen webpagina in te passen.\n\nAtoM is een <a href=\"http://ica-atom.org/about#partners\">samenwerkingsproject</a> met het doel om de internationale archiefwereld te voorzien van een vrij, open-source software applicatie om hun archiefbeschrijvingen te beheren conform de ICA-standaarden.\n\nHet doel is om een eenvoudig te gebruiken, meertalige applicatie, dat volledig web-gebaseerd is beschikbaar te stellen. Het geeft instellingen de mogelijkheid om hun archiefcollecties online beschikbaar te stellen.',8,'nl'),('O...',NULL,8,'pl'),('Sobre','Essa é a página padrão <i>Sobre</i> do AtoM, um aplicativo de código-fonte aberto para descrição arquivística. Acesse a <a href=\"http://ica-atom.org/docs\">documentação</a> online para aprender como começar a usar o AtoM, incluindo como personalizar e editar essa página para incluí-la em seu site.\n\nAtoM é <a href=\"http://ica-atom.org/about#partners\">projeto colaborativo</a> que visa prover a comunidade arquivística internacional de um software aplicativo gratuito e de código-fonte aberto, para gerenciamento de descrições arquivísticas em conformidade às normas do Conselho Internacional de Arquivos (ICA).\n\nO objetivo é disponibilizar um aplicativo fácil de usar, multilíngue, e totalmente baseado na web, permitindo que instituições possam disponibilizar seus acervos arquivísticos on-line.',8,'pt'),('Sobre',NULL,8,'pt_BR'),('O programu','To je prednastavljena <i>About</i> stran za AtoM odprtokodno aplikacijo za popisovanje arhivskega gradiva. Glej \"online\" <a href=\"http://ica-atom.org/docs\">documentation</a>, kjer izveš več o tem kako začeti delo s programom, vključno s tem, kako preoblikovati in urediti to stran za lastne potrebe.\n\nICA in njegovi <a href=\"http://ica-atom.org/about#partners\">sodelavci v projektu</a> so pripravili za potrebe mednarodne arhivske skupnosti prosto dostopno in odprtokodno aplikacijo za upravljanje arhivskih opisov v skladu z ICA standardi.\n\nNaš cilj je pripraviti uporabno, večjezikovno spletno aplikacijo, ki bo omogočala ustanovam \"on line\" predstavitev njihovih arhivskih zbirk.',8,'sl');
/*!40000 ALTER TABLE `static_page_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `object_id` int(11) NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status_FI_1` (`object_id`),
  KEY `status_FI_2` (`type_id`),
  KEY `status_FI_3` (`status_id`),
  CONSTRAINT `status_FK_1` FOREIGN KEY (`object_id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `status_FK_2` FOREIGN KEY (`type_id`) REFERENCES `term` (`id`) ON DELETE CASCADE,
  CONSTRAINT `status_FK_3` FOREIGN KEY (`status_id`) REFERENCES `term` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,158,159,1,0),(359,158,159,2,0),(361,158,159,3,0),(358,158,159,4,0),(364,158,159,5,0),(366,158,159,6,0),(363,158,159,7,0);
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomy`
--

DROP TABLE IF EXISTS `taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy` (
  `id` int(11) NOT NULL,
  `usage` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taxonomy_FI_2` (`parent_id`),
  CONSTRAINT `taxonomy_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `taxonomy_FK_2` FOREIGN KEY (`parent_id`) REFERENCES `taxonomy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy`
--

LOCK TABLES `taxonomy` WRITE;
/*!40000 ALTER TABLE `taxonomy` DISABLE KEYS */;
INSERT INTO `taxonomy` VALUES (30,NULL,NULL,1,80,'en'),(31,NULL,30,2,3,'en'),(32,NULL,30,4,5,'en'),(33,NULL,30,6,7,'en'),(34,NULL,30,8,9,'en'),(35,NULL,30,10,11,'en'),(36,NULL,30,12,13,'en'),(37,NULL,30,14,15,'en'),(38,NULL,30,16,17,'en'),(40,NULL,30,18,19,'en'),(41,NULL,30,20,21,'en'),(42,NULL,30,22,23,'en'),(43,NULL,30,24,25,'en'),(44,NULL,30,26,27,'en'),(45,NULL,30,28,29,'en'),(46,NULL,30,30,31,'en'),(47,NULL,30,32,33,'en'),(48,NULL,30,34,35,'en'),(49,NULL,30,36,37,'en'),(50,NULL,30,38,39,'en'),(51,NULL,30,40,41,'en'),(52,NULL,30,42,43,'en'),(53,NULL,30,44,45,'en'),(54,NULL,30,46,47,'en'),(55,NULL,30,48,49,'en'),(56,NULL,30,50,51,'en'),(57,NULL,30,52,53,'en'),(59,NULL,30,54,55,'en'),(60,NULL,30,56,57,'en'),(61,NULL,30,58,59,'en'),(62,NULL,30,60,61,'en'),(63,NULL,30,62,63,'en'),(64,NULL,30,64,65,'en'),(65,NULL,30,66,67,'en'),(66,NULL,30,68,69,'en'),(67,NULL,30,72,73,'en'),(68,NULL,30,70,71,'en'),(69,NULL,30,74,75,'en'),(70,NULL,30,76,77,'en'),(71,NULL,30,78,79,'en');
/*!40000 ALTER TABLE `taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxonomy_i18n`
--

DROP TABLE IF EXISTS `taxonomy_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_i18n` (
  `name` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `taxonomy_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `taxonomy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxonomy_i18n`
--

LOCK TABLES `taxonomy_i18n` WRITE;
/*!40000 ALTER TABLE `taxonomy_i18n` DISABLE KEYS */;
INSERT INTO `taxonomy_i18n` VALUES (NULL,NULL,30,'en'),('Detailgrad der Erschließung',NULL,31,'de'),('Description Detail Levels',NULL,31,'en'),('Nivel de detalle de la descripción',NULL,31,'es'),('Niveaux de détail de la description',NULL,31,'fr'),('Detalles dos niveis da descrición',NULL,31,'gl'),('Level detail deskripsi',NULL,31,'id'),('Livelli della completezza della descrizione',NULL,31,'it'),('記述詳細のレベル',NULL,31,'ja'),('დეტალის დონეების აღწერა',NULL,31,'ka'),('Niveaus van detailbeschrijving',NULL,31,'nl'),('Poziomy szczegółów opisu',NULL,31,'pl'),('Descrição dos níveis de detalhe',NULL,31,'pt'),('Stopnja podrobnosti popisa',NULL,31,'sl'),('ระดับของรายละเอียด คำอธิบาย รายละเอียด ระดับ',NULL,31,'th'),('Rechtspersönlichkeit',NULL,32,'de'),('Actor Entity Types',NULL,32,'en'),('Tipos de Actor',NULL,32,'es'),('Types d\'entité acteurs',NULL,32,'fr'),('Tipe Entiti Aktor',NULL,32,'id'),('Tipi di entità dell\'Agente',NULL,32,'it'),('主体者のエンティティの種別',NULL,32,'ja'),('მონაწილე ერთეულის ტიპი',NULL,32,'ka'),('Soorten entiteiten',NULL,32,'nl'),('Typy jednostek sprawcy/powoda',NULL,32,'pl'),('Tipos de entidades de ator',NULL,32,'pt'),('Vrste entitet delovalcev',NULL,32,'sl'),('ชนิดActor Entity',NULL,32,'th'),('Erschließungsstatus',NULL,33,'de'),('Description Statuses',NULL,33,'en'),('Estado de la descripción',NULL,33,'es'),('Statut de la description',NULL,33,'fr'),('Estados da descrición',NULL,33,'gl'),('Status Deskripsi',NULL,33,'id'),('Stati della descrizione',NULL,33,'it'),('記述のステータス',NULL,33,'ja'),('ღწერის სტატუსები ან სტატუსების აღწერა',NULL,33,'ka'),('Beschrijvingsstatus',NULL,33,'nl'),('Statusy opisu',NULL,33,'pl'),('Estado da descrição',NULL,33,'pt'),('Statusi popisa',NULL,33,'sl'),('สถานะของทำคำอธิบายเอกสาร',NULL,33,'th'),('Erschließungsstufe',NULL,34,'de'),('Levels of description',NULL,34,'en'),('Niveles de descripción',NULL,34,'es'),('Niveaux de description',NULL,34,'fr'),('Niveis de descrición',NULL,34,'gl'),('Level Deskripsi',NULL,34,'id'),('Livelli di descrizione',NULL,34,'it'),('医療のレベル',NULL,34,'ja'),('აღწერის დონეები',NULL,34,'ka'),('Beschrijvingsniveaus',NULL,34,'nl'),('Níveis de descrição',NULL,34,'pt'),('Nivoji popisa',NULL,34,'sl'),('ระดับของคําอธิบาย',NULL,34,'th'),('Themen',NULL,35,'de'),('Subjects',NULL,35,'en'),('Materias',NULL,35,'es'),('Sujets',NULL,35,'fr'),('Materias',NULL,35,'gl'),('Subjek',NULL,35,'id'),('Soggetti',NULL,35,'it'),('主題',NULL,35,'ja'),('სუბიექტები',NULL,35,'ka'),('Onderwerpen',NULL,35,'nl'),('Assuntos',NULL,35,'pt'),('Osebe',NULL,35,'sl'),('หัวข้อ',NULL,35,'th'),('Bezeichnung',NULL,36,'de'),('Actor Name Types',NULL,36,'en'),('Tipos de Nombre de Actor',NULL,36,'es'),('Types de noms d\'acteurs',NULL,36,'fr'),('Tipos de nome de actor',NULL,36,'gl'),('Tipe Nama Aktor',NULL,36,'id'),('Tipi di nome dell\'Agente',NULL,36,'it'),('主体者名の種別',NULL,36,'ja'),('მონაწილის სახელის ტიპი',NULL,36,'ka'),('Soorten naam van entiteiten',NULL,36,'nl'),('Typy nazw sprawcy/powoda',NULL,36,'pl'),('Tipos de nome de ator',NULL,36,'pt'),('Vrste imen delovalcev',NULL,36,'sl'),('ชนิดชื่อนักแสดง',NULL,36,'th'),('Anmerkungsarten',NULL,37,'de'),('Note types',NULL,37,'en'),('Tipos de notas',NULL,37,'es'),('Types de notes',NULL,37,'fr'),('Tipos de nota',NULL,37,'gl'),('Tipi di nota',NULL,37,'it'),('注記の種別',NULL,37,'ja'),('შენიშვნის ტიპები',NULL,37,'ka'),('Soorten aantekeningen',NULL,37,'nl'),('Tipos de nota',NULL,37,'pt'),('Vrste opomb',NULL,37,'sl'),('ประเภทของหมายเหตุ',NULL,37,'th'),('Aufbewahrungsart',NULL,38,'de'),('Repository Types',NULL,38,'en'),('Tipos de Instituciones Archivísticas',NULL,38,'es'),('Types d\'institution de conservation',NULL,38,'fr'),('Tipos de repositorios',NULL,38,'gl'),('Tipologie di deposito',NULL,38,'it'),('リポジトリ種別',NULL,38,'ja'),('საცავის ტიპები',NULL,38,'ka'),('Soorten bewaarplaatsen',NULL,38,'nl'),('Tipos de entidades detentoras',NULL,38,'pt'),('Vrste skladišča',NULL,38,'sl'),('ประเภทคลังเก็บ',NULL,38,'th'),('Ereignistyp',NULL,40,'de'),('Event Types','Used to describe the types of Events that Actors and InformationObjects are related to.',40,'en'),('Tipos de Actividad',NULL,40,'es'),('Types d\'événement',NULL,40,'fr'),('Tipo de evento',NULL,40,'gl'),('Tipe Event',NULL,40,'id'),('Tipi di evento',NULL,40,'it'),('イベントの種別',NULL,40,'ja'),('შემთხვევის ტიპები',NULL,40,'ka'),('Soorten gebeurtenisen',NULL,40,'nl'),('Tipos de evento',NULL,40,'pt'),('Vrste dogodka',NULL,40,'sl'),('ประเภทของเหตุการณ์',NULL,40,'th'),('Qubit Einstellungskennzeichen',NULL,41,'de'),('Qubit Setting Labels','An internal, uneditable taxonomy used to store and translate alternate app setting labels used in different Qubit distributions',41,'en'),('Etiquetas de configuración de Qubit',NULL,41,'es'),('Étiquettes des paramètres Qubit',NULL,41,'fr'),('Etiquetas de configuración de Qubit',NULL,41,'gl'),('Etichette delle impostazioni di Qubit',NULL,41,'it'),('Qubit設定レベル',NULL,41,'ja'),('ქუბიტ პარამეტრების ეტიკეტები',NULL,41,'ka'),('Qubit instellings labels',NULL,41,'nl'),('Etykiety ustawień Qubit',NULL,41,'pl'),('Etiquetas de configuração do Qubit',NULL,41,'pt'),('Nastavitvene oznake orodja Qubit',NULL,41,'sl'),('Orte',NULL,42,'de'),('Places',NULL,42,'en'),('Lugares',NULL,42,'es'),('مكان ها',NULL,42,'fa'),('Lieux',NULL,42,'fr'),('Lugares',NULL,42,'gl'),('Tempat',NULL,42,'id'),('Luoghi',NULL,42,'it'),('場所',NULL,42,'ja'),('ადგილები',NULL,42,'ka'),('장소',NULL,42,'ko'),('Plaatsen',NULL,42,'nl'),('Miejsca',NULL,42,'pl'),('locais',NULL,42,'pt'),('locais',NULL,42,'pt_BR'),('Kraji',NULL,42,'sl'),('สถานที',NULL,42,'th'),('ISDF Funktionen',NULL,43,'de'),('ISDF Function Types',NULL,43,'en'),('ISDF Tipos de Funcion',NULL,43,'es'),('ISDF Types de Fonction',NULL,43,'fr'),('ISDF Tipos de Funcion',NULL,43,'gl'),('Tipologie di funzioni ISDF',NULL,43,'it'),('ISDF 機能種別',NULL,43,'ja'),('ISDF ფუნქციის ტიპები',NULL,43,'ka'),('ISDF Functie Soorten',NULL,43,'nl'),('Tipos de Funções ISDF',NULL,43,'pt'),('Vrsta funkcij ISDF',NULL,43,'sl'),('ISDF ฟังก์ชั่น ประเภท',NULL,43,'th'),('Historische Ereignisse',NULL,44,'de'),('Historical Events',NULL,44,'en'),('Sucesos históricos',NULL,44,'es'),('Événements historiques',NULL,44,'fr'),('Acontecementos históricos',NULL,44,'gl'),('Eventi storici',NULL,44,'it'),('歴史的出来事',NULL,44,'ja'),('ისტორიული მოვლენები',NULL,44,'ka'),('Historische gebeurtenissen',NULL,44,'nl'),('Eventos históricos',NULL,44,'pt'),('Zgodovinski dogodki',NULL,44,'sl'),('ประวัติเหตุการณ',NULL,44,'th'),('Bestandsart',NULL,45,'de'),('Collection Types',NULL,45,'en'),('Tipos de Colección',NULL,45,'es'),('Types de collections',NULL,45,'fr'),('Tipos de coleccións',NULL,45,'gl'),('Tipe Koleksi',NULL,45,'id'),('Tipi di raccolta',NULL,45,'it'),('コレクション種別',NULL,45,'ja'),('კოლექციის ტიპები',NULL,45,'ka'),('Soorten collectie',NULL,45,'nl'),('Typy kolekcji',NULL,45,'pl'),('Tipos de acervo',NULL,45,'pt'),('Vrste zbirke',NULL,45,'sl'),('ชนิดคอลเลกชัน',NULL,45,'th'),('Medientyp',NULL,46,'de'),('Media Types',NULL,46,'en'),('Tipos de Soportes',NULL,46,'es'),('Types de supports',NULL,46,'fr'),('Tipos de medio',NULL,46,'gl'),('Media Type',NULL,46,'it'),('メディア種別',NULL,46,'ja'),('მედია ტიპები',NULL,46,'ka'),('Bestandsformaten',NULL,46,'nl'),('Tipos de suporte',NULL,46,'pt'),('Vrste medija',NULL,46,'sl'),('ประเภทสื่อ',NULL,46,'th'),('Repräsentationsformen digitaler Objekte',NULL,47,'de'),('Digital Object Usages',NULL,47,'en'),('Usos de los Objetivos Digitales',NULL,47,'es'),('Usages d\'objets numériques',NULL,47,'fr'),('Usos dos obxectos dixitais',NULL,47,'gl'),('Penggunaan Objek Digital',NULL,47,'id'),('Usi dell\'oggetto digitale',NULL,47,'it'),('デイジタルオブジェクトの使用法',NULL,47,'ja'),('ციფრული ობიექტის გამოყენება',NULL,47,'ka'),('Gebruik digitaal object',NULL,47,'nl'),('Usos do objeto digital',NULL,47,'pt'),('Raba digitalnega objekta',NULL,47,'sl'),('วัตถุดิจิตอล Usages',NULL,47,'th'),('Art des Physischen Objekts',NULL,48,'de'),('Physical Object Type',NULL,48,'en'),('Physical Object Type',NULL,48,'es'),('Type d\'objet physique',NULL,48,'fr'),('Tipo de obxecto físico',NULL,48,'gl'),('Tipe fisik objek',NULL,48,'id'),('Tipo di oggetto fisico',NULL,48,'it'),('物理的オブジェクト種別',NULL,48,'ja'),('ფიზიკური ობიექტის ტიპი',NULL,48,'ka'),('Soorten fysieke objecten',NULL,48,'nl'),('Tipo de objeto tridimensional',NULL,48,'pt'),('Vrsta fizičnega objekta',NULL,48,'sl'),('ประเภทวัตถุหางทางกายภาพ',NULL,48,'th'),('Bezugsart',NULL,49,'de'),('Relation Type',NULL,49,'en'),('Tipo de Relación',NULL,49,'es'),('Type de relation',NULL,49,'fr'),('Tipo de relación',NULL,49,'gl'),('Tipe Relasi',NULL,49,'id'),('Tipo di relazione',NULL,49,'it'),('関係種別',NULL,49,'ja'),('კავშირის, ურთიერთობის ტიპი',NULL,49,'ka'),('Soorten relaties',NULL,49,'nl'),('Tipo de relação',NULL,49,'pt'),('Vrsta povezave',NULL,49,'sl'),('ประเภทความสัมพันธ์',NULL,49,'th'),('Materialart',NULL,50,'de'),('Material Type',NULL,50,'en'),('Tipo de Material',NULL,50,'es'),('Types de documents',NULL,50,'fr'),('Tipo de material',NULL,50,'gl'),('Tipo di materiale',NULL,50,'it'),('資料種別',NULL,50,'ja'),('მასალის ტიპი',NULL,50,'ka'),('Soort materiaal',NULL,50,'nl'),('Tipo de material',NULL,50,'pt'),('Vrsta gradiva',NULL,50,'sl'),('ประเภทเอกสาร',NULL,50,'th'),('RAD Eintrag',NULL,51,'de'),('RAD Note','Note types that occur specifically within the Canadian Council of Archives\' \'Rules for Archival Description (RAD)\'',51,'en'),('Nota de normas RAD',NULL,51,'es'),('Note RDDA',NULL,51,'fr'),('Nota (RAD)',NULL,51,'it'),('RAD注記',NULL,51,'ja'),('RAD შენიშვნა',NULL,51,'ka'),('Opis RAD',NULL,51,'pl'),('Nota RAD',NULL,51,'pt'),('Opomba glede RAD',NULL,51,'sl'),('หมายเหตุRAD',NULL,51,'th'),('RAD Titeleintrag',NULL,52,'de'),('RAD Title Note','Title note types that occur specifically within the Canadian Council of Archives\' \'Rules for Archival Description (RAD)\'',52,'en'),('Nota sobre títulos según RAD',NULL,52,'es'),('Note de titre RDDA',NULL,52,'fr'),('Nota al titolo (RAD)',NULL,52,'it'),('RADタイトル注記',NULL,52,'ja'),('RAd სათაურის შენიშვნა',NULL,52,'ka'),('Tytuł noty RAD',NULL,52,'pl'),('Nota ao título RAD',NULL,52,'pt'),('Opomba naslova v zvezi z RAD',NULL,52,'sl'),('หมายเหตุชื่อเรื่องRAD',NULL,52,'th'),('MODS Resource Type','Fixed values for the typeOfResource element as prescribed by the The Library of Congress\' \'Metadata Object Description Schema (MODS)\'',53,'en'),('Tipo de Recurso MODS',NULL,53,'es'),('Types de ressources MODS',NULL,53,'fr'),('Tipo di risorsa MODS',NULL,53,'it'),('MODS リソース種別',NULL,53,'ja'),('MODS რესურსის ტიპი',NULL,53,'ka'),('Tipo de recurso MODS',NULL,53,'pt'),('Vrsta vira MODS',NULL,53,'sl'),('Dublin Core Types','Fixed values for the DC Type element as prescribed by the DCMI Type Vocabulary',54,'en'),('Tipos según Dublin Core',NULL,54,'es'),('Types Dublin Core',NULL,54,'fr'),('Tipos Dublin Core',NULL,54,'gl'),('Tipi Dublin Core',NULL,54,'it'),('ダブリンコア種別',NULL,54,'ja'),('დაბლინ კორ ტიპები',NULL,54,'ka'),('Tipos Dublin Core',NULL,54,'pt'),('Vrste po standardu Dublin Core',NULL,54,'sl'),('Actor Relation Type','Actor-to-Actor relationship categories defined by the ICA ISAAR (CPF) specification, 2nd Edition, Section 5.3.2, \'Category of relationship\'.',55,'en'),('Tipo de Relación con el Actor',NULL,55,'es'),('Type de relation entre acteurs',NULL,55,'fr'),('Tipo de relación de actor',NULL,55,'gl'),('Tipe Relasi Aktor',NULL,55,'id'),('Tipi di relazione dell\'Agente',NULL,55,'it'),('主体者の関係の種別',NULL,55,'ja'),('მონაწილის კავშირის ტიპი',NULL,55,'ka'),('Soort relatie tussen actoren',NULL,55,'nl'),('Typy powiązań sprawcy/powoda',NULL,55,'pl'),('Tipo de relação de ator',NULL,55,'pt'),('Vrste povezav med delovalci',NULL,55,'sl'),('ชนิดActor Relation',NULL,55,'th'),('Relation Note Types',NULL,56,'en'),('Tipos de Notas sobre Relaciones',NULL,56,'es'),('Types de note sur la relation',NULL,56,'fr'),('Tipos de nota de relación',NULL,56,'gl'),('Tipi di note sulla relazione',NULL,56,'it'),('関連する注記の種別',NULL,56,'ja'),('კავშირების შენიშვნების ტიპები',NULL,56,'ka'),('Notas aos tipos de relação',NULL,56,'pt'),('Vrste opomb glede povezave',NULL,56,'sl'),('ประเภทหมายเหตุความสัมพันธ์',NULL,56,'th'),('Term Relation Types',NULL,57,'en'),('Tipos de Términos de Relación',NULL,57,'es'),('Types de terme de relation',NULL,57,'fr'),('Tipos de relación entre termos',NULL,57,'gl'),('Tipe Relasi Istilah',NULL,57,'id'),('Tipi di relazione fra termini',NULL,57,'it'),('用語関係種別',NULL,57,'ja'),('ურთიერთობის ტიპების ვადები',NULL,57,'ka'),('Term relatie typen',NULL,57,'nl'),('Typy powiązań terinu',NULL,57,'pl'),('Tipos de relação dos termos',NULL,57,'pt'),('Vrste povezav med izrazi',NULL,57,'sl'),('คำศัพท์ประเภทRelation',NULL,57,'th'),('Status Types',NULL,59,'en'),('Tipos de Estado',NULL,59,'es'),('Type de statut',NULL,59,'fr'),('Tipos de estatuto',NULL,59,'gl'),('Tipe Status',NULL,59,'id'),('Tipi di stato',NULL,59,'it'),('ステータス種別',NULL,59,'ja'),('სტატუსის ტიპები',NULL,59,'ka'),('Status soorten',NULL,59,'nl'),('Tipos de estatuto',NULL,59,'pt'),('Vrste statusa',NULL,59,'sl'),('ประเภทสถานะ',NULL,59,'th'),('Publication Status',NULL,60,'en'),('Estado de publicación',NULL,60,'es'),('Statut de la publication',NULL,60,'fr'),('Estado da publicación',NULL,60,'gl'),('Status Publikasi',NULL,60,'id'),('Stato della pubblicazione',NULL,60,'it'),('出版物のステータス',NULL,60,'ja'),('პუბლიკაციის სტატუსი',NULL,60,'ka'),('Publicatie status',NULL,60,'nl'),('Status publikacji',NULL,60,'pl'),('estado da publicação',NULL,60,'pt'),('Status objave',NULL,60,'sl'),('สถานภาพการพิมพ',NULL,60,'th'),('Function Relation Type','Function-to-function relationship categories defined by the ICA ISDF specification, 1st Edition, Section 5.3.3, \'Category of relationship\'.',61,'en'),('Tipo de Relación de Función',NULL,61,'es'),('Type de relation entre fonctions',NULL,61,'fr'),('Tipo de función de relación',NULL,61,'gl'),('Tipe Relasi Fungsi',NULL,61,'id'),('Tipo di relazione della Funzione',NULL,61,'it'),('機能関係種別',NULL,61,'ja'),('ფუნქციური კავშირის ტიპი',NULL,61,'ka'),('Soort functie relatie',NULL,61,'nl'),('Tipo de relação da Função',NULL,61,'pt'),('Vrsta povezav med funkcijami',NULL,61,'sl'),('ฟังก์ชั่น  ความสัมพันธ์ ประเภท',NULL,61,'th'),('Accession resource type',NULL,62,'en'),('Tipo de documentación del ingreso',NULL,62,'es'),('Type de ressource versée',NULL,62,'fr'),('Tipo de recurso de ingreso',NULL,62,'gl'),('Tipe sumber Informasi',NULL,62,'id'),('Tipo di risorsa acquisita',NULL,62,'it'),('受入資料資料種別',NULL,62,'ja'),('დაშვების მასალის ტიპი',NULL,62,'ka'),('Soort bron van aanwinst',NULL,62,'nl'),('Typ zasobu nabycia',NULL,62,'pl'),('Tipo do recurso da incorporação',NULL,62,'pt'),('Vrsta vira prevzetega gradiva',NULL,62,'sl'),('ประเภททรัพยากรการเข้าถึงเอกสาร',NULL,62,'th'),('Accession acquisition type',NULL,63,'en'),('Tipo de ingreso',NULL,63,'es'),('Type d\'entrée',NULL,63,'fr'),('Tipo de ingreso',NULL,63,'gl'),('tipe akuisisi',NULL,63,'id'),('Tipo di acquisizione',NULL,63,'it'),('受入資料の受入種別',NULL,63,'ja'),('დაშვების ტიპი',NULL,63,'ka'),('Soort aanwinst',NULL,63,'nl'),('Sposób pozyskania nabytku',NULL,63,'pl'),('Tipo de aquisição da incorporação',NULL,63,'pt'),('Način prevzema pribobljenega gradiva',NULL,63,'sl'),('ชนิดการจัดหาเอกสารของการเข้าถึงเอกสาร',NULL,63,'th'),('Accession processing priority',NULL,64,'en'),('Prioridad de tratamiento del ingreso',NULL,64,'es'),('Priorité du processus d\'entrée',NULL,64,'fr'),('Prioridade do proceso de ingreso',NULL,64,'gl'),('Prioritas proses',NULL,64,'id'),('Priorità di trattamento dell\'acquisizione',NULL,64,'it'),('受入資料の処理の優先度',NULL,64,'ja'),('დაშვების პროცესის პრიორიტეტულობა',NULL,64,'ka'),('Priorytet opracowania nabytku',NULL,64,'pl'),('Prioridade do processamente da incorporação',NULL,64,'pt'),('Prednostna obdelava prevzetega gradiva',NULL,64,'sl'),('ลำดับความสำคัญที่ดำเนินการเข้าถึงเอกสาร',NULL,64,'th'),('Accession processing status',NULL,65,'en'),('Estado de tratamiento del ingreso',NULL,65,'es'),('Statut du processus d\'entrée',NULL,65,'fr'),('Estado do proceso de ingreso',NULL,65,'gl'),('Status proses',NULL,65,'id'),('Stato di trattamento dell\'acquisizione',NULL,65,'it'),('受入資料の処理状況',NULL,65,'ja'),('დაშვების პროცესის სტატუსი',NULL,65,'ka'),('Status opracowania nabytku',NULL,65,'pl'),('Situação do processamento das incorporações',NULL,65,'pt'),('Status obdelave prevzetega gradiva',NULL,65,'sl'),('สถานภาพดำเนินการเข้าถึงเอกสาร',NULL,65,'th'),('Deaccession scope',NULL,66,'en'),('Alcance de la eliminación',NULL,66,'es'),('Portée de la sortie définitive',NULL,66,'fr'),('Ámbito do expurgo',NULL,66,'gl'),('Ambito dello scarto o del trasferimento',NULL,66,'it'),('廃棄の範囲',NULL,66,'ja'),('შეზღუდვის მოცულობა',NULL,66,'ka'),('Zakres zbycia',NULL,66,'pl'),('Âmbito da transferência',NULL,66,'pt'),('Obseg prodaje',NULL,66,'sl'),('เขตการทิ้งเอกสาร',NULL,66,'th'),('Rights act',NULL,67,'en'),('Acciones reguladas por derechos',NULL,67,'es'),('Actions liées aux droits',NULL,67,'fr'),('Acta de dereitos',NULL,67,'gl'),('Atto',NULL,67,'it'),('権利の行動',NULL,67,'ja'),('უფლებების მოქმედება',NULL,67,'ka'),('Wetgeving betreffende rechten',NULL,67,'nl'),('Akt prawny',NULL,67,'pl'),('Decisão dos direitos',NULL,67,'pt'),('Zakon o pravicah',NULL,67,'sl'),('สิทธิact',NULL,67,'th'),('Rights basis',NULL,68,'en'),('Fundamentos de derechos',NULL,68,'es'),('Fondements des droits',NULL,68,'fr'),('Dereitos básicos',NULL,68,'gl'),('Base dei diritti',NULL,68,'it'),('権利の根拠',NULL,68,'ja'),('უფლებების საფუძველი(ბაზისი)',NULL,68,'ka'),('Rechten grondslag',NULL,68,'nl'),('Podstawa prawna',NULL,68,'pl'),('Base dos direitos',NULL,68,'pt'),('Osnova za pravice',NULL,68,'sl'),('พื้นฐานสิทธ',NULL,68,'th'),('Copyright status',NULL,69,'en'),('Régimen de derechos de autor',NULL,69,'es'),('Statut des droits d\'auteur',NULL,69,'fr'),('Estado do Copyright',NULL,69,'gl'),('Status Hak Cipta',NULL,69,'id'),('Stato del copyright',NULL,69,'it'),('著作権のステータス',NULL,69,'ja'),('საავტორო უფლების სტატუსი',NULL,69,'ka'),('Copyright status',NULL,69,'nl'),('Status prawa autorskiego',NULL,69,'pl'),('Direitos de autor',NULL,69,'pt'),('Direitos de autor',NULL,69,'pt_BR'),('Status avtorskih pravic',NULL,69,'sl'),('สถานภาพลิขสิทธิ์',NULL,69,'th'),('Information object templates',NULL,70,'en'),('Información sobre las plantillas',NULL,70,'es'),('Modèles de description archivistique',NULL,70,'fr'),('Plantillas de obxectos de información',NULL,70,'gl'),('Modelli degli oggetti informativi',NULL,70,'it'),('Modelos de objetos de informação',NULL,70,'pt'),('Predloge za informacijski objekt',NULL,70,'sl'),('AIP types',NULL,71,'en');
/*!40000 ALTER TABLE `taxonomy_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term` (
  `id` int(11) NOT NULL,
  `taxonomy_id` int(11) NOT NULL,
  `code` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `source_culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `term_FI_2` (`taxonomy_id`),
  KEY `term_FI_3` (`parent_id`),
  CONSTRAINT `term_FK_1` FOREIGN KEY (`id`) REFERENCES `object` (`id`) ON DELETE CASCADE,
  CONSTRAINT `term_FK_2` FOREIGN KEY (`taxonomy_id`) REFERENCES `taxonomy` (`id`) ON DELETE CASCADE,
  CONSTRAINT `term_FK_3` FOREIGN KEY (`parent_id`) REFERENCES `term` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` VALUES (110,30,NULL,NULL,1,462,'en'),(111,40,NULL,110,2,3,'en'),(113,40,NULL,110,4,5,'en'),(114,40,NULL,110,6,7,'en'),(115,40,NULL,110,8,9,'en'),(117,40,NULL,110,10,11,'en'),(118,40,NULL,110,12,13,'en'),(119,37,NULL,110,14,15,'en'),(120,37,NULL,110,18,19,'en'),(121,37,NULL,110,20,21,'en'),(122,37,NULL,110,22,23,'en'),(123,37,NULL,110,24,25,'en'),(124,37,NULL,110,80,81,'en'),(125,37,NULL,110,84,85,'en'),(126,37,NULL,110,82,83,'en'),(127,37,NULL,110,154,155,'en'),(128,45,NULL,110,26,27,'en'),(129,45,NULL,110,28,29,'en'),(130,45,NULL,110,30,31,'en'),(131,32,NULL,110,32,33,'en'),(132,32,NULL,110,34,35,'en'),(133,32,NULL,110,36,37,'en'),(135,46,NULL,110,38,39,'en'),(136,46,NULL,110,40,41,'en'),(137,46,NULL,110,42,43,'en'),(138,46,NULL,110,44,45,'en'),(139,46,NULL,110,46,47,'en'),(140,47,NULL,110,50,51,'en'),(141,47,NULL,110,52,53,'en'),(142,47,NULL,110,54,55,'en'),(143,47,NULL,110,56,57,'en'),(144,48,NULL,110,58,59,'en'),(145,48,NULL,110,60,75,'en'),(146,48,NULL,110,76,77,'en'),(147,49,NULL,110,78,79,'en'),(148,36,NULL,110,86,87,'en'),(149,36,NULL,110,88,89,'en'),(150,55,NULL,110,90,103,'en'),(151,55,NULL,110,104,109,'en'),(152,55,NULL,110,110,125,'en'),(153,55,NULL,110,126,137,'en'),(154,56,NULL,110,138,139,'en'),(155,56,NULL,110,140,141,'en'),(156,57,NULL,110,142,143,'en'),(157,57,NULL,110,144,145,'en'),(158,59,NULL,110,148,149,'en'),(159,60,NULL,110,150,151,'en'),(160,60,NULL,110,152,153,'en'),(161,49,NULL,110,156,157,'en'),(162,61,NULL,110,168,169,'en'),(163,61,NULL,110,170,171,'en'),(164,61,NULL,110,172,173,'en'),(165,36,NULL,110,174,175,'en'),(166,47,NULL,110,48,49,'en'),(167,49,NULL,110,160,161,'en'),(168,49,NULL,110,162,163,'en'),(169,49,NULL,110,164,165,'en'),(170,68,NULL,110,176,177,'en'),(171,68,NULL,110,178,179,'en'),(172,68,NULL,110,180,181,'en'),(173,68,NULL,110,182,183,'en'),(174,37,NULL,110,16,17,'en'),(175,49,NULL,110,158,159,'en'),(176,49,NULL,110,166,167,'en'),(177,57,NULL,110,146,147,'en'),(178,49,NULL,110,184,185,'en'),(179,71,NULL,110,186,187,'en'),(180,71,NULL,110,188,189,'en'),(181,71,NULL,110,190,191,'en'),(182,71,NULL,110,192,193,'en'),(183,55,NULL,150,91,92,'en'),(184,55,NULL,150,93,94,'en'),(185,55,NULL,150,95,96,'en'),(186,55,NULL,150,97,98,'en'),(187,55,NULL,150,99,100,'en'),(188,55,NULL,150,101,102,'en'),(189,55,NULL,151,105,106,'en'),(190,55,NULL,151,107,108,'en'),(191,55,NULL,153,127,128,'en'),(192,55,NULL,153,129,130,'en'),(193,55,NULL,153,131,132,'en'),(194,55,NULL,153,133,134,'en'),(195,55,NULL,153,135,136,'en'),(196,55,NULL,152,111,112,'en'),(197,55,NULL,152,113,114,'en'),(198,55,NULL,152,115,116,'en'),(199,55,NULL,152,117,118,'en'),(200,55,NULL,152,119,120,'en'),(201,55,NULL,152,121,122,'en'),(202,55,NULL,152,123,124,'en'),(203,68,NULL,110,194,195,'en'),(204,40,NULL,110,196,197,'en'),(205,40,NULL,110,198,199,'en'),(206,40,NULL,110,200,201,'en'),(207,40,NULL,110,202,203,'en'),(208,48,NULL,145,61,66,'en'),(209,48,NULL,208,62,63,'en'),(210,48,NULL,208,64,65,'en'),(211,48,NULL,145,67,68,'en'),(212,48,NULL,145,69,70,'en'),(213,48,NULL,145,71,72,'en'),(214,48,NULL,145,73,74,'en'),(215,33,NULL,110,204,205,'en'),(216,33,NULL,110,206,207,'en'),(217,33,NULL,110,208,209,'en'),(218,31,NULL,110,210,211,'en'),(219,31,NULL,110,212,213,'en'),(220,31,NULL,110,214,215,'en'),(221,34,NULL,110,216,217,'en'),(222,34,NULL,110,218,219,'en'),(223,34,NULL,110,220,221,'en'),(224,34,NULL,110,222,223,'en'),(225,34,NULL,110,224,225,'en'),(226,34,NULL,110,226,227,'en'),(227,34,NULL,110,228,229,'en'),(228,41,NULL,110,230,231,'en'),(229,41,NULL,110,232,233,'en'),(230,41,NULL,110,234,235,'en'),(231,41,NULL,110,236,237,'en'),(232,41,NULL,110,238,239,'en'),(233,41,NULL,110,240,241,'en'),(234,41,NULL,110,242,243,'en'),(235,41,NULL,110,244,245,'en'),(236,41,NULL,110,246,247,'en'),(237,41,NULL,110,248,249,'en'),(238,41,NULL,110,250,251,'en'),(239,41,NULL,110,252,253,'en'),(240,38,NULL,110,254,255,'en'),(241,38,NULL,110,256,257,'en'),(242,38,NULL,110,258,259,'en'),(243,38,NULL,110,260,261,'en'),(244,38,NULL,110,262,263,'en'),(245,38,NULL,110,264,265,'en'),(246,38,NULL,110,266,267,'en'),(247,38,NULL,110,268,269,'en'),(248,38,NULL,110,270,271,'en'),(249,38,NULL,110,272,273,'en'),(250,38,NULL,110,274,275,'en'),(251,38,NULL,110,276,277,'en'),(252,38,NULL,110,278,279,'en'),(253,41,NULL,110,280,281,'en'),(254,41,NULL,110,282,283,'en'),(255,41,NULL,110,284,285,'en'),(256,41,NULL,110,286,287,'en'),(257,41,NULL,110,288,289,'en'),(258,41,NULL,110,290,291,'en'),(259,41,NULL,110,292,293,'en'),(260,37,NULL,110,294,295,'en'),(261,50,NULL,110,296,297,'en'),(262,50,NULL,110,298,299,'en'),(263,50,NULL,110,300,301,'en'),(264,50,NULL,110,302,303,'en'),(265,50,NULL,110,304,305,'en'),(266,50,NULL,110,306,307,'en'),(267,50,NULL,110,308,309,'en'),(268,50,NULL,110,310,311,'en'),(269,50,NULL,110,312,313,'en'),(270,50,NULL,110,314,315,'en'),(271,51,NULL,110,316,317,'en'),(272,51,NULL,110,318,319,'en'),(273,51,NULL,110,320,321,'en'),(274,51,NULL,110,322,323,'en'),(275,51,NULL,110,324,325,'en'),(276,51,NULL,110,326,327,'en'),(277,51,NULL,110,328,329,'en'),(278,51,NULL,110,330,331,'en'),(279,52,NULL,110,332,333,'en'),(280,52,NULL,110,334,335,'en'),(281,52,NULL,110,336,337,'en'),(282,52,NULL,110,338,339,'en'),(283,52,NULL,110,340,341,'en'),(284,52,NULL,110,342,343,'en'),(285,34,NULL,110,344,345,'en'),(286,53,NULL,110,346,347,'en'),(287,53,NULL,110,348,349,'en'),(288,53,NULL,110,350,351,'en'),(289,53,NULL,110,352,353,'en'),(290,53,NULL,110,354,355,'en'),(291,53,NULL,110,356,357,'en'),(292,53,NULL,110,358,359,'en'),(293,53,NULL,110,360,361,'en'),(294,53,NULL,110,362,363,'en'),(295,53,NULL,110,364,365,'en'),(296,53,NULL,110,366,367,'en'),(297,54,NULL,110,368,369,'en'),(298,54,NULL,110,370,371,'en'),(299,54,NULL,110,372,373,'en'),(300,54,NULL,110,374,375,'en'),(301,54,NULL,110,376,377,'en'),(302,54,NULL,110,378,379,'en'),(303,54,NULL,110,380,381,'en'),(304,54,NULL,110,382,383,'en'),(305,54,NULL,110,384,385,'en'),(306,54,NULL,110,386,387,'en'),(307,54,NULL,110,388,389,'en'),(308,54,NULL,110,390,391,'en'),(309,43,NULL,110,392,393,'en'),(310,43,NULL,110,394,395,'en'),(311,43,NULL,110,396,397,'en'),(312,43,NULL,110,398,399,'en'),(313,43,NULL,110,400,401,'en'),(314,43,NULL,110,402,403,'en'),(315,62,NULL,110,404,405,'en'),(316,62,NULL,110,406,407,'en'),(317,63,NULL,110,408,409,'en'),(318,63,NULL,110,410,411,'en'),(319,63,NULL,110,412,413,'en'),(320,63,NULL,110,414,415,'en'),(321,64,NULL,110,416,417,'en'),(322,64,NULL,110,418,419,'en'),(323,64,NULL,110,420,421,'en'),(324,65,NULL,110,422,423,'en'),(325,65,NULL,110,424,425,'en'),(326,65,NULL,110,426,427,'en'),(327,66,NULL,110,428,429,'en'),(328,66,NULL,110,430,431,'en'),(329,67,NULL,110,432,433,'en'),(330,67,NULL,110,434,435,'en'),(331,67,NULL,110,436,437,'en'),(332,67,NULL,110,438,439,'en'),(333,67,NULL,110,440,441,'en'),(334,67,NULL,110,442,443,'en'),(335,67,NULL,110,444,445,'en'),(336,69,NULL,110,446,447,'en'),(337,69,NULL,110,448,449,'en'),(338,69,NULL,110,450,451,'en'),(339,70,'isad',110,452,453,'en'),(340,70,'dc',110,454,455,'en'),(341,70,'mods',110,456,457,'en'),(342,70,'rad',110,458,459,'en'),(343,70,'dacs',110,460,461,'en');
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_i18n`
--

DROP TABLE IF EXISTS `term_i18n`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `term_i18n` (
  `name` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id` int(11) NOT NULL,
  `culture` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`culture`),
  CONSTRAINT `term_i18n_FK_1` FOREIGN KEY (`id`) REFERENCES `term` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_i18n`
--

LOCK TABLES `term_i18n` WRITE;
/*!40000 ALTER TABLE `term_i18n` DISABLE KEYS */;
INSERT INTO `term_i18n` VALUES (NULL,110,'en'),('Anlage',111,'de'),('Creation',111,'en'),('Creación',111,'es'),('Production',111,'fr'),('Creación',111,'gl'),('Creazione',111,'it'),('作成',111,'ja'),('შემოქმედება',111,'ka'),('Vervaardig',111,'nl'),('Utworzenie',111,'pl'),('Produção',111,'pt'),('Ustvarjanje',111,'sl'),('การผลิต',111,'th'),('Verwahrung',113,'de'),('Custody',113,'en'),('Custodia',113,'es'),('Conservation',113,'fr'),('Custódia',113,'gl'),('Conservazione',113,'it'),('収蔵状況',113,'ja'),('დაცვა საცავში',113,'ka'),('Beheer',113,'nl'),('Przechowywanie/kuratela',113,'pl'),('Custódia',113,'pt'),('Skrbništvo',113,'sl'),('การจัดเก็บเข้าคลัง',113,'th'),('Veröffentlichung',114,'de'),('Publication',114,'en'),('Publicación',114,'es'),('Publication',114,'fr'),('Publicación',114,'gl'),('Publikasi',114,'id'),('Pubblicazione',114,'it'),('出版物',114,'ja'),('პუბლიკაცია',114,'ka'),('Publicatie',114,'nl'),('Publikacja',114,'pl'),('Publicação',114,'pt'),('Objava',114,'sl'),('การพิมพ์',114,'th'),('Beitrag',115,'de'),('Contribution',115,'en'),('Contribución',115,'es'),('Contribution',115,'fr'),('Contribución',115,'gl'),('Contributo',115,'it'),('貢献',115,'ja'),('დახმარება, ხელშეწყობა',115,'ka'),('Bijdrage',115,'nl'),('Współudział',115,'pl'),('Contribuição',115,'pt'),('Prispevek',115,'sl'),('บริจาค',115,'th'),('Sammlung',117,'de'),('Collection',117,'en'),('Colección',117,'es'),('Collection',117,'fr'),('Colección',117,'gl'),('Koleksi',117,'id'),('Raccolta',117,'it'),('コレクション',117,'ja'),('კოლექცია',117,'ka'),('Collectie',117,'nl'),('Kolekcja',117,'pl'),('Coleção',117,'pt'),('Zbirka',117,'sl'),('คอลเลกชัน',117,'th'),('Bildung',118,'de'),('Accumulation',118,'en'),('Agregación',118,'es'),('Accumulation',118,'fr'),('Acumulación',118,'gl'),('Akumulasi',118,'id'),('Accumulazione',118,'it'),('蓄積',118,'ja'),('აკუმულირება',118,'ka'),('Nagromadzenie zasobu',118,'pl'),('Acumulação',118,'pt'),('Zbiranje',118,'sl'),('การสะสม',118,'th'),('Anmerkung zum Titel (?)',119,'de'),('Title note',119,'en'),('Nota sobre el título',119,'es'),('Note de titre',119,'fr'),('Nota de título',119,'gl'),('Catatan Judul',119,'id'),('Nota al titolo',119,'it'),('タイトル記述',119,'ja'),('სათაურის შენიშვნა',119,'ka'),('Titel aantekening',119,'nl'),('Nota tytułowa',119,'pl'),('Nota ao título',119,'pt'),('Opomba glede naslova',119,'sl'),('หมายเหตุชื่อเรื่อง',119,'th'),('Anmerkung zur Veröffentlichung',120,'de'),('Publication note',120,'en'),('Nota de publicación',120,'es'),('Note de publication',120,'fr'),('Nota de publicación',120,'gl'),('Catatan Publikasi',120,'id'),('Nota di pubblicazione',120,'it'),('出版物の注記',120,'ja'),('პუბლიკაციის შენიშვნა',120,'ka'),('Notitie Publicaties',120,'nl'),('Informacja o publikacji',120,'pl'),('Nota de publicação',120,'pt'),('Nota de publicação',120,'pt_BR'),('Opomba o objavi',120,'sl'),('พื้นที่การพิมพ',120,'th'),('Anmerkung zur Quelle',121,'de'),('Source note',121,'en'),('Nota sobre el origen',121,'es'),('Sources',121,'fr'),('Nota de fonte',121,'gl'),('Catatan sumber',121,'id'),('Nota sulla fonte',121,'it'),('情報源の注記',121,'ja'),('წყაროს შენიშვნა',121,'ka'),('Bron aantekening',121,'nl'),('Nota źródłowa',121,'pl'),('Nota de fonte',121,'pt'),('Opomba o viru',121,'sl'),('หมายเหตุแหล่งที่มา',121,'th'),('Anmerkung zum Umfang',122,'de'),('Scope note',122,'en'),('Nota sobre el alcance',122,'es'),('محدوده نكته',122,'fa'),('Note sur l\'utilisation',122,'fr'),('Nota de alcance',122,'gl'),('Catatan Cakupan',122,'id'),('Nota relativa all\'ambito',122,'it'),('範囲の注記',122,'ja'),('სკოპი და შენიშვნა',122,'ka'),('Notitie toepassingsgebied',122,'nl'),('Nota/uwaga do zakresu',122,'pl'),('Nota de âmbito',122,'pt'),('nota de âmbito',122,'pt_BR'),('Opomba o obsegu',122,'sl'),('ขอบเขตและเนื้อหา - นี่เป็นองค์ประกอบที่จำเป็น',122,'th'),('Anmerkung zur Ansicht',123,'de'),('Display note',123,'en'),('Mostrar nota',123,'es'),('Note d\'affichage',123,'fr'),('Nota de despergue',123,'gl'),('Mostra la nota',123,'it'),('表示の注記',123,'ja'),('შენიშვნის ჩვენება',123,'ka'),('Toon',123,'nl'),('Mostrar nota',123,'pt'),('Prikaži opombo',123,'sl'),('หมายเหตุDisplay',123,'th'),('Anmerkung des Archivars/der Archivarin',124,'de'),('Archivist\'s note',124,'en'),('Nota del archivista',124,'es'),('Note de l\'archiviste',124,'fr'),('Nota do arquiveiro',124,'gl'),('Catatan Arsiparis',124,'id'),('Nota dell\'archivista',124,'it'),('アーキビストの注記',124,'ja'),('არქივისტის შენიშვნა',124,'ka'),('Aantekeningen van de archivaris',124,'nl'),('Uwaga archiwisty',124,'pl'),('Nota do arquivista',124,'pt'),('Nota do arquivista',124,'pt_BR'),('Opomba arhivarja',124,'sl'),('บันทึกของนักจดหมายเหตุ',124,'th'),('Allgemeine Anmerkung',125,'de'),('General note',125,'en'),('Nota general',125,'es'),('Note générale',125,'fr'),('Nota xeral',125,'gl'),('Catatan Umum',125,'id'),('Nota generale',125,'it'),('一般の注記',125,'ja'),('ძირითადი შენიშვნა',125,'ka'),('Algemene aantekening',125,'nl'),('Nota geral',125,'pt'),('Splošna opomba',125,'sl'),('หมายเหตุทั่วไป',125,'th'),('Other Descriptive Data',126,'en'),('Otra Fecha Descriptiva',126,'es'),('Autres données descriptives',126,'fr'),('Outros datos descriptivos',126,'gl'),('Data Deskripsi lain',126,'id'),('Altre informazioni descrittive',126,'it'),('他の記述のデータ',126,'ja'),('სხვა აღწერილობითი ვადა',126,'ka'),('Andere beschrijvingsgegevens.',126,'nl'),('Outros dados descritivos',126,'pt'),('Drugi opisni podatki',126,'sl'),('ข้อมูลทางคำอธิบายอื่นๆ',126,'th'),('Anmerkung zur Instandhaltung(?)',127,'de'),('Maintenance note',127,'en'),('Nota de mantenimiento',127,'es'),('Notes relatives à la mise à jour de la description',127,'fr'),('Nota de mantención',127,'gl'),('Nota sulla manutenzione',127,'it'),('メンテナンス注記',127,'ja'),('მომსახურე, დამხმარე შენიშვნა',127,'ka'),('Onderhoudsaantekening',127,'nl'),('Nota de manutenção',127,'pt'),('Opomba o vzdrževanju',127,'sl'),('หมายเหตุการบำรุงรักษา(Maintenance notes)',127,'th'),('Archivgut',128,'de'),('Archival material',128,'en'),('Documentos y material de archivo',128,'es'),('Documents d\'archives',128,'fr'),('Material de arquivo',128,'gl'),('Material Arsip',128,'id'),('Materiale archivistico',128,'it'),('アーカイブズ資料',128,'ja'),('საარქივო მასალა',128,'ka'),('Archivistisch materaal',128,'nl'),('Materiał archiwalny',128,'pl'),('Acervo arquivístico',128,'pt'),('Arhivsko gradivo',128,'sl'),('เอกสารจดหมายเหตุ',128,'th'),('Veröffentlichung',129,'de'),('Published material',129,'en'),('Material publicado',129,'es'),('Documents publiés',129,'fr'),('Material publicado',129,'gl'),('Materiale edito',129,'it'),('出版資料',129,'ja'),('გამოქვეყნებული მასალა',129,'ka'),('Gepubliceerd materiaal',129,'nl'),('Materiał opublikowany',129,'pl'),('Publicações',129,'pt'),('Objavljeno gradivo',129,'sl'),('เอกสารตีพิมพ์',129,'th'),('Artefakt',130,'de'),('Artefact material',130,'en'),('Material del artefacto',130,'es'),('Artefact',130,'fr'),('Manufatti',130,'it'),('芸術資料',130,'ja'),('ხელნაწერი მასალა',130,'ka'),('Artefact materiaal',130,'nl'),('materiał typu artefakt',130,'pl'),('Material tridimensional',130,'pt'),('Artefakti',130,'sl'),('เอกสารประดิษฐ',130,'th'),('Organisation',131,'de'),('Corporate body',131,'en'),('Entidad colectiva',131,'es'),('Collectivité',131,'fr'),('Entidade coletiva',131,'gl'),('Badan Korporasi',131,'id'),('Ente',131,'it'),('組織体',131,'ja'),('კორპორატიული ორგანო',131,'ka'),('Instelling',131,'nl'),('Entidade coletiva',131,'pt'),('Korporacija',131,'sl'),('นิติบุคคล',131,'th'),('Person',132,'de'),('Person',132,'en'),('Persona',132,'es'),('Personne',132,'fr'),('Persoa',132,'gl'),('Persona',132,'it'),('個人',132,'ja'),('პიროვნება',132,'ka'),('Persoon',132,'nl'),('Osoba',132,'pl'),('Pessoa',132,'pt'),('Oseba',132,'sl'),('บุคคล',132,'th'),('Familie',133,'de'),('Family',133,'en'),('Familia',133,'es'),('Famille',133,'fr'),('Familia',133,'gl'),('Kekerabatan',133,'id'),('Famiglia',133,'it'),('家族',133,'ja'),('ოჯახი',133,'ka'),('Familie',133,'nl'),('FamÃ­lia',133,'pt'),('Družina',133,'sl'),('ครอบครัว',133,'th'),('Audio/Ton-',135,'de'),('Audio',135,'en'),('Audio',135,'es'),('Audio',135,'fr'),('Audio',135,'gl'),('Audio',135,'it'),('視聴覚',135,'ja'),('აუდიო',135,'ka'),('Audio',135,'nl'),('Dźwiękowe/audio',135,'pl'),('Audio',135,'pt'),('Áudio',135,'pt_BR'),('Avdio',135,'sl'),('Bild',136,'de'),('Image',136,'en'),('Imagen',136,'es'),('Image',136,'fr'),('Imaxe',136,'gl'),('Immagine',136,'it'),('イメージ',136,'ja'),('სურათი',136,'ka'),('Afbeelding',136,'nl'),('Imagem',136,'pt'),('Slika',136,'sl'),('Text',137,'de'),('Text',137,'en'),('Texto',137,'es'),('Texte',137,'fr'),('Texto',137,'gl'),('Teks',137,'id'),('Testo',137,'it'),('テキスト',137,'ja'),('ტექსტი',137,'ka'),('Tekst',137,'nl'),('Tekst',137,'pl'),('Texto',137,'pt'),('Texto',137,'pt_BR'),('Besedilo',137,'sl'),('Video',138,'de'),('Video',138,'en'),('Video',138,'es'),('Vidéo',138,'fr'),('Vídeo',138,'gl'),('Video',138,'it'),('ビデオ',138,'ja'),('ვიდეო',138,'ka'),('Video',138,'nl'),('Video',138,'pl'),('Vídeo',138,'pt'),('Vídeo',138,'pt_BR'),('Video',138,'sl'),('Anderes',139,'de'),('Other',139,'en'),('Otro',139,'es'),('Autre',139,'fr'),('Outro',139,'gl'),('Lainnya',139,'id'),('Altro',139,'it'),('他の',139,'ja'),('სხვა',139,'ka'),('Anders',139,'nl'),('Outro',139,'pt'),('Drugo',139,'sl'),('อื่นๆ',139,'th'),('Original',140,'de'),('Master',140,'en'),('Ejemplar original',140,'es'),('Matrice',140,'fr'),('Master',140,'it'),('マスター',140,'ja'),('მფლობელი',140,'ka'),('Master',140,'nl'),('Nadrzędny',140,'pl'),('Mestre',140,'pt'),('Mestre',140,'pt_BR'),('Glavni dokument',140,'sl'),('Verweis',141,'de'),('Reference',141,'en'),('Referencia',141,'es'),('Référence',141,'fr'),('Referencia',141,'gl'),('Riferimento',141,'it'),('レファレンス',141,'ja'),('რეკომენდირებული (დამოწმება)',141,'ka'),('Referentie',141,'nl'),('Sygnatura',141,'pl'),('Referência',141,'pt'),('Referenca',141,'sl'),('อ้างอิง',141,'th'),('Thumbnail',142,'de'),('Thumbnail',142,'en'),('Miniatura',142,'es'),('Imagette',142,'fr'),('Miniatura',142,'gl'),('Miniatura',142,'it'),('サムネイル',142,'ja'),('მინიატურა',142,'ka'),('Thumbnail',142,'nl'),('Miniaturka',142,'pl'),('Icone',142,'pt'),('Icone',142,'pt_BR'),('Predogledna sličica',142,'sl'),('Compound',143,'en'),('Múltiple',143,'es'),('Complexe',143,'fr'),('Composto',143,'gl'),('Composto',143,'it'),('複合',143,'ja'),('ნაერთი',143,'ka'),('Samengesteld',143,'nl'),('Składnik',143,'pl'),('Composto',143,'pt'),('Sestavljenka/Kompleks????',143,'sl'),('ประกอบ',143,'th'),('Aufbewahrungsort',144,'de'),('Location',144,'en'),('Localización',144,'es'),('محل',144,'fa'),('Localisation',144,'fr'),('Ubicación',144,'gl'),('Lokasi',144,'id'),('Ubicazione',144,'it'),('所在',144,'ja'),('ადგილი, ადგილმდებარეობა',144,'ka'),('보관 위치',144,'ko'),('Lokatie',144,'nl'),('Lokalizacja',144,'pl'),('Localização',144,'pt'),('localização',144,'pt_BR'),('Lokacija',144,'sl'),('ตำแหน่ง',144,'th'),('Behältnis',145,'de'),('Container',145,'en'),('Contenedor',145,'es'),('Contenant',145,'fr'),('Contenedor',145,'gl'),('Tempat penyimpanan',145,'id'),('Contenitore',145,'it'),('保存ボックス',145,'ja'),('კონტეინერი ,სათავსი',145,'ka'),('Verpakking',145,'nl'),('Zasobnik',145,'pl'),('Unidade de instalação',145,'pt'),('Tehnična enota',145,'sl'),('ภาชนะ',145,'th'),('Gegenstand',146,'de'),('Artefact',146,'en'),('Artefacto',146,'es'),('Artefact',146,'fr'),('Artefacto',146,'gl'),('Manufatto',146,'it'),('芸術品',146,'ja'),('არტეფაქტი',146,'ka'),('Artefact',146,'nl'),('Artefakt',146,'pl'),('Objeto tridimensional',146,'pt'),('Artefakt',146,'sl'),('สิ่งประดิษฐ(Artefact)์',146,'th'),('besitzt physisches Objekt (?)',147,'de'),('has Physical Object',147,'en'),('has Physical Object',147,'es'),('contient un objet physique',147,'fr'),('como Obxecto físico',147,'gl'),('Memiliki Objek Fisik',147,'id'),('contiene un oggetto fisico',147,'it'),('物理的オブジェクトがあります',147,'ja'),('ფიზიკური ობიექტის ქონა',147,'ka'),('heeft fysiek object',147,'nl'),('ma obiekt fizyczny',147,'pl'),('possui objeto tridimensional',147,'pt'),('ima fizičen predmet',147,'sl'),('วัตถุทางกายภาพ',147,'th'),('Parallelansetzung',148,'de'),('Parallel form',148,'en'),('Forma paralela',148,'es'),('Forme parallèle',148,'fr'),('Forma paralela',148,'gl'),('Bentuk paralel',148,'id'),('Forma parallela',148,'it'),('異なる表記',148,'ja'),('პარალელური ფორმა',148,'ka'),('Parallelle naam',148,'nl'),('Forma paralela',148,'pt'),('Vzporedna oblika',148,'sl'),('แบบฟอร์มเทียบเคียง',148,'th'),('Weiterer Name',149,'de'),('Other form',149,'en'),('Otra forma',149,'es'),('Autre nom',149,'fr'),('Outra forma',149,'gl'),('Format lain',149,'id'),('Altro nome',149,'it'),('他のフォーム',149,'ja'),('სხვა ფორმა',149,'ka'),('Andere naam',149,'nl'),('Outra forma',149,'pt'),('Druga oblika',149,'sl'),('แบบอื่นๆ',149,'th'),('hierarchical',150,'en'),('jerárquica',150,'es'),('hiérarchique',150,'fr'),('xerárquica',150,'gl'),('Hirarki',150,'id'),('gerarchico',150,'it'),('階層',150,'ja'),('იერარქიული',150,'ka'),('hierarchiczny',150,'pl'),('hieráquico',150,'pt'),('hierarhična',150,'sl'),('ลำดับชั้น',150,'th'),('temporal',151,'en'),('temporal',151,'es'),('temporelle',151,'fr'),('temporal',151,'gl'),('sementara',151,'id'),('temporale',151,'it'),('一時的',151,'ja'),('დროებითი',151,'ka'),('świecki',151,'pl'),('temporal',151,'pt'),('začasna',151,'sl'),('Familie',152,'de'),('family',152,'en'),('familia',152,'es'),('famille',152,'fr'),('Familia',152,'gl'),('famiglia',152,'it'),('家族',152,'ja'),('ოჯახი',152,'ka'),('Familie',152,'nl'),('rodzina',152,'pl'),('família',152,'pt'),('družina',152,'sl'),('ครอบครัว',152,'th'),('associative',153,'en'),('asociativa',153,'es'),('d\'association',153,'fr'),('asociativo',153,'gl'),('associativo',153,'it'),('連合の',153,'ja'),('ასოციაციური',153,'ka'),('wiążący',153,'pl'),('associativo',153,'pt'),('povezovalna',153,'sl'),('description',154,'en'),('descripción',154,'es'),('description',154,'fr'),('descrición',154,'gl'),('Deskripsi',154,'id'),('descrizione',154,'it'),('記述',154,'ja'),('აღწერა',154,'ka'),('opis',154,'pl'),('descrição',154,'pt'),('opis',154,'sl'),('editor',154,'th'),('date display',155,'en'),('visualización de fecha',155,'es'),('affichage de la date',155,'fr'),('Tampilan tanggal',155,'id'),('data visualizzata',155,'it'),('データ表示',155,'ja'),('თარიღის ჩვენება',155,'ka'),('prezentacja daty',155,'pl'),('vizualizar data',155,'pt'),('prikaz datuma',155,'sl'),('แสดงวันที่',155,'th'),('alternative label',156,'en'),('etiqueta alternativa',156,'es'),('Autre libellé',156,'fr'),('etiqueta alternativa',156,'gl'),('Etichetta alternativa',156,'it'),('他のラベル',156,'ja'),('ალტერნატიული ეტიკეტი',156,'ka'),('etykieta alternatywna',156,'pl'),('etiqueta alternativa',156,'pt'),('alternativna oznaka',156,'sl'),('associative',157,'en'),('asociativa',157,'es'),('d\'association',157,'fr'),('asociativo',157,'gl'),('associativo',157,'it'),('連合の',157,'ja'),('ასოციაციური',157,'ka'),('wiążący',157,'pl'),('associativo',157,'pt'),('povezovalna',157,'sl'),('Veröffentlichung',158,'de'),('publication',158,'en'),('publicación',158,'es'),('publication',158,'fr'),('publicación',158,'gl'),('Publikasi',158,'id'),('pubblicazione',158,'it'),('出版',158,'ja'),('პუბლიკაცია',158,'ka'),('Publicatie',158,'nl'),('publikacja',158,'pl'),('publicação',158,'pt'),('izdaja',158,'sl'),('การพิมพ์',158,'th'),('Entwurf',159,'de'),('Draft',159,'en'),('Borrador',159,'es'),('Brouillon',159,'fr'),('Borrador',159,'gl'),('Bozza',159,'it'),('原稿',159,'ja'),('დრაფტი',159,'ka'),('Concept',159,'nl'),('Szkic',159,'pl'),('Preliminar',159,'pt'),('Versão preliminar',159,'pt_BR'),('Osnutek',159,'sl'),('Published',160,'en'),('Publicado',160,'es'),('Publié',160,'fr'),('Publicado',160,'gl'),('Terpublikasi',160,'id'),('Pubblicato',160,'it'),('出版された',160,'ja'),('გამოქვეყნებული',160,'ka'),('Gepubliceerd',160,'nl'),('Opublikowano',160,'pl'),('Publicado',160,'pt'),('Publicado',160,'pt_BR'),('Objavljeno',160,'sl'),('ตีพิมพ์',160,'th'),('Zugriffspunkt (Name)',161,'de'),('name access points',161,'en'),('puntos de acceso por autoridad',161,'es'),('دسترسي از طريق نام',161,'fa'),('points d\'accès noms',161,'fr'),('Akses Point \'Nama\'',161,'id'),('punti di accesso per nome',161,'it'),('名称のアクセスポイント',161,'ja'),('დამატებული პუნქტების სახელი',161,'ka'),('naam ontsluitingsterm',161,'nl'),('indeks nazw',161,'pl'),('pontos de acesso - nome',161,'pt'),('imenuj gesla',161,'sl'),('hierarchical',162,'en'),('jerárquica',162,'es'),('hiérarchique',162,'fr'),('xerárquica',162,'gl'),('Hirarki',162,'id'),('gerarchico',162,'it'),('階層',162,'ja'),('იერარქიული',162,'ka'),('hierarchiczny',162,'pl'),('hieráquico',162,'pt'),('hierarhična',162,'sl'),('ลำดับชั้น',162,'th'),('temporal',163,'en'),('temporal',163,'es'),('temporelle',163,'fr'),('temporal',163,'gl'),('sementara',163,'id'),('temporale',163,'it'),('一時的',163,'ja'),('დროებითი',163,'ka'),('świecki',163,'pl'),('temporal',163,'pt'),('začasna',163,'sl'),('associative',164,'en'),('asociativa',164,'es'),('d\'association',164,'fr'),('asociativo',164,'gl'),('associativo',164,'it'),('連合の',164,'ja'),('ასოციაციური',164,'ka'),('wiążący',164,'pl'),('associativo',164,'pt'),('povezovalna',164,'sl'),('Standardansetzung',165,'de'),('Standardized form',165,'en'),('Forma normalizada',165,'es'),('Forme normalisée',165,'fr'),('Forma normalizada',165,'gl'),('Forma normalizzata',165,'it'),('標準形式',165,'ja'),('სტანდარტიზებული ფორმა',165,'ka'),('Genormeerde vorm',165,'nl'),('Forma normalizada',165,'pt'),('Standardizirana oblika',165,'sl'),('รูปแบบมาตรฐาน',165,'th'),('External URI',166,'en'),('URI externo',166,'es'),('URI externe',166,'fr'),('URI externo',166,'gl'),('URI esterno',166,'it'),('外部URI',166,'ja'),('სივრცითი  URI',166,'ka'),('URI externo',166,'pt'),('Zunanji enotni označevalnik vira (URI)',166,'sl'),('Accession',167,'en'),('Ingreso',167,'es'),('Entrée',167,'fr'),('Ingreso',167,'gl'),('Acquisizione',167,'it'),('受入',167,'ja'),('დაშვება',167,'ka'),('Nabycie',167,'pl'),('Incorporação',167,'pt'),('Prevzem gradiva',167,'sl'),('การเข้าถึงเอกสาร',167,'th'),('Right',168,'en'),('Derecho',168,'es'),('Droit',168,'fr'),('Dereito',168,'gl'),('Pemegang Hak',168,'id'),('Diritto',168,'it'),('権利',168,'ja'),('უფლება',168,'ka'),('Recht',168,'nl'),('Uprawnienie',168,'pl'),('Direito',168,'pt'),('Pravica',168,'sl'),('สิทธิ',168,'th'),('Donor',169,'en'),('Donador',169,'es'),('Donateur',169,'fr'),('Donante',169,'gl'),('Donatore',169,'it'),('寄贈者',169,'ja'),('დონორი',169,'ka'),('Schenker',169,'nl'),('Doador',169,'pt'),('Donator',169,'sl'),('ผู้บริจาค',169,'th'),('Copyright',170,'en'),('Derechos de autor',170,'es'),('Droit d\'auteur',170,'fr'),('Copyright',170,'gl'),('Copyright',170,'it'),('著作権',170,'ja'),('საავტორო უფლება',170,'ka'),('Copyright',170,'nl'),('Prawa autorskie',170,'pl'),('Direitos de autor',170,'pt'),('Avtorske pravice',170,'sl'),('ลิขสิทธ',170,'th'),('License',171,'en'),('Licencia',171,'es'),('Licence',171,'fr'),('Licenza',171,'gl'),('Licenza',171,'it'),('ライセンス',171,'ja'),('ლიცენზია',171,'ka'),('Licentie',171,'nl'),('Licença',171,'pt'),('Licenca',171,'sl'),('Statute',172,'en'),('Normativa',172,'es'),('Réglementation',172,'fr'),('Estatuto',172,'gl'),('Statuto',172,'it'),('法令',172,'ja'),('კანონმდებლობითი აქტი , სტატუსი.',172,'ka'),('Statuut',172,'nl'),('Estatuto',172,'pt'),('Statut',172,'sl'),('บทกฎหมาย',172,'th'),('Policy',173,'en'),('Política',173,'es'),('Politique',173,'fr'),('Política',173,'gl'),('Kebijakan',173,'id'),('Politica',173,'it'),('ポリシー',173,'ja'),('პოლისი',173,'ka'),('Beleid',173,'nl'),('Política',173,'pt'),('Pravilo',173,'sl'),('นโยบาย',173,'th'),('Language note',174,'en'),('Nota sobre el idioma',174,'es'),('Note sur la langue',174,'fr'),('Nota de idioma',174,'gl'),('Catatan bahasa',174,'id'),('Nota sulla lingua',174,'it'),('言語の注記',174,'ja'),('ენის შენიშვნა',174,'ka'),('Taal aantekeningen',174,'nl'),('Nota ao idioma',174,'pt'),('Opomba o jeziku',174,'sl'),('หมายเหตุภาษา',174,'th'),('Accrual',175,'en'),('Nuevo ingreso',175,'es'),('Accroissement',175,'fr'),('Acumulación',175,'gl'),('Incremento',175,'it'),('Dopolnjevanje fondov',175,'sl'),('Related material descriptions',176,'en'),('Converse term',177,'en'),('AIP relation',178,'en'),('Artwork component',179,'en'),('Artwork material',180,'en'),('Supporting documentation',181,'en'),('Supporting technology',182,'en'),('is the superior of',183,'en'),('is the subordinate of',184,'en'),('controls',185,'en'),('is controlled by',186,'en'),('is the owner of',187,'en'),('is owned by',188,'en'),('is the predecessor of',189,'en'),('is the successor of',190,'en'),('is the provider of',191,'en'),('is the client of',192,'en'),('is the business partner of',193,'en'),('is the associate of',194,'en'),('is the friend of',195,'en'),('is the parent of',196,'en'),('is the child of',197,'en'),('is the sibling of',198,'en'),('is the spouse of',199,'en'),('is the cousin of',200,'en'),('is the grandparent of',201,'en'),('is the grandchild of',202,'en'),('Donor',203,'en'),('Donador',203,'es'),('Donateur',203,'fr'),('Donante',203,'gl'),('Donatore',203,'it'),('寄贈者',203,'ja'),('დონორი',203,'ka'),('Schenker',203,'nl'),('Doador',203,'pt'),('Donator',203,'sl'),('ผู้บริจาค',203,'th'),('Reproduction',204,'en'),('Reproducción',204,'es'),('Reproduction',204,'fr'),('Reproducción',204,'gl'),('Reproduksi',204,'id'),('Riproduzione',204,'it'),('複製',204,'ja'),('რეპროდუქცია',204,'ka'),('Reproduktie',204,'nl'),('Reprodução',204,'pt'),('Reprodukcija',204,'sl'),('สำเนา',204,'th'),('Verbreitung',205,'de'),('Distribution',205,'en'),('Difusión',205,'es'),('Distribution',205,'fr'),('Distribución',205,'gl'),('Distribuzione',205,'it'),('頒布',205,'ja'),('დისტრიბუცია',205,'ka'),('Distribueren',205,'nl'),('Distribuição',205,'pt'),('Distribuiranje',205,'sl'),('Sendung',206,'de'),('Broadcasting',206,'en'),('Emisión',206,'es'),('Diffusion générale',206,'fr'),('Trasmissione',206,'it'),('放送',206,'ja'),('მაუწყებლობა , რადიომაუწყებლობა',206,'ka'),('Rozgłaszanie/nadawanie',206,'pl'),('Radiodifusão',206,'pt'),('Oddajanje (radio)',206,'sl'),('Herstellung',207,'de'),('Manufacturing',207,'en'),('Fabricación',207,'es'),('Fabrication',207,'fr'),('Industrial',207,'gl'),('Fabbricazione',207,'it'),('製作する',207,'ja'),('კეთება, დამუშავება',207,'ka'),('Fabricação',207,'pt'),('Proizveden',207,'sl'),('การผลิต(Manufacturing)',207,'th'),('Schachtel',208,'de'),('Box',208,'en'),('Caja',208,'es'),('Boîte',208,'fr'),('Caixa',208,'gl'),('Boks',208,'id'),('Scatola',208,'it'),('ボックス',208,'ja'),('ყუთი',208,'ka'),('Doos',208,'nl'),('Pudełko',208,'pl'),('Caixa',208,'pt'),('Škatla',208,'sl'),('กล่อง',208,'th'),('Pappkarton',209,'de'),('Cardboard box',209,'en'),('Caja tipo contenedor',209,'es'),('Boîte en carton',209,'fr'),('Scatola di cartone',209,'it'),('ダンボール箱',209,'ja'),('კარდონის, მუყაოს ყუთი',209,'ka'),('Kaartenbak',209,'nl'),('Pudło tekturowe',209,'pl'),('Caixa',209,'pt'),('Kartonasta škatla',209,'sl'),('กล่องกระดาษแข็ง',209,'th'),('Hollinger box?',210,'de'),('Hollinger box',210,'en'),('Caja estándar de documentos',210,'es'),('Boîte Hollinger',210,'fr'),('Caixa \"Hollinger\"',210,'gl'),('Scatola Hollinger',210,'it'),('Hollingerボックス',210,'ja'),('საარქივო მასალებისთვის',210,'ka'),('Ponskaartendoos',210,'nl'),('Caixa Hollinger',210,'pt'),('Hollingerjeva škatla',210,'sl'),('Umschlag/Mappe',211,'de'),('Folder',211,'en'),('Carpeta',211,'es'),('Chemise',211,'fr'),('Carpeta',211,'gl'),('Busta',211,'it'),('フォルダー',211,'ja'),('ფოლდერი',211,'ka'),('Map',211,'nl'),('Pasta',211,'pt'),('Mapa',211,'sl'),('โฟลเดอร์',211,'th'),('Aktenschrank',212,'de'),('Filing cabinet',212,'en'),('Compacto o archivador',212,'es'),('Classeur',212,'fr'),('Arquivador',212,'gl'),('Classificatore',212,'it'),('フアイルキャビネット',212,'ja'),('კარადა',212,'ka'),('Dossierkast',212,'nl'),('Armário',212,'pt'),('Kartotečni predalnik',212,'sl'),('ตู้เก็บเอกสาร',212,'th'),('Planschrank',213,'de'),('Map cabinet',213,'en'),('Planero',213,'es'),('Classeur pour cartes',213,'fr'),('Cassettiera per mappe',213,'it'),('地図のキャビネット',213,'ja'),('კარადა',213,'ka'),('Kaartenkast',213,'nl'),('Mapoteca',213,'pt'),('Predalnik za zemljevide',213,'sl'),('ตู้แผนท',213,'th'),('Fach',214,'de'),('Shelf',214,'en'),('Estantería',214,'es'),('Tablette',214,'fr'),('Anaquel',214,'gl'),('Rak',214,'id'),('Scaffale',214,'it'),('シェルフ',214,'ja'),('თარო',214,'ka'),('Plank',214,'nl'),('Półka',214,'pl'),('Prateleira',214,'pt'),('Polica',214,'sl'),('หิ้ง',214,'th'),('Final',215,'de'),('Final',215,'en'),('Final',215,'es'),('Finale',215,'fr'),('Final',215,'gl'),('Finale',215,'it'),('最終',215,'ja'),('ბოლო',215,'ka'),('Finale',215,'nl'),('Final',215,'pt'),('Končen',215,'sl'),('ฉบับสุดท้าย',215,'th'),('Überarbeitet',216,'de'),('Revised',216,'en'),('Revisado',216,'es'),('Révisé',216,'fr'),('Revisado',216,'gl'),('Revisi',216,'id'),('Rivisto',216,'it'),('改定された',216,'ja'),('მიღებული',216,'ka'),('Herzien',216,'nl'),('Revisto',216,'pt'),('Pregledano',216,'sl'),('รับปรุง',216,'th'),('Entwurf',217,'de'),('Draft',217,'en'),('Borrador',217,'es'),('Brouillon',217,'fr'),('Borrador',217,'gl'),('Bozza',217,'it'),('原稿',217,'ja'),('დრაფტი',217,'ka'),('Concept',217,'nl'),('Szkic',217,'pl'),('Preliminar',217,'pt'),('Versão preliminar',217,'pt_BR'),('Osnutek',217,'sl'),('Vollständig',218,'de'),('Full',218,'en'),('Completo',218,'es'),('Complet',218,'fr'),('Completo',218,'gl'),('Massimo',218,'it'),('全部',218,'ja'),('სრული',218,'ka'),('Geheel',218,'nl'),('Completo',218,'pt'),('Popoln',218,'sl'),('Teilweise',219,'de'),('Partial',219,'en'),('Parcial',219,'es'),('Moyen',219,'fr'),('Parcial',219,'gl'),('Sebagian',219,'id'),('Intermedio',219,'it'),('一部の',219,'ja'),('ნაწილობრივი',219,'ka'),('Gedeeltelijk',219,'nl'),('Parcial',219,'pt'),('Delen',219,'sl'),('ซึ่งเป็นบางส่วน',219,'th'),('Minimal',220,'de'),('Minimal',220,'en'),('Básico',220,'es'),('Élémentaire',220,'fr'),('Mínimo',220,'gl'),('Minimo',220,'it'),('最低限',220,'ja'),('მინიმალი',220,'ka'),('Minimaal',220,'nl'),('Mínimo',220,'pt'),('Minimalen',220,'sl'),('Sammlung',221,'de'),('Fonds',221,'en'),('Fondo',221,'es'),('collection',221,'fr'),('Fondos',221,'gl'),('Fondo',221,'it'),('フォンド',221,'ja'),('ფონდები',221,'ka'),('Archief',221,'nl'),('Zespoły',221,'pl'),('Fundos',221,'pt'),('Fondi',221,'sl'),('เอกสารระดับกลุ่ม',221,'th'),('Teilbestand',222,'de'),('Subfonds',222,'en'),('Subfondo',222,'es'),('Sous-fonds',222,'fr'),('Sub-fondo',222,'gl'),('Sub-fondo',222,'it'),('サブフォンド',222,'ja'),('ქვეფონდები',222,'ka'),('Deelarchief',222,'nl'),('Subfundos',222,'pt'),('Podfondi',222,'sl'),('ระดับกลุ่มย่อย',222,'th'),('Sammlung',223,'de'),('Collection',223,'en'),('Colección',223,'es'),('Collection',223,'fr'),('Colección',223,'gl'),('Koleksi',223,'id'),('Raccolta',223,'it'),('コレクション',223,'ja'),('კოლექცია',223,'ka'),('Collectie',223,'nl'),('Kolekcja',223,'pl'),('Coleção',223,'pt'),('Zbirka',223,'sl'),('คอลเลกชัน',223,'th'),('Serie',224,'de'),('Series',224,'en'),('Serie',224,'es'),('Série organique',224,'fr'),('Series',224,'gl'),('Serie',224,'it'),('シリーズ',224,'ja'),('სერიები',224,'ka'),('Reeks',224,'nl'),('Séries',224,'pt'),('Serija',224,'sl'),('ระดับชุด',224,'th'),('Teilserie',225,'de'),('Subseries',225,'en'),('Subserie',225,'es'),('Sous-série organique',225,'fr'),('Sub-series',225,'gl'),('Sottoserie',225,'it'),('サブシリーズ',225,'ja'),('ქვე სერიები',225,'ka'),('Deelreeks',225,'nl'),('Subsérie',225,'pt'),('Podserija',225,'sl'),('ระดับชุดย่อย',225,'th'),('Akt',226,'de'),('File',226,'en'),('Unidad documental compuesta',226,'es'),('Dossier',226,'fr'),('Dossier',226,'gl'),('Unità archivistica',226,'it'),('ファイル',226,'ja'),('ფაილი, საქმე',226,'ka'),('Bestanddeel',226,'nl'),('Pasta/Processo',226,'pt'),('Datoteka',226,'sl'),('ไฟล์',226,'th'),('Einzelstück',227,'de'),('Item',227,'en'),('Unidad documental simple',227,'es'),('Pièce',227,'fr'),('Item',227,'gl'),('Unità documentaria',227,'it'),('アイテム',227,'ja'),('პუნქტი',227,'ka'),('Stuk',227,'nl'),('Item',227,'pt'),('Dokument',227,'sl'),('เรื่อง',227,'th'),('Information zum Objekt',228,'de'),('Information object',228,'en'),('Information object',228,'es'),('Description archivistique',228,'fr'),('Obxecto de información',228,'gl'),('Oggetto informativo',228,'it'),('情報オブジェクト',228,'ja'),('საინფორმაციო ობიექტი',228,'ka'),('Informatie object',228,'nl'),('Objeto informacional',228,'pt'),('Informacijski objekt',228,'sl'),('วัตถุข้อมูล(ข้อมูลวัตถุ)',228,'th'),('Person/Einrichtung',229,'de'),('Person/organization',229,'en'),('Persona/organización',229,'es'),('Personne/organisme',229,'fr'),('Persoa/organización',229,'gl'),('Persona/Organizzazione',229,'it'),('個人/機関',229,'ja'),('პიროვნება/ორგანიზაცია',229,'ka'),('Persoon/organisatie',229,'nl'),('Pessoa/organizaÃ§Ã£o',229,'pt'),('Oseba/organizacija',229,'sl'),('บุคคล / องค์การ',229,'th'),('Urheber/Bestandsbildner',230,'de'),('Creator',230,'en'),('Creador',230,'es'),('Producteur',230,'fr'),('Creador',230,'gl'),('Pencipta',230,'id'),('Soggetto produttore',230,'it'),('作成者',230,'ja'),('შემოქმედი',230,'ka'),('Archiefvormer',230,'nl'),('Twórca',230,'pl'),('Produtor',230,'pt'),('Produtor',230,'pt_BR'),('Ustvaril',230,'sl'),('ผู้ผลิตเอกสาร',230,'th'),('Aufbewahrungsort',231,'de'),('Repository',231,'en'),('Institución archivística',231,'es'),('منبع',231,'fa'),('Institution de conservation',231,'fr'),('Repositorio',231,'gl'),('Repositori',231,'id'),('Deposito',231,'it'),('リポジトリ',231,'ja'),('საცავი',231,'ka'),('기록보존소',231,'ko'),('archiefbewaarplaats',231,'nl'),('Repozytorium',231,'pl'),('Entidade detentora',231,'pt'),('Entidade custodiadora',231,'pt_BR'),('Skladišče',231,'sl'),('คลังเก็บ',231,'th'),('Begriff',232,'de'),('Term',232,'en'),('Término',232,'es'),('Terme',232,'fr'),('Termo',232,'gl'),('Istilah',232,'id'),('Termine',232,'it'),('用語',232,'ja'),('ვადა',232,'ka'),('Term',232,'nl'),('Termin',232,'pl'),('Termo',232,'pt'),('Izraz',232,'sl'),('คำศัพท์',232,'th'),('Gegenstand',233,'de'),('Subject',233,'en'),('Materia',233,'es'),('Sujet',233,'fr'),('Tema',233,'gl'),('Subjek',233,'id'),('Soggetto',233,'it'),('主題',233,'ja'),('სუბიექტი (თემა, საგანი, სათაური)',233,'ka'),('주제',233,'ko'),('Onderwerp',233,'nl'),('Temat',233,'pl'),('Assunto',233,'pt'),('Assunto',233,'pt_BR'),('Tematika',233,'sl'),('หัวข้อ',233,'th'),('Sammlung',234,'de'),('Collection',234,'en'),('Colección',234,'es'),('Collection',234,'fr'),('Colección',234,'gl'),('Koleksi',234,'id'),('Raccolta',234,'it'),('コレクション',234,'ja'),('კოლექცია',234,'ka'),('Collectie',234,'nl'),('Kolekcja',234,'pl'),('Coleção',234,'pt'),('Zbirka',234,'sl'),('คอลเลกชัน',234,'th'),('Bestände (?)',235,'de'),('Holdings',235,'en'),('Fondos',235,'es'),('دربرگيرندگي',235,'fa'),('Fonds',235,'fr'),('Fondos',235,'gl'),('Patrimoni',235,'it'),('所蔵',235,'ja'),('ანაბრები',235,'ka'),('Bestanden',235,'nl'),('Zasoby posiadane',235,'pl'),('Acervo',235,'pt'),('Acervo',235,'pt_BR'),('Arhivsko gradivo',235,'sl'),('สถานที่เก็บเอกสาร',235,'th'),('Archivische Beschreibung',236,'de'),('Archival description',236,'en'),('Descripción archivística',236,'es'),('Description archivistique',236,'fr'),('Descrición arquivística',236,'gl'),('Deskripsi Arsip',236,'id'),('Descrizione archivistica',236,'it'),('アーカイブズ記述',236,'ja'),('საარქივო აღწერა',236,'ka'),('Archivistische beschrijving',236,'nl'),('Opis archiwalny',236,'pl'),('Descrição arquivística',236,'pt'),('Arhivski popis',236,'sl'),('คำอธิบายจดหมายเหตุ',236,'th'),('Authority record',237,'en'),('Registro de autoridad',237,'es'),('Notice d\'autorité',237,'fr'),('Rexistro de autoridade',237,'gl'),('Pencipta Arsip',237,'id'),('Record d\'autorità',237,'it'),('典拠レコード',237,'ja'),('ავტორიტეტული ჩანაწერი',237,'ka'),('Geauthoriseerde beschrijving',237,'nl'),('Hasło wzorcowe',237,'pl'),('Registro de autoridade',237,'pt'),('Zapis o ustvarjalcu',237,'sl'),('รายการควบคุม',237,'th'),('Sammlung',238,'de'),('Fonds',238,'en'),('Fondo',238,'es'),('collection',238,'fr'),('Fondos',238,'gl'),('Fondo',238,'it'),('フォンド',238,'ja'),('ფონდები',238,'ka'),('Archief',238,'nl'),('Zespoły',238,'pl'),('Fundos',238,'pt'),('Fondi',238,'sl'),('เอกสารระดับกลุ่ม',238,'th'),('Archiv',239,'de'),('Archival institution',239,'en'),('Institución archivística',239,'es'),('منبع',239,'fa'),('Institution de conservation',239,'fr'),('Institución arquivística',239,'gl'),('Institusi Arsip',239,'id'),('Istituzione archivistica',239,'it'),('アーカイブズ機関',239,'ja'),('საარქივო ინსტიტუცია',239,'ka'),('기록보존소',239,'ko'),('Archiefinstelling',239,'nl'),('Instytucja archiwalna',239,'pl'),('Instituição de arquivo',239,'pt'),('Entidade custodiadora',239,'pt_BR'),('Arhivska ustanova',239,'sl'),('สถาบันจดหมายเหตุ',239,'th'),('International',240,'de'),('International',240,'en'),('Internacional',240,'es'),('International',240,'fr'),('Internacional',240,'gl'),('Internazionale',240,'it'),('国際的',240,'ja'),('საერთაშორისო',240,'ka'),('Internationaal',240,'nl'),('Internacional',240,'pt'),('Mednaroden',240,'sl'),('นานาชาติ',240,'th'),('National',241,'de'),('National',241,'en'),('Nacional',241,'es'),('National',241,'fr'),('Nacional',241,'gl'),('Nazionale',241,'it'),('国家の',241,'ja'),('ეროვნული',241,'ka'),('Nationaal',241,'nl'),('Nacional',241,'pt'),('Narodni',241,'sl'),('ประชาชาติ',241,'th'),('Regional',242,'de'),('Regional',242,'en'),('Regional',242,'es'),('Régional',242,'fr'),('Rexional',242,'gl'),('Regionale',242,'it'),('地域の',242,'ja'),('რეგიონული (რეგიონალური)',242,'ka'),('Regionaal',242,'nl'),('Regionalny',242,'pl'),('Regional',242,'pt'),('Regionalni',242,'sl'),('ทางบริเวณ',242,'th'),('Bundesland/Kanton',243,'de'),('Provincial/state',243,'en'),('Provincial/estatal',243,'es'),('Provincial/d\'État',243,'fr'),('Provincial/estatual',243,'gl'),('Provinsi',243,'id'),('Provinciale/Statale',243,'it'),('県/州',243,'ja'),('პროვინცია/ შტატი',243,'ka'),('Provinciaal',243,'nl'),('Lokalny/krajowy',243,'pl'),('Distrito',243,'pt'),('Regionalni/državni',243,'sl'),('ประจำจังหวัด / รัฐ',243,'th'),('Gemeinschaft',244,'de'),('Community',244,'en'),('Comunidad',244,'es'),('Communautaire',244,'fr'),('Comunitario',244,'gl'),('Comunità',244,'it'),('コミュニティ',244,'ja'),('საზოგადოება',244,'ka'),('Gemeenschap',244,'nl'),('Społeczność',244,'pl'),('Municipal',244,'pt'),('Skupnost',244,'sl'),('ชุมชน',244,'th'),('Religion',245,'de'),('Religious',245,'en'),('Religioso',245,'es'),('Religieux',245,'fr'),('Relixioso',245,'gl'),('Agama',245,'id'),('Religioso',245,'it'),('地域の',245,'ja'),('რელიგიური, სარწმუნოებრივი',245,'ka'),('Religie',245,'nl'),('Religioso',245,'pt'),('Verski',245,'sl'),('เกี่ยวกับศาสนา',245,'th'),('Universität',246,'de'),('University',246,'en'),('Universidad',246,'es'),('Universitaire',246,'fr'),('Universitario',246,'gl'),('Universitas',246,'id'),('Università',246,'it'),('大学',246,'ja'),('უნივერსიტეტი',246,'ka'),('Universiteit',246,'nl'),('Uniwersytet',246,'pl'),('Universidade',246,'pt'),('Univeriteten',246,'sl'),('มหาวิทยาลัย',246,'th'),('Gemeinde',247,'de'),('Municipal',247,'en'),('Municipal',247,'es'),('Municipal',247,'fr'),('Municipal',247,'gl'),('Municipale',247,'it'),('首都の',247,'ja'),('მინიციპალური, საქალაქო',247,'ka'),('Gemeentelijk',247,'nl'),('Municipal',247,'pt'),('Občinski',247,'sl'),('เทศบาล',247,'th'),('Indigen (?)',248,'de'),('Aboriginal',248,'en'),('Aborigen',248,'es'),('Indigène',248,'fr'),('Aborixe',248,'gl'),('Pribumi',248,'id'),('Aborigeno',248,'it'),('元からの',248,'ja'),('ადგილობრივი',248,'ka'),('Autochton',248,'pl'),('Indígena',248,'pt'),('Staroselski',248,'sl'),('Erziehung',249,'de'),('Educational',249,'en'),('Educativo',249,'es'),('Scolaire',249,'fr'),('Educativo',249,'gl'),('Educativo',249,'it'),('教育上の',249,'ja'),('საგანმანათლებლო',249,'ka'),('Escolar',249,'pt'),('Izobraževalen',249,'sl'),('การศึกษา',249,'th'),('medizinisch',250,'de'),('Medical',250,'en'),('Médico',250,'es'),('Médical',250,'fr'),('Médico',250,'gl'),('Medico',250,'it'),('医療の',250,'ja'),('სამედიცინო',250,'ka'),('Medisch',250,'nl'),('Médico',250,'pt'),('Medicinski',250,'sl'),('ทางการแพทย์',250,'th'),('Militär',251,'de'),('Military',251,'en'),('Militar',251,'es'),('Militaire',251,'fr'),('Militar',251,'gl'),('Militare',251,'it'),('軍事の',251,'ja'),('სამხედრო',251,'ka'),('Militair',251,'nl'),('Militarny',251,'pl'),('Militar',251,'pt'),('Vojaški',251,'sl'),('ทหาร',251,'th'),('Privat',252,'de'),('Private',252,'en'),('Persona privada',252,'es'),('Privé',252,'fr'),('Privado',252,'gl'),('Privato',252,'it'),('個人的な',252,'ja'),('პირადი',252,'ka'),('Privaat',252,'nl'),('Prywatny',252,'pl'),('Privado',252,'pt'),('Zasebni',252,'sl'),('เอกชน',252,'th'),('Ort',253,'de'),('Place',253,'en'),('Lugar',253,'es'),('مكان',253,'fa'),('Lieu',253,'fr'),('Lugar',253,'gl'),('Tempat',253,'id'),('Luogo',253,'it'),('場所',253,'ja'),('ადგილი',253,'ka'),('장소',253,'ko'),('Plaats',253,'nl'),('Miejsce',253,'pl'),('Local',253,'pt'),('local',253,'pt_BR'),('Kraj',253,'sl'),('จัด',253,'th'),('Name',254,'de'),('Name',254,'en'),('Nombre',254,'es'),('نام',254,'fa'),('Nom',254,'fr'),('Nome',254,'gl'),('Nama',254,'id'),('Nome',254,'it'),('名称',254,'ja'),('სახელი',254,'ka'),('이름',254,'ko'),('Naam',254,'nl'),('Nazwa',254,'pl'),('Nome',254,'pt'),('nome',254,'pt_BR'),('Ime',254,'sl'),('ชื่อ',254,'th'),('Digitales Objekt',255,'de'),('Digital object',255,'en'),('Objeto digital',255,'es'),('Objet numérique',255,'fr'),('Obxecto dixital',255,'gl'),('Objek Digital',255,'id'),('Oggetto digitale',255,'it'),('ディジタルオブジェクト',255,'ja'),('ციფრული ობიექტი',255,'ka'),('Digitaal object',255,'nl'),('Obiekt cyfrowy',255,'pl'),('Objeto digital',255,'pt'),('Digitalni objekt',255,'sl'),('วัตถุดิจิตอล',255,'th'),('physisches Objekt',256,'de'),('Physical object',256,'en'),('Physical object',256,'es'),('Objet physique',256,'fr'),('Obxecto físico',256,'gl'),('Fisik Objek',256,'id'),('Oggetto fisico',256,'it'),('物理的オブジェクト',256,'ja'),('ფიზიკური ობიექტი',256,'ka'),('fysiek object',256,'nl'),('Objeto tridimensional',256,'pt'),('Fizični objekt',256,'sl'),('วัตถทางกายภาพุ',256,'th'),('Aufbewahrung',257,'de'),('Physical storage',257,'en'),('Unidad de almacenaje',257,'es'),('Localisation physique',257,'fr'),('Almacenamento físico',257,'gl'),('Penyimpanan Fisik',257,'id'),('Deposito',257,'it'),('物理的記憶',257,'ja'),('ფიზიკური საცავი',257,'ka'),('Fysieke opslag',257,'nl'),('Fizyczne miejsce przechowywania',257,'pl'),('Depósito físico',257,'pt'),('Depósito físico',257,'pt_BR'),('Fizična hramba',257,'sl'),('การเก็บเอกสารทางกายภาพ',257,'th'),('Medienart',258,'de'),('Media type',258,'en'),('Tipo de soporte',258,'es'),('نوع رسانه',258,'fa'),('Type de support',258,'fr'),('Tipo de medio',258,'gl'),('Tipo di supporto',258,'it'),('メディア種別',258,'ja'),('მედია ტიპი',258,'ka'),('mediatype',258,'nl'),('Typ medium',258,'pl'),('Tipo de suporte',258,'pt'),('Tipo',258,'pt_BR'),('Vrsta medija',258,'sl'),('ประเภทสื่อ',258,'th'),('Werkzeug für das Open Information Management',259,'de'),('Open Information Management Toolkit',259,'en'),('Open Information Management Toolkit',259,'es'),('Outil ouvert de gestion de l\'information',259,'fr'),('Open Information Management Toolkit',259,'it'),('Information Management Toolkitを開く',259,'ja'),('გახსენით ინფორმაციის მენეჯმენტის კომპლექტი',259,'ka'),('Open Information Management Toolkit',259,'nl'),('Ferramenta aberta de gestão de informação',259,'pt'),('Orodje za upravljanje informacij javnega značaja',259,'sl'),('Anmerkung zur Aufbewahrung',260,'de'),('Conservation note',260,'en'),('Notas de conservación',260,'es'),('Note de conservation',260,'fr'),('Nota de conservación',260,'gl'),('Catatan Konservasi',260,'id'),('Nota sulla conservazione',260,'it'),('保存の注記',260,'ja'),('კონსერვაციის შენიშვნა',260,'ka'),('Opmerkingen conservering',260,'nl'),('Nota konserwatorska',260,'pl'),('Nota de conservação',260,'pt'),('Opomba glede zaščite',260,'sl'),('หมายเหตุการอนุรักษ์',260,'th'),('Architekturzeichnung',261,'de'),('Architectural drawing',261,'en'),('Dibujo arquitectónico',261,'es'),('Dessin d\'architecture',261,'fr'),('Deseño arquitectónico',261,'gl'),('Gambar Teknik',261,'id'),('Disegno architettonico',261,'it'),('建築図面',261,'ja'),('არქიტექტურული ნახაზები',261,'ka'),('Bouwkundige tekening',261,'nl'),('Rysunki architektoniczne - projekty',261,'pl'),('Desenho arquitetónico',261,'pt'),('Arhitekturni načrt',261,'sl'),('Kartografisches Material',262,'de'),('Cartographic material',262,'en'),('Material cartográfico',262,'es'),('Document cartographique',262,'fr'),('Material cartográfico',262,'gl'),('Materi Peta',262,'id'),('Materiale cartografico',262,'it'),('地図資料',262,'ja'),('კარტოგრაფიული მასალები',262,'ka'),('Kartografisch materiaal',262,'nl'),('Materia kartograficzny',262,'pl'),('Material cartográfico',262,'pt'),('Kartografsko gradivo',262,'sl'),('เอกสารุประเภทแผนที่แผนผัง',262,'th'),('Grafik(en)',263,'de'),('Graphic material',263,'en'),('Material gráfico',263,'es'),('Document iconographique',263,'fr'),('Material gráfico',263,'gl'),('Materiale grafico',263,'it'),('グラフィック資料',263,'ja'),('გრაფიკული მასალა',263,'ka'),('Grafisch materiaal',263,'nl'),('Material gráfico',263,'pt'),('Grafično gradivo',263,'sl'),('เอกสารภาพพิมพ์',263,'th'),('Bewegte Bilder (?)',264,'de'),('Moving images',264,'en'),('Moviendo imágenes',264,'es'),('Images en mouvement',264,'fr'),('Imaxes en movemento',264,'gl'),('Immagini in movimento',264,'it'),('画像を移動する',264,'ja'),('სურათების გადმოტანა',264,'ka'),('Bewegend beeld',264,'nl'),('Imagens em movimento',264,'pt'),('Gibljive slike',264,'sl'),('Multimedia',265,'de'),('Multiple media',265,'en'),('Soportes múltiples',265,'es'),('Supports multiples',265,'fr'),('Molteplici tipologie',265,'it'),('マルチメディア',265,'ja'),('მრავალრიცხოვანი, მრავალჯერადი მედია',265,'ka'),('Medium wielokrotne',265,'pl'),('Mútiplos suportes',265,'pt'),('Večkraten nosilec zapisa',265,'sl'),('Objekt',266,'de'),('Object',266,'en'),('Objeto',266,'es'),('Objet',266,'fr'),('Obxecto',266,'gl'),('Oggetto',266,'it'),('オブジェクト',266,'ja'),('ობიექტი',266,'ka'),('Obiekt',266,'pl'),('Objeto',266,'pt'),('Objekt',266,'sl'),('วัตถุ',266,'th'),('Philatelistisches Objekt (Briefmarke?)',267,'de'),('Philatelic record',267,'en'),('Documento filatélico',267,'es'),('Document philatélique',267,'fr'),('rexistro filatélico',267,'gl'),('Arsip surat menyurat',267,'id'),('Documentazione filatelica',267,'it'),('切手コレクション記録',267,'ja'),('ფილატელისტური (კოლექციონერული) ჩანაწერი',267,'ka'),('Documento filatélico',267,'pt'),('Filatelističen zapis',267,'sl'),('การบันทึกหางสะสมแสตมป์ซึ่งเล่นดวงตราไปรษณีย์',267,'th'),('Tonaufnahme',268,'de'),('Sound recording',268,'en'),('Registro sonoro',268,'es'),('Document sonore',268,'fr'),('Gravación sonora',268,'gl'),('Rekaman Suara',268,'id'),('Registrazione sonora',268,'it'),('音声録音',268,'ja'),('ხმის ჩაწერა',268,'ka'),('Geluidsopname',268,'nl'),('Rejestracja dźwięku',268,'pl'),('Documento sonoro',268,'pt'),('Zvočni posnetek',268,'sl'),('การบันทึกเสียง',268,'th'),('Technische Zeichnung',269,'de'),('Technical drawing',269,'en'),('Dibujo técnico',269,'es'),('Dessin technique',269,'fr'),('Debuxo técnico',269,'gl'),('Gambar Teknik',269,'id'),('Disegno tecnico',269,'it'),('設計図',269,'ja'),('ტექნიკური ნახაზი',269,'ka'),('Technische tekening',269,'nl'),('Rysunek techniczny',269,'pl'),('Desenho técnico',269,'pt'),('Tehnični načrt',269,'sl'),('Text',270,'de'),('Textual record',270,'en'),('Documento textual',270,'es'),('Document textuel',270,'fr'),('Rexistro textual',270,'gl'),('Arsip Teks',270,'id'),('Documentazione testuale',270,'it'),('テキストの記録',270,'ja'),('ტექსტური ჩანაწერი',270,'ka'),('Tekst document',270,'nl'),('Akta tekstowe',270,'pl'),('Documento textual',270,'pt'),('Besedilni zapis',270,'sl'),('Ausgabe',271,'de'),('Edition',271,'en'),('Edición',271,'es'),('Édition',271,'fr'),('Edición',271,'gl'),('Edisi',271,'id'),('Edizione',271,'it'),('版次',271,'ja'),('გამოცემა, გამოშვება',271,'ka'),('Wydanie/edycja',271,'pl'),('Edição',271,'pt'),('Izdaja',271,'sl'),('ฉบับพิมพ์',271,'th'),('Physische Beschreibung',272,'de'),('Physical description',272,'en'),('Descripción física',272,'es'),('Description matérielle',272,'fr'),('Descrición física',272,'gl'),('Deskripsi fisik',272,'id'),('Descrizione fisica',272,'it'),('物理的記述',272,'ja'),('ფიზიკური აღწერა',272,'ka'),('Fysieke beschrijving',272,'nl'),('Opis fizyczny',272,'pl'),('Descrição física',272,'pt'),('Descrição física',272,'pt_BR'),('Fizični opis',272,'sl'),('คำอธิบายทางกายภาพ',272,'th'),('Erhaltung',273,'de'),('Conservation',273,'en'),('Conservación',273,'es'),('Conservation',273,'fr'),('Conservación',273,'gl'),('Konservasi',273,'id'),('Conservazione',273,'it'),('保存',273,'ja'),('კონსერვაცია',273,'ka'),('Conservering',273,'nl'),('Konserwacja',273,'pl'),('Conservação',273,'pt'),('Zaščita',273,'sl'),('การอนุรักษ์',273,'th'),('Begleitmaterial',274,'de'),('Accompanying material',274,'en'),('Material complementario',274,'es'),('Documents complémentaires',274,'fr'),('Material que acompaña',274,'gl'),('Materi yang disertakan',274,'id'),('Materiale di accompagnamento',274,'it'),('付属資料',274,'ja'),('თანდართული მასალები',274,'ka'),('Begeleidend materiaal',274,'nl'),('Materiał towarzyszący',274,'pl'),('Material acompanhante',274,'pt'),('Spremljevalno gradivo',274,'sl'),('เอกสารที่เพิ่มเติม',274,'th'),('Herausgeberreihen(?)Reihenwerk(?)',275,'de'),('Publisher\'s series',275,'en'),('Publicaciones seriadas',275,'es'),('Collection',275,'fr'),('Series Penerbit',275,'id'),('Serie editoriale',275,'it'),('出版社のシリーズ',275,'ja'),('გამომცემელთა სერია',275,'ka'),('Seria wydawnicza',275,'pl'),('Editores das publicações',275,'pt'),('Založnikove serije',275,'sl'),('ซีรี่ย์ของผู้ตีพิมพ์',275,'th'),('Alphanumerische Bezeichnungen',276,'de'),('Alpha-numeric designations',276,'en'),('Designaciones alfanuméricas',276,'es'),('Désignations alphanumériques',276,'fr'),('Designacións alfanuméricas',276,'gl'),('Identificazioni alfanumeriche',276,'it'),('文字-数字の指定',276,'ja'),('ანბანური ან ციფრობრივი აღნიშვნა',276,'ka'),('Oznaczenia alfanumeryczne',276,'pl'),('Designações alfanuméricas',276,'pt'),('Črkovno-številčne označbe',276,'sl'),('Rechte',277,'de'),('Rights',277,'en'),('Derechos',277,'es'),('Droits',277,'fr'),('Dereitos',277,'gl'),('Pemegang Hak',277,'id'),('Diritti',277,'it'),('権利',277,'ja'),('უფლებები',277,'ka'),('권한',277,'ko'),('Rechten',277,'nl'),('Prawa',277,'pl'),('Direitos',277,'pt'),('Direitos',277,'pt_BR'),('Pravice',277,'sl'),('สิทธิ',277,'th'),('Allgemeine Anmerkung',278,'de'),('General note',278,'en'),('Nota general',278,'es'),('Note générale',278,'fr'),('Nota xeral',278,'gl'),('Catatan Umum',278,'id'),('Nota generale',278,'it'),('一般の注記',278,'ja'),('ძირითადი შენიშვნა',278,'ka'),('Algemene aantekening',278,'nl'),('Nota geral',278,'pt'),('Splošna opomba',278,'sl'),('หมายเหตุทั่วไป',278,'th'),('Titelvarianten',279,'de'),('Variations in title',279,'en'),('Variantes del título',279,'es'),('Variantes du titre',279,'fr'),('Variacións no título',279,'gl'),('Variasi judul',279,'id'),('Varianti del titolo',279,'it'),('タイトルのバリエーション',279,'ja'),('ვარიაციები(სახესხვაობა) სათაურში',279,'ka'),('Variações no título',279,'pt'),('Variacije naslova',279,'sl'),('Quelle des genauen Titels',280,'de'),('Source of title proper',280,'en'),('Fuente del título',280,'es'),('Source du titre propre',280,'fr'),('Fonte del titolo proprio',280,'it'),('タイトルの情報源',280,'ja'),('წყაროს სათაურის მახასიათებელი',280,'ka'),('Źródło właściwości',280,'pl'),('Fonte do título próprio',280,'pt'),('Izvor dejanskega naslova',280,'sl'),('แหล่งชื่อเรื่อง',280,'th'),('Parallele Titel und andere Informationen zum Titel',281,'de'),('Parallel titles and other title information',281,'en'),('Títulos paralelos y otra información del título',281,'es'),('Titres parallèles et compléments du titre',281,'fr'),('Títulos paralelos ou información adicional do título',281,'gl'),('Judul paralel dan informasi judul lainnya',281,'id'),('Titoli paralleli e altre informazioni sul titolo',281,'it'),('併記されるタイトルと他のタイトル情報',281,'ja'),('პარალელური სათაურები და სხვა სათაურის ინფორმაცია',281,'ka'),('Parallelle titels en andere titelgegevens',281,'nl'),('Títulos paralelos e outra informação do título',281,'pt'),('Vzporedni naslovi in drugi podatki o naslovu',281,'sl'),('ชื่อเอกสารเทียบเคียงและข้อมูลชื่อเอกสารอื่นๆ',281,'th'),('Fortsetzung des Titels',282,'de'),('Continuation of title',282,'en'),('Complementos del título',282,'es'),('Continuation du titre',282,'fr'),('Continuación do título',282,'gl'),('Kelanjutan dari Judul',282,'id'),('Seguito del titolo',282,'it'),('タイトルの連続性',282,'ja'),('სათაურის გაგრძელება, განახლება',282,'ka'),('Vervolg van de titel',282,'nl'),('Kontynuacja tytułu',282,'pl'),('Continuação do título',282,'pt'),('Kontinuiteta naslova',282,'sl'),('ส่วนเพิ่มเติมของชื่อเอกสาร',282,'th'),('Anmerkung zur Verantwortlichkeit',283,'de'),('Statements of responsibility',283,'en'),('Declaraciones de responsabilidad',283,'es'),('Mentions de responsabilité',283,'fr'),('Mencións de responsabilidade',283,'gl'),('Pernyataan penanggungjawab',283,'id'),('Indicazioni di responsabilità',283,'it'),('責任表示',283,'ja'),('განცხადება პასუხუისმგებლობისა',283,'ka'),('Verklaringen van verantwoordelijkheid',283,'nl'),('Menção de responsabilidade',283,'pt'),('Izjave o odgovornosti',283,'sl'),('สถานะความรับผิดชอบ',283,'th'),('Zuordnungen und Vermutungen',284,'de'),('Attributions and conjectures',284,'en'),('Atribuciones y conjeturas',284,'es'),('Attributions et conjectures',284,'fr'),('Atribucións e conxeturas',284,'gl'),('Attibuzioni e congetture',284,'it'),('帰属と推測',284,'ja'),('აბრევიატურები',284,'ka'),('Toeschrijvingen en gissingen',284,'nl'),('Przypisania i domysły',284,'pl'),('Atribuições e conjecturas',284,'pt'),('Pripisovanja in domneve',284,'sl'),('Part',285,'en'),('Parte',285,'es'),('Partiellement',285,'fr'),('Parte',285,'gl'),('Bagian',285,'id'),('Parte',285,'it'),('一部',285,'ja'),('ნაწილი',285,'ka'),('Deel',285,'nl'),('Część',285,'pl'),('Parte',285,'pt'),('Del',285,'sl'),('บางส่วน',285,'th'),('Text',286,'de'),('text',286,'en'),('texto',286,'es'),('Texte',286,'fr'),('texto',286,'gl'),('teks',286,'id'),('testo',286,'it'),('テキスト',286,'ja'),('ტექსტი',286,'ka'),('Tekst',286,'nl'),('tekst',286,'pl'),('texto',286,'pt'),('besedilo',286,'sl'),('cartographic',287,'en'),('cartográfico',287,'es'),('documents cartographiques',287,'fr'),('cartográfico',287,'gl'),('Peta',287,'id'),('cartografico',287,'it'),('地図の',287,'ja'),('კარტოგრაფიული',287,'ka'),('kartograficzny',287,'pl'),('cartográfico',287,'pt'),('kartografsko gradivo',287,'sl'),('ทำแผนที่',287,'th'),('notated music',288,'en'),('partitura/notación musical',288,'es'),('partitions musicales',288,'fr'),('música anotada',288,'gl'),('notazione musicale',288,'it'),('表記された音楽',288,'ja'),('მონიშნული მუსიკა',288,'ka'),('myzyka - zapis nutowy',288,'pl'),('música anotada',288,'pt'),('notirana glasba',288,'sl'),('Tonaufnahme',289,'de'),('sound recording',289,'en'),('registro sonoro',289,'es'),('Enregistrement sonore',289,'fr'),('gravación sonora',289,'gl'),('rekaman suara',289,'id'),('registrazione sonora',289,'it'),('音声録音',289,'ja'),('ხმის ჩაწერა',289,'ka'),('nagrania dźwiękowe',289,'pl'),('registo sonoro',289,'pt'),('zvočni posnetek',289,'sl'),('การบันทึกเสียง',289,'th'),('sound recording - musical',290,'en'),('registro sonoro - musical',290,'es'),('enregistrements sonores - musicaux',290,'fr'),('gravación sonora - musical',290,'gl'),('rekaman suara - musik',290,'id'),('registrazione sonora - musicale',290,'it'),('音声録音 - 音楽',290,'ja'),('ხმის ჩაწერა- მუსიკალურად',290,'ka'),('nagrania dźwiękowe - muzyczne',290,'pl'),('registo sonoro - musical',290,'pt'),('zvočni glasbeni posnetek',290,'sl'),('การบันทึกเสียง - เกี่ยวกับดนตรี',290,'th'),('sound recording - nonmusical',291,'en'),('registro sonoro - no musical',291,'es'),('enregistrements sonores - non musicaux',291,'fr'),('gravación sonora - non musical',291,'gl'),('rekaman suara - nonmusik',291,'id'),('registrazione sonora - non musicale',291,'it'),('音声録音 - 非音楽',291,'ja'),('ხმის ჩაწერა -არამუსიკალურად (არა მუსიკის)',291,'ka'),('nagrania dźwiękowe - niemuzyczne',291,'pl'),('registo sonoro - não musical',291,'pt'),('zvočni neglasbeni posnetek',291,'sl'),('การบันทึกเสียง - ไม่ใช่ดนตรี',291,'th'),('still image',292,'en'),('imagen estátita',292,'es'),('images fixes',292,'fr'),('imaxe fixa',292,'gl'),('gambar tetap',292,'id'),('immagine statica',292,'it'),('静的イメージ',292,'ja'),('ისევ სურათი',292,'ka'),('obrazy nieruchome',292,'pl'),('image fixa',292,'pt'),('statična slika',292,'sl'),('moving image',293,'en'),('imagen en movimiento',293,'es'),('images animées',293,'fr'),('Imaxe en movemento',293,'gl'),('Gambar bergerak',293,'id'),('immagine in movimento',293,'it'),('動画',293,'ja'),('მოძრავი სურათი',293,'ka'),('obraz ruchomy',293,'pl'),('imagem em movimento',293,'pt'),('gibljiva slika',293,'sl'),('three dimensional object',294,'en'),('objeto tridimensional',294,'es'),('objets tridimensionnels',294,'fr'),('Obxecto tridimensional',294,'gl'),('objek tiga dimensi',294,'id'),('oggetto tridimensionale',294,'it'),('三次元オブジェクト',294,'ja'),('სამი სივრცული ობიექტი',294,'ka'),('objekty trójwymiarowe',294,'pl'),('objeto tridimensional',294,'pt'),('tridimenzionalen predmet',294,'sl'),('software, multimedia',295,'en'),('software, multimedia',295,'es'),('logiciels, multimedia',295,'fr'),('software, multimedia',295,'gl'),('software, multimedia',295,'it'),('ソフト、マルチメデイア',295,'ja'),('პროგრამული უზრუნველყოფა, მულტიმედია',295,'ka'),('oprogramowanie, multimedia',295,'pl'),('programas, multimedia',295,'pt'),('programska oprema, multimedija',295,'sl'),('ซอฟต์แวร์, มัลทิมีเดีย',295,'th'),('mixed material',296,'en'),('diversos materiales',296,'es'),('documentation mixte',296,'fr'),('material mixto',296,'gl'),('Material tetap',296,'id'),('materiale misto',296,'it'),('複合資料',296,'ja'),('შერეული მასალები',296,'ka'),('materiał mieszany',296,'pl'),('material diverso',296,'pt'),('mešano gradivo',296,'sl'),('Sammlung',297,'de'),('Collection',297,'en'),('Colección',297,'es'),('Collection',297,'fr'),('Colección',297,'gl'),('Koleksi',297,'id'),('Raccolta',297,'it'),('コレクション',297,'ja'),('კოლექცია',297,'ka'),('Collectie',297,'nl'),('Kolekcja',297,'pl'),('Coleção',297,'pt'),('Zbirka',297,'sl'),('คอลเลกชัน',297,'th'),('dataset',298,'en'),('dataset',298,'es'),('ensemble de données',298,'fr'),('dataset',298,'it'),('データセット',298,'ja'),('მოდემი, მონაცემთა კრებული',298,'ka'),('zestaw danych',298,'pl'),('conjunto de dados',298,'pt'),('nabor podatkov',298,'sl'),('event',299,'en'),('actividad',299,'es'),('événement',299,'fr'),('evento',299,'gl'),('evento',299,'it'),('イベント',299,'ja'),('შემთხვევა',299,'ka'),('zdarzenie',299,'pl'),('evento',299,'pt'),('dogodek',299,'sl'),('เหตุการณ์',299,'th'),('Bild',300,'de'),('image',300,'en'),('imagen',300,'es'),('image',300,'fr'),('imaxe',300,'gl'),('Gambar',300,'id'),('immagine',300,'it'),('画像',300,'ja'),('სურათი',300,'ka'),('Afbeelding',300,'nl'),('obrazek',300,'pl'),('imagem',300,'pt'),('slika',300,'sl'),('interactive resource',301,'en'),('recurso interactivo',301,'es'),('ressource interactive',301,'fr'),('recurso interactivo',301,'gl'),('Sumber Interaktif',301,'id'),('risorsa interattiva',301,'it'),('非アクテイブ資料',301,'ja'),('ინტერაქტიული რესურსი',301,'ka'),('zasób interaktywny',301,'pl'),('recurso interativo',301,'pt'),('interaktiven vir',301,'sl'),('ทรัพยากรinteractive',301,'th'),('moving image',302,'en'),('imagen en movimiento',302,'es'),('images animées',302,'fr'),('Imaxe en movemento',302,'gl'),('Gambar bergerak',302,'id'),('immagine in movimento',302,'it'),('動画',302,'ja'),('მოძრავი სურათი',302,'ka'),('obraz ruchomy',302,'pl'),('imagem em movimento',302,'pt'),('gibljiva slika',302,'sl'),('physisches Objekt',303,'de'),('physical object',303,'en'),('physical object',303,'es'),('objet physique',303,'fr'),('obxecto físico',303,'gl'),('Objek fisik',303,'id'),('oggetto fisico',303,'it'),('物理的オブジェクト',303,'ja'),('ფიზიკური ობიექტი',303,'ka'),('fysiek object',303,'nl'),('obiekt fizyczny',303,'pl'),('objeto tridimensional',303,'pt'),('fizični predmet',303,'sl'),('วัตถุทางกายภาพ',303,'th'),('service',304,'en'),('servicio',304,'es'),('service',304,'fr'),('servizo',304,'gl'),('Layanan',304,'id'),('servizio',304,'it'),('サービス',304,'ja'),('მომსახურება',304,'ka'),('usługa',304,'pl'),('serviço',304,'pt'),('storitev',304,'sl'),('บริการ',304,'th'),('software',305,'en'),('software',305,'es'),('logiciel',305,'fr'),('software',305,'gl'),('software',305,'it'),('ソフトウエア',305,'ja'),('პროგრამული უზრუნველყოფა',305,'ka'),('oprogramowanie',305,'pl'),('programas',305,'pt'),('programska oprema',305,'sl'),('ซอฟต์แวร์',305,'th'),('sound',306,'en'),('sonido',306,'es'),('enregistrement sonore',306,'fr'),('son',306,'gl'),('suara',306,'id'),('suono',306,'it'),('音声',306,'ja'),('ხმა',306,'ka'),('dźwięk',306,'pl'),('som',306,'pt'),('zvok',306,'sl'),('still image',307,'en'),('imagen estátita',307,'es'),('images fixes',307,'fr'),('imaxe fixa',307,'gl'),('gambar tetap',307,'id'),('immagine statica',307,'it'),('静的イメージ',307,'ja'),('ისევ სურათი',307,'ka'),('obrazy nieruchome',307,'pl'),('image fixa',307,'pt'),('statična slika',307,'sl'),('Text',308,'de'),('text',308,'en'),('texto',308,'es'),('Texte',308,'fr'),('texto',308,'gl'),('teks',308,'id'),('testo',308,'it'),('テキスト',308,'ja'),('ტექსტი',308,'ka'),('Tekst',308,'nl'),('tekst',308,'pl'),('texto',308,'pt'),('besedilo',308,'sl'),('Funktion',309,'de'),('Function',309,'en'),('Función',309,'es'),('Fonctions',309,'fr'),('Función',309,'gl'),('Fungsi',309,'id'),('Funzione',309,'it'),('機能',309,'ja'),('ფუნქცია',309,'ka'),('Functie',309,'nl'),('Funkcja',309,'pl'),('Função',309,'pt'),('Funkcija',309,'sl'),('ฟังก์ชั่น',309,'th'),('Subfunction',310,'en'),('Subfunción',310,'es'),('Sous-fonction',310,'fr'),('Subfunción',310,'gl'),('Sottofunzione',310,'it'),('サブ機能',310,'ja'),('ქვე ფუნქცია',310,'ka'),('Deelfunctie',310,'nl'),('Subfunção',310,'pt'),('Podfunkcija',310,'sl'),('ฟังก์ชั่นย่อย',310,'th'),('Business process',311,'en'),('Proceso',311,'es'),('Processus d\'activité',311,'fr'),('Proceso de negocio',311,'gl'),('Bisnis Proses',311,'id'),('Processo',311,'it'),('ビジネスの過程',311,'ja'),('საქმიანი პროცესი',311,'ka'),('Bedrijfsproces',311,'nl'),('Działalność gospodarcza',311,'pl'),('Processo de negócio',311,'pt'),('Delovni proces',311,'sl'),('Activity',312,'en'),('Actividad',312,'es'),('Activité',312,'fr'),('Actividade',312,'gl'),('Aktivitas',312,'id'),('Attività',312,'it'),('活動',312,'ja'),('აქტიურობა',312,'ka'),('Activiteit',312,'nl'),('Aktywność',312,'pl'),('Actividade',312,'pt'),('Aktivnost',312,'sl'),('กิจกรรม',312,'th'),('Task',313,'en'),('Tarea',313,'es'),('Tâche',313,'fr'),('Tarea',313,'gl'),('Compito',313,'it'),('タスク',313,'ja'),('დავალება (ამოცანა)',313,'ka'),('Taak',313,'nl'),('Tarefa',313,'pt'),('Naloga',313,'sl'),('Transaction',314,'en'),('Acción',314,'es'),('Transaction',314,'fr'),('Transacción',314,'gl'),('Transaksi',314,'id'),('Operazione',314,'it'),('取引',314,'ja'),('ტრანზაქცია(საქმის წარმოება, შესრულება)',314,'ka'),('Transakcja',314,'pl'),('Transacção',314,'pt'),('Izmenjava',314,'sl'),('ธุรกรรม',314,'th'),('Public transfer',315,'en'),('Transferencia pública',315,'es'),('Versement d\'archives publiques',315,'fr'),('Transferencia pública',315,'gl'),('Trasferimento pubblico',315,'it'),('公共移転',315,'ja'),('საჯარო ტრანსფერი',315,'ka'),('Przekazanie publiczne',315,'pl'),('Transferência pública',315,'pt'),('Javni prenos',315,'sl'),('โอนย้ายเอกสารสาธารณ',315,'th'),('Private transfer',316,'en'),('Transferencia privada',316,'es'),('Versement d\'archives privées',316,'fr'),('Transferencia privada',316,'gl'),('Trasferimento privato',316,'it'),('個人的な移転',316,'ja'),('პირადი ტრანსფერი',316,'ka'),('Transfer prywatny',316,'pl'),('Transferência privada',316,'pt'),('Zasebni prenos',316,'sl'),('โอนย้ายเอกสารอกชน',316,'th'),('Deposit',317,'en'),('Depósito',317,'es'),('Dépôt',317,'fr'),('Depósito',317,'gl'),('Deposito',317,'it'),('デポジット',317,'ja'),('დეპოზიტი',317,'ka'),('Deponeer',317,'nl'),('Depozyt',317,'pl'),('Depósito',317,'pt'),('Depozit',317,'sl'),('Gift',318,'en'),('Donación',318,'es'),('Don',318,'fr'),('Agasallo',318,'gl'),('Pemberian',318,'id'),('Dono',318,'it'),('寄贈',318,'ja'),('საჩუქარი',318,'ka'),('schenking',318,'nl'),('Oferta',318,'pt'),('Darilo',318,'sl'),('บริจาค',318,'th'),('Purchase',319,'en'),('Compra',319,'es'),('Achat',319,'fr'),('Pembelian',319,'id'),('Acquista',319,'it'),('購入する',319,'ja'),('ყიდვა ,შესყიდვა',319,'ka'),('Aankoop',319,'nl'),('Zakup',319,'pl'),('Aquisição',319,'pt'),('Nakup',319,'sl'),('จัดซื้อ',319,'th'),('Transfer',320,'en'),('Transferencia',320,'es'),('Versement',320,'fr'),('Transferir',320,'gl'),('Transfer',320,'id'),('Trasferimento',320,'it'),('移転',320,'ja'),('ტრანსფერი (გადატანა, გადაცემა)',320,'ka'),('Transfer',320,'pl'),('Transferir',320,'pt'),('Prenos',320,'sl'),('การโอน',320,'th'),('High',321,'en'),('Alta',321,'es'),('Haute',321,'fr'),('Alto',321,'gl'),('Alto',321,'it'),('上位',321,'ja'),('მაღალი',321,'ka'),('Hoog',321,'nl'),('Alta',321,'pt'),('Visoka',321,'sl'),('Medium',322,'en'),('Moderada',322,'es'),('Moyenne',322,'fr'),('Medio',322,'gl'),('Supporto',322,'it'),('中間',322,'ja'),('საშუალო',322,'ka'),('Drager',322,'nl'),('Nośnik',322,'pl'),('Meio',322,'pt'),('Srednja',322,'sl'),('สื่อ',322,'th'),('Low',323,'en'),('Baja',323,'es'),('Basse',323,'fr'),('Baixo',323,'gl'),('Basso',323,'it'),('低い',323,'ja'),('ნელა',323,'ka'),('Laag',323,'nl'),('Baixo',323,'pt'),('Nizka',323,'sl'),('Complete',324,'en'),('Completo',324,'es'),('Complet',324,'fr'),('Completo',324,'gl'),('Completo',324,'it'),('完成する',324,'ja'),('მთლიანი',324,'ka'),('Volledig',324,'nl'),('Ukończony',324,'pl'),('Completo',324,'pt'),('Dokončano',324,'sl'),('ทั้งหมด',324,'th'),('Incomplete',325,'en'),('Incompleto',325,'es'),('Incomplet',325,'fr'),('Incompleto',325,'gl'),('Incompleto',325,'it'),('不完全',325,'ja'),('არასრული, ნაკლული',325,'ka'),('Onvolledig',325,'nl'),('Incompleto',325,'pt'),('Nedokončano',325,'sl'),('In-Progress',326,'en'),('En proceso',326,'es'),('En cours',326,'fr'),('En proceso',326,'gl'),('In corso',326,'it'),('პროგრესში',326,'ka'),('Em progresso',326,'pt'),('V teku',326,'sl'),('Whole',327,'en'),('Entero',327,'es'),('En intégralité',327,'fr'),('Completo',327,'gl'),('Keseluruhan',327,'id'),('Intero',327,'it'),('全部',327,'ja'),('მთელი, მთლიანი',327,'ka'),('Całość',327,'pl'),('No todo',327,'pt'),('Celoten',327,'sl'),('ทั้งหมด',327,'th'),('Part',328,'en'),('Parte',328,'es'),('Partiellement',328,'fr'),('Parte',328,'gl'),('Bagian',328,'id'),('Parte',328,'it'),('一部',328,'ja'),('ნაწილი',328,'ka'),('Deel',328,'nl'),('Część',328,'pl'),('Parte',328,'pt'),('Del',328,'sl'),('บางส่วน',328,'th'),('Löschen',329,'de'),('Delete',329,'en'),('Borrar',329,'es'),('حذف',329,'fa'),('Supprimer',329,'fr'),('Borrar',329,'gl'),('Hapus',329,'id'),('Cancella',329,'it'),('削除',329,'ja'),('წაშლა',329,'ka'),('삭제',329,'ko'),('Verwijderen',329,'nl'),('Usuń',329,'pl'),('Apagar',329,'pt'),('apagar',329,'pt_BR'),('Izbriši',329,'sl'),('ลบ',329,'th'),('Discover',330,'en'),('Mostrar',330,'es'),('Découvrir',330,'fr'),('Descubrir',330,'gl'),('Scopri',330,'it'),('発見する',330,'ja'),('აღმოჩენა',330,'ka'),('Explorar',330,'pt'),('Odkrij',330,'sl'),('Display',331,'en'),('Visualizar',331,'es'),('Afficher',331,'fr'),('Despregue',331,'gl'),('Mostra',331,'it'),('表示する',331,'ja'),('ჩვენება',331,'ka'),('Toon',331,'nl'),('Mostrar',331,'pt'),('Prikaži',331,'sl'),('Disseminate',332,'en'),('Distribuir',332,'es'),('Diffuser',332,'fr'),('Diseminar',332,'gl'),('Diffondi',332,'it'),('普及させる',332,'ja'),('გაფანტვა',332,'ka'),('Verspreiden',332,'nl'),('Difundir',332,'pt'),('Razširi',332,'sl'),('Migrate',333,'en'),('Migrar',333,'es'),('Migrer',333,'fr'),('Migración',333,'gl'),('Migra',333,'it'),('移民',333,'ja'),('მიგრირება',333,'ka'),('Migreren',333,'nl'),('Migruj',333,'pl'),('Migrar',333,'pt'),('Preseli',333,'sl'),('Modify',334,'en'),('Modificar',334,'es'),('Modifier',334,'fr'),('Modificar',334,'gl'),('Modifica',334,'it'),('改変する',334,'ja'),('სახეცვლილება , სახის შეცვლა',334,'ka'),('Wijzig',334,'nl'),('Modyfikuj',334,'pl'),('Modificar',334,'pt'),('Prilagodi',334,'sl'),('Replicate',335,'en'),('Reproducir',335,'es'),('Reproduire',335,'fr'),('Replicar',335,'gl'),('Replica',335,'it'),('複製する',335,'ja'),('გამეორება , ასლიას გადაგება',335,'ka'),('Replicar',335,'pt'),('Reproduciraj',335,'sl'),('ทำสำเนาใหม่',335,'th'),('Under copyright',336,'en'),('Bajo derechos de autor',336,'es'),('Utilisation soumise à copyright',336,'fr'),('Baixo licenza copyright',336,'gl'),('Kewenangan Hak Cipta',336,'id'),('Soggetto a copyright',336,'it'),('著作権の下に',336,'ja'),('საავტორო უფლებით',336,'ka'),('Podlega prawom autorskim',336,'pl'),('Protegido por copyright',336,'pt'),('Zaščiteno z avtorsko pravico',336,'sl'),('ดามลิขสิทธิ์',336,'th'),('Public domain',337,'en'),('Dominio público',337,'es'),('Domaine public',337,'fr'),('Dominio público',337,'gl'),('Dominio pubblico',337,'it'),('パブリックドメイン',337,'ja'),('სახალხო ადგილი',337,'ka'),('Publiek domein',337,'nl'),('Dobro publiczne',337,'pl'),('Domínio público',337,'pt'),('Javna domena',337,'sl'),('Unknown',338,'en'),('Desconocido',338,'es'),('Inconnu',338,'fr'),('Descoñecido',338,'gl'),('Tidak diketahui',338,'id'),('Sconosciuto',338,'it'),('不明の',338,'ja'),('უცნობი',338,'ka'),('Nieznany',338,'pl'),('Desconhecido',338,'pt'),('Neznan',338,'sl'),('ที่ไม่รู้',338,'th'),('ISAD(G), 2. Ausg. hg. Internationaler Archivrat',339,'de'),('ISAD(G), 2nd ed. International Council on Archives',339,'en'),('ISAD(G), 2a ed. Consejo Internacional de Archivos',339,'es'),('ISAD(G), 2e édition, Conseil international des archives',339,'fr'),('ISAD(G), 2da ed. Consello Internacional de Arquivos',339,'gl'),('ISAD(G), 2nd ed. International Council on Archives',339,'it'),('ISAD(G), 2nd ed. საერთაშორისო საბჭო(ორგანიზაცია) არქივების',339,'ka'),('ISAD(G), 2판. ICA 국제기술규칙',339,'ko'),('ISAD(G), II.ed. Międzynarodowa Rada Archiwów',339,'pl'),('ISAD(G), 2ª ed. Conselho Internacional de Arquivos',339,'pt'),('ISAD(G), Conselho Internacional de Arquivos, 2. ed.',339,'pt_BR'),('ISAD(G), 2. izdaja Splošnih mednarodnih standardov za arhivsko popisovanje, Mednarodni arhivski svet',339,'sl'),('Dublin Core, Version 1.1. Dublin Core Metadata Initiative',340,'de'),('Dublin Core, Version 1.1. Dublin Core Metadata Initiative',340,'en'),('Dublin Core, Versión 1.1 Iniciativa de Metadatos Dublin Core',340,'es'),('Dublin Core, version 1.1, Inititative de métadonnées Dublin Core',340,'fr'),('Dublin Core, Versión 1.1 Iniciativa de Metadatos Dublin Core',340,'gl'),('Dublin Core, Version 1.1. Dublin Core Metadata Initiative',340,'it'),('დაბლინ კორ მეტამონაცემების ელემენტთა სიმრავლე, ვერსია 1.1 ის ინიციატივა',340,'ka'),('더블린코어(Dublin Core) 1.1판. 더블린코어 메타데이터 이니시에이티브(DCMI)',340,'ko'),('Dublin Core, Wersja 1.1. Dublin Core Metadata Initiative',340,'pl'),('Dublin Core, Versão 1.1. Dublin Core Metadata Initiative',340,'pt'),('Dublin Core, Versão 1.1. Dublin Core Metadata Initiative',340,'pt_BR'),('Dublin Core, verzija 1.1., Iniciativa o metapodatkih Dublin Core (DCMI)',340,'sl'),('MODS, Version 3.3. U.S. Library of Congress',341,'en'),('MODS, Versión 3.3 Biblioteca del Congreso de los Estados Unidos',341,'es'),('MODS, version 3.3, Bibliothèque du Congrès',341,'fr'),('MODS, Versión 3.3 Biblioteca do Congreso dos Estados Unidos',341,'gl'),('MODS, Version 3.3. U.S. Library of Congress',341,'it'),('MODS, ვერსია 3.3 ა.შ.შ-ს კონგრესის ბიბლიოთეკა',341,'ka'),('MODS, 3.3판. 미국 의회도서관 메타데이터 객체 기술스키마',341,'ko'),('MODS, Wersja 3.3. U.S. Biblioteka Kongresu',341,'pl'),('MODS, Versão 3.3. U.S. da Biblioteca do Congresso',341,'pt'),('MODS, Versão 3.3. U.S. Library of Congress',341,'pt_BR'),('MODS, verzija 3.3., ameriška kongresna knjižnica',341,'sl'),('RAD, July 2008 version. Canadian Council of Archives',342,'de'),('RAD, July 2008 version. Canadian Council of Archives',342,'en'),('RAD, versión Julio 2008. Consejo Canadiense de Archivos',342,'es'),('RDDA, version de juillet 2008, Conseil canadien des archives',342,'fr'),('RAD, versión Xullo 2008. Consello Canadiano de arquivos',342,'gl'),('RAD, July 2008 version. Canadian Council of Archives',342,'it'),('RAD 2008 წლის ვერსია',342,'ka'),('RAD(보존기록기술규칙), 2008년 7월판. 캐나다 아카이브즈협회(CCA)',342,'ko'),('RAD, wersja luty 2008. Kanadyjska Rada Archiwów',342,'pl'),('RAD, versão Julho 2008. Conselho Canadiano de Arquivos',342,'pt'),('RAD, versão jul. 2008. Canadian Council of Archives',342,'pt_BR'),('RAD, verzija iz julija 2008, Kanadski arhivski svet (Canadian Council of Archives)',342,'sl'),('DACS, 2nd ed. Society of American Archivists',343,'en'),('DACS, 2a ed. Society of American Archivists',343,'es'),('DACS, 2e éd., Société des archivistes américains',343,'fr'),('DACS, 2nd ed. Society of American Archivists',343,'gl'),('DACS, 2nd ed. Society of American Archivists',343,'it'),('Arhivsko popisovanje: vsebinski standard (DACS), 2. izdaja, Društvo ameriških arhivistov',343,'sl');
/*!40000 ALTER TABLE `term_i18n` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sha1_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  CONSTRAINT `user_FK_1` FOREIGN KEY (`id`) REFERENCES `actor` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (357,'demo','demo@example.com','0ef14fd190b76a1d32bc90d5d80819b0b1ec41fa','c37b2d8bc7e5055b130ae4996b8905e5',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-22 14:41:45
