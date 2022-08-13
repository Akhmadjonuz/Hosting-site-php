-- Wap PhpMyAdmin 211
-- http://master-land.net/phpmyadmin 
-- Generation Time: 2019-02-04 08:48
-- MySQL Server Version: 5.5.62-0+deb8u1
-- PHP Version: 5.6.38

-- Database: `daviuz_d`


-- --------------------------------------------------------
-- 
-- Table structure for table `cms_ads`
-- 

DROP TABLE IF EXISTS `cms_ads`;
CREATE TABLE `cms_ads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `view` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `layout` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `count_link` int(10) unsigned NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `link` text NOT NULL,
  `to` int(10) unsigned NOT NULL DEFAULT '0',
  `color` varchar(10) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `day` int(10) unsigned NOT NULL DEFAULT '0',
  `mesto` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `bold` tinyint(1) NOT NULL DEFAULT '0',
  `italic` tinyint(1) NOT NULL DEFAULT '0',
  `underline` tinyint(1) NOT NULL DEFAULT '0',
  `show` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_ads`
-- 

INSERT INTO `cms_ads` VALUES ('1','1','0','0','0','0','Davlat Amirov Telegram Profil','http://t.me/davlat_amirov','0','','1549258865','0','1','0','1','0','1');
INSERT INTO `cms_ads` VALUES ('2','2','0','2','0','0','Davlat Amirov Telegram Profil','http://t.me/davlat_amirov','0','','1549259079','0','2','1','0','0','1');

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_album_cat`
-- 

DROP TABLE IF EXISTS `cms_album_cat`;
CREATE TABLE `cms_album_cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `password` varchar(20) NOT NULL DEFAULT '',
  `access` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `access` (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_album_comments`
-- 

DROP TABLE IF EXISTS `cms_album_comments`;
CREATE TABLE `cms_album_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `reply` text NOT NULL,
  `attributes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_id` (`sub_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_album_downloads`
-- 

DROP TABLE IF EXISTS `cms_album_downloads`;
CREATE TABLE `cms_album_downloads` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_album_files`
-- 

DROP TABLE IF EXISTS `cms_album_files`;
CREATE TABLE `cms_album_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `album_id` int(10) unsigned NOT NULL,
  `description` text NOT NULL,
  `img_name` varchar(100) NOT NULL DEFAULT '',
  `tmb_name` varchar(100) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `comments` tinyint(1) NOT NULL DEFAULT '1',
  `comm_count` int(10) unsigned NOT NULL DEFAULT '0',
  `access` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `vote_plus` int(11) NOT NULL DEFAULT '0',
  `vote_minus` int(11) NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `downloads` int(10) unsigned NOT NULL DEFAULT '0',
  `unread_comments` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `album_id` (`album_id`),
  KEY `access` (`access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_album_views`
-- 

DROP TABLE IF EXISTS `cms_album_views`;
CREATE TABLE `cms_album_views` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_album_votes`
-- 

DROP TABLE IF EXISTS `cms_album_votes`;
CREATE TABLE `cms_album_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vote` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_ban_ip`
-- 

DROP TABLE IF EXISTS `cms_ban_ip`;
CREATE TABLE `cms_ban_ip` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip1` bigint(11) NOT NULL DEFAULT '0',
  `ip2` bigint(11) NOT NULL DEFAULT '0',
  `ban_type` tinyint(4) NOT NULL DEFAULT '0',
  `link` varchar(100) NOT NULL,
  `who` varchar(25) NOT NULL,
  `reason` text NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip1` (`ip1`),
  UNIQUE KEY `ip2` (`ip2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_ban_users`
-- 

DROP TABLE IF EXISTS `cms_ban_users`;
CREATE TABLE `cms_ban_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `ban_time` int(11) NOT NULL DEFAULT '0',
  `ban_while` int(11) NOT NULL DEFAULT '0',
  `ban_type` tinyint(4) NOT NULL DEFAULT '1',
  `ban_who` varchar(30) NOT NULL DEFAULT '',
  `ban_ref` int(11) NOT NULL DEFAULT '0',
  `ban_reason` text NOT NULL,
  `ban_raz` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ban_time` (`ban_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_contact`
-- 

DROP TABLE IF EXISTS `cms_contact`;
CREATE TABLE `cms_contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `friends` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ban` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `man` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`user_id`,`from_id`),
  KEY `time` (`time`),
  KEY `ban` (`ban`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_counters`
-- 

DROP TABLE IF EXISTS `cms_counters`;
CREATE TABLE `cms_counters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(10) NOT NULL DEFAULT '1',
  `name` varchar(30) NOT NULL,
  `link1` text NOT NULL,
  `link2` text NOT NULL,
  `mode` tinyint(4) NOT NULL DEFAULT '1',
  `switch` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_forum_files`
-- 

DROP TABLE IF EXISTS `cms_forum_files`;
CREATE TABLE `cms_forum_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat` int(10) unsigned NOT NULL DEFAULT '0',
  `subcat` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` int(10) unsigned NOT NULL DEFAULT '0',
  `post` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `filename` text NOT NULL,
  `filetype` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dlcount` int(10) unsigned NOT NULL DEFAULT '0',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `cat` (`cat`),
  KEY `subcat` (`subcat`),
  KEY `topic` (`topic`),
  KEY `post` (`post`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_forum_rdm`
-- 

DROP TABLE IF EXISTS `cms_forum_rdm`;
CREATE TABLE `cms_forum_rdm` (
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`,`user_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_forum_vote`
-- 

DROP TABLE IF EXISTS `cms_forum_vote`;
CREATE TABLE `cms_forum_vote` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `topic` (`topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_forum_vote_users`
-- 

DROP TABLE IF EXISTS `cms_forum_vote_users`;
CREATE TABLE `cms_forum_vote_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `topic` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic` (`topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_library_comments`
-- 

DROP TABLE IF EXISTS `cms_library_comments`;
CREATE TABLE `cms_library_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub_id` int(11) unsigned NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `text` text NOT NULL,
  `reply` text,
  `attributes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_id` (`sub_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_library_rating`
-- 

DROP TABLE IF EXISTS `cms_library_rating`;
CREATE TABLE `cms_library_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `st_id` int(11) NOT NULL,
  `point` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`st_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_mail`
-- 

DROP TABLE IF EXISTS `cms_mail`;
CREATE TABLE `cms_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from_id` int(10) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sys` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `delete` int(10) unsigned NOT NULL DEFAULT '0',
  `file_name` varchar(100) NOT NULL DEFAULT '',
  `count` int(10) NOT NULL DEFAULT '0',
  `size` int(10) NOT NULL DEFAULT '0',
  `them` varchar(100) NOT NULL DEFAULT '',
  `spam` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `from_id` (`from_id`),
  KEY `time` (`time`),
  KEY `read` (`read`),
  KEY `sys` (`sys`),
  KEY `delete` (`delete`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_sessions`
-- 

DROP TABLE IF EXISTS `cms_sessions`;
CREATE TABLE `cms_sessions` (
  `session_id` char(32) NOT NULL DEFAULT '',
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `browser` varchar(255) NOT NULL DEFAULT '',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `sestime` int(10) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `movings` smallint(5) unsigned NOT NULL DEFAULT '0',
  `place` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `lastdate` (`lastdate`),
  KEY `place` (`place`(10))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_sessions`
-- 

INSERT INTO `cms_sessions` VALUES ('e9caa6d19d38601951fefa0713a4a59e','184804003','3161582312','UCWEB/2.0 (MIDP-2.0; U; Adr 7.1.2; ru; Redmi_4X) U2/1.0.0 UCBrowser/11.0.6.1040 U2/1.0.0 Mobile','1549216832','1549216782','0','12','login');
INSERT INTO `cms_sessions` VALUES ('ac13c469b8abbafbc413ba6ce962435c','3161582312','0','UCWEB/2.0 (MIDP-2.0; U; Adr 7.1.2; ru; Redmi_4X) U2/1.0.0 UCBrowser/11.0.6.1040 U2/1.0.0 Mobile','1549216817','1549216817','0','0','load');
INSERT INTO `cms_sessions` VALUES ('93be3253b6bf7ce8a2131ac70734821a','3161583292','0','Mozilla/5.0 (Linux; U; Android 8.0.0; en-US; SM-G570F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 UCBrowser/1','1549220352','1549220224','0','13','load');
INSERT INTO `cms_sessions` VALUES ('a204c51dbb2aed05dfe8ae9937f75516','2366145572','0','Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)','1549241082','1549241082','0','0','registration');
INSERT INTO `cms_sessions` VALUES ('d08e1022ce40597ee8c6339f96539fde','184804003','3161582119','UCWEB/2.0 (MIDP-2.0; U; Adr 7.1.2; ru; Redmi_4X) U2/1.0.0 UCBrowser/11.0.6.1040 U2/1.0.0 Mobile','1549247513','1549247513','0','0','mainpage');
INSERT INTO `cms_sessions` VALUES ('381a026f5d4f97c01f37581ce71ed89e','3161582820','0','Mozilla/5.0 (Linux; U; Android 8.0.0; en-US; SM-G570F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 UCBrowser/1','1549248723','1549248687','0','7','mainpage');
INSERT INTO `cms_sessions` VALUES ('ff8e11352530faa7ee323f5354a29b86','184804003','3161582349','UCWEB/2.0 (MIDP-2.0; U; Adr 7.1.2; ru; Redmi_4X) U2/1.0.0 UCBrowser/11.0.6.1040 U2/1.0.0 Mobile','1549250631','1549250631','0','1','mainpage');
INSERT INTO `cms_sessions` VALUES ('c81016c2295f35eb74dbb370a6f460c5','3161582349','0','UCWEB/2.0 (MIDP-2.0; U; Adr 7.1.2; ru; Redmi_4X) U2/1.0.0 UCBrowser/11.0.6.1040 U2/1.0.0 Mobile','1549249379','1549249264','0','3','load');
INSERT INTO `cms_sessions` VALUES ('e579fcc18c43f9813034bf27c5a49a60','3161582349','0','Mozilla/5.0 (Linux; U; Android 7.1.2; ru; Redmi_4X Build/N2G47H) AppleWebKit/528.5+ (KHTML, like Gecko) Version/3.1.2 Mobile Safari/525.20.1 UCBrowser','1549250629','1549250395','0','11','mainpage');
INSERT INTO `cms_sessions` VALUES ('f3ffd2b20236cb8a9befae544caffb1a','3161572611','0','Mozilla/5.0 (Linux; U; Android 8.0.0; en-US; SM-G570F Build/R16NW) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/57.0.2987.108 UCBrowser/1','1549253309','1549253308','0','1','load');
INSERT INTO `cms_sessions` VALUES ('6be05118d3b50bb83770f67479fe9872','184804003','3161573348','UCWEB/2.0 (MIDP-2.0; U; Adr 7.1.2; ru; Redmi_4X) U2/1.0.0 UCBrowser/11.0.6.1040 U2/1.0.0 Mobile','1549258760','1549258614','0','4','login');

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_settings`
-- 

DROP TABLE IF EXISTS `cms_settings`;
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
INSERT INTO `cms_settings` VALUES ('clean_time','1549215954');
INSERT INTO `cms_settings` VALUES ('copyright','Powered by Davlat Amirov (Davi_Uz)');
INSERT INTO `cms_settings` VALUES ('email','@');
INSERT INTO `cms_settings` VALUES ('flsz','4000');
INSERT INTO `cms_settings` VALUES ('gzip','1');
INSERT INTO `cms_settings` VALUES ('homeurl','http://daviuz.xvest.ru');
INSERT INTO `cms_settings` VALUES ('karma','a:6:{s:12:"karma_points";i:5;s:10:"karma_time";i:86400;s:5:"forum";i:20;s:4:"time";i:0;s:2:"on";i:1;s:3:"adm";i:0;}');
INSERT INTO `cms_settings` VALUES ('lng','ru');
INSERT INTO `cms_settings` VALUES ('mod_reg','2');
INSERT INTO `cms_settings` VALUES ('mod_forum','2');
INSERT INTO `cms_settings` VALUES ('mod_guest','2');
INSERT INTO `cms_settings` VALUES ('mod_lib','2');
INSERT INTO `cms_settings` VALUES ('mod_gal','2');
INSERT INTO `cms_settings` VALUES ('mod_down_comm','1');
INSERT INTO `cms_settings` VALUES ('mod_down','2');
INSERT INTO `cms_settings` VALUES ('mod_lib_comm','1');
INSERT INTO `cms_settings` VALUES ('mod_gal_comm','1');
INSERT INTO `cms_settings` VALUES ('meta_desc','Powered by JohnCMS http://johncms.com');
INSERT INTO `cms_settings` VALUES ('meta_key','johncms');
INSERT INTO `cms_settings` VALUES ('news','a:8:{s:4:"view";i:1;s:4:"size";i:200;s:8:"quantity";i:5;s:4:"days";i:3;s:6:"breaks";i:1;s:7:"smileys";i:1;s:4:"tags";i:1;s:3:"kom";i:1;}');
INSERT INTO `cms_settings` VALUES ('reg_message','');
INSERT INTO `cms_settings` VALUES ('setting_mail','');
INSERT INTO `cms_settings` VALUES ('skindef','default');
INSERT INTO `cms_settings` VALUES ('them_message','');
INSERT INTO `cms_settings` VALUES ('timeshift','0');
INSERT INTO `cms_settings` VALUES ('site_access','2');

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_users_data`
-- 

DROP TABLE IF EXISTS `cms_users_data`;
CREATE TABLE `cms_users_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `key` varchar(30) NOT NULL DEFAULT '',
  `val` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_users_guestbook`
-- 

DROP TABLE IF EXISTS `cms_users_guestbook`;
CREATE TABLE `cms_users_guestbook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_id` int(10) unsigned NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `text` text NOT NULL,
  `reply` text NOT NULL,
  `attributes` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_id` (`sub_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_users_iphistory`
-- 

DROP TABLE IF EXISTS `cms_users_iphistory`;
CREATE TABLE `cms_users_iphistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_ip` (`ip`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_users_iphistory`
-- 

INSERT INTO `cms_users_iphistory` VALUES ('1','1','184804003','0','1549215954');
INSERT INTO `cms_users_iphistory` VALUES ('5','1','3161582312','0','1549216851');
INSERT INTO `cms_users_iphistory` VALUES ('6','1','184804003','3161582312','1549217380');
INSERT INTO `cms_users_iphistory` VALUES ('7','1','3161582349','0','1549248277');

-- --------------------------------------------------------
-- 
-- Table structure for table `down_bookmarks`
-- 

DROP TABLE IF EXISTS `down_bookmarks`;
CREATE TABLE `down_bookmarks` (
  `user` int(11) NOT NULL,
  `file` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `downfiles`
-- 

DROP TABLE IF EXISTS `downfiles`;
CREATE TABLE `downfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL DEFAULT '0',
  `pathid` int(11) NOT NULL,
  `way` text NOT NULL,
  `name` text NOT NULL,
  `desc` text NOT NULL,
  `time` int(11) NOT NULL,
  `rating` varchar(3) NOT NULL DEFAULT '0',
  `gol` text NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `size` int(11) NOT NULL DEFAULT '0',
  `login` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '1',
  `themeid` int(11) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pathid` (`pathid`),
  KEY `time` (`time`),
  KEY `type_status` (`type`,`status`),
  FULLTEXT KEY `desc` (`desc`),
  FULLTEXT KEY `way` (`way`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `downkomm`
-- 

DROP TABLE IF EXISTS `downkomm`;
CREATE TABLE `downkomm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `text` text NOT NULL,
  `plus` int(11) NOT NULL,
  `minus` int(11) NOT NULL,
  `golos` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------
-- 
-- Table structure for table `download`
-- 

DROP TABLE IF EXISTS `download`;
CREATE TABLE `download` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refid` int(11) NOT NULL DEFAULT '0',
  `adres` text NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `type` varchar(4) NOT NULL DEFAULT '',
  `avtor` varchar(25) NOT NULL DEFAULT '',
  `ip` text NOT NULL,
  `soft` text NOT NULL,
  `text` text NOT NULL,
  `screen` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `refid` (`refid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `downpath`
-- 

DROP TABLE IF EXISTS `downpath`;
CREATE TABLE `downpath` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `refid` int(11) NOT NULL,
  `way` text NOT NULL,
  `name` text NOT NULL,
  `desc` text NOT NULL,
  `position` int(11) NOT NULL,
  `dost` int(11) NOT NULL DEFAULT '0',
  `types` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ref` (`refid`),
  KEY `position` (`position`),
  FULLTEXT KEY `way` (`way`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------
-- 
-- Dumping data for table `downpath`
-- 

INSERT INTO `downpath` VALUES ('1','0','mp3/','Mp3','','0','0','all');
INSERT INTO `downpath` VALUES ('2','0','Video/','Video','','0','0','all');
INSERT INTO `downpath` VALUES ('3','1','mp3/Rap/','Rap Tracka','','0','0','all');
INSERT INTO `downpath` VALUES ('4','1','mp3/albom/','Audio Albomlar','','0','0','all');
INSERT INTO `downpath` VALUES ('5','1','mp3/minus/','Minuslar','','0','0','all');
INSERT INTO `downpath` VALUES ('6','1','mp3/Buyurtma/','Buyurtmalar','','0','0','all');

-- --------------------------------------------------------
-- 
-- Table structure for table `downscreen`
-- 

DROP TABLE IF EXISTS `downscreen`;
CREATE TABLE `downscreen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` int(11) NOT NULL,
  `way` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------
-- 
-- Table structure for table `forum`
-- 

DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `type` char(1) NOT NULL DEFAULT '',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `from` varchar(25) NOT NULL DEFAULT '',
  `realid` int(3) NOT NULL DEFAULT '0',
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `soft` text NOT NULL,
  `text` text NOT NULL,
  `close` tinyint(1) NOT NULL DEFAULT '0',
  `close_who` varchar(25) NOT NULL DEFAULT '',
  `vip` tinyint(1) NOT NULL DEFAULT '0',
  `edit` text NOT NULL,
  `tedit` int(10) unsigned NOT NULL DEFAULT '0',
  `kedit` int(2) unsigned NOT NULL DEFAULT '0',
  `curators` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refid` (`refid`),
  KEY `type` (`type`),
  KEY `time` (`time`),
  KEY `close` (`close`),
  KEY `user_id` (`user_id`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `gallery`
-- 

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE `gallery` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refid` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `type` varchar(2) NOT NULL DEFAULT '',
  `avtor` varchar(25) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `name` text NOT NULL,
  `user` binary(1) NOT NULL DEFAULT '\0',
  `ip` text NOT NULL,
  `soft` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refid` (`refid`),
  KEY `type` (`type`),
  KEY `time` (`time`),
  KEY `avtor` (`avtor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `guest`
-- 

DROP TABLE IF EXISTS `guest`;
CREATE TABLE `guest` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adm` tinyint(1) NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(25) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `browser` tinytext NOT NULL,
  `admin` varchar(25) NOT NULL DEFAULT '',
  `otvet` text NOT NULL,
  `otime` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_who` varchar(20) NOT NULL DEFAULT '',
  `edit_time` int(10) unsigned NOT NULL DEFAULT '0',
  `edit_count` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `ip` (`ip`),
  KEY `adm` (`adm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `karma_users`
-- 

DROP TABLE IF EXISTS `karma_users`;
CREATE TABLE `karma_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `karma_user` int(10) unsigned NOT NULL DEFAULT '0',
  `points` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `karma_user` (`karma_user`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `library_cats`
-- 

DROP TABLE IF EXISTS `library_cats`;
CREATE TABLE `library_cats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `dir` tinyint(1) NOT NULL DEFAULT '0',
  `pos` int(10) unsigned NOT NULL DEFAULT '0',
  `user_add` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `library_cats`
-- 

INSERT INTO `library_cats` VALUES ('1','0','Rap Text','','0','1','0');
INSERT INTO `library_cats` VALUES ('2','0','Biografiya','','0','2','0');

-- --------------------------------------------------------
-- 
-- Table structure for table `library_tags`
-- 

DROP TABLE IF EXISTS `library_tags`;
CREATE TABLE `library_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lib_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `lib_text_id` (`lib_text_id`),
  KEY `tag_name` (`tag_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `library_texts`
-- 

DROP TABLE IF EXISTS `library_texts`;
CREATE TABLE `library_texts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_id` int(10) unsigned NOT NULL DEFAULT '0',
  `text` mediumtext NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `announce` text,
  `uploader` varchar(100) NOT NULL DEFAULT '',
  `uploader_id` int(10) unsigned NOT NULL DEFAULT '0',
  `count_views` int(10) unsigned NOT NULL DEFAULT '0',
  `premod` tinyint(1) NOT NULL DEFAULT '0',
  `comments` tinyint(1) NOT NULL DEFAULT '0',
  `count_comments` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `text` (`text`,`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `news`
-- 

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `avt` varchar(25) NOT NULL DEFAULT '',
  `name` text NOT NULL,
  `text` text NOT NULL,
  `kom` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `users`
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL DEFAULT '',
  `name_lat` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `rights` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `failed_login` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `imname` varchar(50) NOT NULL DEFAULT '',
  `sex` varchar(2) NOT NULL DEFAULT '',
  `komm` int(10) unsigned NOT NULL DEFAULT '0',
  `postforum` int(10) unsigned NOT NULL DEFAULT '0',
  `postguest` int(10) unsigned NOT NULL DEFAULT '0',
  `yearofbirth` int(4) NOT NULL DEFAULT '0',
  `datereg` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `mail` varchar(50) NOT NULL DEFAULT '',
  `icq` int(10) unsigned NOT NULL DEFAULT '0',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `jabber` varchar(50) NOT NULL DEFAULT '',
  `www` varchar(50) NOT NULL DEFAULT '',
  `about` text NOT NULL,
  `live` varchar(100) NOT NULL DEFAULT '',
  `mibile` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT '',
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `browser` text NOT NULL,
  `preg` tinyint(1) NOT NULL DEFAULT '0',
  `regadm` varchar(25) NOT NULL DEFAULT '',
  `mailvis` tinyint(1) NOT NULL DEFAULT '0',
  `dayb` int(2) NOT NULL DEFAULT '0',
  `monthb` int(2) NOT NULL DEFAULT '0',
  `sestime` int(10) unsigned NOT NULL DEFAULT '0',
  `total_on_site` int(10) unsigned NOT NULL DEFAULT '0',
  `lastpost` int(10) unsigned NOT NULL DEFAULT '0',
  `rest_code` varchar(32) NOT NULL DEFAULT '',
  `rest_time` int(10) unsigned NOT NULL DEFAULT '0',
  `movings` int(10) unsigned NOT NULL DEFAULT '0',
  `place` varchar(30) NOT NULL DEFAULT '',
  `set_user` text NOT NULL,
  `set_forum` text NOT NULL,
  `set_mail` text NOT NULL,
  `karma_plus` int(11) NOT NULL DEFAULT '0',
  `karma_minus` int(11) NOT NULL DEFAULT '0',
  `karma_time` int(10) unsigned NOT NULL DEFAULT '0',
  `karma_off` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `comm_count` int(10) unsigned NOT NULL DEFAULT '0',
  `comm_old` int(10) unsigned NOT NULL DEFAULT '0',
  `smileys` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_lat` (`name_lat`),
  KEY `lastdate` (`lastdate`),
  KEY `place` (`place`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` VALUES ('1','admin','admin','5cb45b85e3aa6ae16ac66e57377299c8','9','0','','m','0','0','0','0','1549215954','1549259104','@','0','','','http://daviuz.xvest.ru','','','','','184804003','3161573348','UCWEB/2.0 (MIDP-2.0; U; Adr 7.1.2; ru; Redmi_4X) U2/1.0.0 UCBrowser/11.0.6.1040 U2/1.0.0 Mobile','1','','0','0','0','1549258760','1885','1549259079','','0','12','mainpage','','','','0','0','1549215960','0','0','0','');
