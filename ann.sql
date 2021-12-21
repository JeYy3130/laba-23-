-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 21 2021 г., 19:39
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `announsment`
--

-- --------------------------------------------------------

--
-- Структура таблицы `announcement`
--

CREATE TABLE `announcement` (
  `id_announcement` int(11) NOT NULL,
  `name_item` varchar(300) NOT NULL,
  `picture` varchar(500) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(500) NOT NULL,
  `publication_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_ended` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `announcement`
--

INSERT INTO `announcement` (`id_announcement`, `name_item`, `picture`, `price`, `description`, `publication_time`, `is_ended`) VALUES
(52, '123', '61ba71d9aaac4.jpg', 123, '123', '2021-12-21 15:28:37', 0),
(53, 'Ноутб', '61c107d01ea17.png', 11111, 'йцуйцу', '2021-12-21 15:28:37', 0),
(54, 'Ещё один ноут', '61c108f0c403e.jpg', 1, '1', '2021-12-21 15:28:37', 0),
(55, 'mouse pad', 'exmpl.jpg', 8, '123', '2021-12-21 16:35:54', 0),
(56, 'sand paper', 'exmpl.jpg', 4, '123', '2021-12-21 16:35:54', 0),
(57, 'door', 'exmpl.jpg', 1, '123', '2021-12-21 16:35:54', 0),
(58, 'CD', 'exmpl.jpg', 75, '123', '2021-12-21 16:35:54', 0),
(59, 'stockings', 'exmpl.jpg', 76, '123', '2021-12-21 16:35:54', 0),
(60, 'shovel', 'exmpl.jpg', 64, '123', '2021-12-21 16:35:55', 0),
(61, 'needle', 'exmpl.jpg', 23, '123', '2021-12-21 16:35:55', 0),
(62, 'camera', 'exmpl.jpg', 50, '123', '2021-12-21 16:35:55', 0),
(63, 'bowl', 'exmpl.jpg', 100, '123', '2021-12-21 16:35:55', 0),
(64, 'glass', 'exmpl.jpg', 37, '123', '2021-12-21 16:35:55', 0),
(65, 'desk', 'exmpl.jpg', 71, '123', '2021-12-21 16:35:55', 0),
(66, 'stop sign', 'exmpl.jpg', 92, '123', '2021-12-21 16:35:55', 0),
(67, 'coasters', 'exmpl.jpg', 12, '123', '2021-12-21 16:35:55', 0),
(68, 'spring', 'exmpl.jpg', 4, '123', '2021-12-21 16:35:55', 0),
(69, 'washing machine', 'exmpl.jpg', 92, '123', '2021-12-21 16:35:55', 0),
(70, 'water bottle', 'exmpl.jpg', 36, '123', '2021-12-21 16:35:55', 0),
(71, 'pool stick', 'exmpl.jpg', 50, '123', '2021-12-21 16:35:55', 0),
(72, 'plate', 'exmpl.jpg', 70, '123', '2021-12-21 16:35:55', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `announcement_category`
--

CREATE TABLE `announcement_category` (
  `id_announcement` int(11) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `announcement_category`
--

INSERT INTO `announcement_category` (`id_announcement`, `id_category`) VALUES
(53, 5),
(54, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `application`
--

CREATE TABLE `application` (
  `id_application` int(11) NOT NULL,
  `message` varchar(300) DEFAULT NULL,
  `application_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `token_application` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `application`
--

INSERT INTO `application` (`id_application`, `message`, `application_date`, `token_application`) VALUES
(25, '123', '2021-12-21 15:28:37', '61baff0f8a19d'),
(27, 'qweqweqwe', '2021-12-21 15:28:37', '61c113305c97a');

-- --------------------------------------------------------

--
-- Структура таблицы `application_announcement`
--

CREATE TABLE `application_announcement` (
  `id_application` int(11) NOT NULL,
  `id_announcement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `application_announcement`
--

INSERT INTO `application_announcement` (`id_application`, `id_announcement`) VALUES
(25, 52),
(27, 54);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id_category` int(11) NOT NULL,
  `category_name` varchar(300) NOT NULL,
  `id_parent_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id_category`, `category_name`, `id_parent_category`) VALUES
(1, 'Техника', NULL),
(2, 'Работа', NULL),
(3, 'Транспорт', NULL),
(4, 'Одежда', NULL),
(5, 'Ноутбуки', 1),
(6, 'Телефоны', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `favorite`
--

CREATE TABLE `favorite` (
  `id_favorite` bigint(20) UNSIGNED NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_favorite_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `favorite`
--

INSERT INTO `favorite` (`id_favorite`, `id_user`, `id_favorite_user`) VALUES
(10, 20, 19);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `phone` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `api_token` varchar(300) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_visit` timestamp NULL DEFAULT current_timestamp(),
  `success_deals` int(11) NOT NULL DEFAULT 0,
  `success_sells` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id_user`, `name`, `email`, `phone`, `password`, `api_token`, `reg_date`, `last_visit`, `success_deals`, `success_sells`) VALUES
(19, 'Евгений', 'thenoydota@gmail.com', '88888888888', '$2y$10$nmz/8p/2Nb7H6T06uhSuDebqEnOiTS6x1xLbz7pc1b1yUifJto2Na', 'WB7ydYpTmVVKb9Tl30RH2PRALU3aFN9ZE8id35JrsPVSjDBPlo9veDiltej2p5B5', '2021-12-21 15:28:38', '2021-12-21 15:28:38', 0, 0),
(20, 'Алекс', 'alex@gachi.com', '89005553535', '$2y$10$OzT74mW1lPLNd9oiq9y8IuO/oM6WYJPJYIpugrGEZhVuVfbleGBKi', 'VzLmoVNhPtp81pSCjhLJlttKfRgvLjQSCng0Qv9bnhS82eNVG4TX4dSKJIND4ezd', '2021-12-21 15:28:38', '2021-12-21 15:28:38', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_announcement`
--

CREATE TABLE `user_announcement` (
  `id_user` int(11) NOT NULL,
  `id_announcement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_announcement`
--

INSERT INTO `user_announcement` (`id_user`, `id_announcement`) VALUES
(19, 52),
(19, 53),
(19, 54);

-- --------------------------------------------------------

--
-- Структура таблицы `user_application`
--

CREATE TABLE `user_application` (
  `id_user` int(11) NOT NULL,
  `id_application` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user_application`
--

INSERT INTO `user_application` (`id_user`, `id_application`) VALUES
(20, 23),
(20, 24),
(20, 25),
(20, 26),
(20, 27);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id_announcement`),
  ADD UNIQUE KEY `id_announcement` (`id_announcement`);

--
-- Индексы таблицы `announcement_category`
--
ALTER TABLE `announcement_category`
  ADD PRIMARY KEY (`id_announcement`,`id_category`);

--
-- Индексы таблицы `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id_application`),
  ADD UNIQUE KEY `id_application` (`id_application`);

--
-- Индексы таблицы `application_announcement`
--
ALTER TABLE `application_announcement`
  ADD PRIMARY KEY (`id_application`,`id_announcement`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`),
  ADD UNIQUE KEY `id_category` (`id_category`);

--
-- Индексы таблицы `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`id_favorite`),
  ADD UNIQUE KEY `id_favorite` (`id_favorite`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD UNIQUE KEY `api_token` (`api_token`);

--
-- Индексы таблицы `user_announcement`
--
ALTER TABLE `user_announcement`
  ADD PRIMARY KEY (`id_user`,`id_announcement`);

--
-- Индексы таблицы `user_application`
--
ALTER TABLE `user_application`
  ADD PRIMARY KEY (`id_user`,`id_application`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id_announcement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT для таблицы `application`
--
ALTER TABLE `application`
  MODIFY `id_application` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `favorite`
--
ALTER TABLE `favorite`
  MODIFY `id_favorite` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `application_announcement`
--
ALTER TABLE `application_announcement`
  ADD CONSTRAINT `application_announcement_application_id_application_fk` FOREIGN KEY (`id_application`) REFERENCES `application` (`id_application`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
