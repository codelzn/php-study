-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- ホスト: localhost
-- 生成日時: 2023 年 2 月 21 日 03:30
-- サーバのバージョン： 10.4.27-MariaDB
-- PHP のバージョン: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `todo`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `todolist`
--

CREATE TABLE `todolist` (
  `id` int(255) NOT NULL,
  `taskname` varchar(512) NOT NULL,
  `enddate` date NOT NULL DEFAULT current_timestamp(),
  `state` int(255) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- テーブルのデータのダンプ `todolist`
--

INSERT INTO `todolist` (`id`, `taskname`, `enddate`, `state`) VALUES
(1, 'ああああああああ', '2023-02-14', 0),
(2, 'zzzzzzzz', '2023-02-11', 0),
(3, 'ううう', '2023-02-14', 1),
(4, 'おおおお', '2023-02-01', 0),
(5, 'zzzxcxc', '2023-02-02', 1);

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `todolist`
--
ALTER TABLE `todolist`
  ADD UNIQUE KEY `Id` (`id`),
  ADD KEY `Id_2` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
