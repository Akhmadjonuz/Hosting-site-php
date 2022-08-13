<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="theme-color" content="#5d80a6">
<link rel="apple-touch-icon-precomposed" href="/inc/style/img/app-icon.png">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link href="/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="/inc/style/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Хостинг, Посуточный оплата, Xvest.Ru Мобильный Хостинг,Мобильный Хостинг,Xvest.Ru, php 7, ffmpeg, GD,(pdo) MySQL(i), sqlite, Curl,IonCube, выбор версии php"/>
<meta name="description" content="Хостинг от Xvest – качественный веб hosting сайтов c круглосуточной поддержкой. Надежный linux хостинг в Азие [W-S Pro]"/> 
<meta name="author" content="W-S Pro"/>
<meta name="copyright" content="W-S Pro tomonidan arendaga berilgan!"/>
<meta http-equiv="content-language" content="ru"/>
<title>Менеджер Файлов</title></head><body><header>
         <table>
            <tr>
               <td class="l_bar">
<a href="/"><img src="/inc/style/img/home.png" width="23"  alt="home"></a>
               </td>
               <td class="c_bar">
                  <h1 id="logo"><b>Xvest.Ru - Менеджер сайтов</b></h1>
               </td>
               <td class="r_bar">
<a href="/user/menu" title="Кабинет"><img width="25" src="/img/us2.png" alt="Кабинет"></a>
</td> </tr>
         </table>
      </header><div class="mOm"><div class="block first">-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Хост: localhost:3306
-- Время создания: Окт 15 2016 г., 07:12
-- Версия сервера: 5.5.52-cll
-- Версия PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `codeinfo_mandarin`
--

-- --------------------------------------------------------

--
-- Структура таблицы `adm_mess`
--

CREATE TABLE IF NOT EXISTS `adm_mess` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `text` text,
  `time` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `adm_topic`
--

CREATE TABLE IF NOT EXISTS `adm_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` char(120) NOT NULL,
  `time` int(11) NOT NULL,
  `last` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `album_cat`
--

CREATE TABLE IF NOT EXISTS `album_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL,
  `name` char(100) NOT NULL,
  `text` char(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `album_cat`
--

INSERT INTO `album_cat` (`id`, `time`, `name`, `text`) VALUES
(1, 1436154997, 'Знакомимся!!!', 'Фотографии постояльцев нашего форума.'),
(2, 1436155082, 'Наш сайт', 'Интересные скриншоты из GearNET.RU'),
(3, 1436155101, 'Ржунимагу:)', 'Разные прикольные картинки'),
(4, 1437661865, 'Остальное', 'Различные фотографии'),
(5, 1453670063, 'Портфолио', 'Новые работы наших мастеров.');

-- --------------------------------------------------------

--
-- Структура таблицы `album_comm`
--

CREATE TABLE IF NOT EXISTS `album_comm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `album_foto`
--

CREATE TABLE IF NOT EXISTS `album_foto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `name` char(100) NOT NULL,
  `path` char(250) NOT NULL,
  `text` text,
  `rat` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `album_rating`
--

CREATE TABLE IF NOT EXISTS `album_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `arbitage`
--

CREATE TABLE IF NOT EXISTS `arbitage` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `text` text,
  `user_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `auth_log`
--

CREATE TABLE IF NOT EXISTS `auth_log` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `ip` char(100) NOT NULL,
  `soft` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `time` int(22) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ban`
--

CREATE TABLE IF NOT EXISTS `ban` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `user_ban` int(25) NOT NULL,
  `who_ban` int(25) NOT NULL,
  `timeban` int(25) NOT NULL,
  `dateban` int(25) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `billing_ex`
--

CREATE TABLE IF NOT EXISTS `billing_ex` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL DEFAULT '0',
  `rur` char(250) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `gear` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `billing_hist`
--

CREATE TABLE IF NOT EXISTS `billing_hist` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL DEFAULT '0',
  `text` char(250) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `billing_out`
--

CREATE TABLE IF NOT EXISTS `billing_out` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL DEFAULT '0',
  `rur` char(250) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `billing_perevod`
--

CREATE TABLE IF NOT EXISTS `billing_perevod` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `id_user` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `prim` char(250) NOT NULL,
  `suma` char(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `billing_rekl`
--

CREATE TABLE IF NOT EXISTS `billing_rekl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `url` char(250) NOT NULL,
  `name` char(250) NOT NULL,
  `gde` char(22) NOT NULL,
  `time` int(22) NOT NULL,
  `time_off` int(22) NOT NULL,
  `money` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `billing_set`
--

CREATE TABLE IF NOT EXISTS `billing_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `color` int(11) NOT NULL,
  `bb` int(11) NOT NULL,
  `all` int(11) NOT NULL,
  `index` int(11) NOT NULL,
  `nar` int(11) NOT NULL,
  `icon` int(11) NOT NULL,
  `nick` int(22) NOT NULL DEFAULT '10',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `bill_hist`
--

CREATE TABLE IF NOT EXISTS `bill_hist` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL DEFAULT '0',
  `to_id` int(12) NOT NULL DEFAULT '0',
  `rur` int(12) NOT NULL DEFAULT '0',
  `mod` text NOT NULL,
  `komm` text NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `yes` tinyint(1) NOT NULL DEFAULT '0',
  `kod` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `blogger`
--

CREATE TABLE IF NOT EXISTS `blogger` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `nick` varchar(32) CHARACTER SET cp1251 COLLATE cp1251_bin NOT NULL,
  `pass` varchar(64) CHARACTER SET cp1251 COLLATE cp1251_bin DEFAULT NULL,
  `name` varchar(40) CHARACTER SET cp1251 COLLATE cp1251_bin DEFAULT NULL,
  `sex` varchar(4) NOT NULL,
  `email` varchar(50) CHARACTER SET cp1251 COLLATE cp1251_bin DEFAULT NULL,
  `ip` text,
  `soft` text,
  `last` bigint(20) DEFAULT NULL,
  `icq` bigint(20) NOT NULL,
  `level` int(2) NOT NULL DEFAULT '0',
  `online` int(11) NOT NULL DEFAULT '0',
  `birthday` varchar(10) NOT NULL DEFAULT '01.01.1970',
  `country` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `about` text,
  `status` varchar(100) DEFAULT NULL,
  `mosh` int(11) NOT NULL DEFAULT '0',
  `style` varchar(100) NOT NULL DEFAULT 'default',
  `nickcolor1` varchar(255) DEFAULT NULL,
  `nickcolor2` varchar(255) DEFAULT NULL,
  `jur` enum('0','1') DEFAULT '0',
  `money` int(11) NOT NULL DEFAULT '0',
  `skype` varchar(50) NOT NULL,
  `site` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `mobtel` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `ups` enum('0','1') DEFAULT '0',
  `family` varchar(40) NOT NULL,
  `wmid` char(22) DEFAULT NULL,
  `wmr` char(22) NOT NULL,
  `email_secret` varchar(40) NOT NULL,
  `activ` int(22) NOT NULL DEFAULT '1',
  `spec` int(22) NOT NULL DEFAULT '0',
  `activ_who` int(11) DEFAULT NULL,
  `ava` varchar(250) DEFAULT NULL,
  `gears` int(22) DEFAULT '0',
  `reg` bigint(20) DEFAULT NULL,
  `post` int(22) NOT NULL,
  `hash_code` char(200) NOT NULL,
  `rec_time` int(11) NOT NULL,
  `wm` enum('0','1') DEFAULT '0',
  `pro` enum('0','1') DEFAULT '0',
  `row` int(2) NOT NULL DEFAULT '0',
  `panel` enum('0','1') DEFAULT '0',
  `vis` int(22) NOT NULL,
  `vk` varchar(50) NOT NULL,
  `rodz` text,
  `sneg` enum('0','1') DEFAULT '0',
  `inter` varchar(100) NOT NULL,
  `oper` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `rur` char(22) NOT NULL DEFAULT '0',
  `us_browser` varchar(99) NOT NULL,
  `total_onl` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 PACK_KEYS=0 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `chat`
--

CREATE TABLE IF NOT EXISTS `chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(2000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `codes_cat`
--

CREATE TABLE IF NOT EXISTS `codes_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `codes_cat`
--

INSERT INTO `codes_cat` (`id`, `name`) VALUES
(1, 'Авторский код'),
(2, 'Ajax / Jquery'),
(3, 'Развлечение'),
(4, 'Парсеры'),
(5, 'Кодировка'),
(6, 'JavaScript'),
(7, 'Работа с временем'),
(8, 'Работа с SQL'),
(9, 'Работа с текстом'),
(10, 'Работа с файлами'),
(11, 'Безопасность'),
(12, 'Графика'),
(13, 'Мультимедиа'),
(14, 'Другое'),
(15, 'Социальные API, виджеты, коды');

-- --------------------------------------------------------

--
-- Структура таблицы `codes_code`
--

CREATE TABLE IF NOT EXISTS `codes_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `code` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `text` text NOT NULL,
  `image` char(100) NOT NULL,
  `chit` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `check` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `codes_comm`
--

CREATE TABLE IF NOT EXISTS `codes_comm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `codes_votes`
--

CREATE TABLE IF NOT EXISTS `codes_votes` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) NOT NULL,
  `id_code` int(250) NOT NULL,
  `time` int(250) NOT NULL,
  `type` char(200) NOT NULL,
  `text` varchar(9999) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `comon_mess`
