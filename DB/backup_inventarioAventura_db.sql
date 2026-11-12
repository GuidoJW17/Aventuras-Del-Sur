-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: inventarioaventura_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
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
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',3,'add_permission'),(6,'Can change permission',3,'change_permission'),(7,'Can delete permission',3,'delete_permission'),(8,'Can view permission',3,'view_permission'),(9,'Can add group',2,'add_group'),(10,'Can change group',2,'change_group'),(11,'Can delete group',2,'delete_group'),(12,'Can view group',2,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add perfil',7,'add_perfil'),(26,'Can change perfil',7,'change_perfil'),(27,'Can delete perfil',7,'delete_perfil'),(28,'Can view perfil',7,'view_perfil'),(29,'Can add Inscripción',10,'add_inscripcion'),(30,'Can change Inscripción',10,'change_inscripcion'),(31,'Can delete Inscripción',10,'delete_inscripcion'),(32,'Can view Inscripción',10,'view_inscripcion'),(33,'Can add Experiencia',9,'add_experiencia'),(34,'Can change Experiencia',9,'change_experiencia'),(35,'Can delete Experiencia',9,'delete_experiencia'),(36,'Can view Experiencia',9,'view_experiencia'),(37,'Can add Categoría',8,'add_categoria'),(38,'Can change Categoría',8,'change_categoria'),(39,'Can delete Categoría',8,'delete_categoria'),(40,'Can view Categoría',8,'view_categoria');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1200000$uQocjA1YqKZ5iby8pxlkQt$mVJEi2brMDK6ClsUneNrmexksL+RXffLxmhrNGZk+/Y=','2026-11-12 21:12:58.168459',1,'admin','','','',1,1,'2026-11-10 22:35:33.076401'),(3,'pbkdf2_sha256$1200000$mNOEaHFZql2vIRkiT0MDrA$zEzwsj+3M6BJNmawvtaKhM/yNvDUxNXasRs5P0KUZNU=','2026-11-12 20:39:10.051111',0,'Widow','Guido','Jimenez','',0,1,'2026-11-12 19:54:42.000000'),(4,'pbkdf2_sha256$1200000$jnlQq1dF80mqYuXJDh6ZR6$FOJBq1f9hD1Phb/wLQVVt3nh488qyQXerobitGkYnpE=','2026-11-12 21:10:58.204830',0,'Juan','','','',0,1,'2026-11-12 19:56:42.000000'),(5,'pbkdf2_sha256$1200000$V7N8gG1CcUgXpPKjsmxtkf$NAt+9YCcdmR2z0FOgJtcTs3GKyu/8+PXSpR1H8ghoLw=','2026-11-12 21:12:15.514015',0,'Carlos','','','',0,1,'2026-11-12 20:10:06.000000'),(6,'pbkdf2_sha256$1200000$Ny47cJUr5i1ub80ymDGMA8$jawaV9f6DTrXU1y41OQVVRSOw+KKMXkleo/ohT5RSVE=','2026-11-12 20:52:41.733870',0,'Martin','','','',0,1,'2026-11-12 20:35:06.273228');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
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
-- Table structure for table `cuentas_perfil`
--

