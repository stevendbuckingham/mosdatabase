-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: mosquito
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu18.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add compound',1,'add_compound'),(2,'Can change compound',1,'change_compound'),(3,'Can delete compound',1,'delete_compound'),(4,'Can add experiment',2,'add_experiment'),(5,'Can change experiment',2,'change_experiment'),(6,'Can delete experiment',2,'delete_experiment'),(7,'Can add genotype',3,'add_genotype'),(8,'Can change genotype',3,'change_genotype'),(9,'Can delete genotype',3,'delete_genotype'),(10,'Can add measurement',4,'add_measurement'),(11,'Can change measurement',4,'change_measurement'),(12,'Can delete measurement',4,'delete_measurement'),(13,'Can add measurement method',5,'add_measurementmethod'),(14,'Can change measurement method',5,'change_measurementmethod'),(15,'Can delete measurement method',5,'delete_measurementmethod'),(16,'Can add movie file',6,'add_moviefile'),(17,'Can change movie file',6,'change_moviefile'),(18,'Can delete movie file',6,'delete_moviefile'),(19,'Can add plate key',7,'add_platekey'),(20,'Can change plate key',7,'change_platekey'),(21,'Can delete plate key',7,'delete_platekey'),(22,'Can add plate layout',8,'add_platelayout'),(23,'Can change plate layout',8,'change_platelayout'),(24,'Can delete plate layout',8,'delete_platelayout'),(25,'Can add species',9,'add_species'),(26,'Can change species',9,'change_species'),(27,'Can delete species',9,'delete_species'),(28,'Can add log entry',10,'add_logentry'),(29,'Can change log entry',10,'change_logentry'),(30,'Can delete log entry',10,'delete_logentry'),(31,'Can add permission',11,'add_permission'),(32,'Can change permission',11,'change_permission'),(33,'Can delete permission',11,'delete_permission'),(34,'Can add group',12,'add_group'),(35,'Can change group',12,'change_group'),(36,'Can delete group',12,'delete_group'),(37,'Can add user',13,'add_user'),(38,'Can change user',13,'change_user'),(39,'Can delete user',13,'delete_user'),(40,'Can add content type',14,'add_contenttype'),(41,'Can change content type',14,'change_contenttype'),(42,'Can delete content type',14,'delete_contenttype'),(43,'Can add session',15,'add_session'),(44,'Can change session',15,'change_session'),(45,'Can delete session',15,'delete_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$b2kcJR5OUdhy$AWPnaw31ys0qgfCQNTLSl9Y/4X/xRCpAegQPtON9uxg=','2018-06-28 15:43:03.903816',1,'steven','','','steven.buckingham@ucl.ac.uk',1,1,'2018-06-28 15:42:42.526465');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2018-06-28 15:50:39.363810','1','Aedes aegyptii',1,'[{\"added\": {}}]',9,1),(2,'2018-06-28 15:50:52.271704','1','Cayman',1,'[{\"added\": {}}]',3,1),(3,'2018-06-28 15:51:00.917266','2','New Orleans',1,'[{\"added\": {}}]',3,1),(4,'2018-06-28 15:51:07.454440','2','Anopheles gambiae',1,'[{\"added\": {}}]',9,1),(5,'2018-06-28 15:51:12.607294','3','G',1,'[{\"added\": {}}]',3,1),(6,'2018-06-28 15:51:18.895360','4','T',1,'[{\"added\": {}}]',3,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (10,'admin','logentry'),(12,'auth','group'),(11,'auth','permission'),(13,'auth','user'),(14,'contenttypes','contenttype'),(1,'mosdb','compound'),(2,'mosdb','experiment'),(3,'mosdb','genotype'),(4,'mosdb','measurement'),(5,'mosdb','measurementmethod'),(6,'mosdb','moviefile'),(7,'mosdb','platekey'),(8,'mosdb','platelayout'),(9,'mosdb','species'),(15,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2018-06-28 15:41:55.668445'),(2,'auth','0001_initial','2018-06-28 15:42:01.095857'),(3,'admin','0001_initial','2018-06-28 15:42:02.285318'),(4,'admin','0002_logentry_remove_auto_add','2018-06-28 15:42:02.312921'),(5,'contenttypes','0002_remove_content_type_name','2018-06-28 15:42:02.979404'),(6,'auth','0002_alter_permission_name_max_length','2018-06-28 15:42:03.046990'),(7,'auth','0003_alter_user_email_max_length','2018-06-28 15:42:03.114604'),(8,'auth','0004_alter_user_username_opts','2018-06-28 15:42:03.142321'),(9,'auth','0005_alter_user_last_login_null','2018-06-28 15:42:03.497718'),(10,'auth','0006_require_contenttypes_0002','2018-06-28 15:42:03.519916'),(11,'auth','0007_alter_validators_add_error_messages','2018-06-28 15:42:03.554016'),(12,'auth','0008_alter_user_username_max_length','2018-06-28 15:42:03.765857'),(13,'auth','0009_alter_user_last_name_max_length','2018-06-28 15:42:03.833911'),(14,'mosdb','0001_initial','2018-06-28 15:42:09.730093'),(15,'mosdb','0002_auto_20180628_1535','2018-06-28 15:42:11.411512'),(16,'sessions','0001_initial','2018-06-28 15:42:11.758828');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('hwemi0znswgp2rweurlnrixjwjme551j','Zjc2Y2VmZGE1MmNiNmI1Y2Q0NWUwY2NmNjg2N2ZhMGEzOTJjNmY1YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5NmFhMGM5ZWQ3NTViYjViZDhmNWQ4NTZlMjQ1YTJlMDkyM2NhNmY5In0=','2018-07-12 15:43:03.926376');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mosdb_compound`
--

DROP TABLE IF EXISTS `mosdb_compound`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mosdb_compound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mosdb_compound`
--

LOCK TABLES `mosdb_compound` WRITE;
/*!40000 ALTER TABLE `mosdb_compound` DISABLE KEYS */;
INSERT INTO `mosdb_compound` VALUES (1,'Fipronil'),(2,'Imidacloprid'),(3,'DMSO'),(4,'Abamectin'),(5,'Deltamethrin'),(6,'Temephos');
/*!40000 ALTER TABLE `mosdb_compound` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mosdb_experiment`
--

DROP TABLE IF EXISTS `mosdb_experiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mosdb_experiment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `plateLayout_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mosdb_experiment_plateLayout_id_78ca6ed6_fk_mosdb_platelayout_id` (`plateLayout_id`),
  CONSTRAINT `mosdb_experiment_plateLayout_id_78ca6ed6_fk_mosdb_platelayout_id` FOREIGN KEY (`plateLayout_id`) REFERENCES `mosdb_platelayout` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mosdb_experiment`
--

LOCK TABLES `mosdb_experiment` WRITE;
/*!40000 ALTER TABLE `mosdb_experiment` DISABLE KEYS */;
INSERT INTO `mosdb_experiment` VALUES (102,'160122','0016-01-22',2514);
/*!40000 ALTER TABLE `mosdb_experiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mosdb_genotype`
--

DROP TABLE IF EXISTS `mosdb_genotype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mosdb_genotype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `long_name` varchar(100) NOT NULL,
  `short_name` varchar(1) NOT NULL,
  `species_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mosdb_genotype_species_id_0c7e91f3_fk_mosdb_species_id` (`species_id`),
  CONSTRAINT `mosdb_genotype_species_id_0c7e91f3_fk_mosdb_species_id` FOREIGN KEY (`species_id`) REFERENCES `mosdb_species` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mosdb_genotype`
--

LOCK TABLES `mosdb_genotype` WRITE;
/*!40000 ALTER TABLE `mosdb_genotype` DISABLE KEYS */;
INSERT INTO `mosdb_genotype` VALUES (1,'Cayman','C',1),(2,'New Orleans','N',1),(3,'G','G',2),(4,'T','T',2);
/*!40000 ALTER TABLE `mosdb_genotype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mosdb_measurement`
--

DROP TABLE IF EXISTS `mosdb_measurement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mosdb_measurement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `readout` double NOT NULL,
  `measurementMethod_id` int(11) DEFAULT NULL,
  `movie_file_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mosdb_measurement_measurementMethod_id_8993d4c9_fk_mosdb_mea` (`measurementMethod_id`),
  KEY `mosdb_measurement_movie_file_id_768acaaa_fk_mosdb_moviefile_id` (`movie_file_id`),
  CONSTRAINT `mosdb_measurement_measurementMethod_id_8993d4c9_fk_mosdb_mea` FOREIGN KEY (`measurementMethod_id`) REFERENCES `mosdb_measurementmethod` (`id`),
  CONSTRAINT `mosdb_measurement_movie_file_id_768acaaa_fk_mosdb_moviefile_id` FOREIGN KEY (`movie_file_id`) REFERENCES `mosdb_moviefile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mosdb_measurement`
--

LOCK TABLES `mosdb_measurement` WRITE;
/*!40000 ALTER TABLE `mosdb_measurement` DISABLE KEYS */;
/*!40000 ALTER TABLE `mosdb_measurement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mosdb_measurementmethod`
--

DROP TABLE IF EXISTS `mosdb_measurementmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mosdb_measurementmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `script` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mosdb_measurementmethod`
--

LOCK TABLES `mosdb_measurementmethod` WRITE;
/*!40000 ALTER TABLE `mosdb_measurementmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `mosdb_measurementmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mosdb_moviefile`
--

DROP TABLE IF EXISTS `mosdb_moviefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mosdb_moviefile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exposure` int(10) unsigned NOT NULL,
  `replicate` int(10) unsigned NOT NULL,
  `filename` varchar(500) NOT NULL,
  `experiment_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mosdb_moviefile_experiment_id_38cecadc_fk_mosdb_experiment_id` (`experiment_id`),
  CONSTRAINT `mosdb_moviefile_experiment_id_38cecadc_fk_mosdb_experiment_id` FOREIGN KEY (`experiment_id`) REFERENCES `mosdb_experiment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=691 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mosdb_moviefile`
--

LOCK TABLES `mosdb_moviefile` WRITE;
/*!40000 ALTER TABLE `mosdb_moviefile` DISABLE KEYS */;
INSERT INTO `mosdb_moviefile` VALUES (684,0,1,'/media/steven/Ca_Backup/mosquito/160122/0min drug 10ms 1/0min drug 10ms 1_MMStack.ome.tif',102),(685,0,2,'/media/steven/Ca_Backup/mosquito/160122/0min drug 10ms 2/0min drug 10ms 2_MMStack.ome.tif',102),(686,0,3,'/media/steven/Ca_Backup/mosquito/160122/0min drug 10ms 3/0min drug 10ms 3_MMStack.ome.tif',102),(687,0,4,'/media/steven/Ca_Backup/mosquito/160122/0min drug 10ms 4/0min drug 10ms 4_MMStack.ome.tif',102),(688,0,5,'/media/steven/Ca_Backup/mosquito/160122/0min drug 10ms 5/0min drug 10ms 5_MMStack.ome.tif',102),(689,10,1,'/media/steven/Ca_Backup/mosquito/160122/10min drug 10ms 1/10min drug 10ms 1_MMStack.ome.tif',102),(690,10,2,'/media/steven/Ca_Backup/mosquito/160122/10min drug 10ms 2/10min drug 10ms 2_MMStack.ome.tif',102);
/*!40000 ALTER TABLE `mosdb_moviefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mosdb_platekey`
--

DROP TABLE IF EXISTS `mosdb_platekey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mosdb_platekey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `row` varchar(1) NOT NULL,
  `column` int(10) unsigned NOT NULL,
  `concentration` double DEFAULT NULL,
  `compound_id` int(11) DEFAULT NULL,
  `genotype_id` int(11) DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mosdb_platekey_compound_id_73edbfcb_fk_mosdb_compound_id` (`compound_id`),
  KEY `mosdb_platekey_genotype_id_099510f6_fk_mosdb_genotype_id` (`genotype_id`),
  KEY `mosdb_platekey_layout_id_6e8867b3_fk_mosdb_platelayout_id` (`layout_id`),
  CONSTRAINT `mosdb_platekey_compound_id_73edbfcb_fk_mosdb_compound_id` FOREIGN KEY (`compound_id`) REFERENCES `mosdb_compound` (`id`),
  CONSTRAINT `mosdb_platekey_genotype_id_099510f6_fk_mosdb_genotype_id` FOREIGN KEY (`genotype_id`) REFERENCES `mosdb_genotype` (`id`),
  CONSTRAINT `mosdb_platekey_layout_id_6e8867b3_fk_mosdb_platelayout_id` FOREIGN KEY (`layout_id`) REFERENCES `mosdb_platelayout` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7283 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mosdb_platekey`
--

LOCK TABLES `mosdb_platekey` WRITE;
/*!40000 ALTER TABLE `mosdb_platekey` DISABLE KEYS */;
INSERT INTO `mosdb_platekey` VALUES (6947,'A',3,0,3,4,2514),(6948,'B',3,0,3,4,2514),(6949,'C',3,0,3,4,2514),(6950,'D',3,0,3,4,2514),(6951,'E',3,0,3,4,2514),(6952,'F',3,0,3,4,2514),(6953,'G',3,0,3,4,2514),(6954,'H',3,0,3,4,2514),(6955,'A',4,0.00001,5,4,2514),(6956,'B',4,0.000002,5,4,2514),(6957,'C',4,0.0000004,5,4,2514),(6958,'D',4,0.00000008,5,4,2514),(6959,'E',4,0.000000016,5,4,2514),(6960,'F',4,0.0000000032,5,4,2514),(6961,'G',4,0.00000000064,5,4,2514),(6962,'H',4,0.000000000128,5,4,2514),(6963,'A',5,0.00001,6,4,2514),(6964,'B',5,0.000002,6,4,2514),(6965,'C',5,0.0000004,6,4,2514),(6966,'D',5,0.00000008,6,4,2514),(6967,'E',5,0.000000016,6,4,2514),(6968,'F',5,0.0000000032,6,4,2514),(6969,'G',5,0.00000000064,6,4,2514),(6970,'H',5,0.000000000128,6,4,2514),(6971,'A',6,0,3,3,2514),(6972,'B',6,0,3,3,2514),(6973,'C',6,0,3,3,2514),(6974,'D',6,0,3,3,2514),(6975,'E',6,0,3,3,2514),(6976,'F',6,0,3,3,2514),(6977,'G',6,0,3,3,2514),(6978,'H',6,0,3,3,2514),(6979,'A',7,0.00001,5,3,2514),(6980,'B',7,0.000002,5,3,2514),(6981,'C',7,0.0000004,5,3,2514),(6982,'D',7,0.00000008,5,3,2514),(6983,'E',7,0.000000016,5,3,2514),(6984,'F',7,0.0000000032,5,3,2514),(6985,'G',7,0.00000000064,5,3,2514),(6986,'H',7,0.000000000128,5,3,2514),(6987,'A',8,0.00001,6,3,2514),(6988,'B',8,0.000002,6,3,2514),(6989,'C',8,0.0000004,6,3,2514),(6990,'D',8,0.00000008,6,3,2514),(6991,'E',8,0.000000016,6,3,2514),(6992,'F',8,0.0000000032,6,3,2514),(6993,'G',8,0.00000000064,6,3,2514),(6994,'H',8,0.000000000128,6,3,2514),(6995,'A',3,0,3,4,2515),(6996,'B',3,0,3,4,2515),(6997,'C',3,0,3,4,2515),(6998,'D',3,0,3,4,2515),(6999,'E',3,0,3,4,2515),(7000,'F',3,0,3,4,2515),(7001,'G',3,0,3,4,2515),(7002,'H',3,0,3,4,2515),(7003,'A',4,0.00001,5,4,2515),(7004,'B',4,0.000002,5,4,2515),(7005,'C',4,0.0000004,5,4,2515),(7006,'D',4,0.00000008,5,4,2515),(7007,'E',4,0.000000016,5,4,2515),(7008,'F',4,0.0000000032,5,4,2515),(7009,'G',4,0.00000000064,5,4,2515),(7010,'H',4,0.000000000128,5,4,2515),(7011,'A',5,0.00001,6,4,2515),(7012,'B',5,0.000002,6,4,2515),(7013,'C',5,0.0000004,6,4,2515),(7014,'D',5,0.00000008,6,4,2515),(7015,'E',5,0.000000016,6,4,2515),(7016,'F',5,0.0000000032,6,4,2515),(7017,'G',5,0.00000000064,6,4,2515),(7018,'H',5,0.000000000128,6,4,2515),(7019,'A',6,0,3,3,2515),(7020,'B',6,0,3,3,2515),(7021,'C',6,0,3,3,2515),(7022,'D',6,0,3,3,2515),(7023,'E',6,0,3,3,2515),(7024,'F',6,0,3,3,2515),(7025,'G',6,0,3,3,2515),(7026,'H',6,0,3,3,2515),(7027,'A',7,0.00001,5,3,2515),(7028,'B',7,0.000002,5,3,2515),(7029,'C',7,0.0000004,5,3,2515),(7030,'D',7,0.00000008,5,3,2515),(7031,'E',7,0.000000016,5,3,2515),(7032,'F',7,0.0000000032,5,3,2515),(7033,'G',7,0.00000000064,5,3,2515),(7034,'H',7,0.000000000128,5,3,2515),(7035,'A',8,0.00001,6,3,2515),(7036,'B',8,0.000002,6,3,2515),(7037,'C',8,0.0000004,6,3,2515),(7038,'D',8,0.00000008,6,3,2515),(7039,'E',8,0.000000016,6,3,2515),(7040,'F',8,0.0000000032,6,3,2515),(7041,'G',8,0.00000000064,6,3,2515),(7042,'H',8,0.000000000128,6,3,2515),(7043,'A',3,0,3,4,2516),(7044,'B',3,0,3,4,2516),(7045,'C',3,0,3,4,2516),(7046,'D',3,0,3,4,2516),(7047,'E',3,0,3,4,2516),(7048,'F',3,0,3,4,2516),(7049,'G',3,0,3,4,2516),(7050,'H',3,0,3,4,2516),(7051,'A',4,0.00001,5,4,2516),(7052,'B',4,0.000002,5,4,2516),(7053,'C',4,0.0000004,5,4,2516),(7054,'D',4,0.00000008,5,4,2516),(7055,'E',4,0.000000016,5,4,2516),(7056,'F',4,0.0000000032,5,4,2516),(7057,'G',4,0.00000000064,5,4,2516),(7058,'H',4,0.000000000128,5,4,2516),(7059,'A',5,0.00001,6,4,2516),(7060,'B',5,0.000002,6,4,2516),(7061,'C',5,0.0000004,6,4,2516),(7062,'D',5,0.00000008,6,4,2516),(7063,'E',5,0.000000016,6,4,2516),(7064,'F',5,0.0000000032,6,4,2516),(7065,'G',5,0.00000000064,6,4,2516),(7066,'H',5,0.000000000128,6,4,2516),(7067,'A',6,0,3,3,2516),(7068,'B',6,0,3,3,2516),(7069,'C',6,0,3,3,2516),(7070,'D',6,0,3,3,2516),(7071,'E',6,0,3,3,2516),(7072,'F',6,0,3,3,2516),(7073,'G',6,0,3,3,2516),(7074,'H',6,0,3,3,2516),(7075,'A',7,0.00001,5,3,2516),(7076,'B',7,0.000002,5,3,2516),(7077,'C',7,0.0000004,5,3,2516),(7078,'D',7,0.00000008,5,3,2516),(7079,'E',7,0.000000016,5,3,2516),(7080,'F',7,0.0000000032,5,3,2516),(7081,'G',7,0.00000000064,5,3,2516),(7082,'H',7,0.000000000128,5,3,2516),(7083,'A',8,0.00001,6,3,2516),(7084,'B',8,0.000002,6,3,2516),(7085,'C',8,0.0000004,6,3,2516),(7086,'D',8,0.00000008,6,3,2516),(7087,'E',8,0.000000016,6,3,2516),(7088,'F',8,0.0000000032,6,3,2516),(7089,'G',8,0.00000000064,6,3,2516),(7090,'H',8,0.000000000128,6,3,2516),(7091,'A',3,0,3,4,2517),(7092,'B',3,0,3,4,2517),(7093,'C',3,0,3,4,2517),(7094,'D',3,0,3,4,2517),(7095,'E',3,0,3,4,2517),(7096,'F',3,0,3,4,2517),(7097,'G',3,0,3,4,2517),(7098,'H',3,0,3,4,2517),(7099,'A',4,0.00001,5,4,2517),(7100,'B',4,0.000002,5,4,2517),(7101,'C',4,0.0000004,5,4,2517),(7102,'D',4,0.00000008,5,4,2517),(7103,'E',4,0.000000016,5,4,2517),(7104,'F',4,0.0000000032,5,4,2517),(7105,'G',4,0.00000000064,5,4,2517),(7106,'H',4,0.000000000128,5,4,2517),(7107,'A',5,0.00001,6,4,2517),(7108,'B',5,0.000002,6,4,2517),(7109,'C',5,0.0000004,6,4,2517),(7110,'D',5,0.00000008,6,4,2517),(7111,'E',5,0.000000016,6,4,2517),(7112,'F',5,0.0000000032,6,4,2517),(7113,'G',5,0.00000000064,6,4,2517),(7114,'H',5,0.000000000128,6,4,2517),(7115,'A',6,0,3,3,2517),(7116,'B',6,0,3,3,2517),(7117,'C',6,0,3,3,2517),(7118,'D',6,0,3,3,2517),(7119,'E',6,0,3,3,2517),(7120,'F',6,0,3,3,2517),(7121,'G',6,0,3,3,2517),(7122,'H',6,0,3,3,2517),(7123,'A',7,0.00001,5,3,2517),(7124,'B',7,0.000002,5,3,2517),(7125,'C',7,0.0000004,5,3,2517),(7126,'D',7,0.00000008,5,3,2517),(7127,'E',7,0.000000016,5,3,2517),(7128,'F',7,0.0000000032,5,3,2517),(7129,'G',7,0.00000000064,5,3,2517),(7130,'H',7,0.000000000128,5,3,2517),(7131,'A',8,0.00001,6,3,2517),(7132,'B',8,0.000002,6,3,2517),(7133,'C',8,0.0000004,6,3,2517),(7134,'D',8,0.00000008,6,3,2517),(7135,'E',8,0.000000016,6,3,2517),(7136,'F',8,0.0000000032,6,3,2517),(7137,'G',8,0.00000000064,6,3,2517),(7138,'H',8,0.000000000128,6,3,2517),(7139,'A',3,0,3,4,2518),(7140,'B',3,0,3,4,2518),(7141,'C',3,0,3,4,2518),(7142,'D',3,0,3,4,2518),(7143,'E',3,0,3,4,2518),(7144,'F',3,0,3,4,2518),(7145,'G',3,0,3,4,2518),(7146,'H',3,0,3,4,2518),(7147,'A',4,0.00001,5,4,2518),(7148,'B',4,0.000002,5,4,2518),(7149,'C',4,0.0000004,5,4,2518),(7150,'D',4,0.00000008,5,4,2518),(7151,'E',4,0.000000016,5,4,2518),(7152,'F',4,0.0000000032,5,4,2518),(7153,'G',4,0.00000000064,5,4,2518),(7154,'H',4,0.000000000128,5,4,2518),(7155,'A',5,0.00001,6,4,2518),(7156,'B',5,0.000002,6,4,2518),(7157,'C',5,0.0000004,6,4,2518),(7158,'D',5,0.00000008,6,4,2518),(7159,'E',5,0.000000016,6,4,2518),(7160,'F',5,0.0000000032,6,4,2518),(7161,'G',5,0.00000000064,6,4,2518),(7162,'H',5,0.000000000128,6,4,2518),(7163,'A',6,0,3,3,2518),(7164,'B',6,0,3,3,2518),(7165,'C',6,0,3,3,2518),(7166,'D',6,0,3,3,2518),(7167,'E',6,0,3,3,2518),(7168,'F',6,0,3,3,2518),(7169,'G',6,0,3,3,2518),(7170,'H',6,0,3,3,2518),(7171,'A',7,0.00001,5,3,2518),(7172,'B',7,0.000002,5,3,2518),(7173,'C',7,0.0000004,5,3,2518),(7174,'D',7,0.00000008,5,3,2518),(7175,'E',7,0.000000016,5,3,2518),(7176,'F',7,0.0000000032,5,3,2518),(7177,'G',7,0.00000000064,5,3,2518),(7178,'H',7,0.000000000128,5,3,2518),(7179,'A',8,0.00001,6,3,2518),(7180,'B',8,0.000002,6,3,2518),(7181,'C',8,0.0000004,6,3,2518),(7182,'D',8,0.00000008,6,3,2518),(7183,'E',8,0.000000016,6,3,2518),(7184,'F',8,0.0000000032,6,3,2518),(7185,'G',8,0.00000000064,6,3,2518),(7186,'H',8,0.000000000128,6,3,2518),(7187,'A',3,0,3,4,2519),(7188,'B',3,0,3,4,2519),(7189,'C',3,0,3,4,2519),(7190,'D',3,0,3,4,2519),(7191,'E',3,0,3,4,2519),(7192,'F',3,0,3,4,2519),(7193,'G',3,0,3,4,2519),(7194,'H',3,0,3,4,2519),(7195,'A',4,0.00001,5,4,2519),(7196,'B',4,0.000002,5,4,2519),(7197,'C',4,0.0000004,5,4,2519),(7198,'D',4,0.00000008,5,4,2519),(7199,'E',4,0.000000016,5,4,2519),(7200,'F',4,0.0000000032,5,4,2519),(7201,'G',4,0.00000000064,5,4,2519),(7202,'H',4,0.000000000128,5,4,2519),(7203,'A',5,0.00001,6,4,2519),(7204,'B',5,0.000002,6,4,2519),(7205,'C',5,0.0000004,6,4,2519),(7206,'D',5,0.00000008,6,4,2519),(7207,'E',5,0.000000016,6,4,2519),(7208,'F',5,0.0000000032,6,4,2519),(7209,'G',5,0.00000000064,6,4,2519),(7210,'H',5,0.000000000128,6,4,2519),(7211,'A',6,0,3,3,2519),(7212,'B',6,0,3,3,2519),(7213,'C',6,0,3,3,2519),(7214,'D',6,0,3,3,2519),(7215,'E',6,0,3,3,2519),(7216,'F',6,0,3,3,2519),(7217,'G',6,0,3,3,2519),(7218,'H',6,0,3,3,2519),(7219,'A',7,0.00001,5,3,2519),(7220,'B',7,0.000002,5,3,2519),(7221,'C',7,0.0000004,5,3,2519),(7222,'D',7,0.00000008,5,3,2519),(7223,'E',7,0.000000016,5,3,2519),(7224,'F',7,0.0000000032,5,3,2519),(7225,'G',7,0.00000000064,5,3,2519),(7226,'H',7,0.000000000128,5,3,2519),(7227,'A',8,0.00001,6,3,2519),(7228,'B',8,0.000002,6,3,2519),(7229,'C',8,0.0000004,6,3,2519),(7230,'D',8,0.00000008,6,3,2519),(7231,'E',8,0.000000016,6,3,2519),(7232,'F',8,0.0000000032,6,3,2519),(7233,'G',8,0.00000000064,6,3,2519),(7234,'H',8,0.000000000128,6,3,2519),(7235,'A',3,0,3,4,2520),(7236,'B',3,0,3,4,2520),(7237,'C',3,0,3,4,2520),(7238,'D',3,0,3,4,2520),(7239,'E',3,0,3,4,2520),(7240,'F',3,0,3,4,2520),(7241,'G',3,0,3,4,2520),(7242,'H',3,0,3,4,2520),(7243,'A',4,0.00001,5,4,2520),(7244,'B',4,0.000002,5,4,2520),(7245,'C',4,0.0000004,5,4,2520),(7246,'D',4,0.00000008,5,4,2520),(7247,'E',4,0.000000016,5,4,2520),(7248,'F',4,0.0000000032,5,4,2520),(7249,'G',4,0.00000000064,5,4,2520),(7250,'H',4,0.000000000128,5,4,2520),(7251,'A',5,0.00001,6,4,2520),(7252,'B',5,0.000002,6,4,2520),(7253,'C',5,0.0000004,6,4,2520),(7254,'D',5,0.00000008,6,4,2520),(7255,'E',5,0.000000016,6,4,2520),(7256,'F',5,0.0000000032,6,4,2520),(7257,'G',5,0.00000000064,6,4,2520),(7258,'H',5,0.000000000128,6,4,2520),(7259,'A',6,0,3,3,2520),(7260,'B',6,0,3,3,2520),(7261,'C',6,0,3,3,2520),(7262,'D',6,0,3,3,2520),(7263,'E',6,0,3,3,2520),(7264,'F',6,0,3,3,2520),(7265,'G',6,0,3,3,2520),(7266,'H',6,0,3,3,2520),(7267,'A',7,0.00001,5,3,2520),(7268,'B',7,0.000002,5,3,2520),(7269,'C',7,0.0000004,5,3,2520),(7270,'D',7,0.00000008,5,3,2520),(7271,'E',7,0.000000016,5,3,2520),(7272,'F',7,0.0000000032,5,3,2520),(7273,'G',7,0.00000000064,5,3,2520),(7274,'H',7,0.000000000128,5,3,2520),(7275,'A',8,0.00001,6,3,2520),(7276,'B',8,0.000002,6,3,2520),(7277,'C',8,0.0000004,6,3,2520),(7278,'D',8,0.00000008,6,3,2520),(7279,'E',8,0.000000016,6,3,2520),(7280,'F',8,0.0000000032,6,3,2520),(7281,'G',8,0.00000000064,6,3,2520),(7282,'H',8,0.000000000128,6,3,2520);
/*!40000 ALTER TABLE `mosdb_platekey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mosdb_platelayout`
--

DROP TABLE IF EXISTS `mosdb_platelayout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mosdb_platelayout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2521 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mosdb_platelayout`
--

LOCK TABLES `mosdb_platelayout` WRITE;
/*!40000 ALTER TABLE `mosdb_platelayout` DISABLE KEYS */;
INSERT INTO `mosdb_platelayout` VALUES (2514,'160122'),(2515,'160122'),(2516,'160122'),(2517,'160122'),(2518,'160122'),(2519,'160122'),(2520,'160122');
/*!40000 ALTER TABLE `mosdb_platelayout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mosdb_species`
--

DROP TABLE IF EXISTS `mosdb_species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mosdb_species` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mosdb_species`
--

LOCK TABLES `mosdb_species` WRITE;
/*!40000 ALTER TABLE `mosdb_species` DISABLE KEYS */;
INSERT INTO `mosdb_species` VALUES (1,'Aedes aegyptii'),(2,'Anopheles gambiae');
/*!40000 ALTER TABLE `mosdb_species` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-28 17:27:14
