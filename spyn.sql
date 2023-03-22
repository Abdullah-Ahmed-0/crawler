/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.24-MariaDB : Database - spyn
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`spyn` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `spyn`;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(200) DEFAULT NULL,
  `name_ar` varchar(200) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

/*Data for the table `categories` */

insert  into `categories`(`id`,`name_en`,`name_ar`,`url`) values 
(1,'Spinneys Products','منتجات سبينيس','https://spinneys-egypt.com/en/categories/spinneys-products'),
(2,'Bakery','المخبوزات','https://spinneys-egypt.com/en/categories/bakery'),
(3,'Fresh Food','الأطعمة الطازجة','https://spinneys-egypt.com/en/categories/fresh-food'),
(4,'Food Cupboard','الاطعمة الجافة و البقالة','https://spinneys-egypt.com/en/categories/food-cupboard'),
(5,'Cheese, Dairy &amp; Eggs','منتجات الألبان والزبدة والبيض','https://spinneys-egypt.com/en/categories/dairy-butter'),
(6,'Chilled &amp; Frozen ','منتجات مبردة و مجمدة','https://spinneys-egypt.com/en/categories/chilled-frozen'),
(7,'Beverage','المشروبات','https://spinneys-egypt.com/en/categories/beverage'),
(8,'Sweets &amp; Snacks',NULL,'https://spinneys-egypt.com/en/categories/sweets-snacks'),
(9,'Beauty &amp; Personal care',' الجمال والعناية الشخصية','https://spinneys-egypt.com/en/categories/beauty-personal-care1'),
(10,'Cleaning','المنظفات','https://spinneys-egypt.com/en/categories/cleaning'),
(11,'Baby','منتجات الأطفال','https://spinneys-egypt.com/en/categories/baby'),
(12,'Fashion &amp; Linen','الملابس والمفروشات','https://spinneys-egypt.com/en/categories/fashion-linen'),
(13,'Home &amp; Garden','المنزل والحديقة','https://spinneys-egypt.com/en/categories/home-garden'),
(14,'Electronics &amp; Appliances','أجهزة كهربائية و منزلية','https://spinneys-egypt.com/en/categories/electronics-appliances'),
(15,'Pets','منتجات الحيوانات الأليفة','https://spinneys-egypt.com/en/categories/pets'),
(16,'Diet','ريجيم','https://spinneys-egypt.com/en/categories/diet'),
(17,'Healthy Club','المنتجات الصحية','https://spinneys-egypt.com/en/categories/healthy-club'),
(18,'Ramadan Offers','عروض رمضان','https://spinneys-egypt.com/en/categories/hot-offers'),
(19,'Ramadan Essentials','منتجات رمضان','https://spinneys-egypt.com/en/categories/ramadan-essentials'),
(20,'Yameesh Ramadan','ياميش رمضان','https://spinneys-egypt.com/en/categories/yameesh-ramadan');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(200) DEFAULT NULL,
  `name_ar` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` double DEFAULT NULL,
  `dicounted_price` double DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `photos` longtext DEFAULT NULL,
  `category_name_en` text DEFAULT NULL,
  `category_name_ar` text DEFAULT NULL,
  `spyn_url` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `products` */

/*Table structure for table `sub_categories` */

DROP TABLE IF EXISTS `sub_categories`;

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name_en` varchar(200) DEFAULT NULL,
  `name_ar` varchar(200) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `num_of_products` int(11) DEFAULT NULL,
  `captured_products` int(11) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `sub_categories` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
