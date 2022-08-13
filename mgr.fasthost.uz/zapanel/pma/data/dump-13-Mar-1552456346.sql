-- Wap PhpMyAdmin 211
-- http://master-land.net/phpmyadmin 
-- Generation Time: 2019-03-13 08:52
-- MySQL Server Version: 5.5.60-MariaDB-cll-lve
-- PHP Version: 5.6.40

-- Database: `beruniy_uzbegim`


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

-- --------------------------------------------------------
-- 
-- Table structure for table `privat`
-- 

CREATE TABLE `privat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(25) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `time` varchar(25) NOT NULL DEFAULT '',
  `author` varchar(25) NOT NULL DEFAULT '',
  `type` char(3) NOT NULL DEFAULT '',
  `chit` char(3) NOT NULL DEFAULT '',
  `temka` text NOT NULL,
  `otvet` binary(1) NOT NULL DEFAULT '\0',
  `me` varchar(25) NOT NULL DEFAULT '',
  `cont` varchar(25) NOT NULL DEFAULT '',
  `ignor` varchar(25) NOT NULL DEFAULT '',
  `attach` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `me` (`me`),
  KEY `ignor` (`ignor`)
) ENGINE=MyISAM AUTO_INCREMENT=1937 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `r_bilet`
-- 

CREATE TABLE `r_bilet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `id_cup` int(11) NOT NULL,
  `id_team` int(11) NOT NULL,
  `union_team` int(2) NOT NULL,
  `name_team` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=215 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `r_cup`
-- 

CREATE TABLE `r_cup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cup` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `ot` int(2) NOT NULL,
  `do` int(2) NOT NULL,
  `name` varchar(50) NOT NULL,
  `priz` int(11) NOT NULL,
  `win` int(11) NOT NULL,
  `status` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `r_cupgame`
-- 

CREATE TABLE `r_cupgame` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_chemp` varchar(15) NOT NULL,
  `s_chemp` varchar(15) NOT NULL,
  `p_chemp` varchar(15) NOT NULL,
  `time` int(11) NOT NULL,
  `id_team1` int(11) NOT NULL,
  `id_team2` int(11) NOT NULL,
  `name_team1` varchar(50) NOT NULL,
  `name_team2` varchar(50) NOT NULL,
  `rez1` varchar(2) NOT NULL,
  `rez2` varchar(2) NOT NULL,
  `pen1` varchar(2) NOT NULL,
  `pen2` varchar(2) NOT NULL,
  `id_report` varchar(11) NOT NULL,
  `win` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=148 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `r_priz`
-- 

CREATE TABLE `r_priz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cup` varchar(11) NOT NULL,
  `id_union` int(50) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `priz` int(11) NOT NULL,
  `win` int(11) NOT NULL,
  `url` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `table_m`
-- 

CREATE TABLE `table_m` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team` text NOT NULL,
  `i` int(10) NOT NULL DEFAULT '0',
  `o` int(10) NOT NULL DEFAULT '0',
  `goals` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
