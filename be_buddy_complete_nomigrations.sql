-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2021 a las 12:44:35
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `be_buddy`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'Málaga'),
(2, 'Barcelona'),
(3, 'Estocolmo'),
(4, 'París'),
(5, 'Londres'),
(6, 'Berlín'),
(7, 'Munich'),
(8, 'Varsovia'),
(9, 'Bergen'),
(10, 'El Cairo'),
(11, 'Tallin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interest`
--

CREATE TABLE `interest` (
  `id` int(11) NOT NULL,
  `tag` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `interest`
--

INSERT INTO `interest` (`id`, `tag`) VALUES
(1, 'Rutas'),
(2, 'Conocer gente'),
(3, 'Política'),
(4, 'Trabajo'),
(5, 'Cultural'),
(6, 'Trámites'),
(7, 'Idiomas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `language`
--

INSERT INTO `language` (`id`, `name`) VALUES
(1, 'Español'),
(2, 'Inglés'),
(3, 'Portugués'),
(4, 'Alemán'),
(5, 'Italiano'),
(6, 'Japonés'),
(7, 'Hindi'),
(8, 'Francés');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `message`
--

INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `message`, `created_at`) VALUES
(10, 52, 1, 'gfjhgchgcvmhgvhn', '2021-07-15 20:40:21'),
(11, 1, 52, 'Hola María', '2021-07-16 12:14:03'),
(12, 1, 53, 'Hola Perry', '2021-07-16 18:44:35'),
(13, 1, 52, 'Hola María', '2021-07-16 18:46:31'),
(14, 53, 1, 'Hola Loli', '2021-07-17 11:03:56'),
(16, 1, 56, 'Hola Chong, soy Loli', '2021-07-18 13:34:27'),
(17, 56, 1, 'Hola Loli, yo soy Chong', '2021-07-18 13:52:15'),
(18, 1, 53, 'Hola Perryyyyyyy', '2021-07-18 14:19:00'),
(19, 1, 56, 'Buenas, ¿Hablamos?', '2021-07-18 14:20:11'),
(20, 1, 53, 'Hola Perry, cómo estás?', '2021-07-18 17:35:19'),
(24, 1, 69, 'Hola, me gustaría hablar contigo', '2021-07-19 09:14:01'),
(25, 1, 72, 'Buenas, ¿Hablamos?', '2021-07-19 09:26:46'),
(32, 84, 70, 'Hola Javier, me gustaría contactar contigo.', '2021-07-20 19:02:21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` smallint(6) DEFAULT NULL,
  `bio` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `years_living` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `last_name`, `age`, `bio`, `years_living`, `image`, `city_id`, `avatar`) VALUES
(1, 'Loli@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$yxiSqWKreJvTC5Qcu1huaOC32r7X1rU4cWdwOhmb89Mn9E5Hb7Wmq', 'Loli', 'Vega', 36, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad. Contacta conmigo!', 1, NULL, 1, NULL),
(52, 'MariadelaO@gmail.com', '[\"ROLE_USER\"]', '$2y$13$pPGydpjYjMtcQCBZv8TNzO4/abEUNnNHi3cxh6oklDXjBQbRnb6XW', 'Maria', 'de la O', 23, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', 5, '60f07e6ec3570.jpg', 11, NULL),
(53, 'PerryMason@gmail.com', '[\"ROLE_USER\"]', '$2y$13$KU4qs8nLNkAvbZXQwXHtHetRbu/hoEYsL/IA9VoxXA0kUnKRkxwfq', 'Perry', 'Mason', 23, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', 4, '60f07f1f61329.jpg', 11, NULL),
(56, 'chongchang@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$zNEVTKDqyZ7IJW6QULgJf.JVrdsPzwpaFw7VMvifwlaj9EJ0r1USK', 'Chong', 'Chang', 29, 'Mi nombre es Chong y vengo de Hong Kong aunque llevo viviendo en Estocolmo hace ya unos cuantos años. Me encanta conocer gente y por eso puede ayudarte a integrarte en esta genial ciudad y enseñarte los mejores sitios. Me gustan también los animales y el deporte.', 5, '60f080b08f11c.jpg', 3, NULL),
(62, 'luisfer@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$oFBfw8bPOfvnXkrh90lmSO2ajdoEiclHXNnrBCdFslUPjvpCcjlCe', 'Steven', 'Watts', 37, 'Soy americano aunque llevo viviendo en Londres casi toda mi vida desde que era pequeño y mis padres se mudaron aquí. Me encanta conocer gente y puedo ayudarte a integrarte en esta incréible y apasionante ciudad.', 10, '60f44b8a6a519.jpg', 5, NULL),
(63, 'baby@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$Pc/To1uFsSqtXzqOiTCfOuXl8Z8KHdWAUFI3fnk1nxGYOVBOHfLca', 'Baby', 'Uuuuhhhh', 18, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', 3, '60f44dda3c52b.jpg', 4, NULL),
(66, 'nievesgallego@gmail.com', '[\"ROLE_USER\"]', '$2y$13$drKp4L3N.wIREX/o7bxxV.bItVvSdJe3Ykzv1KdCfrjo0kp5YibcK', 'Nieves', 'Gallego', 31, 'Soy madrileña y llevo viviendo en Barcelona unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte, el cine y trabajo como sanitaria en un Hospital. Me gustaría que me ayudaras con los trámites básicos al llegar a la ciudad y conociéndo los alrededores.', NULL, '60f4591bf076d.jpg', 2, NULL),
(67, 'lauragallego@gmail.com', '[\"ROLE_USER\"]', '$2y$13$OSah8VTNQJtfgtKMaHWwdOT/2QZ4KmOBtbqrYn7KzxkeimvX22jgK', 'Laura', 'Gallego', 35, 'Soy madrileña y llevo viviendo en Lisboa unos años con mi hermana aunque siempre había vivido en Madrid. Me gusta salir a conocer gente, el deporte, el cine y trabajo como profesora de Educación infantil. Me mudo a Barcelona en breve y me gustaría contactar con laguien que nos ayude a integarnos en esa fabulosa ciudad.', NULL, '60f45943ab751.jpg', 2, NULL),
(68, 'anacarrasco@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$fULX5DyYe0PunXvoU9UFSeUVazw4nyZtDNExkIYC4iGOMNXWf/MtG', 'Ana', 'Carrasco', 36, 'Soy española aunque me mudé a Estocolmo hace 1 año por temas laborales. Trabajo como ingeniera industrial. Me encantan los idiomas, viajar y salir con amigos, contáctame y te ayudaré en todo lo que pueda.', 6, '60f4597574b6e.jpg', 3, NULL),
(69, 'pilardiaz@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$S3SXZ5mjWytwteP.a1NxG..AUF5s3B8sAyqIMubrJ0sUyRqjP/q72', 'Pilar', 'Diaz', 39, 'Hola!!!! Llevo ya muchos años viviendo en Estocolmo con mi familia ya que me mudé por trabajo y me dedico al diseño gráfico. Me encanta conocer gente nueva por lo que no dudes en contactarme para lo que necesites. Abrazo!', 7, '60f4599a7bb24.jpg', 3, NULL),
(70, 'javiercabello@gmail.com', '[\"ROLE_USER\"]', '$2y$13$UOrz5Vlyc59dexpzrcP5sO7zSbLYJkdtRMlhvsKFPJ67ldQF2mt96', 'Javiez', 'Cabello', 58, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', NULL, '60f459c550f1e.jpg', 4, NULL),
(71, 'karel@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$jbl1GYN.AtuKO2YTnjDZkuO8oCYJwA3VPinGn5l6PoTu4272suPL.', 'Karel', 'Ayllón', 41, 'Soy de Madrid pero en vivo en París hace unos años. Me encantan los idiomas y la gastronomía por lo que puedo enseñarte cualquier sitio de la ciudad y reocmendarte los que considero son los mejores lugares. No dudes en contactarme!', 8, '60f459f01b5a1.jpg', 4, NULL),
(72, 'pablolopez2@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$frM7/wYB9axKJSbIG7uW..FJ.g7zJUSppZBKwEMgmK/zw4ReLuqxO', 'Pablo', 'López', 35, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', 2, '60f45a23eaa11.jpg', 5, NULL),
(73, 'sonia@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$lPdgKFQBc0wSu3Qj9bUpQuJcphzsrRenCRCD337UkTqktgo4gcs.K', 'Sonia', 'Bolsón', 29, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', 6, '60f45a4c1d3b7.jpg', 5, NULL),
(80, 'victorcru@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$Ncl7Mj2wHb3AVWZ0syFkb.16Kc5ThGZ/Kb8QV/dGm6WH6ZQGdQI1m', 'Victor', 'Cru', 25, 'Soy Victor y tengo mi propia empresa en Estocolmo desde hace 5 años por lo que puedo ayudarte con contactos de trabajo y todos los trámites que necesites al llegar a la ciudad. Mis hobbies son el cine en casa, leer y aprender cosas nuevas día tras día. Hablamos?', 6, '60f6758a82c3a.jpg', 3, NULL),
(84, 'sonia2@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$A/sOhOIP83mfyOlxfAaZo.ARNPIgSsrZze12Drp9DDBWVzfy5W.iC', 'Sonia', 'Bonson', 25, 'Hola! Vivo en Varsovia aunque soy Alemana y trabajo como periodista en una revista local. Mis hobbies son patinar, leer, el cine y salir con mis amigos. No dudes en contactarme para que pueda ayudarte en lo que necesites!', 10, '60f6fc15a459f.jpg', 8, NULL),
(85, 'oscar@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$NXFKxmcZ210vTFWFGAe11OEHVXUFwMS.FDGqbEtknjG7Cv5rv5ZOC', 'Oscar', 'Borrás', 45, 'Mi nombre es Òscar y llevo viviendo en El Cairo 6 años. Mi madre es India por lo que hablo también este idioma. Trabajo en el sector comercial que es mi pasión y me encantan los animales y el deporte. Si necesitas una inmersión cultural tu buddy soy yo así que no dudes en contactarme. Saludos!!', 6, '60f7cacce0981.jpg', 10, NULL),
(86, 'selene@gmail.com', '[\"ROLE_USER\"]', '$2y$13$7MyssU8kPNIuxN/fraMPX.yPb7lHoaFDnhcGhqxetcWGr0OLenlOK', 'Selene', 'Gómez', 26, 'Soy Selene y me mudo a el Cairo en 2 meses por temas laborales. Soy azafata de vuelo y mi base estará allí durante aproximadamente 1 año. Me gustaría conocer a alguien que pudiese enseñarme la ciudad y principalmente hacerme una inmersión cultural para conocer las costumbres y tradiciones del país. Gracias!!', NULL, '60f7cb71638a3.jpg', 10, NULL),
(87, 'angela@gmail.com', '[\"ROLE_USER\"]', '$2y$13$qMWXqMvCj/v1.9VLNGS0ou53CZMXhj5X/3n3wogBanPD04L/Kt7Y6', 'Ángela', 'Martínez', 28, 'Buenas!! Soy Ángela y soy de Lisboa y me estré mudando a Bergen en 1 mes y medio por temas laborales ya que empezaré a trabajar como guía en excursiones de barcos de cruceros. Me encantan los idiomas y viajar así como los animales y lo que más me gustaría en principio es realizar una inmersión cultutal que me de los conocimientos para poder integrarme lo antes posible en esa maravillosa ciudad. Nos vemos!', NULL, '60f7cd5b1ac09.jpg', 9, NULL),
(88, 'fabian@gmail.com', '[\"ROLE_USER\"]', '$2y$13$sY5Pm6AMNURl5K2m8B3xWeLrIk2kHd3CR.8DTAs.nIR9NtWcZqmkO', 'Fabián', 'Latson', 34, 'Hola! Soy Fabián, tengo 34 años y vivo en Munich desde hace tiempo aunque en breve tengo que mudarme a Berín por un traslado en mi trabajo como ingeniero. hablo alemán perfecto y conozco la cultura alemana pero me gustaría contactar con laguien en Berlín que me enseñe la ciudad y me recomiende lugares a los que ir para conocer gente. Gracias!!', NULL, NULL, 6, NULL),
(89, 'samir@gmail.com', '[\"ROLE_USER\"]', '$2y$13$uxpXHY.Gyf7UdNkYuKkV2OLs3tj6AITDM6cRqKLj9yNR1fOt2H45i', 'Samir', 'Kaisukar', 27, 'Hola! Soy Samir y vivo en la India pero me mudaré en pocas semanas a Berlín ya que tengo familia allí y quiero buscar una oportunidad de trabajo. Necesitaría ayuda en los trámites que seguir para ello, temas de vivienda, bancos y documentación y si es posible conocer gente y hacer una inmersión cultutal de la ciudad para poder conocer su cultura y su política. Muchas gracias!', NULL, '60f7e313dc5e6.jpg', 6, NULL),
(90, 'ricardo@gmail.com', '[\"ROLE_USER\"]', '$2y$13$7Kb7fxpcdzPhi6lzmr55ZO6jOxkVfIW6GjjYrrPQJUCpYJh2b8j76', 'Ricardo', 'Hernández', 39, 'Me llamo Ricardo, vivo en Barcelona pero me mudaré en 2 meses a Munich para estudiar un máster de organización de empresas. Necesito ayuda con los trámites a seguir una vez aterrice allí y con el idioma ya que mi alemás es básico. Puedo hacer intercambio con inglés o portugés y además me encantaría conocer gente con la que salir y recorrer la ciudad y alrededores. Estamos en contacto!', NULL, '60f7e3e6a7846.jpg', 7, NULL),
(91, 'gara@gmail.com', '[\"ROLE_USER\"]', '$2y$13$lMGUpyfng8zoFQP2W0SN3O0G7T92ou11Zgs6/k3R9vxky5B18B.pW', 'Gara', 'Real', 42, 'Hola!!! me mudo a Málaga en 2 semanas, soy de Alicante y me gustaría conocer gente por allí para salir y recorrer la ciudad y los alrededores. Me gusta viajar, salir con mis amigos y hacer cenitas en casa ya que me encanta cocinar. Contactamos?', NULL, '60f7f4a20c005.jpg', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_interest`
--

CREATE TABLE `user_interest` (
  `user_id` int(11) NOT NULL,
  `interest_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_interest`
--

INSERT INTO `user_interest` (`user_id`, `interest_id`) VALUES
(1, 3),
(52, 6),
(52, 7),
(53, 3),
(53, 6),
(53, 7),
(56, 4),
(56, 5),
(62, 5),
(62, 6),
(62, 7),
(63, 5),
(63, 7),
(66, 2),
(66, 5),
(67, 2),
(67, 3),
(67, 4),
(67, 5),
(68, 6),
(68, 7),
(69, 4),
(69, 6),
(70, 3),
(70, 4),
(71, 1),
(71, 2),
(71, 3),
(71, 4),
(72, 1),
(72, 2),
(72, 4),
(72, 5),
(72, 6),
(73, 4),
(73, 5),
(73, 6),
(80, 3),
(80, 4),
(84, 2),
(85, 2),
(85, 3),
(85, 4),
(86, 1),
(86, 2),
(86, 3),
(87, 3),
(87, 4),
(87, 5),
(88, 1),
(88, 6),
(88, 7),
(89, 2),
(89, 4),
(89, 5),
(89, 6),
(90, 1),
(90, 2),
(90, 7),
(91, 2),
(91, 4),
(91, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_language`
--

CREATE TABLE `user_language` (
  `user_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user_language`
--

INSERT INTO `user_language` (`user_id`, `language_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(52, 3),
(52, 8),
(53, 3),
(53, 4),
(53, 8),
(56, 1),
(56, 2),
(62, 1),
(62, 2),
(62, 8),
(63, 1),
(63, 8),
(66, 1),
(66, 5),
(66, 6),
(67, 1),
(67, 6),
(67, 7),
(68, 3),
(68, 4),
(68, 6),
(68, 7),
(69, 3),
(69, 5),
(69, 7),
(70, 1),
(70, 3),
(70, 4),
(70, 5),
(70, 8),
(71, 1),
(71, 2),
(71, 8),
(72, 1),
(72, 2),
(73, 2),
(73, 4),
(73, 5),
(73, 6),
(80, 2),
(80, 3),
(84, 1),
(84, 2),
(85, 1),
(85, 6),
(86, 1),
(87, 1),
(87, 2),
(87, 3),
(88, 1),
(88, 3),
(88, 4),
(89, 1),
(89, 2),
(89, 7),
(90, 1),
(90, 2),
(90, 3),
(91, 1),
(91, 2),
(91, 8);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `interest`
--
ALTER TABLE `interest`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B6BD307FF624B39D` (`sender_id`),
  ADD KEY `IDX_B6BD307FCD53EDB6` (`receiver_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD KEY `IDX_8D93D6498BAC62AF` (`city_id`);

--
-- Indices de la tabla `user_interest`
--
ALTER TABLE `user_interest`
  ADD PRIMARY KEY (`user_id`,`interest_id`),
  ADD KEY `IDX_8CB3FE67A76ED395` (`user_id`),
  ADD KEY `IDX_8CB3FE675A95FF89` (`interest_id`);

--
-- Indices de la tabla `user_language`
--
ALTER TABLE `user_language`
  ADD PRIMARY KEY (`user_id`,`language_id`),
  ADD KEY `IDX_345695B5A76ED395` (`user_id`),
  ADD KEY `IDX_345695B582F1BAF4` (`language_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `interest`
--
ALTER TABLE `interest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_B6BD307FCD53EDB6` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_B6BD307FF624B39D` FOREIGN KEY (`sender_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D6498BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Filtros para la tabla `user_interest`
--
ALTER TABLE `user_interest`
  ADD CONSTRAINT `FK_8CB3FE675A95FF89` FOREIGN KEY (`interest_id`) REFERENCES `interest` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8CB3FE67A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_language`
--
ALTER TABLE `user_language`
  ADD CONSTRAINT `FK_345695B582F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `language` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_345695B5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
