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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `cms_album_downloads`;

CREATE TABLE `cms_album_downloads` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `cms_album_views`;

CREATE TABLE `cms_album_views` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `cms_album_votes`;

CREATE TABLE `cms_album_votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `vote` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `file_id` (`file_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `cms_forum_rdm`;

CREATE TABLE `cms_forum_rdm` (
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`,`user_id`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `cms_forum_vote_users`;

CREATE TABLE `cms_forum_vote_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `topic` int(11) NOT NULL,
  `vote` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic` (`topic`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `cms_library_rating`;

CREATE TABLE `cms_library_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `st_id` int(11) NOT NULL,
  `point` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`st_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `cms_news`;

CREATE TABLE `cms_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time` (`time`),
  KEY `refid` (`refid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

INSERT INTO cms_news VALUES("1","1","Test","Test","1","1484866833");
INSERT INTO cms_news VALUES("2","1","Shohruxxonning onasi Zebo Navro‘zova kelinlari Asal va Xumoraxonni ko‘p marta sinovdan o‘tkazgan","Ikki kelinning qaynonasi, Muhammadrizgar ismli shiringina bolakayning buvijonisi bo‘lgan rejissor Zebo Navro‘zova qaynona-kelin munosabatlari haqidagi fikrlari bilan o‘rtoqlashdi. Bu haqda “Sug‘diyona” gazetasiga tayanib, “Darakchi.uz” xabar bermoqda.\r\n\r\n“Har bir ona, kezi kelganda farzandini-da sinab turadi. Kelinlar ham o‘z bolamiz. Shuning uchun imtihonimizdan o‘tishga majbur. Axir, o‘rgatganlarimiz qulog‘iga kirdimi, qo‘lidan keladimi yo‘qmi, bilib olishimiz kerak-ku. Masalan, o‘zim kelinlarimni ko‘p bora sinovdan o‘tkazganman.\r\n\r\nXonadonimizda bir qonun bor. Har qanday sharoit va kayfiyatda ham inson, albatta kulib turishi shart. Chunki ishdan charchab kelgan inson ana shu tabassumga qarab chalg‘iydi. Bu borada kelinim Xumoraxonni ham, Asalni ham har xil vaziyatlar bilan tekshirib ko‘rganman. Ikkalasi ham imtihondan a’lo baho bilan o‘tishganidan xursandman”, — deydi Zebo Navro‘zova.","1","1484875312");



DROP TABLE IF EXISTS `cms_news_cat`;

CREATE TABLE `cms_news_cat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `realid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL,
  `desc_enable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `realid` (`realid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO cms_news_cat VALUES("1","1","Новости шоу-бизнеса","0");



DROP TABLE IF EXISTS `cms_news_comments`;

CREATE TABLE `cms_news_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `refid` int(10) unsigned NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `text` text NOT NULL,
  `reply` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `refid` (`refid`),
  KEY `time` (`time`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




DROP TABLE IF EXISTS `cms_news_rating`;

CREATE TABLE `cms_news_rating` (
  `id_rate` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `news` int(11) NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `golos` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id_rate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

INSERT INTO cms_sessions VALUES("029c5a677af57a042e63bb2da0b3d330","2996475141","0","Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)","1484826448","1484826448","0","0","load");
INSERT INTO cms_sessions VALUES("7920fec01c4f93ea814d12328b3a0bd1","2366145599","0","Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)","1484855069","1484855069","0","0","guestbook");
INSERT INTO cms_sessions VALUES("e4796f6c4916b6491b7a454fffcfd943","3156460225","0","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.100 YaBrowser/16.11.1.673 Yowser/2.5 Safari/537.36","1484856190","1484856079","0","9","login");
INSERT INTO cms_sessions VALUES("4ae78f41d07afc895d95efca7fbdec2b","3156460225","0","Mozilla/5.0 (iPhone; CPU iPhone OS 10_1_1 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) YaBrowser/16.11.1.716.10 Mobile/14B100 Safari/602.1","1484856343","1484856343","0","1","login");
INSERT INTO cms_sessions VALUES("a72c89991ada7dab78e99e68cd0f2de2","2834026153","3588639371","Mozilla/5.0 (Linux; U; Android 4.2.2; en-US; C2305 Build/16.0.B.2.16) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.8.8.730 U3/0.8.0","1484890688","1484890688","0","0","mainpage");
INSERT INTO cms_sessions VALUES("1fe79670d9147ce47986643e61d61cbc","3588639371","0","Mozilla/5.0 (Linux; U; Android 4.2.2; en-US; C2305 Build/16.0.B.2.16) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.8.8.730 U3/0.8.0","1484890696","1484890696","0","0","mainpage");
INSERT INTO cms_sessions VALUES("8fb5b1bd9b863dda9cec01175b9ec584","2956659332","0","Mozilla/5.0 (Linux; Android 5.0.2; SAMSUNG SM-G530H Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/3.3 Chrome/38.0.2125.102 Mobil","1484891022","1484890833","0","7","mainpage");
INSERT INTO cms_sessions VALUES("53d9915e3fd7d8ee67f37f44e56923e3","136702631","3161584684","Mozilla/5.0 (Linux; U; Android 4.4.4; en-US; GT-I9060I Build/KTU84P) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.2.0.535 U3/0.8.0 ","1484890838","1484890838","0","0","mainpage");
INSERT INTO cms_sessions VALUES("fef06b694156373debad98c74a4fa817","3104210116","0","Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36","1484896343","1484896343","0","1","mainpage");
INSERT INTO cms_sessions VALUES("7fa568254c44d8ba473d0cef8d44d352","2365591378","3161572700","Opera Mini: Nokia2700c-2","1484893484","1484893484","0","1","mainpage");
INSERT INTO cms_sessions VALUES("f1662e03f29746451e6877c68c013353","2365591358","1412854500","Opera Mini: Nokia6303iclassic/09.83","1484892988","1484892988","0","0","mainpage");
INSERT INTO cms_sessions VALUES("d9536ef58d3547394a9e99b376d3d555","1385291407","1541254881","Opera Mini: Mozilla/5.0 (Linux; U; Android 4.1.2; ru-ru; GT-S7262 Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30","1484893368","1484893368","0","0","mainpage");
INSERT INTO cms_sessions VALUES("f23d15d245c9e1063a1515ba2e500c5e","2366148243","0","Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)","1484894008","1484894008","0","0","mainpage");
INSERT INTO cms_sessions VALUES("354dc841169692ceed9c71e58228f778","788251412","0","Opera/9.80 (Windows NT 6.1; U; MRA 6.5 (build 9316); ru) Presto/2.7.62 Version/11.00","1484894698","1484894698","0","0","mainpage");



DROP TABLE IF EXISTS `cms_settings`;

CREATE TABLE `cms_settings` (
  `key` tinytext NOT NULL,
  `val` text NOT NULL,
  PRIMARY KEY (`key`(30))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

INSERT INTO cms_settings VALUES("active","1");
INSERT INTO cms_settings VALUES("admp","panel");
INSERT INTO cms_settings VALUES("antiflood","a:5:{s:4:\"mode\";i:2;s:3:\"day\";i:10;s:5:\"night\";i:30;s:7:\"dayfrom\";i:10;s:5:\"dayto\";i:22;}");
INSERT INTO cms_settings VALUES("clean_time","1484823150");
INSERT INTO cms_settings VALUES("copyright","Voydoda.com");
INSERT INTO cms_settings VALUES("email","islomby@bk.ru");
INSERT INTO cms_settings VALUES("flsz","4000");
INSERT INTO cms_settings VALUES("gzip","1");
INSERT INTO cms_settings VALUES("homeurl","http://bekmusic.keo.su");
INSERT INTO cms_settings VALUES("karma","a:6:{s:12:\"karma_points\";i:5;s:10:\"karma_time\";i:86400;s:5:\"forum\";i:20;s:4:\"time\";i:0;s:2:\"on\";i:1;s:3:\"adm\";i:0;}");
INSERT INTO cms_settings VALUES("lng","ru");
INSERT INTO cms_settings VALUES("mod_reg","2");
INSERT INTO cms_settings VALUES("mod_forum","2");
INSERT INTO cms_settings VALUES("mod_guest","2");
INSERT INTO cms_settings VALUES("mod_lib","2");
INSERT INTO cms_settings VALUES("mod_gal","2");
INSERT INTO cms_settings VALUES("mod_down_comm","1");
INSERT INTO cms_settings VALUES("mod_down","2");
INSERT INTO cms_settings VALUES("mod_lib_comm","1");
INSERT INTO cms_settings VALUES("mod_gal_comm","1");
INSERT INTO cms_settings VALUES("meta_desc","");
INSERT INTO cms_settings VALUES("meta_key","");
INSERT INTO cms_settings VALUES("news","a:8:{s:4:\"view\";i:1;s:4:\"size\";i:200;s:8:\"quantity\";i:5;s:4:\"days\";i:3;s:6:\"breaks\";i:1;s:7:\"smileys\";i:1;s:4:\"tags\";i:1;s:3:\"kom\";i:1;}");
INSERT INTO cms_settings VALUES("reg_message","");
INSERT INTO cms_settings VALUES("setting_mail","");
INSERT INTO cms_settings VALUES("skindef","bekislom");
INSERT INTO cms_settings VALUES("them_message","");
INSERT INTO cms_settings VALUES("timeshift","5");
INSERT INTO cms_settings VALUES("site_access","2");



DROP TABLE IF EXISTS `cms_users_data`;

CREATE TABLE `cms_users_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `key` varchar(30) NOT NULL DEFAULT '',
  `val` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO cms_users_iphistory VALUES("1","1","1578743554","0","1484823248");
INSERT INTO cms_users_iphistory VALUES("2","1","3156460225","0","1484858066");
INSERT INTO cms_users_iphistory VALUES("3","1","1578743381","0","1484859177");
INSERT INTO cms_users_iphistory VALUES("4","1","1578743370","0","1484891130");



DROP TABLE IF EXISTS `down_bookmarks`;

CREATE TABLE `down_bookmarks` (
  `user` int(11) NOT NULL,
  `file` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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

INSERT INTO downpath VALUES("1","0","music/","Музыка","","0","0",".mp3");
INSERT INTO downpath VALUES("2","0","clip/","Клипы","","0","0",".3gp, .mp4, .avi");
INSERT INTO downpath VALUES("3","0","kino/","Кино, Сериал, Трейлер","","0","0",".3gp, .mp4, .avi");
INSERT INTO downpath VALUES("4","0","zakaz/","Готовые заказы","","0","0","all");
INSERT INTO downpath VALUES("5","0","photos/","Фотогалерея","","0","0",".jpg, .gif, .png, .jpeg");
INSERT INTO downpath VALUES("6","0","gruz/","Бесплатные загрузки","","0","0","all");



DROP TABLE IF EXISTS `downscreen`;

CREATE TABLE `downscreen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileid` int(11) NOT NULL,
  `way` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `library_tags`;

CREATE TABLE `library_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lib_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `tag_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `lib_text_id` (`lib_text_id`),
  KEY `tag_name` (`tag_name`(250))
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `avt` varchar(25) NOT NULL DEFAULT '',
  `name` text NOT NULL,
  `text` text NOT NULL,
  `kom` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;




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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

INSERT INTO users VALUES("1","Admin","admin","2f8c5be0ecbfb8e701021b681a9668f7","9","0","","m","0","0","0","0","1484823147","1484893131","islomby@bk.ru","0","","","http://bekmusic.keo.su","","","","","1578741780","0","Mozilla/5.0 (iPhone; CPU iPhone OS 10_1_1 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) YaBrowser/16.11.1.716.10 Mobile/14B100 Safari/602.1","1","","0","0","0","1484893131","1218","0","","0","0","mainpage","","","","0","0","1484823161","0","0","0","");



