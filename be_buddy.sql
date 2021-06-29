-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 29, 2021 at 01:00 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `be_buddy`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'Málaga'),
(2, 'Madrid'),
(3, 'Londres'),
(4, 'Cartagena de Indias'),
(5, 'París'),
(6, 'Praga'),
(7, 'Estocolmo'),
(8, 'Tallin'),
(9, 'Montpellier'),
(10, 'Dublín'),
(11, 'Amsterdan'),
(12, 'Bruselas'),
(13, 'Munich'),
(14, 'Zurich'),
(15, 'Nápoles'),
(16, 'Turín'),
(17, 'Viena'),
(18, 'Split'),
(19, 'Bergen'),
(20, 'Copenhague'),
(21, 'Sarajevo'),
(22, 'Atenas'),
(23, 'Bucarest'),
(24, 'Kiev'),
(25, 'Tallin'),
(26, 'San Petersburgo'),
(27, 'Estambul'),
(28, 'Beirut'),
(29, 'Egipto'),
(30, 'Dubai'),
(31, 'Teherán'),
(32, 'Calcuta'),
(33, 'Hanoi'),
(34, 'Bangkok'),
(35, 'Osaka'),
(36, 'Tánger'),
(37, 'Túnez'),
(38, 'Dakar');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210624103359', '2021-06-24 12:34:19', 114),
('DoctrineMigrations\\Version20210625105019', '2021-06-25 12:50:28', 129),
('DoctrineMigrations\\Version20210625105652', '2021-06-25 12:56:57', 79),
('DoctrineMigrations\\Version20210625115904', '2021-06-25 13:59:15', 164),
('DoctrineMigrations\\Version20210629091430', '2021-06-29 11:35:59', 77),
('DoctrineMigrations\\Version20210629102749', '2021-06-29 12:27:58', 109),
('DoctrineMigrations\\Version20210629102939', '2021-06-29 12:29:47', 115),
('DoctrineMigrations\\Version20210629105041', '2021-06-29 12:50:47', 78);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int NOT NULL,
  `bio` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `years_living` int DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int NOT NULL,
  `languages` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:simple_array)',
  `interests` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:simple_array)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `last_name`, `age`, `bio`, `years_living`, `image`, `city_id`, `languages`, `interests`) VALUES
(3, 'Luis@correo.com', '[\"ROLE_BUDDY\"]', '1234', 'Luis', 'Gonzalez', 37, 'Viviendo en Málaga', 37, NULL, 1, 'español, inglés', 'política, cultura'),
(4, 'Laura@correo.com', '[\"ROLE_BUDDY\"]', '1234', 'Laura', 'Montes', 43, 'Viviendo en Estocolmo', 10, NULL, 7, 'español, sueco', 'trabajo, salidas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD KEY `IDX_8D93D6498BAC62AF` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D6498BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
