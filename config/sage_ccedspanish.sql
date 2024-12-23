-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-12-2024 a las 17:27:24
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sage_cced`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `aula_codigo` int(11) NOT NULL,
  `aula_capacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendarios`
--

CREATE TABLE `calendarios` (
  `calendarios_id` int(11) NOT NULL,
  `calendarios_aulas_codigo` int(11) NOT NULL,
  `calendarios_programas_codigo` int(11) NOT NULL,
  `calendarios_modulos_codigo` int(11) NOT NULL,
  `calendario_docente_no_documento` int(11) NOT NULL,
  `calendario_grupo_estudiantes_id` int(11) NOT NULL,
  `calendarios_franjas_id` int(11) NOT NULL,
  `calendarios_descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doble_titulacion`
--

CREATE TABLE `doble_titulacion` (
  `doble_titulacion_id` int(11) NOT NULL,
  `doble_titulacion_estudiantes_no_documento` int(11) NOT NULL,
  `doble_titulacion_programas_codigo_principal` int(11) NOT NULL,
  `doble_titulacion_programas_codigo_secundario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `docentes_no_documento` int(11) NOT NULL,
  `docentes_nombre` varchar(255) NOT NULL,
  `docentes_tipo_documento` enum('cc','ce') NOT NULL,
  `docentes_telefono` varchar(255) NOT NULL,
  `docentes_correo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `estudiantes_no_documento` int(11) NOT NULL,
  `estudiantes_tipo_documento` enum('cc','ti','ce') DEFAULT NULL,
  `estudiantes_nombre` varchar(50) NOT NULL,
  `estudiantes_apellidos` varchar(50) NOT NULL,
  `estudiantes_fecha_nacimiento` date NOT NULL,
  `estudiantes_genero` enum('Masculino','Femenino') NOT NULL,
  `estudiantes_telefono` varchar(15) NOT NULL,
  `estudiantes_correo` varchar(100) NOT NULL,
  `estudiantes_estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `estudiantes_doble_titulacion` enum('Si','No') NOT NULL,
  `estudiantes_doble_titulacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`estudiantes_no_documento`, `estudiantes_tipo_documento`, `estudiantes_nombre`, `estudiantes_apellidos`, `estudiantes_fecha_nacimiento`, `estudiantes_genero`, `estudiantes_telefono`, `estudiantes_correo`, `estudiantes_estado`, `estudiantes_doble_titulacion`, `estudiantes_doble_titulacion_id`) VALUES
(1128056709, 'cc', 'Eduardo ', 'Sanchez Ramos', '1989-08-19', 'Masculino', '34172', 'calidadydesarrollocced@gmail.com', 'activo', 'Si', 0),
(1130645891, 'cc', 'Valeria', 'Villa', '2001-12-24', 'Femenino', '316643125', 'valvilla@gmail.com', 'activo', 'Si', 0),
(1144204801, 'ce', 'Sebastian', 'Martinez', '1998-01-07', 'Masculino', '3182450484', 'sebastian30@live.com', 'activo', 'Si', 0),
(1193582889, 'cc', 'Ana Milena', 'Reina', '2003-09-18', 'Femenino', '3157683042', 'nami@gmail.com', 'inactivo', 'Si', 0),
(1193582890, 'cc', 'Marlon', 'Reina', '2003-09-18', 'Masculino', '3157683041', 'marlonwtf919@gmail.com', 'activo', 'Si', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes_modulos`
--