--

CREATE TABLE IF NOT EXISTS `comon_mess` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `rm` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `comon_room`
--

CREATE TABLE IF NOT EXISTS `comon_room` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `info` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `complaint`
--

CREATE TABLE IF NOT EXISTS `complaint` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) NOT NULL,
  `id_user` int(250) NOT NULL,
  `time` int(22) NOT NULL,
  `id_post` int(22) NOT NULL,
  `type` int(22) NOT NULL,
  `read` int(22) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `komm` text NOT NULL,
  `tema` char(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `counts`
--

CREATE TABLE IF NOT EXISTS `counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `news_comm` int(11) NOT NULL DEFAULT '0',
  `adm_topic` int(11) NOT NULL DEFAULT '0',
  `adm_mess` int(11) NOT NULL DEFAULT '0',
  `adm_topic_new` int(11) NOT NULL,
  `adm_mess_new` int(11) NOT NULL,
  `forum_topic` int(11) NOT NULL DEFAULT '0',
  `forum_topic_new` int(11) NOT NULL DEFAULT '0',
  `forum_mess` int(11) NOT NULL DEFAULT '0',
  `forum_mess_new` int(11) NOT NULL DEFAULT '0',
  `downs` int(11) NOT NULL DEFAULT '0',
  `downs_new` int(11) NOT NULL DEFAULT '0',
  `magazin_file` int(11) NOT NULL DEFAULT '0',
  `magazin_file_new` int(11) NOT NULL DEFAULT '0',
  `guest` int(11) NOT NULL DEFAULT '0',
  `guest_new` int(11) NOT NULL DEFAULT '0',
  `ked` int(11) NOT NULL DEFAULT '0',
  `ked_new` int(11) NOT NULL DEFAULT '0',
  `otzyvy` int(11) NOT NULL DEFAULT '0',
  `otzyvy_new` int(11) NOT NULL DEFAULT '0',
  `lenta` int(11) NOT NULL DEFAULT '0',
  `lenta_new` int(11) NOT NULL DEFAULT '0',
  `gazeta_article` int(11) NOT NULL DEFAULT '0',
  `gazeta_article_new` int(11) NOT NULL DEFAULT '0',
  `codes_code` int(11) NOT NULL DEFAULT '0',
  `codes_code_new` int(11) NOT NULL DEFAULT '0',
  `album_foto` int(11) DEFAULT '0',
  `album_comm` int(11) NOT NULL DEFAULT '0',
  `blogger` int(11) NOT NULL DEFAULT '0',
  `guests` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `downs`
--

CREATE TABLE IF NOT EXISTS `downs` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `name` char(250) NOT NULL,
  `author` char(250) NOT NULL,
  `url` char(250) NOT NULL,
  `user_id` int(250) NOT NULL,
  `rid` int(250) NOT NULL,
  `prid` int(22) NOT NULL,
  `time` int(22) NOT NULL,
  `info` text NOT NULL,
  `row` int(22) NOT NULL DEFAULT '0',
  `pass` char(100) NOT NULL,
  `screen` char(250) NOT NULL,
  `mod` int(11) NOT NULL DEFAULT '0',
  `size` int(22) DEFAULT NULL,
  `last_down` int(11) NOT NULL DEFAULT '0',
  `count_down` int(11) NOT NULL DEFAULT '0',
  `block` int(11) NOT NULL DEFAULT '0',
  `block_who` int(11) NOT NULL DEFAULT '0',
  `block_text` char(250) NOT NULL,
  `thema` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `down_komm`
--

CREATE TABLE IF NOT EXISTS `down_komm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `file` int(11) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `down_pr`
--

CREATE TABLE IF NOT EXISTS `down_pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_r` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=cp1251 PACK_KEYS=0 AUTO_INCREMENT=63 ;

--
-- Дамп данных таблицы `down_pr`
--

INSERT INTO `down_pr` (`id`, `id_r`, `name`) VALUES
(1, 1, 'DCMS Social'),
(2, 1, 'JohnCMS '),
(3, 1, 'PHPbb WAP'),
(4, 1, 'API CMS '),
(5, 1, 'StrongCMS '),
(6, 1, 'GlobalCMS '),
(7, 1, 'Live CMS '),
(8, 1, 'MobileCMS'),
(9, 1, 'Остальные CMS'),
(10, 1, 'DCMS fiera'),
(11, 2, 'Под DCMS (social/fiera)'),
(12, 2, 'Под PHPbb WAP '),
(13, 2, 'Под API CMS '),
(14, 2, 'Под JohnCMS '),
(15, 2, 'Под StrongCMS '),
(16, 2, 'Под GlobalCMS '),
(17, 2, 'Под Live CMS '),
(18, 2, 'Под TerrinCMS '),
(19, 2, 'Под RotorCMS '),
(20, 2, 'Под MobileCMS '),
(21, 2, 'Под другие CMS'),
(22, 2, 'Графика для сайта'),
(23, 3, 'Движки и модули'),
(24, 3, 'Дизайны и шаблоны '),
(25, 3, 'WEB интерфейс'),
(26, 3, 'Графика для сайта'),
(27, 4, 'Различные движки'),
(28, 4, 'Модули/обновления'),
(29, 4, 'Онлайн игры'),
(30, 4, 'Знакомства/соц.сети'),
(31, 4, 'Ядро для сайта'),
(32, 4, 'Гостевые/Чаты '),
(33, 4, 'Партнерки и баннерки'),
(34, 4, 'Форумы'),
(35, 4, 'Топы/каталоги'),
(36, 4, 'Загрузки/сервисы'),
(37, 4, 'Клик клубы '),
(38, 4, 'Граббёры/Парсеры'),
(39, 4, 'Витрины и магазины'),
(40, 4, 'Блоги/Информационные'),
(41, 5, 'Под Wordpress'),
(42, 5, 'Под Joomla'),
(43, 5, 'DataLife Engine'),
(44, 5, 'Под IP. Board'),
(45, 5, 'Под xenForo'),
(46, 5, 'Под других CMS'),
(47, 5, 'Графика для сайта'),
(48, 6, ' Wordpress'),
(49, 6, 'Joomla'),
(50, 6, 'DLE engine'),
(51, 6, 'IP. Board'),
(52, 6, 'InstantCMS'),
(53, 6, 'xenForo'),
(54, 6, 'Остальные CMS'),
(55, 6, 'Интернет-магазины'),
(56, 1, 'RotorCMS / Wap-motor'),
(57, 7, 'Разные файлы '),
(58, 7, 'Фотографии '),
(59, 7, 'Аудиозаписи '),
(60, 7, 'Видеозаписи '),
(61, 7, 'Игры и софт '),
(62, 7, 'Мультимедиа ');

-- --------------------------------------------------------

--
-- Структура таблицы `down_r`
--

CREATE TABLE IF NOT EXISTS `down_r` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `opis` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `down_r`
--

INSERT INTO `down_r` (`id`, `name`, `opis`) VALUES
(1, 'Движки / модули', 'Системы управления сайтом, имеющая большое количество модулей.\r\nРазработка и обзоры популярных движков.'),
(2, 'Шаблоны / дизайны', 'Раздел предназначен для скачки шаблонов и дизайнов для сайта'),
(3, 'PRO категория', 'Эксклюзивные скрипты и дизайны'),
(4, 'Самостоятельные скрипты', 'Модули и самостоятельные скрипты  для WAP сайтов'),
(5, 'WEB шаблоны / дизайны', 'Шаблоны и дизайны для WEB движков'),
(6, 'WEB движки / модули', 'Системы управления сайтом, имеющие большое количество WEB модулей и движков.'),
(7, 'Обменник файлов ', 'В этой категории каждый может обмениваться своими файлами (музыка,картинки,видео,софт и тд)');

-- --------------------------------------------------------

--
-- Структура таблицы `down_screen`
--

CREATE TABLE IF NOT EXISTS `down_screen` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `fid` int(25) NOT NULL,
  `file` char(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `down_votes`
--

CREATE TABLE IF NOT EXISTS `down_votes` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) NOT NULL,
  `id_file` int(250) NOT NULL,
  `time` int(250) NOT NULL,
  `type` char(200) NOT NULL,
  `text` varchar(9999) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `finance_pey`
--

CREATE TABLE IF NOT EXISTS `finance_pey` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `us` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `code` char(11) NOT NULL DEFAULT '25876589',
  `text` text NOT NULL,
  `comm` longtext NOT NULL,
  `time` int(11) NOT NULL,
  `see` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `fond`
--

CREATE TABLE IF NOT EXISTS `fond` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL DEFAULT '0',
  `suma` char(250) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_files`
--

CREATE TABLE IF NOT EXISTS `forum_files` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  `files` varchar(250) NOT NULL,
  `size` int(11) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_inthem`
--

CREATE TABLE IF NOT EXISTS `forum_inthem` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `user_id` int(25) NOT NULL,
  `time` int(25) NOT NULL,
  `tid` int(22) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_like`
--

CREATE TABLE IF NOT EXISTS `forum_like` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL,
  `post_id` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `time` int(22) NOT NULL,
  `komu` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_mess`
--

CREATE TABLE IF NOT EXISTS `forum_mess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text,
  `rid` int(11) NOT NULL,
  `prid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` char(11) NOT NULL,
  `time` bigint(11) NOT NULL,
  `cit` text NOT NULL,
  `file` char(100) NOT NULL,
  `count_edit` int(11) NOT NULL DEFAULT '0',
  `time_edit` int(11) NOT NULL DEFAULT '0',
  `who_edit` int(11) NOT NULL,
  `who_del` int(11) NOT NULL DEFAULT '0',
  `del` int(11) NOT NULL DEFAULT '0',
  `otvet` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_podpis`
--

CREATE TABLE IF NOT EXISTS `forum_podpis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_prazdel`
--

CREATE TABLE IF NOT EXISTS `forum_prazdel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=55 ;

--
-- Дамп данных таблицы `forum_prazdel`
--

INSERT INTO `forum_prazdel` (`id`, `name`, `rid`) VALUES
(1, 'Общие вопросы по PHP', 1),
(2, 'Вопросы по Javascript', 1),
(3, 'Работа с программами', 1),
(4, 'Базы данных Mysql(i),PDO и другие', 1),
(5, 'Общие вопросы / помощь новичкам', 1),
(6, 'WAP движки, модули', 2),
(7, 'Классификатор', 2),
(8, 'WEB движки, плагины', 2),
(9, 'Wordpress', 2),
(10, 'DataLife Engine', 2),
(11, 'xenForo', 2),
(12, 'Интернет-магазины', 2),
(13, 'Обсуждение новых файлов', 2),
(14, 'Конструкторы сайтов', 3),
(15, 'Хостинги / регистраторы доменов', 3),
(16, 'Полезные ресурсы', 3),
(17, 'Реклама / оценка сайтов', 3),
(18, 'Вёрстка (HTML, CSS)', 4),
(19, 'WEB дизайны', 4),
(20, 'Вопросы по CSS,HTML', 4),
(21, 'Графика / дизайн', 4),
(22, 'WAP шаблоны и дизайны', 4),
(23, 'SEO оптимизация', 5),
(24, 'Поисковые системы', 5),
(25, 'SEO скрипты', 5),
(26, 'Монетизация сайтов', 5),
(27, 'Практика оптимизации', 5),
(28, 'Платные услуги / Предложения', 6),
(29, 'Продажа рекламы', 6),
(30, 'Оборот скриптов, дизайнов', 6),
(31, 'Продажа доменов и сайтов', 6),
(32, 'Займы / Кредиты', 6),
(33, 'Арбитраж', 6),
(34, 'Обмен / вывод средств', 6),
(35, 'Бесплатные услуги / халява', 6),
(36, 'Свободное общение', 7),
(37, 'Свежие новости / HI-Tech', 7),
(38, 'Приколы и юмор', 7),
(39, 'ТВ / фильмы / сериалы', 7),
(40, 'Спорт и все о нем', 7),
(41, 'Поздравление с праздниками', 7),
(42, 'Платёжные системы Qiwi/webmoney', 8),
(43, 'Мобильные устройства', 8),
(44, 'Проблемы с ПК', 8),
(45, 'Общие вопросы', 8),
(46, 'ICQ / SKYPE / Whatsapp', 8),
(47, 'Игры и софт для PC', 8),
(48, 'Вопросы / Предложения', 9),
(49, 'Ошибки/баги сайта', 9),
(50, 'Жизнь сайта', 9),
(51, 'Конкурсы / акции', 9),
(52, 'Не знаю где создать', 9),
(53, 'Заявки в Админ-состав', 9),
(54, 'Все о Arena: Gear BATTLE', 7);

-- --------------------------------------------------------

--
-- Структура таблицы `forum_razdel`
--

CREATE TABLE IF NOT EXISTS `forum_razdel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `forum_razdel`
--

INSERT INTO `forum_razdel` (`id`, `name`) VALUES
(1, 'Программирование'),
(2, 'Движки, скрипты'),
(3, 'Хостинги, домены'),
(4, 'Шаблоны, дизайны'),
(5, 'Поисковая оптимизация'),
(6, 'Куплю / Продам / Услуги'),
(7, 'Общение / обсуждение'),
(8, 'Компьютеры / техника'),
(9, 'Все о Profmas.net');

-- --------------------------------------------------------

--
-- Структура таблицы `forum_topic`
--

CREATE TABLE IF NOT EXISTS `forum_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `rid` int(11) NOT NULL,
  `prid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` char(11) NOT NULL,
  `time` bigint(11) NOT NULL,
  `last` bigint(11) NOT NULL,
  `count_edit` int(11) NOT NULL DEFAULT '0',
  `time_edit` int(11) NOT NULL DEFAULT '0',
  `closed_who` int(11) NOT NULL DEFAULT '0',
  `otvet` int(11) NOT NULL DEFAULT '0',
  `otvet_2` int(11) NOT NULL DEFAULT '0',
  `fasten` int(22) NOT NULL DEFAULT '0',
  `block` int(22) NOT NULL DEFAULT '1',
  `block_text` text NOT NULL,
  `block_who` int(22) NOT NULL,
  `quest` char(250) NOT NULL,
  `var1` char(250) NOT NULL,
  `var2` char(250) NOT NULL,
  `var3` char(250) NOT NULL,
  `var4` char(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_votes`
--

CREATE TABLE IF NOT EXISTS `forum_votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  `var` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `garant`
--

CREATE TABLE IF NOT EXISTS `garant` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `nick` char(100) NOT NULL,
  `info` text NOT NULL,
  `rulls` text NOT NULL,
  `polozh` text NOT NULL,
  `dopoln` text NOT NULL,
  `cena` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `who_add` int(11) NOT NULL,
  `qiwi` char(12) NOT NULL,
  `wmid` char(12) NOT NULL,
  `wmr` char(12) NOT NULL,
  `icq` int(9) NOT NULL,
  `mail` char(100) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `time` int(22) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `gazeta_article`
--

CREATE TABLE IF NOT EXISTS `gazeta_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `text` text NOT NULL,
  `image` char(100) NOT NULL,
  `chit` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `gazeta_cat`
--

CREATE TABLE IF NOT EXISTS `gazeta_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `gazeta_cat`
--

INSERT INTO `gazeta_cat` (`id`, `name`) VALUES
(1, 'Обзор Хостингов'),
(2, 'Интервью'),
(3, 'Нечисть интернета'),
(4, 'Мировые новости'),
(5, 'Новости интернета'),
(6, 'Обзор сайтов'),
(7, 'Наука и техника'),
(8, 'Новости культуры'),
(9, 'Спорт'),
(10, 'Hi-Tech новости'),
(11, 'Программирование'),
(12, 'Все обо всём'),
(13, 'Размышления и наблюдения');

-- --------------------------------------------------------

--
-- Структура таблицы `gazeta_comm`
--

CREATE TABLE IF NOT EXISTS `gazeta_comm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `guest`
--

CREATE TABLE IF NOT EXISTS `guest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` varchar(45) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `guests`
--

CREATE TABLE IF NOT EXISTS `guests` (
  `id_session` char(200) NOT NULL,
  `ua` text,
  `ip` varchar(100) NOT NULL,
  `date` int(11) NOT NULL,
  PRIMARY KEY (`id_session`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ignor`
--

CREATE TABLE IF NOT EXISTS `ignor` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `jurnal`
--

CREATE TABLE IF NOT EXISTS `jurnal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `text` text NOT NULL,
  `time` int(11) NOT NULL,
  `act` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ked`
--

CREATE TABLE IF NOT EXISTS `ked` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `nick` char(100) NOT NULL,
  `info` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `who_add` int(11) NOT NULL,
  `nicks` char(100) NOT NULL,
  `wmid` char(12) NOT NULL,
  `wmr` char(12) NOT NULL,
  `icq` int(9) NOT NULL,
  `mail` char(100) NOT NULL,
  `screen` char(250) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `time` int(22) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `lenta`
--

CREATE TABLE IF NOT EXISTS `lenta` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `letters`
--

CREATE TABLE IF NOT EXISTS `letters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `who` int(11) NOT NULL DEFAULT '0',
  `idwho` int(11) NOT NULL DEFAULT '0',
  `text` text,
  `data` char(22) DEFAULT '0',
  `read` smallint(1) DEFAULT '0',
  `mod` char(11) NOT NULL DEFAULT '',
  `save` smallint(1) NOT NULL DEFAULT '0',
  `file` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `log_codes`
--

CREATE TABLE IF NOT EXISTS `log_codes` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) NOT NULL,
  `id_code` int(250) NOT NULL,
  `time` int(250) NOT NULL,
  `type` char(200) NOT NULL,
  `text` varchar(9999) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `log_magazin`
--

CREATE TABLE IF NOT EXISTS `log_magazin` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) NOT NULL,
  `id_mag` int(250) NOT NULL,
  `time` int(250) NOT NULL,
  `type` char(200) NOT NULL,
  `text` varchar(9999) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `log_news`
--

CREATE TABLE IF NOT EXISTS `log_news` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) NOT NULL,
  `id_news` int(250) NOT NULL,
  `time` int(250) NOT NULL,
  `type` char(200) NOT NULL,
  `text` varchar(9999) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `log_votes`
