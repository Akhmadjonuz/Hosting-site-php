-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Авг 24 2018 г., 21:33
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `b91864l8_1`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cat`
--
-- Создание: Авг 24 2018 г., 18:28
-- Последнее обновление: Авг 24 2018 г., 18:28
--

DROP TABLE IF EXISTS `cat`;
CREATE TABLE `cat` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `about` varchar(80) NOT NULL,
  `position` int(3) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `cat`
--

INSERT INTO `cat` (`id`, `name`, `about`, `position`) VALUES
(1, 'Общение', 'Социальные сети, мобильные и web чаты, форумы...', 3),
(2, 'Бизнес', 'Все для заработка, советы, мануалы', 6),
(3, 'Загрузки', 'Бесплатный контент для мобилильных и ПК', 1),
(4, 'Для взрослых (18+) ', 'Сайты для лиц, достигших 18 лет', 14),
(5, 'Знакомства', 'Знакомства. Найди себе пару', 5),
(6, 'Порталы ', 'Полезные сервисы для пользователей', 7),
(7, 'Магазины, Услуги ', 'Предоставление платных услуг', 10),
(8, 'Конструкторные ', 'Сайты на бесплатных конструкторах', 9),
(9, 'Спорт', 'Сайты посвященные спорту', 8),
(10, 'WAP-Мастерам ', 'Сайты, предназначенные для сайтостроителей', 11),
(11, 'Игры', 'Браузерные и web онлайн игры...', 2),
(12, 'Халява ', 'Все совершенно бесплатно!', 4),
(13, 'Прочие', 'Сайты разных тематик', 12),
(14, 'English ', 'Иностранные сайты. English', 13),
(15, 'Вне рейтинга', 'Сайты с iFrame и на бесплатных доменах', 15);

-- --------------------------------------------------------

--
-- Структура таблицы `hits`
--
-- Создание: Авг 24 2018 г., 18:32
-- Последнее обновление: Авг 24 2018 г., 18:32
--

DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `id_sait` int(11) NOT NULL,
  `time` int(8) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `browser` varchar(30) NOT NULL,
  `operator` int(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `hosts`
--
-- Создание: Авг 24 2018 г., 18:32
-- Последнее обновление: Авг 24 2018 г., 18:32
--

DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts` (
  `id_sait` int(11) NOT NULL,
  `time` int(8) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `browser` varchar(30) NOT NULL,
  `operator` int(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--
-- Создание: Авг 24 2018 г., 18:31
-- Последнее обновление: Авг 24 2018 г., 18:31
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `time` int(8) NOT NULL,
  `author` varchar(30) NOT NULL,
  `plus` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `online`
--
-- Создание: Авг 24 2018 г., 18:32
-- Последнее обновление: Авг 24 2018 г., 18:32
--

DROP TABLE IF EXISTS `online`;
CREATE TABLE `online` (
  `ip` varchar(16) NOT NULL,
  `ua` varchar(20) NOT NULL,
  `time` int(7) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `rekl`
--
-- Создание: Авг 24 2018 г., 18:30
-- Последнее обновление: Авг 24 2018 г., 18:30
--

DROP TABLE IF EXISTS `rekl`;
CREATE TABLE `rekl` (
  `id` int(11) UNSIGNED NOT NULL,
  `date` int(11) NOT NULL COMMENT 'Время оплаты',
  `summa` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT 'Сумма',
  `time` int(11) NOT NULL COMMENT 'Истекает',
  `url` varchar(50) NOT NULL COMMENT 'Адрес сайта',
  `name` varchar(32) NOT NULL COMMENT 'Название ссылки',
  `color` varchar(20) NOT NULL DEFAULT 'null' COMMENT 'Цвет ссылки',
  `bold` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Жирный',
  `italic` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Курсивный',
  `type` int(1) NOT NULL,
  `open` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `reputation`
--
-- Создание: Авг 24 2018 г., 18:30
-- Последнее обновление: Авг 24 2018 г., 18:30
--

DROP TABLE IF EXISTS `reputation`;
CREATE TABLE `reputation` (
  `id_sait` int(11) NOT NULL,
  `type` varchar(5) NOT NULL,
  `time` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `sait`
--
-- Создание: Авг 24 2018 г., 18:30
-- Последнее обновление: Авг 24 2018 г., 18:30
--

DROP TABLE IF EXISTS `sait`;
CREATE TABLE `sait` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_mod` int(11) NOT NULL,
  `skrit` int(1) NOT NULL DEFAULT '0',
  `url` varchar(30) NOT NULL,
  `about` varchar(150) NOT NULL,
  `time_reg` int(8) NOT NULL,
  `time_activ` int(8) NOT NULL,
  `hits` int(11) NOT NULL,
  `hits2` int(11) NOT NULL,
  `hits3` int(11) NOT NULL,
  `hits4` int(11) NOT NULL,
  `hits5` int(11) NOT NULL,
  `hits6` int(11) NOT NULL,
  `hits7` int(11) NOT NULL,
  `hits8` int(11) NOT NULL,
  `hits9` int(11) NOT NULL,
  `hits10` int(11) NOT NULL,
  `hits11` int(11) NOT NULL,
  `hits12` int(11) NOT NULL,
  `hits13` int(11) NOT NULL,
  `hits14` int(11) NOT NULL,
  `hits15` int(11) NOT NULL,
  `hits16` int(11) NOT NULL,
  `hits17` int(11) NOT NULL,
  `hits18` int(11) NOT NULL,
  `hits19` int(11) NOT NULL,
  `hits20` int(11) NOT NULL,
  `hits21` int(11) NOT NULL,
  `hits22` int(11) NOT NULL,
  `hits23` int(11) NOT NULL,
  `hits24` int(11) NOT NULL,
  `hits25` int(11) NOT NULL,
  `hits26` int(11) NOT NULL,
  `hits27` int(11) NOT NULL,
  `hits28` int(11) NOT NULL,
  `hits29` int(11) NOT NULL,
  `hits30` int(11) NOT NULL,
  `hosts` int(11) NOT NULL,
  `hosts2` int(11) NOT NULL,
  `hosts3` int(11) NOT NULL,
  `hosts4` int(11) NOT NULL,
  `hosts5` int(11) NOT NULL,
  `hosts6` int(11) NOT NULL,
  `hosts7` int(11) NOT NULL,
  `hosts8` int(11) NOT NULL,
  `hosts9` int(11) NOT NULL,
  `hosts10` int(11) NOT NULL,
  `hosts11` int(11) NOT NULL,
  `hosts12` int(11) NOT NULL,
  `hosts13` int(11) NOT NULL,
  `hosts14` int(11) NOT NULL,
  `hosts15` int(11) NOT NULL,
  `hosts16` int(11) NOT NULL,
  `hosts17` int(11) NOT NULL,
  `hosts18` int(11) NOT NULL,
  `hosts19` int(11) NOT NULL,
  `hosts20` int(11) NOT NULL,
  `hosts21` int(11) NOT NULL,
  `hosts22` int(11) NOT NULL,
  `hosts23` int(11) NOT NULL,
  `hosts24` int(11) NOT NULL,
  `hosts25` int(11) NOT NULL,
  `hosts26` int(11) NOT NULL,
  `hosts27` int(11) NOT NULL,
  `hosts28` int(11) NOT NULL,
  `hosts29` int(11) NOT NULL,
  `hosts30` int(11) NOT NULL,
  `all_hits` int(11) NOT NULL,
  `all_hosts` int(11) NOT NULL,
  `in` int(11) NOT NULL,
  `in2` int(11) NOT NULL,
  `in3` int(11) NOT NULL,
  `in4` int(11) NOT NULL,
  `in5` int(11) NOT NULL,
  `in6` int(11) NOT NULL,
  `in7` int(11) NOT NULL,
  `in8` int(11) NOT NULL,
  `in9` int(11) NOT NULL,
  `in10` int(11) NOT NULL,
  `in11` int(11) NOT NULL,
  `in12` int(11) NOT NULL,
  `in13` int(11) NOT NULL,
  `in14` int(11) NOT NULL,
  `in15` int(11) NOT NULL,
  `in16` int(11) NOT NULL,
  `in17` int(11) NOT NULL,
  `in18` int(11) NOT NULL,
  `in19` int(11) NOT NULL,
  `in20` int(11) NOT NULL,
  `in21` int(11) NOT NULL,
  `in22` int(11) NOT NULL,
  `in23` int(11) NOT NULL,
  `in24` int(11) NOT NULL,
  `in25` int(11) NOT NULL,
  `in26` int(11) NOT NULL,
  `in27` int(11) NOT NULL,
  `in28` int(11) NOT NULL,
  `in29` int(11) NOT NULL,
  `in30` int(11) NOT NULL,
  `out` int(11) NOT NULL,
  `out2` int(11) NOT NULL,
  `out3` int(11) NOT NULL,
  `out4` int(11) NOT NULL,
  `out5` int(11) NOT NULL,
  `out6` int(11) NOT NULL,
  `out7` int(11) NOT NULL,
  `out8` int(11) NOT NULL,
  `out9` int(11) NOT NULL,
  `out10` int(11) NOT NULL,
  `out11` int(11) NOT NULL,
  `out12` int(11) NOT NULL,
  `out13` int(11) NOT NULL,
  `out14` int(11) NOT NULL,
  `out15` int(11) NOT NULL,
  `out16` int(11) NOT NULL,
  `out17` int(11) NOT NULL,
  `out18` int(11) NOT NULL,
  `out19` int(11) NOT NULL,
  `out20` int(11) NOT NULL,
  `out21` int(11) NOT NULL,
  `out22` int(11) NOT NULL,
  `out23` int(11) NOT NULL,
  `out24` int(11) NOT NULL,
  `out25` int(11) NOT NULL,
  `out26` int(11) NOT NULL,
  `out27` int(11) NOT NULL,
  `out28` int(11) NOT NULL,
  `out29` int(11) NOT NULL,
  `out30` int(11) NOT NULL,
  `all_in` int(11) NOT NULL,
  `all_out` int(11) NOT NULL,
  `category` int(6) NOT NULL,
  `image` varchar(6) NOT NULL,
  `image_s` varchar(6) NOT NULL,
  `status` int(1) NOT NULL,
  `auto_ban` int(1) NOT NULL,
  `ban` int(1) NOT NULL,
  `ban_reason` varchar(50) NOT NULL,
  `ban_who` int(11) NOT NULL,
  `ban_time` int(8) NOT NULL,
  `auto_del` int(1) NOT NULL,
  `count` int(9) NOT NULL,
  `cy` int(5) NOT NULL,
  `pr` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `sait_online`
--
-- Создание: Авг 24 2018 г., 18:31
-- Последнее обновление: Авг 24 2018 г., 18:31
--

DROP TABLE IF EXISTS `sait_online`;
CREATE TABLE `sait_online` (
  `id_sait` int(11) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `ua` varchar(20) NOT NULL,
  `time` int(7) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

-- --------------------------------------------------------

--
-- Структура таблицы `settings`
--
-- Создание: Авг 24 2018 г., 18:28
-- Последнее обновление: Авг 24 2018 г., 18:28
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `name` varchar(60) NOT NULL,
  `value` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `settings`
--

INSERT INTO `settings` (`name`, `value`) VALUES
('auto_moderacia', '0'),
('home', 'a67977b3.beget.tech'),
('page_news', '10'),
('max_platforms', '10'),
('moderacia', '0'),
('pages', '10'),
('page_moderacia', '10'),
('page_platforms', '10'),
('page_sait', '10'),
('page_top', '10'),
('page_users', '10'),
('power_reg', '1'),
('top_name', 'Бесплатные мобильные сайты');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--
-- Создание: Авг 24 2018 г., 18:31
-- Последнее обновление: Авг 24 2018 г., 18:31
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `time_reg` int(8) NOT NULL,
  `login` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `level` int(2) NOT NULL,
  `pages` int(2) NOT NULL,
  `page_platforms` int(2) NOT NULL,
  `page_sait` int(2) NOT NULL,
  `page_top` int(2) NOT NULL,
  `auto_del` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rekl`
--
ALTER TABLE `rekl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time_expire` (`time`);

--
-- Индексы таблицы `sait`
--
ALTER TABLE `sait`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cat`
--
ALTER TABLE `cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91215;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `rekl`
--
ALTER TABLE `rekl`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `sait`
--
ALTER TABLE `sait`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
