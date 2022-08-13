-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Фев 11 2019 г., 21:51
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `zzrto_opl`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_log`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 12:33
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `admin_log`;
CREATE TABLE `admin_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `mod` int(11) NOT NULL,
  `act` int(11) NOT NULL,
  `opis` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `admin_log_act`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 12:33
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `admin_log_act`;
CREATE TABLE `admin_log_act` (
  `id` int(11) NOT NULL,
  `id_mod` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `admin_log_mod`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 12:33
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `admin_log_mod`;
CREATE TABLE `admin_log_mod` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `adm_chat`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `adm_chat`;
CREATE TABLE `adm_chat` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `msg` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `all_accesses`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `all_accesses`;
CREATE TABLE `all_accesses` (
  `type` varchar(32) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `apps`
--
-- Создание: Фев 11 2019 г., 09:29
-- Последнее обновление: Фев 11 2019 г., 18:49
--

DROP TABLE IF EXISTS `apps`;
CREATE TABLE `apps` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `opis` varchar(512) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `icon_small` varchar(128) DEFAULT NULL,
  `icon_big` varchar(128) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `count` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ban`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `ban`;
CREATE TABLE `ban` (
  `id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_ban` int(11) NOT NULL,
  `prich` varchar(1024) NOT NULL,
  `view` set('1','0') NOT NULL DEFAULT '0',
  `razdel` varchar(10) DEFAULT 'all',
  `post` int(1) DEFAULT '0',
  `pochemu` int(11) DEFAULT '0',
  `navsegda` int(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ban_ip`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `ban_ip`;
CREATE TABLE `ban_ip` (
  `min` bigint(20) NOT NULL,
  `max` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `bookmarks`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 10:57
--

DROP TABLE IF EXISTS `bookmarks`;
CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_object` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `type` varchar(6) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `chat_post`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `chat_post`;
CREATE TABLE `chat_post` (
  `id` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `msg` varchar(1024) DEFAULT NULL,
  `vopros` int(11) DEFAULT NULL,
  `umnik_st` set('0','1','2','3','4') DEFAULT '0',
  `shutnik` set('0','1') NOT NULL DEFAULT '0',
  `privat` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `chat_rooms`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 10 2019 г., 11:14
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `chat_rooms`;
CREATE TABLE `chat_rooms` (
  `id` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `umnik` set('0','1') DEFAULT '0',
  `shutnik` set('0','1') DEFAULT '0',
  `opis` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `chat_shutnik`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `chat_shutnik`;
CREATE TABLE `chat_shutnik` (
  `id` int(11) NOT NULL,
  `anek` varchar(1024) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `chat_vopros`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `chat_vopros`;
CREATE TABLE `chat_vopros` (
  `id` int(11) NOT NULL,
  `vopros` varchar(1024) NOT NULL,
  `otvet` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `chat_who`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 10 2019 г., 11:42
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `chat_who`;
CREATE TABLE `chat_who` (
  `id_user` int(11) NOT NULL,
  `room` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `cron`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 17:44
--

DROP TABLE IF EXISTS `cron`;
CREATE TABLE `cron` (
  `id` varchar(32) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `discussions`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `discussions`;
CREATE TABLE `discussions` (
  `id` int(11) NOT NULL,
  `avtor` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `count` int(11) DEFAULT '0',
  `msg` varchar(1024) NOT NULL,
  `time` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `id_sim` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `discussions_set`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 18:49
--

DROP TABLE IF EXISTS `discussions_set`;
CREATE TABLE `discussions_set` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `disc_status` int(11) DEFAULT '1',
  `disc_foto` int(11) DEFAULT '1',
  `disc_files` int(11) DEFAULT '1',
  `disc_forum` int(11) DEFAULT '1',
  `disc_notes` int(11) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `foot_links`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `foot_links`;
CREATE TABLE `foot_links` (
  `id` int(11) NOT NULL,
  `name` char(5) NOT NULL DEFAULT '',
  `link` char(30) NOT NULL DEFAULT '',
  `user` int(11) NOT NULL DEFAULT '0',
  `uid` smallint(2) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_f`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `forum_f`;
CREATE TABLE `forum_f` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `pos` int(11) NOT NULL,
  `opis` varchar(512) NOT NULL,
  `adm` set('0','1') NOT NULL DEFAULT '0',
  `icon` varchar(30) DEFAULT 'default'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_files`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `forum_files`;
CREATE TABLE `forum_files` (
  `id` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `ras` varchar(32) NOT NULL,
  `size` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_files_rating`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `forum_files_rating`;
CREATE TABLE `forum_files_rating` (
  `id_file` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `rating` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_p`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `forum_p`;
CREATE TABLE `forum_p` (
  `id` int(11) NOT NULL,
  `id_forum` int(11) NOT NULL,
  `id_razdel` int(11) NOT NULL,
  `id_them` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `msg` varchar(1024) NOT NULL,
  `cit` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_r`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `forum_r`;
CREATE TABLE `forum_r` (
  `id` int(11) NOT NULL,
  `id_forum` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `opis` varchar(256) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_t`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `forum_t`;
CREATE TABLE `forum_t` (
  `id` int(11) NOT NULL,
  `id_forum` int(11) NOT NULL,
  `id_razdel` int(11) DEFAULT NULL,
  `name` varchar(32) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `time_create` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `up` set('0','1') NOT NULL DEFAULT '0',
  `close` set('0','1') NOT NULL DEFAULT '0',
  `text` varchar(2000) NOT NULL,
  `id_edit` int(11) DEFAULT NULL,
  `id_close` int(11) DEFAULT NULL,
  `time_edit` int(11) DEFAULT NULL,
  `vote` varchar(90) DEFAULT NULL,
  `vote_close` enum('0','1') DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `forum_zakl`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `forum_zakl`;
CREATE TABLE `forum_zakl` (
  `id_user` int(11) NOT NULL,
  `id_them` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `time_obn` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `frends`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 14:59
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `frends`;
CREATE TABLE `frends` (
  `user` int(11) NOT NULL DEFAULT '0',
  `frend` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `i` int(1) DEFAULT '0',
  `lenta_forum` int(11) NOT NULL DEFAULT '1',
  `lenta_obmen` int(11) NOT NULL DEFAULT '1',
  `lenta_foto` int(11) NOT NULL DEFAULT '1',
  `lenta_notes` int(11) NOT NULL DEFAULT '1',
  `lenta_avatar` int(11) DEFAULT '1',
  `lenta_frends` int(1) DEFAULT '1',
  `lenta_status` int(1) DEFAULT '1',
  `lenta_status_like` int(1) DEFAULT '1',
  `disc_forum` int(11) NOT NULL DEFAULT '1',
  `disc_obmen` int(11) NOT NULL DEFAULT '1',
  `disc_foto` int(11) NOT NULL DEFAULT '1',
  `disc_notes` int(11) NOT NULL DEFAULT '1',
  `disc_frends` int(1) DEFAULT '1',
  `disc_status` int(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `frends_new`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 14:59
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `frends_new`;
CREATE TABLE `frends_new` (
  `id` int(11) NOT NULL,
  `user` int(11) NOT NULL DEFAULT '0',
  `to` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 15:08
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `gallery`;
CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `time_create` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `opis` varchar(256) NOT NULL,
  `set_password` int(11) NOT NULL,
  `foto_password` varchar(32) NOT NULL,
  `my` int(11) NOT NULL DEFAULT '0',
  `pass` varchar(11) DEFAULT NULL,
  `privat` enum('0','1','2') NOT NULL DEFAULT '0',
  `privat_komm` enum('0','1','2') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_foto`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 15:08
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `gallery_foto`;
CREATE TABLE `gallery_foto` (
  `id` int(11) NOT NULL,
  `id_gallery` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `ras` varchar(4) NOT NULL,
  `type` varchar(64) NOT NULL,
  `opis` varchar(1024) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL,
  `avatar` enum('0','1') DEFAULT '0',
  `pass` varchar(11) DEFAULT NULL,
  `people` int(11) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `metka` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_komm`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `gallery_komm`;
CREATE TABLE `gallery_komm` (
  `id` int(11) NOT NULL,
  `id_foto` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `msg` varchar(1024) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_rating`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `gallery_rating`;
CREATE TABLE `gallery_rating` (
  `id_foto` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `like` int(11) NOT NULL DEFAULT '0',
  `avtor` int(11) NOT NULL DEFAULT '0',
  `ready` int(11) NOT NULL DEFAULT '1',
  `time` int(11) NOT NULL DEFAULT '0',
  `read` int(1) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `gifts_user`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `gifts_user`;
CREATE TABLE `gifts_user` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_ank` int(11) NOT NULL,
  `id_gift` int(11) NOT NULL,
  `anonim` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `coment` varchar(150) NOT NULL,
  `status` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `gift_categories`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `gift_categories`;
CREATE TABLE `gift_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `gift_list`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `gift_list`;
CREATE TABLE `gift_list` (
  `id` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `money` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `group`
--
-- Создание: Фев 10 2019 г., 13:40
-- Последнее обновление: Фев 11 2019 г., 13:16
--

DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `property` int(11) NOT NULL,
  `users` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `foto` int(11) NOT NULL,
  `forum` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `group_forum`
--
-- Создание: Фев 10 2019 г., 13:40
-- Последнее обновление: Фев 10 2019 г., 13:50
--

DROP TABLE IF EXISTS `group_forum`;
CREATE TABLE `group_forum` (
  `id` int(11) NOT NULL,
  `group` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `text` text NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `group_forum_comm`
--
-- Создание: Фев 10 2019 г., 13:40
-- Последнее обновление: Фев 10 2019 г., 13:40
--

DROP TABLE IF EXISTS `group_forum_comm`;
CREATE TABLE `group_forum_comm` (
  `id` int(11) NOT NULL,
  `forum` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `text` text NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `group_foto`
--
-- Создание: Фев 10 2019 г., 13:40
-- Последнее обновление: Фев 10 2019 г., 13:40
--

DROP TABLE IF EXISTS `group_foto`;
CREATE TABLE `group_foto` (
  `id` int(11) NOT NULL,
  `group` int(11) NOT NULL,
  `albom` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `desc` text NOT NULL,
  `time` int(11) NOT NULL,
  `ras` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `group_foto_alb`
--
-- Создание: Фев 10 2019 г., 13:40
-- Последнее обновление: Фев 10 2019 г., 13:40
--

DROP TABLE IF EXISTS `group_foto_alb`;
CREATE TABLE `group_foto_alb` (
  `id` int(11) NOT NULL,
  `time_last` int(11) NOT NULL,
  `group` int(11) NOT NULL,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `defult` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `group_lenta`
--
-- Создание: Фев 10 2019 г., 13:40
-- Последнее обновление: Фев 11 2019 г., 13:16
--

DROP TABLE IF EXISTS `group_lenta`;
CREATE TABLE `group_lenta` (
  `id` int(11) NOT NULL,
  `group` int(11) NOT NULL,
  `text` text NOT NULL,
  `time` int(11) NOT NULL,
  `razdel` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `group_news`
--
-- Создание: Фев 10 2019 г., 13:40
-- Последнее обновление: Фев 10 2019 г., 17:45
--

DROP TABLE IF EXISTS `group_news`;
CREATE TABLE `group_news` (
  `id` int(11) NOT NULL,
  `group` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `text` text NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `group_news_comm`
--
-- Создание: Фев 10 2019 г., 13:40
-- Последнее обновление: Фев 10 2019 г., 13:40
--

DROP TABLE IF EXISTS `group_news_comm`;
CREATE TABLE `group_news_comm` (
  `id` int(11) NOT NULL,
  `news` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `text` text NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `group_users`
--
-- Создание: Фев 10 2019 г., 13:40
-- Последнее обновление: Фев 11 2019 г., 17:52
--

DROP TABLE IF EXISTS `group_users`;
CREATE TABLE `group_users` (
  `id` int(11) NOT NULL,
  `group` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `stat` int(11) NOT NULL,
  `rekl` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `guest`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 12:33
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `guest`;
CREATE TABLE `guest` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `msg` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `guests`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 18:51
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `guests`;
CREATE TABLE `guests` (
  `ip` bigint(20) NOT NULL,
  `ua` varchar(32) NOT NULL,
  `date_aut` int(11) NOT NULL,
  `date_last` int(11) NOT NULL,
  `url` varchar(64) NOT NULL,
  `pereh` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `konts`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `konts`;
CREATE TABLE `konts` (
  `id_user` int(11) NOT NULL,
  `id_kont` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `liders`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 11:06
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `liders`;
CREATE TABLE `liders` (
  `time` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time_p` int(11) NOT NULL,
  `msg` varchar(215) NOT NULL,
  `stav` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `like_object`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 10 2019 г., 11:38
--

DROP TABLE IF EXISTS `like_object`;
CREATE TABLE `like_object` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `type` varchar(11) DEFAULT NULL,
  `like` set('1','0') NOT NULL DEFAULT '0',
  `id_object` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mail`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 15:07
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `mail`;
CREATE TABLE `mail` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kont` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `msg` varchar(1024) NOT NULL,
  `read` set('0','1') NOT NULL DEFAULT '0',
  `unlink` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mail_to_send`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `mail_to_send`;
CREATE TABLE `mail_to_send` (
  `id` int(11) NOT NULL,
  `mail` varchar(64) NOT NULL,
  `them` varchar(32) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mark_files`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `mark_files`;
CREATE TABLE `mark_files` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_file` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mark_foto`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `mark_foto`;
CREATE TABLE `mark_foto` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_foto` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mark_notes`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `mark_notes`;
CREATE TABLE `mark_notes` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_list` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `mark_people`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `mark_people`;
CREATE TABLE `mark_people` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_people` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `media_info`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `media_info`;
CREATE TABLE `media_info` (
  `id` int(11) NOT NULL,
  `file` varchar(64) NOT NULL,
  `size` int(11) NOT NULL,
  `lenght` varchar(32) NOT NULL,
  `bit` varchar(32) NOT NULL,
  `codec` varchar(32) NOT NULL,
  `wh` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `type` enum('link','razd') NOT NULL DEFAULT 'link',
  `name` varchar(32) NOT NULL,
  `url` varchar(32) NOT NULL,
  `counter` varchar(32) NOT NULL,
  `pos` int(11) NOT NULL,
  `icon` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Главное меню';

-- --------------------------------------------------------

--
-- Структура таблицы `my_guests`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 18:49
--

DROP TABLE IF EXISTS `my_guests`;
CREATE TABLE `my_guests` (
  `id` int(11) NOT NULL,
  `id_ank` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `read` enum('0','1') NOT NULL DEFAULT '1',
  `count` int(11) NOT NULL DEFAULT '1',
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 15:51
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `msg` varchar(10024) DEFAULT NULL,
  `time` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `title` varchar(32) DEFAULT NULL,
  `main_time` int(11) NOT NULL DEFAULT '0',
  `link` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news_komm`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `news_komm`;
CREATE TABLE `news_komm` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `msg` varchar(1024) NOT NULL,
  `time` int(11) NOT NULL,
  `id_news` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `notes`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 18:38
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `msg` mediumtext,
  `time` int(11) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `private` int(11) NOT NULL DEFAULT '0',
  `tags` varchar(64) NOT NULL,
  `id_user` int(11) DEFAULT '0',
  `private_komm` int(11) DEFAULT '0',
  `count` int(11) DEFAULT '0',
  `id_dir` int(11) DEFAULT '0',
  `type` int(1) DEFAULT '0',
  `share` enum('0','1') DEFAULT '0',
  `share_id` int(11) DEFAULT NULL,
  `share_text` varchar(20000) DEFAULT NULL,
  `share_name` varchar(60) DEFAULT NULL,
  `share_id_user` int(11) DEFAULT NULL,
  `share_type` varchar(10) DEFAULT 'notes',
  `share_user` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `notes_count`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 18:38
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `notes_count`;
CREATE TABLE `notes_count` (
  `id_notes` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `notes_dir`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `notes_dir`;
CREATE TABLE `notes_dir` (
  `id` int(11) NOT NULL,
  `msg` varchar(1024) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `notes_komm`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `notes_komm`;
CREATE TABLE `notes_komm` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_notes` varchar(50) NOT NULL,
  `msg` varchar(1024) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `notes_like`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `notes_like`;
CREATE TABLE `notes_like` (
  `id_notes` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `like` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `notification`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 14:59
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `id_object` int(11) NOT NULL,
  `type` varchar(11) NOT NULL,
  `avtor` int(11) DEFAULT NULL,
  `all_type` varchar(11) DEFAULT NULL,
  `read` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `notification_set`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 18:49
--

DROP TABLE IF EXISTS `notification_set`;
CREATE TABLE `notification_set` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `komm` int(11) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `obmennik_dir`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `obmennik_dir`;
CREATE TABLE `obmennik_dir` (
  `id` int(11) NOT NULL,
  `num` int(11) DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `ras` varchar(512) NOT NULL,
  `maxfilesize` int(11) NOT NULL,
  `dir` varchar(512) NOT NULL DEFAULT '/',
  `dir_osn` varchar(512) DEFAULT '/',
  `upload` set('1','0') NOT NULL DEFAULT '0',
  `my` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `obmennik_files`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `obmennik_files`;
CREATE TABLE `obmennik_files` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_dir` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `ras` varchar(36) NOT NULL,
  `type` varchar(64) NOT NULL,
  `time` int(11) NOT NULL,
  `time_last` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `k_loads` int(11) DEFAULT '0',
  `time_go` int(11) DEFAULT '0',
  `opis` text NOT NULL,
  `my_dir` int(11) DEFAULT '0',
  `metka` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `obmennik_komm`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `obmennik_komm`;
CREATE TABLE `obmennik_komm` (
  `id` int(11) NOT NULL,
  `id_file` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `msg` varchar(1024) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `opsos`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `opsos`;
CREATE TABLE `opsos` (
  `min` bigint(11) DEFAULT NULL,
  `max` bigint(11) DEFAULT NULL,
  `opsos` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `reg_mail`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `reg_mail`;
CREATE TABLE `reg_mail` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `mail` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `reg_msg`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `reg_msg`;
CREATE TABLE `reg_msg` (
  `msg` varchar(2000) NOT NULL,
  `money` varchar(6) DEFAULT '1',
  `rating` varchar(3) DEFAULT '1',
  `balls` varchar(6) DEFAULT '1',
  `id` varchar(128) DEFAULT '1',
  `on` int(2) DEFAULT '1',
  `true` int(2) DEFAULT '0',
  `gift` int(11) DEFAULT NULL,
  `gift_msg` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rekl`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `rekl`;
CREATE TABLE `rekl` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `img` varchar(64) NOT NULL,
  `link` varchar(64) NOT NULL,
  `time_last` int(11) NOT NULL,
  `sel` set('1','2','3','4') NOT NULL DEFAULT '1',
  `count` int(11) NOT NULL DEFAULT '0',
  `dop_str` set('0','1') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rules`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules` (
  `id` int(11) NOT NULL,
  `msg` mediumtext,
  `time` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `title` varchar(60) DEFAULT NULL,
  `url` varchar(999) DEFAULT NULL,
  `name_url` varchar(52) DEFAULT NULL,
  `pos` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `rules_p`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `rules_p`;
CREATE TABLE `rules_p` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `msg` mediumtext NOT NULL,
  `time` int(11) NOT NULL,
  `id_news` int(11) NOT NULL,
  `pos` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sexwars`
--
-- Создание: Фев 11 2019 г., 09:45
-- Последнее обновление: Фев 11 2019 г., 18:50
--

DROP TABLE IF EXISTS `sexwars`;
CREATE TABLE `sexwars` (
  `id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `time_end` int(11) DEFAULT '0',
  `male` int(11) DEFAULT '0',
  `female` int(11) DEFAULT '0',
  `win` varchar(128) DEFAULT '0',
  `active` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sexwars_chat`
--
-- Создание: Фев 11 2019 г., 09:45
-- Последнее обновление: Фев 11 2019 г., 09:45
--

DROP TABLE IF EXISTS `sexwars_chat`;
CREATE TABLE `sexwars_chat` (
  `id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `msg` varchar(512) DEFAULT NULL,
  `id_tournament` int(11) DEFAULT '0',
  `sex` varchar(12) DEFAULT 'male'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sexwars_users`
--
-- Создание: Фев 11 2019 г., 09:45
-- Последнее обновление: Фев 11 2019 г., 18:50
--

DROP TABLE IF EXISTS `sexwars_users`;
CREATE TABLE `sexwars_users` (
  `id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `level` int(11) DEFAULT '0',
  `sex` varchar(32) NOT NULL DEFAULT 'male',
  `rating` int(11) DEFAULT '0',
  `time_reboot` int(11) DEFAULT '0',
  `count_weapon` int(11) DEFAULT '0',
  `count_win` int(11) DEFAULT '0',
  `count_loss` int(11) DEFAULT '0',
  `id_tournament` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `sexwars_weapons`
--
-- Создание: Фев 11 2019 г., 09:45
-- Последнее обновление: Фев 11 2019 г., 18:50
--

DROP TABLE IF EXISTS `sexwars_weapons`;
CREATE TABLE `sexwars_weapons` (
  `id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `id_user` int(11) DEFAULT '0',
  `id_tournament` int(11) DEFAULT '0',
  `id_weapon` int(11) DEFAULT '1',
  `type` varchar(32) DEFAULT 'tomate',
  `style` varchar(512) DEFAULT '',
  `sex` varchar(128) DEFAULT 'male'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `smile`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `smile`;
CREATE TABLE `smile` (
  `id` int(11) NOT NULL,
  `smile` varchar(64) NOT NULL,
  `dir` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `smile_dir`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `smile_dir`;
CREATE TABLE `smile_dir` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `opis` varchar(320) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `spamus`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `spamus`;
CREATE TABLE `spamus` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `msg` varchar(512) DEFAULT NULL,
  `razdel` varchar(40) DEFAULT NULL,
  `id_spam` int(11) NOT NULL,
  `types` int(11) DEFAULT '0',
  `time` int(12) DEFAULT NULL,
  `id_post` int(111) DEFAULT NULL,
  `spam` varchar(1000) DEFAULT NULL,
  `id_object` int(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `status`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `msg` varchar(1024) NOT NULL,
  `like` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `pokaz` int(11) NOT NULL,
  `rating` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `status_komm`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `status_komm`;
CREATE TABLE `status_komm` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `msg` varchar(1024) NOT NULL,
  `like` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `id_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `status_like`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `status_like`;
CREATE TABLE `status_like` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `id_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `stena`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 18:38
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `stena`;
CREATE TABLE `stena` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_stena` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `msg` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `read` int(11) DEFAULT '1',
  `info_1` varchar(18) DEFAULT '0',
  `type` varchar(8) DEFAULT 'notes',
  `info` varchar(256) DEFAULT 'Error. Информация не доступна'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `stena_komm`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `stena_komm`;
CREATE TABLE `stena_komm` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `msg` varchar(1024) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `id_stena` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `stena_like`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `stena_like`;
CREATE TABLE `stena_like` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_stena` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `survey_v`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `survey_v`;
CREATE TABLE `survey_v` (
  `id_s` int(11) NOT NULL,
  `id_r` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tape`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `tape`;
CREATE TABLE `tape` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `id_file` int(11) NOT NULL,
  `avtor` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `type` varchar(24) NOT NULL,
  `read` set('0','1') NOT NULL DEFAULT '0',
  `avatar` int(11) DEFAULT '0',
  `ot_kogo` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tape_set`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 18:49
--

DROP TABLE IF EXISTS `tape_set`;
CREATE TABLE `tape_set` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `lenta_status_like` int(11) DEFAULT '1',
  `lenta_status` int(11) DEFAULT '1',
  `lenta_foto` int(11) DEFAULT '1',
  `lenta_files` int(11) DEFAULT '1',
  `lenta_forum` int(11) DEFAULT '1',
  `lenta_notes` int(11) DEFAULT '1',
  `lenta_avatar` int(11) DEFAULT '1',
  `lenta_frends` int(11) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--
-- Создание: Фев 10 2019 г., 13:23
-- Последнее обновление: Фев 11 2019 г., 18:50
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nick` varchar(32) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `sess` varchar(32) DEFAULT NULL,
  `activation` varchar(32) DEFAULT NULL,
  `ban` int(11) NOT NULL DEFAULT '0',
  `ban_pr` varchar(64) DEFAULT NULL,
  `ip` bigint(20) NOT NULL DEFAULT '0',
  `ip_cl` bigint(20) NOT NULL DEFAULT '0',
  `ip_xff` bigint(20) NOT NULL DEFAULT '0',
  `ua` varchar(32) DEFAULT NULL,
  `date_reg` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `date_aut` int(11) NOT NULL DEFAULT '0',
  `date_last` int(11) NOT NULL DEFAULT '0',
  `balls` int(11) NOT NULL DEFAULT '0',
  `rating` int(11) NOT NULL DEFAULT '0',
  `level` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `group_access` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `pol` enum('0','1') NOT NULL DEFAULT '1',
  `url` varchar(64) NOT NULL DEFAULT '/',
  `show_url` enum('0','1') NOT NULL DEFAULT '1',
  `ank_g_r` int(4) DEFAULT NULL,
  `ank_m_r` int(2) DEFAULT NULL,
  `ank_d_r` int(2) DEFAULT NULL,
  `ank_city` varchar(32) DEFAULT NULL,
  `ank_o_sebe` varchar(512) DEFAULT NULL,
  `ank_icq` int(9) DEFAULT NULL,
  `ank_skype` varchar(16) DEFAULT NULL,
  `ank_mail` varchar(32) DEFAULT NULL,
  `ank_n_tel` varchar(11) DEFAULT NULL,
  `ank_name` varchar(32) DEFAULT NULL,
  `set_time_chat` int(11) DEFAULT '30',
  `set_p_str` int(11) DEFAULT '10',
  `set_show_icon` set('0','1','2') DEFAULT '1',
  `set_translit` enum('0','1') NOT NULL DEFAULT '1',
  `set_files` enum('0','1') NOT NULL DEFAULT '0',
  `set_timesdvig` int(11) NOT NULL DEFAULT '0',
  `set_news_to_mail` enum('0','1') NOT NULL DEFAULT '0',
  `set_show_mail` enum('0','1') NOT NULL DEFAULT '0',
  `set_them` varchar(32) DEFAULT 'default',
  `set_them2` varchar(32) DEFAULT 'default',
  `meteo_country` int(11) NOT NULL DEFAULT '0',
  `autorization` enum('0','1') NOT NULL DEFAULT '0',
  `add_konts` enum('0','1','2') NOT NULL DEFAULT '1',
  `wall` int(1) DEFAULT '1',
  `browser` varchar(3) DEFAULT 'wap',
  `ank_rost` int(11) DEFAULT NULL,
  `ank_ves` int(11) DEFAULT NULL,
  `ank_telosl` int(1) NOT NULL,
  `ank_cvet_glas` varchar(11) NOT NULL,
  `ank_volos` varchar(11) NOT NULL,
  `ank_orien` int(1) DEFAULT '0',
  `ank_lov_1` int(11) DEFAULT '0',
  `ank_lov_2` int(11) DEFAULT '0',
  `ank_lov_3` int(11) DEFAULT '0',
  `ank_lov_4` int(11) DEFAULT '0',
  `ank_lov_5` int(11) DEFAULT '0',
  `ank_lov_6` int(11) DEFAULT '0',
  `ank_lov_7` int(11) DEFAULT '0',
  `ank_lov_8` int(11) DEFAULT '0',
  `ank_lov_9` int(11) DEFAULT '0',
  `ank_lov_10` int(11) DEFAULT '0',
  `ank_lov_11` int(11) DEFAULT '0',
  `ank_lov_12` int(11) DEFAULT '0',
  `ank_lov_13` int(11) DEFAULT '0',
  `ank_lov_14` int(11) DEFAULT '0',
  `ank_lov_15` int(11) DEFAULT '0',
  `ank_o_par` varchar(215) NOT NULL,
  `ank_zan` varchar(215) NOT NULL,
  `ank_smok` int(11) NOT NULL,
  `ank_mat_pol` int(11) NOT NULL,
  `ank_proj` int(11) NOT NULL,
  `ank_baby` int(11) NOT NULL,
  `ank_avto` varchar(215) NOT NULL,
  `ank_avto_n` int(11) NOT NULL,
  `ank_alko` varchar(215) DEFAULT NULL,
  `ank_alko_n` int(11) DEFAULT '0',
  `ank_nark` int(11) DEFAULT '0',
  `rating_tmp` int(11) DEFAULT '0',
  `sort` int(1) DEFAULT '0',
  `news_read` int(1) DEFAULT '0',
  `ban_where` varchar(10) DEFAULT NULL,
  `abuld` int(1) DEFAULT '0',
  `vk_id` int(11) DEFAULT NULL,
  `type_reg` varchar(100) DEFAULT NULL,
  `identity` varchar(100) DEFAULT NULL,
  `set_nick` int(1) DEFAULT '0',
  `hello` varchar(35) DEFAULT NULL,
  `panel_style` varchar(6) DEFAULT '6780b2',
  `panel` int(2) DEFAULT '11',
  `panel_vid` enum('0','1') DEFAULT '0',
  `p_time` enum('0','1') DEFAULT '0',
  `money` int(11) DEFAULT '0',
  `mailTypingId` int(11) DEFAULT NULL,
  `official` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users_konts`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 15:07
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `users_konts`;
CREATE TABLE `users_konts` (
  `id_user` int(11) NOT NULL,
  `id_kont` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `new_msg` int(11) NOT NULL DEFAULT '0',
  `type` enum('common','ignor','favorite','deleted') NOT NULL DEFAULT 'common',
  `name` varchar(64) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_apps`
--
-- Создание: Фев 11 2019 г., 09:29
-- Последнее обновление: Фев 11 2019 г., 18:49
--

DROP TABLE IF EXISTS `user_apps`;
CREATE TABLE `user_apps` (
  `id_user` int(11) NOT NULL,
  `id_apps` varchar(100) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_collision`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `user_collision`;
CREATE TABLE `user_collision` (
  `id_user` int(11) NOT NULL,
  `id_user2` int(11) NOT NULL,
  `type` set('sess','ip_ua_time') NOT NULL DEFAULT 'sess'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_files`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:37
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `user_files`;
CREATE TABLE `user_files` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `time` int(11) NOT NULL,
  `msg` varchar(256) NOT NULL,
  `id_dir` int(11) DEFAULT NULL,
  `osn` int(1) DEFAULT '0',
  `type` varchar(20) DEFAULT NULL,
  `id_dires` varchar(215) DEFAULT '/',
  `pass` varchar(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_group`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 10 2019 г., 10:43
--

DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `level` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_group`
--

INSERT INTO `user_group` (`id`, `name`, `level`) VALUES
(1, 'РџРѕР»СЊР·РѕРІР°С‚РµР»СЊ', 0),
(2, 'РњРѕРґРµСЂР°С‚РѕСЂ С‡Р°С‚Р°', 1),
(3, 'РњРѕРґРµСЂР°С‚РѕСЂ С„РѕСЂСѓРјР°', 1),
(4, 'Основательа', 1),
(5, 'РњРѕРґРµСЂР°С‚РѕСЂ Р±РёР±Р»РёРѕС', 1),
(6, 'РњРѕРґРµСЂР°С‚РѕСЂ С„РѕС‚РѕРіР°Р', 1),
(7, 'РњРѕРґРµСЂР°С‚РѕСЂ', 2),
(8, 'РђРґРјРёРЅРёСЃС‚СЂР°С‚РѕСЂ', 3),
(9, 'Р“Р»Р°РІРЅС‹Р№ Р°РґРјРёРЅРёСЃС‚С', 9),
(15, 'Основатель проекта', 10),
(11, 'РњРѕРґРµСЂР°С‚РѕСЂ РґРЅРµРІРЅРёР', 1),
(12, 'РњРѕРґРµСЂР°С‚РѕСЂ РіРѕСЃС‚РµРІР', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user_group_access`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 10 2019 г., 10:39
-- Последняя проверка: Фев 10 2019 г., 10:39
--

DROP TABLE IF EXISTS `user_group_access`;
CREATE TABLE `user_group_access` (
  `id_group` int(10) UNSIGNED NOT NULL,
  `id_access` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_group_access`
--

INSERT INTO `user_group_access` (`id_group`, `id_access`) VALUES
(2, 'adm_info'),
(2, 'adm_panel_show'),
(2, 'adm_ref'),
(2, 'adm_set_chat'),
(2, 'adm_show_adm'),
(2, 'adm_statistic'),
(2, 'chat_clear'),
(2, 'chat_room'),
(2, 'user_ban_set'),
(2, 'user_ban_set_h'),
(2, 'user_ban_unset'),
(2, 'user_prof_edit'),
(2, 'user_show_add_info'),
(2, 'user_show_ua'),
(3, 'adm_banlist'),
(3, 'adm_panel_show'),
(3, 'adm_set_forum'),
(3, 'adm_show_adm'),
(3, 'adm_statistic'),
(3, 'forum_for_edit'),
(3, 'forum_post_ed'),
(3, 'forum_razd_create'),
(3, 'forum_razd_edit'),
(3, 'forum_them_del'),
(3, 'forum_them_edit'),
(3, 'user_ban_set_h'),
(3, 'user_prof_edit'),
(3, 'user_show_add_info'),
(3, 'user_show_ip'),
(3, 'user_show_ua'),
(4, 'adm_info'),
(4, 'adm_panel_show'),
(4, 'adm_set_loads'),
(4, 'adm_show_adm'),
(4, 'adm_statistic'),
(4, 'loads_dir_create'),
(4, 'loads_dir_delete'),
(4, 'loads_dir_mesto'),
(4, 'loads_dir_rename'),
(4, 'loads_file_delete'),
(4, 'loads_file_edit'),
(4, 'loads_file_upload'),
(4, 'loads_unzip'),
(5, 'adm_info'),
(5, 'adm_lib_repair'),
(5, 'adm_panel_show'),
(5, 'adm_ref'),
(5, 'adm_set_foto'),
(5, 'adm_statistic'),
(5, 'lib_dir_create'),
(5, 'lib_dir_delete'),
(5, 'lib_dir_edit'),
(5, 'lib_dir_mesto'),
(5, 'lib_stat_create'),
(5, 'lib_stat_delete'),
(5, 'lib_stat_txt'),
(5, 'lib_stat_zip'),
(5, 'user_ban_set_h'),
(5, 'user_prof_edit'),
(6, 'adm_banlist'),
(6, 'adm_info'),
(6, 'adm_panel_show'),
(6, 'adm_set_foto'),
(6, 'adm_show_adm'),
(6, 'adm_statistic'),
(6, 'foto_alb_del'),
(6, 'foto_foto_edit'),
(6, 'foto_komm_del'),
(6, 'user_ban_set_h'),
(6, 'user_show_ua'),
(7, 'adm_banlist'),
(7, 'adm_lib_repair'),
(7, 'adm_panel_show'),
(7, 'adm_set_chat'),
(7, 'adm_set_forum'),
(7, 'adm_set_foto'),
(7, 'adm_statistic'),
(7, 'chat_clear'),
(7, 'chat_room'),
(7, 'forum_post_close'),
(7, 'forum_post_ed'),
(7, 'forum_razd_create'),
(7, 'forum_razd_edit'),
(7, 'forum_them_del'),
(7, 'forum_them_edit'),
(7, 'foto_foto_edit'),
(7, 'foto_komm_del'),
(7, 'guest_clear'),
(7, 'guest_delete'),
(7, 'guest_show_ip'),
(7, 'lib_stat_create'),
(7, 'lib_stat_txt'),
(7, 'loads_file_delete'),
(7, 'loads_file_edit'),
(7, 'loads_file_upload'),
(7, 'notes_delete'),
(7, 'notes_edit'),
(7, 'obmen_dir_create'),
(7, 'obmen_dir_delete'),
(7, 'obmen_dir_edit'),
(7, 'obmen_file_delete'),
(7, 'obmen_file_edit'),
(7, 'obmen_komm_del'),
(7, 'user_ban_set'),
(7, 'user_ban_set_h'),
(7, 'user_ban_unset'),
(7, 'user_collisions'),
(7, 'user_prof_edit'),
(7, 'user_show_add_info'),
(7, 'user_show_ua'),
(8, 'adm_banlist'),
(8, 'adm_ban_ip'),
(8, 'adm_forum_sinc'),
(8, 'adm_info'),
(8, 'adm_lib_repair'),
(8, 'adm_news'),
(8, 'adm_panel_show'),
(8, 'adm_ref'),
(8, 'adm_set_chat'),
(8, 'adm_set_forum'),
(8, 'adm_set_foto'),
(8, 'adm_set_loads'),
(8, 'adm_show_adm'),
(8, 'adm_statistic'),
(8, 'chat_clear'),
(8, 'chat_room'),
(8, 'forum_for_create'),
(8, 'forum_for_delete'),
(8, 'forum_for_edit'),
(8, 'forum_post_ed'),
(8, 'forum_razd_create'),
(8, 'forum_razd_edit'),
(8, 'forum_them_del'),
(8, 'forum_them_edit'),
(8, 'foto_alb_del'),
(8, 'foto_foto_edit'),
(8, 'foto_komm_del'),
(8, 'guest_clear'),
(8, 'guest_delete'),
(8, 'guest_show_ip'),
(8, 'lib_dir_create'),
(8, 'lib_dir_delete'),
(8, 'lib_dir_edit'),
(8, 'lib_dir_mesto'),
(8, 'lib_stat_create'),
(8, 'lib_stat_delete'),
(8, 'lib_stat_txt'),
(8, 'lib_stat_zip'),
(8, 'loads_dir_create'),
(8, 'loads_dir_delete'),
(8, 'loads_dir_mesto'),
(8, 'loads_dir_rename'),
(8, 'loads_file_delete'),
(8, 'loads_file_edit'),
(8, 'loads_file_upload'),
(8, 'loads_unzip'),
(8, 'notes_delete'),
(8, 'notes_edit'),
(8, 'obmen_dir_create'),
(8, 'obmen_dir_delete'),
(8, 'obmen_dir_edit'),
(8, 'obmen_file_delete'),
(8, 'obmen_file_edit'),
(8, 'obmen_komm_del'),
(8, 'user_ban_set'),
(8, 'user_ban_set_h'),
(8, 'user_ban_unset'),
(8, 'user_change_group'),
(8, 'user_change_nick'),
(8, 'user_collisions'),
(8, 'user_delete'),
(8, 'user_prof_edit'),
(8, 'user_show_add_info'),
(8, 'user_show_ip'),
(8, 'user_show_ua'),
(8, 'votes_create'),
(8, 'votes_settings'),
(9, 'adm_banlist'),
(9, 'adm_ban_ip'),
(9, 'adm_forum_sinc'),
(9, 'adm_info'),
(9, 'adm_ip_edit'),
(9, 'adm_lib_repair'),
(9, 'adm_log_read'),
(9, 'adm_menu'),
(9, 'adm_news'),
(9, 'adm_panel_show'),
(9, 'adm_ref'),
(9, 'adm_rekl'),
(9, 'adm_set_chat'),
(9, 'adm_set_forum'),
(9, 'adm_set_foto'),
(9, 'adm_set_loads'),
(9, 'adm_set_sys'),
(9, 'adm_set_user'),
(9, 'adm_show_adm'),
(9, 'adm_statistic'),
(9, 'adm_themes'),
(9, 'chat_clear'),
(9, 'chat_room'),
(9, 'forum_for_create'),
(9, 'forum_for_delete'),
(9, 'forum_for_edit'),
(9, 'forum_post_close'),
(9, 'forum_post_ed'),
(9, 'forum_razd_create'),
(9, 'forum_razd_edit'),
(9, 'forum_them_del'),
(9, 'forum_them_edit'),
(9, 'foto_alb_del'),
(9, 'foto_foto_edit'),
(9, 'foto_komm_del'),
(9, 'guest_clear'),
(9, 'guest_delete'),
(9, 'guest_show_ip'),
(9, 'lib_dir_create'),
(9, 'lib_dir_delete'),
(9, 'lib_dir_edit'),
(9, 'lib_dir_mesto'),
(9, 'lib_stat_create'),
(9, 'lib_stat_delete'),
(9, 'lib_stat_txt'),
(9, 'lib_stat_zip'),
(9, 'loads_dir_create'),
(9, 'loads_dir_delete'),
(9, 'loads_dir_mesto'),
(9, 'loads_dir_rename'),
(9, 'loads_file_delete'),
(9, 'loads_file_edit'),
(9, 'loads_file_import'),
(9, 'loads_file_upload'),
(9, 'loads_unzip'),
(9, 'notes_delete'),
(9, 'notes_edit'),
(9, 'obmen_dir_create'),
(9, 'obmen_dir_delete'),
(9, 'obmen_dir_edit'),
(9, 'obmen_file_delete'),
(9, 'obmen_file_edit'),
(9, 'obmen_komm_del'),
(9, 'user_ban_set'),
(9, 'user_ban_set_h'),
(9, 'user_ban_unset'),
(9, 'user_change_group'),
(9, 'user_change_nick'),
(9, 'user_collisions'),
(9, 'user_delete'),
(9, 'user_mass_delete'),
(9, 'user_prof_edit'),
(9, 'user_show_add_info'),
(9, 'user_show_ip'),
(9, 'user_show_ua'),
(9, 'votes_create'),
(9, 'votes_settings'),
(11, 'adm_banlist'),
(11, 'adm_info'),
(11, 'adm_panel_show'),
(11, 'adm_show_adm'),
(11, 'adm_statistic'),
(11, 'forum_post_close'),
(11, 'notes_delete'),
(11, 'notes_edit'),
(11, 'user_ban_set'),
(11, 'user_ban_set_h'),
(12, 'adm_banlist'),
(12, 'adm_info'),
(12, 'adm_panel_show'),
(12, 'adm_show_adm'),
(12, 'adm_statistic'),
(12, 'guest_clear'),
(12, 'guest_delete'),
(12, 'user_ban_set'),
(12, 'user_ban_set_h'),
(15, 'adm_accesses'),
(15, 'adm_banlist'),
(15, 'adm_ban_ip'),
(15, 'adm_forum_sinc'),
(15, 'adm_info'),
(15, 'adm_ip_edit'),
(15, 'adm_lib_repair'),
(15, 'adm_log_delete'),
(15, 'adm_log_read'),
(15, 'adm_menu'),
(15, 'adm_mysql'),
(15, 'adm_news'),
(15, 'adm_panel_show'),
(15, 'adm_ref'),
(15, 'adm_rekl'),
(15, 'adm_set_chat'),
(15, 'adm_set_forum'),
(15, 'adm_set_foto'),
(15, 'adm_set_loads'),
(15, 'adm_set_sys'),
(15, 'adm_set_user'),
(15, 'adm_show_adm'),
(15, 'adm_statistic'),
(15, 'adm_themes'),
(15, 'chat_clear'),
(15, 'chat_room'),
(15, 'forum_for_create'),
(15, 'forum_for_delete'),
(15, 'forum_for_edit'),
(15, 'forum_post_close'),
(15, 'forum_post_ed'),
(15, 'forum_razd_create'),
(15, 'forum_razd_edit'),
(15, 'forum_them_del'),
(15, 'forum_them_edit'),
(15, 'foto_alb_del'),
(15, 'foto_foto_edit'),
(15, 'foto_komm_del'),
(15, 'guest_clear'),
(15, 'guest_delete'),
(15, 'guest_show_ip'),
(15, 'lib_dir_create'),
(15, 'lib_dir_delete'),
(15, 'lib_dir_edit'),
(15, 'lib_dir_mesto'),
(15, 'lib_stat_create'),
(15, 'lib_stat_delete'),
(15, 'lib_stat_txt'),
(15, 'lib_stat_zip'),
(15, 'loads_dir_create'),
(15, 'loads_dir_delete'),
(15, 'loads_dir_mesto'),
(15, 'loads_dir_rename'),
(15, 'loads_file_delete'),
(15, 'loads_file_edit'),
(15, 'loads_file_import'),
(15, 'loads_file_upload'),
(15, 'loads_unzip'),
(15, 'notes_delete'),
(15, 'notes_edit'),
(15, 'obmen_dir_create'),
(15, 'obmen_dir_delete'),
(15, 'obmen_dir_edit'),
(15, 'obmen_file_delete'),
(15, 'obmen_file_edit'),
(15, 'obmen_komm_del'),
(15, 'user_ban_set'),
(15, 'user_ban_set_h'),
(15, 'user_ban_unset'),
(15, 'user_change_group'),
(15, 'user_change_nick'),
(15, 'user_collisions'),
(15, 'user_delete'),
(15, 'user_mass_delete'),
(15, 'user_prof_edit'),
(15, 'user_show_add_info'),
(15, 'user_show_ip'),
(15, 'user_show_ua'),
(15, 'votes_create'),
(15, 'votes_settings');

-- --------------------------------------------------------

--
-- Структура таблицы `user_log`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 15:46
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `method` set('1','0') NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL,
  `ip` bigint(20) NOT NULL DEFAULT '0',
  `ua` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_music`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `user_music`;
CREATE TABLE `user_music` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `dir` varchar(64) NOT NULL,
  `id_file` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_nevidimka`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `user_nevidimka`;
CREATE TABLE `user_nevidimka` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `anonim` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_ref`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 18:31
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `user_ref`;
CREATE TABLE `user_ref` (
  `id` int(10) UNSIGNED NOT NULL,
  `time` int(10) UNSIGNED NOT NULL,
  `id_user` int(10) UNSIGNED NOT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `type_input` varchar(12) DEFAULT 'cookie'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_set`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 18:49
--

DROP TABLE IF EXISTS `user_set`;
CREATE TABLE `user_set` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `privat_str` int(11) DEFAULT '1',
  `privat_mail` int(11) DEFAULT '1',
  `ocenka` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_voice2`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `user_voice2`;
CREATE TABLE `user_voice2` (
  `id_user` int(11) NOT NULL,
  `id_kont` int(11) NOT NULL,
  `rating` int(11) NOT NULL DEFAULT '0',
  `msg` varchar(256) DEFAULT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `us_icons`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 11:10
--

DROP TABLE IF EXISTS `us_icons`;
CREATE TABLE `us_icons` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_icon` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `visit_everyday`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 10 2019 г., 21:00
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `visit_everyday`;
CREATE TABLE `visit_everyday` (
  `time` int(11) NOT NULL,
  `host` int(11) NOT NULL,
  `hit` int(11) NOT NULL,
  `host_ip_ua` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `visit_today`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 11 2019 г., 18:51
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `visit_today`;
CREATE TABLE `visit_today` (
  `ip` bigint(11) NOT NULL,
  `ua` varchar(128) DEFAULT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `votes_forum`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
-- Последняя проверка: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `votes_forum`;
CREATE TABLE `votes_forum` (
  `id` int(11) NOT NULL,
  `them` int(11) NOT NULL,
  `var` varchar(32) NOT NULL,
  `num` varchar(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `votes_user`
--
-- Создание: Фев 09 2019 г., 17:36
-- Последнее обновление: Фев 09 2019 г., 17:36
--

DROP TABLE IF EXISTS `votes_user`;
CREATE TABLE `votes_user` (
  `id` int(11) NOT NULL,
  `them` int(11) NOT NULL,
  `var` varchar(32) NOT NULL,
  `id_user` int(11) NOT NULL,
  `time` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_log`
--
ALTER TABLE `admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mod` (`mod`),
  ADD KEY `act` (`act`);

--
-- Индексы таблицы `admin_log_act`
--
ALTER TABLE `admin_log_act`
  ADD PRIMARY KEY (`id`),
  ADD KEY `act` (`name`),
  ADD KEY `id_mod` (`id_mod`);

--
-- Индексы таблицы `admin_log_mod`
--
ALTER TABLE `admin_log_mod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `adm_chat`
--
ALTER TABLE `adm_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `all_accesses`
--
ALTER TABLE `all_accesses`
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ban`
--
ALTER TABLE `ban`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`,`id_ban`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `ban_ip`
--
ALTER TABLE `ban_ip`
  ADD KEY `min` (`min`,`max`);

--
-- Индексы таблицы `bookmarks`
--
ALTER TABLE `bookmarks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `chat_post`
--
ALTER TABLE `chat_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room` (`room`);

--
-- Индексы таблицы `chat_rooms`
--
ALTER TABLE `chat_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos` (`pos`,`umnik`,`shutnik`);

--
-- Индексы таблицы `chat_shutnik`
--
ALTER TABLE `chat_shutnik`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `chat_vopros`
--
ALTER TABLE `chat_vopros`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `chat_who`
--
ALTER TABLE `chat_who`
  ADD KEY `id_user` (`id_user`,`room`,`time`);

--
-- Индексы таблицы `cron`
--
ALTER TABLE `cron`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `discussions`
--
ALTER TABLE `discussions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `discussions_set`
--
ALTER TABLE `discussions_set`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `foot_links`
--
ALTER TABLE `foot_links`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `forum_f`
--
ALTER TABLE `forum_f`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `forum_files`
--
ALTER TABLE `forum_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_post` (`id_post`);

--
-- Индексы таблицы `forum_files_rating`
--
ALTER TABLE `forum_files_rating`
  ADD KEY `id_file` (`id_file`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `forum_p`
--
ALTER TABLE `forum_p`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `time` (`time`),
  ADD KEY `id_forum` (`id_forum`),
  ADD KEY `id_razdel` (`id_razdel`),
  ADD KEY `id_them` (`id_them`);
ALTER TABLE `forum_p` ADD FULLTEXT KEY `msg` (`msg`);

--
-- Индексы таблицы `forum_r`
--
ALTER TABLE `forum_r`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_forum` (`id_forum`,`time`);

--
-- Индексы таблицы `forum_t`
--
ALTER TABLE `forum_t`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_forum` (`id_forum`,`id_razdel`);
ALTER TABLE `forum_t` ADD FULLTEXT KEY `name` (`name`);

--
-- Индексы таблицы `forum_zakl`
--
ALTER TABLE `forum_zakl`
  ADD KEY `id_user` (`id_user`,`id_them`,`time`);

--
-- Индексы таблицы `frends`
--
ALTER TABLE `frends`
  ADD PRIMARY KEY (`user`,`frend`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `frends_new`
--
ALTER TABLE `frends_new`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `gallery_foto`
--
ALTER TABLE `gallery_foto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_gallery` (`id_gallery`);

--
-- Индексы таблицы `gallery_komm`
--
ALTER TABLE `gallery_komm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_foto` (`id_foto`);

--
-- Индексы таблицы `gallery_rating`
--
ALTER TABLE `gallery_rating`
  ADD KEY `id_foto` (`id_foto`,`id_user`);

--
-- Индексы таблицы `gifts_user`
--
ALTER TABLE `gifts_user`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gift_categories`
--
ALTER TABLE `gift_categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `gift_list`
--
ALTER TABLE `gift_list`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_forum`
--
ALTER TABLE `group_forum`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_forum_comm`
--
ALTER TABLE `group_forum_comm`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_foto`
--
ALTER TABLE `group_foto`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_foto_alb`
--
ALTER TABLE `group_foto_alb`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_lenta`
--
ALTER TABLE `group_lenta`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_news`
--
ALTER TABLE `group_news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_news_comm`
--
ALTER TABLE `group_news_comm`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `group_users`
--
ALTER TABLE `group_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `guests`
--
ALTER TABLE `guests`
  ADD KEY `ip_2` (`ip`,`ua`);

--
-- Индексы таблицы `konts`
--
ALTER TABLE `konts`
  ADD KEY `id_user` (`id_user`,`id_kont`,`time`);

--
-- Индексы таблицы `liders`
--
ALTER TABLE `liders`
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `like_object`
--
ALTER TABLE `like_object`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`,`id_kont`),
  ADD KEY `read` (`read`);

--
-- Индексы таблицы `mail_to_send`
--
ALTER TABLE `mail_to_send`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `mark_files`
--
ALTER TABLE `mark_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `mark_foto`
--
ALTER TABLE `mark_foto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `mark_notes`
--
ALTER TABLE `mark_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `mark_people`
--
ALTER TABLE `mark_people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `media_info`
--
ALTER TABLE `media_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file` (`file`,`size`);

--
-- Индексы таблицы `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pos` (`pos`);

--
-- Индексы таблицы `my_guests`
--
ALTER TABLE `my_guests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `news_komm`
--
ALTER TABLE `news_komm`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `notes_count`
--
ALTER TABLE `notes_count`
  ADD KEY `id_notes` (`id_notes`,`id_user`);

--
-- Индексы таблицы `notes_dir`
--
ALTER TABLE `notes_dir`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notes_komm`
--
ALTER TABLE `notes_komm`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notes_like`
--
ALTER TABLE `notes_like`
  ADD KEY `id_notes` (`id_notes`,`id_user`);

--
-- Индексы таблицы `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notification_set`
--
ALTER TABLE `notification_set`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `obmennik_dir`
--
ALTER TABLE `obmennik_dir`
  ADD PRIMARY KEY (`id`),
  ADD KEY `num` (`num`),
  ADD KEY `dir` (`dir`(333));

--
-- Индексы таблицы `obmennik_files`
--
ALTER TABLE `obmennik_files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `obmennik_komm`
--
ALTER TABLE `obmennik_komm`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_file` (`id_file`);

--
-- Индексы таблицы `opsos`
--
ALTER TABLE `opsos`
  ADD KEY `min` (`min`,`max`);

--
-- Индексы таблицы `reg_mail`
--
ALTER TABLE `reg_mail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `rekl`
--
ALTER TABLE `rekl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sel` (`sel`),
  ADD KEY `time_last` (`time_last`);

--
-- Индексы таблицы `rules`
--
ALTER TABLE `rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `rules_p`
--
ALTER TABLE `rules_p`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sexwars`
--
ALTER TABLE `sexwars`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sexwars_chat`
--
ALTER TABLE `sexwars_chat`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sexwars_users`
--
ALTER TABLE `sexwars_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sexwars_weapons`
--
ALTER TABLE `sexwars_weapons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `smile`
--
ALTER TABLE `smile`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `smile_dir`
--
ALTER TABLE `smile_dir`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `spamus`
--
ALTER TABLE `spamus`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status_komm`
--
ALTER TABLE `status_komm`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `status_like`
--
ALTER TABLE `status_like`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `stena`
--
ALTER TABLE `stena`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `stena_komm`
--
ALTER TABLE `stena_komm`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `stena_like`
--
ALTER TABLE `stena_like`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `survey_v`
--
ALTER TABLE `survey_v`
  ADD KEY `id_s` (`id_s`,`id_r`,`id_user`);

--
-- Индексы таблицы `tape`
--
ALTER TABLE `tape`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`,`avtor`),
  ADD KEY `read` (`read`);

--
-- Индексы таблицы `tape_set`
--
ALTER TABLE `tape_set`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nick` (`nick`),
  ADD KEY `url` (`url`);

--
-- Индексы таблицы `users_konts`
--
ALTER TABLE `users_konts`
  ADD UNIQUE KEY `id_user` (`id_user`,`id_kont`),
  ADD KEY `type` (`type`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `user_collision`
--
ALTER TABLE `user_collision`
  ADD KEY `id_user` (`id_user`,`id_user2`);

--
-- Индексы таблицы `user_files`
--
ALTER TABLE `user_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `user_group`
--
ALTER TABLE `user_group`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_group_access`
--
ALTER TABLE `user_group_access`
  ADD KEY `id_group` (`id_group`,`id_access`);

--
-- Индексы таблицы `user_log`
--
ALTER TABLE `user_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `user_music`
--
ALTER TABLE `user_music`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_nevidimka`
--
ALTER TABLE `user_nevidimka`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_ref`
--
ALTER TABLE `user_ref`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`,`id_user`),
  ADD KEY `type_input` (`type_input`);

--
-- Индексы таблицы `user_set`
--
ALTER TABLE `user_set`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_voice2`
--
ALTER TABLE `user_voice2`
  ADD KEY `id_user` (`id_user`,`id_kont`),
  ADD KEY `time` (`time`),
  ADD KEY `rating` (`rating`);

--
-- Индексы таблицы `us_icons`
--
ALTER TABLE `us_icons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `visit_everyday`
--
ALTER TABLE `visit_everyday`
  ADD KEY `time` (`time`),
  ADD KEY `host` (`host`),
  ADD KEY `hit` (`hit`),
  ADD KEY `host_ip_ua` (`host_ip_ua`);

--
-- Индексы таблицы `visit_today`
--
ALTER TABLE `visit_today`
  ADD KEY `ip` (`ip`),
  ADD KEY `ua` (`ua`),
  ADD KEY `time` (`time`);

--
-- Индексы таблицы `votes_forum`
--
ALTER TABLE `votes_forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_forum` (`them`);

--
-- Индексы таблицы `votes_user`
--
ALTER TABLE `votes_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_log`
--
ALTER TABLE `admin_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `admin_log_act`
--
ALTER TABLE `admin_log_act`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `admin_log_mod`
--
ALTER TABLE `admin_log_mod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `adm_chat`
--
ALTER TABLE `adm_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `apps`
--
ALTER TABLE `apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `ban`
--
ALTER TABLE `ban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bookmarks`
--
ALTER TABLE `bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `chat_post`
--
ALTER TABLE `chat_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `chat_rooms`
--
ALTER TABLE `chat_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `chat_shutnik`
--
ALTER TABLE `chat_shutnik`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `chat_vopros`
--
ALTER TABLE `chat_vopros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `discussions`
--
ALTER TABLE `discussions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `discussions_set`
--
ALTER TABLE `discussions_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `foot_links`
--
ALTER TABLE `foot_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `forum_f`
--
ALTER TABLE `forum_f`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `forum_files`
--
ALTER TABLE `forum_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `forum_p`
--
ALTER TABLE `forum_p`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `forum_r`
--
ALTER TABLE `forum_r`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `forum_t`
--
ALTER TABLE `forum_t`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `frends_new`
--
ALTER TABLE `frends_new`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `gallery_foto`
--
ALTER TABLE `gallery_foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `gallery_komm`
--
ALTER TABLE `gallery_komm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gifts_user`
--
ALTER TABLE `gifts_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gift_categories`
--
ALTER TABLE `gift_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gift_list`
--
ALTER TABLE `gift_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `group_forum`
--
ALTER TABLE `group_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `group_forum_comm`
--
ALTER TABLE `group_forum_comm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `group_foto`
--
ALTER TABLE `group_foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `group_foto_alb`
--
ALTER TABLE `group_foto_alb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `group_lenta`
--
ALTER TABLE `group_lenta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `group_news`
--
ALTER TABLE `group_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `group_news_comm`
--
ALTER TABLE `group_news_comm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `group_users`
--
ALTER TABLE `group_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `like_object`
--
ALTER TABLE `like_object`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `mail`
--
ALTER TABLE `mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `mail_to_send`
--
ALTER TABLE `mail_to_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mark_files`
--
ALTER TABLE `mark_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mark_foto`
--
ALTER TABLE `mark_foto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mark_notes`
--
ALTER TABLE `mark_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mark_people`
--
ALTER TABLE `mark_people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `media_info`
--
ALTER TABLE `media_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `my_guests`
--
ALTER TABLE `my_guests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `news_komm`
--
ALTER TABLE `news_komm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `notes_dir`
--
ALTER TABLE `notes_dir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `notes_komm`
--
ALTER TABLE `notes_komm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `notification_set`
--
ALTER TABLE `notification_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `obmennik_dir`
--
ALTER TABLE `obmennik_dir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `obmennik_files`
--
ALTER TABLE `obmennik_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `obmennik_komm`
--
ALTER TABLE `obmennik_komm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `reg_mail`
--
ALTER TABLE `reg_mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rekl`
--
ALTER TABLE `rekl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rules`
--
ALTER TABLE `rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rules_p`
--
ALTER TABLE `rules_p`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sexwars`
--
ALTER TABLE `sexwars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `sexwars_chat`
--
ALTER TABLE `sexwars_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sexwars_users`
--
ALTER TABLE `sexwars_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `sexwars_weapons`
--
ALTER TABLE `sexwars_weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `smile`
--
ALTER TABLE `smile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `smile_dir`
--
ALTER TABLE `smile_dir`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `spamus`
--
ALTER TABLE `spamus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `status_komm`
--
ALTER TABLE `status_komm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `status_like`
--
ALTER TABLE `status_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `stena`
--
ALTER TABLE `stena`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `stena_komm`
--
ALTER TABLE `stena_komm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `stena_like`
--
ALTER TABLE `stena_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tape`
--
ALTER TABLE `tape`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `tape_set`
--
ALTER TABLE `tape_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `user_files`
--
ALTER TABLE `user_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `user_group`
--
ALTER TABLE `user_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `user_log`
--
ALTER TABLE `user_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `user_music`
--
ALTER TABLE `user_music`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user_nevidimka`
--
ALTER TABLE `user_nevidimka`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user_ref`
--
ALTER TABLE `user_ref`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `user_set`
--
ALTER TABLE `user_set`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT для таблицы `us_icons`
--
ALTER TABLE `us_icons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `votes_forum`
--
ALTER TABLE `votes_forum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `votes_user`
--
ALTER TABLE `votes_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
