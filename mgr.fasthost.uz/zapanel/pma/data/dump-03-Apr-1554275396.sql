-- Wap PhpMyAdmin 211
-- http://master-land.net/phpmyadmin 
-- Generation Time: 2019-04-03 10:09
-- MySQL Server Version: 5.5.60-MariaDB-cll-lve
-- PHP Version: 5.6.40

-- Database: `beruniy_uz`


-- --------------------------------------------------------
-- 
-- Table structure for table `cms_album_comments`
-- 

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_album_downloads`
-- 

CREATE TABLE `cms_album_downloads` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_album_downloads`
-- 

INSERT INTO `cms_album_downloads` VALUES ('119','1','1553161707');

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_album_files`
-- 

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_album_files`
-- 

INSERT INTO `cms_album_files` VALUES ('1','119','2','','img_1553161694.jpg','tmb_1553161694.jpg','1553161695','1','0','4','0','0','1','1','0');
INSERT INTO `cms_album_files` VALUES ('2','141','3','chempion','img_1553316933.jpg','tmb_1553316934.jpg','1553316934','1','0','4','0','0','1','0','0');
INSERT INTO `cms_album_files` VALUES ('3','141','3','','img_1553317169.jpg','tmb_1553317171.jpg','1553317171','1','0','4','0','0','0','0','0');

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_album_views`
-- 

CREATE TABLE `cms_album_views` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_album_views`
-- 

