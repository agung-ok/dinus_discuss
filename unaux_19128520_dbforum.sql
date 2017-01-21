/*
SQLyog Ultimate v12.09 (32 bit)
MySQL - 10.1.19-MariaDB : Database - unaux_19128520_dbforum
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`unaux_19128520_dbforum` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `unaux_19128520_dbforum`;

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cat_id` int(12) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`cat_id`,`category`) values (1,'Fakultas Ilmu Komputer (FIK)'),(2,'Fakultas Ekonomi Bisnis (FEB)'),(3,'Fakultas Ilmu Budaya dan Bahasa (FIB)'),(4,'Fakultas Kesehatan (FKes)'),(5,'Fakultas Teknik (FT)');

/*Table structure for table `tblaccount` */

DROP TABLE IF EXISTS `tblaccount`;

CREATE TABLE `tblaccount` (
  `id` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_Id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_Id` (`user_Id`),
  CONSTRAINT `tblaccount_ibfk_1` FOREIGN KEY (`user_Id`) REFERENCES `tbluser` (`user_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tblaccount` */

insert  into `tblaccount`(`id`,`password`,`user_Id`) values ('A11.2014.08532','070eff7c9c921bbb6325db40fe9e20ef',23),('akuma','e732871e18f3953ed08a8c3c16a95e94',125);

/*Table structure for table `tbladmin` */

DROP TABLE IF EXISTS `tbladmin`;

CREATE TABLE `tbladmin` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `tbladmin` */

insert  into `tbladmin`(`Id`,`uname`,`pwd`) values (1,'akuma','aoi');

/*Table structure for table `tblcomment` */

DROP TABLE IF EXISTS `tblcomment`;

CREATE TABLE `tblcomment` (
  `comment_Id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `post_Id` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `user_Id` int(12) DEFAULT NULL,
  PRIMARY KEY (`comment_Id`),
  KEY `user_Id` (`user_Id`),
  KEY `post_Id` (`post_Id`),
  KEY `user_Id_2` (`user_Id`),
  CONSTRAINT `tblcomment_ibfk_1` FOREIGN KEY (`user_Id`) REFERENCES `tbluser` (`user_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tblcomment_ibfk_2` FOREIGN KEY (`post_Id`) REFERENCES `tblpost` (`post_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

/*Data for the table `tblcomment` */

insert  into `tblcomment`(`comment_Id`,`comment`,`post_Id`,`datetime`,`user_Id`) values (23,'nsjkakja',32,'2017-01-21 11:31:40',125),(25,'asem',32,'2017-01-21 11:47:36',23),(26,'nskndkana',32,'2017-01-21 11:52:31',23),(27,'test',32,'2017-01-21 12:11:43',23),(28,'ok',32,'2017-01-21 12:12:43',23),(29,'asem',32,'2017-01-21 12:14:32',23),(47,'asnknsa',14,'2017-01-21 08:34:06',125),(48,'coba',14,'2017-01-21 08:35:38',125);

/*Table structure for table `tblpost` */

DROP TABLE IF EXISTS `tblpost`;

CREATE TABLE `tblpost` (
  `post_Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `datetime` datetime DEFAULT NULL,
  `cat_id` int(12) DEFAULT NULL,
  `user_Id` int(12) DEFAULT NULL,
  PRIMARY KEY (`post_Id`),
  KEY `cat_id` (`cat_id`),
  KEY `user_Id` (`user_Id`),
  CONSTRAINT `tblpost_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

/*Data for the table `tblpost` */

insert  into `tblpost`(`post_Id`,`title`,`content`,`datetime`,`cat_id`,`user_Id`) values (12,'coba','gejkadn                        ','2016-12-02 11:17:47',1,23),(13,'askan','dakndka                        ','0000-00-00 00:00:00',1,23),(14,'daknd','ndkankf                        ','2016-12-03 01:06:59',1,23),(32,'msmaknak','lanlknladnl                        \r\n                                        asdakda','2017-01-21 10:58:53',1,125);

/*Table structure for table `tbluser` */

DROP TABLE IF EXISTS `tbluser`;

CREATE TABLE `tbluser` (
  `user_Id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;

/*Data for the table `tbluser` */

insert  into `tbluser`(`user_Id`,`fname`,`lname`,`gender`,`status`,`image`) values (23,'Agung','Oktavian','Laki-laki','Mahasiswa',NULL),(125,'Agung','Oc','Laki-laki','Mahasiswa',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
