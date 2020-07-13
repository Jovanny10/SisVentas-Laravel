-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-07-2020 a las 18:58:56
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbventaslaravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `idarticulo` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` varchar(512) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`idarticulo`, `idcategoria`, `codigo`, `nombre`, `stock`, `descripcion`, `imagen`, `estado`) VALUES
(1, 1, '1', 'Impresora Epson', 10, '', 'imagen.jpg', 'Activo'),
(2, 1, '1122', 'CableRed', 18, '', 'CableRed.jpg', 'Activo'),
(3, 9, '2211', 'Traje de gala', 45, '', 'índice.jpg', 'Activo'),
(4, 9, '4554', 'Sueter', 10, 'Suéter de Ian Alejandro', 'descarga1.jpg', 'Activo'),
(5, 1, '6558', 'Prueba 5', 78, '', 'índice.jpg', 'Activo'),
(6, 11, '477', 'Cronómetro', 15, '', 'descarga.png', 'Activo'),
(7, 1, '4777', 'Prueba7', 65, '', 'índice.jpg', 'Activo'),
(8, 1, '63', 'Prueba8', 45, '', NULL, 'Activo'),
(9, 1, '369', 'prueba9', 78, '', NULL, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `condicion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idcategoria`, `nombre`, `descripcion`, `condicion`) VALUES
(1, 'Equipos Cómputo', 'Accesorios de cómputo', 1),
(2, 'Útiles', 'Útiles', 1),
(3, 'Limpieza', 'Artículos de limpieza', 1),
(6, 'Medicina', 'Articulo medicinales', 1),
(7, 'Líquidos', 'Líquidos', 1),
(8, 'Comida', 'Productos de comida', 1),
(9, 'Vestimenta', 'Artículos de vestimenta', 1),
(10, 'Servicios', 'Servicios', 1),
(11, 'Accesorios de sonido', 'Todos los accesorios de sonido', 1),
(12, 'Jovanny', 'Leobardo Salas', 0),
(13, 'Ian Alejandro', 'jeejeje1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `iddetalle_ingreso` int(11) NOT NULL,
  `idingreso` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_compra` decimal(11,2) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_ingreso`
--

INSERT INTO `detalle_ingreso` (`iddetalle_ingreso`, `idingreso`, `idarticulo`, `cantidad`, `precio_compra`, `precio_venta`) VALUES
(1, 1, 5, 45, '4.00', '5.00'),
(2, 5, 5, 30, '70.00', '15.00'),
(3, 7, 1, 5, '300.00', '400.00'),
(4, 7, 2, 20, '10.00', '20.00'),
(5, 8, 3, 45, '12.00', '15.00'),
(6, 9, 4, 8, '455.00', '788.00'),
(7, 10, 8, 2, '10.00', '20.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `iddetalle_venta` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idarticulo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_venta` decimal(11,2) NOT NULL,
  `descuento` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`) VALUES
(1, 1, 2, 2, '20.00', '5.00'),
(2, 1, 1, 1, '400.00', '2.00'),
(3, 2, 2, 2, '20.00', '0.00'),
(4, 2, 1, 1, '400.00', '50.00'),
(5, 3, 1, 9, '400.00', '2.00');

--
-- Disparadores `detalle_venta`
--
DELIMITER $$
CREATE TRIGGER `tr_updStockVenta` AFTER INSERT ON `detalle_venta` FOR EACH ROW BEGIN
    	UPDATE articulo SET stock = stock - NEW.cantidad
        WHERE articulo.idarticulo = NEW.idarticulo;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `idingreso` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) DEFAULT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingreso`
--

