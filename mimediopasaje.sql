-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 27-11-2023 a las 00:42:14
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

CREATE DATABASE IF NOT EXISTS mimediopasaje;
USE mediopasaje;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mimediopasaje`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denuncia`
--

DROP TABLE IF EXISTS `denuncia`;
CREATE TABLE IF NOT EXISTS `denuncia` (
  `denCod` int NOT NULL AUTO_INCREMENT,
  `usrDNI` varchar(128) NOT NULL,
  `denRazSoc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `denMovPla` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `denFec` date NOT NULL,
  `denHor` time NOT NULL,
  `denEvi` mediumblob,
  PRIMARY KEY (`denCod`),
  KEY `usrDNI` (`usrDNI`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `denuncia`
--

INSERT INTO `denuncia` (`denCod`, `usrDNI`, `denRazSoc`, `denMovPla`, `denFec`, `denHor`, `denEvi`) VALUES
(11, '12341', 'asdf', 'asdfas', '2010-10-10', '10:10:00', 0x617365646661736466),
(12, '12341', '1234', '12343', '2023-11-20', '20:56:00', 0x31333234),
(13, '12341', '1234', '12343', '2023-11-20', '16:02:00', 0x31333234),
(14, '12341', 'fff', 'fff', '2023-11-20', '16:12:00', 0x666666),
(15, '12341', 'fffaaa', 'fff', '2023-11-20', '16:12:00', 0x666666),
(16, '12341', 'wer', 'qwer', '2023-11-20', '17:44:00', 0x71776572),
(17, '12341', 'sdfasdf', 'asdf', '2023-11-21', '07:38:00', 0x61736466);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `usrDNI` varchar(128) NOT NULL,
  `usrNom` varchar(128) NOT NULL,
  `usrApe` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `usrEma` varchar(128) NOT NULL,
  `usrPas` varchar(128) NOT NULL,
  `usrImgCar` mediumblob NOT NULL,
  `usrImgDNI` mediumblob NOT NULL,
  `usrValCod` int NOT NULL,
  `usrVal` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`usrDNI`),
  UNIQUE KEY `usrEma` (`usrEma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`usrDNI`, `usrNom`, `usrApe`, `usrEma`, `usrPas`, `usrImgCar`, `usrImgDNI`, `usrValCod`, `usrVal`) VALUES
('12341', 'Franco', 'Cardenas', 'fcardenasm@unsa.edu.pe', '$2b$10$/lKlXJqREAz9BR2lEi6Dj.pvbSaJWahKUdJGMUBLXjBsa4d3kngBW', 0x617364666173646661736466, 0x316177646661736466, 263746, 0),
('asdf', 'asdf', 'asdf', 'hgalvezq@unsa.edu.pe', '$2b$10$LGclubCPjEqP12AQW4R14On80SrDkz4VaOvMZDXItyqE.Pby2ZJkS', 0x61736466, 0x7361656466, 0, 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `denuncia`
--
ALTER TABLE `denuncia`
  ADD CONSTRAINT `denuncia_ibfk_1` FOREIGN KEY (`usrDNI`) REFERENCES `user` (`usrDNI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
