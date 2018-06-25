/*
SQLyog Ultimate
MySQL - 5.5.49 : Database - kaoqin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kaoqin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kaoqin`;

/*Table structure for table `basic` */

CREATE TABLE `basic` (
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `basic` */

insert  into `basic`(`name`,`value`) values 
('假期类别','事假'),
('假期类别','产假'),
('假期类别','病假'),
('出行方式','大巴'),
('出行方式','火车'),
('出行方式','自驾'),
('出行方式','飞机'),
('考勤时段','上午上班'),
('考勤时段','上午下班'),
('考勤时段','下午上班'),
('考勤时段','下午下班');

/*Table structure for table `chuchaishenqing` */

CREATE TABLE `chuchaishenqing` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `chuchaishijian` varchar(255) DEFAULT NULL,
  `chuchaitianshu` varchar(255) DEFAULT NULL,
  `tongxingrenyuan` varchar(255) DEFAULT NULL,
  `mudidi` varchar(255) DEFAULT NULL,
  `chuxingfangshi` varchar(255) DEFAULT NULL,
  `shiyou` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `chuchaishenqing` */

insert  into `chuchaishenqing`(`id`,`chuchaishijian`,`chuchaitianshu`,`tongxingrenyuan`,`mudidi`,`chuxingfangshi`,`shiyou`) values 
(1,'2018-06-24','2','杨光,陆爱军','南京','大巴','学习'),
(2,'2018-06-24','1.5','杨光','南京','自驾','学习'),
(3,'2018-06-24','1.25','胥元伟','南通','火车','学习'),
(4,'2018-06-24','0.5','胥元伟，徐豪','上海','飞机','学习'),
(5,'2018-06-24','3','窦祖俊','北京','飞机','学习'),
(6,'2018-06-10','1.4','杨光，窦祖俊，陆爱军，胥元伟','北京','飞机','学习');

/*Table structure for table `jiabanshenqing` */

CREATE TABLE `jiabanshenqing` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(255) DEFAULT NULL,
  `shenqingshijian` varchar(255) DEFAULT NULL,
  `jiabanshijian` varchar(255) DEFAULT NULL,
  `jiabanshichang` varchar(255) DEFAULT NULL,
  `yuanyin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `jiabanshenqing` */

insert  into `jiabanshenqing`(`id`,`staff_name`,`shenqingshijian`,`jiabanshijian`,`jiabanshichang`,`yuanyin`) values 
(2,'陆爱军','2018-06-24','2018-06-27','2.4','加班呢'),
(3,'杨光','2018-06-24','2018-06-27','1.5','加班呢'),
(4,'窦祖俊','2018-06-24','2018-06-27','2.6','加班呢'),
(5,'胥元伟','2018-06-24','2018-06-27','1.5','加班呢'),
(6,'杨光','2018-06-24','2018-06-28','2','加班呢');

/*Table structure for table `jiaqishenqing` */

CREATE TABLE `jiaqishenqing` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(255) DEFAULT NULL,
  `kaishishijian` varchar(255) DEFAULT NULL,
  `jieshushijian` varchar(255) DEFAULT NULL,
  `shichang` varchar(255) DEFAULT NULL,
  `jiaqileixing` varchar(255) DEFAULT NULL,
  `yuanyin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `jiaqishenqing` */

insert  into `jiaqishenqing`(`id`,`staff_name`,`kaishishijian`,`jieshushijian`,`shichang`,`jiaqileixing`,`yuanyin`) values 
(1,'杨光','2018-06-24 10:35:34','2018-06-28 00:00:00','2.875','事假','有事'),
(3,'窦祖俊','2018-06-25 10:00:00','2018-06-27 08:00:00','1.25','病假','感冒'),
(4,'陆爱军','2018-06-24 11:56:53','2018-06-25 00:00:00','0.25','事假','。。。'),
(5,'杨光','2018-04-19 11:23:23','2018-04-24 11:22:33','0.25','事假','有事'),
(6,'陆爱军','2018-04-19 11:23:23','2018-06-25 00:00:00','1.25','病假','有事');

/*Table structure for table `kaoqinjilu` */

CREATE TABLE `kaoqinjilu` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `kaoqinshijian` varchar(255) DEFAULT NULL,
  `leibie` varchar(255) DEFAULT NULL,
  `staff_name` varchar(255) DEFAULT NULL,
  `kaoqinshiduan` varchar(255) DEFAULT NULL,
  `shuoming` varchar(255) DEFAULT NULL,
  `jiluren` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `kaoqinjilu` */

insert  into `kaoqinjilu`(`id`,`kaoqinshijian`,`leibie`,`staff_name`,`kaoqinshiduan`,`shuoming`,`jiluren`) values 
(1,'2018-06-23','早退','杨光','下午下班','特殊情况','admin'),
(2,'2018-06-23','早退','窦祖俊','上午上班','123','admin'),
(3,'2018-06-25','早退','杨光','上午上班','特殊情况','admin'),
(4,'2018-06-25','早会未到','陆爱军','上午上班','特殊情况','admin'),
(5,'2018-06-26','早操未到','陆爱军','下午下班','特殊情况','admin'),
(6,'2018-06-26','会议缺席','杨光','下午下班','特殊情况','admin');

/*Table structure for table `staff` */

CREATE TABLE `staff` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `staff` */

insert  into `staff`(`id`,`name`) values 
(1,'杨光'),
(2,'窦祖俊'),
(3,'陆爱军'),
(4,'胥元伟'),
(6,'徐豪');

/*Table structure for table `tiaoxiushenqing` */

CREATE TABLE `tiaoxiushenqing` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `staff_name` varchar(255) DEFAULT NULL,
  `shenqingshijian` varchar(255) DEFAULT NULL,
  `begin` varchar(255) DEFAULT NULL,
  `end` varchar(255) DEFAULT NULL,
  `tiaoxiushichang` varchar(255) DEFAULT NULL,
  `tiaoxiuyuanyin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `tiaoxiushenqing` */

insert  into `tiaoxiushenqing`(`id`,`staff_name`,`shenqingshijian`,`begin`,`end`,`tiaoxiushichang`,`tiaoxiuyuanyin`) values 
(2,'陆爱军','2018-06-25','2018-06-26','2018-06-28','1.5','调休');

/*Table structure for table `user` */

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`password`) values 
(1,'admin','123456');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
