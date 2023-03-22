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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sub_categories` */

insert  into `sub_categories`(`id`,`name_en`,`name_ar`,`url`,`parent_id`,`num_of_products`,`captured_products`,`is_active`) values 
(1,' ALL ',NULL,'https://spinneys-egypt.com/en/categories/spinneys-products ',1,NULL,0,1),
(2,'Groceries',NULL,'https://spinneys-egypt.com/en/categories/groceries-spinneys',1,NULL,0,1),
(3,'Chilled &amp; Juices',NULL,'https://spinneys-egypt.com/en/categories/chilled-juices',1,NULL,0,1),
(4,'Canned &amp; Breakfast',NULL,'https://spinneys-egypt.com/en/categories/canned-breakfast',1,NULL,0,1),
(5,'Sauces &amp; Spices',NULL,'https://spinneys-egypt.com/en/categories/sauces-spices-spinneys',1,NULL,0,1),
(6,'Clean &amp; Bright',NULL,'https://spinneys-egypt.com/en/categories/clean-bright-spinneys',1,NULL,0,1),
(7,'Laundry Products',NULL,'https://spinneys-egypt.com/en/categories/laundry-products-spinneys',1,NULL,0,1),
(8,'Paper &amp; Plastic Products',NULL,'https://spinneys-egypt.com/en/categories/paper-plastic-products-spinneys',1,NULL,0,1),
(9,'Dishwashing',NULL,'https://spinneys-egypt.com/en/categories/dishwashing-spinneys',1,NULL,0,1),
(10,'Health &amp; Beauty',NULL,'https://spinneys-egypt.com/en/categories/health-beauty-spinneys',1,NULL,0,1),
(11,'Men',NULL,'https://spinneys-egypt.com/en/categories/men-spinneys',1,NULL,0,1),
(12,'Women',NULL,'https://spinneys-egypt.com/en/categories/women-spinneys',1,NULL,0,1),
(13,'Kids',NULL,'https://spinneys-egypt.com/en/categories/kids-spinneys',1,NULL,0,1),
(14,'Linen',NULL,'https://spinneys-egypt.com/en/categories/linen-spinneys',1,NULL,0,1),
(15,' ALL ',NULL,'https://spinneys-egypt.com/en/categories/fresh-food ',3,NULL,0,1),
(16,'Fruits',NULL,'https://spinneys-egypt.com/en/categories/fruits',3,NULL,0,1),
(17,'Vegetables',NULL,'https://spinneys-egypt.com/en/categories/vegetables',3,NULL,0,1),
(18,'Meat',NULL,'https://spinneys-egypt.com/en/categories/meat',3,NULL,0,1),
(19,'Poultry',NULL,'https://spinneys-egypt.com/en/categories/poultry',3,NULL,0,1),
(20,'Seafood',NULL,'https://spinneys-egypt.com/en/categories/seafood',3,NULL,0,1),
(21,' ALL ',NULL,'https://spinneys-egypt.com/en/categories/food-cupboard ',4,NULL,0,1),
(22,'Herbs &amp; Spices',NULL,'https://spinneys-egypt.com/en/categories/herbs-spices',4,NULL,0,1),
(23,'Sauces &amp; Dressings',NULL,'https://spinneys-egypt.com/en/categories/sauces-dressings',4,NULL,0,1),
(24,'Rice',NULL,'https://spinneys-egypt.com/en/categories/rice',4,NULL,0,1),
(25,'Pulses &amp; Grains',NULL,'https://spinneys-egypt.com/en/categories/pulses-grains',4,NULL,0,1),
(26,'Pasta',NULL,'https://spinneys-egypt.com/en/categories/pasta',4,NULL,0,1),
(27,'Sugar',NULL,'https://spinneys-egypt.com/en/categories/sugar',4,NULL,0,1),
(28,'Homebake &amp; Desserts',NULL,'https://spinneys-egypt.com/en/categories/homebake',4,NULL,0,1),
(29,'Jam &amp; Spreads',NULL,'https://spinneys-egypt.com/en/categories/jam',4,NULL,0,1),
(30,'Breakfast Cereal',NULL,'https://spinneys-egypt.com/en/categories/breakfast-cereal',4,NULL,0,1),
(31,' ALL ',NULL,'https://spinneys-egypt.com/en/categories/chilled-frozen ',6,NULL,0,1),
(32,'Fish',NULL,'https://spinneys-egypt.com/en/categories/fish',6,NULL,0,1),
(33,'Poultry',NULL,'https://spinneys-egypt.com/en/categories/poultry-frozen',6,NULL,0,1),
(34,' ALL ',NULL,'https://spinneys-egypt.com/en/categories/beverage ',7,NULL,0,1),
(35,'Tea',NULL,'https://spinneys-egypt.com/en/categories/tea',7,NULL,0,1),
(36,'Coffee and Creamer',NULL,'https://spinneys-egypt.com/en/categories/coffee',7,NULL,0,1),
(37,'Chocolate &amp; Cocoa',NULL,'https://spinneys-egypt.com/en/categories/chocolate-cocoa',7,NULL,0,1),
(38,'Herbal',NULL,'https://spinneys-egypt.com/en/categories/herbal',7,NULL,0,1),
(39,'Carbonated and Power Drinks',NULL,'https://spinneys-egypt.com/en/categories/carbonated-and-power-drinks',7,NULL,0,1),
(40,'Juices',NULL,'https://spinneys-egypt.com/en/categories/juices',7,NULL,0,1),
(41,' ALL ',NULL,'https://spinneys-egypt.com/en/categories/sweets-snacks ',8,NULL,0,1),
(42,'Chocolates',NULL,'https://spinneys-egypt.com/en/categories/biscuits',8,NULL,0,1),
(43,'Biscuits &amp; Cakes',NULL,'https://spinneys-egypt.com/en/categories/cakes',8,NULL,0,1),
(44,'Crisps &amp; Snacks',NULL,'https://spinneys-egypt.com/en/categories/chips-snacks-sub',8,NULL,0,1),
(45,'Nuts',NULL,'https://spinneys-egypt.com/en/categories/nuts',8,NULL,0,1),
(46,' ALL ',NULL,'https://spinneys-egypt.com/en/categories/beauty-personal-care1 ',9,NULL,0,1),
(47,'Body Wash',NULL,'https://spinneys-egypt.com/en/categories/body-wash',9,NULL,0,1),
(48,'Soap',NULL,'https://spinneys-egypt.com/en/categories/soap',9,NULL,0,1),
(49,'Feminine Care',NULL,'https://spinneys-egypt.com/en/categories/feminine-care',9,NULL,0,1),
(50,'Men Care',NULL,'https://spinneys-egypt.com/en/categories/men-care',9,NULL,0,1),
(51,' ALL ',NULL,'https://spinneys-egypt.com/en/categories/cleaning ',10,NULL,0,1),
(52,'Aluminum Foil &amp; Cling',NULL,'https://spinneys-egypt.com/en/categories/aluminum-foil-cling',10,NULL,0,1),
(53,'Trash Bags',NULL,'https://spinneys-egypt.com/en/categories/trash-bags',10,NULL,0,1),
(54,'Paper Goods',NULL,'https://spinneys-egypt.com/en/categories/paper-goods',10,NULL,0,1),
(55,'Fabric Care',NULL,'https://spinneys-egypt.com/en/categories/fabric-care',10,NULL,0,1),
(56,'Bleach',NULL,'https://spinneys-egypt.com/en/categories/bleach',10,NULL,0,1),
(57,'Detergents',NULL,'https://spinneys-egypt.com/en/categories/detergents',10,NULL,0,1),
(58,'All Purpose',NULL,'https://spinneys-egypt.com/en/categories/all-purpose',10,NULL,0,1),
(59,'Toilet',NULL,'https://spinneys-egypt.com/en/categories/toilet',10,NULL,0,1),
(60,'Cream Cleaner',NULL,'https://spinneys-egypt.com/en/categories/cream-cleaner',10,NULL,0,1),
(61,'Antiseptics',NULL,'https://spinneys-egypt.com/en/categories/antiseptics',10,NULL,0,1),
(62,'Insecticides',NULL,'https://spinneys-egypt.com/en/categories/insecticides',10,NULL,0,1),
(63,'Air Freshners',NULL,'https://spinneys-egypt.com/en/categories/air-freshners',10,NULL,0,1),
(64,'Polish',NULL,'https://spinneys-egypt.com/en/categories/polish',10,NULL,0,1),
(65,' ALL ',NULL,'https://spinneys-egypt.com/en/categories/baby ',11,NULL,0,1),
(66,'Feeding',NULL,'https://spinneys-egypt.com/en/categories/feeding',11,NULL,0,1),
(67,'Diapers &amp; Wipes',NULL,'https://spinneys-egypt.com/en/categories/diapers-wipes',11,NULL,0,1),
(68,'Baby Products',NULL,'https://spinneys-egypt.com/en/categories/baby-products',11,NULL,0,1),
(69,' ALL ',NULL,'https://spinneys-egypt.com/en/categories/home-garden ',13,NULL,0,1),
(70,'Cookware',NULL,'https://spinneys-egypt.com/en/categories/cookware',13,NULL,0,1),
(71,'Plastics &amp; Containers',NULL,'https://spinneys-egypt.com/en/categories/plastics-containers',13,NULL,0,1),
(72,'Dinnerware',NULL,'https://spinneys-egypt.com/en/categories/dinnerware',13,NULL,0,1),
(73,'Cutlery',NULL,'https://spinneys-egypt.com/en/categories/cutlery',13,NULL,0,1),
(74,'Glass &amp; Crystal',NULL,'https://spinneys-egypt.com/en/categories/glass-crystal',13,NULL,0,1),
(75,'Table Mat &amp; Trays',NULL,'https://spinneys-egypt.com/en/categories/table-mat-trays',13,NULL,0,1),
(76,'Other',NULL,'https://spinneys-egypt.com/en/categories/other',13,NULL,0,1),
(77,'Plants &amp; Flowers',NULL,'https://spinneys-egypt.com/en/categories/plants-flowers',13,NULL,0,1),
(78,'Garden Accessories',NULL,'https://spinneys-egypt.com/en/categories/garden-accessories',13,NULL,0,1),
(79,'BBQ Accessories',NULL,'https://spinneys-egypt.com/en/categories/bbq-accessories',13,NULL,0,1),
(80,'Garden Furniture',NULL,'https://spinneys-egypt.com/en/categories/garden-furniture',13,NULL,0,1),
(81,'Garden Tools',NULL,'https://spinneys-egypt.com/en/categories/garden-tools',13,NULL,0,1),
(82,' ALL ',NULL,'https://spinneys-egypt.com/en/categories/electronics-appliances ',14,NULL,0,1),
(83,'TVs',NULL,'https://spinneys-egypt.com/en/categories/tvs',14,NULL,0,1),
(84,'Receivers',NULL,'https://spinneys-egypt.com/en/categories/receivers',14,NULL,0,1),
(85,'Air Conditioners',NULL,'https://spinneys-egypt.com/en/categories/air-conditioners',14,NULL,0,1),
(86,'Fan',NULL,'https://spinneys-egypt.com/en/categories/fan',14,NULL,0,1),
(87,'Heater',NULL,'https://spinneys-egypt.com/en/categories/heater',14,NULL,0,1),
(88,'Air Purifier',NULL,'https://spinneys-egypt.com/en/categories/air-purifier',14,NULL,0,1),
(89,'Oil Radiator',NULL,'https://spinneys-egypt.com/en/categories/oil-radiator',14,NULL,0,1),
(90,'Cookers',NULL,'https://spinneys-egypt.com/en/categories/cookers',14,NULL,0,1),
(91,'Hoods',NULL,'https://spinneys-egypt.com/en/categories/hoods',14,NULL,0,1),
(92,'Fridge',NULL,'https://spinneys-egypt.com/en/categories/fridge',14,NULL,0,1),
(93,'Freezers',NULL,'https://spinneys-egypt.com/en/categories/freezers',14,NULL,0,1),
(94,'Water Despenser',NULL,'https://spinneys-egypt.com/en/categories/water-despenser',14,NULL,0,1),
(95,'Microwaves',NULL,'https://spinneys-egypt.com/en/categories/microwaves',14,NULL,0,1),
(96,'Toasters',NULL,'https://spinneys-egypt.com/en/categories/toasters',14,NULL,0,1),
(97,'Ovens',NULL,'https://spinneys-egypt.com/en/categories/ovens',14,NULL,0,1),
(98,'Coffee Makers',NULL,'https://spinneys-egypt.com/en/categories/coffee-makers',14,NULL,0,1),
(99,'Kettles',NULL,'https://spinneys-egypt.com/en/categories/kettles',14,NULL,0,1),
(100,'Food Proccessor &amp; Blenders',NULL,'https://spinneys-egypt.com/en/categories/food-proccessor-blenders',14,NULL,0,1),
(101,'Juicers',NULL,'https://spinneys-egypt.com/en/categories/juicers',14,NULL,0,1),
(102,'Fryers',NULL,'https://spinneys-egypt.com/en/categories/fryers',14,NULL,0,1),
(103,'Rice Cooker',NULL,'https://spinneys-egypt.com/en/categories/rice-cooker',14,NULL,0,1),
(104,'Grills',NULL,'https://spinneys-egypt.com/en/categories/grills',14,NULL,0,1),
(105,'Kitchen Scales',NULL,'https://spinneys-egypt.com/en/categories/kitchen-scales',14,NULL,0,1),
(106,'Can Opener',NULL,'https://spinneys-egypt.com/en/categories/can-opener',14,NULL,0,1),
(107,'Yoghurt, Ice-Cream, Popcorn &amp; Waffle',NULL,'https://spinneys-egypt.com/en/categories/yoghurt-maker',14,NULL,0,1),
(108,'Hair Care',NULL,'https://spinneys-egypt.com/en/categories/hair-care',14,NULL,0,1),
(109,'Shaver',NULL,'https://spinneys-egypt.com/en/categories/shaver',14,NULL,0,1),
(110,'Epilator',NULL,'https://spinneys-egypt.com/en/categories/epilator',14,NULL,0,1),
(111,'Electric Tooth Brush',NULL,'https://spinneys-egypt.com/en/categories/electric-tooth-brush',14,NULL,0,1),
(112,'Personal Scales',NULL,'https://spinneys-egypt.com/en/categories/personal-scales',14,NULL,0,1),
(113,'Blood Pressure Monitor',NULL,'https://spinneys-egypt.com/en/categories/blood-pressure-monitor',14,NULL,0,1),
(114,'Foot Spa',NULL,'https://spinneys-egypt.com/en/categories/foot-spa',14,NULL,0,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
