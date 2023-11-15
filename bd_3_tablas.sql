-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2023 a las 20:25:26
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_3_tablas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_dni` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_dni`, `nombre`, `apellidos`) VALUES
(4527638, 'Patricia', 'Gomez'),
(6954873, 'Alicia', 'Carrazco'),
(11567492, 'Marisel', 'Gonzalez'),
(16952023, 'Ricardo', 'Valdez'),
(20236456, 'Carlos', 'Betancur'),
(25914245, 'Viviana', 'Perez'),
(33666985, 'María Inés', 'Zalazar'),
(39458274, 'Felipe', 'Batista'),
(42611457, 'Anabella', 'Prieto'),
(45652352, 'Julián', 'Ramirez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compras` int(11) NOT NULL,
  `concepto` varchar(20) NOT NULL,
  `clientes_dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compras`, `concepto`, `clientes_dni`) VALUES
(111001, 'Remeras Varios Color', 6954873),
(111002, 'Remeras', 42611457),
(111003, 'Pantalón corto', 20236456),
(111004, 'Bermudas Homb', 39458274),
(111005, 'Camisas lisas Homb', 45652352),
(111006, 'Vestido lunares', 11567492),
(111007, 'Remera Verano M', 4527638),
(111008, 'Camiseta Muj', 33666985),
(111009, 'Chombas Homb', 16952023),
(111010, 'Saco Mujer', 25914245);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompra`
--

CREATE TABLE `lineascompra` (
  `numero_id` int(20) NOT NULL,
  `compras_id` int(20) NOT NULL,
  `producto` varchar(30) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineascompra`
--

INSERT INTO `lineascompra` (`numero_id`, `compras_id`, `producto`, `importe`) VALUES
(11245, 111001, 'Remera Azul Mnga Corta', 2560),
(15892, 111007, 'Remera Verano m flores', 7999),
(16451, 111007, 'Remera Veran Mj Flores', 7999),
(20995, 111005, 'Camisa Hombre Celeste', 9999),
(45001, 111002, 'Remera rayas mnga larga', 5299),
(45729, 111009, 'Chomba Homb Sale', 5999.99),
(48235, 111004, 'Bermuda Blanca Homb', 12999),
(48354, 111003, 'Pantalón Corto Lino', 14999),
(58777, 111010, 'Saco Mujer Corto Negro Hilo', 14000),
(78996, 111008, 'Camiseta Muj Rosa', 4569.99),
(90235, 111006, 'Vestido Lunares Corto ', 17599);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compras`),
  ADD KEY `clientes_dni` (`clientes_dni`);

--
-- Indices de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD PRIMARY KEY (`numero_id`),
  ADD KEY `compras_id` (`compras_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`id_dni`);

--
-- Filtros para la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD CONSTRAINT `lineascompra_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id_compras`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
