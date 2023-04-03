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
  `price` double DEFAULT NULL,
  `description` text DEFAULT NULL,
  `description_ar` text DEFAULT NULL,
  `dicounted_price` double DEFAULT NULL,
  `unit` varchar(30) DEFAULT NULL,
  `image_url` text DEFAULT NULL,
  `photos` longtext DEFAULT NULL,
  `category_name_en` text DEFAULT NULL,
  `category_name_ar` text DEFAULT NULL,
  `spyn_url` text DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=654 DEFAULT CHARSET=utf8mb4;

/*Data for the table `products` */

insert  into `products`(`id`,`name_en`,`name_ar`,`price`,`description`,`description_ar`,`dicounted_price`,`unit`,`image_url`,`photos`,`category_name_en`,`category_name_ar`,`spyn_url`,`product_id`) values 
(459,'Spinneys Vermicelli, 350 Gm','سبينيس شعرية، 350 جرام',8.25,'SPINNEYS V/PASTA VRMCELLI',NULL,NULL,'1 L','https://images.spinneys.net/product/6963/q2qEt22P6SikuqYxAt1vJ52vUVDQH0XtrNCqr7NS.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/345509',6963),
(460,'Spinneys Big Rings Pasta, 350 Gm','سبينيس مكرونة خواتم، 350 جرام',8.25,'SPINNEYS V/PASTA BIGRINGS',NULL,NULL,'1 L','https://images.spinneys.net/product/6965/EPUM2FOHSqb0GmUgrlOryoRphh2HiPJOuo7PLoYP.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/345507',6965),
(461,'Spinneys Extra Virgin Olive Oil, 500 Ml And 250 Ml','سبينيس زيت زيتون اكسترا، 500 مللى و 250 مللى',244.25,'SPINNEYS EX.VRGN OIL+250M',NULL,NULL,'500 ML','https://images.spinneys.net/product/34372/EAlc2qPpely640j6MUzcRXIAhffX55DAAWegqYb9.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/381468',34372),
(462,'Spinneys Virgin Olive Oil, 500 Ml And 250 Ml','سبينيس زيت زيتون بكر، 500 مللى و 250 مللى',168.5,'SPINNEYS V/OLIVE OIL+250M',NULL,NULL,'500 ML','https://images.spinneys.net/product/34373/KPbWrzCxXn5QVAGKV6zV4CqhOCCfgbJYQSUtFC3U.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/381465',34373),
(463,'Spinneys Corn Oil, 2.5 L.','سبينيس زيت ذرة، 2.5 لتر',184.95,'Spinneys Corn Oil is widely used in cooking and especially deep frying, It contains a fair amount of vitamin E which acts as an anti-inflammatory antioxidant in your body, order now... it\'s one click away.&nbsp;&nbsp;',NULL,NULL,'2.5 L','https://images.spinneys.net/product/4764/1llJgdamyH5O3uJB4KlAYG706M0GhxZkCT2EWi1r.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/346361',4764),
(464,'Spinneys Risoni Pasta, 350 Gm','سبينيس مكرونة لسان عصفور، 350 جرام',8.25,'SPINNEYS V/PASTA RISONI',NULL,NULL,'1 L','https://images.spinneys.net/product/6962/WuFDKiSSgIyqssd6lEqaYeixzBVzg6XyZNFIYnUZ.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/345510',6962),
(465,'Spinneys Small Rings Pasta, 350 Gm','سبينيس مكرونة مرمريه، 350 جرام',8.25,'Spinneys Small Rings Pasta',NULL,NULL,'1 L','https://images.spinneys.net/product/6964/YAaedKMl7oHOXPrLQUO4sXYlFa2BZHvolEz060pG.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/345508',6964),
(466,'Spinneys Yellow Lentils, 500 Gm','سبينيس عدس اصفر، 500 جرام ',32.45,'Spinneys Value Split Yellow Lentils Pulses',NULL,NULL,'500 G','https://images.spinneys.net/product/7489/YNHZRpz1bKezSWChCZfaAzRK7bjcmoY5WYdg68mz.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/356387',7489),
(467,'Spinneys Chickpeas, 500 gm','سبينيس حمص الشام، 500 جرام ',31.25,'Spinneys Chickpeas, 500 gm.',NULL,NULL,'500 G','https://images.spinneys.net/product/7490/ThTcY6h9PYhlr74MQqKNhnWWET471cpD4C7F9mhL.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/356386',7490),
(468,'Spinneys Black Eyed Peas, 500 gm.','سبينيس لوبيا، 500 جرام ',28.95,'Spinneys Black Eyed Peas, 500 gm.',NULL,NULL,'500 G','https://images.spinneys.net/product/7491/qzo9LUr9feVmzmtLgxL5V4KS6Fk1KUQQ91xHoXJk.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/356385',7491),
(469,'Spinneys Olive Oil Virgin, 1 L','سبينيس زيت زيتون بكر، 1 لتر',218.5,'Spinneys Value Virgin Olives Oil',NULL,NULL,'1 L','https://images.spinneys.net/product/27988/8q37QCGc3Ck8gc30mBDCfL6Hj6J3llfMuXCwmgmf.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/362590',27988),
(470,'Spinneys Extra Virgin Olive Oil, 1 L','سبينيس زيت زيتون بكر ممتاز، 1 لتر،',243.25,'Spinneys Value Olives Oil',NULL,NULL,'1 L','https://images.spinneys.net/product/29877/rYmEEJOpWrxRljGWRK13Qp1Mzfe1eoi1VgB4MpqS.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/362587',29877),
(471,'Spinneys Extra Virgin Olive Oil, 500 Ml','سبينيس زيت زيتون بكر ممتاز، 500 مللى،',161.25,'SPINNEYS OLIVE OIL X/VRGN',NULL,NULL,'500 ML','https://images.spinneys.net/product/29878/yPUE7rM9ytCk2GmwHBj1a9SDMd38et6L0XAVtgnL.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/362586',29878),
(472,'Abu Auf Alkafela Kamar Aldin, 400G','ابو عوف قمر الدين القافله، 400 جرام',64.95,'Abu Auf Alkafela Kamar Aldin',NULL,NULL,'350','https://images.spinneys.net/product/34297/2eLq2pjwNindaMrsz99ncDzewbf1xSm73XAw3ubt.jpeg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/381282',34297),
(473,'Spinneys Olive Oil Extra Virgin &amp; Olive Oil Virgin, 2 × 250 Ml','سبينيس زيت زيتون اكسترا و زيت زيتون بكر، 2 × 250 مللى',123.25,'SPINNEYS OLIVE OIL XTRA V',NULL,NULL,'2*250 G','https://images.spinneys.net/product/44722/OWJ5kSEMKmhhXNekvt2WDj5iPdHHLHGNwH7nxBLZ.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/396857',44722),
(474,'Shaykhon Red Pepper Jalapeno Slice, 1 Kg','شيخون فلفل هالبينو احمر شرائح، بالوزن،',14.99,' ',NULL,NULL,'500 ML','https://images.spinneys.net/product/44846/dTcIqkki8bAKlX5f8k1sE8xnQDA5T8C2i5Cg9hAW.jpeg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/333733',44846),
(475,'Emco Fruit Pieces Crunchy Musli - 375 gm','مقرمشات موسلي كرانشي بقطع الفاكهة من ايمكو - 375 جم',66.25,'EMCO CRUNCHY MUESLI FRUIT',NULL,NULL,'375 G','https://images.spinneys.net/product/60070/bytxTD3dASqlyF9G6WmHXN7ot3GzZnw00k9Ltlba.jpg',NULL,'Groceries','البقالة','https://spinneys-egypt.com/en/products/157968',60070),
(476,'Spinneys Pommes Frites, 2 Kg','سبينيس بطاطس بوم فريت، 2 كيلو',51.95,'The finest types of potatoes provided by Spinneys in its Bomm Frites package. A rich taste, which is indispensable in your kitchen to ensure provision of the worlds favorite snack tlo all the family and add joy to its times to make the most delicious recipes.',NULL,NULL,'2 KG','https://images.spinneys.net/product/5183/gfoYeV8AJ0FAkwKEiR45SroRDbidWWtzsQ4yYl4L.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/328436',5183),
(477,'Spinneys Mango Juice, 1 L.','سبينيس عصير مانجو، 1 لتر',48.5,'Delicious, rich taste of fresh mango in Spinneys mango juice. Pure, natural juice in a 1-liter bottle to cheer family times. A healthy lifestyle with juice made from the finest fruits. Available in the supermarket in an easy-to-open box.',NULL,NULL,'1 L','https://images.spinneys.net/product/5999/mIrEqUq7Py4SrlGiLDPgzJVNy12kyOldJdj7h0zA.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/233233',5999),
(478,'Spinneys Fresh Red Eggs, packet of 30 pieces','سبينيس بيض أحمر طازج، عبوه من 30 قطعة',117.5,'The finest types of red eggs from Spinneys. Get a high nutritional value from the best poultry farms that send the red eggs directly to the supermarkets. No limits for the recipes that you could make with red eggs from Spinneys. A package of 30 eggs to meet the family dietery needs.',NULL,NULL,'30 PC','https://images.spinneys.net/product/6112/mj9D8eXWVic0mh2zFVaPaxDLybXrE4H4PmOBBiPc.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189973',6112),
(479,'Spinneys White Eggs, Pack of 30 eggs','سبينيس بيض ابيض , عبوة 30 بيضة',108.5,'The finest types of red eggs from Spinneys. Get a high nutritional value from the best poultry farms that send the red eggs directly to the supermarkets. No limits for the recipes that you could make with red eggs from Spinneys. A package of 30 eggs to meet the family dietery needs.',NULL,NULL,'30 PC','https://images.spinneys.net/product/6113/hiu8z6HimZwKqBcKM06RpQqvXEdhFWCV7o59dQoi.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189972',6113),
(480,'Spinneys Orange Juice, 1 L','سبينيس عصير برتقال، 1 لتر',47.95,'Spinneys Orange juice is considered an excellent source of vitamin C, potassium, and folic acid.Drink it cold on a hot day, with friends and family, with Breakfast and Dinner, for kids and adults.&nbsp;',NULL,NULL,'1 L','https://images.spinneys.net/product/6114/Y5MGmaVw8x1IoGMDtdPb0LHJtpHdmktacBckasF4.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189964',6114),
(481,' Spinneys Tamarind Juice 1 L.',' سبينيس عصير تمر هندى 1 لتر',23.95,'Delicious, rich taste of fresh Tamarind in Spinneys juice. Pure, natural juice in a 1-liter bottle to cheer family times. Available in the supermarket in an easy-to-open box. ',NULL,NULL,'2 KG','https://images.spinneys.net/product/7087/SfMOYZWJwkUyAgBpBgXLGa736MAtogO8PwIgKqUF.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189969',7087),
(482,'Spinneys Karob Juice 1 L.','سبينيس عصير خروب 1 لتر',23.95,'Delicious, rich taste of fresh Karob in Spinneys juice. Pure, natural juice in a 1-liter bottle to cheer family times. A healthy lifestyle with juice made from the finest fruits. Available in the supermarket in an easy-to-open box. ',NULL,NULL,'2 KG','https://images.spinneys.net/product/7088/Il2RXKNEBaoMyalmb5gfH4tUCCfs6CYYl8R7fugd.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189967',7088),
(483,'Spinneys Filo Box, 300 Gm','سبينيس جلاش، 300 جرام',10.5,'Spinneys offers carefully selected products from the finest ingredients such as Spinneys Filo Box, 300g, it is a luxurious Filo of high-quality flour. Save your time and effort in preparing delicious and distinctive dishes. Add it to your cart at Spinneys Supermarket. ',NULL,NULL,'300 G','https://images.spinneys.net/product/7668/UEIJFkono7a5uTg7Um7Msng2ekUq6aTeLqns4E8n.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/346364',7668),
(484,'Spinneys Local Eggs, Packet of 6 pieces','سبينيس بيض بلدى , عبوة من 6 قطع',34.45,'Spinneys Local eggs packet of 6 eggs. Cook healthy breakfasts for your family with Spinneys high-quality red eggs. Eggs are rich sources of selenium, vitamin D, B6, B12 and minerals such as zinc, iron, copper and an excellent source of choline. Don\'t forget it on your breakfast menu.',NULL,NULL,'6 PC','https://images.spinneys.net/product/7799/SPJNUMODwMges0JNjvmmfO2yvzk9PLiwKeRTxqlM.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/248683',7799),
(485,'Spinneys Guava Juice, 1 L.','سبينيس عصير جوافة، 1 لتر',36.25,'Delicious, rich taste of fresh Guava in Spinneys juice. Pure, natural juice in a 1-liter bottle to cheer family times. A healthy lifestyle with juice made from the finest fruits. Available in the supermarket in an easy-to-open box.',NULL,NULL,'1 L','https://images.spinneys.net/product/7840/ruvqAlRnwBWCwZZ9MJfUUj9XcXxDN75cVPb5MDVT.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189965',7840),
(486,'Spinneys Pommes Frites, 2 Kg','سبينيس بطاطس بوم فريت، 2 كيلو',51.95,'The finest types of potatoes provided by Spinneys in its Bomm Frites package. A rich taste, which is indispensable in your kitchen to ensure provision of the worlds favorite snack tlo all the family and add joy to its times to make the most delicious recipes.',NULL,NULL,'2 KG','https://images.spinneys.net/product/5183/gfoYeV8AJ0FAkwKEiR45SroRDbidWWtzsQ4yYl4L.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/328436',5183),
(487,'Spinneys Mango Juice, 1 L.','سبينيس عصير مانجو، 1 لتر',48.5,'Delicious, rich taste of fresh mango in Spinneys mango juice. Pure, natural juice in a 1-liter bottle to cheer family times. A healthy lifestyle with juice made from the finest fruits. Available in the supermarket in an easy-to-open box.',NULL,NULL,'1 L','https://images.spinneys.net/product/5999/mIrEqUq7Py4SrlGiLDPgzJVNy12kyOldJdj7h0zA.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/233233',5999),
(488,'Spinneys Fresh Red Eggs, packet of 30 pieces','سبينيس بيض أحمر طازج، عبوه من 30 قطعة',117.5,'The finest types of red eggs from Spinneys. Get a high nutritional value from the best poultry farms that send the red eggs directly to the supermarkets. No limits for the recipes that you could make with red eggs from Spinneys. A package of 30 eggs to meet the family dietery needs.',NULL,NULL,'30 PC','https://images.spinneys.net/product/6112/mj9D8eXWVic0mh2zFVaPaxDLybXrE4H4PmOBBiPc.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189973',6112),
(489,'Spinneys White Eggs, Pack of 30 eggs','سبينيس بيض ابيض , عبوة 30 بيضة',108.5,'The finest types of red eggs from Spinneys. Get a high nutritional value from the best poultry farms that send the red eggs directly to the supermarkets. No limits for the recipes that you could make with red eggs from Spinneys. A package of 30 eggs to meet the family dietery needs.',NULL,NULL,'30 PC','https://images.spinneys.net/product/6113/hiu8z6HimZwKqBcKM06RpQqvXEdhFWCV7o59dQoi.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189972',6113),
(490,'Spinneys Orange Juice, 1 L','سبينيس عصير برتقال، 1 لتر',47.95,'Spinneys Orange juice is considered an excellent source of vitamin C, potassium, and folic acid.Drink it cold on a hot day, with friends and family, with Breakfast and Dinner, for kids and adults.&nbsp;',NULL,NULL,'1 L','https://images.spinneys.net/product/6114/Y5MGmaVw8x1IoGMDtdPb0LHJtpHdmktacBckasF4.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189964',6114),
(491,' Spinneys Tamarind Juice 1 L.',' سبينيس عصير تمر هندى 1 لتر',23.95,'Delicious, rich taste of fresh Tamarind in Spinneys juice. Pure, natural juice in a 1-liter bottle to cheer family times. Available in the supermarket in an easy-to-open box. ',NULL,NULL,'2 KG','https://images.spinneys.net/product/7087/SfMOYZWJwkUyAgBpBgXLGa736MAtogO8PwIgKqUF.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189969',7087),
(492,'Spinneys Karob Juice 1 L.','سبينيس عصير خروب 1 لتر',23.95,'Delicious, rich taste of fresh Karob in Spinneys juice. Pure, natural juice in a 1-liter bottle to cheer family times. A healthy lifestyle with juice made from the finest fruits. Available in the supermarket in an easy-to-open box. ',NULL,NULL,'2 KG','https://images.spinneys.net/product/7088/Il2RXKNEBaoMyalmb5gfH4tUCCfs6CYYl8R7fugd.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189967',7088),
(493,'Spinneys Filo Box, 300 Gm','سبينيس جلاش، 300 جرام',10.5,'Spinneys offers carefully selected products from the finest ingredients such as Spinneys Filo Box, 300g, it is a luxurious Filo of high-quality flour. Save your time and effort in preparing delicious and distinctive dishes. Add it to your cart at Spinneys Supermarket. ',NULL,NULL,'300 G','https://images.spinneys.net/product/7668/UEIJFkono7a5uTg7Um7Msng2ekUq6aTeLqns4E8n.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/346364',7668),
(494,'Spinneys Local Eggs, Packet of 6 pieces','سبينيس بيض بلدى , عبوة من 6 قطع',34.45,'Spinneys Local eggs packet of 6 eggs. Cook healthy breakfasts for your family with Spinneys high-quality red eggs. Eggs are rich sources of selenium, vitamin D, B6, B12 and minerals such as zinc, iron, copper and an excellent source of choline. Don\'t forget it on your breakfast menu.',NULL,NULL,'6 PC','https://images.spinneys.net/product/7799/SPJNUMODwMges0JNjvmmfO2yvzk9PLiwKeRTxqlM.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/248683',7799),
(495,'Spinneys Guava Juice, 1 L.','سبينيس عصير جوافة، 1 لتر',36.25,'Delicious, rich taste of fresh Guava in Spinneys juice. Pure, natural juice in a 1-liter bottle to cheer family times. A healthy lifestyle with juice made from the finest fruits. Available in the supermarket in an easy-to-open box.',NULL,NULL,'1 L','https://images.spinneys.net/product/7840/ruvqAlRnwBWCwZZ9MJfUUj9XcXxDN75cVPb5MDVT.jpg',NULL,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/products/189965',7840),
(496,'Spinneys Kalamata Olives, 600 Gm','سبينيس زيتون كالاماتا، 600 جرام',51.75,'Spinneys Value Kalamata Olives',NULL,NULL,'600 G','https://images.spinneys.net/product/7484/TPMYGedpWRI6dbkhseuq0sj7kh82AKCWzXWeEIxY.jpg',NULL,'Canned &amp; Breakfast','المعلبات ومنتجات الفطار','https://spinneys-egypt.com/en/products/356491',7484),
(497,'Spinneys Mix Pickled, 600 Gm','سبينيس مخلل مشكل، 600 جرام',20.95,'Spinneys Mix Pickled, 600 gm.',NULL,NULL,'600 G','https://images.spinneys.net/product/7485/ltBsKhcGDIcwFdtySBYYYNjo0sCWqCJgMUjhMXhz.jpg',NULL,'Canned &amp; Breakfast','المعلبات ومنتجات الفطار','https://spinneys-egypt.com/en/products/356488',7485),
(498,'Spinneys Value Milk Powder, 300 Gm','سبينيس فاليو لبن بودره كيس، 300 جرام،',71.95,'Rich, flavorful taste of milk from Spinneys Value Milk Powder. A 300g package to meet the family\'s daily needs. A high-quality milk powder that contains the nutrients required to promote the health of all family members. Indispensable in the shopping cart for use in various purposes such as making various recipes.',NULL,NULL,'300 G','https://images.spinneys.net/product/5185/uzTkr8EULIUudwhZTWxWQWyiq1idea9KyIMwpqmw.jpg',NULL,'Canned &amp; Breakfast','المعلبات ومنتجات الفطار','https://spinneys-egypt.com/en/products/328422',5185),
(499,'Spinneys Black Spanish Olives, 600 Gm','سبينيس زيتون أسود أسباني، 600 جرام',52.5,'Spinneys Black Olives, 600 gm.',NULL,NULL,'600 G','https://images.spinneys.net/product/7479/RCSSsoDBtFM2hEnyJ28p9hAsHSgGEfGtYbbUYrfn.jpg',NULL,'Canned &amp; Breakfast','المعلبات ومنتجات الفطار','https://spinneys-egypt.com/en/products/359037',7479),
(500,'Spinneys Cocoa Rice, 250 Gm','سبينيس كوكو ريس، 250 جرام',36.5,'SPINNEYS COCOA RICE ',NULL,NULL,'250 G','https://images.spinneys.net/product/34414/ICa9JpTmWVeetZl83ZiDm2Rwj8Qgx9XxX71kMZi5.jpg',NULL,'Canned &amp; Breakfast','المعلبات ومنتجات الفطار','https://spinneys-egypt.com/en/products/377179',34414),
(501,'Spinneys Cocoa Drops, 250 Gm','سبينيس كوكو دروبز، 250 جرام',36.5,'SPINNEYS COCOA DROPS',NULL,NULL,'250 G','https://images.spinneys.net/product/34415/9df6knefmMnneuoQLWdB6k1rF3rN7ok3vawkJe5O.jpeg',NULL,'Canned &amp; Breakfast','المعلبات ومنتجات الفطار','https://spinneys-egypt.com/en/products/377178',34415),
(502,'Spinneys Corn Flakes, 500 Gm','سبينيس كورن فليكس، 500 جرام',46.95,'SPINNEYS CORN FLAKES',NULL,NULL,'500 G','https://images.spinneys.net/product/36275/VaJRVrL3Z9B9kuJualPgYIixULAq5ijAc6LtJlSe.jpeg',NULL,'Canned &amp; Breakfast','المعلبات ومنتجات الفطار','https://spinneys-egypt.com/en/products/388481',36275),
(503,'Spinneys Vinegar, 1L',NULL,12.75,'Spinneys vinegar provides high quality for home use. The finest kinds of vinegar that are indispensable in your home. Add it to your shopping cart and promote family health when preparing your delicious recipes or other usages.',NULL,NULL,'1 L','https://images.spinneys.net/product/6422/BmZbCZiaDz253d709mHtBcvtXTTifERBid6eCzAb.jpeg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/106338',6422),
(504,'Spinneys Chocolate Squeeze, 220 Ml',NULL,53.5,'SPINNEYS CHOCLATE SQUEEZ',NULL,NULL,'220 ML','https://images.spinneys.net/product/31735/atjSEqxiXXsafmJld20quXiIBeSizYJndfgBnnMl.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/373978',31735),
(505,'Spinneys Chocolate Spread, 350 Gm',NULL,69.95,'SPINNEYS CHOCOLATE SPREAD',NULL,NULL,'350 G','https://images.spinneys.net/product/32012/kXhY9BLc8ZMql7WeODpVaTw1yFwHGHY72dtFeIcK.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/373979',32012),
(506,'Spinneys Lupine',NULL,23.5,'SPINNEYS LUPINE',NULL,NULL,'500 G','https://images.spinneys.net/product/37753/cjSmrEg2vG6nk2lLH4fyaoElY8fbpPxhRiDLsmuS.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/356405',37753),
(507,'Spinneys Freek',NULL,28.95,'SPINNEYS FREEK',NULL,NULL,'500 G','https://images.spinneys.net/product/37754/qIPaK2LP8dTtBXoJACr8dA99gGYHefhrb9fbCibU.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/356393',37754),
(508,'Spinneys Crushed Wheat',NULL,16.95,'SPINNEYS CRUSHED WHEAT',NULL,NULL,'500 G','https://images.spinneys.net/product/37755/Nit2OVJejahTka1zCK1IMUImU3CbRBXjd1KjRUpp.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/356384',37755),
(509,'Spinneys Salt, 500 Gm',NULL,2,'Spinneys Salt',NULL,NULL,'500 G','https://images.spinneys.net/product/38307/p0UM6yoVoqGDtpvF3cR2OLQUx5DmKRIdJEOCT92j.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/367463',38307),
(510,'Spinneys Tahina, 500 Gm',NULL,54.5,'SPINNEYS TAHINA',NULL,NULL,'500 G','https://images.spinneys.net/product/38774/nmQdskXafn1Jb9OvdO7bb4luPc6iOdb7Fn8GyYJg.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/391908',38774),
(511,'Spinneys Garlic Powder , 65 Gm',NULL,6.75,'SPINNEYS GARLIC POWDER',NULL,NULL,'65 G','https://images.spinneys.net/product/44711/tIoE3gImQewlit7g0ik7r86dN4zemCdoa1hnIqxc.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/396948',44711),
(512,'Spinneys Curry , 50 Gm',NULL,8.25,'SPINNEYS CURRY',NULL,NULL,'50 G','https://images.spinneys.net/product/44713/97IiCv3znRGYhx7t63SmxmWTUPB9gmTMpYbDy4OE.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/396945',44713),
(513,'Spinneys Chilli Powder, 90 Gm',NULL,7.5,'SPINNEYS CHILLI POWDER',NULL,NULL,'90 G','https://images.spinneys.net/product/44716/iyrwZBqmucpBKBCNVkZIVU9pb9rATOfBWFJvCdd4.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/396942',44716),
(514,'Spinneys Spices Mix , 70 Gm',NULL,11.25,'SPINNEYS SPICES MIX',NULL,NULL,'70 G','https://images.spinneys.net/product/44717/44U1Z9f3D8vDg0iBR6YB8XnJfJ6Ba5UeRc7x7RXV.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/396941',44717),
(515,'Spinneys Black Peper Powder , 40 Gm',NULL,12.25,'SPINNEYS BLACK PEPER POWD',NULL,NULL,'40 G','https://images.spinneys.net/product/44719/KLCRliWdr9xg0jUHSa2K6V3G9MVeX0UOTb8gmFZs.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/396939',44719),
(516,'Spinneys Sweet Chili',NULL,22.95,'SPINNEYS SWEET SHLLY PT',NULL,NULL,'320 جرام','https://images.spinneys.net/product/45322/SmIFm9TsRIvwgj9PivN1NyvQKkAobfmfTaaNKu6X.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/375979',45322),
(517,'Spinneys Bulgur',NULL,16.95,'SPINNEYS BOURGHOL',NULL,NULL,'500 جرام','https://images.spinneys.net/product/45367/41EbQJU9ismsL9M5RZ3FlTekmW3gMptnjaqDf4Jj.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/356395',45367),
(518,'Spinneys Foul Medames, 400G',NULL,8.95,'SPINNEYS FOUL MEDAMES',NULL,NULL,'400 G','https://images.spinneys.net/product/56254/yNNmM2mkC8UrnffIGxrn4PNxJ3YaM4fIOqI8erte.jpeg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/400475',56254),
(519,'Camill Light Soya Sauce - 500ml',NULL,79.95,'CAMILL LIGHT SOY SAUCE',NULL,NULL,'500 ML','https://images.spinneys.net/product/58140/Fd3tjKwJTo37Fn1XwNKEyQTjR3FAs5FEHAS7Nh90.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/357375',58140),
(520,'Spinneys Mild Tomato Ketchup, 340 Gm',NULL,19.5,'The finest types of tomatoes in Spinneys ketchup. An easy-to-open packaging. Fresh tomatoes to make the various foods delicious and indispensable. Add it to your shopping cart to turn your food into joy.',NULL,NULL,'340 G','https://images.spinneys.net/product/4666/RzNWK9vqZLC7YUmc35ujPFQL1geNHSlUoY85MNBh.jpeg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/349251',4666),
(521,'Spinneys Spicy Fresh Tomato Ketchup, 340 Gm',NULL,19.5,'The finest types of tomatoes in Spinneys Spicy ketchup. An easy-to-open packaging. Fresh tomatoes to make the various foods delicious and indispensable. Add it to your shopping cart to turn your food into joy. Fresh tomatoes Easy-to-open packaging Store in a cool place',NULL,NULL,'340 G','https://images.spinneys.net/product/7655/OOQcJOXkv1YAtnvUlyGfOQKE6a5Eh2wXIewOLtG6.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/349252',7655),
(522,' Spinneys Supreme Salt, 700g',NULL,6.5,'Spinneys always provides the best products in the field of foodstuff like Spinneys Supreme Salt,700g. A kitchen essential as it is suitable for different applications and use and makes every bite of your food delicious. Don\'t forget to add to your cart in Spinneys. ',NULL,NULL,'700 G','https://images.spinneys.net/product/7689/qEJzbCuU1qcqXqPe0qwzCryZaFBKaMxZHSKbWNIg.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/328420',7689),
(523,'Spinneys Green Olives Slices, 600 Gm',NULL,45.75,'SPINNEYS GREEN OLVS SLCS',NULL,NULL,'600 G','https://images.spinneys.net/product/32291/plujteZAqai7EPPS0J0ilcTbmySoUqhzNqZZYT2G.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/356501',32291),
(524,'Spinneys Honey Flower Nectar, 400 Gm',NULL,35.95,'SPINNEYS HNY FLWR NCTR',NULL,NULL,'400 G','https://images.spinneys.net/product/37028/XeC14bFzOGSqBveIeOYT03yYHlAx0mYfdc9n46hJ.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/382011',37028),
(525,'Spinneys Honey With Clover, 400 Gm',NULL,39.95,'SPINNEYS HONEY W/CLOVER',NULL,NULL,'400 G','https://images.spinneys.net/product/37029/Mw4nte3wuBxg2iYavv5nfJwUzZL4W9TAsXWEHG6l.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/382000',37029),
(526,'Spinneys Cardamom Wholes, 40 Gm',NULL,43.5,'SPINNEYS CARDAMOM WHOLES',NULL,NULL,'40 G','https://images.spinneys.net/product/44715/nixzNlsInem3HjL0HP4D6H46iG3zKOhC0Mg1s6h4.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/396943',44715),
(527,'SPINNEYS ONION POWDER ',NULL,7.25,'SPINNEYS ONION POWDER ',NULL,NULL,'75 G','https://images.spinneys.net/product/46440/zc4r5GfJnFceHnXrM6M0nLXRJbCRq5u3xoxAGPjW.jpg',NULL,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/products/396947',46440);

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
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sub_categories` */

insert  into `sub_categories`(`id`,`name_en`,`name_ar`,`url`,`parent_id`,`num_of_products`,`captured_products`,`is_active`) values 
(116,'Groceries','البقالة','https://spinneys-egypt.com/en/categories/groceries-spinneys',1,17,17,0),
(117,'Chilled &amp; Juices','مبردات و عصائر','https://spinneys-egypt.com/en/categories/chilled-juices',1,10,21,0),
(118,'Canned &amp; Breakfast','المعلبات ومنتجات الفطار','https://spinneys-egypt.com/en/categories/canned-breakfast',1,7,7,0),
(119,'Sauces &amp; Spices','التوابل والصوصات','https://spinneys-egypt.com/en/categories/sauces-spices-spinneys',1,25,25,0),
(120,'Clean &amp; Bright','منتجات التنظيف و التلميع','https://spinneys-egypt.com/en/categories/clean-bright-spinneys',1,0,0,0),
(121,'Laundry Products','منتجات غسيل الملابس','https://spinneys-egypt.com/en/categories/laundry-products-spinneys',1,0,0,0),
(122,'Paper &amp; Plastic Products','منتجات ورقية وبلاستيكية','https://spinneys-egypt.com/en/categories/paper-plastic-products-spinneys',1,0,0,0),
(123,'Dishwashing','منتجات غسيل الأطباق','https://spinneys-egypt.com/en/categories/dishwashing-spinneys',1,0,0,0),
(124,'Health &amp; Beauty','التجميل والعناية بالصحة','https://spinneys-egypt.com/en/categories/health-beauty-spinneys',1,6,6,1),
(125,'Men','رجالي','https://spinneys-egypt.com/en/categories/men-spinneys',1,0,0,0),
(126,'Women','حريمي','https://spinneys-egypt.com/en/categories/women-spinneys',1,0,0,0),
(127,'Kids','اطفال','https://spinneys-egypt.com/en/categories/kids-spinneys',1,0,0,0),
(128,'Linen','مفروشات','https://spinneys-egypt.com/en/categories/linen-spinneys',1,0,0,0),
(130,'Fruits','فاكهة','https://spinneys-egypt.com/en/categories/fruits',3,0,0,0),
(131,'Vegetables','خضروات','https://spinneys-egypt.com/en/categories/vegetables',3,0,0,0),
(132,'Meat','اللحوم','https://spinneys-egypt.com/en/categories/meat',3,0,0,0),
(133,'Poultry','الدواجن','https://spinneys-egypt.com/en/categories/poultry',3,0,0,0),
(134,'Seafood','الأسماك','https://spinneys-egypt.com/en/categories/seafood',3,0,0,0),
(136,'Herbs &amp; Spices','الأعشاب و التوابل','https://spinneys-egypt.com/en/categories/herbs-spices',4,0,0,0),
(137,'Sauces &amp; Dressings','الصوصات','https://spinneys-egypt.com/en/categories/sauces-dressings',4,0,0,0),
(138,'Rice','الأرز','https://spinneys-egypt.com/en/categories/rice',4,0,0,0),
(139,'Pulses &amp; Grains','البقوليات و الحبوب','https://spinneys-egypt.com/en/categories/pulses-grains',4,0,0,0),
(140,'Pasta','المكرونة','https://spinneys-egypt.com/en/categories/pasta',4,0,0,0),
(141,'Sugar','السكر','https://spinneys-egypt.com/en/categories/sugar',4,0,0,0),
(142,'Homebake &amp; Desserts','لوازم الخبز و الحلويات','https://spinneys-egypt.com/en/categories/homebake',4,0,0,0),
(143,'Jam &amp; Spreads','المربى و الحلاوة و الشيكولاته','https://spinneys-egypt.com/en/categories/jam',4,0,0,0),
(144,'Breakfast Cereal','حبوب الإفطار','https://spinneys-egypt.com/en/categories/breakfast-cereal',4,0,0,0),
(146,'Fish','الأسماك','https://spinneys-egypt.com/en/categories/fish',6,0,0,0),
(147,'Poultry','دواجن','https://spinneys-egypt.com/en/categories/poultry-frozen',6,0,0,0),
(149,'Tea','الشاي','https://spinneys-egypt.com/en/categories/tea',7,0,0,0),
(150,'Coffee and Creamer','القهوة','https://spinneys-egypt.com/en/categories/coffee',7,0,0,0),
(151,'Chocolate &amp; Cocoa','الشيكولاته الساخنه','https://spinneys-egypt.com/en/categories/chocolate-cocoa',7,0,0,0),
(152,'Herbal','أعشاب','https://spinneys-egypt.com/en/categories/herbal',7,0,0,0),
(153,'Carbonated and Power Drinks','مشروبات غازية و مشروبات الطاقة','https://spinneys-egypt.com/en/categories/carbonated-and-power-drinks',7,0,0,0),
(154,'Juices','العصائر','https://spinneys-egypt.com/en/categories/juices',7,0,0,0),
(156,'Chocolates','البسكويت','https://spinneys-egypt.com/en/categories/biscuits',8,0,0,0),
(157,'Biscuits &amp; Cakes','الكيك','https://spinneys-egypt.com/en/categories/cakes',8,0,0,0),
(158,'Crisps &amp; Snacks','الشيبسي والوجبات الخفيفة','https://spinneys-egypt.com/en/categories/chips-snacks-sub',8,0,0,0),
(159,'Nuts','المكسرات','https://spinneys-egypt.com/en/categories/nuts',8,0,0,0),
(161,'Body Wash','غسول الجسم','https://spinneys-egypt.com/en/categories/body-wash',9,0,0,0),
(162,'Soap','الصابون','https://spinneys-egypt.com/en/categories/soap',9,0,0,0),
(163,'Feminine Care','العناية الشخصية للنساء','https://spinneys-egypt.com/en/categories/feminine-care',9,0,0,0),
(164,'Men Care','العناية الشخصية للرجال','https://spinneys-egypt.com/en/categories/men-care',9,0,0,0),
(166,'Aluminum Foil &amp; Cling','ألومنيوم فويل و التغليف البلاستيكي','https://spinneys-egypt.com/en/categories/aluminum-foil-cling',10,0,0,0),
(167,'Trash Bags','أكياس القمامة','https://spinneys-egypt.com/en/categories/trash-bags',10,0,0,0),
(168,'Paper Goods','المناديل و المنتجات الورقية','https://spinneys-egypt.com/en/categories/paper-goods',10,0,0,0),
(169,'Fabric Care','العناية بالأقمشة','https://spinneys-egypt.com/en/categories/fabric-care',10,0,0,0),
(170,'Bleach','المبيضات','https://spinneys-egypt.com/en/categories/bleach',10,0,0,0),
(171,'Detergents','منظفات الملابس','https://spinneys-egypt.com/en/categories/detergents',10,0,0,0),
(172,'All Purpose','منظفات متعددة الأغراض','https://spinneys-egypt.com/en/categories/all-purpose',10,0,0,0),
(173,'Toilet','منظفات التواليت','https://spinneys-egypt.com/en/categories/toilet',10,0,0,0),
(174,'Cream Cleaner','منظفات كريمية','https://spinneys-egypt.com/en/categories/cream-cleaner',10,0,0,0),
(175,'Antiseptics','مطهرات','https://spinneys-egypt.com/en/categories/antiseptics',10,0,0,0),
(176,'Insecticides','مكافحة الحشرات','https://spinneys-egypt.com/en/categories/insecticides',10,0,0,0),
(177,'Air Freshners','معطرات','https://spinneys-egypt.com/en/categories/air-freshners',10,0,0,0),
(178,'Polish','ملمعات','https://spinneys-egypt.com/en/categories/polish',10,0,0,0),
(180,'Feeding','وجبات و طعام الأطفال','https://spinneys-egypt.com/en/categories/feeding',11,0,0,0),
(181,'Diapers &amp; Wipes','الحفاضات و المناديل المبللة','https://spinneys-egypt.com/en/categories/diapers-wipes',11,0,0,0),
(182,'Baby Products','منتجات الأطفال','https://spinneys-egypt.com/en/categories/baby-products',11,0,0,0),
(184,'Cookware','أدوات الطبخ و الأواني','https://spinneys-egypt.com/en/categories/cookware',13,0,0,0),
(185,'Plastics &amp; Containers','البلاستيكات و أدوات التخزين','https://spinneys-egypt.com/en/categories/plastics-containers',13,0,0,0),
(186,'Dinnerware','الصيني و الأطباق','https://spinneys-egypt.com/en/categories/dinnerware',13,0,0,0),
(187,'Cutlery','سكاكين و شوك و معالق','https://spinneys-egypt.com/en/categories/cutlery',13,0,0,0),
(188,'Glass &amp; Crystal','منتجات زجاجية و كريستال','https://spinneys-egypt.com/en/categories/glass-crystal',13,0,0,0),
(189,'Table Mat &amp; Trays','مفارش أكل و صواني','https://spinneys-egypt.com/en/categories/table-mat-trays',13,0,0,0),
(190,'Other','أخرى','https://spinneys-egypt.com/en/categories/other',13,0,0,0),
(191,'Plants &amp; Flowers','زرع و ورد','https://spinneys-egypt.com/en/categories/plants-flowers',13,0,0,0),
(192,'Garden Accessories','اكسسوارات الحديقة','https://spinneys-egypt.com/en/categories/garden-accessories',13,0,0,0),
(193,'BBQ Accessories','مستلزمات شواء','https://spinneys-egypt.com/en/categories/bbq-accessories',13,0,0,0),
(194,'Garden Furniture','فرش حدائق','https://spinneys-egypt.com/en/categories/garden-furniture',13,0,0,0),
(195,'Garden Tools','أدوات الحدائق','https://spinneys-egypt.com/en/categories/garden-tools',13,0,0,0),
(197,'TVs','تلفزيونات','https://spinneys-egypt.com/en/categories/tvs',14,0,0,0),
(198,'Receivers','أجهزة الاستقبال','https://spinneys-egypt.com/en/categories/receivers',14,0,0,0),
(199,'Air Conditioners','تكيفات','https://spinneys-egypt.com/en/categories/air-conditioners',14,0,0,0),
(200,'Fan','مراوح','https://spinneys-egypt.com/en/categories/fan',14,0,0,0),
(201,'Heater','دفايات','https://spinneys-egypt.com/en/categories/heater',14,0,0,0),
(202,'Air Purifier','منقيات هواء','https://spinneys-egypt.com/en/categories/air-purifier',14,0,0,0),
(203,'Oil Radiator','مشعاع الزيت','https://spinneys-egypt.com/en/categories/oil-radiator',14,0,0,0),
(204,'Cookers','بوتجازات','https://spinneys-egypt.com/en/categories/cookers',14,0,0,0),
(205,'Hoods','شفاطات','https://spinneys-egypt.com/en/categories/hoods',14,0,0,0),
(206,'Fridge','ثلاجات','https://spinneys-egypt.com/en/categories/fridge',14,0,0,0),
(207,'Freezers','فريزر','https://spinneys-egypt.com/en/categories/freezers',14,0,0,0),
(208,'Water Despenser','مبردات مياه','https://spinneys-egypt.com/en/categories/water-despenser',14,0,0,0),
(209,'Microwaves','ميكروويف','https://spinneys-egypt.com/en/categories/microwaves',14,0,0,0),
(210,'Toasters','توستر','https://spinneys-egypt.com/en/categories/toasters',14,0,0,0),
(211,'Ovens','أفران','https://spinneys-egypt.com/en/categories/ovens',14,0,0,0),
(212,'Coffee Makers','محضر قهوة','https://spinneys-egypt.com/en/categories/coffee-makers',14,0,0,0),
(213,'Kettles','غلايات','https://spinneys-egypt.com/en/categories/kettles',14,0,0,0),
(214,'Food Proccessor &amp; Blenders','محضر الطعام وخلاطات','https://spinneys-egypt.com/en/categories/food-proccessor-blenders',14,0,0,0),
(215,'Juicers','عصارات','https://spinneys-egypt.com/en/categories/juicers',14,0,0,0),
(216,'Fryers','قليات','https://spinneys-egypt.com/en/categories/fryers',14,0,0,0),
(217,'Rice Cooker','حلل أرز','https://spinneys-egypt.com/en/categories/rice-cooker',14,0,0,0),
(218,'Grills','شوايات','https://spinneys-egypt.com/en/categories/grills',14,0,0,0),
(219,'Kitchen Scales','ميزان مطبخ','https://spinneys-egypt.com/en/categories/kitchen-scales',14,0,0,0),
(220,'Can Opener','فتاحات','https://spinneys-egypt.com/en/categories/can-opener',14,0,0,0),
(221,'Yoghurt, Ice-Cream, Popcorn &amp; Waffle','منتجات صناعة الزبادي','https://spinneys-egypt.com/en/categories/yoghurt-maker',14,0,0,0),
(222,'Hair Care','العناية بالشعر','https://spinneys-egypt.com/en/categories/hair-care',14,0,0,0),
(223,'Shaver','ماكينات الحلاقة','https://spinneys-egypt.com/en/categories/shaver',14,0,0,0),
(224,'Epilator','ماكينات إزالة الشعر','https://spinneys-egypt.com/en/categories/epilator',14,0,0,0),
(225,'Electric Tooth Brush','فرشاة أسنان كهربائية','https://spinneys-egypt.com/en/categories/electric-tooth-brush',14,0,0,0),
(226,'Personal Scales','ميزان','https://spinneys-egypt.com/en/categories/personal-scales',14,0,0,0),
(227,'Blood Pressure Monitor','منتجات قياس الضغط','https://spinneys-egypt.com/en/categories/blood-pressure-monitor',14,0,0,0),
(228,'Foot Spa','منتجات العناية بالقدم','https://spinneys-egypt.com/en/categories/foot-spa',14,0,0,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