--

CREATE TABLE IF NOT EXISTS `log_votes` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) NOT NULL,
  `id_file` int(250) NOT NULL,
  `time` int(250) NOT NULL,
  `type` char(200) NOT NULL,
  `text` varchar(9999) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `lottery`
--

CREATE TABLE IF NOT EXISTS `lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `read` set('0','1') NOT NULL DEFAULT '1',
  `s025` set('0','1','2') NOT NULL DEFAULT '1',
  `s05` set('0','1','2') NOT NULL DEFAULT '1',
  `s1` set('0','1','2') NOT NULL DEFAULT '1',
  `s2` set('0','1','2') NOT NULL DEFAULT '1',
  `s4` set('0','1','2') NOT NULL DEFAULT '1',
  `s8` set('0','1','2') NOT NULL DEFAULT '1',
  `s15` set('0','1','2') NOT NULL DEFAULT '1',
  `s30` set('0','1','2') NOT NULL DEFAULT '1',
  `s60` set('0','1','2') NOT NULL DEFAULT '1',
  `s125` set('0','1','2') NOT NULL DEFAULT '1',
  `s250` set('0','1','2') NOT NULL DEFAULT '1',
  `s500` set('0','1','2') NOT NULL DEFAULT '1',
  `a025` set('1','2') NOT NULL DEFAULT '1',
  `a05` set('1','2') NOT NULL DEFAULT '1',
  `a1` set('1','2') NOT NULL DEFAULT '1',
  `a2` set('1','2') NOT NULL DEFAULT '1',
  `a4` set('1','2') NOT NULL DEFAULT '1',
  `a8` set('1','2') NOT NULL DEFAULT '1',
  `a15` set('1','2') NOT NULL DEFAULT '1',
  `a30` set('1','2') NOT NULL DEFAULT '1',
  `a60` set('1','2') NOT NULL DEFAULT '1',
  `a125` set('1','2') NOT NULL DEFAULT '1',
  `a250` set('1','2') NOT NULL DEFAULT '1',
  `a500` set('1','2') NOT NULL DEFAULT '1',
  `level` int(1) DEFAULT '0',
  `over` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `lottery_winners`
--

CREATE TABLE IF NOT EXISTS `lottery_winners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `msg` varchar(102) NOT NULL,
  `time` int(11) NOT NULL,
  `winners` varchar(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `magazin_file`
--

CREATE TABLE IF NOT EXISTS `magazin_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_r` int(11) NOT NULL DEFAULT '0',
  `id_pr` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `kopii` int(11) NOT NULL,
  `opis` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `file` char(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time` int(11) DEFAULT NULL,
  `prava` int(11) NOT NULL DEFAULT '0',
  `prodano` int(11) NOT NULL DEFAULT '0',
  `block` int(11) NOT NULL DEFAULT '0',
  `block_who` int(11) NOT NULL DEFAULT '0',
  `block_text` char(250) NOT NULL,
  `block_file` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 PACK_KEYS=0 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `magazin_komm`
--

CREATE TABLE IF NOT EXISTS `magazin_komm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `file` int(11) NOT NULL,
  `text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `magazin_korz`
--

CREATE TABLE IF NOT EXISTS `magazin_korz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `magazin_mybuy`
--

CREATE TABLE IF NOT EXISTS `magazin_mybuy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `user_buyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `magazin_myout`
--

CREATE TABLE IF NOT EXISTS `magazin_myout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `file` int(11) NOT NULL,
  `user_buyid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `magazin_pr`
--

CREATE TABLE IF NOT EXISTS `magazin_pr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_r` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `opis` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=28 ;

--
-- Дамп данных таблицы `magazin_pr`
--

INSERT INTO `magazin_pr` (`id`, `id_r`, `name`, `opis`) VALUES
(1, 2, 'Различные движки', ''),
(2, 2, 'Модули / обновления', ''),
(3, 2, 'Онлайн игры', ''),
(4, 2, 'Знакомства / соц.сети', ''),
(5, 2, 'Гостевые / чаты', ''),
(6, 2, 'Форумы', ''),
(7, 2, 'Топы / каталоги', ''),
(8, 2, 'Грабберы / Парсеры', ''),
(9, 2, 'Блоги / информационные', ''),
(10, 3, 'Под DCMS', ''),
(11, 3, 'Под JohnCMS', ''),
(12, 3, 'Под APICMS', ''),
(13, 3, 'Под RotorCMS', ''),
(14, 3, 'Шаблоны / графика', ''),
(15, 3, 'Остальные CMS', ''),
(16, 1, 'Для Wordpress', ''),
(17, 1, 'Для SHCMS', ''),
(18, 1, 'DLE engine', ''),
(19, 1, 'Различные CMS', ''),
(20, 4, 'Для DCMS social', ''),
(21, 4, 'Для JohnCMS', ''),
(22, 4, 'Для Phpbb wap', ''),
(23, 4, 'Для APICMS', ''),
(24, 4, 'Для StrongCMS', ''),
(25, 4, 'Для DCMS-fiera', ''),
(26, 4, 'Для RotorCMS', ''),
(27, 4, 'Различные CMS', '');

-- --------------------------------------------------------

--
-- Структура таблицы `magazin_r`
--

CREATE TABLE IF NOT EXISTS `magazin_r` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `opis` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `magazin_r`
--

INSERT INTO `magazin_r` (`id`, `name`, `opis`) VALUES
(1, 'WEB движки / модули ', 'Самостоятельные скрипты для WEB CMS и сайтов.'),
(2, 'Самостоятельные скрипты', 'Самостоятельные php-скрипты'),
(3, 'Шаблоны / дизайны', 'WAP/WEB шаблоны, графика и т.д'),
(4, 'Движки / модули', 'Скрипты на различных языках программирования');

-- --------------------------------------------------------

--
-- Структура таблицы `magazin_screen`
--

CREATE TABLE IF NOT EXISTS `magazin_screen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` int(11) NOT NULL,
  `screen` char(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `magazin_votes`
--

CREATE TABLE IF NOT EXISTS `magazin_votes` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) NOT NULL,
  `id_mag` int(250) NOT NULL,
  `time` int(250) NOT NULL,
  `type` char(200) NOT NULL,
  `text` varchar(9999) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `medals`
--

CREATE TABLE IF NOT EXISTS `medals` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `text` text,
  `user_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `nar`
--

CREATE TABLE IF NOT EXISTS `nar` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) NOT NULL,
  `id_user` int(250) NOT NULL,
  `type` int(22) NOT NULL,
  `text` char(250) NOT NULL,
  `nar` char(250) NOT NULL,
  `tema` char(100) NOT NULL,
  `time` int(11) NOT NULL,
  `message` text NOT NULL,
  `dateban` int(22) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `new`
--

CREATE TABLE IF NOT EXISTS `new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `us` int(11) NOT NULL DEFAULT '0',
  `kem` int(11) NOT NULL DEFAULT '0',
  `text` text,
  `t` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 PACK_KEYS=0 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `txt` varchar(1500) DEFAULT NULL,
  `time` int(100) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `news_comm`
--

CREATE TABLE IF NOT EXISTS `news_comm` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `id_news` int(50) NOT NULL,
  `txt` varchar(1024) NOT NULL,
  `time` int(10) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `news_votes`
--

CREATE TABLE IF NOT EXISTS `news_votes` (
  `id` int(250) NOT NULL AUTO_INCREMENT,
  `user_id` int(250) NOT NULL,
  `id_news` int(250) NOT NULL,
  `time` int(250) NOT NULL,
  `type` char(200) NOT NULL,
  `text` varchar(9999) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `new_komm`
--

CREATE TABLE IF NOT EXISTS `new_komm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_new` int(11) NOT NULL,
  `us` int(11) NOT NULL,
  `text` text,
  `t` bigint(20) DEFAULT NULL,
  `komu` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 PACK_KEYS=0 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `nicks`
--

CREATE TABLE IF NOT EXISTS `nicks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `us` int(11) NOT NULL DEFAULT '0',
  `kem` int(11) NOT NULL DEFAULT '0',
  `old` varchar(100) DEFAULT NULL,
  `new` varchar(100) DEFAULT NULL,
  `time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=cp1251 PACK_KEYS=0 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `notebook`
--

CREATE TABLE IF NOT EXISTS `notebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `msg` varchar(20000) NOT NULL,
  `name` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `otzyvy`
--

CREATE TABLE IF NOT EXISTS `otzyvy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `text` text NOT NULL,
  `activ` int(11) NOT NULL DEFAULT '0',
  `time` int(22) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `pay`
--

CREATE TABLE IF NOT EXISTS `pay` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(12) NOT NULL DEFAULT '0',
  `rur` char(12) NOT NULL DEFAULT '0',
  `prim` text NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE IF NOT EXISTS `payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `LMI_PAYMENT_AMOUNT` int(11) NOT NULL DEFAULT '0',
  `LMI_SYS_INVS_NO` int(11) DEFAULT NULL,
  `LMI_SYS_TRANS_NO` int(11) DEFAULT NULL,
  `LMI_SYS_TRANS_DATE` char(17) DEFAULT NULL,
  `LMI_PAYER_PURSE` char(13) DEFAULT NULL,
  `LMI_PAYER_WM` char(12) DEFAULT NULL,
  `RND` char(8) DEFAULT NULL,
  `item` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `user_id` int(12) NOT NULL DEFAULT '0',
  `yes` tinyint(1) NOT NULL DEFAULT '0',
  `mod` char(17) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `rules_cat`
--

CREATE TABLE IF NOT EXISTS `rules_cat` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `name` char(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `rules_cat`
--

INSERT INTO `rules_cat` (`id`, `name`) VALUES
(1, '1.Общие положения'),
(2, '2.Назначение форума'),
(3, '3.Порядок регистрации'),
(4, '4.Создание тем'),
(5, '5.Размещение сообщений'),
(6, '6.Ограничения'),
(7, '7.Выдача наказаний'),
(8, '8.Поощрения пользователей'),
(9, '9.Полномочия Администрации');

-- --------------------------------------------------------

--
-- Структура таблицы `rules_view`
--

CREATE TABLE IF NOT EXISTS `rules_view` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `name` char(250) NOT NULL,
  `text` text NOT NULL,
  `cid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Дамп данных таблицы `rules_view`
--

INSERT INTO `rules_view` (`id`, `name`, `text`, `cid`) VALUES
(1, '1.1', 'Правила форума Profmas (далее – Правила) призваны урегулировать взаимоотношения между зарегистрированными посетителями сайта и форума (далее – Пользователи) и Администраторами, Модераторами и Разработчиками (далее – Администрация), привнеся в общение порядок, тем самым исключив возможность возникновения конфликтов и оскорблений, что в конечном итоге позволит Вам приятно провести время в компании единомышленников.\r\nДанный форум не является мультиязычным и содержит информацию исключительно на русском языке. Все пользователи обязуются не нарушать законы РФ и стран СНГ. Все пользователи, зарегистрированные на данном ресурсе, обязуются соблюдать следующие правила;', 1),
(2, '1.2', 'Предложения, касающиеся изменения данных Правил вносятся Администрацией (Модераторами, Разработчиками) и утверждаются Администратором. С последней редакцией правил можно ознакомиться в разделе «Правила» на главной странице форума;', 1),
(3, '1.3', 'Если Вы являетесь Пользователем и не согласны с требованием данных Правил, или у Вас есть желание оспорить какой-либо пункт Правил, Вы можете подать заявку на деактивацию Вашей учетной записи на форуме, отправив письмо в личных сообщениях [url=http://profmas.net/users/1]Главному Разработчику[/url] или [url=http://profmas.net/users/1]Главному Администратору[/url] с просьбой «Деактивация»;', 1),
(4, '1.4', 'Регистрируясь, Вы автоматически соглашаетесь с настоящими правилами и обязуетесь соблюдать все их положения. Незнание данных Правил не только не освобождает от ответственности, но и само по себе является нарушением;', 1),
(5, '1.5', 'Интернациональным языком общения на Форуме является русский. Иные языки не приветствуются, их использование допустимо лишь в случаях, обусловленных необходимостью;', 1),
(6, '1.6', 'В ситуациях, не оговоренных Правилами, Администрация принимает решение, руководствуясь собственными ценностными установками;', 1),
(7, '1.7', 'Администрация не несёт ответственности за информацию, размещаемую пользователями;', 1),
(8, '1.8', 'Администрация сохраняет за собой право вносить изменения в настоящие Правила без предварительного уведомления пользователей.', 1),
(9, '2.1', 'Форум сайта Profmas.Net предназначен для обсуждения вопросов, связанных с разработкой Web/wap-сайтов, администрированием серверов, помощь в создании и раскрутке сайтов, выборе хостинга, регистрация доменных имён и бесплатных хостингов, а также актуальных жизненных тем, не противоречащих правилам ресурса;', 2),
(10, '2.2', 'Администрация принимает все меры для предотвращения нарушений Правил. Однако, задача обеспечить полный контроль за написанием Пользователями сообщений не ставится, предварительная модерация отсутствует. Таким образом, сообщения на этих форумах отражают точки зрения их авторов, а не Администрации форумов (кроме сообщений, размещённых её представителями) и Администрация не может быть ответственна за их содержание. На форуме внедрена система Жалоб, позволяющая Пользователю отправить оскорбительное с его точки зрения сообщение на рассмотрение представителю Администрации;', 2),
(11, '2.3', 'На форуме не приветствуется обсуждение национальной политики, конкретных ключевых фигур политического Олимпа или руководителей любого уровня, равно как и критика любых национальных или этнических традиций, праздников, обычаев;', 2),
(12, '3.1 Возможные участники', 'Пользователем может стать любое лицо, заинтересованное в тематике форума и имеющее добрые намерения;', 3),
(13, '3.2 Преимущества регистрации', 'Ознакомиться с большинством статей сайта и темами форума, скачать бесплатные движки и модули может любой посетитель Всемирной Сети. Размещать сообщения, создавать новые темы на форуме, скачивать скриншоты, читать отдельные статьи форума могут только Пользователи (зарегистрированные посетители);', 3),
(14, '3.3 Личные данные', 'Запрещено использование ненормативной лексики при заполнении личных данных (Имени/Городе проживания/Поля о себе);', 3),
(20, '3.9 Повторная регистрация', 'Запрещено создание клонов с целью увеличения рейтинга/спама, а так же пребывания на сайте по причине блока основного аккаунта. Наказанием за создание клона может послужить вечный блок основного аккаунта, а так же блок клонированных аккаунтов.', 3),
(15, '3.4 Тайна информации', 'Информацию, оставленную Пользователем при регистрации на форуме сайта, Администрация не вправе открывать третьим лицам без разрешения Пользователя;', 3),
(16, '3.5 Принцип оферты', 'Зарегистрировавшись, Пользователь соглашается с требованиями данных Правил, а также с тем, что введённая им информация будет храниться в базе данных;', 3),
(17, '3.6 Ограничения по регистрации', 'Запрещается регистрироваться с никами, содержащими:\r\n- нецензурные слова или матерные корни, а также, звучащими некультурно при прочтении;\r\n- только цифры / спецсимволы, а также состоящие из набора букв или цифр, не несущих смысловую нагрузку;\r\n- украшательства, слова написанные ЗАГЛАВНЫМИ буквами, с заменой символов (например: -=Васечка=-, BeL@ru$);\r\n- адреса веб-сайтов, E-mail и т.п.;\r\n- похожими на имена администраторов или модераторов;', 3),
(18, '3.7 Клоны, поддельные ники, обмен уч.записей', 'Запрещена: \r\n- двойная регистрация, т.е. регистрация под двумя и более никнеймами в целях усугубления нарушений, совершенных с учетной записи – «основы»;\r\n- регистрация двойника уже существующего никнейма (визуально схожего до степени смешения);\r\n- захват никнеймов, то есть регистрация с целью воспрепятствовать их использованию другими потенциальными участниками;\r\n- передача зарегистрированного никнейма другому физическому или юридическому лицу;', 3),
(19, '3.8 Оповещение о регистрации', 'После регистрации пользователю на e-mail высылается подтверждение о внесении его учетной записи в базу данных, а также его логин и пароль. Именно поэтому необходимо указывать реально существующий адрес электронной почты. Если у вас его еще пока нет, вы можете зарегистрировать e-mail, воспользовавшись бесплатными почтовыми сервисами, перейдя по ссылкам: mail.ru или yandex.ru Либо выбрать любой другой из тех, что вам понравятся;', 3),
(21, '3.10 Удаление аккаунтов', 'Пользователи, которые нарушили правила регистрации будут удалены. Администрация не обязуется уведомлять пользователей об удалении.', 3),
(22, '4.1 Темы-двойники', 'Перед созданием новой темы Пользователю надлежит выяснить наличие на форуме темы аналогичного содержания. Если похожая тема уже создана – задайте вопрос в ней. \r\nЕсли же речь идет о рекламе каких-либо товаров и/или услуг, то категорически запрещается создавать массу однотипных тем, старайтесь изложить всю суть в одном топике.', 4),
(23, '4.2 Информативность заголовка', 'Заголовок новой темы должен максимально отражать содержание сообщения. Неинформативные заголовки тем влекут за собой наложение строгих замечаний Пользователю Администрацией с последующим введением модерации сообщений Пользователя на минимальный срок в 3 дня.\r\nНе создавайте темы с малопонятным содержанием. Темы, озаглавленные «Помогите», «Я хочу спросить», «Help», будут переименованы или удалены.', 4),
(24, '4.3 Ограничения по созданию тем', 'Запрещается создание новых тем: \r\n- Уже обсуждавшихся на форуме. Для нахождения ответов на вопросы пользуйтесь поиском. Нежелание использовать поиск свидетельствует о пренебрежительном отношении к накопленному чужому опыту; \r\n- В разделах форума, не подходящих по тематике. Если тема не соответствует тематике ни одного раздела форума, она будет закрыта либо перенесена, а вы будете предупреждены с занесением нарушения в анкету, дальнейшее нарушение этого пункта карается блоком аккаунта на 12 часов.\r\n- Одновременно в нескольких разделах форума (кросспост); \r\n- Обращение к конкретному участнику форума;\r\n- Имеющих в названии большое количество ЗАГЛАВНЫХ БУКВ, украшения типа «==-- СуперТемА --==»; \r\n- С неинформативными, малосодержательными названиями, например: «Нужна помощь!», «Срочно!!!», «Как вам это нравится?...». Темы с корректными названиями привлекают больше внимания посетителей и увеличивают шансы получить оперативный и грамотный ответ;', 4),
(25, '4.4 Чужие темы', 'Создавать какие-либо темы от чужого имени, особенно это касается коммерческих топиков в стиле &quot;товар не мой, я только создал тему по просьбе&quot;.', 4),
(26, '5.1 Общение не на русском языке', 'Языком общения является русский, как признанный официальным на территории стран СНГ. С целью исключения недоразумений Администрация и Пользователи, оставившие сообщение на языке, непонятном для отдельных Пользователей, принимают меры по переводу указанного сообщения и размещению его вслед за спорным. Не следует забывать, что посетители, знающие только русский язык, могут не понимать других языков. Сообщения, адресуемые всем пользователям форума, рекомендуется писать на русском языке, чтобы избежать недоразумений и уменьшить нагрузку на Администрацию;', 5),
(27, '5.2 Осмысленность сообщений', 'Перед написанием сообщения следует проанализировать целесообразность его размещения.\r\nКаждый пользователь обязуется следить за речью и не употреблять слов, которые бы противоречили нормативам русского языка (сюда входят: бранные слова и их сокращения);', 5),
(28, '5.3 Орфография в сообщениях', 'На форуме отсутствует премодерация, поэтому настоятельно рекомендуется перечитывать сообщение перед отправкой;', 5),
(29, '5.4 Мультипостинг', 'Не приветствуется мультипостинг (несколько сообщений подряд одного и того же автора), кроме случаев очевидных неполадок с GPRS/EDGE соединением;', 5),
(30, '5.5 Оформление сообщений', 'На разные вопросы в пределах одной темы рекомендуется отвечать, используя абзацные отступы и указание адресата при ответе в единичном сообщении;', 5),
(31, '5.6 Разжигание конфликта', 'Каждый пользователь обязуется не разжигать межрасовые и межнациональные конфликты и поддерживать толерантные отношения с пользователями разных национальностей;', 5),
(32, '5.7 Требования к сообщению', 'При написании сообщения Пользователь обязан следовать следующим правилам: \r\n- уважительно относиться к точке зрения оппонентов; \r\n- высказываться обдуманно и по существу; \r\n- соблюдать нормы этики; \r\n- соблюдать правила орфографии и пунктуации; \r\n- использовать только общепринятые сокращения и аббревиатуры; \r\n- не «кричать» на форуме (не использовать для написания сообщений большое количество ЗАГЛАВНЫХ БУКВ или знаков препинания !!!!!, ?????); \r\n- избегать необоснованного применения BB code, выделяя сообщения другим цветом или размещая посты с многократно увеличенным размером шрифта);', 5),
(33, '5.8 Некропостинг', 'Каждый пользователь обязуется пренебрегать Флудом и не Оффтопить во всех разделах, кроме специализированного отдела форума Свободное общение.', 5),
(34, '5.9 Осуждение религий', 'Запрещено обсуждение и осуждение чужой религии либо мировозрения, разжигание конфликтов на данных почвах.', 5),
(35, '5.10 Прикрепляемые файлы', 'На форум можно загружать файлы и изображения. Для этого необходимо использовать форму «прикрепить», находящуюся на странице размещения сообщения. Действуют ограничения: 5 мб для прикрепляемого изображения, а также не более 4 вложений в одном сообщении.', 5),
(36, '4.5 Темы о нацизме', 'Запрещено создание/обсуждение тем, связанных с фашизмом/нацизмом и любым проявлением агрессии. Так же запрещено размещать файлы, которые содержат данную информацию.', 4),
(37, '9.1', 'Администрация форума имеет право удалить, отредактировать, перенести или закрыть любую тему в любое время по своему усмотрению без уведомления авторов темы и сообщений;', 9),
(38, '9.2', 'Информация, оставленная Пользователем при регистрации и в процессе посещения форума и сайта, без разрешения автора не будет открыта третьим лицам. Однако, Администрация форума не может нести ответственность за потерю информации вследствие действия хакеров;', 9),
(39, '9.3', 'Администрация сайта Profmas.Net не несет ответственности за прямой или косвенный ущерб причиненный Пользователю, возникший в результате использования сайта, представленных на нем материалов, программных продуктов,модулей и движков;', 9),
(40, '9.4', 'Модератором является пользователь, наделеный рядом прав и технических возможностей для поддержания порядка на Форуме. Модератор - пример поведения на Форуме, и должен предъявлять более высокие требования к себе, т.к. он является представителем руководства Форума. Участникам форума, не являющимся Администраторами, Разработчиками или Модераторами, запрещается обсуждать в открытом форуме действия Модераторов. Модератор имеет право безоговорочно редактировать или удалять сообщения, нарушающие настоящие Правила;', 9),
(41, '9.5', 'Участник, считающий, что в отношении него или другого участника форума модераторы поступили несправедливо, имеет право в течение 2-х (двух) дней с момента получения бана, подать жалобу Администрации на действия Модераторов в форме приватного сообщения [url=http://Profmas.Net/users/1]Главному Разработчику[/url] или [url=http://Profmas.Net/users/1]Главному Администратору[/url], либо нажав на ссылку «Жалоба» возле того сообщения, которое Пользователь счел оскорбительным и только в случае полного обоснования Пользователем противоправности предпринятых Модератором действий в соответствии с данными Правилами;', 9),
(42, '9.6', 'Администратор рассматривает обращения в свой адрес (ЛС) и предоставлет ответ в срок не позднее 10 дней. Сообщения, оформленные в грубом тоне, с большим количеством ошибок или не на русском языке, могут быть оставлены без рассмотрения. Сообщения в адрес Администратора MrKent оформляются в строгом соответствии с шаблонами, размещенными на странице оформления текста сообщения;', 9),
(43, '9.7', 'Пользователи, которые не посещают форум более 90 дней, могут быть удалены Администрацией с предварительным сообщением на указанный в профиле адрес электронной почты за два дня до удаления о том, что пользователь не посещал форум и согласно данным Правилам подлежит удалению.', 9),
(44, '8.1', 'Активным считается Пользователь, оказывающий помощь и поддержку Администрации в развитии форума и сайта;', 8),
(45, '8.2', 'Написание статей про сайт Profmas.Net с их последующей публикацией на форумах/блогах считается особым выражением активности;', 8),
(46, '8.3', 'В качестве поощрения активного пользователя Администрация может: \r\n-предоставить такому пользователю первоочередное право на присвоение должности модератора/тестера или иного звания на форуме; \r\n-предоставлять эксклюзивный доступ к закрытой информации и данным.', 8),
(47, '7.1', 'Все нарушения Правил фиксируются и заносятся в историю банов и предупреждений конкретного Пользователя. На основе количества и тяжести нарушений выносится решение о наказании Пользователя;', 7),
(48, '7.2', 'За единичные случаи нарушения Правил, не относящихся к разряду &quot;серьезных&quot;, Пользователю выносится предупреждение Администрацией;', 7),
(49, '7.3', 'За несоблюдение требований настоящих Правил, грубое игнорирование 5-го раздела Правил, невыполнение предупреждений Администрации Пользователь может быть заблокирован (забанен) сроком от 1-го до 365-ти дней. Конкретную меру наказания Администрация определяет самостоятельно и вправе не объяснять причины;', 7),
(50, '7.4', 'Нарушения, которые были сняты при помощи внутреннего баланса не учитываются.', 7),
(51, '7.5', 'За систематические нарушения блокировка может быть бессрочной.', 7),
(52, '5.11 Поднятие темы', 'Запрещается последующее поднятие темы чаще, чем один раз в сутки (24 часа).', 5),
(53, '6.1 Мат, оскорбления', 'Категорически запрещается размещение оскорбительных (не только в адрес Пользователей форума), нецензурных, угрожающих, клеветнических, провокационных и пошлых сообщений. Ограничение распространяется как на сообщения в общедоступных разделах форума, так и на закрытые разделы, личные сообщения между пользователями и прикрепляемые к сообщениям файлы;', 6),
(54, '6.2 Обвинение, клевета', 'Клевета в сторону определённого юзера, которая не будет иметь доказательств приведёт к бану на 7-мь суток.', 6),
(55, '6.3 Флуд, флейм, оффтоп, рейтинг', 'Запрещается размещение сообщений, содержащих флуд (пустословие или чрезмерное количество смайлов и других символов), флейм (словесную войну), оффтоп (сообщение, выходящее за рамки заранее установленной темы), большое количество грамматических ошибок. Также запрещается размещение сообщений формата &quot;спасибо&quot;, &quot;спс&quot;, &quot;пасиб&quot; и аналогичного содержания - для этого существует специальная возможность повышения рейтинга форумчанина, при помощи которой можно отблагодарить собеседника на форуме. Для этого необходимо зайти в его профиль и в разделе «Репутация» выбрать &quot;Замечательный&quot;, в случае, если сообщение Вам понравилось;', 6),
(56, '6.4 Реклама', 'Запрещается размещение рекламы конкурирующих проектов WM Тематики, в том числе с просьбой &quot;Посетить/оценить Ваш сайт&quot; без разрешения Администрации. Реклама WM ресурсов или фан-клубов, связанных с тематикой форума допускается на усмотрение Администрации;', 6),
(57, '6.5 Обсуждение Администрации', 'Запрещается обсуждение Пользователями в открытом форуме действий Администрации, а также оскорбление Администрации, в том числе с использованием приватных сообщений. Оскорбления, некорректные и провокационные высказывания в адрес Модераторов форума рассматриваются в особом порядке. Срок банов за них может быть увеличен;', 6),
(58, '6.6 Некомпетентные оценки', 'За неаргументированные оценки к постам/файлам/кодам последует наказание в виде блока аккаунта на 3-е суток.', 6),
(59, '6.7 Жаргонная речь', 'Надуманные ошибки и преднамеренное злостное несоблюдение правил русского языка (в том числе злоупотребление т.н. «падонковским языком») запрещены. За чрезмерное употребление т.н. «албанизмов» может последовать блокировка аккаунта, кроме отдельных, единичных случаев (на усмотрение Администрации);', 6),
(60, '6.8 Спам', 'Запрещено использовать систему личных сообщений, полей профиля или данных в подписи для рассылки пользователям форума не запрошенной ими информации рекламного характера, просьб проголосовать, оказать финансовую помощь или иных данных, противоречащих правилам Форума.\r\nРеферальные ссылки запрещены во всех разделах сайта!;', 6),
(61, '6.9 Ложные жалобы', 'Запрещается оформление ложных жалоб(функция &quot;Пожаловаться&quot;) на сообщения других пользователей. По результатам рассмотрения жалобы, Администрация может выдать наказание пользователю, подавшему жалобу, если нарушений Правил Форума в рассмотренном сообщении не было;', 6),
(62, '6.10 Нарушение законодательства РФ', 'Запрещается размещать на форуме материалы(в т.ч. гиперссылки) с экстремистской направленностью, призывам к насильственному изменению конституционного строя, захвату власти, совершению террористического акта или диверсии, а также направленные на разжигание расовой, национальной, религиозной, социальной вражды и других призывов к нарушению действующего законодательства РФ. Категорически запрещена публикация материалов или обсуждение информации с признаками пропаганды употребления или торговли наркотическими и психотропными веществами, детской порнографии или призывам к суициду.', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `smiles`
--

CREATE TABLE IF NOT EXISTS `smiles` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `name` varchar(35) NOT NULL,
  `file` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=124 ;

--
-- Дамп данных таблицы `smiles`
--

INSERT INTO `smiles` (`id`, `name`, `file`) VALUES
(2, ':-p', 'img_43996.gif'),
(3, ':]]', 'img_17508.gif'),
(4, ':D', 'img_16479.gif'),
(5, '=))', 'img_46369.gif'),
(6, ':-/', 'img_98196.gif'),
(64, ':)', 'img_20020.gif'),
(8, ':-(', 'img_33294.gif'),
(9, '8-)', 'img_68669.gif'),
(10, ';-)', 'img_63375.gif'),
(11, '.болен.', 'img_35182.gif'),
(12, '.ноч.', 'img_76299.gif'),
(13, '.засып.', 'img_45325.gif'),
(14, '.палач.', 'img_21970.gif'),
(15, '.бита.', 'img_95510.gif'),
(16, ':oO:', 'img_45342.gif'),
(17, ':smoke_tru:', 'img_63588.gif'),
(18, ':ru:', 'img_16260.gif'),
(19, ':lol:', 'img_12269.gif'),
(20, ':oops:', 'img_40988.gif'),
(21, ':twisted:', 'img_63942.gif'),
(22, ':fuck:', 'img_51475.gif'),
(23, ':good:', 'img_30913.gif'),
(24, ':laugh1:', 'img_58467.gif'),
(25, ':nono:', 'img_45021.gif'),
(26, ':yahoo:', 'img_14036.gif'),
(27, '.гордо.', 'img_77033.gif'),
(28, '.ор.', 'img_96875.gif'),
(29, '.ржу.', 'img_13796.gif'),
(30, '.еврей.', 'img_78089.gif'),
(70, '.э.', 'img_10005.png'),
(69, '.привет.', 'img_22822.png'),
(68, '.ура.', 'img_99622.png'),
(37, '.duel.', 'img_93205.gif'),
(67, '.мдаа.', 'img_89713.png'),
(39, '.admin.', 'img_18147.png'),
(40, 'angry', 'img_93485.png'),
(41, 'beer', 'img_19842.png'),
(42, 'khm', 'img_52385.png'),
(43, 'cool', 'img_29450.png'),
(44, '.like.', 'img_16621.png'),
(45, 'dislike', 'img_93590.png'),
(104, '.zorro.', 'img_59870.png'),
(47, '.down.', 'img_13326.png'),
(48, '.hi.', 'img_22950.png'),
(119, '.kon.', 'img_34769.png'),
(50, '.lol.', 'img_65057.png'),
(51, '.oO.', 'img_72550.png'),
(114, ':-)', 'img_27961.gif'),
(53, ':(', 'img_67978.png'),
(54, '.чего.', 'img_29640.gif'),
(56, '.воз.', 'img_21604.png'),
(66, '.что.', 'img_66796.png'),
(77, '.boss.', 'img_40877.gif'),
(62, '.emporer.', 'img_76847.gif'),
(71, '.хм.', 'img_45352.png'),
(72, '.танц.', 'img_70545.png'),
(73, '.кия.', 'img_61339.png'),
(74, '.счет.', 'img_14998.png'),
(75, '.пжл.', 'img_26116.png'),
(78, '.krut.', 'img_49493.gif'),
(79, '.lol2.', 'img_97543.gif'),
(80, '.crazy.', 'img_98119.gif'),
(84, '.мда.', 'img_49889.gif'),
(82, '.комп.', 'img_84631.gif'),
(83, '.комплом.', 'img_79501.gif'),
(85, '.зубы.', 'img_22773.gif'),
(87, '.застрел.', 'img_18439.gif'),
(88, '.вглаз.', 'img_65731.gif'),
(96, '.шта.', 'img_90382.png'),
(90, '.идиот.', 'img_59228.gif'),
(97, '.