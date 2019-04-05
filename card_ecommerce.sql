/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.1.37-MariaDB : Database - card_ecommerce
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`card_ecommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `card_ecommerce`;

/*Table structure for table `blog_tables` */

DROP TABLE IF EXISTS `blog_tables`;

CREATE TABLE `blog_tables` (
  `id_blog` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `blog_post_text` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_blog`),
  UNIQUE KEY `blog_tables_id_user_unique` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `blog_tables` */

/*Table structure for table `category_tables` */

DROP TABLE IF EXISTS `category_tables`;

CREATE TABLE `category_tables` (
  `id_category` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `category_tables` */

/*Table structure for table `item_tables` */

DROP TABLE IF EXISTS `item_tables`;

CREATE TABLE `item_tables` (
  `id_item` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `quantity_no` enum('100','250','300') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  UNIQUE KEY `item_tables_id_product_unique` (`id_product`),
  UNIQUE KEY `item_tables_id_order_unique` (`id_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `item_tables` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values 
(1,'2014_10_12_000000_create_users_table',1),
(2,'2014_10_12_100000_create_password_resets_table',1),
(3,'2019_04_05_175814_create_product_tables_table',1),
(4,'2019_04_05_175845_create_order_tables_table',1),
(5,'2019_04_05_175907_create_blog_tables_table',1),
(6,'2019_04_05_175933_create_item_tables_table',1),
(7,'2019_04_05_180019_create_user_address_book_tables_table',1),
(8,'2019_04_05_180116_create_wish_list_tables_table',1),
(9,'2019_04_05_190729_create_category_tables_table',1),
(10,'2019_04_05_190909_create_sub_category_tables_table',1);

/*Table structure for table `order_tables` */

DROP TABLE IF EXISTS `order_tables`;

CREATE TABLE `order_tables` (
  `id_order` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `user_approval` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_in_progress` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_complete` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_address_book` int(11) NOT NULL,
  `review_points` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL,
  `review_comment` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  UNIQUE KEY `order_tables_id_user_unique` (`id_user`),
  UNIQUE KEY `order_tables_id_address_book_unique` (`id_address_book`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `order_tables` */

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `product_tables` */

DROP TABLE IF EXISTS `product_tables`;

CREATE TABLE `product_tables` (
  `id_product` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_file` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_catagories` int(11) NOT NULL,
  `id_sub_catagories` int(11) NOT NULL,
  `quantity_no` enum('100','250','300') COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) NOT NULL,
  `discount_rate` double(3,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  UNIQUE KEY `product_tables_id_user_unique` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `product_tables` */

/*Table structure for table `sub_category_tables` */

DROP TABLE IF EXISTS `sub_category_tables`;

CREATE TABLE `sub_category_tables` (
  `id_sub_category` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_category` int(11) NOT NULL,
  `sub_category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_category_info` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_sub_category`),
  UNIQUE KEY `sub_category_tables_id_category_unique` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sub_category_tables` */

/*Table structure for table `user_address_book_tables` */

DROP TABLE IF EXISTS `user_address_book_tables`;

CREATE TABLE `user_address_book_tables` (
  `id_address_book` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setDefault_address` enum('0','1') COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_address_book`),
  UNIQUE KEY `user_address_book_tables_id_user_unique` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `user_address_book_tables` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id_user` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

/*Table structure for table `wish_list_tables` */

DROP TABLE IF EXISTS `wish_list_tables`;

CREATE TABLE `wish_list_tables` (
  `id_wish_list` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_wish_list`),
  UNIQUE KEY `wish_list_tables_id_user_unique` (`id_user`),
  UNIQUE KEY `wish_list_tables_id_product_unique` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `wish_list_tables` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
