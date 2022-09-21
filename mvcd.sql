-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Сен 21 2022 г., 17:16
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mvcd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `division`
--

CREATE TABLE `division` (
  `id` int(11) NOT NULL,
  `id_institute` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `division`
--

INSERT INTO `division` (`id`, `id_institute`, `title`, `description`) VALUES
(2, 4, 'Аудитории', 'Помещения, рассчитанные на большое количество слушателей '),
(3, 4, 'Мастерские', 'Помещения с рабочим оборудованием');

-- --------------------------------------------------------

--
-- Структура таблицы `institutes`
--

CREATE TABLE `institutes` (
  `id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `institutes`
--

INSERT INTO `institutes` (`id`, `number`, `location`) VALUES
(4, 2, 'Томск');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `edit_ability` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `edit_ability`) VALUES
(1, 'Работник', 0),
(2, 'Админ', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `id_division` int(11) NOT NULL DEFAULT 1,
  `Room_Number` int(11) NOT NULL,
  `Floor` int(11) NOT NULL,
  `Type` text NOT NULL,
  `Area` int(11) NOT NULL,
  `Sit_place` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `rooms`
--

INSERT INTO `rooms` (`id`, `id_division`, `Room_Number`, `Floor`, `Type`, `Area`, `Sit_place`) VALUES
(1, 2, 101, 1, 'Кабинет биологии', 40, 20),
(2, 2, 102, 1, 'Кабинет математики', 40, 20),
(3, 2, 103, 1, 'Кабинет литературы', 40, 20),
(4, 3, 105, 1, 'Кабинет трудов', 50, 10),
(5, 3, 106, 1, 'Кабинет информатики', 50, 10),
(55, 2, 444, 4, 'Кабинет всего и сразу ', 3, 120);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `id_institute` int(11) DEFAULT NULL,
  `id_role` int(11) DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar_url` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `id_institute`, `id_role`, `name`, `login`, `password`, `avatar_url`) VALUES
(37, 4, 2, 'Сергей', 'admin1', 'e00cf25ad42683b3df678c61f42c6bda', ''),
(56, NULL, 1, 'Сергей', 'admin3', '32cacb2f994f6b42183a1300d9a3e8d6', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id institute` (`id_institute`);

--
-- Индексы таблицы `institutes`
--
ALTER TABLE `institutes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id division` (`id_division`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id institute` (`id_institute`,`id_role`),
  ADD KEY `id role` (`id_role`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `division`
--
ALTER TABLE `division`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `institutes`
--
ALTER TABLE `institutes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `division`
--
ALTER TABLE `division`
  ADD CONSTRAINT `division_ibfk_1` FOREIGN KEY (`id_institute`) REFERENCES `institutes` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`id_division`) REFERENCES `division` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_institute`) REFERENCES `institutes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