CREATE TABLE `estudiantes_modulos` (
  `estudiantes_modulos_id` int(11) NOT NULL,
  `estudiantes_modulos_estudiantes_no_documento` int(11) NOT NULL,
  `estudiantes_modulos_modulos_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `franjas`
--

CREATE TABLE `franjas` (
  `franjas_codigo` int(11) NOT NULL,
  `franjas_periodo` enum('Mañana','Tarde','Noche') NOT NULL,
  `franjas_horarios` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_estudiantes`
--

CREATE TABLE `grupos_estudiantes` (
  `grupos_id` int(11) NOT NULL,
  `grupos_estudiantes_estudiantes_no_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `modulos_codigo` int(11) NOT NULL,
  `modulos_nombre` varchar(255) NOT NULL,
  `modulos_descripcion` text NOT NULL,
  `modulos_duracion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `permisos_id` int(11) NOT NULL,
  `permisos_nombre` varchar(255) NOT NULL,
  `permisos_numero_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `programas_codigo` int(11) NOT NULL,
  `programas_nombre` int(11) NOT NULL,
  `programas_descripcion` int(11) NOT NULL,
  `programas_precio` int(11) NOT NULL,
  `programas_duracion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas_modulos`
--

CREATE TABLE `programas_modulos` (
  `programas_modulos_id` int(11) NOT NULL,
  `programas_modulos_programas_codigo` int(11) NOT NULL,
  `programas_modulos_modulos_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `roles_id` int(11) NOT NULL,
  `roles_nombre` varchar(255) NOT NULL,
  `roles_codigo_permisos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`roles_id`, `roles_nombre`, `roles_codigo_permisos`) VALUES
(1, 'administrador', 0),
(2, 'usuario comun', 0),
(5, 'usuario comun', 32);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuarios_id` int(11) NOT NULL,
  `usuarios_nombre` varchar(100) NOT NULL,
  `usuarios_contrasena` varchar(255) NOT NULL,
  `usuarios_correo` varchar(100) DEFAULT NULL,
  `usuarios_rol_id` int(11) NOT NULL,
  `usuarios_fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuarios_id`, `usuarios_nombre`, `usuarios_contrasena`, `usuarios_correo`, `usuarios_rol_id`, `usuarios_fecha_creacion`) VALUES
(1, 'Marlon', '$2y$10$HzzM3ZInHT.SD8dcESdeBO5Td29/A39qpIVJZZdZHw4LaKiiQcaoS', 'marlon@gmail.com', 1, '2024-10-16 12:46:18'),
(2, 'administrador2', 'administrador2', 'administrador2@gmail.com', 5, '2024-12-03 13:39:29');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`aula_codigo`);

--
-- Indices de la tabla `calendarios`
--
ALTER TABLE `calendarios`
  ADD PRIMARY KEY (`calendarios_id`),
  ADD UNIQUE KEY `calendarios_aulas_codigo` (`calendarios_aulas_codigo`,`calendarios_programas_codigo`,`calendarios_modulos_codigo`,`calendario_docente_no_documento`,`calendario_grupo_estudiantes_id`,`calendarios_franjas_id`),
  ADD KEY `calendarios_programas_codigo` (`calendarios_programas_codigo`),
  ADD KEY `calendarios_modulos_codigo` (`calendarios_modulos_codigo`),
  ADD KEY `calendario_docente_no_documento` (`calendario_docente_no_documento`),
  ADD KEY `calendario_grupo_estudiantes_id` (`calendario_grupo_estudiantes_id`),
  ADD KEY `calendarios_franjas_id` (`calendarios_franjas_id`);

--
-- Indices de la tabla `doble_titulacion`
--
ALTER TABLE `doble_titulacion`
  ADD PRIMARY KEY (`doble_titulacion_id`),
  ADD UNIQUE KEY `doble_titulacion_estudiantes_no_documento` (`doble_titulacion_estudiantes_no_documento`,`doble_titulacion_programas_codigo_principal`,`doble_titulacion_programas_codigo_secundario`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`docentes_no_documento`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`estudiantes_no_documento`);

--
-- Indices de la tabla `estudiantes_modulos`
--
ALTER TABLE `estudiantes_modulos`
  ADD PRIMARY KEY (`estudiantes_modulos_id`),
  ADD UNIQUE KEY `estudiantes_modulos_estudiantes_no_documento` (`estudiantes_modulos_estudiantes_no_documento`,`estudiantes_modulos_modulos_codigo`),
  ADD KEY `estudiantes_modulos_modulos_codigo` (`estudiantes_modulos_modulos_codigo`);

--
-- Indices de la tabla `franjas`
--
ALTER TABLE `franjas`
  ADD PRIMARY KEY (`franjas_codigo`);

