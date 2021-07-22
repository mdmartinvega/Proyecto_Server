-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2021 a las 10:09:24
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET FOREIGN_KEY_CHECKS=0;
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

--
-- Volcado de datos para la tabla `message`
--

INSERT INTO `message` (`id`, `sender_id`, `receiver_id`, `message`, `created_at`) VALUES
(10, 52, 1, 'gfjhgchgcvmhgvhn', '2021-07-15 20:40:21'),
(11, 1, 52, 'Hola María', '2021-07-16 12:14:03'),
(13, 1, 52, 'Hola María', '2021-07-16 18:46:31'),
(16, 1, 56, 'Hola Chong, soy Loli', '2021-07-18 13:34:27'),
(17, 56, 1, 'Hola Loli, yo soy Chong', '2021-07-18 13:52:15'),
(19, 1, 56, 'Buenas, ¿Hablamos?', '2021-07-18 14:20:11'),
(25, 1, 72, 'Buenas, ¿Hablamos?', '2021-07-19 09:26:46'),
(32, 84, 70, 'Hola Javier, me gustaría contactar contigo.', '2021-07-20 19:02:21'),
(33, 1, 56, 'Hola Chong, ¿qué puedo hacer por tí?', '2021-07-22 01:50:26'),
(34, 1, 56, 'No he tenido noticias de tí, estás disponible?', '2021-07-22 07:53:36'),
(35, 93, 80, 'Hola Víctor, ¿Hablamos?', '2021-07-22 08:45:40'),
(38, 93, 56, 'Hola, ?contactamos?', '2021-07-22 09:36:47'),
(39, 93, 80, 'Hola victor, ¿Contactamo?', '2021-07-22 09:43:17'),
(40, 93, 80, 'Hola victor, ¿Contactamo?', '2021-07-22 09:43:18'),
(41, 93, 80, 'Hola Victor', '2021-07-22 09:53:48'),
(42, 93, 80, 'Contactamos?', '2021-07-22 10:00:56');

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `last_name`, `age`, `bio`, `years_living`, `image`, `city_id`, `avatar`) VALUES
(1, 'Loli@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$ha18bE/g4R0h6Gb5RBUGUubcUbwf01gbcLm0tjO6bvJsNinEoJ8Cu', 'Loli', 'Vega', 34, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad. Contacta conmigo!', 1, NULL, 1, NULL),
(52, 'MariadelaO@gmail.com', '[\"ROLE_USER\"]', '$2y$13$pPGydpjYjMtcQCBZv8TNzO4/abEUNnNHi3cxh6oklDXjBQbRnb6XW', 'Maria', 'de la O', 23, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', 5, '60f07e6ec3570.jpg', 11, NULL),
(56, 'chongchang@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$zNEVTKDqyZ7IJW6QULgJf.JVrdsPzwpaFw7VMvifwlaj9EJ0r1USK', 'Chong', 'Chang', 36, 'Mi nombre es Chong y vengo de Hong Kong aunque llevo viviendo en Estocolmo hace ya unos cuantos años. Me encanta conocer gente y por eso puede ayudarte a integrarte en esta genial ciudad y enseñarte los mejores sitios. Me gustan también los animales y el deporte.', 5, '60f080b08f11c.jpg', 3, NULL),
(62, 'luisfer@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$oFBfw8bPOfvnXkrh90lmSO2ajdoEiclHXNnrBCdFslUPjvpCcjlCe', 'Steven', 'Watts', 37, 'Soy americano aunque llevo viviendo en Londres casi toda mi vida desde que era pequeño y mis padres se mudaron aquí. Me encanta conocer gente y puedo ayudarte a integrarte en esta incréible y apasionante ciudad.', 10, '60f44b8a6a519.jpg', 5, NULL),
(63, 'baby@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$Pc/To1uFsSqtXzqOiTCfOuXl8Z8KHdWAUFI3fnk1nxGYOVBOHfLca', 'Baby', 'Uuuuhhhh', 18, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', 3, '60f44dda3c52b.jpg', 4, NULL),
(66, 'nievesgallego@gmail.com', '[\"ROLE_USER\"]', '$2y$13$drKp4L3N.wIREX/o7bxxV.bItVvSdJe3Ykzv1KdCfrjo0kp5YibcK', 'Nieves', 'Gallego', 31, 'Soy madrileña y llevo viviendo en Barcelona unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte, el cine y trabajo como sanitaria en un Hospital. Me gustaría que me ayudaras con los trámites básicos al llegar a la ciudad y conociéndo los alrededores.', NULL, '60f4591bf076d.jpg', 2, NULL),
(67, 'lauragallego@gmail.com', '[\"ROLE_USER\"]', '$2y$13$OSah8VTNQJtfgtKMaHWwdOT/2QZ4KmOBtbqrYn7KzxkeimvX22jgK', 'Laura', 'Gallego', 35, 'Soy madrileña y llevo viviendo en Lisboa unos años con mi hermana aunque siempre había vivido en Madrid. Me gusta salir a conocer gente, el deporte, el cine y trabajo como profesora de Educación infantil. Me mudo a Barcelona en breve y me gustaría contactar con laguien que nos ayude a integarnos en esa fabulosa ciudad.', NULL, '60f45943ab751.jpg', 2, NULL),
(68, 'anacarrasco@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$fULX5DyYe0PunXvoU9UFSeUVazw4nyZtDNExkIYC4iGOMNXWf/MtG', 'Ana', 'Carrasco', 36, 'Soy española aunque me mudé a Estocolmo hace 1 año por temas laborales. Trabajo como ingeniera industrial. Me encantan los idiomas, viajar y salir con amigos, contáctame y te ayudaré en todo lo que pueda.', 6, '60f4597574b6e.jpg', 3, NULL),
(70, 'javiercabello@gmail.com', '[\"ROLE_USER\"]', '$2y$13$UOrz5Vlyc59dexpzrcP5sO7zSbLYJkdtRMlhvsKFPJ67ldQF2mt96', 'Javiez', 'Cabello', 58, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', NULL, '60f459c550f1e.jpg', 4, NULL),
(71, 'karel@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$jbl1GYN.AtuKO2YTnjDZkuO8oCYJwA3VPinGn5l6PoTu4272suPL.', 'Karel', 'Ayllón', 41, 'Soy de Madrid pero en vivo en París hace unos años. Me encantan los idiomas y la gastronomía por lo que puedo enseñarte cualquier sitio de la ciudad y reocmendarte los que considero son los mejores lugares. No dudes en contactarme!', 8, '60f459f01b5a1.jpg', 4, NULL),
(72, 'pablolopez2@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$frM7/wYB9axKJSbIG7uW..FJ.g7zJUSppZBKwEMgmK/zw4ReLuqxO', 'Pablo', 'López', 35, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', 2, '60f45a23eaa11.jpg', 5, NULL),
(73, 'sonia@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$lPdgKFQBc0wSu3Qj9bUpQuJcphzsrRenCRCD337UkTqktgo4gcs.K', 'Sonia', 'Bolsón', 29, 'Soy madrileña y llevo viviendo en Málaga unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', 6, '60f45a4c1d3b7.jpg', 5, NULL),
(80, 'victorcru@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$Ncl7Mj2wHb3AVWZ0syFkb.16Kc5ThGZ/Kb8QV/dGm6WH6ZQGdQI1m', 'Victor', 'Cru', 25, 'Soy Victor y tengo mi propia empresa en Estocolmo desde hace 5 años por lo que puedo ayudarte con contactos de trabajo y todos los trámites que necesites al llegar a la ciudad. Mis hobbies son el cine en casa, leer y aprender cosas nuevas día tras día. Hablamos?', 6, '60f6758a82c3a.jpg', 3, NULL),
(84, 'sonia2@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$A/sOhOIP83mfyOlxfAaZo.ARNPIgSsrZze12Drp9DDBWVzfy5W.iC', 'Sonia', 'Bonson', 25, 'Hola! Vivo en Varsovia aunque soy Alemana y trabajo como periodista en una revista local. Mis hobbies son patinar, leer, el cine y salir con mis amigos. No dudes en contactarme para que pueda ayudarte en lo que necesites!', 10, '60f6fc15a459f.jpg', 8, NULL),
(85, 'oscar@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$NXFKxmcZ210vTFWFGAe11OEHVXUFwMS.FDGqbEtknjG7Cv5rv5ZOC', 'Oscar', 'Borrás', 45, 'Mi nombre es Òscar y llevo viviendo en El Cairo 6 años. Mi madre es India por lo que hablo también este idioma. Trabajo en el sector comercial que es mi pasión y me encantan los animales y el deporte. Si necesitas una inmersión cultural tu buddy soy yo así que no dudes en contactarme. Saludos!!', 6, '60f7cacce0981.jpg', 10, NULL),
(86, 'selene@gmail.com', '[\"ROLE_USER\"]', '$2y$13$7MyssU8kPNIuxN/fraMPX.yPb7lHoaFDnhcGhqxetcWGr0OLenlOK', 'Selene', 'Gómez', 26, 'Soy Selene y me mudo a el Cairo en 2 meses por temas laborales. Soy azafata de vuelo y mi base estará allí durante aproximadamente 1 año. Me gustaría conocer a alguien que pudiese enseñarme la ciudad y principalmente hacerme una inmersión cultural para conocer las costumbres y tradiciones del país. Gracias!!', NULL, '60f7cb71638a3.jpg', 10, NULL),
(87, 'angela@gmail.com', '[\"ROLE_USER\"]', '$2y$13$qMWXqMvCj/v1.9VLNGS0ou53CZMXhj5X/3n3wogBanPD04L/Kt7Y6', 'Ángela', 'Martínez', 28, 'Buenas!! Soy Ángela y soy de Lisboa y me estré mudando a Bergen en 1 mes y medio por temas laborales ya que empezaré a trabajar como guía en excursiones de barcos de cruceros. Me encantan los idiomas y viajar así como los animales y lo que más me gustaría en principio es realizar una inmersión cultutal que me de los conocimientos para poder integrarme lo antes posible en esa maravillosa ciudad. Nos vemos!', NULL, '60f7cd5b1ac09.jpg', 9, NULL),
(88, 'fabian@gmail.com', '[\"ROLE_USER\"]', '$2y$13$sY5Pm6AMNURl5K2m8B3xWeLrIk2kHd3CR.8DTAs.nIR9NtWcZqmkO', 'Fabián', 'Latson', 34, 'Hola! Soy Fabián, tengo 34 años y vivo en Berlín desde hace tiempo aunque en breve tengo que mudarme a Berín por un traslado en mi trabajo como ingeniero. hablo alemán perfecto y conozco la cultura alemana pero me gustaría contactar con laguien en Berlín que me enseñe la ciudad y me recomiende lugares a los que ir para conocer gente. Gracias!!', NULL, NULL, 6, NULL),
(89, 'samir@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$uxpXHY.Gyf7UdNkYuKkV2OLs3tj6AITDM6cRqKLj9yNR1fOt2H45i', 'Samir', 'Kaisukar', 27, 'Hola! Soy Samir y vivo en  Berlín ya que tengo familia allí y quiero buscar una oportunidad de trabajo. Necesitaría ayuda en los trámites que seguir para ello, temas de vivienda, bancos y documentación y si es posible conocer gente y hacer una inmersión cultutal de la ciudad para poder conocer su cultura y su política. Muchas gracias!', NULL, '60f7e313dc5e6.jpg', 6, NULL),
(90, 'ricardo@gmail.com', '[\"ROLE_USER\"]', '$2y$13$7Kb7fxpcdzPhi6lzmr55ZO6jOxkVfIW6GjjYrrPQJUCpYJh2b8j76', 'Ricardo', 'Hernández', 39, 'Me llamo Ricardo, vivo en Barcelona pero me mudaré en 2 meses a Munich para estudiar un máster de organización de empresas. Necesito ayuda con los trámites a seguir una vez aterrice allí y con el idioma ya que mi alemás es básico. Puedo hacer intercambio con inglés o portugés y además me encantaría conocer gente con la que salir y recorrer la ciudad y alrededores. Estamos en contacto!', NULL, '60f7e3e6a7846.jpg', 7, NULL),
(91, 'gara@gmail.com', '[\"ROLE_USER\"]', '$2y$13$lMGUpyfng8zoFQP2W0SN3O0G7T92ou11Zgs6/k3R9vxky5B18B.pW', 'Gara', 'Real', 42, 'Hola!!! me mudo a Málaga en 2 semanas, soy de Alicante y me gustaría conocer gente por allí para salir y recorrer la ciudad y los alrededores. Me gusta viajar, salir con mis amigos y hacer cenitas en casa ya que me encanta cocinar. Contactamos?', NULL, '60f7f4a20c005.jpg', 1, NULL),
(92, 'larisa@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$1kCByFRyvPFeFRVyqLwlc.doHqDCMB6lHSY2XI2W.OLxDY9iup.k2', 'Larisa', 'Bassi', 27, 'Buenas! mi nombre es Larissa y soy de Brasil aunque llevo viviendo en Barcelona unos años. Soy guía turístico para excursiones de cruceros por lo que una de las cosas que más me gustaría mostrarte es todos los rincones de la ciudad y los alrededores. Además puedo ayudarte con los trámites a seguir y presentarte gente con la que quedar, ¿nos vemos?', 3, '60f9098d3ea9d.jpg', 2, NULL),
(93, 'zara@gmail.com', '[\"ROLE_USER\"]', '$2y$13$6HHH64bQmE7nSvY7vvLHROApsk6SRlWlWEQV9X8Tyig.JWMSpQ0yG', 'Zara', 'Bricha', 26, 'Hola mi nombre es Zara y me mudo a Estocolmo. Me gustan los animales, la familia y los coches y me encantaría que me mostraras todos los rincones de esta increíble ciudad, ¿nos conocemos?', NULL, '60f909fe62bda.jpg', 3, NULL),
(94, 'jorge@gmail.com', '[\"ROLE_USER\"]', '$2y$13$Iza1JB1WewjdxCfeOl9d3.HKPqzxDqDqTZ5NBzha0Oq9bhdZmjmCa', 'Jorge', 'Vega', 32, 'Mi nombre es Jorge y me mudaré a Londres dentro de 3 semanas. Voy a trabajar en una empresa de desarrollo web y me gustaría conocer gente para salir y ayuda con los trámites a la llegada a la ciudad, ¿me ayudas?', NULL, '60f90ac122019.jpg', 5, NULL),
(96, 'pilardiaz@gmail.com', '[\"ROLE_BUDDY\"]', '$2y$13$3qfEhbyuOloLWWhupjjaZeioPGrGmVhXbG.SALvU/HAvZiZKzIW6u', 'Pilar', 'Diaz', 36, 'Soy madrileña y llevo viviendo en Estocolmo unos meses aunque ya viví aquí anteriormente. Me gusta salir a conocer gente, el deporte y trabajo en el mundo del desarrollo web. Puedo ayudarte en cualquier cosa que necesites para integrarte en esta maravillosa ciudad.', 2, '60f92284ec92f.jpg', 3, NULL);

--
-- Volcado de datos para la tabla `user_interest`
--

INSERT INTO `user_interest` (`user_id`, `interest_id`) VALUES
(1, 3),
(52, 6),
(52, 7),
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
(91, 6),
(92, 4),
(92, 5),
(93, 5),
(93, 6),
(93, 7),
(94, 2),
(94, 4),
(94, 6),
(94, 7),
(96, 1),
(96, 2);

--
-- Volcado de datos para la tabla `user_language`
--

INSERT INTO `user_language` (`user_id`, `language_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(52, 3),
(52, 8),
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
(91, 8),
(92, 1),
(92, 2),
(92, 3),
(93, 1),
(93, 2),
(93, 8),
(94, 1),
(94, 2),
(96, 1),
(96, 2);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
