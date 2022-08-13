-- Wap PhpMyAdmin 211
-- http://master-land.net/phpmyadmin 
-- Generation Time: 2019-01-31 21:26
-- MySQL Server Version: 5.5.62-0+deb8u1
-- PHP Version: 5.6.38

-- --------------------------------------------------------
--
-- Database: `itrade`
-- 
CREATE DATABASE `itrade` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `itrade`;


-- --------------------------------------------------------
-- 
-- Table structure for table `market`
-- 

CREATE TABLE `market` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_id` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `caption` varchar(1024) CHARACTER SET utf8mb4 NOT NULL,
  `narx` varchar(20) NOT NULL,
  `user` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------
-- 
-- Dumping data for table `market`
-- 

INSERT INTO `market` VALUES ('58','AgADAgADrakxG2MbmEr9l0ks6XFttntUOQ8ABKJmkp6FcJS3oSYCAAEC','ðŸ‡ºðŸ‡¿ Ajoyib oyoq kiyim, *4 xil rang* mavjud;\n_ðŸ’¯ Chegirma_*-30%* _gacha_\nðŸ‡ºðŸ‡¿ ÐÐ¶Ð¾Ð¹Ð¸Ð± Ð¾Ñ‘Ò› ÐºÐ¸Ð¹Ð¸Ð¼, *4 Ñ…Ð¸Ð»* Ñ€Ð°Ð½Ð³ Ð¼Ð°Ð²Ð¶ÑƒÐ´;\n_ðŸ’¯ Ð§ÐµÐ³Ð¸Ñ€Ð¼Ð°_ *-30%* _Ð³Ð°Ñ‡Ð°_\nðŸ‡·ðŸ‡º Ð¨Ð¸ÐºÐ°Ñ€Ð½Ñ‹Ðµ Ñ‚ÑƒÑ„ÐµÐ»ÑŒÐºÐ¸,ÐµÑÑ‚ÑŒ Ð² *4 Ñ†Ð²ÐµÑ‚Ð°Ñ…*\n_ðŸ’¯ Ð¡ÐºÐ¸Ð´ÐºÐ° Ð´Ð¾_ *-30%*','310000','0');
INSERT INTO `market` VALUES ('57','AgADAgADr6kxG2MbmEpsVQKIooRsFu5dXw8ABMgvH4aIqpwfolgBAAEC','ðŸ‡ºðŸ‡¿ USB-Uzatgich, iOS va Android qurilmari uchun. *SUPER NARX!*\nðŸ‡ºðŸ‡¿ USB-Ð£Ð·Ð°Ñ‚ÐºÐ¸Ñ‡, iOS Ð²Ð° ÐÐ½Ð´Ñ€Ð¾Ð¸Ð´ Ò›ÑƒÑ€Ð¸Ð»Ð¼Ð°Ð»Ð°Ñ€Ð¸ ÑƒÑ‡ÑƒÐ½. *Ð¡Ð£ÐŸÐ•Ð ÐÐÐ Ð¥!*\nðŸ‡·ðŸ‡º USB-ÐºÐ°Ð±ÐµÐ»ÑŒ Ð´Ð»Ñ Ð¿Ð¾Ð´Ð·Ð°Ñ€ÑÐ´ÐºÐ¸ IPHONE/Android.*Ð¡Ð£ÐŸÐ•Ð  Ð¦Ð•ÐÐ!*','14000','0');
INSERT INTO `market` VALUES ('59','AgADAgADu6kxG2MbmEoc7IH3Qo0-Z4hD8w4ABECPE87I6u-gCVQGAAEC','ðŸ‡ºðŸ‡¿ *HUAWEI* uchun ajoyib chexol, telefonning har bir burchagini qoplaydi.\nðŸ‡ºðŸ‡¿ *HUAWEI* ÑƒÑ‡ÑƒÐ½ Ð°Ð¶Ð¾Ð¹Ð¸Ð± Ñ‡ÐµÑ…Ð¾Ð», Ñ‚ÐµÐ»ÐµÑ„Ð¾Ð½Ð½Ð¸Ð½Ð³ Ò³Ð°Ñ€ Ð±Ð¸Ñ€ Ð±ÑƒÑ€Ñ‡Ð°Ð³Ð¸Ð½Ð¸ Ò›Ð¾Ð¿Ð»Ð°Ð¹Ð´Ð¸.\nðŸ‡·ðŸ‡º Ð§ÐµÑ…Ð¾Ð» Ð´Ð»Ñ *Huawei*, ÐºÐ¾Ñ‚Ð¾Ñ€Ñ‹Ð¹ Ð·Ð°Ñ‰Ð¸Ñ‚Ð¸Ñ‚ Ð²Ð°Ñˆ ÑÐ¼Ð°Ñ€Ñ‚Ñ„Ð¾Ð½ ÑÐ¾ Ð²ÑÐµÑ… ÑÑ‚Ð¾Ñ€Ð¾Ð½.','38000','0');

-- --------------------------------------------------------
-- 
-- Table structure for table `market_cache`
-- 

CREATE TABLE `market_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `viloyat` varchar(1000) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `count` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`count`),
  KEY `refid` (`refid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `market_cache`
-- 

INSERT INTO `market_cache` VALUES ('27','58','','','118671580','0');
INSERT INTO `market_cache` VALUES ('25','59','','','132683035','0');
INSERT INTO `market_cache` VALUES ('26','58','','','608117371','0');

-- --------------------------------------------------------
-- 
-- Table structure for table `market_user`
-- 

CREATE TABLE `market_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) CHARACTER SET utf8 NOT NULL,
  `user` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------
-- 
-- Dumping data for table `market_user`
-- 

INSERT INTO `market_user` VALUES ('27','uz','425938228');
INSERT INTO `market_user` VALUES ('26','uz','754401672');
INSERT INTO `market_user` VALUES ('25','uzk','132683035');
INSERT INTO `market_user` VALUES ('28','uzk','617286560');
INSERT INTO `market_user` VALUES ('29','uz','354305162');
INSERT INTO `market_user` VALUES ('30','uz','387750021');
INSERT INTO `market_user` VALUES ('31','ru','708284685');
INSERT INTO `market_user` VALUES ('32','uz','118671580');
INSERT INTO `market_user` VALUES ('33','uz','608117371');


