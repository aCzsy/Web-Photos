-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: software_project
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

use heroku_afec5cee364630c;

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `access_type` varchar(255) DEFAULT NULL,
  `album_size` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_album_images`
--

DROP TABLE IF EXISTS `album_album_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `album_album_images` (
  `albums_where_image_exist_id` bigint NOT NULL,
  `album_images_image_id` bigint NOT NULL,
  KEY `FK8y85fm9dop251na4yatsks3dj` (`album_images_image_id`),
  KEY `FK9442u159lk2rdkfnf0rphn9pv` (`albums_where_image_exist_id`),
  CONSTRAINT `FK8y85fm9dop251na4yatsks3dj` FOREIGN KEY (`album_images_image_id`) REFERENCES `img` (`image_id`),
  CONSTRAINT `FK9442u159lk2rdkfnf0rphn9pv` FOREIGN KEY (`albums_where_image_exist_id`) REFERENCES `album` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_album_images`
--

LOCK TABLES `album_album_images` WRITE;
/*!40000 ALTER TABLE `album_album_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_album_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_send_entity`
--

DROP TABLE IF EXISTS `album_send_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `album_send_entity` (
  `album_to_send_request_id` bigint NOT NULL AUTO_INCREMENT,
  `is_accepted` bit(1) NOT NULL,
  `is_declined` bit(1) NOT NULL,
  `album_id` bigint DEFAULT NULL,
  `album_receiver_id` bigint DEFAULT NULL,
  `album_sender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`album_to_send_request_id`),
  KEY `FK5qjlcyopabbc7tp9vrs25kday` (`album_id`),
  KEY `FKce107kfns9w5oum51fkm4ag5v` (`album_receiver_id`),
  KEY `FKnowthe8j7hrqxlbaewsc7h2iv` (`album_sender_id`),
  CONSTRAINT `FK5qjlcyopabbc7tp9vrs25kday` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`),
  CONSTRAINT `FKce107kfns9w5oum51fkm4ag5v` FOREIGN KEY (`album_receiver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKnowthe8j7hrqxlbaewsc7h2iv` FOREIGN KEY (`album_sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_send_entity`
--

LOCK TABLES `album_send_entity` WRITE;
/*!40000 ALTER TABLE `album_send_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_send_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_share_request`
--

DROP TABLE IF EXISTS `album_share_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `album_share_request` (
  `album_share_request_id` bigint NOT NULL AUTO_INCREMENT,
  `is_accepted` bit(1) NOT NULL,
  `is_declined` bit(1) NOT NULL,
  `album_id` bigint DEFAULT NULL,
  `album_owner_id` bigint DEFAULT NULL,
  `requesting_user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`album_share_request_id`),
  KEY `FKqc290x0w7p6vxodabbnyafcx6` (`album_id`),
  KEY `FKdeuo22tpds36q0wgsmgr4sk07` (`album_owner_id`),
  KEY `FK3tib09hs6tw9li47y0bl3u153` (`requesting_user_id`),
  CONSTRAINT `FK3tib09hs6tw9li47y0bl3u153` FOREIGN KEY (`requesting_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKdeuo22tpds36q0wgsmgr4sk07` FOREIGN KEY (`album_owner_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKqc290x0w7p6vxodabbnyafcx6` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_share_request`
--

LOCK TABLES `album_share_request` WRITE;
/*!40000 ALTER TABLE `album_share_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_share_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_message`
--

DROP TABLE IF EXISTS `chat_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `chat_message` (
  `id` bigint NOT NULL,
  `chat_id` bigint DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `receiver_id` bigint DEFAULT NULL,
  `receiver_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sender_id` bigint DEFAULT NULL,
  `sender_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_message`
--

LOCK TABLES `chat_message` WRITE;
/*!40000 ALTER TABLE `chat_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_room`
--

DROP TABLE IF EXISTS `chat_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `chat_room` (
  `id` bigint NOT NULL,
  `chat_id` bigint DEFAULT NULL,
  `receiver_id` bigint DEFAULT NULL,
  `sender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_room`
--

LOCK TABLES `chat_room` WRITE;
/*!40000 ALTER TABLE `chat_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_room_messages`
--

DROP TABLE IF EXISTS `chat_room_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `chat_room_messages` (
  `chat_room_id` bigint NOT NULL,
  `messages_id` bigint NOT NULL,
  UNIQUE KEY `UK_boxqru5ivx6wq413veck30vw0` (`messages_id`),
  KEY `FK5108ijvatfgdio79qpd2y3grx` (`chat_room_id`),
  CONSTRAINT `FK4n05hylixon6nrrmtt7881ol0` FOREIGN KEY (`messages_id`) REFERENCES `chat_message` (`id`),
  CONSTRAINT `FK5108ijvatfgdio79qpd2y3grx` FOREIGN KEY (`chat_room_id`) REFERENCES `chat_room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_room_messages`
--

LOCK TABLES `chat_room_messages` WRITE;
/*!40000 ALTER TABLE `chat_room_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_room_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `sender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKic2n3aj5h1qa1mo6uhce27isd` (`sender_id`),
  CONSTRAINT `FKic2n3aj5h1qa1mo6uhce27isd` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'aa',1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `friend_request` (
  `friend_request_id` bigint NOT NULL AUTO_INCREMENT,
  `is_accepted` bit(1) NOT NULL,
  `is_declined` bit(1) NOT NULL,
  `sender_id` bigint DEFAULT NULL,
  `receiver_id` bigint DEFAULT NULL,
  PRIMARY KEY (`friend_request_id`),
  KEY `FK5rji2dcs4fmykw6ovpsyv5ssw` (`sender_id`),
  KEY `FK2j9x9icn4n27jgwx9daltsi9a` (`receiver_id`),
  CONSTRAINT `FK2j9x9icn4n27jgwx9daltsi9a` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK5rji2dcs4fmykw6ovpsyv5ssw` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_request`
--

LOCK TABLES `friend_request` WRITE;
/*!40000 ALTER TABLE `friend_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (2);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_comments`
--

DROP TABLE IF EXISTS `image_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `image_comments` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_id` bigint DEFAULT NULL,
  `owner_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_comments`
--

LOCK TABLES `image_comments` WRITE;
/*!40000 ALTER TABLE `image_comments` DISABLE KEYS */;
INSERT INTO `image_comments` VALUES (1,1,1);
/*!40000 ALTER TABLE `image_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_comments_comments`
--

DROP TABLE IF EXISTS `image_comments_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `image_comments_comments` (
  `image_comments_id` bigint NOT NULL,
  `comments_id` bigint NOT NULL,
  UNIQUE KEY `UK_r3r0va4dbjv7r5bucu9cd0vu9` (`comments_id`),
  KEY `FK3h9670iietfxsvws34j0ka8nn` (`image_comments_id`),
  CONSTRAINT `FK3h9670iietfxsvws34j0ka8nn` FOREIGN KEY (`image_comments_id`) REFERENCES `image_comments` (`id`),
  CONSTRAINT `FKa33twe3l50ro32vk2b8grsqnf` FOREIGN KEY (`comments_id`) REFERENCES `comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_comments_comments`
--

LOCK TABLES `image_comments_comments` WRITE;
/*!40000 ALTER TABLE `image_comments_comments` DISABLE KEYS */;
INSERT INTO `image_comments_comments` VALUES (1,1);
/*!40000 ALTER TABLE `image_comments_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image_send_entity`
--

DROP TABLE IF EXISTS `image_send_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `image_send_entity` (
  `image_to_send_request_id` bigint NOT NULL AUTO_INCREMENT,
  `is_accepted` bit(1) NOT NULL,
  `is_declined` bit(1) NOT NULL,
  `image_image_id` bigint DEFAULT NULL,
  `image_receiver_id` bigint DEFAULT NULL,
  `image_sender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`image_to_send_request_id`),
  KEY `FKkeocejwdjg1wn93uqb8tw5rvn` (`image_image_id`),
  KEY `FKrmnf8i5yip7jqfpso8atfc3ub` (`image_receiver_id`),
  KEY `FKly77midh9eth4flxe7fy71182` (`image_sender_id`),
  CONSTRAINT `FKkeocejwdjg1wn93uqb8tw5rvn` FOREIGN KEY (`image_image_id`) REFERENCES `img` (`image_id`),
  CONSTRAINT `FKly77midh9eth4flxe7fy71182` FOREIGN KEY (`image_sender_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKrmnf8i5yip7jqfpso8atfc3ub` FOREIGN KEY (`image_receiver_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_send_entity`
--

LOCK TABLES `image_send_entity` WRITE;
/*!40000 ALTER TABLE `image_send_entity` DISABLE KEYS */;
INSERT INTO `image_send_entity` VALUES (1,_binary '\0',_binary '\0',1,2,1);
/*!40000 ALTER TABLE `image_send_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `img`
--

DROP TABLE IF EXISTS `img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `img` (
  `image_id` bigint NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `comment` varchar(25) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `date_uploaded` date DEFAULT NULL,
  `file_data` longblob,
  `image_name` varchar(255) DEFAULT NULL,
  `image_size` varchar(255) DEFAULT NULL,
  `image_comments_id` bigint DEFAULT NULL,
  PRIMARY KEY (`image_id`),
  KEY `FKrubkyi6nh5xkn2vw1nuxhetfo` (`image_comments_id`),
  CONSTRAINT `FKrubkyi6nh5xkn2vw1nuxhetfo` FOREIGN KEY (`image_comments_id`) REFERENCES `image_comments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `img`
--

LOCK TABLES `img` WRITE;
/*!40000 ALTER TABLE `img` DISABLE KEYS */;
INSERT INTO `img` VALUES (1,'Holiday','','image/jpeg','2022-03-18',_binary '�\��\�\0JFIF\0\0\0\0\0\0�\�\0C\0 	 	 
	\n\n\n\n\n

\n	\n\n\n�\�\0C\n  \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n�\�\0�r\"\0�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0 	�\�\0\0\0\0\0\0\0\0\0\0\0\0 �\�\0\0\0\0\�\���\0}��db�F!��db�F!��db�F!��db�F!��db�F!��db�F!��db�F!��db�F!��db�F!��db�bf{J	��`��(&\n	��`��(&\n	��`��(&\n	��c\�Ǫ	��`��(&\n	��`��(&\n	��`��(&\n	��`��(&\n	��`��(&\n	��`��(&<DH�iQ THD�Q THD�Q THD�Q,\�dJ\�\�bDs*$\n��@��*$\n��@��*$\n��@��*$\n��@��*$\n��@��*$\n��@��%@��h\�-\\�\��u�߶\"˫f����\�;�[���TH�%D�Q TH|O�o4\�ݖ�\�SI\�\�\�:\�~)mk�݌8�\�\�@s𡵷	{��D�Q THD�Q P�Gl\�\�J��5�D�Q THD�Q THD�Q TH&��şC=\�*~_ܻ�Qv\\�w[N\�\�Ccs�\�\�_\\��C��\�sSmF����2�0��a�@jk��������Rm�.�9�\0e\�ǳ��ţ����\�n�\�/T�kI\��ۑ7\�\r\�\�\�y;\�D���뭍{�\�؄W;���l*�QF)�\�M_���{\�<�\�j�䨐*$\n��@��*$\n��@��*$\n��@��\"$K����\�[�\�Ֆ\�����Y\�͘Ǹ\�\�\�\�\�卦\�B�A7[n>*���Zh-\��Kj����7id\�6\�{Q��Z\�\�\�B���L\�\�\�m4\�}��\�z\�bk+-=_\�-\�Y�6��\�<E?c�W\�x\�\�M��]�Je \���\��e|�ns8\0N\"B+Z\�Q#\r�D�QEDAa TH\�\�>�THD�Q TH|L�u1\�E\�\���iR?N\�\���;z�\�;7XG�e��z�\�)sckٺ]\�\�u�𛅆K5^b\�i�Ygt�\�ا,���Iٮ��8l\�\'�\�>�N�V\�\�z����nnk\�\�nE@\�ly㑰9��9x:Ag�uU�\�\��!\�ڶ��\�FY*$\n#����e�A%��י\�\�_V\�W$c��H�mQ THD�Q DD�b�͝�A\�i9Ө\�b��O4��_sZݶȍ��ֵ\�m�\�GO\�\�\�]��}YˑL\�v\�f\�\�<s\�\\GS���\�\�\�;n6���\"ֳ��\�#X���k�Ѣvul����=a�rT�}&(��\0��nF\�y8���8�z���\�\�竮\��fM����ZVϦa\��d���\�#ńAaXDO\�1\�\��療\�I\��a,V�AaXD�	�W�}�3MY5�U\�\��\��\�\�j\�k��\���^u+�;\�c\r�9Y�\�Wu�\�\�>k\�Z�\0Q�ݬ\�	~�\�\�I>A돟�=|0*\�s\��\�\�\�7պ\�Ou9Ս\�4
ʅ�ۍ���\�2W�\��\��\Z�\�\�r	�\r��\�\r��\�#�\��\rc>�q���\�0@~\��s)��\�WN�\�\�_\�\�b m\�. 
�\�\0��. 
�\�\0��,\�S�<\�iW\r#\��r4]�Խʥ\�\�Ր@\�zU�n�~�澢�\��\\kX\�I��\�\�	\�\n���g�D\�\�Ol\r\�\r�\�\����}N\�!̞Xs��^\�\n�/\�z��wZ�d\�]\�.=qg残��f\�lhl���9��9��y�v
ۤOe�ZI�\��ձ{���ٴ�\\�5\�m5^\�{\�ƞVU\�]KO���\�w\�\�Yư���1/wlT�靖JJY`\�\��?\���\�yL\�;*�C!x\���\'29/!&��C�4y>\�\�mCVY�Qܵ\�\�\��\�+{� w��Ӱ;^l��ݯ\�_FƮ\�\�N\�Bґ�\�\�x7V��\�~\�T\�\����%���Ev\�zM��\0V�l����\�#`r6 #`s\�RXM6�H�=���a���H�u\�Eo\�\�h�\�\�\�|F�\�}�ε݂>թ�Բt�g\���\�jA+�Z��Z��Z����|��ZFN\�\�\�66w.޴)9\�\�<�\0\���\����%nM}\�:�cC_Y\�\�\�>\��:u�{`�n&���ϓ/�7�هU�=_9\�t�b��\�zS�kך<3�&����s�NZx�p-[�9\�\�0J�\�w\�N�\�\�\�\�JG1�=+Cr\�W-����H\�:L�o\�nP�,lQ���n9�p\��:\Z���;\�{\�F\\Ui����^\�2ҝw�4�\�\�g�+\\\�.��
\�[[\�}��\�菺\�b|�\0\�n����\�ƞ��i\�CSá�=S�b�~W�u�ņ�B]����Ȟq\�\�\�W.IK�\�;q\�[i\��_�:\�^c%y>�iK�\�\�9�>gcv�\�\��\�\�u\�c�\�h.�⮮�n��\�uYz�%}��\�`y�5\�.k\�x\�T\�\Z\�d��\0{|�\�}jhn:\Z\�g�\�\�Կ�3��%�\�\�s�:kR�4�\�n�,�
��wM{�#9{R_r\�Rߒ��\�^@#��tF�74�\"\�/�̀\�0\�Hs!Wm�N\�\�;���*2\�=4�{�\�i\�:\�c��WM\��5\�B�\�u�\���\�[\Z�\�\�\�:�җ��\Z\0�溾\�\�����\��(\�Խ�\0\�z���_\�����|��q�\�kG������\�B�\�\������<m�\�>�\�\��\0g�/\�~}\�R��\�;�cCݍ\�c�<yR�Ҽ���`p�K\�ͺ�
ݻ�oq���c?.My֙}C\��\�~����K�\�iz��͇SA�����;\�\Z`\0\0\0\0\0\0\0\0\0z�d\��V~s�\�-o`r\��\�ҳ�H\�\�BewC�\�΂>����N�=s\�\�G�}:y\�\�7����t��ts\�\�AϧAj��z��\\v�s�\�KQ\�\�ٲ�\�il�\�ɑ\\\�Y\�.y\�t�\�\�Q\��y�5���\�y]��zAm�.y\�F\�f\�<8?���\�\�O\�iKh�_;nR\�z\�9�|:�}:9�\�#\�>��ts\�\�AϧA >��ts\�\�AϧA >��ts\�\�AϮwϸ\�χAc�\��c�\\O����\�|#\�i=\�΅\�S\�E6\����� �c\��\0�zϓ\�9�	ۜG\�=-�+�{�����i�_;�\�X\��]a\�}/I\��Mz�W�������\�l\�v>����\�\�Jn.S�v5*\�]\rA׍�V�����i{�9<m>/\�&g\�\�\�>�\�>�\�>�\�>�\�>�\�>�\�\�\�\�\�\�A�M�|�k���칹IH��u��\�;�e�\���\�O=}\�}-\�v4:3p\�\�A\�\�U�&��f�\��\�{Uura�N��\��\�W���OXF\�?1\�\�4�t\�Nm�\�m�t�+�[�x31\�\�\�z�f`\�HlC\�ca�\�\�.+c��F\�{㡦9x�e\�>�\�>�\�>�\�>�\�>�\�>�xƃ\�\�l\�U\�o||0C\�d\�.]g��ot�t�z�v��I-�\�[�=��10�}\�]\r\�\�Sj\rեz�g�g\�\�N�\�]Y`bi�φ\'�\�j;]~Z=\�\� ��Ι:��cC\�z{�79���t䬾�\"<�\�`��ıc\��>�e��Ƈ�;\Z��\�\�\��<x�\��[=KS,���I\�|1 \�|1 \�|1 \�|1 \�|1\r;^x\��]4l�
To�\�rr?\��~��\�K���em\�0\�\\Cj]z�ɐ\�7yn��7���k�y�fc���΂\�\�f��\�\�K G�5d�&��O�H�f\�@aU\�
\�A��\�\��hܲ\�@��\�_�\�\�\�q�&<q�3	�~\�n<{�+���\�\��\�\�x\�|�RpO\�\�\�� \�\�F@�3\�@�\�\� G��xH\� G�yA\�&;<��Zٽgm��\�\�y\�cy\����i�\�5uV� T׀\0�h\�n@�\�\�\�SM\�N�\�@�6$\�[[K\�j\Z\�k;������h\�\rh;}6b�����~\�\�߽�),��\�(m$�h�\�Y͑�G4�\�\�\�\�r���\�\���\�>zp�}��u�\nɳ�(\\%Џ\'�@�$\�@�	<$�#\�@�	<$�#\�Xy�f7YK���kj\�c\�ڶ���n9x}<@\0\0\0\0\07�s��\�\�r�D�+:V�;\��\�\�zY\'u>\�\�U\�%^yI��ݩd�d_mhۜ\�(^\�kCڬ>^#�\�r�\�\n��ĉ\�c)\�!�\�[|�\'?�\�y\�C\�>0	�?z>�H��\��==Id��C�ݱyTg\�\�܊QQ�UaK��\�v��fC\�U�\0\0\0\0\0\0\0\0\0\0 �z�̥|�\�i\�F�\�f\�&h�Y�Q\r���\�\�0�\�?s;7�fy�\�aV�K����\'}G>�듴���\�*��WL�/\�ᙁ���eI�\�\�^\�\�Pod%��\��A���\Z�\�c��rI\�\'�4�L0��\�\�\�\�\�\r0\�7x3\�\\\�Xk@>��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<��&�\�!�\�\�2���4#γ
����\�u�ǩ�[E\ZJ\�\�\�Ն��R\��,\�\�:ѺS\�\����y�L8K\�x4O8\�`\�	#y�4\�\���\'��\�H\�\�\�	bw�,$�\�,��\'�3NX\�&\�9c{�4\��g�H��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\�w�ۓn��^�Z�(���\�
���\�\�\�ԋ&ޔ\�l�\�\�y�<s�\�mS�\'x�NX��\�	by�4\��\�Ӗ\'�2NX�\�\�bw�$\�\���\'�2\�H�䑲ʤ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0yg�����J\�,��6e����xT��\�h\�<Ŗ\Z\�/Sf���M�r\��iI\�a4oSg��<��r\��XK\�\�,/k\�q8�$�L|2�\�\03\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<��\"�g�0O`l%�`�vXE3\�a&/0e��=M�r\��XI
\�\Zc,N�C\�\�[L��\�=\�=q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�@=2�\�+l\�L1�<H\�\�$�<BX1�$� $�\0\0\0\0\0\0\0\0\0�\�\02\0\0\0\0\0\0\0 !0P\"1@A #%3`2�\�\0\0�\0\��222222222222222222222222222222222222222222222222222222222222222222222222222223�\0\�ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddl22222222222222222222222222222222222222222222222226\r�F\�a�\�l6\r�\�a�\�l6\r�\�a�\�l6\�˪ƶ�ݛ.\�l6\r�\�a�\�l6\r�\�a�\�l6\r�\�a�\�l6\r�\�a�\�l6\r�\�a�\�l6\r�\�a�\�~\�Tdᚭ>\�\n��\�\�\�#r\')�X̉\�B�\�c��;P\�Fj22222222223�ddS5�l�MB�B$�\�\�Ty\n.�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�����������������������������y<Z{I��\�a\�Ǧe�`��\0Mt�;\�\�<[Փ\�ؔ:5I[Vf�\r�\�a�\�l6\r�R�a\��&{9\�=\�\�M���\�#\��\�\�Q�[j���%��\�\�Sy{�:2CW��Iǜ\�Ndl6\r�\�a�\�l6\r�\�a�\�l\�mJ�H�m�H\�
B %\nk�\�l6\r�\�a�\�l6\r�\�a�\�l6\r�\�a�\�ț�?�%�\�\�\�(LTp����54\\\�\�>z\�\���>�\�\�\�\�1\�j|��F�#	�%\\�######!\�FA/3���\�~�\�B�e�<��K�H^��\�^���[� ���abI%ykglL\�\�\�\�\�7L}\�\�/\��kM�<�Kz藓�����\�\�靐���_y\nIRVFFAe�uMJ�=3�d~\r��Y�B�\�Y.>c\�N5y�)�p�ʜ�\nbdi�DUM�is4�\�\�e��NO#_\�\�ߑ��\�\��>�=G�\���E�Gx�ם���0�7��\�\�$��B�@=\\�(�ۤ~-.zb[��\�\�~f�\�\n���\�ڢ�k[\"\�Ul>c\�M\"�\�222?q:��b�w\�\�J\�jb\rXjFv\���\�\�m\Z/Lb@E\�-2\�d�%Wq\'[L������������������������������\�a�\�9\��j�̠md;C�-]d\�\�m(�2Y�ef\Z\�/yb�C�	\\b/��\��\\\�fg�\�f���\� �9��\0���\�&C9�\�\�JfO\�\\	r?h9\��TI\�\�\�~؝�/�\�:�\�ms�\�C���y��Q\r�
�N �\�we?\�Y*\�g�7\�\�s\�\"q�Nc\�\�\�\�J.\�\�\�
ڟ\�F�\��@��trIrW�X�L	�,EC;�>X�C\��*u���hɲѵF\�a�\�l6\r�\�a�\�mQ�F\�a�\�l6\r�\�a�\�l2226]ZRG\�-qe���Ju�H�\�\Z��^s{J��mt�J]\�H�el̯���	lf�-!�G\�n.�AV�\�)%\n�J�迓\�\"�$&P�F����R<E�o�\�;oC�#.�BSU\�D\�]9Ye,,&J��\��J��;\��\�7&O��U���������z\n�P�w |��\��\'a�������\�ddddl)�i�\�\�\�\�\�\�\�\�\�\�\�\�\�\�Ⱦ�Yd�L�R�ߣGO�\�i*��\�\�mp~j,�<vB�d�K{�����+��\�UFYe!�$}��\�H�%\�
\�\�!����&�^�\���Bhq�\�H�\��˜Y�m�e<�	��+�;��r2�V	(�\�\�Q�\�l6\r�\�a�\�l+�\�Ţ���[^\�\�/�3�����y�YeΏf���V���_��\�WR�l-E�e[�M>\�\�\\�������������\�zO�y�3�A\�k� :6�\�\��\�$�\�5�\�6�~�8-���hm�\�c�ut�\�$X���0�䮕rR\���\�\�\�s+ԍ[��M\�Q\�\�\�\�Z�Φ��]		�Ogq�\�\�<�SE�\�\�pVxS\�\��;3��*[Z��\�B$H\�\�\�FFFFFFFFFF\�a�y�F㖤�o7Zc�y.D\�Z\�wA\�m����������Um\�\��\�|���Q�\�\�̌������������k<�FG��cpv�O8Y)z�4�:�\�r\�\�|�[\�58 �\�\�o_)=Z��:[\�+�\�\r/h�\��R�Z�
Tx���s�3�\�\�Y-$\�\�q�B)\�*�Z��ޖ\�e�I\"���\�G�y��\�\'>�BW��$��h��9/c>ꐙݻ\r�\�a�\�l6\r��l�\����\0Co��ߪIF�v\Z\�uYX\�-�<\�\�s\�oɲ��FFFFFFFFEn��Tt A\�n-���FFFFFFFFFFFFFA�*;MR�J�;�ҚZ\��\�\�/7\����L��\�\�N�R�IB.�\�\�\��-x�	d�kD��\�:ҍ!g\�������~�ϣ�-L�6C��E�\�H|\�l1\�]��8��\�Ύ���U7�:�L�\�o/ތ\�\"�\�<�\�\�C� V\r�\�q�\�n7�\�\�\r���\�a�|C\�̌����������\�~\�����\�2222222222222222\�\��WULo\�w��\�\�\Z�\�\�`k\�\�\Z{�a\'\ZB�6i�;\�L�\�.�J\�Uw�K�9�p\�\�~&�\�\�^
\��I\�u\�w��:Ȏ!Ȥ\�\�o0P�ٙ\��VFEm�\�亮\�\�0\�-��|n��
\�Q\�\�\�+�,~���D9�c,r\�\�h��P}Ͱ\�\�\�>֠$��%	\�\'VFF\�a�\�\�ddl26 �i\�(.\�\�dddddddf��\�ͥ\Z�5$98\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�=9J\�U\�\�W��y?E\�z2�J֩�ҽ6DzC�����X��Kˇ�+\�^Y\n]5�\r\�\�Q\�H\�\0�)\�$�3\�YC�W��˧o��ד�TL\�|jx�y��d5.�\�dd\"o%\�ɼW��\�\�\�7��I\�m���T\�|\�֏�F\�w0�ttveeh� \�R�\�I\r�\�a�\�l6\r�\�a��223��A��gRPB�\�\�\�a[��\�2222222222222226�b(�\�\�����l�-ꔽÛט�7�\�W�Q�\�<�r6񑰷�\0\�\�\�|oHs��\nɝU9\�}\�lp�5\�\\�\��5��\�N��\�A\�Չ\�LO���\�Z�5\�\�1F-p��bn�\�\"HZ[���\�4\�4�;<V��M3��1V\��6�\�\�q�\�n7�\�\�q�\�,/\�\�\�\�F��\�a�\�n6�\�\��]m\�\��Uv\Z\Z3Q�JS�m3XaWddl6���u�\�P��;�O>d�\�N2\�D\��1�\�����ړ�\�\�# �o��\�\�_E^b�\�ު\�\�\�\�	y|�,0���#�>�\�a#n@\�\��\��T�B\�\�\�i� �\�@��
eU0r� �<�V\�:5�Է�\�\�\�.�-�i\�\�4��\�RǤ\�$\�^q/�\�ϥ����qVI&R�Uv�Yv;z�Q�\�=� e\�s����\�HLS��\��������\�Xe�Eb\�(��4�N���sJ\r��\�qt��V\��dddl,,\�C�S\�įR�������L\�}��\�\�${�\�\�)1+w]b$E�\�\"�+f�)���Bї[�\0gǃ\�#\�W:\��j\�!B�\0S��G֦�KO)r�n-�,[\�B_�:F�\�|�\�

M�p���>?\�e�\�cϧz�0��X\�aK\�V^ޢ0\�\�7��˽ʁ�\�k�\r�\�a�\�l6\�l6it���O<�hU�\r�\�.�?\�\�qO\�cGg�\n�}uQp\�I�\����q��gf�v݆\�a�\�mA�ڃa�\�Y��ځb{m�\�!��\�)n-�\�L�i2�\�\�i�\�j�B��o59�5\�\�\�m.͆\�`n\rH]\�6�[%�x%��{^b�\�\��\���\n(���/p*�,kq�d�3�\�\\LV�B+\�\��\���N$�oD��\\H�ZҗT�\�?H��x��g����p?A�\�\\ҍ\�*\n[$y��8Wb�G�16\�q�\�n7����/+��i\�2��m�Eu����B�ӹ�UZ�\�\"=��lsΝ%\��\�%\�&�o[dcfI�\�l6\r�\�a�\�l6�\�\�]A���: \�đ\�y\�{\���\��|�4k�J\�\�\�\�]Ki\�t\�p�@Y2�W�\�=:\�I+m�\'!�\�\�8+�\�F�\�b9cBe6�\0*)m��%H%\�\�]�L\�35\�\n}�M�]�\�P5�)dן\�\�K#�4�G[\�\�%\�\�\�s�d�񮍱u�$�D\�m�\�?aQ�\�d�1\�l��\�6��\�a�\�n=Z;z\�%�+p4�2�$P\�\�\�Za\�g���\�[Ȝ�R^� �&���#\n���\�t�2\�\�H\�l6\r�\�a�\�l6\r�:�ݡ#ؔ\"�\�\�<�\�\�V��ݰ\�oQ\�t��lu%�*�V\�ZҨ^�\�|�Ε�h?�V_]\�I�\�m��\�\"�%mQ�;O\�\�\'\�\��2\�R�\�S/�\�\�._\�\'\�\�#��=�b�8\�\�Ʌ�cB\�lEʾ\\W��R\�\�6K!7mQ�\�\�\��\�ZJ�\�F^eo�\�l���\�l6\r�\�ZܮS7jkB̟ҔQ
%\�\�`�#nP\�\�lb$�w\���#R�����6N\�26\r�\�aC-�v\r�\�ì2͇Ag�\��[Zv�R�q\�L^\�^\�S��reO-h�+��m\�j�\�P��\�TuB3`��rrK&��wWR&�R�\r�\����:�.�:��\�]���8g#5?hr-t՞\�\rO/\\B�;\�]	���J�#\�n7\r�h(6 Yi�ؚ���$Ғ��5d�[Z�ښ�aj�ɬ�Ti\�J�ݪ6\�m�h���8�\��|\�	�����0��B)\�Q;b\�?S�wzu~Y�\0J\�ý\�êR���\�l6)\�\\�Mma��\�Y�lXޢ}MZ�\�&\�Ƥ~��*W�M����\rN\�YUރp�\��E_St��K���g�3M��y���DB>�\�:\�\�\n�r�a9�\�H)�E/���\�^L�\��߾\�a����\�\�|�\��a�\�n6\n�!Z�ء\�\\��\�
�[P\�\�\��\�q�\r�\�`������\�q6\�B:>��q����~:\�\�*�e5�\�q��ǙƗY^�eҟA�\�\�u�Y\Z�\������яE�D\�e�fU!\�*\�g\���-�q�?@pRqݮ�BQ���g�h\���&�F���]T\�ߣ�2\"<\�MG:K#��\�=�+UT/ד	�ICb6j��$\�\�CK\�i��gҴq�\Z\�R9S$Y\'�z��UP\�$\�F=�\�Q8&qG\�E��¯�$�߾\�`b�\�-\�\�\�ǦTtjf\�n7\r�\�kbW5���7@[�,�Uu�\�\�\�ɷq�\�n7\�+^�	r��P\�z\�%\"�D�\���G;��\�]�\�5�\�\�&/5�\�]_����^�{aqĭ�\�\�\�th�i���\\\�lmzk\�P���Q��{|Ҧ8{T�j0\�?D��D��\�\�[_/���_?���MT{̊��\��e*R��\0\�\�\�P����%/�\�[n�z\�jZvj,2\�G�\���Aۿ+0�\�M�\�a�\�l6���\�\��Qx�Y��&�y;\r��D�\�Bʞ6��)LD}4Rr\�ks\�䲕\r\��C���\�U�n�\�x�H��\0�.k-*\�0�B
1\�\�\\�\�\�\�m&\�\�Y-�a�\�\����\�e\�Nk\�\��\0F��d\�Z��ֹ;:\�\�\�]m���\�\�\�\�%k4��\�\�kҸ&\�n6�]%,l\�)�3\��D�\�s�z\�Z�e�5��\�\�n7�\�n.��\�\�%�\r�\�A��uS)�?\�X�\���\\�\�}s��r��\�X>�\� \�9`�\�,\\\�뜰}s��r\��\�X>�\� \�9`�\�,\\\�뜰}s�	�5\�\���1����\�e\�}P��(ZڇGh��#o?�Q�\��\rZl�8�\0.g���\�.�\��mC�\�R|\�\���$\0��T��C��|RE�\�\�\��8~0\�sj\�#��\�}r�\�}s���r��\�X>�\� \�9`�\�,\\\�뜰}s��r��\�X>�\� \�9`�\�,\\\�뜰}s��r��\�X>�\� \�9`�\�,\\\�뜰}s��r��\�X>�\� \�9`�\�,\\\�뜰}s��r��\�X>�\�\�Z��j:\�u�\�P�!*>C���\�\�(�\�:��j:\�u�\�Q֣�� �yp����pW\"
�\����a��\�j�V�ì6\�>
C���E�԰w\�T�\�j�M�)�Q\�\�ߏr.q;oY\Z��uo�\�m]\�4�n7�\�\�pa�\n��\�\�uGJ��GZ��j:\�u�\�Q֣�GZ��j:\�u�\�Q֣�GZ��j:\�u�\�Q֣�GZ��j:\�u�\�:��\�: �]P@$j�\�v\�}��%v*�\�:��\�:����\�C\�VG�\�}=�MdtUie�i�EoK�b\�+�K\�r\�\�=O\�\���/f�\�\�I���ʠ���\����B��<tc�\�^\�N���6�ڃj\r�6�\�f�4����/�v���\�:��\�:��\�:��\�:��\�:��\�:��\�:��\�:��\�ɥ��\�#\"X�9\�ȣ�sTȘ�\�[��\�\�\�lqm\�:��\�=�|\rO\�%\�r{�e\\�\�\�\�v���cmH\�;\�E\�\�!7\�ґ�.vd��2�K\�\��D\�LrqziR��BY�\�S�oD\�]�\�q�\�n7�\�\�R\�\\���L����\�:��\�:��\�:��\�:��\�:��\�:��\�:��\�:��\�:��\�o� �\��  T\���r_Of���x$�\����%�_A\�t �\�/B>RU\�G(\�\�\�7/\rj�v���\�.QiT�eUV�].���\�ɖ�Ӽ��)[��Yz[\Z�Ĥ9�U\�Qt�\�\�q�\�n:\n\�JҤ�Q�\�>=Á�����C���?\�6�\�n7 A\�t A\�t A\�t A\�t A\�t\�\�:��\�u���Se�J�j���\�OK�m��D\�5��\�� A��۶|\�s��\�F���\�U��Qރ�\�&+\�\�^�l�J6\�|y\"�I$MSc�	���w}�#\�n7�\�\�q�\�n7�\�\�q�\�t�\�\�qSi@b�¦S= A\�t A\�t A\�t A\�t A\�tٙ�D>w+y�$\�7 �!-9U$\�3���<��Q�EiT\�\"�-:\��\�eTa>^�\�\�%��\�A\�\�![��\�Zz���\0\���OA\�n:VY\�\��\�\�\������~H���jB\�\�gk�]���#�$�\�? @�\��@��\n*$w,P\�j6\r\�\�a�\�n6\nߊ�˫SkQ�\�7�\�\�q�\�n7�\�\�q�\�n7�Ǧ�I	|6��\�y�\"/�G@�}ŷ�p<�\rN\� �\�k\�k�\�	\�\�|�i\�\�#6��G\�΋n-K���/� A\�\�%��<�R�V*�&��\�\�t A\�j�\0�Io8\�A\�u @�\��ۢͅ�\�t A\�tGAҀ�ez��\�:��\�:���K\�S�QT�
�\\. �En���\�:��\�:��\�:��\�:��A\�g\�F|5�\�cz.�&�)#�\�f\�\r\�h�y�y\�\�\�){�\��,\�WN/Tl��\��D\�	�L\�5L��jJ1\\\�L�\�\'�\�\�d��L��3�vu�_=$�5�m\r�GQ\�u�����ډ�GQ0�]gb��\�\�B\�K��\�:
hm\�\������!4\�M�a�\�n7�\�\�q�\�n7�\�oA�\��
\�\�:���\�:���\�:���\�:�VX̙+{s��\�B�8Z���T\�e��Սn\�61z\�\�\�\ZT�ևR�\�:�\�Y�TQ���i���kF�B\�\�t A\�Gu�A?\�\�:���H]\�MIy;��U�C�\�M� @���}�\�`\�,Q�Ul6\r�\�a�\�l6\r�\���u\\\�PUБWk]�*\�}Eˏ�T܎��\�:��\�:��\�:��\�:���i���b�\'���.
g�l\r�#��VQ!�\�\�JS\�\���1�\�/@ԒS4@uM0Ì��{��Q�^�\�\��uD\�\�\�	���\�)\�\�kS�0\�\�\�~5\�\�\�̵*u���o^\�\�.K�j`=a	I)U�\�
]\�$n6\�C�E%QY7V�X��6��j(m7�\�\�\�h���ۨ\�:�GZ���\�:���\�:���\�:���\�:�����\��g\�wD�6ei��\\�E�#�2��O _)�:�Ka\'�bD\���\����/\�(!�\����]v\�F
˹���\�\�;�zg\�v\�Ъ�]Ѷ��I\�\Z\'i{�2\\�v�Rg���틽7�H�\�\�$�\ZZ�\Z�0��|\��[q������$��^;\�>E\�\�>E\�\�j:\r\�7 A�\�n7�\�\�q�\�n7�\�A\�t A\�T\�P|�\�\nI\".؍#\��\�\�%\�dw�\�#\�C��\�l�\�\�w�\�,=�R�\nBu6�sڲ���o&\��iNcJ\�{luL�\n��E2��j��$P\�\�b�\� V���5,8�	1duT���\r��eW�HY\�`u;\�1M��\�\�:�\�FJ��$!�U�4� A\�t A\�t A\�t A\�t A\�t \\\n�*��%P\\\�Q{���Ϻ\�}SFe\�kX��2x�и���\0h�G\�<�\�\�C�N��3\n\�\�\�GoZ\��\�C��6\�G.s\\�2t�ѿ�zU� �\�˪\Z5\�\ZZT\�u\�#\�\�B��5\"n�q\�\�Yr\�\��\�K��\�`����\�\�b\��v[C27�\�\�q�F\�Tf�j�\�mQ�\�:\�w��U�Uw\n�0\\}�0n*`���\r\��\0\�j��q\�%�P69Wp>V�p9A\�L�\0P�]\�M��9�Oum�В�\�sC3{��
��\�\��ִ?&*�_Æ.W��am�cv�S�6�ԥk(S�\�=\Z\��KD�q_�)�K*5�f\�\r\�ASL�T�\�T��������\n�*fF\�qS AS JbG!tB��N�B3���
�5�Wi�n�5\�(��?+9ڪ\�3Bm,\�M��]\�
)9*�\�\�LbK��{Lڃq\�t0T�SLo�T�SM�\�o�T�SLL0T�\��B%\�ێt_��T\�\"��f�o9����tS�6u�\Zig��lT�QH�Oz���JB��\�70T�\�t�T�SL�\�Q�\�t0t0t0T�\�T�SL0T�\��\\==<�YN	�H[:\�\��ز�\�;�\�X\�q4���QiV�P�\nLy��SM4Tʎ����L0t0T�S AS ASL0T�SEL0u�\�Y�cl\��h���Z�m\�
.jWaW5�\\���\�U�]U�\n!\�^ke\�z;\�Ӡ\�tL0T�SL0T�SL4T�SL0t0T�SL Z�\0mD��Wܱ��Fs�R8ܴ�\�\nRY��Ë�u�<[�4��_ASL ASL0t4T�SL0T�S QSL AS\�a�\�\�W��蒧Q1tR�\�֗[Q\��\��[e\�\� �n�zPt0T�\�T�SL4T�SL4u A\�t2�j�\���\�\�.6\�i|����4\��=Զژ:��\n�*`���������\�7��\0|KZu��n�4�z����*`\�+x\�*`\�n6��\0O�W�\0�7����\0����Q_���\��\�\0D\0		\0\0\0\0!1AQaq��\"2S���ѱ3BR\� #0@br�%�\�CP����\�\0?�\0\�0X,
��`�X,
��`�X,
��`�X,
��`�X,
��`�X�V+�\�b�X�V+@\�E,3{�\��\�b�X�V+�\�b�X�V+�\�b�X�V+$[F\��U\�j�^ղ�\�\�\n�Z�WYۃ����*���^97=�\��\�g\r\�\�\�\�\�\�\�P�\�\�y)�\Zh�Og�I�S��ͻ/s�\n\Z\�6�ϱ\�\�\�\�S\�S\�~\�\��\�b��������N���󬣚9N\������������������\�\�\�\\B�A����\��w)��\�v�@���\�\�\�M��D&c��Ǵru�U�[a;{#\�TEP̣+\�0\\��\�E6\��\�z�\�CY�\�k7���\n8k\���\�\ZwxۙT�c�tr<�ǟoQ\�\"\�pn=�\��\�w7P\�`C-�\�\�E�\�4%�-a\�\�\��D\�\0���\��6�\0q\'\�X��⥈\�\';�^�/�\�\Z:��ª���s��\�O�A9\�\�=��̂_e�\�\�G#$`p\�\�
�U�������������+U%4\�~\n�MVُ�\��6SA�\�7\�\rɷX\�b�\�f\�\�8Xn\�a\�y#Xaì\\;��~=]kOեsٵ\�\�d�;�\�pZ\�ki$����\�UUK�\�_\��\0\�:��y~Пh�\�\�T��[�\�\�\�\�5�CiT�_2;@\�کi ��\�\�K}\�X\�\�\�\��ש)�Cw#�\'�~N��7\�w�:��5M��W\�\�1�s�\�9v��W9�\�XSIS>\�<�עG�v�ݥ2j��\��\�\�\�d�\�\r�ۇ\�Az\Z�k�^\�\�b�X�V+�\�b�X�V+WS\r%\�p\�\�z\�*尸�����w~�\�1NAfN<��Z\�I�����\\��yv\\}�\�e�͚\�M\�G\��\�\�7\�\���\�\�\�og1m\�wq
V\�}h\�,[u\�յM3\�d\�}�8k%�;�O\�\�p%\����\n����l\�Kgd\Zwp�u\�ڎ�Rb�\�8\�����R\�!\�H�\�k�\0�U��Kq���\�\�r�X,
\�cq�ӵ(�py�\�[�رX�V)��n]tE�s�-\�,�h&��\�}�+&cpr�\�b�X�V+V\�Y[\�w�
�\�\��M�B\�l��p�UEK�\Z\�\��\�]�O��\�\�^ e�\�[�Ch\�}�\\q\�w��n�-#\�$\�7��\�j:i�6�;� \�me�k^�\Z\����\0\�G\�\n]ZfE���\�OE�-vM\�\�;��+��Y�/\�x\�\�yy\�Z�50\�T�re��\��\�U�:�p�9\�v\�ʚ�Xߋ��\��M\�X,
%ro7�yQ\�\�\�)�g��x}\�\�;\�\�J�?��\�b�X�V(\0���
�\�b�X�j\�j)O����Y��j�\�\0k\Zw�wH-����S\�\�\�{\�bK�ǀ�\�\�J\�\�\�o�\��\�\rt\�5͊>Lm�r��U]�\�\���_#~\��)a��\�\0ɟ5U�e�7�\n�j�jZq\"�v\�ZF�\�J�;���Z�$5ok���V�G,�Yy���V\�28_�ST\�ѿ8��|z�\�L���,\�\�h�\�G�\�\�]`�X,4�\�*Y=\"\0��vqM��� \�\Z\�\�_\�T\�;C���
��`�X,V�R))
��Or5:��;\Z\�n�ou�J�mUS��\�r=dJw�;F\�Q�w��C\�b�Z,n\�Ҷ�=�Y\�\�\�\�kz|�f�\�\�\�\��E,�\�\0\�\��\0���-�!� �g.;�;��-4�\��\���O^\�W���c�>\�U�k�18�\��\0Oi\�\�\�\�Aŭ���KVǽ���ӫ��7\�q\�b\�\�t�H�M!`�X,
�\��G⤖8��H\�:���ļ&a#n\�p��G�l�{\'`�>	�O���`ݽ6���\�\n*�\�g+�\�TW2\'b�u�\�N����#����E�>Q\�0��ϲ�\�=���\r*9k���\0[�g�c�\�)\�!;���5�\�U[^\�7�����-KK�\�\�\��T2\�UIy�}\�\�϶\�Ǚ߿�TP�/}�M�\����(\�U3D�o��S�\�U�2�����\�?\�M,�H�-���*�Y��\��\�\�Uld�\�s~��8wYE\'�m���\�f���\�\�c��\�PԲ�;��w\�`�X,���\n:b\�Y\�\��j,$ܪ\�\�!ȶ\�榨�\�2m+Cwܪ\Z��%Ɣ\�ž\�DO�F\��z��1��-�٭�٭�\�\�A��U�ٮ�\�\�<Md\0;O3ഈf�p<|\�D��\�٭����]��\�>?H}�\�\�\�<\�\�Ǘ%�\�OQ\� �u\�>�u�\�T\�zTnwY\'��P\���R�\�\��\�\�w���tN:�cv8\�\�V�̛��h�������_\�{���\�0\�J״\��np�-F���\�\�x6\�?B��`�<&\��~\�𵖗=.�Ok��\0]\�Go���?\�\�PESOR6\�\�<Q\�\�X��,\�
�ON\�\�\�\�f�kf�kX�IG�7.\��-EMLf����U�=
\�\�c��;�p\�j��zuƱ\�?�_groI�hϰ��]Pt\�P�U�\�~,\���	au\�V\�l\�\�l\�\�l\���ZvN߸�\�L��\�HZF&����M��\n���N���憻+u�nq�_\�<\�A�\�IS�}>\'��\�w#�Z\�.���\�ϛI�CL��\���\�VG�ݥt>C&�Y\�\��[5\�-NZ=F_{��\�\�\�zm��{����\�N\�dZ��ih�Æ\�$~�\�u-U\�\�\�\�\\,	�k�\rDU�\�F5�p\�^\�\�\�qŀ��pｔw;\�d��\�R�ɤk)��9�v�\��U-2�ۈn\�۷좩�\n,\�r\��\�д�V��\�?+�\�\�g\��Խ6���\�Iw�sU]*\�j$c\�f�/\�oG\������:^�]�ɔ.\�\�r+M\�v�Z\�%v\�ݼ>i�\�Hܚ�GxZ��MDp|n7\�n}\�\�Uu�u�\0��\�\�HC��ϑ�\�,wo ��\�3?\�w\�T�E��gRr\�\��_u;�~�RP�ب�}�\�nεQ\�\�jiK\��A\�9|֍\�M>�\�P\�Á;�\�\�SU\�\�R\�9����\�%]\�ޏ�y\��\�\�:]Y��\���S\�5}F�׎C���\�tz��o\�/�x.�VSŴ�G\0I\�X\��=\"�\n6y��L�1��l\�\�:�X�cO��k8�$o\�9\�\�\�
�eҘ�ë�{�6��f�ܬ�6)u�ke���dZ\�}EUSW��\�lg�r��4PG`\�\��	�2Հsa�7\�?_ª���~S����\0�r�5\�j}76��\�Dr\�ޙW�\��C�$7��\��r�-K@�z>ݡ\�a\�A����E��\�\�z�W�\'ϊ���O�\�-_\��>+Ժ\�f7[\�j���O�\�_\��>+\�Z��>|UF��RG�ѐqK!�\�\�p�\�\�\�<J��ϩ� \� ��/�w5G\�y\�\�ex{\��꿞j�Y��n\�oUZ\�J\r\�s\�_J\'��ǻ�y��\n�O���i#�q\'}��]���`\�\�6wa�7�Z|\n\�S�\0\�S�\0�\�c��\�ay\�\�j5�#���S\�-\�_Iק7��>{רu�|��Qj�\0��^�\��	�\�E��\�\�z�W�\'ϊ���O�\�-_\��>+\�Z��>|W���|��Qj�\0��^�\��	�\�E��\�\�z�W�\'ϊ���O�\�Zh\��\�E��\�\�z�^� |�\0�ͫ6�ڪk�-@k�\�\� �ݽ\�\rBX\�w\\��VmY�t��h\�\��\�\�\�ݟ��֩\�:zv:8\�_/\�@.���T\Z=eg\�\�~\�?�L}F�[i����\�RTe�Z�o>|\�T޶��]壶���ok�`�\�~��+�m\�_��3f՛VmY�f՛VmY�f՛VmY�f՛Vam�\�my-FWbbs�N�\0\�ߕ	���\��/\�b~\�Qjnɬy\�\�~��!=\��[e\�I2ҝ\�?UC,�\�q\�sP�yh�\�@׼{F\�6��nZ\�%^�\\_\��)4X
@g%$R:\�d
�զj[ �n\�\�E+p�V\�mV\�mT����\�U\�Y�m��[e�[e�[e�[e�[e�[e�SV2\�\��AX\�\�7�\�\�I;g�\�\���Ke;�s@�-�o\�ꖽ����E��C���[e�˖�GhZ<M��\�Z����l\��Y�F\�a��\�)\�\�[�u\�ZN�p��֣O2d\� \��\0
L��ѷz���ץ\�ֽ)�k\� Z\�]mV\�mV\�mS��8\'\�\�m�\�m�\�m�\�m�\�m��zK�X\�˹G^\�i\��\�`�c\�\\l\�\�\�Ϟ\nI�\�?\�yiݏ�\�5S\"~,\�\�\�n��[�U��5TصPM\�\�\�\�ZSr�2Kl�\�9r՜\�O�llȭ�U\r��͉��m���ݫ�&\�!⡴Am��\�[f��V٨�3\�\"\�O$\�ȧI��\�\�m�\�m�\�m�\�m��<d-֘l\�[\�!N�\�7��D�*�x����4�[k(\� ܶ�)Cj^\�R\��\�lB�\�\�**���\�\Z\�ܦjԛ[d]zCz\�\�-�\�-�ۅ&� q��g(\�Ly�P\�q+j��j��j��j��j��ⶡ�rl�\�t\�Q$�\0m�,7	�8sYY\�M��H������2B\�]m\�\�\�[~\�\� �zA\�^�zפ���\�[u�[u�[u�[u�[tͼ�\�\'\�\��	?s\�\�\'?�}��԰�\0VC�2��\�g�6\\QW7[\�ʹ@�IWW*�O��?\�FJ��z���\�tΈ\�D:\'K\�S�tV�q{��kLr��\�zS?wꆛ�3�a6\ZX�\�\��#*3����.`V܍�&�\�eE\�\���Gj�\�4\�=\�d{Pxh�܌\�̝22�23fFr�\�Ό\�o�Z������L|.tF�}�?eO�R��Ğ�\�y(\�驪-\�\��]����SV��*j\�&~�fFdfFdfFdgFdfFdgFe\�\�\�+�x~��`뽧��:b\�7p�u;\�n\�2< \�R<\�qFTf[dgFdf[d\�\�3�:3�\�Y�L�O��R�\�\�\'���`\�#:3#:3�:3�qE\���}\��\�\�$QE��\�\0I\0	 \0\0\0\0!1AQaq�\"2���\��BS� R\�#3@Cb��� $0\�\�PTr��\��\�\0?�\0\�1+�+�+�+�+�+�+�+�+�+�+�+�+�+�+�+�+�+�+�+�X�V+�\�b�X�V+\ZIO�H���X�V+�\�b�X�V+�\�b�X�V+�\�b�T�ue�p\�<֏AэZ�\�\�\�y\��+Q\�l�їF.���\�\�\�\�=\�QХ�	�F��A\�\nH$�\�\�\���`�X�DU\�\\=g�-\�GopT\�\�*ZÉ\�\��G\�z\�,)�\�\�\�y\�\�S�oP��p�4o�n\n�D�\�\�\�\0wd/\��`�X,
��6���ŷ�R\�K\�o\"
��`�X,
��`�Z7H�\����\�e Ji+\�\��Kp��\�\�O�\�ͧyp\' 0u�\�\�od��O\�i\�Pi��\�#&�\��e�v���\�Ri\�\�\�<Z��jh\�\�\�m�\�Q\��f�C�K=7^G�q`�\��֍\�Zh\��}`\�=\��\0�߉SO�Q;�Y�9\�\\x_��\��d\�a�A\�\� |T���
9��||q?\�p��*��9\�|��\�\�b{H{{\�MG����\���\�ǝ\�H�Z\�6�=k�_͵�\�X�j9���\�M��\�^{xԦ@\�\��W�!D1\�d&:H\�+�\�b�X�V+�\�b�VVT\��ڔ\\�*\Zn�S��FOiu\�o�\��*y\�l9\\[�n-\�;�<Хs��{��b\n�p�\�F_7~\��wrZ�G�\��F\�7\�\�\�<Z~
��S�\�p\�\r\�?ECA�\�lc�\0\�|O
�\����@�G.\��\Z:�\�bܿ	�O�\�ܜ\�R���cqi\�ɧ��\�\�ʶ���9�04?\�hp\�\�\�n�ǹ�V\�?yy���\n�\�`\�i�\�<\����\n���\�OTcD\�\�x���v*��\�\0!��C\'Rr\0]R�к2\�Ǹp�+&�\�\���
5�x��++++++,J�������\�PPM]8c\ZOm��\�ᡂ\�\�۬X\�r��\�k_J\�0c3\�{\�|\�R\�U4��\�?\0x���1��sy�\� \��Q\�\�C�\0��\�/�S\�mU`�ֱ\��\�\�zдOCXv�\�m4D@^\��\'\�uE\�\��\��\0�\�\�Q�f��0����\n��\�|\�v\�\�ǴYz/J\�)D\�1�8_{M�V�sC3<.[�\0\�ꦧ� \��X�V+Ȥ�\�`�\�R\�\��#���U�S��m�+\�M{[��b�X�V+`�mZJ\�u�\����U\�\�V�;lq\�\�\�S2��4��\�\����Y3Fc�\�x\� \�6�\�[{o�\"ި\�m�}���	�\�\�Z�\�u�\�B�}�\�G\�/u�i1T\�>\�\�h\�\�Z~�mZކ\�5\�\�K\�\�\�d�\�\�d{\'ſ�_\�J:��5�v{y��-.jY�\�\Zy�25MP\�&� 7�\�\�~�>�Q\�C\�\���\��\0�6*h���\�b�X��\�p݄.��0�oV9ۙ�\�n\�\�KkdPb��V\n�]`�X+`���V\n\�6\�i�\� ]�u�qo\�ˬ���\���,ߏ-�T6Ih[<��\�v\�\�-B�7u#��\�\�\�䛮����\�\��b@���z�g\�`u�E�w��~���|�\�\�[�\�i\�\�a�\Z�_�v�\0����jg�\�4\��n�\��Z���:{qi\�U�\r\\�5F��\0E�j���=�\�B��JX\�aM\�\�9-N��Q�\'���\\{���\��T�a�\�\�\'\�`�|2okq=\�\�YYYYYY\r\�\�ŭ\�$N\�T�;\�\�\�\�ڡ�3g++++++++,V�Hj*l	���SQcoh��\��\�ߚ�lT�\�\��ea\�|���(!���\�T\�盹8\0��Q\�O��#��\�޴J\�9\�c,.w}��*��\\�û��ky ؋OXG�\�>vU:k\'��`\��w�*�5\�p��Z\�b\�>���\�\�˕�\�`��M\�@{��_\��<O�A�IR
�p\�y\�~\�\�Q�ɹ�v{C��Q��\n���žʲ������hO{���ޙ�\�ofM�\��KO$/\�F\���(jj��a*��Z9�rn!6w)�5�rmF�\�K.>ʎge\�+�\�MV\�͚.�):\�X�w}\�=�;m\'�O8oi\�ܵ]U�F\�\�o\�䤚i�,��\�TNfh\rZv�Q/���؅ј��\'3���\�ힷ���O���8��wr���\��#\�u���y\�\r>��H��Wt\�;��(\�\�\���UPS\�
z\�\��N���|�˹��v\�<|B����9]}\��oն*����,�\�\�\�տ+�p\�=:J){��\�U��V+ �l.^�Qm\�өD��\�ܮ=f��\�^\\ma�j4zuT@մ46\�\��s��)�����Tq��^\��V
��`�*��]���g:\��.q\� �ⵍQͩ�k\�\�:{]`�Ze��\r�Z�\0\r\�\��x\�h�\���\�x���Y��-\�Z翇\�E�\�\�k35�l\0=��\�Rkr��#\����b\�5\��W�ۖ\\{n~\�Αi�G%$�ݾj�V��\���w��\�R\�
��G\�=\�\�҉\�i\�\�K�k~�\�kpViRf>V�|��\�	-��[ſPH�-R�\Z��K\� �oh�>\�ɥk�\�C	\�T�\�\n\�r\�Yb�Bb�\�2�n�:KYSS\�0
5C�W��g�\�[��\�\Z��C��3��w��[G�\�F\\�&꿡ޑ\�=�\�h磘\�3lବ�]Y\n\����7���v�ڞ\�\��\�\���Ǐ�O\�CwqT:L��=O\�?�pI��\� \��\�M�P���d��\��
A��L�\�\�\����j�\�\�G\�>$�\0\0��\�`?ӘKu`�\0\�hX.����Q�w\��-u�N�3�\�\�2G��\n��zs�N��k\�Q��\�@��L��\"N.\�\�=k�\�m�֣�\�CTX\�L��\�\�d�k=w\0;~�N��ۍӜ�-ZH)\\�\�\�\��e\�!6l~\��N�\0���Y�p���Ck%p54|P膒m��C\�a��1\�YStn�=����\��\�\"n-\�\�t�-M��o\�\��+�Ҹ�\�m\��\'RT0\�\�#\�P\�sԌ\���v���t�\��\0\����M\�5�y��^���]�f�4-R�N�\r\�\�^�\�}��s-Qøo�z���D1��[�\�=��B\�8X q�\0E�\�M�\�ȃ��r�\�Ʊ<\0#}\�\�i]��p�O]\�ܫ4m6���1�+��\rV��HH�-���PTTusFۀ\r��VWD)�J)\�>\��%\�!q\�X�d\�\\-\"�j�.\�\�_w�\�y6\�t���\�q�;�\�\�uN\�\�8L�(�>\�r1\� gob�\�\�ecctnt��o\�΅\�O\'��9%S�WN�7���,����m�h�jִIu4\�\�{{��(5 5�\0�h;����U�\�oVp<{\�c��^�\�\���\�\�(4\�~K\��?揿%\���Gߒ�拖]h�\�r�����\�\�zG�\��\�?��h��Tڮ�W\'W��,�D\�\�\r�\�\��\\\�\�$�\���n\�\�w��*��\�\���Z\����ʿJ��\��T�=]M� �T\����?y�*MN��~�><\0\��ĭv���Ϸ�.\��r=�°V\n��9\�\�H;J\�\�\�\�,ꌷߘ�(��\�\�h��^�\��\04}�/O\��\0�>����\�~K\��?揿%\���Gߒ�����\�\�zG�\��\�?��h��^�\��\04}�/O\��\0�>����\�~K\��?揿%\���Gߒ�����\�\�wEwGߒ�����\�\�zsD�\���-�lkcP魚@\�\�#�)4\�1\�{-�lkc]��\��\�+��{\�ۏj\��>��\�˹OoU���mV��\�w\�߂�*}v����\��\�Q҈��b�;몈t��#\�|��I��\�_�\r\�W]Y]Y]YMk@\�^\�:�\�\�v�\\-�lkc[\Z\�\�ƶ5���lkc[\Z\�\�ƶ5���l��\0p\�1���c. v|��>�-v��\�\�e��.�\n�UTm��\�\�}��\�$� \��tO7!i\�jZW5��6y.I氊v\�Z��$n\��N췭�l\�g[:�\�\�\�rX�ں��B\�c\�[;V\�ʶU���l�e[*\�VʶU�-�lkdM�\�l�޺�V\�Ԡ���i��.�isTQ�LF�#u��Oh�RS=��E\�\�\���P\�R[g�Ti��RCW�\�?qz6��\n�|\��H?\n4�q
f[2ٖ΅1*=G{F\�\r5��\�c[\Z\�\�ƶ5���lkc[\Z\�s�V\Z˕\�3�⺂�k� �O\�\�X\�,��\�n\��7\�S\�e+d[\"l7��l�\����M�k\�\�)ȍ;[\�8\�3�O��{\"\��$n\�e�-�l\�fMd��Jl�-棩��sn��͙Yl�d[\"\�ȶE�-�Mr76c�\�:bA��\�w\�曦\��H�\Z3\���4mćrU�S{1���\�\�U��b\�uM\�U6�S\n\�K����\��\��Z�tC\n�\�6T�US.\��R\���,i�R蕗�\�\�2��Ņ\Z)[\�-�Òيي\�J\�y(4(q�\Z(䛣ҏ��A86\�e[\"\�ȶE�-�l�dR1\�qO#o��w�\�ޫe�ҩ\�- 0,	���s�إ}�{��kQթ\Z�\0\�}n�\0�)�Wd\����Vh\�C�sT�W��o\�\��\0(	v�)f�\0kܨݳَ��E��w�n \n\�\�$qM2:g1�\��\0R����3\��Z\�J��Vd\��\�\��S�\�\�m�9>k\�\�֟\�[$��\���\0���i�\�\��\�\�N���Ȅ`�L#��]lC�l}\�d[\'r\�;�\�ܶN\�w-��l�\�eS\�CM�4�o�Ut��T�g �\0mʫ��\�\�\�M	w�\��\Z��\0N\�yRk/5�{ `;\���\�H=�;�\�\�ջ3�~��\\�֌\�7o��n�w�|�\�FX\�44�+_ˇ�\�u�\����\�\�\�M\�F���]�\�;m\�I,��uw\�w
�¡c\�$c֓~\�J��&���M!TWõ\�P8uNw\�B\�?WGݔ�{\�\�Ϲ��\�ddQ˟�\��*�iMFsu�6\�\�\��45ͺūR\��- \�\�֞\�\��o*���Ѩ\r�c\����߶&�\0eG\�w\�\'~׵#\�ҳ\�\�\�\�κ\�f�}S�j&\0��\��C\�d�ځ\�Х\�Jg���\�a�)uM^��Y\�\�~� 8\�(B�+���L�\�\�\'�ƹѻ&������\�S\�\�>�J�:�4Pn�\0Y-6�y`{\�\�\�y�\�\�\�ϒ\��\Z#�\��\0\�m;�G7\�o\n�H�\��p�\�\�Z�\�B\�\�������?\�\�浿\�\'H���7uL\�o�s+�q�B\�P�6!M�P�SaM�u?թ�OQ�\�\�iė\�\�X���7�\�\�[\�\�\�\�j=2\�\�\�kE�#�Ǐ�\�VꚎ�UO�\�?S\�\�9���,�\�Ep�r�\nl(B�\n�(B�(@�+�\�\�\�\�/�\�?5U	m�F\�]��\�n|{�I\�lx�*��١SaM�P��B!�X7�İ�a\�\'S�����\�WU��!�!B$\"]XA���\���(qA&�\0\��\�\0W\0\n \0\01!A\"2Qaq�� #BR�� 035br��\�\�$@CS��\�%4P�\��DcsE`d��Tt��\��\�\0\0?�\0��\�A\'!�#\�\�*\�Fc�L\�4M\r\�[_�\�\�W[K�\0I�D*�T���M\�\r\�8p+\�eء�E3eX\�V凚�A\�J�\�5G\�e%�I�R&N�\�\�y����ʇ\�Bq%�V\�t\�\�\r\�h�\Z\�\\\�R�*��Gi�G(F\'�
�\�7�.(��\0\�\�\�&Zz\�Y\�q\�?XzQ�a�\"\�\��7	��0� �\\�U9f�SJT���>�8\�\� �\�9p�t�\"Vd����v\�l\����ƚR\����v]9m\��$�q�zRf\03\���c\�^nm<\�>�\�\�YjvW�̓\�GOJzDm�\�\r\�\�z\r�2Ȟ�>�\'\�J���\�\�<���B]�ty鹃w_W22O@���|&�AO\�?8|�\�W���`P�\ZP2�͐�\�ܟ��\�7\�^��=5��Ƚt��x,#\���lK�67�6�T~0���i\�\Z5\"����\� \�G(��2�\�Z\�m��\� e\�F|�7�f�\�Ű�zA�\�S�P�\����<H�T\�lf켝\�\�sTd�:\�Xa	%\�穫\�b�t�����\\:���?\��S?JzQ\�Ud)*\�Rv~��Ҵ��$�6\��\�D-J\�\�}\�����<?5!o~#jK���\�(�\�5�s�s��`E:��ƽ�~\�h��On\�\�t/H�\�Z�+��*���8����G�^*\r*�\�T�,\�\�Py[>Q���0�4\n\�:em\�N�\'y���c���\�\�\ZG	\�X\�ij>�\�\�>�\�NC��\�:㒍\�\�S\�%��\'�\�\����C���M�ڮ���cFdr}�\��\�43qp\�a�M)�\�\�*\n\�\�\�:}u}�BtFj*��a�B�6�+<�}2{�\�S\ZnkH��T\��ȒO\�����\� H4\�j�\�\�nNaWJ9��sc�\�CO\�,\�\�\�%aCl$\\s%	\�F�Gt\"oG\�!��׶\�>N\�/\�\����.\�Ĕ�\ZoW4�bz\�b�范$~�0\�\�]��\0a�?�C\�\�\"��\�\�xG�8-�+��\�\�U�6�ZYB�\0���a)\�M��y�NB[�[ #I</\�ig\�mʃec�[�*��D҆m�BR{T $*\rL�ܶ�J�\���Mb�/*�Y�Bod��ߤܫ�=�m\�
Iȏ���ʏ2D]�e�\�\'Ŕ^?\�#Mk�\��|\'�\���\�(r����\\\�A�v\�H{L�\0�,47\"RGR � \�i��\�$�\�.]\�=\�J\�tk\���? ��j�o����HP\�\�Q\�S�֤�QHݷ�hN�h\rE�\�\�v�\�8�h�RJ���Q-[�\���֚�\�ך��x�\�3X,\�\�z�3+�\�-��c�NJ��{F+�bB�*��e�q\\�e \�\�P\�\0$s|	:rF9���T�W\�R�@���.e\�$� \�_9\�\��\0�ZᘬWW�m��3�\�O@\�{!\����\�\�i)�b\�e��\��S\�	\\��zy\�\�T�\�Ψ��im=\�YI�p��)\�\�\�q\�)\� ���}�69�x\���G�\�\�\���*����]E�\�8\�h\'�u�d\�5I�t�\�\�:stZbU\�_%<�\�*�\0{3�o�8�>�R\��\�U��?݌\�(�jFʫ\�ʛ(�L���R��@\�*bu\��8Z7��s\�&�\\˽#[�e�\�\�\'-\�)9b�aR��\�Ө>r�&�ȶxq��gO�U�2\�)\�\�M\�\�B�Rmhnz�Ci[.\�\�R\�\�x�����\�����ϛJ��\�TygI\��Q{\\��\�% �	;aN�25HϜǝoX�uE��GJv@\�+m\��GZ�\�b\�\�adqU�\".ZU�����Qs��\rEО\� �M�v\�㾋zߴ��ã��Ԇ�Jw\�#\�4�\����YR������~��\�􌬕\�\�\��A\�j<\�\��6\��FU%LY\nI\�\�4N��:\�2Q,�\�q�ꫜg��))O)3R֖���R]lٷ{�;����)�\\۲J\�/\�-\�͞l�\��+τ\n38ؕp5\\��u6���\�:��\�&h;.�q6��t\�k��Lq�\�\�.51��i\�T�%(���V��_\��\���I���\�<Yy4f�K(\�\�w\�r���YIJ[b]4\�rH�j��4\�\�o�)FT\�l/F�$SFM\�a��g\���@Q:�e�f\Z�t��N\�t\n��\�;H�NY\�\"��\0�G�{���\n�TRJ鏬ݙ�f��m\�_­=\�՝)�9H<\�W\�\�hN����%h\�\�}H�J^\��_\":��7�~�\�\�4�f���I#\��~�3p-13$\�yi<��\�p�\�^t\�8�̾�3���\�l#\�n�������\�%�(�?l\�I\�R�SL\�,�v�a\\T\� len1�\'\��	�\�\�f�p��ǤBU��S\��, \�\�\�\"���\r�\�\n_Z�LP曣\�ӳ�	p\�\�\�\�ű����\Z\�o	\ZJ\��\0���\0�(�ҍ)\�X�y�3+2\�VSm�s\�\ZU�f65�\��r���\�A�8��Y\�q��_�Ůog8�\0$ve\���\�vU��\�Q�\�G�)S���c.��\�Z@��W��F\�)�/��03���=6�Kks��K�<��\�=�9�^隙F\nL\�9ť�$\\��1�_�u	I	\�\�����*u\�NJ鉓�:xT�,���1w\�6�0\�zi�O\'h5#�xo� \�a\�\ZqR\�1<��xknRo\�ȗT\�V�i3*��o\�J�\�?�g�Q5\�ά�Xy\�j/\�\�\�P�\���\�\�y,4�\�/ʙw����d*�\�p\�a\�&cH&x;\\\�YU\�|O73KK\�,y�T򆫰g\�\�N��\�\��J��%oꛨ��SA\\\�W7\\9=\�WK\�f&e^�(���t�?E*GE&\�ZiAHS�+�\�\�]0%X�I5:\�U��\�\�Z�һqOly3K�)(a\�\�\�l�n��\r�\"\�Z�k�\�6���\�m�ԣ!��aFW9\��Y��\�fc�T��`Z}v��3�\\7�\Z*\�U�V.\�<ӽ\'�+M6���\�\�6l	\�M�i\��^nQC�\�{a<\�8\�\����\���\�Q*R�l9J\�Af�᪑/sŗ\�\�1^L�i��U\�T\0��\�8�Β�Ct\�\��I\�zM0���U[p�\�!�\�\n�Q<��
\"�&��\�\�a#a\�0i�*�-k`��l#\�Z\rj�Q~�O@��Y��k\�\�z �N\�f�ĺT\�Ī��{s\�)�4�\�it\�6�\�#m���A��[H�\�\�5���vf�M\�\�u\�J\��\�B�Hޡ�0��\�\��$�s\n��\�@>��=^� �ez�6\�s��,�S�>�\�\�ܔ�rZI�\�ex\�8zN\�\0Z�7�\���,��Vo����\�|Fe�\\�\��+�cXԓ�\�ұ�\�\�(	@\r��*Fn�6jaMZ�F��&\�Z��\�\�ŀͺ�t5���\�|\�6F��%\"\�\�Np$��\05\�0�/!C��e�\�@\�D�\�\�D\�A�\09�\�2\n\�C�\�x�\��[\�Ψմ� 7\�؈.ɍ�\�W�\��r�0Ʊ\\\�xc�J\�KN�[\�K� t\�_VΘ�9\�e�&[R-\�I�\��<r��s	.:ߥ\Z�\�y�k���i\�*~=T*���8���_٫\�\�Z\'\�Ғ�\�HfBQɐ�c��[$��H\�i\�\�ʦ�s�\�Z\�r��)\�7\�t\�%��e}�\�y\\�\�N�\��\�\�\����Vo��f\�\�R�ن\�\�Y$\�\rqc\�\�:�,����\���\�4�H�5ɧd��EH�e<\�H\�^�W��#����e �bM\�\�h\�rfV\\+�\��\�Ӳ8UF���#o
M9 �iL	��u9-�\�\"<�/[Zg�\�ڕ\��·�\�\0�\�T\�` �s��6��\��.u��m�\�\�t��7E�9�H\�)�̹궜���5#��u&�\�5k-\�\��\�R\�\�yK�d\�{������(\�M��gOB��э\"�Z\�\�rBokk���I�P�\�8\�Oɯ\���\�5�%6�\�\�7[r�;/��\r= \�ahP�JT�\�b\�&��f��Z%\�*!\�b �{��Lϡ8BTfe�ZT\n\�\�!/hׄ�R�t!�\����\�\�fj��M���� \\�\�\�\�\�\�\�e��Uy+�\�\�*�vRO�LL�\�\�K\�;\��O\�nQi*\"\�Z\r\�\���\�|^~+��qvFq�g��8\�)u�\�\�~e\0�\���\�x��Қzn�>����n\�s�3��(��K\�P�-\���s\��&��ʴW!+��0\�\�\��\�\��C�zA%X��㞚��ƹ�}\�\�#�m<��\�\�К�(�\�e\���:v,b=p�\�Z̻�ڹ\�\rm\�?�~J�\�S\�\'��&�NK\���/Ԩ\rMI5�\�S4�\ZW�!PѢ\�А\�\�Bf\�\�5tb\�\Zv�(�M�\��\� w���7<��G\�\�;s�ܛ�p�\�TT��\� \ZK2\� [H<P\�\�oO�����\n��g�n�\����\�\r�Tj�~\�\�\n{Fkk`\�blbO�6�|\ZF�\�用�\�p\�Bz[pmh\�\�\�8�\�\�1?L{d\�#����B&	e\�\�Q\�i=\")�j��Ɛ$*\'�\�rڟx�\�ҫ�����V\�\�G�$
\�
ja\��\nB��}\�\�\�\���R\�\�Pm�VN5$wm�i�\�\�\�Vq\�\�G�\�x�n�S>\�M�pj_OfG�5t*�\�\�I\��ßg�?�(kH\�Ngp�a*t��w�v\�\nџ	�/�\�Ve\�q
\�Đ-\��7E\�\"�>p��X�e�\�7\�6�,j\�\�\�\��K\��v\�y\ZO��o�
�y^\n�r\�`ٵC�8K\�\'1\�F\��\�iUdܓA�k߽\�\�vu^)%.��G%�\�`#�K\�ʽi\��$EڦQ��T?ԠcS?��?\���q1��\��S\�-�,\'ޘ\��=\�\�����哉�\�J�U�z�Fi,\�\�\���)U�#aV&\�|NJh�+\\����\�\�<�+<\�vȚ��֖�\�z\�ɧ�%Z���&�K8�L��Vc2}֍�6��h\'\�\�\�\���0��)\'q��^�\�<�p\���p\�q11[\�	\�9!�4�!U�fe�,n8��v\�-Z�\�SfU-2w6ߥ�b\�\�NɺӉ�7ŠO�#��n\�\�<\�I\�ٜO\�Mj\�<\�q�a�aKΧ�\�EDqU\�\n�=N�S��d\�ZsY7�ފNnSg\����\��\�Z�ͦ\�je �\0���@��喟\��\"�H��=&\�\�򙑞eD*Y\���l	퉝\�\�i�\'�\Z��D\�\�1{ᱥz\�)૊�\ni`%\\�	6\�ܧ\�J*\�bg6kݬ\�\�\�g\�\�M*�] ��uzZA��\�+��ot/�uu<\�$*W��V�t�I���c\�\\\�$���*B�V\��.�i-ZR����D�\�\�\�u��q�X\�i�S!��\���3-�1�Tvyh\���io�	� \\`:�RhI\�9���i\�\�N\�:\�����ƌ Z�βV\�>��=�G�4m\�\"e\�O\�U)5\�M�]�m\�m\�ϳh0�\��}���\�h��bos\�\�I\��\�i��\�L)\n��e���cE�\�^B�{�R�Hm��zV�b\�jt��IU	e�\��\�F0E�\\C�J�7u\��r\��Y\n�����r\�!!ElU����N˥H�\���LY\����aWl1Y�.\�\�7��4�R1\'�y�$)*P;\�S^���m�Ϫ6m�Gö{VҾ�^r�p\�8�\�Y��\�\�\�s�����|\�\�%V2\�\'��{�\�\�|\"\�B\Z�eZ�\��$��\�\�\�𚗂�\n,p���y�e]_\�8��\�\"�C��5Q�ʉ{c	�\nˬ^\r\'B(�Ɂ�]8[\�϶5��k \�}Gg쯶-�\Z=MN����du�mЉ�W\�\�kC��\���-/\"!L�4��\��\��\�G\�:\�\�\��MS\�\'�D}�EhH-��c��^5TO�1~�\�_\�0��߁�t�.*\�p����\�3_fW_:�9��d���\0;\���%	lg렟�+O��\�:����O\�\'\�\�\�[�����\�:6\�xf\'f�x�g\�\�`wF\�\�e�%�	�\�\�\r\�M=\�R\���a�RX�d��\�&\�\�Щ�JU��(M\�\�I\�+�Ά\�^�[+K\�6;v\�\��Z-\\fY��m-2	�=
��ݙB��h��!�:�U\\��r��\Zn��S->�t\�\�.�MH\��\�\�\�\�)uH/�*���\�[�Jzo\Z1Imѭ���dM[\0y���	#�\��ū�\�ո,\�g\�J\��u��\�\n�W�2�M\�h�8��(5$�M����\0�m��њ\�H�Y\�J<�)?\�\�d���\�&\Zx�I�#VB�\�b�ԃ\r�0˯�-*\�n��d\rQ\�M\�[\�\�HR��<\���[\�V�!Gc�lI�7�_��ȴ\��,\�m\�ܛ��1\�Bi�:{ŗ\�lg\�y�W�jJ1�\�\�-s\���_ +u\�\�&6��F�\�\�\�\��cZ\�\�\�ߩ��.�-ޢ\�T\��،p}�t�\�n\\�6=���\Z;K�3���f\�W\�Nj=�^ҍ&�q꼹D�K�\0K��dD�Cg7>MH=iS�\�\�ȥ\�{\�a�\�\�*\�\�\���8#!$K�\���9#\�M[!\�D\��wCNLx@Aze\�J\�SX(*���VlNTP�\�\��1�o���u�\���x\�R�&Y
JGQ\�Թ��\�N�c��;���\��xq�%:]Kd;�_:T\0P�*\�5\��*�\n\�re8�\�5�\�;\�V\�և4zZvFvA-)\�Wj��\r���\�k\�E�\�V�:�\��(<[�Zo\�\�GdS\�ۤ\�\�\�\�ʾ	\�JiU\�y�T�\�˒�\rߒ��{��*E:\�B�@�\��\�ܼ\�\�rvmv���N7\�\�O\�vBj\ZJ�Rx�,\�Ģ}Tۖ���-6u2!����>{M\�p\r�\�9\�\�
�J\�\��� �.\�E8\��.+�\�\�!�\�U��V1+TT��\�\�x\�,qS2E\�+\�
/\�/�u\�Ƃg$�\�i��br\\z\�^jGH\�=ЉI\n\�\�$0�H�\�\�R�8�$�o�Ams��X�WĔ+|l ŜM�w�{�w 9�+�0�> �.�\�\'tpeH\�\�j�\�LͭHo���\0�G�\�\�h\�?\�\'�%<u�ikǥ<���ӣ�4�Mv\�\�F�\�1����l�~�з֟��ஃ����s\rݩ\�
̯���*��_P\��=��$�\�U�\�a�\�mN\�̼0됼\Z��D[�:s��ԩ&e�\�\ZPCi�+|7\�/�\�1\�m+E�\�\�$��\�\�ŷڷ\�\�]V�=/�t�E5m�Q\�%\�\�\n\�\�a\�\�i�D7�\�)\�\��l݅P�%U��\\���b�u�߄P\�I��\�\�zQ�%E�vT�ݶ͊\�\��~϶e\�.-\�(8\�\ZKG7լ�a=\�^\�3(H\\\�\�I6��z\�B\�\�I��\�+YP�\�`yY��;�hr���\�\�,\��Ѯ>��,7���oY\�
~�W�j�^�L�Hc�2\�; \�\�\�f\��\�ﯟ�� ��ݝ\�ޗV�\��.�9�k��3\Z<�)&[XjO�J�3��LT\�\�EK!\�Y\�ic�RU\�z\��g���\�\�ҿ7�Q*\0[b��\'\ZOl\�ԭ?br�\�Enx���W�ulR>ȺNÑ�-1d\�\�������3R�)!\�fp�\�qӜ+��i��\�g˯�
�ړJ)<tc\�?���2�@\�n*\�1\�>��J-\r�z�\�!ߔ<�4\�e��U�����\�[ǅb0ߋ\�@�mOl\�ɋ\�\�\0\�ԑ�x�\�#�\�̹(�6�9��<Ǧ\rBh\�\�UVp�\�cRU����@�\�4\�{_V}��ě�� h
�\��0O9�\Z}��Kl�#\�H+2m�uNѓ0\�J���&%�m�XS;>�M��%�\�Ry n�q%�\�\"ʖOdb�?\�cW�m�zG�cd8\�ND\'�nE���\�=\�8�����ɗ\�L�b\�?g����h��\�N��F<v�~\�&����\�F�\�jEMy�\�g҉�r,�߲0\�T��\�\�J�h�$�G�/0\�>���\�&�+2�\�n�ucm\���z�J׉\�
\�\� �U~Xjbzf�4�T�m�6\�%���<�Mċ��d�\���r���Jr�Q��t�����\�\0jC*W���p\�
\rL�%(q\n6�\��\�烝*�Cm8\��|��ZN$�v\�Z��\0�z\��U\�Ѯ��\�)\�?�=6�\�P\�CI%�:\�\�\�A�\�C�o/Kz~\�\�Ԫ�N6�\�\\e\�!+Rq�:Ry1\�.\�\�`�d-=\�8f����ű���iH\�
	0�?�4\�\�F\�YƐmس�E\�4�{Ô\�\�*�A��ۨ\�\�ƽ)ݶ0�\Z�e\�[-ih(ۛ��\\;5]�ث5���\��Am��0�ai���(�\�ٴ\�\�j추\�*m�!\�\�i\�;{\�bi\�.eIfUO�Hlm\�ި\�&\�\�\�\�#�!�\�\n3�(\�\�\�ⁿ	 v�j~�\�T�E�ZևX���ӳrb\��\Z\�%jff���W&Q��}c�p�*�\n�̢\�fcj�=s\�9��\�J\���zy\�u�O�np\�ɷ�\�������=K\Z���4\�\�\�A7�x�\�\�+���\�&� \�邥��m�,�NȺ���ܞ\�PD`xz�P�[�R�0L?7�\�D\'�7���7\��Ѷg\�;Z�T\�QnVNY��Z_t\��\�)IQ��.\�\�\��7VZ\�}c�6C}EF$\�Tz�\�≟�\�HJ/t�s�mc\�ZI0̜����:��\�J�T\�]P\�[iK�bak;GOO\�D\�xJ\�K� �����\�jcW0���������QSoM-m�6�U[���GEb�Vz�\�ԢyEHXl�\0aN\�H	f\�%�\�U�Lp\�j�96ضܝKj���A�&d��\"\�������m��\'\�#.~�z��?򬪊\�JĴ\�\�l�b;bCI�\�۫\�\��A`\�U�\n\�\�\�OI-2�\ZBP쫤]--v�}�w�h\�r�٫h\�S�\�\�,�_zFc�ĕv}U6�b11;J}M�()\n�J�ٝ�2\�\�
h^\�%��*\�	�|%s�6��\�Թ�\'��\�8��#\���B\�\�L\�5\'K5)X���~�\�\�r�8㭠�8�=ݐ+�U�����\Z\�P\�\�=�<\r+�@F��.:I=;�L�L�ɻ�\�R����p�?R���\�پ�\�\�\�\�p�{��Xu�m��\�û�\��-L/���\��\�y\�ͪ�f�<|ԳEj\�膴�JJ��e\�:ܹ�F��a�m\�q�*�)\\Ti�\�:��\�Z0��\\A��\r�\�y2�q��yIB;6���熺ZU{pYhOE��=%R3i3��\�\�\Zid\�\��V���\�9:;z\�\�Q!+0�ӏŭ)�\�}�ß\�\�ʪǓ\�z\�;5���\��D.�]a�+0�Q�l��F\�CxE\�B�4]n	\�ڸUre)\�\�W\�\�~\�úC��\�Ѩ����\�\�\�y���m;*5�����\�\�\�+�l\�1=-2�,\��\0�n/�\�)Vl-3+պ��\�\�\�H�J��\�V\�\�au��T\�)ݎ\�MФ��\'\�鮎\�٘��\�	\�d\�q�u\�= n���\��\�8�*N`\'\r\�
\�a�\"UNI-e<)�_��_\�i�=�Q\�\�g\��B\�\'+4\�\��A-��[���ؔ�a膴O\\GJxʅ\�\�\�\�W\�����U�;#S,Xn�{�\�\"�BSiT֌Uu����\�{=]�=�O�ҍL\�*�(��?/+�\n�*\\P9\�<!Z9Z�T��\�ܫ��Z�ނv��\�\�]\rbԍ\�s��w���S�5:x�FY)	KB�e(\�\�	��cRՋ\���Y\�\�\"�)8�|\Z}�\�\�3.\�\�
�	�\�\� ��v\�\�\�\�;V\'h\�*yR3��j68�7�к-q@\�0�q\�\�\�nh�0j��\�}$��\04i68t\�\\\�:\�գ�ng��E�Z,�w�^g\�\"S/\�(�\0�M�{\�xLԜ\�i\\�U\�{c?�\�\�˵P\�\�\�\�\�\�98��\�\�Q\'I_�[S�@c>��8,�Ջg�G��\�xl����$}��|-�8_�}+�\�z5=Z�wf~�1T\�*�\�\�)\�\r\�\�	rfadlF�\\�״hƍ��E\"���\�\�U\�?\�\�i%i��$5줎S\�b\�،=�,DU\�.�����\�w\�\�\��m\�W�~O�U�C\�\��\�\�n\�Vw&���\'�\�\�eK\nU�\0�\"����\�l4�\nh�T�C�)2���Y��\�hB^M�\��B��e%B\��wH�FC�S_AMR�\�\��hޓ\Z\� ��/�����-\�2���M\�e�)5��-\�j�[�b��\0
\�\�ʼ�zAM���&��`(M\�P�Q�����}v��vnu��wұ�\�U]\n\��\r\"m����\�\�?�FiW\��\rRZ\�L�D
\�¶) �1�8:��k\\�+\�*�mt�O�\�~�q�l�_jqrﰻ��h�杻�\r|��h�1S!.#�f\�*9\�ְ���>Gne\�Џ������\�-\"\�JĥoQ�\�\�j�U�Z]\��b��`�rh�TU�\�Y\�_�~0�/�M�lI!ĝ�ӻ\n}n�s
�SqI\���x~\�\�h�\�l[\'j\� �\��&\�\�f=d󏈰P�5�u��%B\�RM�=\"\�W�O7,\�\�\r��\�祎\�پ��(� �\0����xܬR���bl*b����$\�9U\�\�O\�K(\�\\\�-7S�km����R\�\r�9\�X0�M\�\�\�)\�JzO?TL\�I>\��̢C�z��\�Vrm#$��~DФ�\�5��\\|\r��\�T\�e7�t6�\�.�%?i�4�d��\r\�&�\��s+O�T��^I\�۪\�.|el�+�c�^\�\�\�`\�\'j�\�u\"��3�A\�J|A^�Mǋ8�,ˀC�jR6 �\nJ�6 v�Pb�!<��N�\�,\�\�n\��\�i\�)U>�.\�)<��b�TjQ��*�+�Ӧ�ć\0Q��\�[e\�k|V��\�\�\�\�������\0�\�?^\�\�;&\�\�c�\�r�W7O^�\0���\�{\����-�&M]Xd��m\�@E\nri\� m��7�\Z�� ��\�R89r�H�\�^�3$ۋW�\0�m\��\�ZV�\�rBx���?�y԰\�}%\�\��\'��Ih�]>u���\�e\'\�0�����\�?%!�2��[J�l/i!B�� c�.�14	*ǃ-�0h�\�n9�L)\�s�����~Pg��\�L:}\']\\\�	\����\�f\�q�b!�0gˇ46~�	��y.!c�p�\�~5\�\�\�)�,[X�}��wM&\�b!}�0�\'�\\6[��� ݅[�a��\'�KNd�	ۿ8��\�T餘ª��3�F?\�[�\�l\�\�[
xTH\�wt9-\\�OJ��g\�+�2\�/�CR5��|�\�\�6�6\�Z�M���O�7Dڔ՜jF`tZ82�\\ܒvTSg��\�\�F�\�JQ+|�uc=0ޒP\�m\��\�[pbJײ־ö�}^PevK�\�|\�(m#�A�h�e\�:�$��;�\�\\\��\�M%�#H7\�\�@wĭ\�u��s5�\�\�m��\�}��-Z�GJ]b\\[\�]�}�\�,^*�sT�\011Kv����\0#\��1\n�r\Z�\������6��<�G\�=-3,�!�
\�׵�UМsUz\�MK\�r5V�j�\�CX1\�\�Ăx��i�۵df�R<\�\�\�>m�u@�YM�f�X��覛��ii�x��hn�\'�_�\"�),m�e\�/ؑ���-L/��%|�&�\�[�֎1=#KI\�Y������\�\'楦�\�\�ic�\����\�V�d4�\�Tr�Uҗ�k���R�i\�t%�TO�q�⮕]e\�]=����\�\�b\�p�\�΍\�ʜvF\�>�NC�\ng���\�ʲn�\�\��M*B^U;�F�^��\�\�\'f�X����<KS\�\�\��\��\�Og4\�\�eU�Ǝ4~#\�\�=!�U�)\�\'�ư\�e��\�\�=H�������\����84�UFjoX�0C{H\�\�E?�|\�6\�#h�>\�\�9��ڊM�P�;\n�ek��\"Q��\�\�9Ep�$��M=��\�qϜ6ї�D�G�*��%d\��\�`�?*�e��\�\�\'m�\��*R$\�vVw_wV�\�\�j伻�_V\��\�R\�\"\�\�\��V�P�\�2\�%h2h^��JW�\'i\�A�TB/$��og8\�ސ)SS/:\��7\��bn�\�9�Bj/��\�w\n�\�ϲ(�4F�Fjv\�K��Ci�+tFȑ�\�e�\�\�\�/�\�.�:����\�\�!4�&�ZM\�e�zm��5\�:C8ھ�¡2�O(�\���\��\���5P�x-��\�\��b���\���1O��\�δ�\�\�\�SΛ!��MU�\\\�\�bR��<�m�&\�Jfko�\�6����\�֖M�\�+\�0�_0ΰ�\�S\�h�\�Z[\�\�Z�c\�Z�ꇱa+�\�\�y\�.���t~\�\�\�g\���]l\���z�V^+�\Z\�\�\�E\�\�\�s�:\�n0\�\�%Y\�zyB�2\�\�i����5*�L �Υ�\�|7\�P\�c6H\�2n�\�\�2\�2�s\�믇gEউCR\�\�&�a\�?V*� J���Q86s_8ģ{\�?�\�\�\�f]�z�_i+\���SM�m�\�#��\�\�Nӥ\�MRe:��(jgG��˓\�pMF=�~n\�\�$i�\�a$l��j���YS���\��uCs3�h\n<_\�� ^ &g*�L�\�\0 \��$��x7��%ٕ��y���pq\�
��T��J;O����:\�Zw�BivA\�˨�U�8��ΐ\�\�\��l�*�nOLI�\�}Rt�06o8\�ͽ�\nX�I \�Q\�m\�\ryM���ҟ�\�\�\�\�qY�\�ܟ�\�5\�N,v�ҜêW\�\�祒ʦ	m `��\�Cq�\�c\\�چ\�f-e��w\�\��*\n���Q\�\�)壃\�\�\�\�˪�M�\�p��}Pn}\�5�,)\'%$�D��]KrR�\�zdz\�H6@$��7R�S�7-Ld�2Q{-}�[�8s�9*��5\n{�\�\�k\�G�\�*�h��\�2���Q\�c\�}\�\�\nq;l�VQ\�\�6ʾ\��\�[\��sS-�`���\�r\�xJ���=�\Z.�Eٕ9�\r�W|�V��I�R1���\r
��䎨j�]W�P\����_�&\'\�t\�w�5\�N���W\�~)퉉-A��qWa���S?W�1V+3Enq{��i�\�\�)�������l\0�h�A1�sS%\�M,\�Rչ\\\�%&\�\�.QSN\�;հ}\��O;6��H\�\�c\�5\�[\�0�|�0�u\��t)��P��au(���ƕA\�F\�3\�9�<\�\�\�g\�l0\�U��\�6+\�>�\��9�\�<P\\\��\����fU{\'����ϙ\�У��}��N\�1\�l&�.㍩��\�6���A\�W�e(w�\02�m^jd~��U|\�|ZMx��k�0�\�\�\�I\�GW<\"vIගJ��}U\n�S���H�%?X�C\�2T\�7/,��\�:y,\'��\�\r\"�mmҮ�$Э�S�\�NxPv_��\�e�je\�Zcˎ2�\�ܑ\�	�\�e6�ӎ��\�:��-\�lV\�\��\�A�ML�\�k߀L��}S�x��\�[`\�\�\\_lOS�\��e\�U��R�K�\�(D�\'B�\�R�N=<�3�	$m���5>�$�	V�\�\�=���\�ˊ$\0q/02<)�p�\�>\�=�?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$&�R�eթ�\�S��X�I\"Y-�g�[,\�\�%�ޫr�|к�?V\�FkQ&F/ҍ�H\�\�\�\�\'\���D���\�.�3\n�0\�{vs^nvX0�N�K�&@�aUY�j/�奩l�\�g\�p\�@�\�\���Kk*o+
LS\�D�sk(�޸2nU5ml�\�/f\�z�$�\0Hk\�2�\�\�\�I\�+=�#�[oDK\�J\�7C\�\�q&\��퉖�{XdО\�\�\rup\��$�v%eD\�Im+z��f�;/\����0\\mO&el,4�\�\�ˏ�Z\�\�\�e��\�\�\�\�r�)aA{֬b\�]p�U(\�-\�;JM��\0#+\�\�\�\�2\�4\�\�!�S*�Y(ؓ�9�ќXRīM�\�\�\�\��D\�i��uG�Z�\����>Q1򉏔L|�aF_T�ۊ�Rm�)��\�6\�e\�{Ն\�.�\�6�\0Y\�\�>S{\�����3\�s�G\�\�\��?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$|�L�����\�3\�s�Gϴ\�i\�\�>\�=�?$|�L�����g\�q����\��Z2\����\\;R<t2\�5a�w��:ӁIP�T7�\�3�\�8\�3�\�8�s�@����D�\��#b�G����!,�\��\'\n�`�\�!\���w��l��rN\�-���Uԣu�\��(\��\�֖\�r\�+v����\�&)4���\�ɭm�\ZW5��\�\�\�\�\�mH\�ߜ��y&\�9.\���\�\�\�B+59��e\��q�\�\�\�&\�YziSKZܚ\�=8\�\�a j�~ra\�Z�ַQ\�l\�bռ6aBo� 1g	�iFJh���O��
Δ\�Vγ
�VeV̮\"�$�fV[\�\�P�;\�\�\�T�K\�)ar,6�:�\�6;�c�i������\�JU���Ջ�F�錱J\�\\\�l����t~��8\�3��Y\�q�g\�q�g\�q�g\�q�g\�q�g\�q�g\�q�g\�qʎTr���\�C\�\�\�\�i�\��_�nb՜+\�A�;F]\�9����}%�\��L��=\�tyR}\\yW
�9)+�O\�c��\�G*9Qʌ\�E_�/������6]ĵ��<c
��T\�3\��X\r��\�m\�/Q\�m\�C\�3�qxO^ͽP\ZiJQ�R7���JM.Y�%���\�\�7\��|���g?\�e\�ifU�\�\���n_L4��yDr)��\�ul��\�S\���\�L(\�n]\�9�\���dKP�ƆZ*[\�\�q]p�U��\"���\"���\�\�
�h�\�\�\�J�E��\�/&\�u:1M%n��Ee\n��R�\�ò5���7�\�lqT%\��L��\�\�\�%.]#�8�q�P+��\�ƽ!��V\�%C��l\n\�K*�M���s\�\�%��\�[{2#1�\�69\�*9QʎTr���\�G*9QʎTr���\�G*9QʎTr���\�G*9QʎTr�m/)�\�v�/�Nn�&9NK�V� JF\�\��ѹ\�UbS\�\�\�8\�� 9\�V��\�vg�6���\�\�\�\��ҝ\ns�:ڞ`t�?�\0�\�\n�b�&RMhv�\�/Pl\�}��v�\�\�\����\�|R��\'\"ĪqBv��AF��~���N9Q�zeK\�J\�F�KJB�\r�m$nY\�\�M\�0G�!�n�mO\\��؟\�\"8\"d����\\7\�
\���\�)JP���S\�e\�\�%��R�\Z\�J�wD\��*&��^�K\���n�Q�vn�>V������)�X����S�)�qj]H���\�\\�bM.\�ʿ8\�l$��HZTF�հ�\�Ԥ�\�\�\�:�P�t��j1\�cݼs�=�\�a;��+e��/3K^,\\�#�Ut=�[��\�.�	\�̎��\�c�#�U\��\0�L\�	lN����>�\�\��0\�\�<���##��D\�\�3H�\�\�%%O6|�kA��\�#���i
JIn�,ZZ�vb\��\0\�if��K���	\����S���$t$��S	u�]*I\��2�\��\0���\�\�=<fP~\�JB\n��\�\�
~ux[^�J]\�n	]\�\�L=QX\��v\�艺\�ӵ�H?E9��uy\'i�\���t%G�d\�V����y�\�q.^�\�����a\\\��q\\�Vg ܘ�q�usʭ}x�\�1\�ͩ�!.�<��۟�(!c�f\�\�UJ�\�^\�\�\ZA�\'�\�\na�Z@#��x8�\�G\�X\��ظ\�\�\��\�{\�\�\�r|��A\�O\�\�s\n��4`�\�yQ�Ia\�>���k$��)\� �L\�\�)1/2\�Ҟ�fi/�5�\�+���\�\�\�%*\rr\'��6�o! �Ez�w%}\��Em\��\0̦U\�\�$�85��1ۢ��C�\0h\�|R��n�:�D�C4V\�\�e�n�/�\�\"R�m��1�c��\n�\�M��P�\"�\�����-�96\�J���w\�\�M���)nˠ\�ŤL\�\�\�\�dJ�)�W�3Op3\�l��\�<U\�{g��Y�\�OI<\�5�5~��ŕc\�#g\�FR�\�Q\�d�7\�\�\�Y�\�ZXKki6�8�<aO��)Xq�R�_nM\�[\�$�~0\��6e�\�u�c^\�P;zW�IϦ\�f$\�8�4bb^�O7\�!�đ\�D2�\�q���K�˗\'a\�\�tW�\�}M�\��\�\�r�F֎���YŲnE\���U�%�4����]V۬so�G�\�UےF\�9�\�,\�\�v\�V�ޤ�\0[E��_k\�!��\�:��0���,%=\��f9&��*՜H\�6#\\md���X\�
ŋ\�)<�P	�,��\"u��\���\��\��\�\�\���3\��\�)*#\�S(;\�b�\�\�,8��_�J\�(\�n6\�u\�[u�\"�0\�ʹ�q\�\�b;\0J\�˾\�\�-U�lJAڳ�\�\�\��Ip�-i� (�}����O\ni��T�\�\�4E�����H�n��{��e9��z&k�\�åZ��e�+�i\�Q{�$)��I��\�Ӹ�}+\�ư\�6Ei�9S��%@F�O�\� ��\�ܩ�\�?\�m�g\rtJ���Qx�YK�=�\�\�\�\�YR\�I�\�.\'���m�Q�~σ\'\'~[\�_p��\��y�{��\�qQm���,�\0.�\�ܡ@�}\�,��
\0۫���y\�~,\�?v�g\0\�V\�1�f8�w\�&�Qel�\�?\��\�e�K\nx�����\�<O\�I�i�%�0�\'ګ��x\�XUeSSw�-lA\�6��4�,��qgt1)Y��+�R�ܕ�p	y\�]?$눶\�vQ�\�.qߐY�/�<\�\�`<S�O\�X\0̴���d\Z�ʲ\�_q\�$��\�\�\�d\�S;\�e\�z\�q�C�
\'��\�aNSٕ\�
\\��\���\�\�<��F���\����\��7�#��êaV٘\�7E��\��\�O\��\"]\����\�	�.T4CA!W�Sh͝�%K_\�\n�~\�K\r&\�Z��\�Sɖ\�z\�����\"\\��_\��N,��\0��\�̩:\�jCiW�\�\�\�&d��i�S�6z� \�C�VJB� �\r�\�\��[=ц�u�\�\�I=�\�@�g\�q�g\�q�g\�q�g\�~/8Gly�\����^@>o�eV6�\0|�e%j�\r�\�\�\�ٝ�g*�\�!Ju��.\�u)[\��鉹�\�ʾ\�ICAxR~��T�\�W�B\�\�\�+��Cu鶖�N$!�HA���br���\��\��ٲ���\\�&]�֛)+s�~�
��7nQ-H�ҮRϺ1AT\�-�+z\�0�tpJs+3j\�k�\r��J\\p�!6E\�B��?�\rܤ�ߍ�\�\�!h9)\n��%>�|J���\�\�?+%BF���S��Ų5U ��n���\�\�q�tv����[\�k�nq\�5���3N�g\�\�\�@)w�⸽R�y>�\0�㰭\�\�\�\�Q��\�����F\���Ă�m\�Y�6\n\\څ(\�\�DԊjl�t\�Dˇb���R�͕\�\�q�W\�
V��b�Xw\r�{s�����3�\�\�\�b;U\�hHuМj�\�4!���,\����f\�>��\�ꤊy�pM2�獸�����\�vQ�-\�\�M=�\��f\�\�N�\0(�\�hz���\0���{���uՕ)F\�R���\�-��N\�\�	����\�gF]�.<s=G�D�\�\�\�6\�k^\�\Z��\�k\�RB�	;�7\�q�ڔ�Jy=�QS�B�	V+a\�\�	gH��\n\�]�ŀu\�ۜ!��;`\�>\�Ԋ;m\� ����\"Y��0��m���\�\�3/%�\'5,\�]l\�P�1me�\�\�tL���F����_t%�<,�\��\�\�	BV\n�x��r�\\�Ƌ\�\�y�(w\�\���J���9|�(\�2��(\�2��(\�2�e\�bwT��{V�\�\\\��SgLԽ�m�\�W8=;\�\�uvX\�\�\�\�\�Tb�a \r�����&\�gT\�\�N\�37�I�Z\r�˺\�	7\�y����\\�ŜV���t\������l�\��\�\no��<]Pޥs��.~8\�&\\��d�W���\�RuN)Z��\�\�=Q0����\�^,�TM���t;@��)ש+o\\�$�P�#T\�5��Y\�N�q��\�\��2\�\�]��a1��4�{��n���\r�\�ʧ	J�rue8a�e�\�Լ#\�\�6�\�RԹ�_�V\�d-����\�[Ğ�\rJTKO��3\r�2��\�!+4\�\�.��ɲ��#\\\�\�7Ʒ?8��\�\�
�Í�I{�QD\�\�\�]uvJE\�N\�5�\nty��A�T\�\�\��r�`LN%Hk�R\�>�~�>P�\�\���C\�����\�8\�3�\�8\�3�\�8\�3�\�8\�3�\�8\�3�\�j��\�}��Ө ��RNc\���D\��L\�w\�\�{E�\�\�SR\�\�@\�I8�\�lj�`\�\0\�\'ĥy;X�\�\�\�9�\"�\�\�W�\\� �щ[\�\�\�9,�-�q��VRۜ�R���\�\Z�fkSN�O����\��f�\\]ӈCӳ��J*]~�7m?\�(M>�&\�3}\�\�Vju\�0�񒰬\"���f
�!\\��ծ_Ss\��;\�*YN!e\'�ڮ!\�\Z��dU�BU2\�|�nWT7��YB�2�2�N\�3:�\�\�\�ww6P�a(\n\�qJ\�לg\�I�3�g\�+wa��t6�Uk�f��\�_����wi�:\�\�R�u�T�I\�\�;����?�|�i\n<�\�.e\�\�m70�\�\�O\�O�\0Q�g\�q�g\�q�g\�q�g\�q�g\�q��8\�荗1\�o�\�\�[�.�\�|HrF`YHsa_$U��10��>�{\�fM\�u\�B���ԥ_�\�{~���J\�\�8��\r\�\�ԍA���\�u\' {\�\�1/�^-����k}!)J�\�JK�s�ɶ�@y\�lX=l�\�K�Kv \n\�\�\�a��\�8U�(�g�\0P\Z��\�<\�Jx��s\�\r�|,�嚶\�t�\�\�4`���w�h!�.$���q
��ԁ��2զ�\�u��\�\ZN�Yf\�\�\�Z�ɵ\�\������.��:��D\�i��a\�7�y!��3�J��c\nS`2���Is��bGH\"�\0lK4�w&�\��\0b���2(\ZϤ\�\�ٜ\\x���Yx�(\�7|Lrc!�ڳ��m!\�\r㺃go\\)R\�x/�Xna�]C�Zc�G\��-�\�Ÿ^��#[0�u8�i+@��a�\�9Ą8<\�vذaLӥ�\n ��x�MC�n߳U�j\�OߒR8\����~[yo�\�
}G�\�\nB�\�a\�:�@��k\�T\�u\�0�/\�\�t���ܺ|J\r�=q#_H�o�T�\0G���Lj�	G\�XO���\�F�H��e\�<\�\�о}�8? qS�6x��\��y��\0�̓ +��\��bU҅��#M�bx��5��*��v[�\�~!KO�0��\�@�3bW!\��`\�i�N1�+$us�jV\�pL��Ts6#X��7k�+��\'4v`��\�\�\� c\�,��A<��\��.\�)��4\�\�\�LpV�B\�G������\�\��GJN��T\�X\�����v�3\'�\�qxA��\0S�BXZ	i<e�\�-���\"˶!Kk\�]���{�:�qQ\"=�0�Lض���\�\r�ЙU\\\�\�\�\�\�kx�\Z\�Zɗ�X�Ol\Z\\��\�\�\r\�?w\�Y�{f�s\��8Z�\�T#[�iRy.6�\�\�\�!IM�Z\�mR�\�\�\\Ǣ8
{R�/.�\�9F<�)\�zY\�)�{\r�%4�HX�@L�n�\�\��қ\Zǿt��G�i�98\�\�<G\��i\n�����ĭ\���}VKN��rc��m�\���8\��,:˅*�\�Զ�< \�#��\��qgc\�\�2\�_4&vi�,`U\���t�R�_\�Q\�Dĺ>Be7o諛\�L�45\�<b=�\n��s�\�\�\� ���ٲ0\�؇YT`�K�X \"o\�=\n\�\�p�S�\�?�\��+v���\�VJ�r�P U,�n\�%�\�e�T�.m\��f6:1�\�|*N�fڿ���&\� ��+���\Z\�2��8\�I@\0��A�J��\��GJ\�|�.���\�\���\��*l.�
- |8�{y\�\�&��J#mm1\�ѫ�B�\�6^m�u�D\0N��ד\�{n\�q�[R�\���ո��~ɮH\�\��\�ǟ�ݦY\�RX`\�[\"��_�!\\�E\�\\jÊZF\��S\�b\�>\�\����\0к�d��蝙�<\�\�͸|F�=P?\\�\�\0+\0\0\0\0\0!1QqAa������\� \�0P�@`�\�\0\0?!�\0�\�\Z4hѣF�\Z4hѣF�\Z4hѣF�\Z4hѣF�\Z4hѣF�\Z4hѣF�\Z4hѣF�\Z4hѣF�\Z4hѣF�\Z4hѣ��,X�bŋ,X�bŋ,X�bŋ,X�bŋ,X�bŋ,X�bŋ,X�bŋ,X�bŋ,X�bŋ,X�f�y�\�o7�\�\��y�\�o7�\�\��y�\�o7�\�\��y�\�?\�\�o7�\�\��y�\�o7�\�\��y�\�o7�\�\��y�\�o7�\�\��y�\�o7�\�\��y�\�o7�\�\��y�\�,m7�����������������������Bw)U��+�\�4!\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�lf\�l`%96�#���\�fe;G�3\�h
V0�4�x\�s�B\��5Y�0\n�@B\�5����DDuQ���F�\Z4hѣF��-ܠ`B�\�T�ؠ�!��DR�BS�\�ѣF�\Z4hѣF�\Z4hѧx\�GĪ�F�\Z4hѣF�\Z4hѣF�\Z4hѦj���h^�j\�\�)5�C7&�\�f\�\�9\\dzK�\�\"�\�\�p×\\x\�\0\�\07��\�x$�א\�q\�^\�\�I�\�i4�M&�I�\�T�H  ��\�apU`\��\�ɕ���\�Vh_�F�a\�n�\';\�|�z�8\�/�=�3ᘎ����\�8DhGA�ʛt�\�qn�\0��\�i4�M&�I�\�i4�M?\n0\����0��;5<@���a㼙L\Z��ĴQ\�i4�M&�I�\�i4�M&�I�\�i4�M&�I�\�i�UQ\\�\��Hn\��\�-:�H��
\�,@����Aţ\�1���\�+\�, ��\�\\U�,$;�P@\\\�f�9\"�g�hy�2��� 8Չ
\�aC<\�%\�����+\�
9�\��%Ȫv�{�(ړ�\�C�\�@�1:�\�˄\ZDW�1\�+ŊZ*7Hb\�lap\�R\0�P�	��w�Iu�y�-Xt\�Uc{\�(Zk��2n\nMR�\�\'\��\�r\��\�h�����Jj�\�f�\��D�u\"��T\�\�N�%\�o�O2�+r\�)�	\�^Ť\�C���%\�xNj�ώJ��x�\�Ǐ<x�\�Ǐ<x�\�Ǐ<x�\0�19\�ќ\��\�\��\�?�V\�\�p�(\�d\0�\�\�2���\��(\ZhB�<���\�`���\0$#�*\��7��x�\"6 7t��y*�D ��h�G\�\�6��2\�%	\�rOdc�y.\�� 2��>�Fz�E5{\�ࣇW%\Z)��{��\�\�W/*$
��AP тa\�l0��\"��()SR\nl��v5p?h%+�\r�Df�J\��QN`6k�M+Ef4�\�`�EP�\�&�?\�#��`P�f��Qf�i<|) V��ZJ=ʨ��ұ�6CA��A��^�\"�\��]B�҄�w\�2\02�A���@h1\\��  dJx�\�\�\�`\�@�R9\�$b��}�\�C\�#\�.�v\�H\�[��\0\0\0������[��b廔䩔gJ ��|z�\�.�a�\�A�i2,��\�S7\�]��7K&3A)X�@\���YL\0��\�W��E�S�\n�0W\�F\0��kBU2\��\��	\�V\�4݇U`�?\�0�\'\�x\0�����\�h!��Z\�䘡(�:$ȫ� m0\r���\0�0\�\�N���3e�Ѷ��r0��\Z
0\�Ag\�^$�D3��9�\�\�+;X8К/\�\��.�#\0+�!$��\�\�C�\� 9�C�X\���)����U-\�Q|���?�\�g�� �։(\�$h\�R\'������J���=`�\0\"z�)_���\��\�(6�c�ٔ�<e\�#Ʉ	��t\�?�\0��P���9�p �\n\�B��B\0�V�\�>c\�>c\�>c\�>c\�>c\�>c\�v~\'\�|\�\�|\�\�|\�\�|\�\�|\�\�|\�\�\�\�L\��.�JʊS�@\�\�\"~ �,6w�!\rNR��\�5!�e\�\r�g�3�(,\Z\�P!\�4\�]�!\��]���`R\��B�\'�\Z8Z!\�T�&\�Of!PK\�;\0�D${��\�_�G�\�yU�aO7\"S\��\���:
@\�P\�1B\Z���d\�^w�yH�X�\\K\'�B\��ň#8�\rl\r@�JA1ļՈ6\0 \"\�0�\\Ҟ^�\�Opi&�
�s\�0��֜��z\\3\�GI�52W\��`(HEfD��Q�%W\�\�J�\0\n\�)�5�\�� M�!�����\�F̮6e\�r%��������\�O\�\�\�L\�\�O\�\nP9SI��������������������K( {\��
�`!�����T�H6�\��\0я��}D�\0�\0���\��\�/N/�{N~\�D\r
~#�u2M�x�q>\����hhP�\�>\�\0;�˅ّb��\�\n�P*�(\'��G%�+HŨ\�@\"���\��\r:eHB�\r\'�>Z\n� ��\0_\0\0:�	�M1/�r\��.�{8ݭy�w^;1�~�\��:~. \��j=�O\�\�\�k\�5 �| !�\0���!�s�&]P\�H�x�\�ʠD\�LD\�L~6W�Q\��\0�.�\��C�a\0�)(/+\�M \��,B���b�CD\���\�W�\�\0Q&\"b&\"b&\"b&\"b&\"b&&�YR��a�\��+ \�1ɽ��i�/R��	�\0�F���X6 ��J,\�r\�>K\�dX1akdXr̓뀵nUI��\�kS]��A4#[\�&]�K��$t\�:\�\Z�V	�U\�\�P!��\�ȩ��kX�\�F\�M�	�\�U�)+R\����\�s㕁\r\n0\�IOIΑ��\�\��t\\9\�͡!�D_��q	l3\�)y7�9�>��AT�	���|\0�BdY�\"\�T
)K�8�=�z\"\"7\0�z�����z�\�1c�&�Y�\�k5�\�f�x�I�2[DY�\�H�i�*>\�\�\�qD\"\n�,�\�\�\��k5�\�`:Gs�\�p�8\r@�@&\��
G\�k5�\�f�Y�\�k5�\�\�\�)G@�!	�\�\�^�\n�\�\0<�\�0M�\�P��\�4ȅ\�Iҩ�$\�P\�C\"�\'�DR�\0\�M��^LHZ��ȁ�\'���ƕ#�\���,�s�p���ag��㕰\r,\�\�Pq��A\r�u/hAbGb\\jV�\��\\H9��>\��i��\�\�A1φ\Z��c�	I�A��@dJm�<��\�.ʒ\�\�ðy��(Y��XS5+�V��CV�@hCh:S�Ӊ�I, �r\nE��\�Em-`�G(ހ\�e\��\�_�Q��\�\��t|�EWca\�!��EoW<\n�\�69R�\�{���o��k�\�W`\�J\�\�2&�� \�|G\�|G\�|G\�|B2�#F�\Z>\0x���������������\�\�1U��\�4�_�Π���j
6O\�\�r2i\�\�B�Z�rdkS�\�ȭ����j^�5��K\��\�Nnd�Xw	�⠧Ct,!�\"�\\;!�	\�k�E\�\�D@�x\"1�jH�I��e2\0\�$a$�S�\0v#-�\�\�R�\��Q\�-Cq��ǒyI�FD\���iA�\�y�;#�\�2\�\�0!\��\�X\'�m?THE`�����w`F���Ñ��:\�<\�bp\�L\�Ī\r7Pċ,X�b\�\�8�9(D\��\0��+ՠ��\0�\0�\��XŌXŌ\0-�\0 \0H��R��\�l\��W���d�\"�P��BQ��ݭ\�%B�&�^��+\�b�@NA^ F�\�I/\�8�\�p�_���:a8ˁ\�˸��I�2qQ\��\0\�1�qUไP+\0Y@���_u`CV\����\�!J�*�p`X6 \0IBA<�g�0b�1Zh\��d�\�\��5pKEy\�\'Ў�� ���Ul�O�c���q\nH\�dM�P���\�R3��\�b\�FuJ�\�x\�Lk\'�*�倫I\�z\"P���K�j>x
�|�^\��+\0�\�/�\0[��#8p�D�>cfo*(`_��o>!�n��\�$H�\"D�$H�\"D�6�~ ��?o繾�\'�Me(�z��:�\���(.U \������1e�<�{QG�\�\r��vBH\��dV@[���4xBx���\�\�8l�CAU�\\�m�$<4@�\�4\�\�U�UE�ڇڭH��V��¬m)�%�(��C����A�=�:Kk0h�\�,\�@0_��\�q�\�\�qc\n\�\�&�#?/-�Ps�)
\� �\Z\Z�V\Zf��X\0H���3\�,F\��D�㊥�\�N r\r�\\�1/!G�:�\�{\��7��z�Z��M�\�M \'O2QzT\�<I��C\��	�0x�;\�7�M�\�i�\�m6�M�\�i�\�$L\�w�K�׀_�b\�\�08�4R%\��\��=�\�n=vڀtra�1{O\�$#ND���	q�\r
R�܀�>\�[�� DGF;�f!�&N\�<*K4�JZ��G�A&�G\�I\n\�\�Jx0!\0\�g����1s���\���\�\�\�D�\�AMH��P�\0��\�D�\r�M�I\�i\��H\�Ā���� \�\�T2���!\�x7�7u؋
\�\�qI�\� К\�0 |�h!�I�o.ZcV�	�N��\�P�I�����0V�\�|\�i���\�hM\�\�`;��\�3o��\�\�\�m�6��|M�&\�o��\�\�\�m�6��|A�\�\'Px�%e\Zۈ9α9�\"\'�\�]�%|�p��
\�D!2�2A�ؔ\�2�f�\"D�\�;B\0���deM� �j\�\�
��\�p��`��\nճH� \�=#$!¾>2\�Bt�^��\0�|F����⅀8�uL��\�\�H�ff���\�I�W�(\�\�\�V����<�Zܢ\Z�/րG�S�ǁA\�\"\r.\0E��Ћ���\�v r��a]Q%9\�S\��|ȕ<Բ�\0С\ZE/�\�K)�3\�\�BWN\Z�� Z�QP*x�4\�B,\�$�_����o��ܹ\"�1�V�)6�h\�Ί��\�H�\�C\�4\"��+@\n\�%\�$�\�7�\�\��y�\�o7�\�\��y���!XѬ�\�\\AEX�!ͩ\0l\�\�\"��%.\�#�n\�C\�E�� pW�`�\�\�\�c�\�\"�a%A$\nP�� |�:�\��b\�\�\�\�\�\���\�Ǐ\���\�^w\�c� �p��t v;�\��\�����~(�M��Ⰽ�Y�8g�j`��R\�l�-�PJ~b�;9\�6E��,\�\0��\�#tW%{B\n�X~`\�\"
�\r?kˋi�\\K\0Eg\� �5G,�\�e���րT *�d裕�*T�\�B�J\n��g�ȰEE5gEY*�YƵ˃_\�4\�i��. ��j>0�Y3\�{\�)t��L�\"�\�c\�	\Z�\�ܚ�\�@ĤߑO�h��ǉ\�>b7	�Ge\0^iQ\\	��Ho|7 hȬ�%PhV�@�깈 Ӑ-\0.�\�c\� ��\n\���<��\��E[?7�\�=Bk� 	�OL|\�\�\�()\��\�ܳە��G��\�((䒿��\�/�q�AH`
�d��mrb\�sZ��\�I&<�\r\�_��f\�Pך��% \0\��\n �#�ȂJ\Z(Ī\�s1b\�wĘ\�\�.b�h�#)��������$%˜�5&��\n��b0\�?~\�Q�\\�ʦjM��Bd��0l\�\�\� �<\�\�zQh$�\�a���\��\"i\�?\"\�9�6?\��H\�\\�;\�m@\\\�\��DTZ�J愃>`\�I6\"G �C>\�\ZJ�F�VN\�`����|@��;��΁\�ҍ�x6�I\��\�\"\�6��F�iv�\�[\��\�M�VHjm+��\�<�:�|� ,@��0{\�B�\��&\�\�\0Yp\0�\�S\�\�!e\0Tuy.1ɍ��X�~�	\��\�d\���$l~/�;\� \��L\�0Q�4UA��u��Z\�O0\�B!Kj�\�
9��\�9|#�U�X\�j0�j�Eu\�E\�R�����(\� \�`�	�6+J@\�m�$�\�\Z����\Z5\'�Q\�A �Z�*:_��s x@�`�MF!(��\0�\�(8\�\Z���P��.68\�4\�j$0A\�\��\�g*`T��M�\�i�\�a�4�b-�`�2\�\"0$�3%
+^\Z� �u-\nj,\"w�!4��\0\Z`�\�5�\�\�ʃCw.o8�\�N>J�3yX%��\0\�x.������Az_I\�\"MZ5(\�J�`��r\�\�
qpD-n[�F��\�Z	{��&j*\0�\n\��xBpI.0A\��\�H�\�A\"�!�zwۄ6�1OJ��Yr\n�搄z��P� \�y\0�\��an(�Ȕ0q��J\�E\0�,)�D�0#֝E�\0�(B,R\Z���u �\�b\�\�_�����\�\��x�����E\�\�p�:�\�%J(��7u\�\��(Z��)�\ZMe\�m��^\�6o�t�fL�ᑯ�	\�*W�O�\�H��k��<:\�~�\�l��\�*��z�p�o7�\�\�\�o��\�o�\0�71K�\�Dr\0��yHd�Q�x�qAB�\�\�A���B�@J�%8\�\Z\�\�u�o5�\n��:\�@\�\�l\�\�\01��r\0��E\�A �\�)\��\�FU\�p~ ]AJ�\\� 5�(�\�\'(b0������\�\ZGJ	ĝ\�9�\��(dQ��$:����W�[���Z��b\�\�\�Sd#�F1��\�%�!\�U�t\��F�\�\�8oܑ\�sa\�;\��/\rq)7�g\�(\�I�#\�H>\�\0� :hd*^kF���~gc\��U@,\��H.�\rħ���qkhj5�AĠD+\��m6�M\�\�hK��\�(�\0fa=\�\\���\���3W��0�_.�ܔ2\��\��R�\�L�)IQX\�1\� \��;�\�uU#\�\�|\��y�\�m��%�T!!y�\�����\"\�2価KR<�\�,��+!K?�fʃ,�s�\�\��
E\�B\��ء��@?��ì&\n\n\n���v
�bO�U0��o \0
\�9\���֩�Z\'*�\�0+\�8\�$�\0ԴJ�z{�G�g\"\�>\�\� 5Gj*\��\�ې�]\� �&�(�K���(M\������tmjV+ 1�\�ފ��&
o\0Q\�\0\�h�\�@�K?����~!$	VQ��%\�1\�wP6&;A�:�\'QDj*!W�\�\�\niA9I\"�-c�\�/�-\�X�\�j�Op�ŷ�>\�*X.]�!\��3�/ �a�?H�a��x@{\�i\'R@(`8�\�!��Cp\�\�� �t!\���y�N\�\���ȭ�n �\�T\���\�I�n�\"\���G=֊\�\Z!���� ����P��\�9\\
\�Cq\�@\�\�ZK\"4\�\�!x\�5�,�\�5�\�OY}��ا\�:�@\�z���\\\�\�i/q\�@�����:WS*�\���P���Ae\�\\D/n\�Lr��|J!�MIn-\\\�bcį<+\� c\��[u�� XN\0��D�h DO\�k!}���B�7�˜�*Y\0��E�\� ��Ҁ�����<H���R\r��\�:\\=Bk�\0\�es��`\\�\�a*�O��\0Ø\nY\�\��\�[i�@�+����]\�AB�l�\�\r\���\�@�\�\�%�,�\�Q6k|Em���̘Slᢅ�^B�~ �\�&\�w�\�ϣ�� \�|&|���[�Kԙ\�\�.�\��??ǙcH\"d�\"�{d��b\�5|�\"����ۏ7�s�4z3��]�@֎\r��q@\'4\n1#!}�bH�\n\0h#+���\�HR[��O\�@���*�t����b�!�\04�;-\��`F�\r�R
H\0�3\�B��<y�rb�>�~\�.��\"�Z���trf���[\r\�T
\��8\�Zt��G�1�Ѻ\�QÀ�\�3�8��\�B��\0��P8�=��H�$\�x@3��{�/0`\�\�3L���CU\�7�Ɔ�\0\����\�^�V؋\�\�\�\�\�\�\�T��zd7\�M �\�^Q\06,X �H\�K��v
ꥉJ�M�v\�ߍv?�b	E�9�k\�\�y,� BK\0\�z��t\0\r\�T��E*��n�\�j츄[�\0�皴${`\���>s\���\�هđ2J��\0\�\�x�J�px�\�;����
$�\�/C\"M�l;\0&.	\�\�Z��#�)UP\�\0�\� 5\�\�^�\�\Z�\�\�|�a�\�С\�K^ꀇ�it�.kÕ�p$\�&�u\r�De�%\\�U\\\0M\���k\n\��BБs)�>a]�oX\�/o���f\�\�\�k)�bW<�r\n5s�sfD7�\����A!*��]b(n\r$(���u�Z3�_�-H\�\�22\�5\0�\Z4r`7X=/0X#.D\0��c���6,�k0�LW��L\�A.�\0��,\rcF��\rH\"\��Th,_�%h�)1�e�8\��W%,9�\�8�u�\0\��\�{�,�\�ka�r\�\nU\raI{�Mt��p�\�M\nP�+g8�7�\0\����\0��J2\��ʆٖÜ+	<!\�oX�8p~0V�\0 e8\ZS �(A\�(a�ܔ�<\�3\��<\�0\r��f_\�|	\�y�g�\��\�^���&�	����I�FǏ�\��	C
�EC�`\�\rK+\�A�%PE+\�꿕�CJ\��\�Ex\�n��\��JG\ZpDIu \�u<926
\�W��4.]P��T`�8#X*�\�\�������]�H\��:�\0\�#�\�\�\"�\������V��A�0��*�\�\�<\�\"�\�QK�L�\��u�qGcI\�3\��<\�3\��<\�3\��<\�3\��<\�3\��<\�3\��<\�3\��<\�s	�l���ne�`���T�\0��v\�۷nܝ\Z\�۷nܹ��n�O�:�\�\rσQZ�h\�H\Zb@�,�c^�����\�:hI\�t[\�M`Pg%\0\Z�1P\��2\�Rk�DE1`\�1P\�E��ѱ�q����������\�{\�D9M�F2W)u��\��܅ۇ\0\�h�\�L�\"6qу��d�C j�4���P.q(�\Z\�7�hU	\nU��X 1�&n\�\�:��F5A\�\�$Erk�\��\0\��$ݛv\�۷nݻv\�۷nݻv\�۷nݻv\��v˗d]	Н	Н	\�%����!�Pr���5!�^ \�T�	P}~.�\�N�\�N�\�F��L^\Zz%tjZpLs[�B�è�Z)H�E�\�8V\'\�\\�1Iji��:\Z
sD(oX\�\�\r\'zq\�Ojq:	`�,\0\Z\�\\����]\�D1\�;@Z�\0PA�\n\Z�\Z`DLN\�Y\�B$�\�0!\�;\'NG�A\�I\�\�\0�\riD����#]�̢
\�L\�\�L\�\�\\ͥ�\�L\�l
�\�vF��\�N�\�N�\�N�\�N�\�N�\�N�\�N�\�N�\�N�\�N�\�N�\�N�\�N�\�N�\�4MD\�(��\�}����\�\�JU���X\r\��Ix���\�0��)f��h�&����p\n-]��I��#�d#N�7nE�P@煠�M@<�Ca0�\�\Z\�A,\�җ#B\� \�\�)�\�n7U�\�Z\�\�\0��zR�\�=0ܾ�j*�\0K\�@xP\�#�!\0�<�b\�\�=���<vq\\���\\]W\�\�iV���+\0 Ĉ v�k��3i\�;�t\�Ӻ-�Ǩq�S ��\�\\F�\�p\�\�\�4MD\�4MD\�4MD\�4MD\�4MD\�4MD\�4MD\�\��\��b}1>�\�p@!\�0\�N}���\�E\�\�K5\rPޜ�3\\`�jA�� \�b�\�?\�\"�p,\�\0|\�=3i1!>��LO�\'\��h7*UMw\�\"��DL̜\r,G�\�\�\�@3p\�c\�!l0����\�\0W\�x @Z`�@\�P\�Md��A\�mB\���x�b�\0�\�ɠ\�Q@W@\�]\'�\r.�\�\�Ր�O\\�� �=쀄�deJqC=�-\Z4hѣF�e���Cfr�]�	�\�\�\�O�\'\�\��\��b}1>��LO�\'\�\��\��b}1>��LO�\'\�\��\��b}1>��LO�\'\�\��\�\��\0�bfY�\��.�����9\n^D���ST\�\�F��\�(p�j���\�WР�{8\0@\�\\�f�\0���3�\���\�\0@�J��1�\�\0�O��+&�b>@ �7��o|\n�S�!<\�~�\�`�\��b \r,�il�v�?�i)\"/?\�O!4)QUğ���\�0Z����>\�>\�>\�>\�>\�>\�>\��]@<)lMy\"D<&?���*H��aX�r�\n�e��y�\�o7�\�\��y�\�o7�\�\��y�\� �Ri�x��\0�\�\�x�;.C�c�\0l=\�L��*!fH\�\�n�r^X\'�`񔨃#\�\�~�}\Z�\�$H�xIF�؆\�\�\'�<l��ߢ�H,� 0\�Zg�\�\�\�H�!�{\�(�� �L}��\��\�G�3�o\�\�AY�\Z��4���\"!W|�#.b\�.b\�.b\�.b\�.b\�.b\�.b\�.b\��\\\�\�\\\�\�\�7�0|�:D�$H�\"D�$H�\"D�\�̯�ġ��JNmy\rۗsc<\�o\r
\"�\'�i�\\ +�>!dU&8�1j�(�\��J#��CB|\0��P\�b��\n	I\�\��s\0z0������\�N\�X�a\�J��\�.�.��Ӽ��̪���LO�b���#W�\�<�\�bU���rLq��g���=I��\��\Z�� �T���#��\'��A�\0\��_\�\Z{�=�(Y\��<\�XKs`^f;1rbw\��\��b�1~��L_�/\�\��\��b�1~��L_�/\�\��\��f\n\�\Z?xbPs��\�\Z�&l\�\�%�J��\\�\n\�fn\\�UEѯU%�j|�9�\�X(=���s��\�d\�PG�6\�G]��\�kt�y�C�c	>�ށ�Ԩ\��P\�^�(�%t\�Ӓ3�a;ϸ�c\�>c\�&胤\�\�`q�1�t\�8\�y�xg�p\�\�>c\�?\�>cAx\�`\�\����N<x�\�Ǐ<y��%�\�\�\�N��\�C\�%؏\�<>c\�>c\�>c\�>c\�>c\�>c\�>c\�>e\nʭ�5��\�e~.�����\�U%\nWV�\�>  \"���@\0�#T�g\0\�rG�q*�?j��?x#
\���:T\r\0{�\�\�\�\n��+\�\�?y\0\�TWA+j�B�\����\r\"Ѓ�\�D2�\rbCy~\�\�U�\�C�xcBk]\�E���\�1�rERCa�s\�ͦ\�l&Т(�����\�6�M�
�&��
1Q;3���q<�A�i�\��7�Vj\�\�v��,�K\�(aaaaaaaaaa�~B)�����g\�o6a6a6a6a6a6a6a6`�^!ߟ\nJ�\��ʕo1ȱ\\\0(\�C�K\��+.A\Z D�U>\�^�J3�6(\"E[\�\��\0
v�\'�����D�2r?X�AIg�
\0R
��\�1\��<�\0���Y��\�\0 \�\nS+\n�Ж\"��ȋ������\��ee�p\�g���~b\�\�}\�Y1�D\"5x�R�Ț\"�?\�Jj�7B�RV\�\��w1>��LJ=\�\�p��Ƞ�����\�~������\�~������Ţ�NrV�;\��X�\�\�<2/��6혹���\��b}1>��LO�\'\�\��\��b}1>��LO�\'\�\�f`�+WQ\�^�D~\0V1�\�@\�\�\�#\�\�sj\n#�~Bm\0�$b5�\�\�\�W^G\�.�/P\�\�:\�6@\�\0\�\�r�XH>ܠ�j=��`�\��K\'�ʗJ�aa��|�30A�\�\Z-\�w<�2cpPF-u��\0\0 #��\�D]�K�LK�Qo\�\�S�\�k�hH{\�\�Cvλ\�k\��J�E��5�_0���5@ց\� �0��\\!@b\�+��8!�(\� \�\'\'B �ۇC�$�F]
a\�l\�\�lǅ.a\��\�\�)��s_Ǡ\�\�t\�I�hhhhhhhhhhhh\�4i�@�݀f�̾\�\0ʛ�,\�ͩ�M\Z�e���}r`A\�+\0\0y��\072rh�\�d\"k\��ZP4^�P\nO���S\�Рp!$����y�T��Xǀ P�>NsЩ߮=\�}�1#0�+\Z�`\��\��\'v_���\�\�n�\�\�9ł1{a$\0�@�\\\"j\�*\\Zl\ZT)�Z\�)T$l�zz\�7÷��\�A|R�&�c�@\�0X&\�\�C�@��\�V�?\�\0a�TR`
��\�ٻc�J�\�\\�ߎ<\��,^��\0\�\�n�\�\���\���3g��\�\\�\�\�\�\�\�.^\�\�\�.^\�\�\�.^\�\�\�.^\�\�\�.^\�\�\�n�6{�=͞\�e/sd\0ѳ
��\�kP\0O�}\���Rݤ�\�#H\�� 7[P\�h�\���4;uxb\n��\�=\�\�T(��\�r�=�\�\Zw�\�\��˶���Υ{�?���\�\n\�\�c� �\Z�\0�Ӟb\00 �n{��.FkΠ$O\��\�E\�Fv��#K�\0\�\�r��*\�\�*\�\�&\�\�N9�V�Tw�H{�\�\ZR�\�\�����x\�\��PCU%iB�~?ӏ�ż�v���D]\'X��G�AlzH\��\r\�#�g\�\��\�\'\�(cĄ\�3\r\�2� �\00\r\�`:@uk�g�|~�\0\�ܦ�.��J1\�\�!)��$�\�\0�r��}zA0�pq��\�\ro\�#7�\�>b}\�<2U�q-$	�\�GǪ<\���n�\�\�6#\02KQG\�\�\�B�^[Aro\0�a\�Q�H��G?\�k*�D5I,&Y\�|Q\�#�Pƿo\�A\0
\Z�����^Dؤ�G�򙽱�Ԭ\0\�#\"i\Z\Z��p?\�_,�?:(�\�\�*\�\��c	`{�D\'��F��.a\�S��ar\�6\����\0=�0L0\�8��H���\�\�wz\�\0�\�\�/\r\n\�|\�Dr��\�FCy躬>D��\�\��\�\n��#
��3��\���-�\�
 �A e�g�\��A�D1&����0&�\0�~ \�	��\�^! ���\0\0�\ZRR@�mt\\z3G�\�\�\ZI�y/+�;ۂ\�R�\��\�\�\�6߄����gd=̩x{\�\�B\�2�_��!\�&\��\0�J�\�۷\�\�H�`S\�\� �\�:#���DNP~\�\�}Q(>` ���~/24D��\0\�V\0�6��@R\�����2�R\�tW�*i��TƉ~\�;�_RjaU\�\� �\0}ǩ@|>\�\�c�\n�	C�\�;!�s� 3����a{�s�bg\�gl1R�}\\���\n�\0*�3\�. r \0\�f�]uO�\�ph����|�`/����矔�\�7\�\��0_@\�\�A����\�\\�9��bC@얔X?+����Ɇ8\�\�&L*);ap:��r� U\�
�L\�0�Ҝ\"\�L!;w\n�hi���\�%��?��O������\�f-i\�\�`���\�O]��oD\0g\�\�(8B�EG��0\�v	�>�-�>E�\���?\��\rh/{�Oph��B\n��:\�A��ǁ��\�\�0�a,\�4�d=�s*V�7��Ӷ�\�v\�\�B�c#\��\0\�͋Z\� \�<\�~\�Q\�U�ٱ-1l)\0�0\�g

 \�`X,Z��bxZ7&w\Z\�,Y˟\�\���\02�[ӂLPG�[Ax��,�i�]h�#\�8���c2�\��8as\��\0\�vO\�N�c�\�ߕ9\��\0ZVan�D@i\nU\\q\���\"ҔG��e!ɔy=�a�w\��i�\�X|�\�(!SV��v\���C\�o�0Q�\0���\�.a{ 909�2\�?�Q\�7�#��\�\�\�ц��?���!q@\���\��J�\���)\�1V�)Q�ru\r7*AE�s\r \'b�s\�\�M\�3C{�QH
(g�v\��\�d�y\�(^v��<�\0�S�N>a#\�-\�ȄЛ�^L_�H��9\0�1 #�!�pA\ro\�\0�P�\�\��\��\�G쀠�j~9\�!��*i�\n�Hv� ���\��\'�a�\0\�Q\���pf\�0�\'\�� a����s�#��\Z��\��\�$�!$fl�k��\�\�gȇ��x�\�Y\\u?l\�r�\0\��\�\0\0\0\0\0\00\�0\�0\�0\�0\�0\�0\�0\�0\�0\�0\�0\�0\�0\�L0\�0\�0\�0\�0\�0\�\r\�\�}�\�}�\�}��}�\�}�\�}�\�}�\�}�\�}�\�}\0\� \�0\�:�o \�8\�
�L0\�0\�0\���V�f}\�\����8\� !�5�/}�\�}�\�}�\�}a�f�*0t\�\�\�ٕư�(\��d�� �v7q\�e\\%\�\"\��0\�r��I]���M4\�M5O\�9)�\n3\�	Լ0\0\0\0d2�c\�<�\�<�\�	a���\Z�\r\�9�\\\���\�7��\�\�U � ��\�޴�\0�œ^XO}�\�}��⛃�Fp�r\�Nӓ�#\�j\�4\n�0y�!R[d�\n(���̋�\0���:\�].-��ƃ~�\�s\�N=P\�/<i=�S2Z��Tqq\Z�l\�\�M\'Ӈ\�q\03 \�=���\�*�\0UB\�\0\�p\�(�\0\0\0\0\0\0\0#�5��Ïp㎽�\�d$qA\�\�\�\�0\�8\�8\�8��\�`Gu\�f\�`��`�M��O<q\�q\�q\�r<�~H!Ov&$1F<U!N8\����\�<�\�<�\�[�\�\�\�� \�H \�\�K}<\�~�\�6\�PAAA�\�Т�x�L53 BA�\��M4\�0\�s\�/3P\0+	9!ɠ��\\�\����\�\�0\�0\����p\0\0\0\0K\�\�|ɕ�� \rU\�}\�\�H�\�< \0\0\0\0\0\0\09���c���\0ڀ�\�O*�Q�\�\0\0\0\0\0\0\0\0\0\0\0\0\�/P?  ��yI�\�I�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0-|֑ݩ+Qoy�L�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 d\�+\�\�Jx1\rx�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\�J�\\* \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 \n���\0\0\0\0\0\0�\�\0)\0\0\0\0\0\0\0!1AQqa����\�� �0@\���\�\0?�S)�\�e2�L�S)�\�e2�L�S)�\�e2�L�S)�\�e2�L�S)�\�e2�L\�:γ�\�:γ�\�:γ�\�:\��:γ�\�:γ�\�:γ�\�:γ�\�:γ�\�:γ�\�)\�����\"�Mk��\0\0�Kd\�~\�N%}	\�g�4|b]�����]�A��<a\�\�W���\�a� /w�i\�R�j�e\�I� �-�\�߉��
�~\��Sh� K���h�8��^�� - \����<\�����\�\�DW\n �
-p���g\nH�ƧD�V�Psa�bt\�\�\\��)�2xZyQ5ѕh\�\�D�A\��^��	d�\�t�\�\�\�bc6�l� �[w\�Hb�R�l&5����\�UڴÃa\'D��\�$�\�E�vBk`�\�ɉf�5��\�i��Q�V�n�A̮1h��(��]s-]�\�\\��=J}M��Y:�#�(\�\'\�
/_�%5l�\�7<\�J\�\�\�\�\�\�\�\�\�\�\�\�\��+ĺA\�u\��\0cĉ�1\��}O0!3�=/@��\Z\\�
\0�\�m�m]p� :X#B,P:��v�%\��\�i$�r2��,\��\�\�a]K\\�ޥU<V�\�e��W�-\�5���eƫ\�6\r\�#�zC\�Q\0�
_�P�d#gwa��1\�]4a\���\�\�.\�\�ͅ�spK\��i�\�0�>��J���J�оiR͙�7��e���������)V�\��S^��J�+į�J�k+į�J�+į�Kq8�8
\�\����\�\�t\rZ�f	\�e�\nP&[�V�aM��\�(,�x��5������l�L�\�\\�8,\�\�0\�7mE�5@\�)�M&����#\�\�\�\0?p�\�\�(��*\Z 7q~�\�R\�\�2�C�ZX?\�2���5�\"�\�U��U�M=m\�2N�\�\�ޥ��֎<�6c��-w�\�H9Z�� \��y\�ΧP��d�\�L�f
ҽ�\�X5�6u�Y��\��{(w\�.��Kq-ķ\�Kq�,\�C!e�p45E�\�g4�
k@\�g�\�N:� �\�oU���	gW\��p��\ZQ\�$��*�\�x4\�\\
V\�4�X�\��Q\�7�EZ\�Uk�x�&7b�\0T\���%�0hb\\���$�**�\�\�Y)ֱ��\�\�\�v��2\�ۋPWAUM\�xe;�\�c\Z,ǘSI��?��UA\�\n\���+\�\�\nP*��� \r�\�`){~����/\�Ԟ\��00)(.<���\0|Lr\�R%v�>	����\0�\n�A�\�$]�\���j:�̐.\�Q��d5�XF�Nf0��2GL\�K�Ʋ�\n��M��YW�\�\��\�%\�D\�h.ȥ2�Q%\��\�Ic��\�D��\�^�\�K�\�Zlk&Ȏu��G[�侱��.��\�/�^ � \�\�ZZZZZ����8{5�\�GH �J+�\�b\Zj� v�Ĥ*Z;?�\�RRRRRRRS\�\�\�W�Wa��k\n\�\���ݭ�a ��eg6���E��A�,h6!	Z�\�-X�n\��z�\�	{{
T�\�yYm\�\Zkq&0�Ixś\�Wq	t]	�(\ntk\�J]\�@\�\�F��KQ�\�\�nР\�q ��\�\��<2j\�d]3�\�_ \�I��ЫLj��ڂX\�b\�X\�\��*\�A|&\�x�����������?\�\�-�\�!�䦳\�\�)����\�}�\�X�*Ѥ\�|\��0��\��JNID��ߏ\�9\�;\�H�K����պ\�{@֔SU\�C\Z�-���nrkɐ��D�K\�L��p4{~aӅ���Lcc\�\�\���\n
ž��\�m�e@Z2\�\�ț\"�R�\0h�\��5��P�c/U5x�\�i�\�a�\�V\��l\�\0,Q\�HS[�],7��MEqj��W:T)��l�]l\��4\�e�\0X<��l�\Z\0R& �\�LC�{H�AOz\�oSU��\�\�Լ����CЪ�\�:zFZ�FmN!Z\�/Ѹ@Х\��\�-�\�7�&�T\�(\�\�\�\�+\�\�;��\0\�\�#	\n�\�\��պ�jƌ�N�\�㑓=�׈]�Q6WO�	�-4t�\�\�\�\�\�A<�k�
\�Qݠh\�d6�\�lTVfը��,�ZsA2�Pp4�\0Pyy�BP���\�ayt�\�\�c�YM\�4\�\�b�\�	\\�s(\�\r\��\�!��Xo�y��
,�6`NC{/\�U&Þ\Z��]ب���K��z\�@\�\�2��ِ�H,q�i\�\��g�Y�))�\Z\���\�ִ\��mT%���{@>�;@1��T,\�2\�\�е֝`¤�� e�����4�rG\�:�;H�g�\�t��R\�\�d)E�w<\���7�qbU�RVZ8\�_�6>-\�\�m\��9,\�\�ņ\�H�A�\09\�C4[�صm�ֹ]D\rb:\���\��\�8�p���\��e!wB��\�]K��\�/\�.V\�Ga\�\����\�wEHur�4$\�bi\�\� �J\�s�1+\�;\��\�A��\�Va �ï\�\�\�\�q��\��ŰYUf��Q�\�[�u]��ܵ@�#Ah�Q��\�)O�\�\�\�W8\��|\�\�%J�.H}@�f\�t\�űp\"\�U^U�}~��\\��9�S4j6ox\�\\]3Δ�f���}\�\�y!\����m7��{�Ų\��ͤ\�;�\�l\n\�\�AF�x�U�
e2�\�\�I�\�\�P8�۪\��3f <KL��_H\0\rl�4tf�²���#���kf]�֛/\"�x\n\�g*��� q��Z\\d4芉�!ɨV�H�\��\��\0I\r��^��iB\�WԬ�~׳�N�\r�\'��\���:���Uۣ&~�\�I�؈ez�Z�{�R�园]�V9>K100�-;-�������\��c\�r\��\0\"g��@�\0eU\�X�6X7{\�6@`R�\�+\�B�S0c�T @�6\�~\"��~\��G\�&.���.��Ki�\\��?D�\�#0�-��M\\\�ƞZ>p@\�\���UfMGKT��8庪\�+�f`�d\"�:�h44��#<gj\�\�\�\�\�\�\�3�\�O����!B�L(t\07���M��e�[G	E\�doڭ@5\�]kP�\�~�O\Z]7\�O�\0{�!j8]\�\�\�,\n-\Z84�\�~��G\��$~\��G\��$~\��G\��$~\��B\�\��j��=��
� |(h�¼��
!�C����\nci�0\"�����>\0P�R\Z\�#.\�\0��\�\�
��)T�\0\��
]\�i1} �M���\�8\�*��W�����ް�4.\�H%��\�u@X\�XZ�\�OA 5Q&Q�\nkc�g�x\'�-�A��\0\0\0=\�xܳ=ad9\ZG!oi�\�
���\��F�t���\�G�� yI��(w�Ncj\�f�/Zo[\�z\�\�]\r���<~����\��t.\�,/\\�7�\�V�|��ԫ�Z\�\�o9�d�-ߺ\�o%@\��t�}奥��\r9m��l\�\�\�y�\�//\�\�;\��\�;\��\�;Ū�|Z\�xx��\�\�b\�j`\�c\�_�Dm�M�\�-��ލ�����\0[!;O\�\�\�Z~\��\0�~o\�i\�\0\�*v�u��������G<��x�lz��kc\�T��\�\�<��.�\���:}\��s�-\�{��l?\�\���9�:��i\�v��i\�v��h\�֥9Y�]|�! �\�\�VJ\ZYw\�q\�5q�w>1޴\�J\�\�\�`v@z�\�\�d�r-\�Yi\�M,q\�B\�\�\�\�\�*\�J���\0�?�;Js.]��\�v�ƛ������^��N�4W\�j������UFD\�:Y^\�\����+�v��i\�v��iNc�W[�:��ϟ�l���x�J\�O��\�\���=!��\��\0�\�ؾe�\�F���\�\"3~?�h�\�O\�k��H\0,6����CXu�u\�\r�{�\��:Z�� �\�=�����5q흧y\�w�\�y\�w�\�k������L\��\0�\rN7�m@�\�-\�o�,�Tu�����,x@��\�ͽ\�Ax�3�\�+\�\�;\���\�X/�4Dv� �\��D1����\Z\�\03.\�86\�Ũ�\�p\0\��\�\�\Zy�
\��\0~�4�\�h	t�xr�h��~�/��`�\���37��\�Hz��\�R^ϱ7k\������\�u߂
B�v�\0Dk\�ES�m\�=K��\��2�-b�[\��k\�R�\��=\r[��\r.\�\�\�
1g#\��\'��u�=�z��\�g�kd %j���\�D\�c\\U�9�\Z�\�$��r����\�fs@���N,\�\�5�ڮ�\'�?E9�\�\���\�X���y\�?\�:\�촶ۙ\�\�̞&\r]\r\�g��Q�\��j�&���\�\�1Y��\�\�	\�>m��\�9F�_��~�\��\0�M�ws�\�w8�m\���F��Ú�ن�^xP��\�?\�`�k�4�W���\�\0)\0\0\0\0\0\0!1AQaq������\� 0@\���\�\0?�S)�\�e2�L�S)�\�e2�L�S)�\�e2�L�S)�\�e2�L�S)�\�e2�L읓�vN\�\�;\'d읓�vN\�\��;\'d읓�vN\�\�;\'d읓�vN\�\�;\'d읓�vN\�\�;?\�\0\nA ,/��\0\0\0\n\��Üt��E��\�q�xu�o%~��P4-R� h\�B��ZXi\�0���Jq)ħr\�u\0^��]Lf^S]Z&�M�p�i\�\����n��E�K-�\�\'\�O\�N%8�\�S�N%8�\�\0���V�t�Z\�Z�-V��\�+\�S�N%8�\�S�N%8�\�S�N%8�\�S�h{\�E\�K\��]e�#���\�V\�$^Zv+h2�M-V\�2\�ж�
�\�+F\�R\��\�\�\�e\0�GU�v\"7-^r��@v	~\��\���\�2�\n�\�z\���b>\0\�\"�\�t\�\�\�+�7��c5l���\�VH�ޢ��\�\�6\0\n:�\�\�ej�\�B\��/\r2�\�\n\�\�KKBO-\��j\\\0ee���,\�D8Z�\�\�\�\�e\�_�g�#I�\Z\r)c�\�q�����������������p�\��\�\�\� Ga/P
=Q\��j\�-���#Rh�Aʶ�\�l�$\�C{d���Il\"CE-\�\�u�K\�`\r��\�\��\�e3R��\�)�\�t`��S9��\�\rVٛ���\�\�\�j\�z\�]�-�PHvԥ�\�ٖ�~n	�\�\�Q�k�A�W��j����9��,\�&\�\�SN%\�k�\�k�\�lPC�l_0\�SN!A,��\�Z \�s�	�^^_�༼�����\�\�\�9�t�\�^@\�(Z\�\�Nfv�C\\�J\�\Z�+pe��敱�W/B�ȭ�z1�K5@��D%\�ɴrXA4Ws(fA2Hr ���#\� l\� \�9Ϋm���@\�*�\�h�{<�8�F\�\�\�S\�#���TY檥��h�Mӑ\�9ؗ!\� .��G\�\�R�\�\r\���EB\�K�\��[�\�\n_R�Ǫ߮�Ѥ\�\\\��\�Ŕ�AL�E����P
Cz�?�4�S��t�\�4\Z#�i+L4Y\�7��\0SxiYXIaXj0
\Zq��\�y`�I�j��,^\�:_Z\�J�\�\\����/@m\�D�\�Ƙi\'�LS�\�yG�:\�\�sW\�e\�\�\0�UM�(\�U�X�\�J�\��l�\�,t ���\�dG%��\�\�\�b��|\�~�@�{��\0h\�.���\�62\�e[�U�χ�*�T�\�1\��\�7�B \�\�8`\�ty�K@kSAj[�|��q�@h_�+\�.�>���ۋ��#��x\�.�\Z�\�F\nu\���\�t�E\�\�)�VK�4E\�ȶ��r�a\�\�Q\�V���z�S\� \� �C�:�,\�\�L_3;)UI\�1Y6C\"\�;�+�\��},�\�+į�J�+ħR�\0\�\�\�\���@��\�-�9\���\�9\�<\�`rS8�[�@7]&\\f����\ZL̣!�\�\��.�Q�5,%����R\�T�\�Z\0\���\�g��\06��;��(���J悷�muh[y:\r�\�C\�rU`��t\�M	�2�X1\�d\��؄,�Pan{�t1��ٕ�\�e\�M��\�h\�\�\�\�.\�U/@.�J�2Ñ���y��\0@
Z�\�\���\�\��ƿr
P#�\�\0\Z�t!PR�F�9L_�{ \�K��*\�ܮ2�K++\�\Z��\0�ʪ��\r��a\�\�(50��\�\�\�\�\�!\�|(KW�/�\�\��\�N��(�\�= �*30p^\�M\�\�|;\r(
d�XV^\�G�	֨r���5�,L�Z]gjYZ&\���C\�e\��\\�\0���C\�k  \��iI�Ji\�\�PZ\�.ђK6#�\�I\�2���$@E��p\�\�(\��_?\�\\�W�BլgX����J��\08.\��Y�X\�\��\�:(&T��\�6h\'\�x�е��4�YY_ȳk��\�<>A�d=�>p\�(���*r�\r��&>d@�j\�5�Sx����`t_Հ\�l���*�q,�
��A	�[\n\�*�`\rZFQѪjřڬ_eN`\�i\�%\��hq�\�c�>\��\0\��\�@lJ,(p�\ra,�B�Wb\�_�Z\\5��&�D�,K�\�\�\�IP�\�Z{\�\0�\��\05^\�ؔ�\�(\"��	�r��0Q��d�\�5U����S��\�u���\�z�:�Z��*\���\�\�\��JOQ#�\�\�:#��u \�t�F�4�II\�X\�QF\��.Z\�[\�\�kG}��޽>��FCc]�謰�K�,)��Ť\\G4�]\�\Z!wSL\��\�W��\��D0���f@.}l=Z�geG��\�}G\�\�i������ %\�*��<\�\\\��B���\n\�� \� \"*%\�>�4s̡�ۃݍ�=#\�+\�\�=܇&=��P)���mT�,͕/\0p6\�\�m\�\n\�P�%\�]\�n&�v\r��Q\�q<.�\0��� \�X�-���,�(\�-��T@P\0��/Z^:g\r!�\�z��\�\�?$!�ϻVj\�f7=��\�1ejd�ċBKB�Mk`\\�g�\0�A,��r[@j\�J�\�\�m\\�O4�uR\�LP\0�wkC���4ԩj\�Zr\�Կ�@DD��5/r\"�
\��gN_hѾ�\�\�\���Ml:Ԋ>Q�\�\�SZ\�0㗀b�+Z\��\�T��\�\�\�t֧�\�_�\�	N�s�K�5���V���OƬ8\�˅�ί��A����=E&P1SK�V\�Yr\�MTR�t�;6\�L�K&��4s|ʏz
�\��_�(\�Â\�\�-#E[��K�Q��Cct쌯\�Cv���\�Y4\r_�>�y��\�\�Ұi�j\�ʞ.}\�>�i�<5�\�\\�2�!�|g\�\�bU(�\�5\0W5Y9ѧ����\�]\���\�-V�a\�дR\�\�\� Y\\�x{�=�\�\\Q�d*�[����-(\�9YYJ�A���\�Q�\r���\n\r\�(S�\�\�)D7��\�6���\��\r�%����g\�c\�1���\�}\�>�y��\�\�c\�1���\�}\�>\�_Ɍu���\0�\�x�\�S�~f�\�)ٛ�\0\�I�\�r>\�\�+į�Lw��K�t��\0\�k\"\�*�ջG>/2�\nj��8��\0Qp:\�T�QV���/E@��[C�\�as�\�}o
������\�>2(Ө	�o7	z���\�>��\�\��\�.�Kl¡Wv�-Ҕ>�Jq+į�J�+į�J�+į�J�+ħ\�x�\rԦ/�����0	t:P��\Z��,=�\�@�<\Z���G�\�\�d�=��f\'`���f�_x�٪�r�ε�;��(Zѫ\�qN�1�Zt��qy��X\rN\n�o�����\�\�\�y~%\��\�\�{bP\�=+��\�}\��{\�A\�pM\�w�;O\�<g��3\�x\�\����e\�\"\�\�V�\�2\�G(C���	CU�\��g\�!��\�_�\"H\��\�\�\�;�\\n-�\�\�v���%�\�{O�7\�\���u	\�-ķ\n�p�C/�	o�\�ПX�X�X�X�X�X�X�X�X�X�J��o\�#.\���i�����4�\�%�\'��ܢ3@=&�a�\�\�sM�E
a~�\"0~\�\�<ehS\�(<`\';/�浊S\�h���s\�\�\�M�~\�I!j\�\�,�3\�x\�=)\�c\����J��X�fQ^\�I\�3\�x\�\�<g����\�\�\�)���\�%�R��\�q\�5`\�q�\�a��\�/\�5\�\�ڴ��d��f�5\�Ķ�\����\0\�\�\�n\�~p\�&�\�\�<�\�\�\�P�\�FF~\�\�\Z/k�^x�s��p\n\�\�\�\ZP���J\�0�R���\�5ښ\�wZ\�\�\ZD�g\�d\�W�\�\��s\\O#�GQ3�Y�4����R\r8����|��Mz\��a\�^\0���3\�x\�\�< \�v\�F�:�s	SX�]Jf�IH�\�*�S�/�EaQ�W��:H\�\���_�\�\�\�\�\�m\Z\�iD\�\�*-
m�hQ�&\�7nӜSZ�
LM�Q`hV����W\�\�\ZQ_\'0�,\rV��i��y�%�n\��\�\�V\�\�z�]\�6C\�Z�ܿi�R*:<+�Kz�^�Z\�ڬ�XӃ\�\�2�=�AY,-\�\�D O�hC\��\0\0 ڡw���%�ɰ_p��|��{Y\n��+p6�\n\�zm��P)\�-�]�T�I
YN�\�\�Lf:U�*D\�8l����@\n\�Ml/��.��\0 k�c\�a��.���z�M\�\Za\��L9\0.�\�l�4Vj\rt\rF�L�t�\�<)v\�y�E8Cv\�\�8p�\�Pф\�k\�Gd7X�\�:8�d\�?2��\�Q`} �G\�\r�ު\�\rb�\��b�[���e�\��?�;�\���i��Gf�j(��/\���\0���E\Zi\�\�\�U�@6\"��\"d�M\��^Μ�.\�s�Ҷ�U18�� (\�yPC�@�\�\�t\�\�.r�\�\��Ng\rH��3��`/;e\�B5�;\n�05�\�v\�\�Dv�\�	�UUwUU{�Ӕ�\Z@\�:� \�uθ�\�x�\0�e��qF
]ܪe�\�xmu)\�	��l�xKЍh�D��/�\0\�E\�č+k�\�\�\�Z|Qն�߬n#\��z\�θ��<^??�\npkM\r\�\�]_q�mN�\�}-\n\�u\�\���@\�YP=\�Vs�ry ����\�c�4A����� s����ӆ�x���E[\�_�f�q��^�h7�~Q��%-\'T��@`6�\0�^~\�ū�h���\�\0+\0\0\0\0\0!1AQaq����\���\� @P0`�\�\0\0?�\0��O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O�\���O��\0!\�:�T\�S�uN�\�:�T\�S�uN�\�:�T\�S�uN�\�:�T\�S�uN�\�:�T\�S�uN�\�:�T\�S�uN�\�:�T\�S�uN�\�:�T\�S�uN�\�:�T\�S�uN�\�:�T\�S�tK\�\��x�^/�\�\��x�^/�\�\��x�^/�\�\��xI\�X\�^/�\�\��x�^/�\�\��x�^/�\�\��x�^/�\�\��x�^/�\�\��x�^/�\�\��x�^<��\��g�^\���\0య\�mYVU�eYVU�eYVU�eYVU�d�U71HV�\�\�Ү
^R\Z�+*ʲ��*ʲ��*ʲ��*ʲ��*ʲ��-�\Z²��*ʲ��*ʲ��*ʲ��*ʲ��*ʲ��*ʲ\�W\�^\Z\�F\�f\�- \�+Z�i\r0����\Z��\n������ \�g`�T]z6��\�j�\r�Q�
�����DZ\�v�(�\0�}N�\�\�}N�\�\�}N�\�\�}N�\�\�}N�\�\�}O\'�~��舰�\nZj�\�+�\�^��Q�WR\�\��\rUˢ\�\ZE6#\\� B�(R�KQ0a�0[�:S��:�S��:�S��:�S��:�S��:�S��:�S��:�S��<��S\�]\�q\�2F�\�Ħ	�:�S��:�S��:�S��:�S��:�S��:�S��:�S��:�S��:�S��:�S��:�S��:�S��:�R�G\�(d�c�Tl
\�C4͹U��D��\\L\�.ٓ)GE�\�\�\"\nƋ$a�Bc �т\� ���\�&�0J�T.##`֦t�W��^~�y��5r��J��+\�ԯ?R��J���/(ڶ��h\�5\�K鏘6\��\�	�\�\��qc�R���Z5٢͊bÑ3z�a��\Z�eps\Z�\�v�t4[i��_\��)53�\�\�\�tJЭ�T<�V�\���}�\�׬╉\�\�.j>�My��\�\�W��^~�y��\�\�W��^~�y��\�\�W��^~�y��\�\�x>�4�]]�\�\�\�\\�\�X\��P�Q��\��?�@�W�5���+\�ԯ?R��J��+\�ԯ?R��J��+\�ԯ?R��J��+\�ԯ?R��J��+\�ԯ?R��J��+\�ԯ?R��J�ۓ2�F\�Gt4֠\"$K�/1A�TF\�pߵu\�J\�/1
e�mWx�(\�5jX�\�\�\�%(&\�sv�\�Pxf�\�e�m2eD�\�4�\�b��lЯ\n�\�;\�\�jJ0~�gXP\�\��\�e\�H\�[Y����[���\�Z��a\����h1�$�\Z�|�[}�t�>CQ��(��*�TP?�\�p(��>J/��\nYt\�K`*�ia�a.�I���Hj7���\Z���eG*��S\�\�\�\��A\�\0�%!\�\�\�}{���\�q���h12��4 D\��\�\��\0C�\��\"�r\�э\�?+\�hz�� \�\rPz\�z`[\rub\r�\�\"\��ª�\�\0?`n|�M �fm�w\0Z\�Kr|ǋ~\�#W���pS\�Op
/Z\�\0\0\0\0\0\0d�#��M[��\��?<yz��\�[�\0	\r+f\�_�)��PlV&QR��\\?iZ���\n�s�V�蔢��01�+��Khe����~�\�ţ
\�;-�L\�o_�Cѷ��<ɘJ�\nߪWZR�l��\�5ޡ#!So�����p�6�40��N�b\n4\�!�<A}d�\�Rخ\�%�d�J��FZ�\�^	���F\�\�\�80\�8�6m�\�xzQlW(! �i\��ںȦA7tY\�x
ɥ�lX�H\�J\Z���Vq��V�\�X~a	��!]p\�,��h\\,Ƙ
�\�	QU�\�\ZH!<N^{,��\�\n	\�Ju:~\�q�\��b\�8\\b��\�\�\�>\�{-�V\n\���²�\0x#��SE���&3-�KA\�\�\�4��ʋ\�\�PS�\�L�1\r\�z4\"f\�$�\�  (�gv�\�O\� ��,ז
@\�S̞d�\'�<\�\�O2y�̞d�\'�<\�\�O2y�̞d�\'�<\�\�O2y�̞d�\'\�Ͻ�{>�!B�W(V5gf�\�@�����\'h��\Zgk?�\�*i\�+8F��I�T\�\�7�7�\"��$�F-{%���`��j*�L�?�I�\�j\�#��ﮛ\��[Q	�`}���l��H1V�ě��=�\�D��&e�iuS69�ː�\�тE�\0ri\�n\�X��\n#e\Zq\\(-\�1c�\��\�4�.�\nR��P֎�\�턭ʶV�Z�p�\�Ր��c\"�)���V\�\�L\�X��k\�ãJ\�,F-��\�`��P�/��T\0,\0$Zp�+\�T�T�\�k\� \�U\�\'R`���(\0N����/�x\�\�M�`�(l0
+@���\�q#w3S\�_�~{�a�\�ѡ�0j�Zy�н�G(�[[ZW�Qsf�^E�%�\0^RXN�88n�\�`j~B\':�B�\�\���\�\�\�Ch;|E\r)Ɏp�\� iz&�$tϹ�{>�}\��\���\�g\�Ͻ�{>�}\�w�\���s>�}\��\���\�g\�Ͻ�{>�}\��\��2�/
iLD\�T Xмf_�#hj\�dn\�H\��VNRŅ��
�A1v\\\�1�f7\'��6b����8UmU%\�B��Ya�\r\�R�\�c��]If\��g8L�:<�F�PI�>\rd\�E�\�[ր°y��\�G
i�\�O\�\Z5;�h��\����C;�\�<�N�\�\\\���@�VUqj�6�=K܎D]�*���y�.ő�\�\�2�Tt8B%\�hԄoh5�\�*x\�d�x$;x\�\�\"��v\�(m\�@�y�\\0�B\��E\"�\�\�\Z��.\\�R\�NWu�3���p��\n*\�b*!�S$;aj���\�M�)|;�Ln��A�%Ť\�\�\nk�\�	}K�9|GI7\����|��~�\\\�Ib��
���\�sYS\n�[�?�Q�ze��Գ�\�W�j\�j\n��\�x^\�/
p\�]S/
\��\�1����&�/
\��/
\��/
\��\��bk\�1��[\�p0�(\�\"\�\ZY.
kCz�Z:\n��.79�(��(\�\�8\�z�p\�\0n\�S5\"H���*�v\�� D\�6�-�\�7\� ȡ�mYi���Hݙ.\�(�J���Q�\�\�Fj�#\�I�[x��� iGu\�Pİ\0E�Z�\�2i$���t\�j���\r\�\�7AP\�iL��刵S�Ca���D�rU��.\�\�A�\�\0\��F-^�q�\�X:\�\ng`�2R�\��eY��ʀZ���X\�u\�q@r\09�\�\�,uJ�X�\\ \�\��(_�\��m�˛�ӷ�ac�u픃�\�\�o�鴴��Y\�T�D\�7�
��.\�lqQQ5\Z�j#��^P6:��K&N\'g\�;>\�\��\�϶(����\�A�j/����D\�T$	F\�\�Ox\\�c0�\�N��4�\0׽%�]]s�5`��\n�]U\�X�*\�2�\nҼ\�\�.$\�M)ֶt\�$A[�N϶v}��흟l\��gg\�;>\�\��\�϶v}��\�\�+\��\�\Z�$���(m�tв�_�H���rG!27Y.\�A��@\�\�F�l�Ҙ��`�&*\�6tQ\�}��[Ef�� �\\^\�F@��\�\�𵚮\n\�3�\�\� Mu�ʚ��|6����l9�����\�	q[YI��:B8�
\0�a��.�P[X���YC�\rR\�\�:��9+Js��?�B�]\�;�P$ϰ7���x�۩Y\�V_J;#t%߮\�\�\\l�-��DK_ �\�\�a��s�C~P�\�\�t\��\0Si�Zt�rNa*\�.[&�\�ـŭ^!��J\� l���%qw\�~�/\�RV\�\n\�@�]��\0P��A�Q;�S\�s\�s\�s\�s\�s\�s\�q��\�\�T.� Ϣ�b�\�x-�\�H�R\�3�Axq�k�L\Z���\��d��x��\�+\�W��(=\'\�Yk\����\� 2~!�2	c1&*�C\�N�u`ej�\��ŀ���#@Q֊�\�+\�W��)^R��yJ�\�+\�W�\�{�\�]S\"4�Nmڃ@�\�tAm��\0_�*\�F{�\�6\�tQ
qh&V�\�\��@\0\�0���b-��`**ne��\\Tb�)\�ˡ\����\��\�0	Mn�lr\�0�ۣ�v�ӿ\ZRI�V��j\�QK�tu\Z٬\\��\�b..�\�`�i�V�De~�is�`�\�6��+l[\�\�|\�L\�6�\�kx++�� =��!L��V$oP+4J쀻e,\Z�E
�A)A�`k�\�uB�Z6\�
�\�\��y|ʚI�h�V#����* �Є����l\"ڦ\n�M+[�e���l\�\n��0-��\�q/��r�\�W\�)שN�Ju\�S�R�z�\�\�\� ٕ\�\Z�|k\����������SX\� {\�d
�AX -2\�5\�qj����\Z2�T����2\�\�@��N\���q,
.�̦\��4T\�{�s�\�t=·�\��:\�C\�y~�F��\�\�\�\�}\�\�\�\�}\���\\j�\�=·�\��:\�C\�\�{�s�\�t=·�\��<\�\�@\�\�P\�d�\�\�b�	\�0Uʪ��UnH%a��X�%\�ײ�\�\Z�� #\�\�%L2���<��7���U%�E�\�g� .3��8\�!F#�V�\�օ�*1Pc\�c\0�\���[8o!��\�\�486�Jڢ����`h9]tCԵ+%\�A\��[R:\n�\�!M\0�\�X�vř�(\"\��,�\��\0\�`\�.G��^�K\�\�\��aU�\0��\�I��p|X\�\�-�&\�v�Ĳ\�d^�*��\rX0�T-Y�2ĭ\��\�7Ag�@�#If�Rb�S�q\�C�֡h\�\�;\'d읓�vE�\�\���Z�\�\�_�w4 	Mi\�\'��g\�\�\�U\\\"f�?p��{�d�\'�<\�\�O2y�̞d��M	17��\��;^\�k\�,\��� �\�O2y�̞d�\'�<\�\�O2y���.\�p\�G�U\�\\:lp�\�N�9b�UJy�\�\�/?%����\�X9H\�|J.�\n�45\'*�\�iR�K4��\�VuV\Z\�&\�`a�X%���v\�u\��\�]�\r��q\�A(�h]�~�]\�5J\n\�[,��u���5^*�W��#(\��JF\�\��KG�|�\0�>>I��\"2��\�5 h\�~_\�{�h�F\�7\�
�E\�ژ�u5\�=�����+j�Kv\�dAn)�*�촊\�q͡�\�\084o!�# eeS\�\�y�^�|�KD�Й\�կ,c\�a|�\��fEvP��\�XR\�A\".\�,���V��iY��XZ���?\�����\��ҋK`x�\��-\�\�[�ܷ\'�\�Kr{�d�%�=\�2+DA��q\�v4�A搝�\'IO\�TW�\�{���#���=ʳVU\�{���
�\�\�o�Ac�P�L=v@#�P��\� y5%/�v\�a\�v\�a\�v\�a\�v\�a\�v\�a\�v\�a\�v\�a\�v\�ڧڥV\�d�\\}���-M!�)\�y\�d\�V\�|vq:\�\�00�\0-��?\�\'�a�V\�\�.S\�B �?��	�JW\�qa\�i�\�\�
�(:�t\�ӗ�V\�H��\�(K���\"%7[\�7k�\�UR2�42��*S.N!(d�Ij͜o�	�4.�w�\"\�M���E<;ȋ�5\�]��`�\0�\�1\�\�U�kc\�\�\�F \�\�[\"\�\�\�Xv
\�K��\Z�DǞs)&�L����4�!q.$mo\�A\�HWp;($��\� &� )\�CT\�_8�\�\"B�ҥG\\�Q���e����h\�\�wu|Dvg�f\r
�\'��}\�{��\�S�S�S�S�S�S�S�S�S�eZ\�[j\\\�l�OQx]gڧڥ)\�\�,n�%Y\�X,m�\���K�C 
&
\�?�E�\0p����aJ1SO�ss��7�\'ڧڧڧڧڧڧڧڧڧڧڧڧڧڧq\�t=G5�1M\�\�5I�Efj2\�칅9t\��%�R䬴\r,��\�\Z8�Bk m�jW؏k+� �\�Qq\�\�;��$W5ʋ\�\nKm͟\�\�.o��~����y�ET\��B�n%������*���VI;4F�D.\�_D\n\"�(�\Z�⨱#\��&\�f]\0ܸ-�6�F�eS�\nܔ��<j��\�Y�)E\�u�+\�\�sp M\�oV\�\�\Z\�f
åwq1EU�AE��@\�Ш^�\�-�\�l��(R*�q�[�\�\�\�bp\"՚\�E`UpDB�ݔT*�2и`�!� C\"�v�4#$(��Y��H\�m/\��G�<�\�$y#\�H�G�<�\�$y#^�\�\�d}�6�Yf�e6�\n]
:����a\�+�LE\�R�I)\�\�?\�`�+\�_-C{�a|o�[���%�M,\�\�ј\��x�\�C�W�.\�o/�I�m��\�j\�k\r���W�9\�k2�C^\'a\�w�q\�_�q|>\��j\�v\n�#.�e\�e�ea5�妵�\��f�c�\�}2��bꑄy\�?s�K�
�ˈ\�M.` �\�E^y�?(e僨9@�\�\�
\�)o�C�B����5,NZñp�^�\�:\�R�P\�53�l�$�ș\"-˨����Qy��?\�8\�j�4L�uO hXC\ZJ\�Q�\�\�\\\Z� .�	ݬL��KH\� 0\�&�\ZW�#\�Q��\nc�F\�)�vZ�M̼;�.\�-+\�38\���\�:�\�\�\�\�L�b�
\�!:fͦ*�\nZ�\�dv�,Y\�Z�\�:��@^\�кxdܴ\rV$��P.8�\�2\nԹe�=\�/�7\0P,D\�&\�x�^/�\�\��x�^/�\�\nq�O,\�\0~��`O\��̀h/\���ξ@\�V�#\�s��\nei1��\��\rj\0����`[�\�eHVP\�\�4B���`_\r*Ã�\�da�EI4�&�I-��-&�6�Bq��ݜ=\�, \�+@�妺חX
Zy��)���Y���ʵ��pTF\0\�\r�`$\�\�i�\�\n��!aP�6\�.j>\���(+7DO����\�9���\�:,\"j�{\�j��v� 	�\�Y\n`�b���F�\�U�\�\�:Q~\�t\rԶ+dq/\'Kq�:\� q�F�>l\��n\�4b�Lߗ�O��J�ٹU�\�/��z\�QP�\\񿲢ށ}��\�v\� -\�\�chr\�s�*>40�� \�\� ���\Zp\���)��X��\�0\�š\�X\�!q���\�w�\�+p7f��8	eXkL�@�r\�E\0_��K	s\�\���LR�\�
T�\�\\� \n�`\�/\���,T� T K�C0��`8I�K\�\�=W�!b\�\�*�>\�E��v5.��M�A�r�\�\�R)Q�h���A*\�HS8NA�AA\�u#A�G���\�ӿ�3!TK�z�\��/\�\�_�Կ\'�~OR����=N�$��\�\0�\��[٫�J\�i\�B�\�2��Ej\����y���� \�|����ր4�g��\r�\\]f��	KU�`U0\�İ�TJ\n��h윅\�`�.@�j\�e�֍c�d�,� \�\�d\�\�,��-�E�kN��\��;��\�}�\�z� V5�\�z�qjT\���\�D#��!�`98\�7\��+|S��\r��\�*��(���\�\�M�\"\�X@hS�`R	]\�:�sa�\nM\�W\���3jQ\��#y@B\�㳷��\��2�\�U\�\�\'HEh\�F�<E��(ւ�\�.>A.\n�;\\0\0�G��\� �c\�Z����AN#\�6Ρ����]YP��!�Sb�Mە���\"\�\��\��3�\�\�f&�j��S1\�ǯ\�_1��\Z�t�6)MԹ����\��L�mЕ�`㶖 �t\�\Z\�(\�/pg\�f��Ÿ{WZ� RfXxd�\�N�j��|\�\���\�T�\�{eQt>�yr�В\�K\Z�EoΨ��*%&/�U��\0�J\�\�k�܌WI�� R�[�\��{�Or\���\��/߹\����^�z>\re�,1h��f�Q\� jZ<l#a�[y�u �3��H�GQ%l�:\�2^��D@<X��\���MK\\4\�\n��Ҳ\��Ɇ�(4�5F\��\�Ab�\�\�\�\n�\�؎Q�]:�\nF �\�9��\�LPu�y\�9].W�Ne9�\�S�NcU��<�\�*4\Zt�\"�����ˀ(�\�[�Jm\Z��g,�b�\�\�\�n\�mf��]˲qc�s	�f�X@ZEl�&e�\n\�`�\�-\�[��U&fE\�p�\�z\��9v� \ZDX�\�%em\�<\�\r\Z����W�#u�e\"b�$4R�\��M�\�*\�]�\�4*ԍP\"l~\�@{�\�FH�1@^�]F\�\�RjiN4Im�\�ډ|p�l�Dh��7�� �`�J\\wK�ʬ\�Q��O�\'҉ G\n��A�\�\�0�\�0��u<�RT*\��U�P\��X���D�+\�m\�n�|\�6j�z�BDK��\�j\�\�>j\�KӰ\�!��Q�\�.)�Κ3Ir�@2�dJf�uv۳p#(�L�\�v�\��:O\�8C�\0��$%�%n)e\�\�(\�{���\�\0M\�\�����K6G�S�JyJ�\�>\�S�\�8ѣp\�ɨ `�\�Mڂ	\�a���Mak���qK��\� �\�а���	jR�X6\�3EbS֮\�S]\n�l\n\�Q\�WH=]t�t��Z\�	RlF��m\�\�pR7���WI�N\�>5��<k(\�R\�?������\�W�\��\0yM��\�S�J]��\�z�\��\��e{g�\�[X\"`J�oaĂ�`i\���0\�M\�\�\��U�l�X/�PJ�\Z\�[�t��(�@U�k\�O��tTګ@\�\�ףW��ŀ2	�\�\�\�7f3\���\�PvXVt��5Op�Vu&\�Znk�3�dg\\Z�\��r��P�j�.�\\\�\"�բh\r\Z����\�$\�\02�L\\t_�B� ,l\�t�O&r`\�\\҅[h\����\�\�f|qn\�%1�ݩ�\�\r���!�\�	DY�\Z�:�V$J��s�-�\�� ����\0\�Iʶvyt<�Q/�Ȫ�kk-�\"Q�K\�U\"��fnO}y!f �\rt���Ċ�\�3D-0�70?2��g�\�\�\",Y5ظ (bYr�� y\Z�T\�\���\� ǀ��8\�n\��?CE\��Z,B���*�#�
�:��RV��\�����a#\�6X�{\�#\�Q\�\��\0�����b@\�0�_3]\�\�\�(�^�\�s��\�8���\0)\�A\"�)Nn�%�6R\�\�^-\r5�E\��9и�����bF\�\'���Eባ\�.� ��n&\\�Bh�f��i�;E�\0�\�	�+\�dh��\0�e�\�D,\r�D\�AyED��!��j\�f�Z%
}5*\��>�t�\nm�=\r����[\�:��z7]�\��PVM��\�ɵB��^쪲\�n�� ���7�i�I\�\�_:�\���\�Ϙy;���U�J�#r�|�TE�:)���*\�/\�\� ��\�\�\\Z\�\��\0D\r�\���n4D; 5	�\0aQ�BEV7��/�\�9\�!]�e\Z�nT\�(� \�\��\�)��\��\ZO.����փpn\�O\�[J�\�P�֙n\�\��!ug濉h!PK6V/ +�j�\Z��H�\n��v�%PA�\��\�c7R���sHrkb\�mJ�+r�\���\0;\�5 ir��\\p\�+�e:�k[�-Zf���M\�vînj\�vc\�\�\�1ؤ\��Di^�(0w\�-س\�Pe�\�ye���\"�]ɒ���~\�\�@ݤr#d�e\�~\Z.�Z8�o
�F�p~F\�\�$%TR��_<;�,#\�<ۀ�$\�ά7\��\���\�xn�\0\�4&�\�\�D]�\'P�6B��TR�h\�\Z��}�TZ\�A\�ښ\�RY��\�\�]\�U\r%1�\�v�\�3L� �k��\�\"2P\0\0\�-��\�u�\0��ȡ\�P\���D\�W\r\ri��>\'��ӭ
aD^\�b#Uw\n6��1HA1%u���M#)\�)\�T\�\�\�}j�S��3\Z�T`[\�3��P\0�@).�+\��\�ȕ\�*ڎ�3�Z4\�\�Z��\r|�\�J�\�c�\�\�\�/$;
\��KK\�-�K}
�w3�\��r�-\Z�\�7\�B\�ܻk�\�4��&EG\�\r\�\�>}\�\�o\'B\�S�\�K\�ڦ\n���\�\�-uv0�\�\�t�\�L���\�ƓfVVf\�\�R�K~`<(�4��3�jck r\�\�H�C\�,�\�KԆ8\�\�ن�\�jR\�^b�\�a�\�T���%���\�L\�AK\�\'\�k7Yn�����jf	4`��\�Ŋ0D90h�W\�����j\�Uw�F�Еڈs`>)ع\�pO�&W�2[ҢX:ơ9\�\�Kpu�X\"�P\�n�\�y�\0����YW{@��\�V���\�^Q���7�OP�\��ʺB��M\�\"�7�\Z��\0\����K2غ\�TB)!��\�\�\�\�\�4�:ł�x3fa�g\�%:\��t�s�k�UQ6r�r �1��V\"cI\�v����\�[\�@�\�۱,�c\�R,�\�/\'$�\�5�`v\���p�\0XIql�X\0\nLce\�\�g\�f��\�K>��v�A1�RAA\�e�� @\�\0b�\�k��^�HJ�Y>w\Z\�ю�w�\�P\Z�<(h!\�z:�n&!_�|�y�A\�pwYv@������\�ҮLh��dM�$�\\�4�)qM�\�7)\�\�t���%�D  ¥P�\�?\�\�qZ{�\�Jn����\�0�>Y�[\�!\�\�{Ċ/W�����\�\�.:��n���\�xh)xdv??4��	R��\�X>�\�5ܶ\Z�f��\r)fiM\�\�Ӧ��kH�p�i�@�A�\"�+0\�׃� {-�\Zf\�].\�`\ZAA���v�E��\�.\0Ľ\0\�\��I�Tq
(ʚ7�\�]\�Em+KV\�[\�-\�W+ۘi��\�kR�?W&B\Z	�\�U`\�<л\r\�Ĭ\�\�w�U¶�\���\��\"\nP�ti��T\��)^! 
�A\�H\Z�\� �\nN���\0%X:�ו\�m
Ԁ��l2\�%j;�~\�%�/Εnʧ#�\�f�\�n.\�;\\鑼�F�i.D�\0\�T-���0\�T\Z�A�z7�Z�I\r\� ;l��-˹p9�bq�\"�/\� P;y�j\�V�p�\\��\���[\�E�\0ut���Э�[->o\�VU�ou���\ZE	�K9uJ�WC�\�/\�O\�5C�\n\�P�\�F��!)\�\r\�\�B��!Zͮ�I�%&\�L�a�k���Ο\��\�*��\0�\�rK�ڐ֭3Q� b3b_j���pY�m���J�	`MۚI�H����/s�ZK\"09\\��N�a�\�(�\0�\���R\�\�o~ǉ�\r\"\�@N�I XP�Z\�$INiU+&]\�+@\'<��\���\nK�\�\�Zj��_V-�\0�p`\�/N�\�K�\Zf�\�i(K\r�\n��Hi\0\rZC�b���\�F��,`�~�aSI\�\�9\'@	»$@q�{^x�U/�P\�dB;�f\�UUU]yU�^�<�Jyz���)\�\�S\�ԧ��\�����L�(��\�@?:�\�\�S\�ԧ��O/R�^�V�\�ii\n��\�i� �B&DM\�
QB��ᖦ\�\�Ӓ\���[\�31\�x�/�+��C�\�*-\�QPޑ�/�e$��v*\�ݸJ\�\�\�\�Pd\�4��A\�\�\�1NQ���\�\�E����\�\n,\�\r���Q\�LM\��
�Z\�*u��-&+ I\0\"\�Ah \Z� \�JH��&F\� �^�,i�O��Z\�F[J�«)8�\Z(M5E�\�a �\�\�7dkq��v/��aEb�˥R�\0©�\�e<�Jyz���)\�\�S\�ԧ��O/R�^�<�Jyz���)\�\�S\�ԧ��O/R�^�<�Jyz���)\�\�S\�ԧ��O/R�^�<�Jyz���3\�\�[��\�s2\�Őp\0�\"KU\�j\�y�n�l@\Z\0�i�\0�ʕ*T�B\�Y\r\�_�*T�r��\�[��D�\"\��0l����\r�@.\\����\Zr\�p�F�3�$VRU\�\��\�v���*�)`\�\�\�*
\�ӥ��aPt5�JK\n\\\�R��8mp\�0Ye\�s�\0CPA�c n[\Z1\�p���P\�,S��@̠ ?\�\Z�\�\�T�hߝ��\0aT ���\�[wbڣ\0�I��v}�\nKSh�&.�f奱��/;\�\nA��\��\'��?���\��D�7`(U\��K-p@\���n�\�ꮧ�-�����|�t�\0��XP�R�J�*T�R�J�*T�R�J�*T�\�\�B)�\0䅊�\0\0P�\�j��Q�\�\Zq��S,��ja-��\�(O0�\n|?�\0\0\0�щM\r�ӀR��#��\�\�$(\�Z+ \"�\0\0\�N�\�G� �e�\'b�\�q[�u�!f��AU�@*\�Ht\��Y�Y.����N�a�LVJ��\�ԯm��Q\09v,Of�6��(\0�H����d\0V)\�\�|\���3V�L�\�!G�:�\�m\�5p4\�x�Zh\�
\�X�)��\����S�\�v�N�\0�[_h\n\�Ժ\"����,\�\ruF�ԗ\�\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0�+\n°�8��<\"�\�h;!\����S˳\�	\�p���\�\0�+i]JRo`�M--SVh�+\n°�\�Mm�p�\�\�0��P\�\�R�갡���\�\�U\�]m\�\�3X
�,e�\�\0\�\��`\��\0#��V�%\�.;!ʱ�nU��\�����/-�^�ː�G�HR�37VJ�\\!\�х�.�a��\�\�\�h\r\\\\O�܆�7Ky�R���R��\�:,N��&Q��(\�\�\�\�q�7�g+��\Z,����p�\�۝O\��:��\�u??\�\�~�\���\03���b��p�i\�E\n7\��\�c\�\n[n���h����0�R��+\n°�+\n°�+\n°�+\n°�+\n°�+\n°�+\n°\�#��\�;�\�!Y ��@Y؎�	a?�bjY\�V[o\�\"wd��1i�6}�UI��\09K\�39�/�<\���\�3�S\�}L\�#��\�;��5�d\�G� +p\�Y�f�p\Z��2�C�wAa{�&\�;�J7�}\�G\�Qֽ9\�Y���SL(\0�)]\���樋\�bhL��\n2�\�<�Vd�\n*;R�߫2\�W^�L�Р\�P�u\�\�\�0��R0�,\�Xo����\��K�z�&賬�}�ڶE �`�$\0\�Hč\�u\�A\�t\�A\�t\�A\�t\�G\�R�-����Z\\�\�/ai\��;�\�Gq\�w\�Gq\�w\�Gq\�w\�Gq\�w\�Gq\�w\�Gq\�w\�Gq\�w\�E8{%8{%y=��\�v~IQt�p k\�T��I\�- G(����\�!��cPu\"�\�{�\�n,�9X%D(0�t��\\AD�S���ҸYE���\"3�=��=���\�f\�\�t݀ϡ�\�\�\�C�B12�ʾr�H\�,��x�*P�x
�ί	�\��\�<\�#Ѥ\��3�Y3��\�\��!\��y#U �S4kR\�F\�DZ�*�kb��R~�\�\�|\\��t��E
Q!�U�u@��C\�0f�^ع\���\��\�yb��^X�,W�)\�\�!0mQ%V�?0\r�LJ�K�\�Y�M	�B\Z\���\�2\�]\����Q\r��GD���0��\��Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�Jp�J��G@>\�SG\�\�\�\�PY\�f\���\�52%K\�Ң97)�\"[&��L\�\�<�e�f�]b^\�t\�OSR�-\�f�D\�C��oͫ�ܟ\�\�\\�/�E�9\�� \�\�gsٿ0�k=\�\�\�@�\�v|M\Z�tǚ�]\�C]�el�\�,{ʾ���X��\�\�\�2
.\�?|D�RN�C�\�ű\\e+\�#��K\�ɥ
]i97�f�gX��\�(�\�N\n�\�	l�\�Zi׻�>�}�	�\�\'\�O��A>�}�	�\�\'\�O��A<�S\�\'\�O��A(\n\�Q�T\�>\�*Qt\'c;\�\�\�v3���\�gc;\�\�\�v3���\�gc;ʰ:�7\�i\\��[k�Bʐ5�\�\����\���)�D\�H\�
B�\�-w��)sD!\"\Z\\2/��E�s��\�C��\�}\�\�=�Qli�|\�Q�.�Wcb@Ӧ�\��n�q��X��\��}���+3�{yB�Q ѐ!mPT��Y�,ߐ�\�5kX^^�|\"ګ[k�v�\�\�,&�e\�X}��\�q��\0o\��f\�\�K�c0P%^@�\�֗\��\�\"ֵ���\�_�3��\Z[&�w��\0�\�\��`����u/?\�(�^���(��?ģ#��V����\�\���\�\���\��{�\��<?3\��/�!8\�\Z5b�c�e�|�./�N\�i掶:\�\�c���:\�\�c���:\�\�c���:\�\�c���<\�t\'^�u\�ف\�c����\�n×�O\�/h����z0\�McW��\��i�Z\�^A�,\Z�mZ��\Z\r������\�\�3\�3�op*��5�˗i>xb�V�\�#\�n)����\n��G\�\�rGW��5\�\'�\��\���\�E�@Ӭ\�~H�{�\�y\�� \��Őe\�̲�Ll\�k�,\�-F@\��\\M��\��\�?\�\�o\�*p\�2��\���8j��X�]A�\�\�ZE������.\�W7�\�/hv�U\�\0U׹\��<~\�\����?s\�\�x�\��\�{�G��\�\�\�%\�G�5�� E�\�A�\\�sl\�\�1+����\0\�Ͷ\�m��d5��I�1W1Z�&��.\0�1\�\�7��mE\�SH\�DйlU]\"쐌\�\�\Z�w��\�1�\�,̡\��^��f!Ld�)\�o\�7\�7�5�\�s�*�= �H{��\�\�\�]or�e��j\�!\n�\nmё��e\0u6Tj\�	��i;�\rmd#�Z\�`�d�\�\�2\�VU\��\���nf�=S\�\�>� ���/\�\�V��>�}�{��T^�_���?� �k�{�z;\�g!��X\�)��u,\���p\�2h\�\�T\�^�&+>���\�ja��˺\'�8/z>P��DQ�\��\�\�\�[n+�\�e�\�?\�k�o��\r\0�fi\�gNt\�Nt\�Nt\�Nt\�N<\�q?\�\�2[�CH5
0<��\�\"E\r
�\�\�?2\�\�C>�}��3\�g\�ϡ�C>�}��2\�\�s>M\�0\�JEc�\�\�K#B�Q�	d�Ҟ5\�PQvT��1\Z\�\�.(]\�+b�&�J�#�Y�i\"\�ޛ���\�h��\�@h\n\r`� �\�A�N8\'b��\� �oGv\�\��\�>G^\�3��9����(m��m�\0��!Qz��4n��졳V�X\Z|�\�%��\"N�!��\�;�\\\�:XM�
\��F�:Ji0\�\�o�E\�k������\�\r�Bꠅ\��ز\�/2\�\�)��\nꀦ�\�!\� M\�?\�\n�\��F?l�?;ks*�\0in�w\�\�\��\��\��\�%�ť&�\�D��qْ�W;�~\�\Z?+� \�2��\�K\r\\�:\�Gq\�w\�Gq\�w\�Gq\�w\�Gq\�w�����@Y���3\�{�\ZD.��.N�<`�����j�\\C��@��/���B�\0+Z�\�`I��\�!z�ъ��m��+�D�ȋ$U��` Ԕ1�\�<-�\�d�F.ճM\�Y�С}(��qWL�\�Qʬ\n+�~%��n\���\�%�s�\�NR�SV�\�`K5*_�̝L]�\��a�\���f��\Z�\�m�*V�
0\��\�⡅M|Ev`\�\�G}&?}w]mZ\0)]\�	\n(Qe浖�\�I
�Sfh����`\r\r\�q(�4\�;2�0[�V�-\�T0I�=a�\�ah���)\�g\�ar\�\�\��<,JE��\�1l�\0�c& \�-3�\��5H�(a /��{p�\Z�\�;�pԀ8�w\�w=N\��Q\�\�̈́y����\��`\�E�LV\�_��{\��?��$��!\�}\��\0yo\�;\�\��\�Ƕv=��흏l\�{gc\�;\�\��\�Ƕv=�\����\�1*�\�C=kBd2�١\�b\�ܔ�\�T�*��w��\�r�\�)�\�#��2�8����FV5�\n\0�2\�:.\�A��f��\"8U\0�\�k�,�Mq���-B�\�}��k�\0�еL�1�\��l�\�\�!�P�J�od+\�\�J�4eYѼV��\�L�\ZA\Z\�\�Zϲ\�a\0\�1XT����&\�$��X^H�\�\�\�\�\�`w(����w��f�RT5�α�N�\�JkN��p�t�A�P`\�\�\"LY\\\�\�0,7�t��$�����\�\�\�wbb\�
��}w	\�\"\Z��\��\Z-ٿ`BV	G�YFզ�߃�Cd�\�ѦUh\�@�aC\�\Z�\�Z\�\�\�@m�T�\r \�T �Z\n-z\�,�l\�=�9��Ot���)���\�+�\��\�?�O\�S���\�?�O\�S���\�?�O\�R�\�O�O�O�D5����\�b\�h\�\����4)Q��^ܝ5\�m2\�!q�p�s)�\���~L*�lC\�\� +Fl��۔2T\r�����\�<3?\�B�m��M�#�\0ג�J-\�;CtX��\���\�=�\�	�D�_&�)�&-\�ڏ�i\rװ�\Z�\�.4\"�\�\0�y�\�\0v<�*V�\�\rk �*�HR��\�Ve&��q�íy�*%�x@��Wt\�٣CqIf{���p�D�\� ��Ѝ�(P\��X�\�Qe\�\���q�ʧή��2�W�\�iS�s�ł��)�BZ��q�\�1q�W��\09Go\�S�K����\�\�$�\Z�u}\����-*\�t*j<϶\�ڳ\�Y�\\�ns�\��\\��}\�>\�uϺ\�\�s\���uϺ\�\�s\��\�\�?�o \�~�G\n��V �@�cp>\��*к��!�MZ��8\nګ�\Z\�Q�5\�B\�\�i�FV\\b
��\0d�J\�c[!B\��h���:K\�b\�\"�+_�=/ovd\�e,�D�6��c\0K_jC�\�U^��� �\����\�>\�:)��8h�@D�e�KLV%22!�������\�zv�K�\�
�i�\�\�jA�\�u��|�L#�\�L8^5r1#�5ڦ��|Ŏ%U��9Ev\�	L\�\��\�A4R3\���Sȅj\r��j\�\"z�-��\�\�.<\�\0ö�q<QQA�t�6�\�WxL\�(;� 	H�`�7�\�-\�GIb�Ԏ 
�D���:�\�Sܫ)%\�\�o\�d�\����qs��_i�O�$\�\�S\�H�axOP��E�\n\�9�\�5s��G˙^BK�\��\�#68��[y\��2Z\�\�0A3gp���\�\�#\�5\�!!
�\�Ʉ�\��\�P\�\r�L�4%�
_\�\��6G�\�V8�h?̧cF@��SQ2�´�\�R�tbJv��ه�O�\\�����	�
z�v@Bj��7-5�ɕ7@���v�\0<#Wd\�_)�ה�\����\�1��;��P2=1\�\�dmѱ\�j�\��X\�+?uKm��:�\�M<:�M�\�`�5�F\'Ab\�\r�U�l\�r��
�U�M�5̮]�\�B<TA�,\�S\�Y��\�?s-\�oW\�
?3-�ď��\��\�\�p\�b\��Ĕ9\�T���C)ux�O�U��A�\0f�\�\��\0�n\�\�eIy��\�Ӓv���tw
��\nL��eDv_\�\�0�\�wVWI.��\�.���e �\���L���
�~@�:\�Fכj�Yn�u�j
t\�P�4L\��ҏ\�bb��H��$\�빀\��\'��l\�!�b\�z\�}Z\r\�m�\0L\�eL\�k��\�P�Xw���i���\�\�+��\�v\�_\�)7ū)�e\�\Z\�\�\�\�m\�\�\�	��U>��r�n\��\��)P�\�\�
-X��\\0��8\������\��#24�i.Mj�q\r\�hs�S�SY]\Z��[Ns0\�\�	��o�\�\r\�\�v���J\'�\"��\�)��N��H�\�^S%$B��$�\�y�!k\�~^-n�f\�hĽI=\�hL���\�,\�\�M����\�mU�!e�:\�\�W�#ц6��\�\�p�z��mx.9\�\�\Z\�9���\�3D��8�\�|�ZK�\�5�*i\�J�����y R�|\�-~nj \�S��!4nu)\�\�=�\0\�\�\�~��\�z[C\�e�$˼\�S�\�\"�\0\�cv;;X\r\�\�\�\�\�qWf�f��\�\r�\�o)�\����u�Paf\�\\�X�g\�T\Z�\�\n�����MC\ri��\�j�+j��3q\�\\@7U����e�yB�\�\�#
�\�_\�\�\�5��g\�\Z�\�! �<:�x��E>\�L�\�g\'\�\�?\n�.�%WTGZ5hG\���.Y�\�-Y\�5	�1nU�_�\�|��/K��)\��\0-z�܉�l�!A\�\�_LG]�)��I�\�<�S�(\0.� 4\��s	L\�\�\�K��\�~\�\"�\�e\�|�kk�b�\�d\\�+�\�\\\�T&D}OIi�\��Q���/\�\� 5v\��k\�-�kg�p��\�-_\�\'\�2�n�q\�\'��Z7\�1��ۏ\�5o\�Z��	�\�t\���yu\�\n�\�\n��W˗�I�\�vj��\�^t\�h�k�Z\�Z\�\\\���\0�ʘ�\��H\�q�\�\n�4�[=�2��_����(�6✘�8\�hZ�ε\�ј�p\�`X\�#gTka٩�4v�li0ңPz`\�\�2��|_%޸؁��*b��*\��_��?ްM�\0�\�\�z\�x�\0�G/�Y\�\�o�M#��\��L�\�q��+\�\0��#�i\�\Z=fe�wC\�2\�̯�=O���\�\����S��\0�t��\�\�[1I\�\r�F\�S�Ў\�4ΰW��oPe\ZZ�\�}\�SB��3�\n0m�\0n����]dj�-��^bLh:u�\n��\�1@5�\�\�YRP i\��M�ݔ����\�|G�i\0�n\�*�	��\�[Z\"վ\�\�\�Q\�_Y�6a�>R\�i�[�MP�MI����!\��\0�\�����uMr\�lTk���:Q�JPkK�\09b�a\0�o��\�Y�g�G,(�5}�9��#�y��\�(�&q\�\�\�\�UZ\�Ќ=\"/�/)6ex!ҞW\\�){\�J��\�\�o\�U\�%\�8�\0\�t�k�.����\\\�j��L`�qj�\���Ń\�z\Z\�\�\�y!�\�\�-\0�
�\�5�(����|G`���]g�\����\��5���.��\��\�q�\0�~4|\�\��v\Z<G��\0��_�\�','colorful-palm-silhouettes-background_23-2148541792 - Copy - Copy (2).jpg','81104',1);
/*!40000 ALTER TABLE `img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'USER'),(2,'ADMIN'),(3,'USER'),(4,'USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `about_info` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_image` longblob,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'2022-03-18',_binary '','Artis','Brizs','$2a$10$/nt5f4dQzKztZ.au4vf5HeO1cvQywKIA9HBdxYhOt/CIiAOA1OWu6',NULL,'a'),(2,NULL,'2022-03-18',_binary '','John','Doe','$2a$10$Ephl.uTlZIealwC5m9/kSufjOaIzBcSQZDLWnpV9Ir27Do82WlYU6',NULL,'johnDoe'),(3,NULL,'2022-03-18',_binary '','Jane','Doe','$2a$10$6O.M4Z5DOd.y3e.PvnDhxuTzgomaZZ4MFNSIFzvfr8DMiOGXqE5oe',NULL,'janeDoe');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_albums`
--

DROP TABLE IF EXISTS `users_albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `users_albums` (
  `owners_id` bigint NOT NULL,
  `albums_id` bigint NOT NULL,
  KEY `FKgfa8jenvkjiftqlypa0td52sg` (`albums_id`),
  KEY `FK84l90owwrknefntax6surrc5k` (`owners_id`),
  CONSTRAINT `FK84l90owwrknefntax6surrc5k` FOREIGN KEY (`owners_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKgfa8jenvkjiftqlypa0td52sg` FOREIGN KEY (`albums_id`) REFERENCES `album` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_albums`
--

LOCK TABLES `users_albums` WRITE;
/*!40000 ALTER TABLE `users_albums` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_images`
--

DROP TABLE IF EXISTS `users_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `users_images` (
  `image_owners_id` bigint NOT NULL,
  `images_image_id` bigint NOT NULL,
  KEY `FKo8jb5tb8bmpyubtlnffnu0n8d` (`images_image_id`),
  KEY `FK3u0mw73nhyy02dc91shq07088` (`image_owners_id`),
  CONSTRAINT `FK3u0mw73nhyy02dc91shq07088` FOREIGN KEY (`image_owners_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKo8jb5tb8bmpyubtlnffnu0n8d` FOREIGN KEY (`images_image_id`) REFERENCES `img` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_images`
--

LOCK TABLES `users_images` WRITE;
/*!40000 ALTER TABLE `users_images` DISABLE KEYS */;
INSERT INTO `users_images` VALUES (1,1);
/*!40000 ALTER TABLE `users_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKt4v0rrweyk393bdgt107vdx0x` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(1,2),(2,3),(3,4);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-18 10:45:11
