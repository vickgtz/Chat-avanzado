-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-05-2019 a las 22:10:28
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cocochat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amigos`
--

CREATE TABLE `amigos` (
  `Id_usuario` varchar(20) NOT NULL,
  `Apodo` varchar(20) NOT NULL,
  `Amigo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `amigos`
--

INSERT INTO `amigos` (`Id_usuario`, `Apodo`, `Amigo`) VALUES
('Vick', 'Anita', 'Ana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `Id_grupo` int(11) NOT NULL,
  `Nombre_grupo` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`Id_grupo`, `Nombre_grupo`) VALUES
(1, 'Prueba');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE `mensaje` (
  `Id_mensaje_grupal` int(11) NOT NULL,
  `Id_usuario` varchar(20) NOT NULL,
  `Texto` varchar(200) NOT NULL,
  `Id_grupo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`Id_mensaje_grupal`, `Id_usuario`, `Texto`, `Id_grupo`) VALUES
(1, 'Vick', 'Ya se mandan?', 1),
(2, 'Vick', 'Hola?', 1),
(3, 'Ana', 'Hi', 1),
(4, 'Ana', 'Si sirve ', 1),
(5, 'Ana', 'Tiene bugs pero sirve!!!!!!!', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje_visto`
--

CREATE TABLE `mensaje_visto` (
  `Id_mensaje` int(11) NOT NULL,
  `Id_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `mensaje_visto`
--

INSERT INTO `mensaje_visto` (`Id_mensaje`, `Id_usuario`) VALUES
(3, 'Ana'),
(4, 'Ana'),
(5, 'Ana'),
(1, 'Vick'),
(2, 'Vick');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_Usuario` varchar(20) NOT NULL,
  `Contrasena` varchar(20) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_Usuario`, `Contrasena`, `Nombre`) VALUES
('Ana', '123', 'Ana'),
('Karin', '123', 'Karin'),
('Vick', '123', 'Victor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_grupo`
--

CREATE TABLE `usuario_grupo` (
  `Id_grupo` int(11) NOT NULL,
  `Id_usuario` varchar(20) NOT NULL,
  `Status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario_grupo`
--

INSERT INTO `usuario_grupo` (`Id_grupo`, `Id_usuario`, `Status`) VALUES
(1, 'Ana', 1),
(1, 'Karin', 1),
(1, 'Vick', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD PRIMARY KEY (`Id_usuario`,`Amigo`),
  ADD KEY `Amigo` (`Amigo`),
  ADD KEY `Id_usuario` (`Id_usuario`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`Id_grupo`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`Id_mensaje_grupal`),
  ADD KEY `Id_usuario` (`Id_usuario`),
  ADD KEY `Id_grupo` (`Id_grupo`);

--
-- Indices de la tabla `mensaje_visto`
--
ALTER TABLE `mensaje_visto`
  ADD PRIMARY KEY (`Id_mensaje`),
  ADD KEY `Id_usuario` (`Id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_Usuario`);

--
-- Indices de la tabla `usuario_grupo`
--
ALTER TABLE `usuario_grupo`
  ADD PRIMARY KEY (`Id_grupo`,`Id_usuario`),
  ADD KEY `Id_grupo` (`Id_grupo`),
  ADD KEY `Id_usuario` (`Id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `Id_grupo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `Id_mensaje_grupal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amigos`
--
ALTER TABLE `amigos`
  ADD CONSTRAINT `amigos_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`id_Usuario`),
  ADD CONSTRAINT `amigos_ibfk_2` FOREIGN KEY (`Amigo`) REFERENCES `usuario` (`id_Usuario`);

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `id_grupo_2` FOREIGN KEY (`Id_grupo`) REFERENCES `grupo` (`Id_grupo`),
  ADD CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`id_Usuario`);

--
-- Filtros para la tabla `mensaje_visto`
--
ALTER TABLE `mensaje_visto`
  ADD CONSTRAINT `mensaje_visto_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`id_Usuario`);

--
-- Filtros para la tabla `usuario_grupo`
--
ALTER TABLE `usuario_grupo`
  ADD CONSTRAINT `id_grupo` FOREIGN KEY (`Id_grupo`) REFERENCES `grupo` (`Id_grupo`),
  ADD CONSTRAINT `usuario_grupo_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`id_Usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