INSERT INTO `cms_album_views` VALUES ('119','1','1553161825');
INSERT INTO `cms_album_views` VALUES ('141','2','1553316971');

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_album_votes`
-- 

CREATE TABLE `cms_album_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vote` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_ban_ip`
-- 

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_ban_ip`
-- 

INSERT INTO `cms_ban_ip` VALUES ('1','628019840','628019840','3','','Beruniy_No1','','1553753405');

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_ban_users`
-- 

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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_ban_users`
-- 

INSERT INTO `cms_ban_users` VALUES ('28','135','1868466765','1553106765','1','admin','0','ochilmasin','');
INSERT INTO `cms_ban_users` VALUES ('29','120','1553272343','1553229143','1','admin','0','dam ol','');
INSERT INTO `cms_ban_users` VALUES ('34','159','1869132757','1553772757','1','Beruniy_No1','0','Sabab ko\'rsatilmadi','');
INSERT INTO `cms_ban_users` VALUES ('35','130','1554037216','1554036496','1','Beruniy_No1','0','uzur','');
INSERT INTO `cms_ban_users` VALUES ('36','200','1554037735','1554037015','1','Beruniy_No1','0','sabab','');
INSERT INTO `cms_ban_users` VALUES ('37','130','1869412079','1554052079','1','Beruniy_No1','0','bolmadi endi','');

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_contact`
-- 

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
) ENGINE=MyISAM AUTO_INCREMENT=645 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_contact`
-- 

INSERT INTO `cms_contact` VALUES ('366','121','119','1552917377','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('367','119','121','1552917377','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('368','119','123','1552928242','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('369','123','119','1552928242','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('370','126','119','1552976028','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('371','119','126','1552976028','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('372','124','119','1553196211','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('373','119','124','1553196211','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('374','135','119','1553098314','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('375','119','135','1553098314','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('392','143','133','1553163776','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('394','143','147','1553164830','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('550','186','124','1553711946','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('549','162','186','1553872856','2','1','0','0');
INSERT INTO `cms_contact` VALUES ('380','131','119','1553077732','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('381','119','131','1553077732','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('382','137','119','1553244445','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('383','119','137','1553244445','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('384','119','147','1553161179','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('385','147','119','1553161179','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('391','119','133','1553165192','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('395','147','143','1553164830','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('393','133','143','1553163776','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('390','133','119','1553165192','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('396','147','121','1553167927','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('397','121','147','1553167927','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('398','144','126','1553170214','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('399','126','144','1553170214','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('400','127','119','1553175972','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('401','119','127','1553175972','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('402','124','133','1553191895','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('403','133','124','1553191895','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('404','120','119','1553228576','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('405','119','120','1553228576','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('406','119','143','1553231058','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('407','143','119','1553231058','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('416','1','141','1553651737','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('415','119','151','1553247356','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('417','141','1','1553651737','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('414','151','119','1553247356','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('418','1','132','1553531559','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('419','132','1','1553531559','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('420','132','141','1553268358','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('421','141','132','1553268358','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('422','132','2','1553268748','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('423','2','132','1553268748','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('424','132','133','1553268870','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('425','133','132','1553268870','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('426','132','155','1553269752','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('427','155','132','1553269752','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('428','156','129','1553272366','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('429','129','156','1553272366','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('430','1','137','1554125506','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('431','137','1','1554125506','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('432','156','1','1553275300','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('433','1','156','1553275300','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('548','186','162','1553872856','2','1','0','0');
INSERT INTO `cms_contact` VALUES ('551','124','186','1553711946','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('436','157','1','1553351310','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('437','1','157','1553351310','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('438','121','1','1554051623','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('439','1','121','1554051623','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('440','162','1','1554136243','2','1','0','0');
INSERT INTO `cms_contact` VALUES ('441','1','162','1554137957','2','1','0','0');
INSERT INTO `cms_contact` VALUES ('442','155','1','1554044594','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('443','1','155','1554044594','2','0','0','0');
INSERT INTO `cms_contact` VALUES ('444','124','129','1553355246','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('445','129','124','1553355246','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('446','143','1','1554010257','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('447','1','143','1554010257','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('448','143','125','1553355256','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('449','125','143','1553355256','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('450','143','141','1553355115','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('451','141','143','1553355115','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('452','143','137','1553355370','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('453','137','143','1553355370','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('454','124','141','1553365575','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('455','141','124','1553365575','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('456','123','162','1553686392','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('457','162','123','1553686392','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('458','168','149','1553451691','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('459','149','168','1553451691','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('460','1','168','1553358355','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('461','168','1','1553358355','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('462','132','143','1553359238','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('463','143','132','1553359238','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('464','132','126','1553359256','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('465','126','132','1553359256','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('466','132','121','1553359275','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('467','121','132','1553359275','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('468','132','125','1553359294','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('469','125','132','1553359294','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('470','132','144','1553359316','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('471','144','132','1553359316','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('472','132','162','1553613314','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('473','162','132','1553613314','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('474','132','124','1553359352','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('475','124','132','1553359352','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('476','141','155','1553620994','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('477','155','141','1553620994','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('478','141','129','1553363181','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('479','129','141','1553363181','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('480','141','123','1553363219','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('481','123','141','1553363219','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('482','1','123','1553771720','2','0','0','0');
INSERT INTO `cms_contact` VALUES ('483','123','1','1553624593','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('484','1','125','1553365707','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('485','125','1','1553365707','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('486','143','155','1554027113','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('487','155','143','1554027113','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('488','124','167','1553366538','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('489','167','124','1553366538','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('490','174','164','1553385283','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('491','164','174','1553385283','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('492','176','1','1553415074','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('493','1','176','1553415074','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('494','126','1','1554037627','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('596','196','126','1553962050','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('496','2','1','1554112218','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('497','1','2','1554112218','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('498','162','155','1553433244','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('499','155','162','1553433244','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('500','141','162','1553421558','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('501','162','141','1553421558','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('502','2','121','1553482532','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('503','121','2','1553482532','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('504','155','2','1553621059','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('505','2','155','1553621059','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('506','124','1','1553769408','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('507','1','124','1553769408','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('508','1','177','1554274223','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('509','177','1','1554274223','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('510','180','1','1553540817','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('511','1','180','1553540817','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('512','180','2','1553446692','2','0','0','0');
INSERT INTO `cms_contact` VALUES ('513','2','180','1553446692','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('514','137','141','1553466553','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('515','141','137','1553466553','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('516','173','1','1553494677','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('517','1','173','1553494677','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('518','2','182','1553513702','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('519','182','2','1553513702','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('520','162','153','1553777255','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('521','153','162','1553777255','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('522','134','153','1553526517','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('523','153','134','1553526517','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('524','177','143','1553585835','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('525','143','177','1553585835','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('526','155','123','1553600360','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('527','123','155','1553600360','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('528','126','162','1553961942','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('529','162','126','1553961942','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('530','124','162','1553796113','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('531','162','124','1553796113','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('532','132','169','1553612957','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('533','169','132','1553612957','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('534','132','123','1553613051','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('535','123','132','1553613051','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('536','132','153','1553613502','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('537','153','132','1553613502','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('538','132','137','1553613742','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('539','137','132','1553613742','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('540','153','1','1554045125','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('541','1','153','1554045125','2','0','0','0');
INSERT INTO `cms_contact` VALUES ('542','153','155','1553622598','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('543','155','153','1553622598','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('544','155','124','1553623386','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('545','124','155','1553623386','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('546','186','1','1554051180','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('547','1','186','1554051180','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('552','137','123','1553672934','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('553','123','137','1553672934','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('554','186','155','1553871391','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('555','155','186','1553871391','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('556','186','123','1553669420','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('557','123','186','1553669420','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('558','162','2','1553972608','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('559','2','162','1553972608','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('560','124','123','1553673956','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('561','123','124','1553673956','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('562','188','1','1553945754','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('563','1','188','1553945754','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('564','124','159','1553686479','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('565','159','124','1553686479','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('566','186','188','1553704191','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('567','188','186','1553704191','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('568','129','1','1553709925','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('569','1','129','1553709925','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('570','130','162','1553972793','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('571','162','130','1553972793','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('572','126','186','1553915877','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('573','186','126','1553915877','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('574','123','129','1553739154','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('575','129','123','1553739154','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('576','134','186','1553751356','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('577','186','134','1553751356','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('578','134','1','1553749488','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('579','1','134','1553749488','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('580','130','1','1554047267','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('581','1','130','1554047267','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('582','143','162','1554012696','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('583','162','143','1554012696','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('584','199','1','1553867491','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('585','1','199','1553867491','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('586','162','177','1553965110','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('587','177','162','1553965110','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('588','200','1','1553881509','2','1','0','0');
INSERT INTO `cms_contact` VALUES ('589','1','200','1553881509','2','1','0','0');
INSERT INTO `cms_contact` VALUES ('590','143','126','1553964199','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('591','126','143','1553964199','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('592','168','199','1553925642','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('593','199','168','1553925642','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('594','144','179','1553955910','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('595','179','144','1553955910','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('597','126','196','1553962050','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('598','1','126','1554037627','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('599','137','126','1553962664','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('600','126','137','1553962664','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('601','153','141','1553963598','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('602','141','153','1553963598','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('603','137','153','1553967037','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('604','153','137','1553967037','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('605','153','143','1553966042','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('606','143','153','1553966042','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('607','162','156','1554012057','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('608','156','162','1554012057','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('609','2','143','1554020062','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('610','143','2','1554020062','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('611','130','137','1554051763','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('612','137','130','1554051763','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('613','130','198','1553974632','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('614','198','130','1553974632','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('615','137','177','1554108743','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('616','177','137','1554108743','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('617','162','121','1554017848','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('618','121','162','1554017848','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('619','162','202','1554012081','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('620','202','162','1554012081','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('621','162','198','1554012107','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('622','198','162','1554012107','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('623','153','177','1554046702','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('624','177','153','1554046702','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('625','143','124','1554019125','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('626','124','143','1554019125','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('627','168','177','1554137511','2','0','0','0');
INSERT INTO `cms_contact` VALUES ('628','177','168','1554137489','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('629','162','203','1554020684','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('630','203','162','1554020684','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('631','162','133','1554023668','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('632','133','162','1554023668','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('633','130','143','1554029121','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('634','143','130','1554029121','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('635','205','1','1554036308','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('636','1','205','1554036308','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('637','205','126','1554033608','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('638','126','205','1554033608','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('639','130','153','1554047018','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('640','153','130','1554047018','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('641','130','205','1554049726','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('642','205','130','1554049726','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('643','130','121','1554051419','1','0','0','0');
INSERT INTO `cms_contact` VALUES ('644','121','130','1554051419','1','0','0','0');

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_counters`
-- 

CREATE TABLE `cms_counters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sort` int(10) NOT NULL DEFAULT '1',
  `name` varchar(30) NOT NULL,
  `link1` text NOT NULL,
  `link2` text NOT NULL,
  `mode` tinyint(4) NOT NULL DEFAULT '1',
  `switch` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_counters`
-- 

INSERT INTO `cms_counters` VALUES ('4','1','Bbht','<a href="https://uzmasters.ru/rating/go.php?id=1116"><img src="https://uzmasters.ru/rating/big.php?id=1116" alt="UzMasterS.Ru"></a>\'','','2','0');

-- --------------------------------------------------------
-- 
-- Table structure for table `cms_forum_files`
-- 

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------
-- 
-- Dumping data for table `cms_forum_files`
-- 

INSERT INTO `cms_forum_files` VALUES ('1','11','15','16','18','1553162184','img_20190321_144454.jpg','5','1','0');
