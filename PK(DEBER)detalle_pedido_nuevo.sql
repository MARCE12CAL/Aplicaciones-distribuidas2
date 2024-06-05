-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 05-06-2024 a las 00:50:16
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `jardineria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido_nuevo`
--

CREATE TABLE `detalle_pedido_nuevo` (
  `codigo_pedido` int(11) NOT NULL,
  `codigo_producto` varchar(15) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unidad` decimal(15,2) NOT NULL,
  `numero_linea` smallint(6) NOT NULL,
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_linea` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_pedido_nuevo`
--
ALTER TABLE `detalle_pedido_nuevo`
  ADD PRIMARY KEY (`id_detalle`),
  ADD UNIQUE KEY `id_pedido` (`id_pedido`),
  ADD UNIQUE KEY `id_producto` (`id_producto`),
  ADD UNIQUE KEY `id_linea` (`id_linea`),
  ADD UNIQUE KEY `uq_id_pedido` (`id_pedido`),
  ADD UNIQUE KEY `uq_id_producto` (`id_producto`),
  ADD UNIQUE KEY `uq_id_linea` (`id_linea`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_pedido_nuevo`
--
ALTER TABLE `detalle_pedido_nuevo`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