INSERT INTO `ingreso` (`idingreso`, `idproveedor`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `estado`) VALUES
(1, 5, 'Boleta', '001', '001', '2020-06-10 08:15:00', '18.00', 'A'),
(5, 3, 'Boleta', '0007', '0007', '2020-06-25 11:12:12', '18.00', 'A'),
(6, 4, 'Boleta', '001', '00004', '2020-06-24 02:13:13', '18.00', 'A'),
(7, 5, 'Factura', NULL, '001', '2020-06-30 07:42:17', '18.00', 'A'),
(8, 5, 'Factura', NULL, '001', '2020-06-30 16:47:24', '18.00', 'A'),
(9, 6, 'Ticket', NULL, '78', '2020-06-30 16:50:03', '18.00', 'A'),
(10, 1, 'Ticket', NULL, '12', '2020-06-30 16:52:53', '18.00', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `tipo_persona` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_documento` varchar(15) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `tipo_persona`, `nombre`, `tipo_documento`, `num_documento`, `direccion`, `telefono`, `email`) VALUES
(1, 'Proveedor', 'Ana Montenegro', 'RUC', '74125863', '', '', ''),
(2, 'Cliente', 'Juan Perez', 'DNI', '36985214', '', NULL, NULL),
(3, 'Cliente', 'José Martinez', 'PAS', '0174589632', 'Oaxaca 020', '9531083793', 'jose@gmail.com'),
(4, 'Cliente', 'Jovanny', 'DNI', '456123', 'Lázaro Cárdenas Putla', '9531883793', 'jovannyleobardo10@gmail.com'),
(5, 'Proveedor', 'Soluciones Innovadora Oax S.A.C', 'RUC', '20600121234', 'Central de abasto', '9531553639', 'soluciones@gmail.com'),
(6, 'Proveedor', 'Inversiones SantaAna S.A.C', 'RUC', '20546231478', 'Chongoyape 01', '0749531152487', 'santaana@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jovanny', 'jovannyleobardo10@gmail.com', '$2y$10$cWO17ij6UU0F5wM7fTOqb.BPiaPtYOzLkbElc7MBMoT.drJ5SfoUS', 'FMNEST5qQKxXkIE52VMK98XxK5OwiZAenq8VkUDjrpkCvJQlIEPIuFbdC3Xj', '2020-07-04 04:49:33', '2020-07-13 16:55:52'),
(2, 'Ian', 'ian@gmail.com', '$2y$10$JcxrsAZ5JdH/oC1uDLl9h./H28/zxEHfNHLokF1SxK7WQiHLhkmtq', 'WM27AuppPdsykygVwKB4WT0Qp8AWyftzhbDPFsZ4LfSaeDkO7VpK1dXexRtB', '2020-07-04 15:59:42', '2020-07-04 17:42:30'),
(3, 'Pepe', 'pepe@gmail.com', '$2y$10$Wy1VrXxPI3a7TwjTMOGJj.CnnoFmQw2DITyVsgp6VRVythYIIl.e.', 'EBIXkqpqm7jGVoUHhRHlY7Nk0AcwV6qbpIaBMjJfQ1NxXgvgdjm4FonzQnM6', '2020-07-04 16:00:01', '2020-07-04 16:00:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `tipo_comprobante` varchar(20) NOT NULL,
  `serie_comprobante` varchar(7) NOT NULL,
  `num_comprobante` varchar(10) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `impuesto` decimal(4,2) NOT NULL,
  `total_venta` decimal(11,2) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`idventa`, `idcliente`, `tipo_comprobante`, `serie_comprobante`, `num_comprobante`, `fecha_hora`, `impuesto`, `total_venta`, `estado`) VALUES
(1, 2, 'Boleta', '001', '001', '2020-07-03 22:38:07', '18.00', '433.00', 'A'),
(2, 4, 'Factura', '001', '0008', '2020-07-03 22:49:48', '18.00', '390.00', 'A'),
(3, 3, 'Factura', '002', '0009', '2020-07-03 23:11:13', '18.00', '3598.00', 'A');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`idarticulo`),
  ADD KEY `fk_articulo_categoria_idx` (`idcategoria`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`);

--
-- Indices de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`iddetalle_ingreso`),
  ADD KEY `fk_detalle_ingreso_articulo_idx` (`idarticulo`),
  ADD KEY `fk_detalle_ingreso_idx` (`idingreso`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`iddetalle_venta`),
  ADD KEY `fk_detalle_venta_articulo_idx` (`idarticulo`),
  ADD KEY `fk_detalle_venta_idx` (`idventa`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`idingreso`),
  ADD KEY `fk_ingreso_persona_idx` (`idproveedor`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_venta_cliente_idx` (`idcliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `idarticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `iddetalle_ingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `iddetalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `idingreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD CONSTRAINT `fk_articulo_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD CONSTRAINT `fk_detalle_ingreso` FOREIGN KEY (`idingreso`) REFERENCES `ingreso` (`idingreso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_ingreso_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_venta_articulo` FOREIGN KEY (`idarticulo`) REFERENCES `articulo` (`idarticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD CONSTRAINT `fk_ingreso_persona` FOREIGN KEY (`idproveedor`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_cliente` FOREIGN KEY (`idcliente`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
