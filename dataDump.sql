-- MySQL dump 10.13  Distrib 8.0.15, for Linux (x86_64)
--
-- Host: localhost    Database: crickInfo
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add match',1,'add_match');
INSERT INTO `auth_permission` VALUES (2,'Can change match',1,'change_match');
INSERT INTO `auth_permission` VALUES (3,'Can delete match',1,'delete_match');
INSERT INTO `auth_permission` VALUES (4,'Can view match',1,'view_match');
INSERT INTO `auth_permission` VALUES (5,'Can add team',2,'add_team');
INSERT INTO `auth_permission` VALUES (6,'Can change team',2,'change_team');
INSERT INTO `auth_permission` VALUES (7,'Can delete team',2,'delete_team');
INSERT INTO `auth_permission` VALUES (8,'Can view team',2,'view_team');
INSERT INTO `auth_permission` VALUES (9,'Can add point',3,'add_point');
INSERT INTO `auth_permission` VALUES (10,'Can change point',3,'change_point');
INSERT INTO `auth_permission` VALUES (11,'Can delete point',3,'delete_point');
INSERT INTO `auth_permission` VALUES (12,'Can view point',3,'view_point');
INSERT INTO `auth_permission` VALUES (13,'Can add player',4,'add_player');
INSERT INTO `auth_permission` VALUES (14,'Can change player',4,'change_player');
INSERT INTO `auth_permission` VALUES (15,'Can delete player',4,'delete_player');
INSERT INTO `auth_permission` VALUES (16,'Can view player',4,'view_player');
INSERT INTO `auth_permission` VALUES (17,'Can add log entry',5,'add_logentry');
INSERT INTO `auth_permission` VALUES (18,'Can change log entry',5,'change_logentry');
INSERT INTO `auth_permission` VALUES (19,'Can delete log entry',5,'delete_logentry');
INSERT INTO `auth_permission` VALUES (20,'Can view log entry',5,'view_logentry');
INSERT INTO `auth_permission` VALUES (21,'Can add permission',6,'add_permission');
INSERT INTO `auth_permission` VALUES (22,'Can change permission',6,'change_permission');
INSERT INTO `auth_permission` VALUES (23,'Can delete permission',6,'delete_permission');
INSERT INTO `auth_permission` VALUES (24,'Can view permission',6,'view_permission');
INSERT INTO `auth_permission` VALUES (25,'Can add group',7,'add_group');
INSERT INTO `auth_permission` VALUES (26,'Can change group',7,'change_group');
INSERT INTO `auth_permission` VALUES (27,'Can delete group',7,'delete_group');
INSERT INTO `auth_permission` VALUES (28,'Can view group',7,'view_group');
INSERT INTO `auth_permission` VALUES (29,'Can add user',8,'add_user');
INSERT INTO `auth_permission` VALUES (30,'Can change user',8,'change_user');
INSERT INTO `auth_permission` VALUES (31,'Can delete user',8,'delete_user');
INSERT INTO `auth_permission` VALUES (32,'Can view user',8,'view_user');
INSERT INTO `auth_permission` VALUES (33,'Can add content type',9,'add_contenttype');
INSERT INTO `auth_permission` VALUES (34,'Can change content type',9,'change_contenttype');
INSERT INTO `auth_permission` VALUES (35,'Can delete content type',9,'delete_contenttype');
INSERT INTO `auth_permission` VALUES (36,'Can view content type',9,'view_contenttype');
INSERT INTO `auth_permission` VALUES (37,'Can add session',10,'add_session');
INSERT INTO `auth_permission` VALUES (38,'Can change session',10,'change_session');
INSERT INTO `auth_permission` VALUES (39,'Can delete session',10,'delete_session');
INSERT INTO `auth_permission` VALUES (40,'Can view session',10,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$k9pZTR1A9Pef$PTOm6YU7zzxohwVEPEUEFiUcUzckWksZ7Fef/8k2LbY=','2020-03-06 06:43:01.062090',1,'superuser','','','aakansha.joshii@gmail.com',1,1,'2020-03-06 06:42:26.285867');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-03-06 07:20:29.751244','1','Chennai Super Kings',1,'[{\"added\": {}}]',2,1);
INSERT INTO `django_admin_log` VALUES (2,'2020-03-06 07:20:58.504303','2','Mumbai Indians',1,'[{\"added\": {}}]',2,1);
INSERT INTO `django_admin_log` VALUES (3,'2020-03-06 07:21:20.174912','3','Sunrisers Hyderabad',1,'[{\"added\": {}}]',2,1);
INSERT INTO `django_admin_log` VALUES (4,'2020-03-06 07:21:49.337896','4','Kolkata Knight Riders',1,'[{\"added\": {}}]',2,1);
INSERT INTO `django_admin_log` VALUES (5,'2020-03-06 07:22:08.714601','5','Rajasthan Royals',1,'[{\"added\": {}}]',2,1);
INSERT INTO `django_admin_log` VALUES (6,'2020-03-06 07:22:46.140559','6','Royal Challenger',1,'[{\"added\": {}}]',2,1);
INSERT INTO `django_admin_log` VALUES (7,'2020-03-06 07:40:08.789406','1','DavidWarner',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (8,'2020-03-06 07:40:50.365148','2','KaneWillamson',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (9,'2020-03-06 07:41:14.073081','3','RashidKhan',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (10,'2020-03-06 07:41:38.493809','4','AbhishekSharma',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (11,'2020-03-06 07:41:59.497886','5','SiddharthKaul',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (12,'2020-03-06 07:42:34.328290','6','ManishPandey',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (13,'2020-03-06 07:45:54.496171','7','MSDhoni',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (14,'2020-03-06 07:46:17.329210','8','SureshRaina',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (15,'2020-03-06 07:46:42.903555','9','RavindraJadeja',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (16,'2020-03-06 07:47:04.357153','10','ShaneWatson',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (17,'2020-03-06 07:47:43.804464','11','LungiNgidi',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (18,'2020-03-06 07:48:04.552347','12','ShardulThakur',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (19,'2020-03-06 07:50:27.854552','13','RohitSharma',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (20,'2020-03-06 07:50:54.638464','14','HardikPandya',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (21,'2020-03-06 07:51:27.072200','15','SuryaKumarYadav',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (22,'2020-03-06 07:51:50.823923','16','LasithMalinga',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (23,'2020-03-06 07:52:13.338563','17','JaspritBumrah',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (24,'2020-03-06 07:52:42.681481','18','Quinton DeKock',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (25,'2020-03-06 07:55:14.508670','19','DineshKarthik',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (26,'2020-03-06 07:55:39.703475','20','ShubhmanGill',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (27,'2020-03-06 07:56:05.777077','21','AndreRussell',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (28,'2020-03-06 07:56:32.029108','22','NitishRana',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (29,'2020-03-06 07:57:10.777546','23','HarreyGurney',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (30,'2020-03-06 07:57:29.862757','24','ShivamMavi',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (31,'2020-03-06 08:00:05.214044','25','StevenSmith',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (32,'2020-03-06 08:00:32.115105','26','JofraArcher',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (33,'2020-03-06 08:01:01.762395','27','OshaneThomas',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (34,'2020-03-06 08:01:33.562977','28','JoseButtler',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (35,'2020-03-06 08:01:59.907068','29','RiyanParag',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (36,'2020-03-06 08:02:24.312069','30','SanjuSamson',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (37,'2020-03-06 08:04:46.246407','31','ViratKohli',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (38,'2020-03-06 08:05:13.346653','32','AB DeeVilliars',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (39,'2020-03-06 08:05:36.512445','33','MoeenAli',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (40,'2020-03-06 08:05:57.941892','34','ShivamDube',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (41,'2020-03-06 08:06:18.518093','35','MohdSiraj',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (42,'2020-03-06 08:06:42.175442','36','NavdeepSaini',1,'[{\"added\": {}}]',4,1);
INSERT INTO `django_admin_log` VALUES (43,'2020-03-06 08:08:07.114116','1','Match object (1)',1,'[{\"added\": {}}]',1,1);
INSERT INTO `django_admin_log` VALUES (44,'2020-03-06 08:08:36.011864','2','Match object (2)',1,'[{\"added\": {}}]',1,1);
INSERT INTO `django_admin_log` VALUES (45,'2020-03-06 08:09:13.883091','3','Match object (3)',1,'[{\"added\": {}}]',1,1);
INSERT INTO `django_admin_log` VALUES (46,'2020-03-06 08:09:38.304023','4','Match object (4)',1,'[{\"added\": {}}]',1,1);
INSERT INTO `django_admin_log` VALUES (47,'2020-03-06 08:10:25.994624','5','Match object (5)',1,'[{\"added\": {}}]',1,1);
INSERT INTO `django_admin_log` VALUES (48,'2020-03-06 08:10:42.268813','6','Match object (6)',1,'[{\"added\": {}}]',1,1);
INSERT INTO `django_admin_log` VALUES (49,'2020-03-06 08:13:49.669933','1','Point object (1)',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (50,'2020-03-06 08:21:54.981491','2','Chennai Super Kings vs Mumbai Indians - Mumbai Indians - 0',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (51,'2020-03-06 08:22:21.694612','3','Chennai Super Kings vs Rajasthan Royals - Rajasthan Royals - 1',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (52,'2020-03-06 08:22:32.348545','4','Chennai Super Kings vs Rajasthan Royals - Chennai Super Kings - 0',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (53,'2020-03-06 08:22:42.809108','5','Mumbai Indians vs Kolkata Knight Riders - Mumbai Indians - 1',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (54,'2020-03-06 08:22:50.901664','6','Mumbai Indians vs Kolkata Knight Riders - Kolkata Knight Riders - 0',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (55,'2020-03-06 08:23:22.310205','7','Rajasthan Royals vs Kolkata Knight Riders - Rajasthan Royals - 1',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (56,'2020-03-06 08:24:22.581673','8','Rajasthan Royals vs Kolkata Knight Riders - Kolkata Knight Riders - 0',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (57,'2020-03-06 08:24:45.822151','9','Royal Challenger vs Sunrisers Hyderabad - Royal Challenger - 1',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (58,'2020-03-06 08:25:16.256382','10','Royal Challenger vs Sunrisers Hyderabad - Sunrisers Hyderabad - 0',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (59,'2020-03-06 08:25:25.539545','11','Sunrisers Hyderabad vs Royal Challenger - Royal Challenger - 1',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (60,'2020-03-06 08:25:34.953023','12','Sunrisers Hyderabad vs Royal Challenger - Sunrisers Hyderabad - 0',1,'[{\"added\": {}}]',3,1);
INSERT INTO `django_admin_log` VALUES (61,'2020-03-06 08:27:01.678032','6','Sunrisers Hyderabad vs Royal Challenger',2,'[{\"changed\": {\"fields\": [\"match_date\"]}}]',1,1);
INSERT INTO `django_admin_log` VALUES (62,'2020-03-06 08:27:21.451520','4','Rajasthan Royals vs Kolkata Knight Riders',2,'[{\"changed\": {\"fields\": [\"match_date\"]}}]',1,1);
INSERT INTO `django_admin_log` VALUES (63,'2020-03-06 08:27:42.330919','2','Chennai Super Kings vs Rajasthan Royals',2,'[{\"changed\": {\"fields\": [\"match_date\"]}}]',1,1);
INSERT INTO `django_admin_log` VALUES (64,'2020-03-06 08:28:56.441324','7','Chennai Super Kings vs Royal Challenger',1,'[{\"added\": {}}]',1,1);
INSERT INTO `django_admin_log` VALUES (65,'2020-03-06 08:29:35.807756','8','Mumbai Indians vs Rajasthan Royals',1,'[{\"added\": {}}]',1,1);
INSERT INTO `django_admin_log` VALUES (66,'2020-03-06 08:30:03.794498','9','Kolkata Knight Riders vs Sunrisers Hyderabad',1,'[{\"added\": {}}]',1,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (5,'admin','logentry');
INSERT INTO `django_content_type` VALUES (7,'auth','group');
INSERT INTO `django_content_type` VALUES (6,'auth','permission');
INSERT INTO `django_content_type` VALUES (8,'auth','user');
INSERT INTO `django_content_type` VALUES (9,'contenttypes','contenttype');
INSERT INTO `django_content_type` VALUES (1,'matchInfo','match');
INSERT INTO `django_content_type` VALUES (4,'matchInfo','player');
INSERT INTO `django_content_type` VALUES (3,'matchInfo','point');
INSERT INTO `django_content_type` VALUES (2,'matchInfo','team');
INSERT INTO `django_content_type` VALUES (10,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-03-06 06:41:12.330471');
INSERT INTO `django_migrations` VALUES (2,'auth','0001_initial','2020-03-06 06:41:12.495791');
INSERT INTO `django_migrations` VALUES (3,'admin','0001_initial','2020-03-06 06:41:13.012841');
INSERT INTO `django_migrations` VALUES (4,'admin','0002_logentry_remove_auto_add','2020-03-06 06:41:13.127464');
INSERT INTO `django_migrations` VALUES (5,'admin','0003_logentry_add_action_flag_choices','2020-03-06 06:41:13.141342');
INSERT INTO `django_migrations` VALUES (6,'contenttypes','0002_remove_content_type_name','2020-03-06 06:41:13.255795');
INSERT INTO `django_migrations` VALUES (7,'auth','0002_alter_permission_name_max_length','2020-03-06 06:41:13.326274');
INSERT INTO `django_migrations` VALUES (8,'auth','0003_alter_user_email_max_length','2020-03-06 06:41:13.362978');
INSERT INTO `django_migrations` VALUES (9,'auth','0004_alter_user_username_opts','2020-03-06 06:41:13.376079');
INSERT INTO `django_migrations` VALUES (10,'auth','0005_alter_user_last_login_null','2020-03-06 06:41:13.453283');
INSERT INTO `django_migrations` VALUES (11,'auth','0006_require_contenttypes_0002','2020-03-06 06:41:13.458144');
INSERT INTO `django_migrations` VALUES (12,'auth','0007_alter_validators_add_error_messages','2020-03-06 06:41:13.471251');
INSERT INTO `django_migrations` VALUES (13,'auth','0008_alter_user_username_max_length','2020-03-06 06:41:13.550366');
INSERT INTO `django_migrations` VALUES (14,'auth','0009_alter_user_last_name_max_length','2020-03-06 06:41:13.624873');
INSERT INTO `django_migrations` VALUES (15,'auth','0010_alter_group_name_max_length','2020-03-06 06:41:13.654123');
INSERT INTO `django_migrations` VALUES (16,'auth','0011_update_proxy_permissions','2020-03-06 06:41:13.671159');
INSERT INTO `django_migrations` VALUES (17,'matchInfo','0001_initial','2020-03-06 06:41:13.837374');
INSERT INTO `django_migrations` VALUES (18,'sessions','0001_initial','2020-03-06 06:41:14.239180');
INSERT INTO `django_migrations` VALUES (19,'matchInfo','0002_auto_20200306_0707','2020-03-06 07:12:23.870917');
INSERT INTO `django_migrations` VALUES (20,'matchInfo','0003_auto_20200306_0712','2020-03-06 07:12:23.885475');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('tckqypfox7gyu9lx14791loujdj9cy1z','ZmU5NmMxYzNjNDVmZTFjYWM3YmU3MjAxNTVkMzlkMmI3MGU0YTIxYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMjExZTI5NDAwMDc0Y2EyNTMxNzFkOTk0NGQzYzI2OGM1N2ZmMDQ1In0=','2020-03-20 06:43:01.066311');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchInfo_match`
--

DROP TABLE IF EXISTS `matchInfo_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `matchInfo_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `match_date` datetime(6) DEFAULT NULL,
  `team_1_id` int(11) NOT NULL,
  `team_2_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matchInfo_match_team_1_id_aa55a528_fk_matchInfo_team_id` (`team_1_id`),
  KEY `matchInfo_match_team_2_id_8857120e_fk_matchInfo_team_id` (`team_2_id`),
  CONSTRAINT `matchInfo_match_team_1_id_aa55a528_fk_matchInfo_team_id` FOREIGN KEY (`team_1_id`) REFERENCES `matchInfo_team` (`id`),
  CONSTRAINT `matchInfo_match_team_2_id_8857120e_fk_matchInfo_team_id` FOREIGN KEY (`team_2_id`) REFERENCES `matchInfo_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchInfo_match`
--

LOCK TABLES `matchInfo_match` WRITE;
/*!40000 ALTER TABLE `matchInfo_match` DISABLE KEYS */;
INSERT INTO `matchInfo_match` VALUES (1,'2020-02-29 18:00:00.000000',1,2);
INSERT INTO `matchInfo_match` VALUES (2,'2020-03-01 18:00:00.000000',1,5);
INSERT INTO `matchInfo_match` VALUES (3,'2020-02-22 18:00:00.000000',2,4);
INSERT INTO `matchInfo_match` VALUES (4,'2020-02-15 18:00:00.000000',5,4);
INSERT INTO `matchInfo_match` VALUES (5,'2020-03-01 18:00:00.000000',6,3);
INSERT INTO `matchInfo_match` VALUES (6,'2020-02-15 18:00:00.000000',3,6);
INSERT INTO `matchInfo_match` VALUES (7,'2020-03-28 18:00:00.000000',1,6);
INSERT INTO `matchInfo_match` VALUES (8,'2020-03-28 18:00:00.000000',2,5);
INSERT INTO `matchInfo_match` VALUES (9,'2020-03-29 18:00:00.000000',4,3);
/*!40000 ALTER TABLE `matchInfo_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchInfo_player`
--

DROP TABLE IF EXISTS `matchInfo_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `matchInfo_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `jersey_number` int(11) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `player_history` varchar(200) DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `image_uri` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matchInfo_player_team_id_230d1c81_fk_matchInfo_team_id` (`team_id`),
  CONSTRAINT `matchInfo_player_team_id_230d1c81_fk_matchInfo_team_id` FOREIGN KEY (`team_id`) REFERENCES `matchInfo_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchInfo_player`
--

LOCK TABLES `matchInfo_player` WRITE;
/*!40000 ALTER TABLE `matchInfo_player` DISABLE KEYS */;
INSERT INTO `matchInfo_player` VALUES (1,'David','Warner',18,'Australia','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',3,'player_image/Screen_Shot_2020-03-06_at_1.05.47_PM.png');
INSERT INTO `matchInfo_player` VALUES (2,'Kane','Willamson',12,'New Zealand','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',3,'player_image/Screen_Shot_2020-03-06_at_1.06.39_PM.png');
INSERT INTO `matchInfo_player` VALUES (3,'Rashid','Khan',45,'Afganistan','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',3,'player_image/Screen_Shot_2020-03-06_at_1.05.57_PM.png');
INSERT INTO `matchInfo_player` VALUES (4,'Abhishek','Sharma',23,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',3,'player_image/Screen_Shot_2020-03-06_at_1.06.08_PM.png');
INSERT INTO `matchInfo_player` VALUES (5,'Siddharth','Kaul',34,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',3,'player_image/Screen_Shot_2020-03-06_at_1.06.22_PM.png');
INSERT INTO `matchInfo_player` VALUES (6,'Manish','Pandey',46,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',3,'player_image/Screen_Shot_2020-03-06_at_1.06.46_PM.png');
INSERT INTO `matchInfo_player` VALUES (7,'MS','Dhoni',34,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',1,'player_image/Screen_Shot_2020-03-06_at_1.14.39_PM.png');
INSERT INTO `matchInfo_player` VALUES (8,'Suresh','Raina',11,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',1,'player_image/Screen_Shot_2020-03-06_at_1.15.05_PM.png');
INSERT INTO `matchInfo_player` VALUES (9,'Ravindra','Jadeja',24,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',1,'player_image/Screen_Shot_2020-03-06_at_1.14.48_PM.png');
INSERT INTO `matchInfo_player` VALUES (10,'Shane','Watson',67,'Australia','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',1,'player_image/Screen_Shot_2020-03-06_at_1.14.55_PM.png');
INSERT INTO `matchInfo_player` VALUES (11,'Lungi','Ngidi',23,'South Africa','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',1,'player_image/Screen_Shot_2020-03-06_at_1.15.29_PM.png');
INSERT INTO `matchInfo_player` VALUES (12,'Shardul','Thakur',78,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',1,'player_image/Screen_Shot_2020-03-06_at_1.15.12_PM.png');
INSERT INTO `matchInfo_player` VALUES (13,'Rohit','Sharma',45,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',2,'player_image/Screen_Shot_2020-03-06_at_1.19.29_PM.png');
INSERT INTO `matchInfo_player` VALUES (14,'Hardik','Pandya',56,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',2,'player_image/Screen_Shot_2020-03-06_at_1.19.37_PM.png');
INSERT INTO `matchInfo_player` VALUES (15,'SuryaKumar','Yadav',89,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',2,'player_image/Screen_Shot_2020-03-06_at_1.19.58_PM.png');
INSERT INTO `matchInfo_player` VALUES (16,'Lasith','Malinga',47,'Sri Lanka','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',2,'player_image/Screen_Shot_2020-03-06_at_1.19.45_PM.png');
INSERT INTO `matchInfo_player` VALUES (17,'Jasprit','Bumrah',56,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',2,'player_image/Screen_Shot_2020-03-06_at_1.19.51_PM.png');
INSERT INTO `matchInfo_player` VALUES (18,'Quinton De','Kock',68,'South Africa','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',2,'player_image/Screen_Shot_2020-03-06_at_1.20.04_PM.png');
INSERT INTO `matchInfo_player` VALUES (19,'Dinesh','Karthik',65,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',4,'player_image/Screen_Shot_2020-03-06_at_1.24.05_PM.png');
INSERT INTO `matchInfo_player` VALUES (20,'Shubhman','Gill',11,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',4,'player_image/Screen_Shot_2020-03-06_at_1.24.36_PM.png');
INSERT INTO `matchInfo_player` VALUES (21,'Andre','Russell',26,'West Indies','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',4,'player_image/Screen_Shot_2020-03-06_at_1.24.18_PM.png');
INSERT INTO `matchInfo_player` VALUES (22,'Nitish','Rana',54,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',4,'player_image/Screen_Shot_2020-03-06_at_1.24.44_PM.png');
INSERT INTO `matchInfo_player` VALUES (23,'Harrey','Gurney',34,'Australia','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',4,'player_image/Screen_Shot_2020-03-06_at_1.24.26_PM.png');
INSERT INTO `matchInfo_player` VALUES (24,'Shivam','Mavi',12,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',4,'player_image/Screen_Shot_2020-03-06_at_1.24.10_PM.png');
INSERT INTO `matchInfo_player` VALUES (25,'Steven','Smith',98,'Australia','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',5,'player_image/Screen_Shot_2020-03-06_at_1.28.30_PM.png');
INSERT INTO `matchInfo_player` VALUES (26,'Jofra','Archer',97,'England','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',5,'player_image/Screen_Shot_2020-03-06_at_1.28.48_PM.png');
INSERT INTO `matchInfo_player` VALUES (27,'Oshane','Thomas',96,'West Indies','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',5,'player_image/Screen_Shot_2020-03-06_at_1.28.39_PM.png');
INSERT INTO `matchInfo_player` VALUES (28,'Jose','Buttler',95,'England','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',5,'player_image/Screen_Shot_2020-03-06_at_1.29.11_PM.png');
INSERT INTO `matchInfo_player` VALUES (29,'Riyan','Parag',94,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',5,'player_image/Screen_Shot_2020-03-06_at_1.29.18_PM.png');
INSERT INTO `matchInfo_player` VALUES (30,'Sanju','Samson',93,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',5,'player_image/Screen_Shot_2020-03-06_at_1.28.24_PM.png');
INSERT INTO `matchInfo_player` VALUES (31,'Virat','Kohli',76,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',6,'player_image/Screen_Shot_2020-03-06_at_1.33.24_PM.png');
INSERT INTO `matchInfo_player` VALUES (32,'AB Dee','Villiars',75,'South Africa','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',6,'player_image/Screen_Shot_2020-03-06_at_1.33.29_PM.png');
INSERT INTO `matchInfo_player` VALUES (33,'Moeen','Ali',74,'England','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',6,'player_image/Screen_Shot_2020-03-06_at_1.33.35_PM.png');
INSERT INTO `matchInfo_player` VALUES (34,'Shivam','Dube',73,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',6,'player_image/Screen_Shot_2020-03-06_at_1.33.49_PM.png');
INSERT INTO `matchInfo_player` VALUES (35,'Mohd','Siraj',72,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',6,'player_image/Screen_Shot_2020-03-06_at_1.33.39_PM.png');
INSERT INTO `matchInfo_player` VALUES (36,'Navdeep','Saini',71,'India','{   \"matches\": 45,   \"hundreds\": 12,   \"fifties\": 40,   \"highestScroe\": 123,   \"wickets\": 50 }',6,'player_image/Screen_Shot_2020-03-06_at_1.34.07_PM.png');
/*!40000 ALTER TABLE `matchInfo_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchInfo_point`
--

DROP TABLE IF EXISTS `matchInfo_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `matchInfo_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `points` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `matchInfo_point_match_id_4b20a652_fk_matchInfo_match_id` (`match_id`),
  KEY `matchInfo_point_team_id_bc054999_fk_matchInfo_team_id` (`team_id`),
  CONSTRAINT `matchInfo_point_match_id_4b20a652_fk_matchInfo_match_id` FOREIGN KEY (`match_id`) REFERENCES `matchInfo_match` (`id`),
  CONSTRAINT `matchInfo_point_team_id_bc054999_fk_matchInfo_team_id` FOREIGN KEY (`team_id`) REFERENCES `matchInfo_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchInfo_point`
--

LOCK TABLES `matchInfo_point` WRITE;
/*!40000 ALTER TABLE `matchInfo_point` DISABLE KEYS */;
INSERT INTO `matchInfo_point` VALUES (1,1,1,1);
INSERT INTO `matchInfo_point` VALUES (2,0,1,2);
INSERT INTO `matchInfo_point` VALUES (3,1,2,5);
INSERT INTO `matchInfo_point` VALUES (4,0,2,1);
INSERT INTO `matchInfo_point` VALUES (5,1,3,2);
INSERT INTO `matchInfo_point` VALUES (6,0,3,4);
INSERT INTO `matchInfo_point` VALUES (7,1,4,5);
INSERT INTO `matchInfo_point` VALUES (8,0,4,4);
INSERT INTO `matchInfo_point` VALUES (9,1,5,6);
INSERT INTO `matchInfo_point` VALUES (10,0,5,3);
INSERT INTO `matchInfo_point` VALUES (11,1,6,6);
INSERT INTO `matchInfo_point` VALUES (12,0,6,3);
/*!40000 ALTER TABLE `matchInfo_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchInfo_team`
--

DROP TABLE IF EXISTS `matchInfo_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `matchInfo_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `logo_uri` varchar(100) NOT NULL,
  `club_state` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchInfo_team`
--

LOCK TABLES `matchInfo_team` WRITE;
/*!40000 ALTER TABLE `matchInfo_team` DISABLE KEYS */;
INSERT INTO `matchInfo_team` VALUES (1,'Chennai Super Kings','team_logo/Screen_Shot_2020-03-06_at_12.46.07_PM.png','Chennai');
INSERT INTO `matchInfo_team` VALUES (2,'Mumbai Indians','team_logo/Screen_Shot_2020-03-06_at_12.47.06_PM.png','Maharashtra');
INSERT INTO `matchInfo_team` VALUES (3,'Sunrisers Hyderabad','team_logo/Screen_Shot_2020-03-06_at_12.47.58_PM.png','Andhra Pradesh');
INSERT INTO `matchInfo_team` VALUES (4,'Kolkata Knight Riders','team_logo/Screen_Shot_2020-03-06_at_12.47.35_PM.png','West Bengal');
INSERT INTO `matchInfo_team` VALUES (5,'Rajasthan Royals','team_logo/Screen_Shot_2020-03-06_at_12.48.20_PM.png','Rajasthan');
INSERT INTO `matchInfo_team` VALUES (6,'Royal Challenger','team_logo/Screen_Shot_2020-03-06_at_12.49.25_PM.png','Karnataka');
/*!40000 ALTER TABLE `matchInfo_team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-06  8:44:14
