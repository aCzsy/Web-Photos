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

use heroku_501aa18fad06f83;

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
  `is_sent` bit(1) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
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
  `is_sent` bit(1) NOT NULL,
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
INSERT INTO `hibernate_sequence` VALUES (1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_comments`
--

LOCK TABLES `image_comments` WRITE;
/*!40000 ALTER TABLE `image_comments` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image_send_entity`
--

LOCK TABLES `image_send_entity` WRITE;
/*!40000 ALTER TABLE `image_send_entity` DISABLE KEYS */;
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
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'USER'),(3,'USER'),(4,'USER');
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
INSERT INTO `users` VALUES (1,NULL,'2022-06-05',_binary '','Artis','Brizs','$2a$10$vJtQxAU1IH8tP4ZLSDLuMe.gNxIWMaFCAqj2T7eQtqUUu8FaParde',NULL,'admin'),(2,NULL,'2022-06-05',_binary '','John','Doe','$2a$10$6GSEmJ7MACPv7PFs.i7etehtcNuACCFvuW4Ni8QnSgmw1LAGe5QFu',NULL,'johnDoe'),(3,NULL,'2022-06-05',_binary '','Jane','Doe','$2a$10$qBuypysSK70fF6WFAWyQIeu.85/pO5qKbH.gcsPnT3vrg0PrABzYC',NULL,'janeDoe');
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

-- Dump completed on 2022-06-05 17:26:51
