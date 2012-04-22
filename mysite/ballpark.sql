-- MySQL dump 10.13  Distrib 5.1.58, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ballpark
-- ------------------------------------------------------
-- Server version	5.1.58-1ubuntu1

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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_bda51c3c` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add log entry',6,'add_logentry'),(17,'Can change log entry',6,'change_logentry'),(18,'Can delete log entry',6,'delete_logentry'),(19,'Can add stadium',7,'add_stadium'),(20,'Can change stadium',7,'change_stadium'),(21,'Can delete stadium',7,'delete_stadium'),(22,'Can add restaurant',8,'add_restaurant'),(23,'Can change restaurant',8,'change_restaurant'),(24,'Can delete restaurant',8,'delete_restaurant'),(25,'Can add item_type',9,'add_item_type'),(26,'Can change item_type',9,'change_item_type'),(27,'Can delete item_type',9,'delete_item_type'),(28,'Can add menu_item',10,'add_menu_item'),(29,'Can change menu_item',10,'change_menu_item'),(30,'Can delete menu_item',10,'delete_menu_item'),(31,'Can add extra_item',11,'add_extra_item'),(32,'Can change extra_item',11,'change_extra_item'),(33,'Can delete extra_item',11,'delete_extra_item'),(34,'Can add status_description',12,'add_status_description'),(35,'Can change status_description',12,'change_status_description'),(36,'Can delete status_description',12,'delete_status_description'),(37,'Can add order_status',13,'add_order_status'),(38,'Can change order_status',13,'change_order_status'),(39,'Can delete order_status',13,'delete_order_status'),(40,'Can add order',14,'add_order'),(41,'Can change order',14,'change_order'),(42,'Can delete order',14,'delete_order'),(43,'Can add order_extra',15,'add_order_extra'),(44,'Can change order_extra',15,'change_order_extra'),(45,'Can delete order_extra',15,'delete_order_extra'),(46,'Can add customer',16,'add_customer'),(47,'Can change customer',16,'change_customer'),(48,'Can delete customer',16,'delete_customer'),(49,'Can add cart',17,'add_cart'),(50,'Can change cart',17,'change_cart'),(51,'Can delete cart',17,'delete_cart'),(52,'Can add cart_extra',18,'add_cart_extra'),(53,'Can change cart_extra',18,'change_cart_extra'),(54,'Can delete cart_extra',18,'delete_cart_extra');
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
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'admin','','','cs487ballpark@iit.edu','pbkdf2_sha256$10000$imXR7Ks8DpDp$ogKk6mBHfu7QI+jAeTJwubNQPC8MTiHyk/1LOku+uLI=',1,1,1,'2012-04-16 10:59:10','2012-04-05 02:29:40'),(2,'client','','','','pbkdf2_sha256$10000$2ml69qookICf$pz8OePmaX9HXHrV0ybUkNmR6yHDdYSMgVlz52SF1nZ4=',1,1,0,'2012-04-12 17:19:08','2012-04-12 17:07:24');
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
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_fbfc09f1` (`user_id`),
  KEY `auth_user_groups_bda51c3c` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_fbfc09f1` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,23);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_cart`
--

DROP TABLE IF EXISTS `ballpark_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `has_extra` int(11) NOT NULL,
  `username_id` varchar(30) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  `item_price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ballpark_cart_ccda2b2f` (`restaurant_id`),
  KEY `ballpark_cart_a1190b5c` (`username_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_cart`
--

LOCK TABLES `ballpark_cart` WRITE;
/*!40000 ALTER TABLE `ballpark_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ballpark_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_cart_extra`
--

DROP TABLE IF EXISTS `ballpark_cart_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_cart_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_item_id` int(11) NOT NULL,
  `extra_name` varchar(20) NOT NULL,
  `extra_price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_item_id` (`cart_item_id`,`extra_name`),
  KEY `ballpark_cart_extra_556450ad` (`cart_item_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_cart_extra`
--

LOCK TABLES `ballpark_cart_extra` WRITE;
/*!40000 ALTER TABLE `ballpark_cart_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `ballpark_cart_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_customer`
--

