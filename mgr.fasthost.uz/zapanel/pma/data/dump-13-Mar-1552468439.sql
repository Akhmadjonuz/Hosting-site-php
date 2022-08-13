-- Wap PhpMyAdmin 211
-- http://master-land.net/phpmyadmin 
-- Generation Time: 2019-03-13 12:13
-- MySQL Server Version: 5.5.60-MariaDB-cll-lve
-- PHP Version: 5.6.40

-- Database: `beruniy_uzbegim`


-- --------------------------------------------------------
-- 
-- Table structure for table `fanclub`
-- 

CREATE TABLE `fanclub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `sport` varchar(50) NOT NULL DEFAULT '',
  `count` varchar(50) NOT NULL DEFAULT '',
  `user` int(11) NOT NULL DEFAULT '0',
  `plus` int(11) NOT NULL DEFAULT '0',
  `minus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `fanclub`
-- 

INSERT INTO `fanclub` VALUES ('1','Real Madrid CF','Futbol','Ispaniya','0','7','3');
INSERT INTO `fanclub` VALUES ('2','FC Chelsea','Futbol','Angliya','0','7','1');
INSERT INTO `fanclub` VALUES ('3','FC Barcelona','Futbol','Ispaniya','0','6','2');
INSERT INTO `fanclub` VALUES ('4','Manchester United','Futbol','Angliya','0','4','1');
INSERT INTO `fanclub` VALUES ('5','FC Liverpool','Futbol','Angliya','0','5','0');
INSERT INTO `fanclub` VALUES ('6','FC Arsenal','Futbol','Angliya','0','1','1');
INSERT INTO `fanclub` VALUES ('7','Manchester City','Futbol','Angliya','0','3','1');
INSERT INTO `fanclub` VALUES ('8','Juventus','Futbol','Italiya','0','5','2');
INSERT INTO `fanclub` VALUES ('9','AC Milan','Futbol','Italiya','0','0','2');
INSERT INTO `fanclub` VALUES ('10','SSC Napoli','Futbol','Italiya','0','2','0');
INSERT INTO `fanclub` VALUES ('11','Bayern Munchen','Futbol','Germaniya','0','2','1');
INSERT INTO `fanclub` VALUES ('12','Borussiya Dortmund','Futbol','Germaniya','0','2','0');
INSERT INTO `fanclub` VALUES ('13','PSG','Futbol','Fransiya','0','2','1');
INSERT INTO `fanclub` VALUES ('14','Olympique Lyonnais','Futbol','Fransiya','0','1','1');

-- --------------------------------------------------------
-- 
-- Table structure for table `fanclub_komm`
-- 

CREATE TABLE `fanclub_komm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `komm` varchar(500) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `fanclub_vote`
-- 

CREATE TABLE `fanclub_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `count` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `news_fanclub`
-- 

CREATE TABLE `news_fanclub` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tema` varchar(200) NOT NULL,
  `text` varchar(10000) NOT NULL,
  `cid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