--
-- Indices de la tabla `grupos_estudiantes`
--
ALTER TABLE `grupos_estudiantes`
  ADD PRIMARY KEY (`grupos_id`),
  ADD UNIQUE KEY `grupos_estudiantes_estudiantes_no_documento` (`grupos_estudiantes_estudiantes_no_documento`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`modulos_codigo`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`permisos_id`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`programas_codigo`);

--
-- Indices de la tabla `programas_modulos`
--
ALTER TABLE `programas_modulos`
  ADD PRIMARY KEY (`programas_modulos_id`),
  ADD UNIQUE KEY `programas_modulos_programas_codigo` (`programas_modulos_programas_codigo`,`programas_modulos_modulos_codigo`),
  ADD KEY `programas_modulos_modulos_codigo` (`programas_modulos_modulos_codigo`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roles_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuarios_id`),
  ADD UNIQUE KEY `role` (`usuarios_rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calendarios`
--
ALTER TABLE `calendarios`
  MODIFY `calendarios_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `doble_titulacion`
--
ALTER TABLE `doble_titulacion`
  MODIFY `doble_titulacion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `estudiantes_no_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1193582891;

--
-- AUTO_INCREMENT de la tabla `estudiantes_modulos`
--
ALTER TABLE `estudiantes_modulos`
  MODIFY `estudiantes_modulos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupos_estudiantes`
--
ALTER TABLE `grupos_estudiantes`
  MODIFY `grupos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `permisos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programas_modulos`
--
ALTER TABLE `programas_modulos`
  MODIFY `programas_modulos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuarios_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calendarios`
--
ALTER TABLE `calendarios`
  ADD CONSTRAINT `calendarios_ibfk_1` FOREIGN KEY (`calendarios_programas_codigo`) REFERENCES `programas` (`programas_codigo`),
  ADD CONSTRAINT `calendarios_ibfk_2` FOREIGN KEY (`calendarios_aulas_codigo`) REFERENCES `aulas` (`aula_codigo`),
  ADD CONSTRAINT `calendarios_ibfk_3` FOREIGN KEY (`calendarios_modulos_codigo`) REFERENCES `modulos` (`modulos_codigo`),
  ADD CONSTRAINT `calendarios_ibfk_4` FOREIGN KEY (`calendario_docente_no_documento`) REFERENCES `docentes` (`docentes_no_documento`),
  ADD CONSTRAINT `calendarios_ibfk_5` FOREIGN KEY (`calendario_grupo_estudiantes_id`) REFERENCES `grupos_estudiantes` (`grupos_id`),
  ADD CONSTRAINT `calendarios_ibfk_6` FOREIGN KEY (`calendarios_franjas_id`) REFERENCES `franjas` (`franjas_codigo`);

--
-- Filtros para la tabla `estudiantes_modulos`
--
ALTER TABLE `estudiantes_modulos`
  ADD CONSTRAINT `estudiantes_modulos_ibfk_1` FOREIGN KEY (`estudiantes_modulos_estudiantes_no_documento`) REFERENCES `estudiantes` (`estudiantes_no_documento`),
  ADD CONSTRAINT `estudiantes_modulos_ibfk_2` FOREIGN KEY (`estudiantes_modulos_modulos_codigo`) REFERENCES `modulos` (`modulos_codigo`);

--
-- Filtros para la tabla `grupos_estudiantes`
--
ALTER TABLE `grupos_estudiantes`
  ADD CONSTRAINT `grupos_estudiantes_ibfk_1` FOREIGN KEY (`grupos_estudiantes_estudiantes_no_documento`) REFERENCES `estudiantes_modulos` (`estudiantes_modulos_id`);

--
-- Filtros para la tabla `programas_modulos`
--
ALTER TABLE `programas_modulos`
  ADD CONSTRAINT `programas_modulos_ibfk_1` FOREIGN KEY (`programas_modulos_programas_codigo`) REFERENCES `programas` (`programas_codigo`),
  ADD CONSTRAINT `programas_modulos_ibfk_2` FOREIGN KEY (`programas_modulos_modulos_codigo`) REFERENCES `modulos` (`modulos_codigo`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`usuarios_rol_id`) REFERENCES `roles` (`roles_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
