-- Wap PhpMyAdmin 211
-- http://master-land.net/phpmyadmin 
-- Generation Time: 2019-03-18 12:56
-- MySQL Server Version: 5.5.60-MariaDB-cll-lve
-- PHP Version: 5.6.40

-- Database: `beruniy_beruniy`


-- --------------------------------------------------------
-- 
-- Table structure for table `cms_settings`
-- 

CREATE TABLE `cms_settings` (
  `key` tinytext NOT NULL,
  `val` text NOT NULL,
  PRIMARY KEY (`key`(30))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_settings`
-- 

INSERT INTO `cms_settings` VALUES ('active','1');
INSERT INTO `cms_settings` VALUES ('admp','panel');
INSERT INTO `cms_settings` VALUES ('antiflood','a:5:{s:4:"mode";i:2;s:3:"day";i:10;s:5:"night";i:30;s:7:"dayfrom";i:10;s:5:"dayto";i:22;}');
INSERT INTO `cms_settings` VALUES ('clean_time','1552852956');
INSERT INTO `cms_settings` VALUES ('copyright','FUTBOL MENEJER');
INSERT INTO `cms_settings` VALUES ('email','@');
INSERT INTO `cms_settings` VALUES ('flsz','4000');
INSERT INTO `cms_settings` VALUES ('gzip','1');
INSERT INTO `cms_settings` VALUES ('homeurl','http://fmanager.ga');
INSERT INTO `cms_settings` VALUES ('karma','a:6:{s:12:"karma_points";i:5;s:10:"karma_time";i:86400;s:5:"forum";i:20;s:4:"time";i:0;s:2:"on";i:1;s:3:"adm";i:0;}');
INSERT INTO `cms_settings` VALUES ('lng','uz');
INSERT INTO `cms_settings` VALUES ('mod_reg','2');
INSERT INTO `cms_settings` VALUES ('mod_forum','2');
INSERT INTO `cms_settings` VALUES ('mod_guest','2');
INSERT INTO `cms_settings` VALUES ('mod_lib','2');
INSERT INTO `cms_settings` VALUES ('mod_gal','2');
INSERT INTO `cms_settings` VALUES ('mod_down_comm','1');
INSERT INTO `cms_settings` VALUES ('mod_down','2');
INSERT INTO `cms_settings` VALUES ('mod_lib_comm','1');
INSERT INTO `cms_settings` VALUES ('mod_gal_comm','1');
INSERT INTO `cms_settings` VALUES ('meta_desc','Fytbol | fudbol |real madrid');
INSERT INTO `cms_settings` VALUES ('meta_key','Futbol | fudbol |real madrid|');
INSERT INTO `cms_settings` VALUES ('news','a:8:{s:4:"view";i:1;s:4:"size";i:200;s:8:"quantity";i:5;s:4:"days";i:3;s:6:"breaks";i:1;s:7:"smileys";i:1;s:4:"tags";i:1;s:3:"kom";i:1;}');
INSERT INTO `cms_settings` VALUES ('reg_message','');
INSERT INTO `cms_settings` VALUES ('setting_mail','');
INSERT INTO `cms_settings` VALUES ('skindef','FM');
INSERT INTO `cms_settings` VALUES ('them_message','Fm');
INSERT INTO `cms_settings` VALUES ('timeshift','0');
INSERT INTO `cms_settings` VALUES ('site_access','2');
INSERT INTO `cms_settings` VALUES ('lng_list','a:1:{s:2:"uz";s:9:"O\'zbekcha";}');
INSERT INTO `cms_settings` VALUES ('sitemap','a:4:{s:5:"forum";i:1;s:3:"lib";i:1;s:5:"users";i:0;s:8:"browsers";i:0;}');
