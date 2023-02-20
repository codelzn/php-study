-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-02-20 12:46:11
-- 服务器版本： 10.4.27-MariaDB
-- PHP 版本： 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `todo`
--

-- --------------------------------------------------------

--
-- 表的结构 `todolist`
--

CREATE TABLE `todolist` (
  `Id` int(255) NOT NULL,
  `タスク名` varchar(512) NOT NULL,
  `終了予定日` date NOT NULL DEFAULT current_timestamp(),
  `終了チェック` int(255) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- 转存表中的数据 `todolist`
--

INSERT INTO `todolist` (`Id`, `タスク名`, `終了予定日`, `終了チェック`) VALUES
(1, 'ああああああああ', '2023-02-14', 0),
(2, 'zzzzzzzz', '2023-02-11', 0),
(3, 'ううう', '2023-02-14', 0),
(4, 'おおおお', '2023-02-01', 0);

--
-- 转储表的索引
--

--
-- 表的索引 `todolist`
--
ALTER TABLE `todolist`
  ADD UNIQUE KEY `Id` (`Id`),
  ADD KEY `Id_2` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