DROP TABLE IF EXISTS `ballpark_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_customer` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `cc_name` varchar(20) NOT NULL,
  `cc_number` varchar(20) NOT NULL,
  `cc_exp_month` varchar(20) NOT NULL,
  `cc_exp_year` varchar(20) NOT NULL,
  `seat_number` varchar(20) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_customer`
--

LOCK TABLES `ballpark_customer` WRITE;
/*!40000 ALTER TABLE `ballpark_customer` DISABLE KEYS */;
INSERT INTO `ballpark_customer` VALUES ('user1','pass1','John Smith','1234567890123456','12','2012','2'),('test','test','Bob','1','4','2014','2'),('','','','','1','','');
/*!40000 ALTER TABLE `ballpark_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_extra_item`
--

DROP TABLE IF EXISTS `ballpark_extra_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_extra_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `extra_name` varchar(20) NOT NULL,
  `extra_price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurant_id` (`restaurant_id`,`extra_name`),
  KEY `ballpark_extra_item_ccda2b2f` (`restaurant_id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_extra_item`
--

LOCK TABLES `ballpark_extra_item` WRITE;
/*!40000 ALTER TABLE `ballpark_extra_item` DISABLE KEYS */;
INSERT INTO `ballpark_extra_item` VALUES (1,1,'Tomatoes','0.75'),(2,1,'Cheese','0.95'),(3,1,'Garlic','0.00'),(4,1,'Pepper','0.00'),(5,2,'Ketchup','0.00'),(6,2,'Mustard','0.00'),(7,2,'Salt','0.00'),(8,4,'Lemon','0.50'),(9,4,'Lime','0.50'),(10,5,'Whipped Cream','1.00'),(11,5,'Chocolate Chips','1.00'),(12,5,'Chocolate Sauce','0.75'),(13,5,'Strawberry Toppings','1.50'),(14,5,'Blueberry Toppings','1.50'),(15,3,'Hot Peppers','0.50'),(16,3,'Parmesan Cheese','0.25'),(17,3,'Bacon Bits','1.00'),(18,6,'Ketchup','0.00'),(19,6,'Mustard','0.00'),(20,6,'Salt','0.00'),(21,7,'Hot Peppers','1.00'),(22,7,'Ketchup','0.00'),(23,7,'Mustard','0.00');
/*!40000 ALTER TABLE `ballpark_extra_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_item_type`
--

DROP TABLE IF EXISTS `ballpark_item_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_item_type` (
  `item_type` varchar(20) NOT NULL,
  PRIMARY KEY (`item_type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_item_type`
--

LOCK TABLES `ballpark_item_type` WRITE;
/*!40000 ALTER TABLE `ballpark_item_type` DISABLE KEYS */;
INSERT INTO `ballpark_item_type` VALUES ('Appetizers'),('Desserts'),('Drinks'),('Main Dishes'),('Side Dishes');
/*!40000 ALTER TABLE `ballpark_item_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_menu_item`
--

DROP TABLE IF EXISTS `ballpark_menu_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_menu_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_price` decimal(6,2) NOT NULL,
  `item_type_id` varchar(20) NOT NULL,
  `picture_url` varchar(120) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurant_id` (`restaurant_id`,`item_name`),
  KEY `ballpark_menu_item_ccda2b2f` (`restaurant_id`),
  KEY `ballpark_menu_item_38d6fbe9` (`item_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_menu_item`
--

LOCK TABLES `ballpark_menu_item` WRITE;
/*!40000 ALTER TABLE `ballpark_menu_item` DISABLE KEYS */;
INSERT INTO `ballpark_menu_item` VALUES (1,1,'Stuffed Pizza','15.35','Main Dishes','http://www.giordanos.com/images/stuffed/pizzaone.jpg'),(2,1,'Garlic Bread','2.75','Appetizers','http://www.hgjones.org/wp-content/uploads/2012/03/1259174262-rcp-garlicbread.jpg'),(3,1,'Meatball Sandwich','7.75','Main Dishes','http://newyork.seriouseats.com/images/2012/01/20120111-meatball-sandwich.jpg'),(4,1,'Budweiser','3.95','Drinks','http://gregguide.com/wp-content/uploads/2010/03/budweiser.jpg'),(5,2,'Hamburger','2.50','Main Dishes','http://upload.wikimedia.org/wikipedia/commons/d/d7/McDonald\'s_Hamburger_2007.jpg'),(6,2,'Cheeseburger','2.95','Main Dishes','http://farm3.static.flickr.com/2756/4522641014_06326f2b2f.jpg'),(7,2,'Fries','1.25','Appetizers','http://pennyhaw.files.wordpress.com/2011/04/fries.jpg'),(8,2,'Coke','0.75','Drinks','http://warrencbennett.files.wordpress.com/2012/01/coke.jpg'),(9,3,'Root Beer Float','4.50','Drinks','http://www.mightysweet.com/mesohungry/wp-content/uploads/2009/08/17-99cent-Root-Beer-Float-at-Venice-Beach.jpg'),(10,3,'Pepperoni Slice','3.99','Main Dishes','http://www.thecookbookchronicles.com/blog/wp-content/uploads/2009/08/ginoseast8.jpg'),(11,3,'Sausage Slice','3.99','Main Dishes','http://slice.seriouseats.com/images/2011/07/20110720-161716-Chicago-Ginos-East-Deep-Dish-Slice-CC.jpg'),(12,3,'Garlic Sticks','5.99','Side Dishes','http://www.ginosonhiggins.com/images/goh_app.jpg'),(13,4,'Pepe Nero','8.00','Drinks','http://www.drinkingrealbeer.com/wp-content/uploads/2011/02/goose-island-pepe-nero.jpg'),(14,4,'Honker\'s Ale','6.00','Drinks','http://4.bp.blogspot.com/-fAQSHGSVnUc/Tyn-8cdfFtI/AAAAAAAAAB8/go2DTf533RU/s1600/Goose+Island+Honker\'s+Ale.jpg'),(15,4,'312 Urban Wheat Ale','5.00','Drinks','http://beercraving.com/sites/default/files/imagecache/beer_full/goose312_0.jpeg'),(16,5,'Turtle Cheesecake','6.00','Desserts','http://www.atlantic.k12.ia.us/~2015008/images/turtlecheesecake.jpg'),(17,5,'Original Cheesecake','5.00','Desserts','http://www.americanfoodandag.com/NewsLetter/Images/eli-cheesecake-Original.jpg'),(18,6,'Duck Fat Fries','3.50','Side Dishes','http://media.avclub.com/images/articles/article/24974/HD_duckfatFF_Decider_jpg_627x325_crop_upscale_q85.jpg'),(19,6,'Tater Tots','3.00','Side Dishes','http://s3-media3.ak.yelpcdn.com/bphoto/5zG4s2e04WGH_YAeyG2Z5Q/l.jpg'),(20,6,'The Dave Pound','1.50','Main Dishes','http://farm7.static.flickr.com/6140/5983349794_8b8095ea40.jpg'),(21,6,'The Dog','2.00','Main Dishes','http://www.seriouseats.com/images/20090915-hot-douggies.jpg'),(22,7,'Bleu Cheese Fries','3.50','Side Dishes','http://seanlockedigitalimagery.files.wordpress.com/2009/07/als_22.jpg?w=450'),(23,7,'BBQ Burger','5.99','Main Dishes','http://3.bp.blogspot.com/-ku7jyoiulcM/TtLAUuiOlFI/AAAAAAAAASU/whkSjpsBDsQ/s1600/SAM_0912.JPG'),(24,7,'Italian Beef','5.99','Main Dishes','http://unbreaded.com/wp-content/uploads/2009/04/als-beef-chicago.jpg'),(25,7,'Polish with Fries','5.00','Main Dishes','http://chicago.seriouseats.com/images/20120113-187464-standing-room-only-als-under-the-l-fries.jpg'),(26,7,'Italian Sausage','4.00','Main Dishes','http://www.phdelicious.com/images/Alsbeefshop/comboall.jpg');
/*!40000 ALTER TABLE `ballpark_menu_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_order`
--

DROP TABLE IF EXISTS `ballpark_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number_id` int(11) NOT NULL,
  `item_number` int(11) NOT NULL,
  `item_name` varchar(20) NOT NULL,
  `item_price` decimal(6,2) NOT NULL,
  `item_quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number_id` (`order_number_id`,`item_number`,`item_name`),
  KEY `ballpark_order_329b85e8` (`order_number_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_order`
--

LOCK TABLES `ballpark_order` WRITE;
/*!40000 ALTER TABLE `ballpark_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ballpark_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_order_extra`
--

DROP TABLE IF EXISTS `ballpark_order_extra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_order_extra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number_id` int(11) NOT NULL,
  `extra_name` varchar(20) NOT NULL,
  `extra_price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number_id` (`order_number_id`,`extra_name`),
  KEY `ballpark_order_extra_329b85e8` (`order_number_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_order_extra`
--

LOCK TABLES `ballpark_order_extra` WRITE;
/*!40000 ALTER TABLE `ballpark_order_extra` DISABLE KEYS */;
/*!40000 ALTER TABLE `ballpark_order_extra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_order_status`
--

DROP TABLE IF EXISTS `ballpark_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_order_status` (
  `transaction_number` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `order_number` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `date_of_order` date NOT NULL,
  `seat_number` varchar(20) NOT NULL,
  `order_status_description_id` varchar(20) NOT NULL,
  PRIMARY KEY (`transaction_number`),
  UNIQUE KEY `order_number` (`order_number`,`restaurant_id`,`date_of_order`),
  KEY `ballpark_order_status_fbfc09f1` (`user_id`),
  KEY `ballpark_order_status_ccda2b2f` (`restaurant_id`),
  KEY `ballpark_order_status_180186d6` (`order_status_description_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_order_status`
--

LOCK TABLES `ballpark_order_status` WRITE;
/*!40000 ALTER TABLE `ballpark_order_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ballpark_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_restaurant`
--

DROP TABLE IF EXISTS `ballpark_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(25) NOT NULL,
  `stadium_name_id` varchar(25) NOT NULL,
  `delivery_fee` decimal(6,2) NOT NULL,
  `logo_url` varchar(120) NOT NULL,
  `current_order_number` int(11) NOT NULL,
  `current_business_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stadium_name_id` (`stadium_name_id`,`restaurant_name`),
  KEY `ballpark_restaurant_774b0f6d` (`stadium_name_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_restaurant`
--

LOCK TABLES `ballpark_restaurant` WRITE;
/*!40000 ALTER TABLE `ballpark_restaurant` DISABLE KEYS */;
INSERT INTO `ballpark_restaurant` VALUES (1,'Giordanos','Comiskey Park','2.00','http://www.secondcitypizzatours.com/GiordanosLogo_000.jpg',0,'2012-04-09'),(2,'Maxwell Street Original','Comiskey Park','2.00','http://theoriginalmaxwellstreet.com/images/sign_logo.gif',0,'2012-04-09'),(3,'Gino\'s East','Comiskey Park','2.00','http://www.secondcitypizzatours.com/Gino\'s_Logo.jpg',0,'2012-04-10'),(4,'Goose Island','Comiskey Park','3.00','http://www.gooseisland.com/goosefilebin/images/partner_tools/logos/low_res_jpeg/GooseIsland_Corporate_Logo_Lo_Res.jpg',0,'2012-04-10'),(5,'Eli\'s Cheesecake','Comiskey Park','1.00','http://larryfire.files.wordpress.com/2010/08/elis_cheesecake_logo_raster.jpg',0,'2012-04-10'),(6,'Hot Doug\'s','Comiskey Park','1.50','http://hotdougs.com/Images/HotDougslogo_medium.jpg',0,'2012-04-10'),(7,'Al\'s Beef','Comiskey Park','2.25','http://evanstonlifestyle.com/blog/wp-content/uploads/2008/11/als-beef1.jpg',0,'2012-04-10');
/*!40000 ALTER TABLE `ballpark_restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_stadium`
--

DROP TABLE IF EXISTS `ballpark_stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_stadium` (
  `stadium_name` varchar(25) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  PRIMARY KEY (`stadium_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_stadium`
--

LOCK TABLES `ballpark_stadium` WRITE;
/*!40000 ALTER TABLE `ballpark_stadium` DISABLE KEYS */;
INSERT INTO `ballpark_stadium` VALUES ('Cowboys Stadium','-97.0927780','32.7477780'),('Madison Square Garden','-73.9936110','40.7505560'),('Rose Bowl','-118.1675000','34.1613890'),('Comiskey Park','-87.6336110','41.8316670');
/*!40000 ALTER TABLE `ballpark_stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ballpark_status_description`
--

DROP TABLE IF EXISTS `ballpark_status_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ballpark_status_description` (
  `order_status_description` varchar(20) NOT NULL,
  PRIMARY KEY (`order_status_description`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballpark_status_description`
--

LOCK TABLES `ballpark_status_description` WRITE;
/*!40000 ALTER TABLE `ballpark_status_description` DISABLE KEYS */;
INSERT INTO `ballpark_status_description` VALUES ('Arrived'),('Cooking'),('In Delivery');
/*!40000 ALTER TABLE `ballpark_status_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_fbfc09f1` (`user_id`),
  KEY `django_admin_log_e4470c6e` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2012-04-05 02:35:21',1,7,'Cowboys Stadium','Cowboys Stadium',1,''),(2,'2012-04-05 02:38:06',1,12,'Cooking','Cooking',1,''),(3,'2012-04-05 02:40:07',1,12,'In Delivery','In Delivery',1,''),(4,'2012-04-05 02:40:23',1,12,'Arrived','Arrived',1,''),(5,'2012-04-05 02:41:19',1,9,'Main Dishes','Main Dishes',1,''),(6,'2012-04-05 02:41:25',1,9,'Side Dishes','Side Dishes',1,''),(7,'2012-04-05 02:41:31',1,9,'Drinks','Drinks',1,''),(8,'2012-04-05 02:41:55',1,9,'Appetizers','Appetizers',1,''),(9,'2012-04-05 02:42:12',1,9,'Desserts','Desserts',1,''),(10,'2012-04-05 02:43:27',1,7,'Madison Square Garden','Madison Square Garden',1,''),(11,'2012-04-05 02:44:51',1,7,'Rose Bowl','Rose Bowl',1,''),(12,'2012-04-05 02:45:37',1,7,'Comiskey Park','Comiskey Park',1,''),(13,'2012-04-05 02:51:54',1,8,'1','Comiskey Park -- Giordanos',1,''),(14,'2012-04-05 02:54:30',1,10,'1','Stuffed Pizza',1,''),(15,'2012-04-05 02:56:07',1,10,'2','Garlic Bread',1,''),(16,'2012-04-05 03:01:01',1,10,'3','Meatball Sandwich',1,''),(17,'2012-04-05 03:04:08',1,10,'4','Budweiser',1,''),(18,'2012-04-05 03:06:59',1,8,'2','Comiskey Park -- Maxwell Street Original',1,''),(19,'2012-04-05 03:08:24',1,10,'5','Hamburger',1,''),(20,'2012-04-05 03:12:32',1,10,'6','Cheeseburger',1,''),(21,'2012-04-05 03:14:19',1,10,'7','Fries',1,''),(22,'2012-04-05 03:15:13',1,10,'8','Coke',1,''),(23,'2012-04-05 03:15:41',1,11,'1','Tomatoes',1,''),(24,'2012-04-05 03:16:01',1,11,'2','Cheese',1,''),(25,'2012-04-05 03:16:25',1,11,'3','Garlic',1,''),(26,'2012-04-05 03:16:39',1,11,'4','Pepper',1,''),(27,'2012-04-05 03:16:59',1,11,'5','Ketchup',1,''),(28,'2012-04-05 03:17:23',1,11,'6','Mustard',1,''),(29,'2012-04-05 03:17:59',1,11,'7','Salt',1,''),(30,'2012-04-10 14:58:54',1,8,'3','Gino\'s East-Comiskey Park',1,''),(31,'2012-04-10 15:00:05',1,10,'9','Root Beer Float',1,''),(32,'2012-04-10 15:01:16',1,10,'10','Pepperoni Slice',1,''),(33,'2012-04-10 15:02:04',1,10,'11','Sausage Slice',1,''),(34,'2012-04-10 15:02:47',1,10,'12','Garlic Sticks',1,''),(35,'2012-04-10 15:04:08',1,8,'4','Goose Island-Comiskey Park',1,''),(36,'2012-04-10 15:05:00',1,10,'13','Pepe Nero',1,''),(37,'2012-04-10 15:06:15',1,10,'14','Honker\'s Ale',1,''),(38,'2012-04-10 15:06:49',1,10,'15','312 Urban Wheat Ale',1,''),(39,'2012-04-10 15:07:35',1,8,'5','Eli\'s Cheesecake-Comiskey Park',1,''),(40,'2012-04-10 15:08:14',1,10,'16','Turtle Cheesecake',1,''),(41,'2012-04-10 15:09:16',1,10,'17','Original Cheesecake',1,''),(42,'2012-04-10 15:10:06',1,8,'6','Hot Doug\'s-Comiskey Park',1,''),(43,'2012-04-10 15:10:59',1,10,'18','Duck Fat Fries',1,''),(44,'2012-04-10 15:12:08',1,10,'19','Tater Tots',1,''),(45,'2012-04-10 15:12:35',1,10,'20','The Dave Pound',1,''),(46,'2012-04-10 15:13:25',1,10,'21','The Dog',1,''),(47,'2012-04-10 15:13:54',1,8,'7','Al\'s Beef-Comiskey Park',1,''),(48,'2012-04-10 15:14:59',1,10,'22','Bleu Cheese Fries',1,''),(49,'2012-04-10 15:15:29',1,10,'23','BBQ Burger',1,''),(50,'2012-04-10 15:15:57',1,10,'24','Italian Beef',1,''),(51,'2012-04-10 15:16:24',1,10,'25','Polish with Fries',1,''),(52,'2012-04-10 15:16:52',1,10,'26','Italian Sausage',1,''),(53,'2012-04-10 15:20:32',1,11,'8','Lemon',1,''),(54,'2012-04-10 15:20:45',1,11,'9','Lime',1,''),(55,'2012-04-10 15:21:06',1,11,'10','Whipped Cream',1,''),(56,'2012-04-10 15:21:28',1,11,'11','Chocolate Chips',1,''),(57,'2012-04-10 15:21:53',1,11,'12','Chocolate Sauce',1,''),(58,'2012-04-10 15:22:12',1,11,'13','Strawberry Toppings',1,''),(59,'2012-04-10 15:22:53',1,11,'14','Blueberry Toppings',1,''),(60,'2012-04-10 15:23:22',1,11,'15','Hot Peppers',1,''),(61,'2012-04-10 15:24:05',1,11,'16','Parmesan Cheese',1,''),(62,'2012-04-10 15:24:37',1,11,'17','Bacon Bits',1,''),(63,'2012-04-10 15:25:01',1,11,'18','Ketchup',1,''),(64,'2012-04-10 15:25:20',1,11,'19','Mustard',1,''),(65,'2012-04-10 15:25:40',1,11,'20','Salt',1,''),(66,'2012-04-10 15:25:55',1,11,'21','Hot Peppers',1,''),(67,'2012-04-10 15:26:06',1,11,'22','Ketchup',1,''),(68,'2012-04-10 15:26:17',1,11,'23','Mustard',1,''),(69,'2012-04-12 17:07:24',1,3,'2','client',1,''),(70,'2012-04-12 17:08:00',1,3,'2','client',2,'Changed password, is_staff and user_permissions.'),(71,'2012-04-16 11:55:56',1,3,'3','test',1,''),(72,'2012-04-16 11:56:07',1,3,'3','test',2,'Changed password.'),(73,'2012-04-16 12:24:24',1,3,'3','test',3,''),(74,'2012-04-16 13:25:34',1,7,'test1','test1',1,''),(75,'2012-04-16 13:25:49',1,7,'test2','test2',1,''),(76,'2012-04-16 13:26:52',1,7,'test1','test1',3,''),(77,'2012-04-16 13:26:56',1,7,'test2','test2',3,'');
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
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'log entry','admin','logentry'),(7,'stadium','ballpark','stadium'),(8,'restaurant','ballpark','restaurant'),(9,'item_type','ballpark','item_type'),(10,'menu_item','ballpark','menu_item'),(11,'extra_item','ballpark','extra_item'),(12,'status_description','ballpark','status_description'),(13,'order_status','ballpark','order_status'),(14,'order','ballpark','order'),(15,'order_extra','ballpark','order_extra'),(16,'customer','ballpark','customer'),(17,'cart','ballpark','cart'),(18,'cart_extra','ballpark','cart_extra');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_c25c2c28` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('d9483d5e98dee420a19c5e8d114f341c','OWZmZWY0OWRlN2I0YmYwNTg3ZjdlN2Q0NjljMDc4YmYwYmE5NmM3MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-04-19 16:34:17'),('838f125f1337553ba77574957099a8cd','OWZmZWY0OWRlN2I0YmYwNTg3ZjdlN2Q0NjljMDc4YmYwYmE5NmM3MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-04-20 07:06:09'),('f940c2b34f3f477bcb3a07cbd8b0ceb1','OWZmZWY0OWRlN2I0YmYwNTg3ZjdlN2Q0NjljMDc4YmYwYmE5NmM3MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-04-19 10:59:00'),('8d43206d1c13f40c184ec05e26500580','OWU2Yzc2NjhhMzQ4NDA5OGZjMzU2Y2I4NjMxY2Y5MGRjYTY3NjdiYjqAAn1xAS4=\n','2012-04-20 14:34:39'),('f65ffb315f465ed4e760f49b46ccb232','OWU2Yzc2NjhhMzQ4NDA5OGZjMzU2Y2I4NjMxY2Y5MGRjYTY3NjdiYjqAAn1xAS4=\n','2012-04-23 23:09:08'),('74d44965bb085f6797b5b81b32c2bfce','Y2RjMmM0YzkyMmNmNjVjZTI4OGI3ZjU2MzM3YjFhOTI4M2RiYzUzNTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-04-22 19:48:08'),('1cf798f66bb925456018aa9b38ff01ef','OWU2Yzc2NjhhMzQ4NDA5OGZjMzU2Y2I4NjMxY2Y5MGRjYTY3NjdiYjqAAn1xAS4=\n','2012-04-23 15:01:38'),('1a35f7ec25246350fd743ee25dbb1505','Y2RjMmM0YzkyMmNmNjVjZTI4OGI3ZjU2MzM3YjFhOTI4M2RiYzUzNTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-04-23 19:35:55'),('1c5001eee25e65053a4961a3a2560492','OWZmZWY0OWRlN2I0YmYwNTg3ZjdlN2Q0NjljMDc4YmYwYmE5NmM3MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-04-24 17:26:33'),('97f7100585d8034eae7f6a5a42554349','OWZmZWY0OWRlN2I0YmYwNTg3ZjdlN2Q0NjljMDc4YmYwYmE5NmM3MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-04-23 22:52:53'),('b1c80b2fac57d281efab4c56eb8425a4','OWU2Yzc2NjhhMzQ4NDA5OGZjMzU2Y2I4NjMxY2Y5MGRjYTY3NjdiYjqAAn1xAS4=\n','2012-04-26 17:36:41'),('fddbf7cb4a77fbb494f66cb5235c6ad9','OWZmZWY0OWRlN2I0YmYwNTg3ZjdlN2Q0NjljMDc4YmYwYmE5NmM3MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-04-26 17:21:56'),('53b6c6841a7821d2cc7cac68f6c059c4','OWZmZWY0OWRlN2I0YmYwNTg3ZjdlN2Q0NjljMDc4YmYwYmE5NmM3MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-04-30 10:59:10'),('8f961b359cabd5c7780459a2d24f9b9f','Y2RjMmM0YzkyMmNmNjVjZTI4OGI3ZjU2MzM3YjFhOTI4M2RiYzUzNTqAAn1xAVUKdGVzdGNvb2tp\nZXECVQZ3b3JrZWRxA3Mu\n','2012-04-26 17:30:05'),('1989ea1d86cd8cc094c422ab7db38c67','OWU2Yzc2NjhhMzQ4NDA5OGZjMzU2Y2I4NjMxY2Y5MGRjYTY3NjdiYjqAAn1xAS4=\n','2012-04-29 04:47:04'),('ef0b8cd4d015972ea03ca70dd36fc63f','OWZmZWY0OWRlN2I0YmYwNTg3ZjdlN2Q0NjljMDc4YmYwYmE5NmM3MjqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-04-29 04:58:49');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-04-16 21:24:23
