-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-01-2025 a las 17:45:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sage_ccedspanish`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adjuntos`
--

CREATE TABLE `adjuntos` (
  `adjuntos_id` int(11) NOT NULL,
  `adjuntos_numero_documento` int(11) NOT NULL,
  `adjunto_cedula` mediumblob NOT NULL,
  `adjunto_eps` mediumblob NOT NULL,
  `adjunto_foto` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `adjuntos`
--

INSERT INTO `adjuntos` (`adjuntos_id`, `adjuntos_numero_documento`, `adjunto_cedula`, `adjunto_eps`, `adjunto_foto`) VALUES
(1, 66765384, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `aula_codigo` int(11) NOT NULL,
  `aula_capacidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doble_titulacion`
--

CREATE TABLE `doble_titulacion` (
  `doble_titulacion_id` int(11) NOT NULL,
  `doble_titulacion_estudiantes_no_documento` int(11) NOT NULL,
  `doble_titulacion_programas_codigo_principal` int(11) NOT NULL,
  `doble_titulacion_programas_codigo_secundario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `estudiantes_no_documento` varchar(25) NOT NULL,
  `estudiantes_tipo_documento` int(11) DEFAULT NULL,
  `estudiantes_nombre` varchar(50) NOT NULL,
  `estudiantes_apellidos` varchar(50) NOT NULL,
  `estudiantes_fecha_nacimiento` date NOT NULL,
  `estudiantes_genero` enum('Masculino','Femenino','Nulo') NOT NULL,
  `estudiantes_telefono` varchar(15) NOT NULL,
  `estudiantes_correo` varchar(100) NOT NULL,
  `estudiantes_estado` enum('Activo','Inactivo','Egresado') NOT NULL DEFAULT 'Activo',
  `estudiantes_direccion` varchar(255) NOT NULL,
  `estudiantes_adjunto_id` int(11) NOT NULL,
  `estudiantes_observaciones` varchar(255) NOT NULL,
  `estudiantes_doble_titulacion` enum('Si','No','Nulo') NOT NULL,
  `estudiantes_doble_titulacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`estudiantes_no_documento`, `estudiantes_tipo_documento`, `estudiantes_nombre`, `estudiantes_apellidos`, `estudiantes_fecha_nacimiento`, `estudiantes_genero`, `estudiantes_telefono`, `estudiantes_correo`, `estudiantes_estado`, `estudiantes_direccion`, `estudiantes_adjunto_id`, `estudiantes_observaciones`, `estudiantes_doble_titulacion`, `estudiantes_doble_titulacion_id`) VALUES
('1005892997', 1, 'Maria De Los Angeles', 'Garcia Aguirre', '2000-01-07', 'Femenino', '3052329512', 'mariagarciaguirre1011@gmail.com', 'Egresado', 'Calle 3', 0, 'Sin Observación', 'No', 7),
('1006035083', 1, 'Maira Alejandra', 'Aguilar Lozano', '2000-01-16', 'Nulo', '3165096986', 'AGUILARLOZANOMAYRA2002@GMAIL.COM', 'Egresado', 'Nulo', 0, 'Nulo', 'Nulo', 16),
('1006198442', 1, 'Daniel Mauricio', 'Daniel Mauricio', '2000-01-02', 'Nulo', '3188187897', 'DANIEL-MAURICIO@HOTMAIL.ES', 'Egresado', 'Nulo', 0, 'Nulo', 'Nulo', 2),
('1059988889', 1, 'Monica Dayana', 'Oyola Correa', '2000-01-11', 'Nulo', '3166739632', 'MONICAOYOLA@CCED.EDU.CO', 'Egresado', 'Nulo', 0, 'Nulo', 'Nulo', 11),
('1107523701', 1, 'Tatiana Lizeth', 'Gutierrez Lopez', '2000-01-08', 'Nulo', '3172503482', 'TATIANALOPEZ416@GMAIL.COM', 'Egresado', 'Nulo', 0, 'DOBLE TITULACION ADMON', 'Nulo', 8),
('1111815213', 1, 'Yerson Erasmo', 'Alomia Vivas', '2000-01-17', 'Nulo', '3166767864', 'e.alomia@misena.edu.co', 'Inactivo', 'Nulo', 0, 'Nulo', 'Nulo', 17),
('1112229638', 1, 'Jessica', 'Uribe Cayapu', '2000-01-14', 'Nulo', '3185093894', 'jessik.melisa04@hotmail.com', 'Egresado', 'Nulo', 0, 'Nulo', 'Nulo', 14),
('1130610031', 1, 'Alan', 'Echeverry Gomez', '2000-01-05', 'Nulo', '3163160445', 'alan1912@outlook.com', 'Inactivo', 'Nulo', 0, 'DEBE DERECHOS DE GRADOS', 'Nulo', 5),
('1130629410', 1, 'Edith Julieth', 'Alvarez Gil', '2000-01-18', 'Nulo', '3188201473', 'alvaresedith@gmail.com', 'Inactivo', 'Nulo', 0, 'Nulo', 'Nulo', 18),
('1130635660', 1, 'Natalia Cristina', 'Rios Muñeton', '2000-01-12', 'Nulo', '3102859640', 'nata887@hotmail.com', 'Egresado', 'Nulo', 0, 'DOBLE TITULACION ADMON', 'Nulo', 12),
('1143847659', 1, 'Angelica Alejandra', 'Hernandez Parra', '2000-01-23', 'Nulo', '3183447346', 'NAHLEJA93@GMAIL.COM', 'Egresado', 'Nulo', 0, 'Nulo', 'Nulo', 23),
('1143857405', 1, 'Marlyn Jiseth', 'Mina Casanova', '2000-01-25', 'Nulo', '3176173419', 'marcita03@hotmail.es', 'Egresado', 'Nulo', 0, 'DOBLE TITULACION', 'Nulo', 25),
('1143865042', 1, 'Jose Andres', 'Ibarra Mamian', '2000-01-24', 'Nulo', '3133263212', 'JEFE023MAESTRO@GMAIL.COM', 'Inactivo', 'Nulo', 0, 'Nulo', 'Nulo', 24),
('1143866014', 1, 'Briyeth Jakeline', 'Eraso Llalles', '2000-01-22', 'Nulo', '3187391908', 'brillierazo@gmail.com', 'Egresado', 'Nulo', 0, 'Nulo', 'Nulo', 22),
('1143868813', 1, 'Anlly Paola', 'Arce Restrepo', '2000-01-19', 'Nulo', '3145926481', 'angieteamo_1026@hotmail.com', 'Inactivo', 'Nulo', 0, 'DEBE DERECHOS DE GRADOS', 'Nulo', 19),
('1143877249', 1, 'Luana Milagros', 'Epia Sanchez', '2000-01-06', 'Nulo', '3206302970', 'lumiepsa2199@hotmail.com', 'Egresado', 'Nulo', 0, 'DOBLE TITULACION', 'Nulo', 6),
('1143972711', 1, 'Lilley Tatiana', 'Alcalde Mosquera', '2000-01-01', 'Nulo', '3106369720', 'tatix_0428@hotmail.com', 'Egresado', 'Nulo', 0, 'Nulo', 'Nulo', 1),
('1144072312', 1, 'Jorge Humberto', 'Huertas Rodriguez', '2000-01-10', 'Nulo', '3218560503', 'jorgehhrodriguez@gmail.com', 'Egresado', 'Nulo', 0, 'DOBLE TITULACION', 'Nulo', 10),
('1151960255', 1, 'Ange Dahiana', 'Buitrago Mendoza', '2000-01-20', 'Nulo', '3128945992', 'ange.buitrago.10@gmail.com', 'Egresado', 'Nulo', 0, 'DOBLE TITULACION', 'Nulo', 20),
('16379338', 1, 'Hugo Armando', 'Alzate Gomez', '2000-01-03', 'Nulo', '3045858640', 'gohu@hotmail.es', 'Egresado', 'Nulo', 0, 'Nulo', 'Nulo', 3),
('29109108', 1, 'Mary Luz', 'Velez Duran', '2000-01-15', 'Nulo', '3177216059', 'maryvelez2870@gmail.com', 'Egresado', 'Nulo', 0, 'Nulo', 'Nulo', 15),
('29741610', 1, 'Dolly', 'Bedoya', '2000-01-04', 'Nulo', '3103026702', 'dollybe0526@ghotmial.com', 'Egresado', 'Nulo', 0, 'DOBLE TITULACION ADMON', 'Nulo', 4),
('38556048', 1, 'Lorena', 'Diaz Vargas', '2000-01-21', 'Nulo', '3165314886', 'lorenadiaz81@gmail.com', 'Inactivo', 'Nulo', 0, 'Nulo', 'Nulo', 21),
('38563482', 1, 'Marina', 'Rodriguez Luz', '2000-01-13', 'Nulo', '3103474554', 'MARINARODRIGUEZ1307@GMAIL.COM', 'Egresado', 'Nulo', 0, 'Nulo', 'Nulo', 13),
('66765384', 1, 'Claudia Patricia', 'Hernandez Motato', '2000-01-09', 'Nulo', '3146909289', 'claudiahdez40@hotmail.com', 'Egresado', 'Nulo', 0, 'DOBLE TITULACION ADMON', 'Nulo', 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes_modulos`
--

CREATE TABLE `estudiantes_modulos` (
  `estudiantes_modulos_id` int(11) NOT NULL,
  `estudiantes_modulos_estudiantes_no_documento` int(11) NOT NULL,
  `estudiantes_modulos_modulos_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_estudiantes`
--

CREATE TABLE `grupos_estudiantes` (
  `grupos_id` int(11) NOT NULL,
  `grupos_estudiantes_estudiantes_no_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE `jornadas` (
  `jornadas_codigo` int(11) NOT NULL,
  `jornadas_periodo` enum('Diurna','Nocturna','Sabatina') NOT NULL,
  `jornadas_horarios` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jornadas`
--

INSERT INTO `jornadas` (`jornadas_codigo`, `jornadas_periodo`, `jornadas_horarios`) VALUES
(1, 'Diurna', '8AM-12PM'),
(2, 'Nocturna', '6PM-9PM'),
(3, 'Sabatina', '8AM-5PM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matricula`
--

CREATE TABLE `matricula` (
  `matricula_id` int(11) NOT NULL,
  `matricula_estudiante_numero_documento` varchar(25) DEFAULT NULL,
  `matricula_tipo_estudio_id` int(11) DEFAULT NULL,
  `matricula_programa_codigo` int(11) DEFAULT NULL,
  `matricula_fecha` date NOT NULL,
  `matricula_jornada_id` int(11) DEFAULT NULL,
  `matricula_recibo_pago` mediumblob NOT NULL,
  `matricula_acta` mediumblob NOT NULL,
  `matricula_diploma` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE `modulos` (
  `modulos_codigo` int(11) NOT NULL,
  `modulos_nombre` varchar(255) NOT NULL,
  `modulos_descripcion` text NOT NULL,
  `modulos_duracion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `permisos_id` int(11) NOT NULL,
  `permisos_nombre` varchar(255) NOT NULL,
  `permisos_numero_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `programas_codigo` int(11) NOT NULL,
  `programas_nombre` varchar(255) NOT NULL,
  `programas_descripcion` varchar(255) NOT NULL,
  `programas_precio` varchar(255) NOT NULL,
  `programas_duracion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`programas_codigo`, `programas_nombre`, `programas_descripcion`, `programas_precio`, `programas_duracion`) VALUES
(1, 'Prueba', 'Programa de prueba', '1000', '25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas_modulos`
--

CREATE TABLE `programas_modulos` (
  `programas_modulos_id` int(11) NOT NULL,
  `programas_modulos_programas_codigo` int(11) NOT NULL,
  `programas_modulos_modulos_codigo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `roles_id` int(11) NOT NULL,
  `roles_nombre` varchar(255) NOT NULL,
  `roles_codigo_permisos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`roles_id`, `roles_nombre`, `roles_codigo_permisos`) VALUES
(1, 'supadmin', '222222222222'),
(2, 'admin', '122111111111'),
(3, 'academico', '000111122222\n'),
(4, 'comercial', '000110100100\n'),
(5, 'docente', '000110010110'),
(6, 'estudiante', '000110001011');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `tipo_documento_id` int(11) NOT NULL,
  `tipo_documento_sigla` varchar(10) NOT NULL,
  `tipo_documento_nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`tipo_documento_id`, `tipo_documento_sigla`, `tipo_documento_nombre`) VALUES
(1, 'cc', 'Cedula de Ciudadanía'),
(2, 'ti', 'Tarjeta de Identidad'),
(3, 'ce', 'Cedula de Extranjeria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_estudio`
--

CREATE TABLE `tipo_estudio` (
  `tipo_estudio_id` int(11) NOT NULL,
  `tipo_estudio_nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_estudio`
--

INSERT INTO `tipo_estudio` (`tipo_estudio_id`, `tipo_estudio_nombre`) VALUES
(1, 'Programa técnico'),
(2, 'Curso'),
(3, 'Bachillerato por ciclos');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuarios_id`, `usuarios_nombre`, `usuarios_contrasena`, `usuarios_correo`, `usuarios_rol_id`, `usuarios_fecha_creacion`) VALUES
(1, 'Marlon Reina', '$2y$10$HzzM3ZInHT.SD8dcESdeBO5Td29/A39qpIVJZZdZHw4LaKiiQcaoS', 'marlon@gmail.com', 2, '2024-10-16 12:46:18'),
(2, 'Alejandro Ceron', '$2y$10$pZZY2oeku6WOh5CVRF34Wun2e22SOO4aO266IMG12inwlHKnsUF2G', 'lalejandrocd@gmail.com', 3, '2024-12-27 21:19:15');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adjuntos`
--
ALTER TABLE `adjuntos`
  ADD PRIMARY KEY (`adjuntos_id`);

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
  ADD PRIMARY KEY (`estudiantes_no_documento`),
  ADD KEY `estudiantes_tipo_documento` (`estudiantes_tipo_documento`),
  ADD KEY `estudiantes_doble_titulacion_id` (`estudiantes_doble_titulacion_id`),
  ADD KEY `estudiantes_adjunto_id` (`estudiantes_adjunto_id`);

--
-- Indices de la tabla `estudiantes_modulos`
--
ALTER TABLE `estudiantes_modulos`
  ADD PRIMARY KEY (`estudiantes_modulos_id`),
  ADD UNIQUE KEY `estudiantes_modulos_estudiantes_no_documento` (`estudiantes_modulos_estudiantes_no_documento`,`estudiantes_modulos_modulos_codigo`),
  ADD KEY `estudiantes_modulos_modulos_codigo` (`estudiantes_modulos_modulos_codigo`);

--
-- Indices de la tabla `grupos_estudiantes`
--
ALTER TABLE `grupos_estudiantes`
  ADD PRIMARY KEY (`grupos_id`),
  ADD UNIQUE KEY `grupos_estudiantes_estudiantes_no_documento` (`grupos_estudiantes_estudiantes_no_documento`);

--
-- Indices de la tabla `jornadas`
--
ALTER TABLE `jornadas`
  ADD PRIMARY KEY (`jornadas_codigo`);

--
-- Indices de la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD PRIMARY KEY (`matricula_id`),
  ADD KEY `matricula_estudiante_numero_documento` (`matricula_estudiante_numero_documento`,`matricula_tipo_estudio_id`,`matricula_programa_codigo`,`matricula_jornada_id`),
  ADD KEY `matricula_jornada_id` (`matricula_jornada_id`),
  ADD KEY `matricula_programa_codigo` (`matricula_programa_codigo`),
  ADD KEY `matricula_tipo_estudio_id` (`matricula_tipo_estudio_id`);

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
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`tipo_documento_id`);

--
-- Indices de la tabla `tipo_estudio`
--
ALTER TABLE `tipo_estudio`
  ADD PRIMARY KEY (`tipo_estudio_id`);

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
-- AUTO_INCREMENT de la tabla `adjuntos`
--
ALTER TABLE `adjuntos`
  MODIFY `adjuntos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT de la tabla `matricula`
--
ALTER TABLE `matricula`
  MODIFY `matricula_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `tipo_documento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usuarios_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `calendarios_ibfk_6` FOREIGN KEY (`calendarios_franjas_id`) REFERENCES `jornadas` (`jornadas_codigo`);

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `estudiantes_ibfk_1` FOREIGN KEY (`estudiantes_tipo_documento`) REFERENCES `tipo_documento` (`tipo_documento_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiantes_modulos`
--
ALTER TABLE `estudiantes_modulos`
  ADD CONSTRAINT `estudiantes_modulos_ibfk_2` FOREIGN KEY (`estudiantes_modulos_modulos_codigo`) REFERENCES `modulos` (`modulos_codigo`);

--
-- Filtros para la tabla `grupos_estudiantes`
--
ALTER TABLE `grupos_estudiantes`
  ADD CONSTRAINT `grupos_estudiantes_ibfk_1` FOREIGN KEY (`grupos_estudiantes_estudiantes_no_documento`) REFERENCES `estudiantes_modulos` (`estudiantes_modulos_id`);

--
-- Filtros para la tabla `matricula`
--
ALTER TABLE `matricula`
  ADD CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`matricula_jornada_id`) REFERENCES `jornadas` (`jornadas_codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`matricula_programa_codigo`) REFERENCES `programas` (`programas_codigo`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `matricula_ibfk_3` FOREIGN KEY (`matricula_tipo_estudio_id`) REFERENCES `tipo_estudio` (`tipo_estudio_id`) ON DELETE SET NULL ON UPDATE CASCADE;

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
