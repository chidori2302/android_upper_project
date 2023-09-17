-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: souq
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  UNIQUE KEY `cart_constraint` (`user_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (11,14),(11,25),(24,14),(24,15),(24,25);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`favorite_id`),
  UNIQUE KEY `fav_constraint` (`user_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES (108,24,14),(110,24,15),(111,24,16);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`history_id`),
  UNIQUE KEY `history_constraint` (`user_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `history_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (2,26,14),(8,26,15),(7,26,16),(1,26,24),(16,27,14);
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordering`
--

DROP TABLE IF EXISTS `ordering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordering` (
  `ordering_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `status` text DEFAULT NULL,
  `name_on_card` text DEFAULT NULL,
  `card_number` text DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ordering_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `ordering_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ordering_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordering`
--

LOCK TABLES `ordering` WRITE;
/*!40000 ALTER TABLE `ordering` DISABLE KEYS */;
INSERT INTO `ordering` VALUES (18,55470123,'2020-06-15','shipped','Marwa','51c983fd74d04728e7615b1ddbe2433fb2b8d11995dd6c49434b7278cc559617','2022-06-00',24,18),(19,66595700,'2020-06-15','shipped','Marwa','2b211448b53a4ab638b90828957dd5d1c178302280ae6afd3ab7f1028bb9d761','2023-07-00',24,30),(20,55789264,'2020-06-15','shipped','Nora','025c975551f0f1c6b9a64c6e2f0b772e63838c950bf9b1d575b7218038c9e77c','2022-08-00',11,21),(21,66116913,'2020-06-15','shipped','Nora','966a0b5e0af457852f709b0ec3f006e73e02de025f7d0143d9c8ebf21d36f4da','2028-04-00',11,32),(22,55524173,'2020-06-16','shipped','Nora','5681e7cd516a74a88c4b13cfe90a976e322557c3540de331b1a5f502e6c4842c','2022-08-00',11,21),(23,55506266,'2020-06-16','shipped','Nora','8a9bc9585ad5a5b5c58b14162996aa2b23afb7a1c0df4a674a4e01dfc5dc74b8','2024-04-00',11,21);
/*!40000 ALTER TABLE `ordering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poster`
--

DROP TABLE IF EXISTS `poster`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poster` (
  `poster_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` text NOT NULL,
  PRIMARY KEY (`poster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poster`
--

LOCK TABLES `poster` WRITE;
/*!40000 ALTER TABLE `poster` DISABLE KEYS */;
INSERT INTO `poster` VALUES (4,'storage_poster\\1586915706231newsfeed1.PNG'),(5,'storage_poster\\1586915711879newsfeed2.PNG'),(6,'storage_poster\\1586915716333newsfeed3.PNG');
/*!40000 ALTER TABLE `poster` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` text DEFAULT NULL,
  `price` double(11,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `supplier` text NOT NULL,
  `image` text NOT NULL,
  `category` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (14,'Iphone XS Max ',15989.00,300,'Apple','storage_product\\1578602090348iphone_xs_max.jpg','sneaker'),(15,'Xiaomi Mi A1',2555.00,400,'Xiaomi','storage_product\\1578602439473mi_a1.jpg','sneaker'),(16,'Samsung Galaxy S10',1266.60,450,'Samsung ','storage_product\\1578602676852galaxy_s10.jpg','sneaker'),(17,'Huawei P30 Lite',4695.00,450,'Huawei ','storage_product\\1578602815200p30_llte.jpg','sneaker'),(18,'Apple iPhone 6S ',5319.00,300,'Apple','storage_product\\1578602897488iphone_6s.jpg','sneaker'),(19,'Huawei Y9 prime',3380.00,300,'Huawei','storage_product\\1578603046641y9_prime.jpg','sneaker'),(20,'Oppo Find X ',15147.00,300,'Oppo ','storage_product\\1578603154028find_x.jpg','sneaker'),(21,'Oppo A5S ',2649.00,700,'Oppo ','storage_product\\1578603248234oppo_a5s.jpg','sneaker'),(22,'Apple Iphone X With Facetime',13888.00,690,'Apple','storage_product\\1578603369303iphone_x.jpg','sneaker'),(23,'Samsung Galaxy S9',10149.00,500,'Samsung','storage_product\\1578787404437galaxy_s.jpg','sneaker'),(24,'Apple MacBook Air MQD32',16499.00,700,'Apple','storage_product\\1578949241064apple_macbook_air_mqd32.jpg','oxford'),(25,'Apple MacBook MNYF2 ',20200.00,700,'Apple','storage_product\\1578949482473apple_macbook_mnyf2.jpg','oxford'),(26,'Lenovo V145 Laptop',3249.00,700,'Lenovo','storage_product\\1578949593137lenovo_v145.jpg','oxford'),(27,'Lenovo V130 Laptop',4799.00,676,'Lenovo','storage_product\\1578949711235lenovo_v130.jpg','oxford'),(28,'HP PRO Book 450',8850.00,676,'HP','storage_product\\1578949852513hp_pro_book_450.jpg','oxford'),(29,'HP OMEN ',2899.90,943,'HP','storage_product\\1578949956839hp_omen.jpg','oxford'),(30,'Dell 3580 Laptop',9999.00,340,'Dell','storage_product\\1578950115413dell_3580.jpg','oxford'),(31,'Dell Inspiron 3576 Notebook',6191.00,600,'Dell','storage_product\\1578950196252dell_inspiron_3576.jpg','oxford'),(32,'Lenovo Ideapad 330 Laptop',3740.00,845,'Lenovo ','storage_product\\1578950328009lenovo_ideapad_330.jpg','oxford'),(33,'Dell G3-3579 Gaming Laptop',18444.00,755,'Dell','storage_product\\1578950480476dell_g3-3579_gaming.jpg','oxford'),(35,'Jenga toy - Folds High Wood Toys',199.00,70,'Scoopforsale','storage_product\\1584383886944item_XXL_22009042_28649300.jpg','boot'),(36,'Dominoes 3636 In Box Toy - Multicolor',59.00,245,'Macashope\n','storage_product\\1584384204697item_XL_9306984_10099208.jpg','boot'),(37,'Lego Toy Ninjago The Golden Dragon ',799.00,450,'SouqEgypt','storage_product\\1584384346218item_XL_43457666_994d4cfc787d8.jpg','boot'),(38,'Clay Ice Cream Machine Toy For Kids',115.00,300,'Macashope','storage_product\\1584384495028item_XL_37073918_144768916.jpg','boot'),(39,'Little Chef Toy for Kids',350.00,250,'Dokan55','storage_product\\1584385368740item_XL_77268323_3078d6062ac15.jpg','boot'),(40,'Village Building Block Toy Set',119.00,100,'Kingsons','storage_product\\1584385632569item_XL_38586747_150503533.jpg','boot'),(41,'Musical Electronic Keyboard Toy for Kids',482.00,150,'SouqEgypt','storage_product\\1584385840711item_XL_68472912_3d16f21654ba9.jpg','boot'),(48,'Trefl Toy Story 4 Puzzle',114.00,150,'SouqEgypt','storage_product\\1584386909831item_XL_73895297_44847625945bc.jpg','boot'),(49,'Fishing Toy Battery Operated 42 Fishes',129.00,660,'SouqEgypt','storage_product\\1584387499975item_XL_6068961_3185089.jpg','boot'),(50,'Bingo game',35.00,660,'RightTech','storage_product\\1584387715524item_XL_12104633_18232194.jpg','boot'),(51,'Bimbo baby bouncer stainless steel',210.00,30,'Moro','storage_product\\1584387944814item_XL_48416598_b3b145a380c89.jpg','loafer'),(52,'Chicco Snappy Stroller',1852.00,45,'SouqEgypt','storage_product\\1584388083812item_XL_9017885_32112873.jpg','loafer'),(53,'Moro rocking chair',250.00,12,'Moro','storage_product\\1584388198554item_XL_99338310_2b4fe0429332d.jpg','loafer'),(54,'Nania Cosmo SP Group Baby Car Seat',1000.00,300,'SouqEgypt','storage_product\\1584392483475item_XL_68323402_e099c9938f6ad.jpg','loafer'),(55,'Universal CarryCot For Boys',348.00,23,'SouqEgypt','storage_product\\1584392588404item_XXL_32856743_fca2f9b1fd841.jpg','loafer'),(56,'Mastela 6519 Portable Swing',1630.00,50,'Malikababyshop','storage_product\\1584392713899item_XL_26130347_48578034.jpg','loafer'),(57,'Baby Walker with Toys',1500.00,39,'SouqEgypt','storage_product\\1584392793248item_XL_69832926_d5665dd53cac7.jpg','loafer'),(58,'Baby travel cot bag 3 in 1',318.00,57,' Elgmalnew','storage_product\\1584393087687item_XL_7750165_6665206.jpg','loafer'),(59,'Maxi Cosi Citi Baby Car Seat',3000.00,60,'SouqEgypt','storage_product\\1584393757637item_XL_33112354_126296765.jpg','loafer'),(60,'Universal Mini Cross Rocking Baby Crib',1125.00,34,'SouqEgypt','storage_product\\1584394081100item_XL_32894804_150649273.jpg','loafer');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `feedback` varchar(150) DEFAULT NULL,
  `rate` float(11,1) DEFAULT NULL,
  `review_date` date DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `review_constraint` (`user_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (2,11,14,'Nice',3.0,'2020-03-09'),(4,11,15,'good',4.0,'2020-03-10'),(5,24,15,'Amazing',5.0,'2020-03-10'),(47,11,33,'Very good',4.0,'2020-05-05'),(49,24,25,'Wonderful',5.0,'2020-05-06'),(50,26,24,'Te vl',0.5,'2023-09-17');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping` (
  `shipping_id` int(11) NOT NULL AUTO_INCREMENT,
  `address` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `country` text DEFAULT NULL,
  `zip` text DEFAULT NULL,
  `phone` text DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`shipping_id`),
  KEY `user_id` (`user_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `shipping_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (18,'Sidi Gaber','Alexandria','Egypt','4545','012564988',24,18),(19,'Sidi Gaber','Alexandria','Egypt','4545','01079559906',24,30),(20,'Naser City','Cairo','Egypt','3030','0128686888',11,21),(21,'Naser City','Cairo','Egypt','3030','8655686',11,32),(22,'Naser City','Cairo','Egypt','3030','8568690',11,21);
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `gender` text NOT NULL,
  `age` int(11) NOT NULL,
  `image` text NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Ibrahiem','ub@yahoo.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','male',20,'',0),(2,'Soha ALi','soha@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','',20,'',0),(3,'Hana','hana@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','',0,'',0),(4,'Salma','salma@yahoo.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','',0,'',0),(5,'Rami','rami@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'',0),(6,'Noha','noha@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'',0),(7,'Hala','hala@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'',0),(10,'Samah','samah@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'',0),(11,'Nora','nora@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'storage_user\\1582402749541flower.jpeg',0),(12,'Laila','laila@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'storage_user\\1582408987863tinkerbell.jpg',0),(13,'Ramez','ramez@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'',0),(14,'Yoyo','yoyo@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'',0),(16,'Mahmoud','mahmoud@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'',0),(18,'Noran','noran@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'',0),(21,'Hadi','hadi@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'',0),(23,'Rania','rania@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'',0),(24,'Marwa Eltayeb','marwa_eltayeb@yahoo.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'storage_user\\1583003208523tinkerbell.jpg',1),(25,'Nahla','nahla@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','female',30,'',0),(26,'chido','chido@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'',0),(27,'chidori','chidori@gmail.com','$10$kpEenal072s8GVAZmsfNO.4S39JQbU8FoaFM40PQzTUjAgMl31CD.','undertermined',0,'storage_user\\1583003208523tinkerbell.jpg',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'souq'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-17 17:53:09
