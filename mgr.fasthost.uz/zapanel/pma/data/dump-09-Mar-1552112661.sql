-- Wap PhpMyAdmin 211
-- http://master-land.net/phpmyadmin 
-- Generation Time: 2019-03-09 09:24
-- MySQL Server Version: 5.5.60-MariaDB-cll-lve
-- PHP Version: 5.6.40

-- Database: `999727070_test`


-- --------------------------------------------------------
-- 
-- Table structure for table `admin_log`
-- 

CREATE TABLE `admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL,
  `mod` int(11) NOT NULL,
  `act` int(11) NOT NULL,
  `opis` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mod` (`mod`),
  KEY `act` (`act`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `admin_log_act`
-- 

CREATE TABLE `admin_log_act` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mod` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `act` (`name`),
  KEY `id_mod` (`id_mod`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `admin_log_mod`
-- 

CREATE TABLE `admin_log_mod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `all_accesses`
-- 

CREATE TABLE `all_accesses` (
  `type` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `all_accesses`
-- 

INSERT INTO `all_accesses` VALUES ('adm_panel_show','Админка - доступ к разделам админки');
INSERT INTO `all_accesses` VALUES ('loads_file_upload','Загрузки - выгрузка файлов');
INSERT INTO `all_accesses` VALUES ('loads_dir_mesto','Загрузки - перемещение папок');
INSERT INTO `all_accesses` VALUES ('loads_dir_delete','Загрузки - удаление папок');
INSERT INTO `all_accesses` VALUES ('loads_dir_rename','Загрузки - переименование папок');
INSERT INTO `all_accesses` VALUES ('loads_dir_create','Загрузки - создание папок');
INSERT INTO `all_accesses` VALUES ('loads_file_edit','Загрузки - параметры файлов');
INSERT INTO `all_accesses` VALUES ('loads_file_delete','Загрузки - удаление файлов');
INSERT INTO `all_accesses` VALUES ('loads_unzip','Загрузки - Распаковка ZIP');
INSERT INTO `all_accesses` VALUES ('lib_stat_zip','Библиотека - выгрузка статей в ZIP');
INSERT INTO `all_accesses` VALUES ('lib_stat_txt','Библиотека - выгрузка статей в txt');
INSERT INTO `all_accesses` VALUES ('lib_stat_create','Библиотека - создание статей');
INSERT INTO `all_accesses` VALUES ('lib_dir_delete','Библиотека - удаление папок');
INSERT INTO `all_accesses` VALUES ('lib_dir_mesto','Библиотека - перемещение папок');
INSERT INTO `all_accesses` VALUES ('lib_dir_edit','Библиотека - редактирование папок');
INSERT INTO `all_accesses` VALUES ('lib_dir_create','Библиотека - создание папок');
INSERT INTO `all_accesses` VALUES ('lib_stat_delete','Библиотека - удаление статей');
INSERT INTO `all_accesses` VALUES ('votes_settings','Голосования - закрытие/удаление');
INSERT INTO `all_accesses` VALUES ('votes_create','Голосования - создание');
INSERT INTO `all_accesses` VALUES ('guest_clear','Гостевая - очистка');
INSERT INTO `all_accesses` VALUES ('guest_delete','Гостевая - удаление постов');
INSERT INTO `all_accesses` VALUES ('obmen_dir_delete','Обменник - удаление папок');
INSERT INTO `all_accesses` VALUES ('obmen_dir_edit','Обменник - управление папками');
INSERT INTO `all_accesses` VALUES ('obmen_dir_create','Обменник - создание папок');
INSERT INTO `all_accesses` VALUES ('obmen_file_delete','Обменник - удаление файлов');
INSERT INTO `all_accesses` VALUES ('obmen_file_edit','Обменник - редактирование файлов');
INSERT INTO `all_accesses` VALUES ('obmen_komm_del','Обменник - удаление комментариев');
INSERT INTO `all_accesses` VALUES ('foto_foto_edit','Фотогалерея - редактирование/удаление фото');
INSERT INTO `all_accesses` VALUES ('foto_alb_del','Фотогалерея - удаление альбомов');
INSERT INTO `all_accesses` VALUES ('foto_komm_del','Фотогалерея - удаление комментариев');
INSERT INTO `all_accesses` VALUES ('forum_razd_create','Форум - создание разделов');
INSERT INTO `all_accesses` VALUES ('forum_for_delete','Форум - удаление подфорумов');
INSERT INTO `all_accesses` VALUES ('forum_for_edit','Форум - редактирование подфорумов');
INSERT INTO `all_accesses` VALUES ('forum_for_create','Форум - создание подфорумов');
INSERT INTO `all_accesses` VALUES ('forum_razd_edit','Форум - управление разделами');
INSERT INTO `all_accesses` VALUES ('adm_info','Админка - общая информация');
INSERT INTO `all_accesses` VALUES ('forum_them_edit','Форум - редактирование тем');
INSERT INTO `all_accesses` VALUES ('forum_them_del','Форум - удаление тем');
INSERT INTO `all_accesses` VALUES ('forum_post_ed','Форум - редактирование сообщений');
INSERT INTO `all_accesses` VALUES ('chat_clear','Чат - очистка');
INSERT INTO `all_accesses` VALUES ('chat_room','Чат - управление комнатами');
INSERT INTO `all_accesses` VALUES ('adm_statistic','Админка - статистика');
INSERT INTO `all_accesses` VALUES ('adm_banlist','Админка - список забаненых');
INSERT INTO `all_accesses` VALUES ('adm_menu','Админка - главное меню');
INSERT INTO `all_accesses` VALUES ('adm_news','Админка - новости');
INSERT INTO `all_accesses` VALUES ('adm_rekl','Админка - реклама');
INSERT INTO `all_accesses` VALUES ('adm_set_sys','Админка - настройки системы');
INSERT INTO `all_accesses` VALUES ('adm_set_loads','Админка - настройки загруз-центра');
INSERT INTO `all_accesses` VALUES ('adm_set_user','Админка - пользовательские настройки');
INSERT INTO `all_accesses` VALUES ('adm_set_chat','Админка - настройки чата');
INSERT INTO `all_accesses` VALUES ('adm_set_forum','Админка - настройки форума');
INSERT INTO `all_accesses` VALUES ('adm_set_foto','Админка - настройки фотогалереи');
INSERT INTO `all_accesses` VALUES ('adm_forum_sinc','Админка - синхронизация таблиц форума');
INSERT INTO `all_accesses` VALUES ('adm_themes','Админка - темы оформления');
INSERT INTO `all_accesses` VALUES ('adm_log_read','Админка - лог действий администрации');
INSERT INTO `all_accesses` VALUES ('adm_log_delete','Админка - удаление лога');
INSERT INTO `all_accesses` VALUES ('adm_mysql','Админка - MySQL запросы !!!');
INSERT INTO `all_accesses` VALUES ('adm_ref','Админка - рефералы');
INSERT INTO `all_accesses` VALUES ('adm_show_adm','Админка - список администрации');
INSERT INTO `all_accesses` VALUES ('adm_ip_edit','Админка - редактирование IP операторов');
INSERT INTO `all_accesses` VALUES ('adm_ban_ip','Админка - бан по IP');
INSERT INTO `all_accesses` VALUES ('adm_accesses','Привилегии групп пользователей !!!');
INSERT INTO `all_accesses` VALUES ('user_delete','Пользователи - удаление');
INSERT INTO `all_accesses` VALUES ('user_mass_delete','Пользователи - массовое удаление');
INSERT INTO `all_accesses` VALUES ('user_ban_set','Пользователи - бан');
INSERT INTO `all_accesses` VALUES ('user_ban_unset','Пользователи - снятие бана');
INSERT INTO `all_accesses` VALUES ('user_prof_edit','Пользователи - редактирование профиля');
INSERT INTO `all_accesses` VALUES ('user_collisions','Пользователи - совпадения ников');
INSERT INTO `all_accesses` VALUES ('user_show_ip','Пользователи - показывать IP');
INSERT INTO `all_accesses` VALUES ('user_show_ua','Пользователи - показ USER-AGENT');
INSERT INTO `all_accesses` VALUES ('user_show_add_info','Пользователи - показ доп. информации');
INSERT INTO `all_accesses` VALUES ('guest_show_ip','Гости - показ IP');
INSERT INTO `all_accesses` VALUES ('user_change_group','Пользователи - смена группы привилегий');
INSERT INTO `all_accesses` VALUES ('user_ban_set_h','Пользователи - бан (max 1 сутки)');
INSERT INTO `all_accesses` VALUES ('forum_post_close','Форум - возможность писать в закрытой теме');
INSERT INTO `all_accesses` VALUES ('user_change_nick','Пользователи - смена ника');
INSERT INTO `all_accesses` VALUES ('loads_file_import','Загрузки - импорт файлов');
INSERT INTO `all_accesses` VALUES ('adm_lib_repair','Восстановление библиотеки');
INSERT INTO `all_accesses` VALUES ('notes_edit','Дневники - редактирование');
INSERT INTO `all_accesses` VALUES ('notes_delete','Дневники - удаление');

-- --------------------------------------------------------
-- 
-- Table structure for table `ban`
-- 

CREATE TABLE `ban` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_ban` int(11) NOT NULL,
  `prich` varchar(1024) NOT NULL,
  `view` set('1','0') NOT NULL DEFAULT '0',
  `razdel` varchar(10) DEFAULT 'all',
  `post` int(1) DEFAULT '0',
  `pochemu` int(11) DEFAULT '0',
  `navsegda` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`,`id_ban`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `ban_ip`
-- 

CREATE TABLE `ban_ip` (
  `min` bigint(20) NOT NULL,
  `max` bigint(20) NOT NULL,
  KEY `min` (`min`,`max`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Table structure for table `smile`
-- 

CREATE TABLE `smile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smile` varchar(64) NOT NULL,
  `dir` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1187 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `smile`
-- 

INSERT INTO `smile` VALUES ('1184','.сердит.','21');
INSERT INTO `smile` VALUES ('1185',':)','21');
INSERT INTO `smile` VALUES ('331','=)','21');
INSERT INTO `smile` VALUES ('1168','.че.','21');
INSERT INTO `smile` VALUES ('1169',':(','21');
INSERT INTO `smile` VALUES ('1170',':D','21');
INSERT INTO `smile` VALUES ('1186','.язык.','21');
INSERT INTO `smile` VALUES ('1173','.миг.','21');
INSERT INTO `smile` VALUES ('1174','.крут.','21');
INSERT INTO `smile` VALUES ('1175','.секрет.','21');
INSERT INTO `smile` VALUES ('1182','.ах.','21');
INSERT INTO `smile` VALUES ('1183','.кисс.','21');

-- --------------------------------------------------------
-- 
-- Table structure for table `smile_dir`
-- 

CREATE TABLE `smile_dir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `opis` varchar(320) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `smile_dir`
-- 

INSERT INTO `smile_dir` VALUES ('21','Общие','');

-- --------------------------------------------------------
-- 
-- Table structure for table `user_group`
-- 

CREATE TABLE `user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `user_group`
-- 

INSERT INTO `user_group` VALUES ('1','Пользователь','0');
INSERT INTO `user_group` VALUES ('2','Модератор чата','1');
INSERT INTO `user_group` VALUES ('3','Модератор форума','1');
INSERT INTO `user_group` VALUES ('4','Модератор Зоны обмена','1');
INSERT INTO `user_group` VALUES ('5','Модератор библиотеки','1');
INSERT INTO `user_group` VALUES ('6','Модератор фотогалереи','1');
INSERT INTO `user_group` VALUES ('7','Модератор','2');
INSERT INTO `user_group` VALUES ('8','Администратор','3');
INSERT INTO `user_group` VALUES ('9','Главный администратор','9');
INSERT INTO `user_group` VALUES ('15','Создатель','10');
INSERT INTO `user_group` VALUES ('11','Модератор дневников','1');
INSERT INTO `user_group` VALUES ('12','Модератор гостевой','1');

-- --------------------------------------------------------
-- 
-- Table structure for table `user_group_access`
-- 

CREATE TABLE `user_group_access` (
  `id_group` int(10) unsigned NOT NULL,
  `id_access` varchar(32) NOT NULL,
  KEY `id_group` (`id_group`,`id_access`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
-- 
-- Dumping data for table `user_group_access`
-- 

INSERT INTO `user_group_access` VALUES ('2','adm_info');
INSERT INTO `user_group_access` VALUES ('2','adm_panel_show');
INSERT INTO `user_group_access` VALUES ('2','adm_ref');
INSERT INTO `user_group_access` VALUES ('2','adm_set_chat');
INSERT INTO `user_group_access` VALUES ('2','adm_show_adm');
INSERT INTO `user_group_access` VALUES ('2','adm_statistic');
INSERT INTO `user_group_access` VALUES ('2','chat_clear');
INSERT INTO `user_group_access` VALUES ('2','chat_room');
INSERT INTO `user_group_access` VALUES ('2','user_ban_set');
INSERT INTO `user_group_access` VALUES ('2','user_ban_set_h');
INSERT INTO `user_group_access` VALUES ('2','user_ban_unset');
INSERT INTO `user_group_access` VALUES ('2','user_prof_edit');
INSERT INTO `user_group_access` VALUES ('2','user_show_add_info');
INSERT INTO `user_group_access` VALUES ('2','user_show_ua');
INSERT INTO `user_group_access` VALUES ('3','adm_banlist');
INSERT INTO `user_group_access` VALUES ('3','adm_panel_show');
INSERT INTO `user_group_access` VALUES ('3','adm_set_forum');
INSERT INTO `user_group_access` VALUES ('3','adm_show_adm');
INSERT INTO `user_group_access` VALUES ('3','adm_statistic');
INSERT INTO `user_group_access` VALUES ('3','forum_for_edit');
INSERT INTO `user_group_access` VALUES ('3','forum_post_ed');
INSERT INTO `user_group_access` VALUES ('3','forum_razd_create');
INSERT INTO `user_group_access` VALUES ('3','forum_razd_edit');
INSERT INTO `user_group_access` VALUES ('3','forum_them_del');
INSERT INTO `user_group_access` VALUES ('3','forum_them_edit');
INSERT INTO `user_group_access` VALUES ('3','user_ban_set_h');
INSERT INTO `user_group_access` VALUES ('3','user_prof_edit');
INSERT INTO `user_group_access` VALUES ('3','user_show_add_info');
INSERT INTO `user_group_access` VALUES ('3','user_show_ip');
INSERT INTO `user_group_access` VALUES ('3','user_show_ua');
INSERT INTO `user_group_access` VALUES ('4','adm_info');
INSERT INTO `user_group_access` VALUES ('4','adm_panel_show');
INSERT INTO `user_group_access` VALUES ('4','adm_set_loads');
INSERT INTO `user_group_access` VALUES ('4','adm_show_adm');
INSERT INTO `user_group_access` VALUES ('4','adm_statistic');
INSERT INTO `user_group_access` VALUES ('4','loads_dir_create');
INSERT INTO `user_group_access` VALUES ('4','loads_dir_delete');
INSERT INTO `user_group_access` VALUES ('4','loads_dir_mesto');
INSERT INTO `user_group_access` VALUES ('4','loads_dir_rename');
INSERT INTO `user_group_access` VALUES ('4','loads_file_delete');
INSERT INTO `user_group_access` VALUES ('4','loads_file_edit');
INSERT INTO `user_group_access` VALUES ('4','loads_file_upload');
INSERT INTO `user_group_access` VALUES ('4','loads_unzip');
INSERT INTO `user_group_access` VALUES ('5','adm_info');
INSERT INTO `user_group_access` VALUES ('5','adm_lib_repair');
INSERT INTO `user_group_access` VALUES ('5','adm_panel_show');
INSERT INTO `user_group_access` VALUES ('5','adm_ref');
INSERT INTO `user_group_access` VALUES ('5','adm_set_foto');
INSERT INTO `user_group_access` VALUES ('5','adm_statistic');
INSERT INTO `user_group_access` VALUES ('5','lib_dir_create');
INSERT INTO `user_group_access` VALUES ('5','lib_dir_delete');
INSERT INTO `user_group_access` VALUES ('5','lib_dir_edit');
INSERT INTO `user_group_access` VALUES ('5','lib_dir_mesto');
INSERT INTO `user_group_access` VALUES ('5','lib_stat_create');
INSERT INTO `user_group_access` VALUES ('5','lib_stat_delete');
INSERT INTO `user_group_access` VALUES ('5','lib_stat_txt');
INSERT INTO `user_group_access` VALUES ('5','lib_stat_zip');
INSERT INTO `user_group_access` VALUES ('5','user_ban_set_h');
INSERT INTO `user_group_access` VALUES ('5','user_prof_edit');
INSERT INTO `user_group_access` VALUES ('6','adm_banlist');
INSERT INTO `user_group_access` VALUES ('6','adm_info');
INSERT INTO `user_group_access` VALUES ('6','adm_panel_show');
INSERT INTO `user_group_access` VALUES ('6','adm_set_foto');
INSERT INTO `user_group_access` VALUES ('6','adm_show_adm');
INSERT INTO `user_group_access` VALUES ('6','adm_statistic');
INSERT INTO `user_group_access` VALUES ('6','foto_alb_del');
INSERT INTO `user_group_access` VALUES ('6','foto_foto_edit');
INSERT INTO `user_group_access` VALUES ('6','foto_komm_del');
INSERT INTO `user_group_access` VALUES ('6','user_ban_set_h');
INSERT INTO `user_group_access` VALUES ('6','user_show_ua');
INSERT INTO `user_group_access` VALUES ('7','adm_banlist');
INSERT INTO `user_group_access` VALUES ('7','adm_lib_repair');
INSERT INTO `user_group_access` VALUES ('7','adm_panel_show');
INSERT INTO `user_group_access` VALUES ('7','adm_set_chat');
INSERT INTO `user_group_access` VALUES ('7','adm_set_forum');
INSERT INTO `user_group_access` VALUES ('7','adm_set_foto');
INSERT INTO `user_group_access` VALUES ('7','adm_statistic');
INSERT INTO `user_group_access` VALUES ('7','chat_clear');
INSERT INTO `user_group_access` VALUES ('7','chat_room');
INSERT INTO `user_group_access` VALUES ('7','forum_post_close');
INSERT INTO `user_group_access` VALUES ('7','forum_post_ed');
INSERT INTO `user_group_access` VALUES ('7','forum_razd_create');
INSERT INTO `user_group_access` VALUES ('7','forum_razd_edit');
INSERT INTO `user_group_access` VALUES ('7','forum_them_del');
INSERT INTO `user_group_access` VALUES ('7','forum_them_edit');
INSERT INTO `user_group_access` VALUES ('7','foto_foto_edit');
INSERT INTO `user_group_access` VALUES ('7','foto_komm_del');
INSERT INTO `user_group_access` VALUES ('7','guest_clear');
INSERT INTO `user_group_access` VALUES ('7','guest_delete');
INSERT INTO `user_group_access` VALUES ('7','guest_show_ip');
INSERT INTO `user_group_access` VALUES ('7','lib_stat_create');
INSERT INTO `user_group_access` VALUES ('7','lib_stat_txt');
INSERT INTO `user_group_access` VALUES ('7','loads_file_delete');
INSERT INTO `user_group_access` VALUES ('7','loads_file_edit');
INSERT INTO `user_group_access` VALUES ('7','loads_file_upload');
INSERT INTO `user_group_access` VALUES ('7','notes_delete');
INSERT INTO `user_group_access` VALUES ('7','notes_edit');
INSERT INTO `user_group_access` VALUES ('7','obmen_dir_create');
INSERT INTO `user_group_access` VALUES ('7','obmen_dir_delete');
INSERT INTO `user_group_access` VALUES ('7','obmen_dir_edit');
INSERT INTO `user_group_access` VALUES ('7','obmen_file_delete');
INSERT INTO `user_group_access` VALUES ('7','obmen_file_edit');
INSERT INTO `user_group_access` VALUES ('7','obmen_komm_del');
INSERT INTO `user_group_access` VALUES ('7','user_ban_set');
INSERT INTO `user_group_access` VALUES ('7','user_ban_set_h');
INSERT INTO `user_group_access` VALUES ('7','user_ban_unset');
INSERT INTO `user_group_access` VALUES ('7','user_collisions');
INSERT INTO `user_group_access` VALUES ('7','user_prof_edit');
INSERT INTO `user_group_access` VALUES ('7','user_show_add_info');
INSERT INTO `user_group_access` VALUES ('7','user_show_ua');
INSERT INTO `user_group_access` VALUES ('8','adm_banlist');
INSERT INTO `user_group_access` VALUES ('8','adm_ban_ip');
INSERT INTO `user_group_access` VALUES ('8','adm_forum_sinc');
INSERT INTO `user_group_access` VALUES ('8','adm_info');
INSERT INTO `user_group_access` VALUES ('8','adm_lib_repair');
INSERT INTO `user_group_access` VALUES ('8','adm_news');
INSERT INTO `user_group_access` VALUES ('8','adm_panel_show');
INSERT INTO `user_group_access` VALUES ('8','adm_ref');
INSERT INTO `user_group_access` VALUES ('8','adm_set_chat');
INSERT INTO `user_group_access` VALUES ('8','adm_set_forum');
INSERT INTO `user_group_access` VALUES ('8','adm_set_foto');
INSERT INTO `user_group_access` VALUES ('8','adm_set_loads');
INSERT INTO `user_group_access` VALUES ('8','adm_show_adm');
INSERT INTO `user_group_access` VALUES ('8','adm_statistic');
INSERT INTO `user_group_access` VALUES ('8','chat_clear');
INSERT INTO `user_group_access` VALUES ('8','chat_room');
INSERT INTO `user_group_access` VALUES ('8','forum_for_create');
INSERT INTO `user_group_access` VALUES ('8','forum_for_delete');
INSERT INTO `user_group_access` VALUES ('8','forum_for_edit');
INSERT INTO `user_group_access` VALUES ('8','forum_post_ed');
INSERT INTO `user_group_access` VALUES ('8','forum_razd_create');
INSERT INTO `user_group_access` VALUES ('8','forum_razd_edit');
INSERT INTO `user_group_access` VALUES ('8','forum_them_del');
INSERT INTO `user_group_access` VALUES ('8','forum_them_edit');
INSERT INTO `user_group_access` VALUES ('8','foto_alb_del');
INSERT INTO `user_group_access` VALUES ('8','foto_foto_edit');
INSERT INTO `user_group_access` VALUES ('8','foto_komm_del');
INSERT INTO `user_group_access` VALUES ('8','guest_clear');
INSERT INTO `user_group_access` VALUES ('8','guest_delete');
INSERT INTO `user_group_access` VALUES ('8','guest_show_ip');
INSERT INTO `user_group_access` VALUES ('8','lib_dir_create');
INSERT INTO `user_group_access` VALUES ('8','lib_dir_delete');
INSERT INTO `user_group_access` VALUES ('8','lib_dir_edit');
INSERT INTO `user_group_access` VALUES ('8','lib_dir_mesto');
INSERT INTO `user_group_access` VALUES ('8','lib_stat_create');
INSERT INTO `user_group_access` VALUES ('8','lib_stat_delete');
INSERT INTO `user_group_access` VALUES ('8','lib_stat_txt');
INSERT INTO `user_group_access` VALUES ('8','lib_stat_zip');
INSERT INTO `user_group_access` VALUES ('8','loads_dir_create');
INSERT INTO `user_group_access` VALUES ('8','loads_dir_delete');
INSERT INTO `user_group_access` VALUES ('8','loads_dir_mesto');
INSERT INTO `user_group_access` VALUES ('8','loads_dir_rename');
INSERT INTO `user_group_access` VALUES ('8','loads_file_delete');
INSERT INTO `user_group_access` VALUES ('8','loads_file_edit');
INSERT INTO `user_group_access` VALUES ('8','loads_file_upload');
INSERT INTO `user_group_access` VALUES ('8','loads_unzip');
INSERT INTO `user_group_access` VALUES ('8','notes_delete');
INSERT INTO `user_group_access` VALUES ('8','notes_edit');
INSERT INTO `user_group_access` VALUES ('8','obmen_dir_create');
INSERT INTO `user_group_access` VALUES ('8','obmen_dir_delete');
INSERT INTO `user_group_access` VALUES ('8','obmen_dir_edit');
INSERT INTO `user_group_access` VALUES ('8','obmen_file_delete');
INSERT INTO `user_group_access` VALUES ('8','obmen_file_edit');
INSERT INTO `user_group_access` VALUES ('8','obmen_komm_del');
INSERT INTO `user_group_access` VALUES ('8','user_ban_set');
INSERT INTO `user_group_access` VALUES ('8','user_ban_set_h');
INSERT INTO `user_group_access` VALUES ('8','user_ban_unset');
INSERT INTO `user_group_access` VALUES ('8','user_change_group');
INSERT INTO `user_group_access` VALUES ('8','user_change_nick');
INSERT INTO `user_group_access` VALUES ('8','user_collisions');
INSERT INTO `user_group_access` VALUES ('8','user_delete');
INSERT INTO `user_group_access` VALUES ('8','user_prof_edit');
INSERT INTO `user_group_access` VALUES ('8','user_show_add_info');
INSERT INTO `user_group_access` VALUES ('8','user_show_ip');
INSERT INTO `user_group_access` VALUES ('8','user_show_ua');
INSERT INTO `user_group_access` VALUES ('8','votes_create');
INSERT INTO `user_group_access` VALUES ('8','votes_settings');
INSERT INTO `user_group_access` VALUES ('9','adm_banlist');
INSERT INTO `user_group_access` VALUES ('9','adm_ban_ip');
INSERT INTO `user_group_access` VALUES ('9','adm_forum_sinc');
INSERT INTO `user_group_access` VALUES ('9','adm_info');
INSERT INTO `user_group_access` VALUES ('9','adm_ip_edit');
INSERT INTO `user_group_access` VALUES ('9','adm_lib_repair');
INSERT INTO `user_group_access` VALUES ('9','adm_log_read');
INSERT INTO `user_group_access` VALUES ('9','adm_menu');
INSERT INTO `user_group_access` VALUES ('9','adm_news');
INSERT INTO `user_group_access` VALUES ('9','adm_panel_show');
INSERT INTO `user_group_access` VALUES ('9','adm_ref');
INSERT INTO `user_group_access` VALUES ('9','adm_rekl');
INSERT INTO `user_group_access` VALUES ('9','adm_set_chat');
INSERT INTO `user_group_access` VALUES ('9','adm_set_forum');
INSERT INTO `user_group_access` VALUES ('9','adm_set_foto');
INSERT INTO `user_group_access` VALUES ('9','adm_set_loads');
INSERT INTO `user_group_access` VALUES ('9','adm_set_sys');
INSERT INTO `user_group_access` VALUES ('9','adm_set_user');
INSERT INTO `user_group_access` VALUES ('9','adm_show_adm');
INSERT INTO `user_group_access` VALUES ('9','adm_statistic');
INSERT INTO `user_group_access` VALUES ('9','adm_themes');
INSERT INTO `user_group_access` VALUES ('9','chat_clear');
INSERT INTO `user_group_access` VALUES ('9','chat_room');
INSERT INTO `user_group_access` VALUES ('9','forum_for_create');
INSERT INTO `user_group_access` VALUES ('9','forum_for_delete');
INSERT INTO `user_group_access` VALUES ('9','forum_for_edit');
INSERT INTO `user_group_access` VALUES ('9','forum_post_close');
INSERT INTO `user_group_access` VALUES ('9','forum_post_ed');
INSERT INTO `user_group_access` VALUES ('9','forum_razd_create');
INSERT INTO `user_group_access` VALUES ('9','forum_razd_edit');
INSERT INTO `user_group_access` VALUES ('9','forum_them_del');
INSERT INTO `user_group_access` VALUES ('9','forum_them_edit');
INSERT INTO `user_group_access` VALUES ('9','foto_alb_del');
INSERT INTO `user_group_access` VALUES ('9','foto_foto_edit');
INSERT INTO `user_group_access` VALUES ('9','foto_komm_del');
INSERT INTO `user_group_access` VALUES ('9','guest_clear');
INSERT INTO `user_group_access` VALUES ('9','guest_delete');
INSERT INTO `user_group_access` VALUES ('9','guest_show_ip');
INSERT INTO `user_group_access` VALUES ('9','lib_dir_create');
INSERT INTO `user_group_access` VALUES ('9','lib_dir_delete');
INSERT INTO `user_group_access` VALUES ('9','lib_dir_edit');
INSERT INTO `user_group_access` VALUES ('9','lib_dir_mesto');
INSERT INTO `user_group_access` VALUES ('9','lib_stat_create');
INSERT INTO `user_group_access` VALUES ('9','lib_stat_delete');
INSERT INTO `user_group_access` VALUES ('9','lib_stat_txt');
INSERT INTO `user_group_access` VALUES ('9','lib_stat_zip');
INSERT INTO `user_group_access` VALUES ('9','loads_dir_create');
INSERT INTO `user_group_access` VALUES ('9','loads_dir_delete');
INSERT INTO `user_group_access` VALUES ('9','loads_dir_mesto');
INSERT INTO `user_group_access` VALUES ('9','loads_dir_rename');
INSERT INTO `user_group_access` VALUES ('9','loads_file_delete');
INSERT INTO `user_group_access` VALUES ('9','loads_file_edit');
INSERT INTO `user_group_access` VALUES ('9','loads_file_import');
INSERT INTO `user_group_access` VALUES ('9','loads_file_upload');
INSERT INTO `user_group_access` VALUES ('9','loads_unzip');
INSERT INTO `user_group_access` VALUES ('9','notes_delete');
INSERT INTO `user_group_access` VALUES ('9','notes_edit');
INSERT INTO `user_group_access` VALUES ('9','obmen_dir_create');
INSERT INTO `user_group_access` VALUES ('9','obmen_dir_delete');
INSERT INTO `user_group_access` VALUES ('9','obmen_dir_edit');
INSERT INTO `user_group_access` VALUES ('9','obmen_file_delete');
INSERT INTO `user_group_access` VALUES ('9','obmen_file_edit');
INSERT INTO `user_group_access` VALUES ('9','obmen_komm_del');
INSERT INTO `user_group_access` VALUES ('9','user_ban_set');
INSERT INTO `user_group_access` VALUES ('9','user_ban_set_h');
INSERT INTO `user_group_access` VALUES ('9','user_ban_unset');
INSERT INTO `user_group_access` VALUES ('9','user_change_group');
INSERT INTO `user_group_access` VALUES ('9','user_change_nick');
INSERT INTO `user_group_access` VALUES ('9','user_collisions');
INSERT INTO `user_group_access` VALUES ('9','user_delete');
INSERT INTO `user_group_access` VALUES ('9','user_mass_delete');
INSERT INTO `user_group_access` VALUES ('9','user_prof_edit');
INSERT INTO `user_group_access` VALUES ('9','user_show_add_info');
INSERT INTO `user_group_access` VALUES ('9','user_show_ip');
INSERT INTO `user_group_access` VALUES ('9','user_show_ua');
INSERT INTO `user_group_access` VALUES ('9','votes_create');
INSERT INTO `user_group_access` VALUES ('9','votes_settings');
INSERT INTO `user_group_access` VALUES ('11','adm_banlist');
INSERT INTO `user_group_access` VALUES ('11','adm_info');
INSERT INTO `user_group_access` VALUES ('11','adm_panel_show');
INSERT INTO `user_group_access` VALUES ('11','adm_show_adm');
INSERT INTO `user_group_access` VALUES ('11','adm_statistic');
INSERT INTO `user_group_access` VALUES ('11','forum_post_close');
INSERT INTO `user_group_access` VALUES ('11','notes_delete');
INSERT INTO `user_group_access` VALUES ('11','notes_edit');
INSERT INTO `user_group_access` VALUES ('11','user_ban_set');
INSERT INTO `user_group_access` VALUES ('11','user_ban_set_h');
INSERT INTO `user_group_access` VALUES ('12','adm_banlist');
INSERT INTO `user_group_access` VALUES ('12','adm_info');
INSERT INTO `user_group_access` VALUES ('12','adm_panel_show');
INSERT INTO `user_group_access` VALUES ('12','adm_show_adm');
INSERT INTO `user_group_access` VALUES ('12','adm_statistic');
INSERT INTO `user_group_access` VALUES ('12','guest_clear');
INSERT INTO `user_group_access` VALUES ('12','guest_delete');
INSERT INTO `user_group_access` VALUES ('12','user_ban_set');
INSERT INTO `user_group_access` VALUES ('12','user_ban_set_h');
INSERT INTO `user_group_access` VALUES ('15','adm_accesses');
INSERT INTO `user_group_access` VALUES ('15','adm_banlist');
INSERT INTO `user_group_access` VALUES ('15','adm_ban_ip');
INSERT INTO `user_group_access` VALUES ('15','adm_forum_sinc');
INSERT INTO `user_group_access` VALUES ('15','adm_info');
INSERT INTO `user_group_access` VALUES ('15','adm_ip_edit');
INSERT INTO `user_group_access` VALUES ('15','adm_lib_repair');
INSERT INTO `user_group_access` VALUES ('15','adm_log_delete');
INSERT INTO `user_group_access` VALUES ('15','adm_log_read');
INSERT INTO `user_group_access` VALUES ('15','adm_menu');
INSERT INTO `user_group_access` VALUES ('15','adm_mysql');
INSERT INTO `user_group_access` VALUES ('15','adm_news');
INSERT INTO `user_group_access` VALUES ('15','adm_panel_show');
INSERT INTO `user_group_access` VALUES ('15','adm_ref');
INSERT INTO `user_group_access` VALUES ('15','adm_rekl');
INSERT INTO `user_group_access` VALUES ('15','adm_set_chat');
INSERT INTO `user_group_access` VALUES ('15','adm_set_forum');
INSERT INTO `user_group_access` VALUES ('15','adm_set_foto');
INSERT INTO `user_group_access` VALUES ('15','adm_set_loads');
INSERT INTO `user_group_access` VALUES ('15','adm_set_sys');
INSERT INTO `user_group_access` VALUES ('15','adm_set_user');
INSERT INTO `user_group_access` VALUES ('15','adm_show_adm');
INSERT INTO `user_group_access` VALUES ('15','adm_statistic');
INSERT INTO `user_group_access` VALUES ('15','adm_themes');
INSERT INTO `user_group_access` VALUES ('15','chat_clear');
INSERT INTO `user_group_access` VALUES ('15','chat_room');
INSERT INTO `user_group_access` VALUES ('15','forum_for_create');
INSERT INTO `user_group_access` VALUES ('15','forum_for_delete');
INSERT INTO `user_group_access` VALUES ('15','forum_for_edit');
INSERT INTO `user_group_access` VALUES ('15','forum_post_close');
INSERT INTO `user_group_access` VALUES ('15','forum_post_ed');
INSERT INTO `user_group_access` VALUES ('15','forum_razd_create');
INSERT INTO `user_group_access` VALUES ('15','forum_razd_edit');
INSERT INTO `user_group_access` VALUES ('15','forum_them_del');
INSERT INTO `user_group_access` VALUES ('15','forum_them_edit');
INSERT INTO `user_group_access` VALUES ('15','foto_alb_del');
INSERT INTO `user_group_access` VALUES ('15','foto_foto_edit');
INSERT INTO `user_group_access` VALUES ('15','foto_komm_del');
INSERT INTO `user_group_access` VALUES ('15','guest_clear');
INSERT INTO `user_group_access` VALUES ('15','guest_delete');
INSERT INTO `user_group_access` VALUES ('15','guest_show_ip');
INSERT INTO `user_group_access` VALUES ('15','lib_dir_create');
INSERT INTO `user_group_access` VALUES ('15','lib_dir_delete');
INSERT INTO `user_group_access` VALUES ('15','lib_dir_edit');
INSERT INTO `user_group_access` VALUES ('15','lib_dir_mesto');
INSERT INTO `user_group_access` VALUES ('15','lib_stat_create');
INSERT INTO `user_group_access` VALUES ('15','lib_stat_delete');
INSERT INTO `user_group_access` VALUES ('15','lib_stat_txt');
INSERT INTO `user_group_access` VALUES ('15','lib_stat_zip');
INSERT INTO `user_group_access` VALUES ('15','loads_dir_create');
INSERT INTO `user_group_access` VALUES ('15','loads_dir_delete');
INSERT INTO `user_group_access` VALUES ('15','loads_dir_mesto');
INSERT INTO `user_group_access` VALUES ('15','loads_dir_rename');
INSERT INTO `user_group_access` VALUES ('15','loads_file_delete');
INSERT INTO `user_group_access` VALUES ('15','loads_file_edit');
INSERT INTO `user_group_access` VALUES ('15','loads_file_import');
INSERT INTO `user_group_access` VALUES ('15','loads_file_upload');
INSERT INTO `user_group_access` VALUES ('15','loads_unzip');
INSERT INTO `user_group_access` VALUES ('15','notes_delete');
INSERT INTO `user_group_access` VALUES ('15','notes_edit');
INSERT INTO `user_group_access` VALUES ('15','obmen_dir_create');
INSERT INTO `user_group_access` VALUES ('15','obmen_dir_delete');
INSERT INTO `user_group_access` VALUES ('15','obmen_dir_edit');
INSERT INTO `user_group_access` VALUES ('15','obmen_file_delete');
INSERT INTO `user_group_access` VALUES ('15','obmen_file_edit');
INSERT INTO `user_group_access` VALUES ('15','obmen_komm_del');
INSERT INTO `user_group_access` VALUES ('15','user_ban_set');
INSERT INTO `user_group_access` VALUES ('15','user_ban_set_h');
INSERT INTO `user_group_access` VALUES ('15','user_ban_unset');
INSERT INTO `user_group_access` VALUES ('15','user_change_group');
INSERT INTO `user_group_access` VALUES ('15','user_change_nick');
INSERT INTO `user_group_access` VALUES ('15','user_collisions');
INSERT INTO `user_group_access` VALUES ('15','user_delete');
INSERT INTO `user_group_access` VALUES ('15','user_mass_delete');
INSERT INTO `user_group_access` VALUES ('15','user_prof_edit');
INSERT INTO `user_group_access` VALUES ('15','user_show_add_info');
INSERT INTO `user_group_access` VALUES ('15','user_show_ip');
INSERT INTO `user_group_access` VALUES ('15','user_show_ua');
INSERT INTO `user_group_access` VALUES ('15','votes_create');
INSERT INTO `user_group_access` VALUES ('15','votes_settings');
