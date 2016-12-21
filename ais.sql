-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-12-2016 a las 00:03:13
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ais`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `ID_perfil` int(11) NOT NULL,
  `ID_usuario` int(11) DEFAULT NULL,
  `ID_planta` int(11) DEFAULT NULL,
  `Posicion` int(11) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `temperatura` int(11) DEFAULT NULL,
  `humedad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`ID_perfil`, `ID_usuario`, `ID_planta`, `Posicion`, `Nombre`, `temperatura`, `humedad`) VALUES
(1, 1, 1, 1, 'Cactus', 5, 200),
(2, 1, 2, 2, 'Hierbabuena', 23, 500),
(3, 1, 2, 3, 'Hierbabuena', 35, 300);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planta`
--

CREATE TABLE `planta` (
  `ID_planta` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Tiempo_riego` int(11) DEFAULT NULL,
  `Temp_min` int(11) DEFAULT NULL,
  `Temp_max` int(11) DEFAULT NULL,
  `humedad_min` int(11) DEFAULT NULL,
  `humedad_max` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `planta`
--

INSERT INTO `planta` (`ID_planta`, `Nombre`, `Tiempo_riego`, `Temp_min`, `Temp_max`, `humedad_min`, `humedad_max`) VALUES
(1, 'Cactus', 3, 10, 40, 140, 550),
(2, 'Hierbabuena', 200, 5, 35, 200, 600),
(3, '456', NULL, 5, 4, 300, 780),
(4, 'asd', NULL, 6, 8, 100, 500),
(5, 'asd', NULL, 3, 5, 4, 6),
(6, 'cactus 2', NULL, 5, 25, 200, 600),
(7, 'cactus 2', NULL, 2, 25, 100, 500),
(8, 'cactus 2', NULL, 2, 25, 100, 600);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID_usuario` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `Contraseña` varchar(50) DEFAULT NULL,
  `Estado` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_usuario`, `Nombre`, `Correo`, `Contraseña`, `Estado`) VALUES
(1, 'ais', NULL, 'inacap', 'verificado'),
(2, 'admin', 'null', 'inacap', 'verificado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`ID_perfil`),
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `ID_planta` (`ID_planta`);

--
-- Indices de la tabla `planta`
--
ALTER TABLE `planta`
  ADD PRIMARY KEY (`ID_planta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `ID_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `planta`
--
ALTER TABLE `planta`
  MODIFY `ID_planta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`),
  ADD CONSTRAINT `perfil_ibfk_2` FOREIGN KEY (`ID_planta`) REFERENCES `planta` (`ID_planta`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