DROP TABLE IF EXISTS `cuentas_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuentas_perfil` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rol` varchar(30) NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `cuentas_perfil_usuario_id_06f8a1e5_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuentas_perfil`
--

LOCK TABLES `cuentas_perfil` WRITE;
/*!40000 ALTER TABLE `cuentas_perfil` DISABLE KEYS */;
INSERT INTO `cuentas_perfil` VALUES (2,'Admin',1),(3,'Guia',3),(4,'Turista',4),(5,'Turista',5),(6,'Guia',6);
/*!40000 ALTER TABLE `cuentas_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2026-11-11 19:56:44.272402','1','admin Guia',1,'[{\"added\": {}}]',7,1),(2,'2026-11-11 19:56:49.547586','1','admin Guia',3,'',7,1),(3,'2026-11-12 19:18:58.736784','2','guia1',1,'[{\"added\": {}}]',4,1),(4,'2026-11-12 19:19:40.675654','2','guia1',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]',4,1),(5,'2026-11-12 19:20:04.644620','2','guia1',2,'[]',4,1),(6,'2026-11-12 19:22:07.072011','1','guia1 Guia',2,'[{\"changed\": {\"fields\": [\"Rol\"]}}]',7,1),(7,'2026-11-12 19:52:51.164327','1','guia1 Guia',3,'',7,1),(8,'2026-11-12 19:52:59.036609','2','guia1',3,'',4,1),(9,'2026-11-12 19:53:09.697113','2','admin Admin',1,'[{\"added\": {}}]',7,1),(10,'2026-11-12 19:54:42.256441','3','Widow',1,'[{\"added\": {}}]',4,1),(11,'2026-11-12 19:54:53.727839','3','Widow',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',4,1),(12,'2026-11-12 19:54:59.725051','3','Widow Guia',2,'[{\"changed\": {\"fields\": [\"Rol\"]}}]',7,1),(13,'2026-11-12 19:56:42.316146','4','Juan',1,'[{\"added\": {}}]',4,1),(14,'2026-11-12 19:56:53.095828','4','Juan',2,'[]',4,1),(15,'2026-11-12 20:10:06.767405','5','Carlos',1,'[{\"added\": {}}]',4,1),(16,'2026-11-12 20:10:34.355764','5','Carlos',2,'[]',4,1),(17,'2026-11-12 20:35:06.475728','6','Martin',1,'[{\"added\": {}}]',4,1),(18,'2026-11-12 20:35:21.333145','6','Martin Guia',2,'[{\"changed\": {\"fields\": [\"Rol\"]}}]',7,1),(19,'2026-11-12 20:52:26.799780','3','Widow',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
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
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'cuentas','perfil'),(8,'experiencias','categoria'),(9,'experiencias','experiencia'),(10,'experiencias','inscripcion'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-11-10 18:54:33.731294'),(2,'auth','0001_initial','2026-11-10 18:54:34.042014'),(3,'admin','0001_initial','2026-11-10 18:54:34.109192'),(4,'admin','0002_logentry_remove_auto_add','2026-11-10 18:54:34.113821'),(5,'admin','0003_logentry_add_action_flag_choices','2026-11-10 18:54:34.118374'),(6,'contenttypes','0002_remove_content_type_name','2026-11-10 18:54:34.171381'),(7,'auth','0002_alter_permission_name_max_length','2026-11-10 18:54:34.229003'),(8,'auth','0003_alter_user_email_max_length','2026-11-10 18:54:34.241923'),(9,'auth','0004_alter_user_username_opts','2026-11-10 18:54:34.246264'),(10,'auth','0005_alter_user_last_login_null','2026-11-10 18:54:34.274508'),(11,'auth','0006_require_contenttypes_0002','2026-11-10 18:54:34.276218'),(12,'auth','0007_alter_validators_add_error_messages','2026-11-10 18:54:34.280286'),(13,'auth','0008_alter_user_username_max_length','2026-11-10 18:54:34.312164'),(14,'auth','0009_alter_user_last_name_max_length','2026-11-10 18:54:34.344096'),(15,'auth','0010_alter_group_name_max_length','2026-11-10 18:54:34.354556'),(16,'auth','0011_update_proxy_permissions','2026-11-10 18:54:34.359293'),(17,'auth','0012_alter_user_first_name_max_length','2026-11-10 18:54:34.388853'),(18,'sessions','0001_initial','2026-11-10 18:54:34.408771'),(21,'experiencias','0001_initial','2026-11-11 20:39:45.070694'),(22,'cuentas','0001_initial','2026-11-11 20:52:13.252892');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `django_session` VALUES ('buk2xol6ynp4gkikupuio3xvdhkg6z6f','.eJxVjMsOwiAQAP9lz4YsDwF79O43EHYBqRpISnsy_rtp0oNeZybzhhC3tYZt5CXMCSaQcPplFPmZ2y7SI7Z7F9zbuswk9kQcdohbT_l1Pdq_QY2jwgSGWLvo2Sd0uaAvxTGZkrWUhgjR4dkUjcp7lso4yyozklTR2gsrtvD5Au2_N74:1xRc6M:frABH2JZjygP67cn9AzPHehWMhRhMZ-WfcMuxNND-10','2026-11-26 21:12:58.170437');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_categoria`
--

DROP TABLE IF EXISTS `experiencias_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_categoria`
--

LOCK TABLES `experiencias_categoria` WRITE;
/*!40000 ALTER TABLE `experiencias_categoria` DISABLE KEYS */;
INSERT INTO `experiencias_categoria` VALUES (1,'Trekking','Caminatas y rutas de montaña con guía'),(2,'Canopy','Circuitos de tirolinas y descensos entre los árboles'),(3,'Kayak','Salidas en kayak por ríos y lagos de la zona'),(4,'Arriendo de equipos','Arriendo de bicicletas y equipo de montaña');
/*!40000 ALTER TABLE `experiencias_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_experiencia`
--

DROP TABLE IF EXISTS `experiencias_experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_experiencia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cupo_maximo` int unsigned NOT NULL,
  `fecha_hora` datetime(6) NOT NULL,
  `activa` tinyint(1) NOT NULL,
  `categoria_id` bigint NOT NULL,
  `creador_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `experiencias_experie_categoria_id_b03f452f_fk_experienc` (`categoria_id`),
  KEY `experiencias_experiencia_creador_id_70b19025_fk_auth_user_id` (`creador_id`),
  CONSTRAINT `experiencias_experie_categoria_id_b03f452f_fk_experienc` FOREIGN KEY (`categoria_id`) REFERENCES `experiencias_categoria` (`id`),
  CONSTRAINT `experiencias_experiencia_creador_id_70b19025_fk_auth_user_id` FOREIGN KEY (`creador_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `experiencias_experiencia_chk_1` CHECK ((`cupo_maximo` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_experiencia`
--

LOCK TABLES `experiencias_experiencia` WRITE;
/*!40000 ALTER TABLE `experiencias_experiencia` DISABLE KEYS */;
INSERT INTO `experiencias_experiencia` VALUES (7,'Trekking hacia el Cerro de la Virgen','Efectuar Trekking desde la plaza de Armas hacia el Cerro de La Virgen',5000.00,20,'2026-12-03 11:00:00.000000',1,1,3),(8,'Kayak río Claro','Se realizará una activida de Kayak en el Rio Claro de Talca',10000.00,6,'2026-12-05 12:00:00.000000',1,3,3),(9,'Canopy en el bosque Aventura','Canopy desde Talca Hacia Pucon en el Bosque Aventura',100000.00,10,'2026-12-06 13:30:00.000000',1,2,3),(10,'Arriendo de bicicletas','Se arrienda bicicletas Mountain Bike para hacer descenso en el cerro de la Virgen, 10K la hora',10000.00,12,'2026-12-08 20:00:00.000000',1,4,3),(11,'Batalla de Farmear Aura en la Siete Tazas','Recorrido desde Talca a Curico, cuando se llegue al punto final del recorrido se hace una batalla de Aura',34000.00,67,'2026-12-12 03:00:00.000000',1,1,6),(12,'Canopy en el Cajon del Maipo','Canopy en Santiago hacia el Cajon del Maipo',45000.00,23,'2026-12-14 15:00:00.000000',1,2,6),(13,'Kayak en el Lago Colbun','Experiencia de Kayak en el lago colbun',14000.00,21,'2026-12-18 13:00:00.000000',1,3,6),(14,'Arriendo de kayak doble','Arriendo de kayak doble con remos y chaleco salvavidas por medio día',18000.00,10,'2026-12-23 03:00:00.000000',1,4,6);
/*!40000 ALTER TABLE `experiencias_experiencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencias_inscripcion`
--

DROP TABLE IF EXISTS `experiencias_inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencias_inscripcion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_inscripcion` datetime(6) NOT NULL,
  `estado_pago` varchar(10) NOT NULL,
  `experiencia_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inscripcion_unica_por_usuario` (`usuario_id`,`experiencia_id`),
  KEY `experiencias_inscrip_experiencia_id_2fbecc6b_fk_experienc` (`experiencia_id`),
  CONSTRAINT `experiencias_inscrip_experiencia_id_2fbecc6b_fk_experienc` FOREIGN KEY (`experiencia_id`) REFERENCES `experiencias_experiencia` (`id`),
  CONSTRAINT `experiencias_inscripcion_usuario_id_9d6f5da2_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencias_inscripcion`
--

LOCK TABLES `experiencias_inscripcion` WRITE;
/*!40000 ALTER TABLE `experiencias_inscripcion` DISABLE KEYS */;
INSERT INTO `experiencias_inscripcion` VALUES (7,'2026-11-12 21:12:02.460555','Confirmado',7,4),(8,'2026-11-12 21:12:04.488053','Confirmado',8,4),(9,'2026-11-12 21:12:06.884605','Pendiente',10,4),(10,'2026-11-12 21:12:21.036148','Confirmado',14,5),(11,'2026-11-12 21:12:24.223632','Confirmado',9,5),(12,'2026-11-12 21:12:25.816314','Pendiente',8,5);
/*!40000 ALTER TABLE `experiencias_inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'inventarioaventura_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-12 18:22:55
