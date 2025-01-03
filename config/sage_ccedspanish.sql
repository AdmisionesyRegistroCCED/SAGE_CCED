-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-01-2025 a las 13:46:17
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `estudiantes_no_documento` varchar(25) NOT NULL,
  `estudiantes_tipo_documento` int(11) DEFAULT NULL,
  `estudiantes_nombre` varchar(50) NOT NULL,
  `estudiantes_apellidos` varchar(50) NOT NULL,
  `estudiantes_fecha_nacimiento` date NOT NULL,
  `estudiantes_genero` enum('Masculino','Femenino','Nulo') NOT NULL,
  `estudiantes_telefono` varchar(15) NOT NULL,
  `estudiantes_correo` varchar(100) NOT NULL,
  `estudiantes_estado` enum('activo','inactivo','egresado') NOT NULL DEFAULT 'activo',
  `estudiantes_direccion` varchar(255) NOT NULL,
  `estudiantes_adjunto_id` int(11) NOT NULL,
  `estudiantes_observaciones` varchar(255) NOT NULL,
  `estudiantes_doble_titulacion` enum('Si','No') NOT NULL,
  `estudiantes_doble_titulacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`estudiantes_no_documento`, `estudiantes_tipo_documento`, `estudiantes_nombre`, `estudiantes_apellidos`, `estudiantes_fecha_nacimiento`, `estudiantes_genero`, `estudiantes_telefono`, `estudiantes_correo`, `estudiantes_estado`, `estudiantes_direccion`, `estudiantes_adjunto_id`, `estudiantes_observaciones`, `estudiantes_doble_titulacion`, `estudiantes_doble_titulacion_id`) VALUES
('1001546136', 1, 'Elizabeth', 'Zapata Henao', '0000-00-00', 'Nulo', '3122007556', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1318),
('1002186575', 1, 'Jessica Tatiana', 'Morante Salcedo', '0000-00-00', 'Nulo', '3232917791', 'jessicamorante.99@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 157),
('1002652104', 1, 'Dahiana', 'Mejia Gutirrez', '0000-00-00', 'Nulo', '3113245349', 'notien@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 826),
('1002857896', 1, 'Maria Fernanda', 'Balanta Daza', '0000-00-00', 'Nulo', '3157080848', 'amparodaza17@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 256),
('1002956972', 1, 'Maria Del Mar', 'Moreno Valdes', '0000-00-00', 'Nulo', '3217695016', 'mariadelmarmoreno0120@gmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION ADMON', '', 800),
('1002969125', 2, 'Liseth Yurany', 'Anacona Mu?oz', '0000-00-00', 'Nulo', '3135384858', 'lisemunos345@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 500),
('1003084809', 2, 'Yamith Alexander', 'Cabezas Joaqui', '0000-00-00', 'Nulo', '3175408205', 'YAMITHCABEZAS2019@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 502),
('1003374933', 1, 'Angela', 'Garcia Luz', '0000-00-00', 'Nulo', '3222317449', 'LUZ348811@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 710),
('1004545715', 1, 'Veronica Emerita', 'Tobar Cueltan', '0000-00-00', 'Nulo', '3175209016', 'VEROTOBARCUELTAN@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 767),
('1004547988', 1, 'Yuliana', 'Matabajoy Botina', '0000-00-00', 'Nulo', '3128560603', 'YULIANAMATABAJOY48@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 514),
('1004574834', 1, 'Monica', 'Hinestroza Caicedo', '0000-00-00', 'Nulo', '3186523364', 'CC@CC.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 795),
('1004641588', 1, 'Elvin Geovanny', 'Gonzalez Barreiro', '0000-00-00', 'Nulo', '3117706578', 'NNNN@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 127),
('1004711412', 1, 'Joan Sebastian', 'Ortega Gomez', '0000-00-00', 'Nulo', '3126330570', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1095),
('1004711698', 2, 'Nasbilli', 'Hurtado Sanchez', '0000-00-00', 'Nulo', '3223634956', 'SAS@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 512),
('1004748938', 1, 'Angela', 'Castillo Rivera', '0000-00-00', 'Nulo', '3116129848', 'ANGELACASTILLORIVERA21@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 504),
('1005065068', 1, 'Neris Nereida', 'Chapeta Camargo', '0000-00-00', 'Nulo', '3184316340', 'nerischapeta@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 695),
('100518662', 1, 'Cristian Elias ', 'Merchan Ricon', '0000-00-00', 'Nulo', '3113810611', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1293),
('1005480208', 1, 'Daniela Gisell', 'Ordo?ez Carmona', '0000-00-00', 'Nulo', '3135420213', 'danielagisellcarmona2017@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 167),
('1005705387', 1, 'Ginna Alexandra', 'Gutierrez Nu?ez', '0000-00-00', 'Nulo', '3004249355', 'ginitagutierrez13@hotmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 134),
('1005706300', 2, 'Ana Maria ', 'Villalobo Rosero', '0000-00-00', 'Nulo', '3216727913', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1413),
('1005783575', 1, 'Isaac', 'Cano Orobio', '0000-00-00', 'Nulo', '3176377599', 'JOSEALEJOO20@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 480),
('1005784516', 1, 'Cristhian Alexis', 'Guerra Restrepo', '0000-00-00', 'Nulo', '3017788417', 'GUERRAC949@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 295),
('1005784576', 1, 'Walter Alexander', 'Agrono Lucumi', '0000-00-00', 'Nulo', '3116752946', 'AGRONOLUCUMI123@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 407),
('1005784595', 1, 'Ana Maria', 'Giraldo Gonzalez', '0000-00-00', 'Nulo', '3205764663', 'ANA1720GONZAGIR@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 286),
('1005784970', 1, 'Juan Esteban', 'Bravo Salcedo', '0000-00-00', 'Nulo', '3137675210', 'ebravo.2712@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 372),
('1005828731', 1, 'Diana Lizeth', 'Quintero Porras', '0000-00-00', 'Nulo', '3024290689', 'dianalisethquinteroporras@outlook.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 180),
('1005829221', 1, 'Geraldine Gabriela', 'Guerrero Salazar', '0000-00-00', 'Nulo', '3209316903', 'gabijonas-11@hotmail.com', 'inactivo', 'Nulo', 0, 'PDT MODULOS', '', 132),
('1005830140', 1, 'Diana Carolina', 'Viafara Ospina', '0000-00-00', 'Nulo', '3128272942', '12VIAFARA.DIANA@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 466),
('1005830966', 2, 'Darlin Julieth', 'Osorio Arenas', '0000-00-00', 'Nulo', '3137843717', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1007),
('1005860586', 1, 'Maria Camila', 'Valencia Vanegas', '0000-00-00', 'Nulo', '3168729609', 'c.ami0920@hotmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 465),
('1005861952', 1, 'Cristian David', 'Viera Prado', '0000-00-00', 'Nulo', '3117968012', 'cristiandavidvp@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 662),
('1005862072', 1, 'Luisa Milena', 'Espinosa Yanten', '0000-00-00', 'Nulo', '300888854', 'MILUESPINOSA17@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 704),
('1005864388', 1, 'Valeria', 'Villegas Hoyos', '0000-00-00', 'Nulo', '3185961684', 'VALERIAVILLEGAS1997@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 364),
('1005865119', 2, 'Marlon Dayan', 'Enrriquez Reyes', '0000-00-00', 'Nulo', '3229501922', 'Enrriquezreyes2001@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 414),
('1005866614', 1, 'Catalina', 'Valencia Botero', '0000-00-00', 'Nulo', '3188653963', 'CAVABO11@outlook.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 361),
('1005866988', 1, 'Diego Fernando', 'Jimenez Chito', '0000-00-00', 'Nulo', '3185711288', 'DIEGOO--@OUTLOOK.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 622),
('1005867508', 2, 'Ingrid Tatiana', 'Ordo?ez Fernandez', '0000-00-00', 'Nulo', '3217298003', 'TATIANAORFE@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 781),
('1005868343', 1, 'Lislye Valeria', 'Parra Salazar', '0000-00-00', 'Nulo', '3205316522', 'lislievaleria10@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 174),
('1005869098', 1, 'Maria Fernanda', 'Rodriguez Gonzalez', '0000-00-00', 'Nulo', '3155142940', 'rodriguezgonzalesm51@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 849),
('1005869656', 1, 'Brayan Andres', 'Valencia Calambas', '0000-00-00', 'Nulo', '3053814004', 'NAYAN1158@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 661),
('1005869947', 1, 'Shirley Dayana', 'Tenorio Velasco', '0000-00-00', 'Nulo', '3174438994', 'SHIRLEYTENORIO8989@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 396),
('1005870298', 1, 'Natalia', 'Vidal Lizeth', '0000-00-00', 'Nulo', '3178257484', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1061),
('1005871491', 1, 'John Freddi', 'Rivas Benitez', '0000-00-00', 'Nulo', '3168310441', 'CAROLINA.CEBALLOS@TURNER.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 343),
('1005871903', 1, 'Dariana', 'Bolivar Pati?a', '0000-00-00', 'Nulo', '3145778288', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 953),
('1005872676', 1, 'Leidy Johanna', 'Casta?eda Caballero', '0000-00-00', 'Nulo', '3185843521', 'leidycast15@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 885),
('1005873084', 2, 'Melissa Fernanda', 'Marin Arboleda', '0000-00-00', 'Nulo', '3117114004', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1014),
('1005873660', 1, 'Evelin Yurany', 'Angulo Palacios', '0000-00-00', 'Nulo', '3186048240', 'eveliinyuranii@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 79),
('1005873914', 1, 'Lina Valentina', 'Romero Herrera', '0000-00-00', 'Nulo', '3052421375', 'LIVAROHE@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 31),
('1005875616', 1, 'Edwin David', 'Valencia Velasquez', '0000-00-00', 'Nulo', '3174873129', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1757),
('1005891012', 2, 'Angie Valentina', 'Monta?o Solis', '0000-00-00', 'Nulo', '3023942322', 'angievalentina071925@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 322),
('1005891740', 1, 'Jennifer', 'Cardona', '0000-00-00', 'Nulo', '3163289087', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1288),
('1005892997', 1, 'Maria De Los Angeles', 'Garcia Aguirre', '0000-00-00', 'Nulo', '3052329512', 'mariagarciaguirre1011@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 7),
('1005893443', 2, 'Maria Paula', 'Bravo Londo?o', '0000-00-00', 'Nulo', '3157623438', 'BRAVOLONDONOMARIAPAULA8@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 501),
('1005894001', 1, 'Mara Alexandra', 'Murillo Vargas', '0000-00-00', 'Nulo', '3217648081', 'MARAVARGASLOL@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 163),
('1005895903', 1, 'Richard Andres', 'Tamayo Perez', '0000-00-00', 'Nulo', '3145496558', 'ASS@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 244),
('1005896079', 1, 'Juan Pablo', 'Usma Maca', '0000-00-00', 'Nulo', '3153319843', 'JUANPABLO@CCED.EDU.CO', 'inactivo', 'Nulo', 0, 'Nulo', '', 563),
('1005897075', 2, 'Santiago', 'Gil Ramirez', '0000-00-00', 'Nulo', '3152309857', 'SANTIAGOGIL0814@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 417),
('1005898123', 2, 'Zara Alexandra', 'Villan Cardenas', '0000-00-00', 'Nulo', '3103991931', 'vzaraalexandra.oo3@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 522),
('1005898370', 1, 'Mayra Alejandra', 'Rivadeneira Lozano', '0000-00-00', 'Nulo', '3146230399', 'MAYRALEJANDRA1102@OUTLOOK.ES', 'egresado', 'Nulo', 0, 'Nulo', '', 392),
('1005934339', 1, 'Juan Pablo', 'Tapias Lopez', '0000-00-00', 'Nulo', '3168201356', 'tapiaslopezjuanpablo@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 854),
('1005935222', 1, 'Valentina', 'Arce Medina', '0000-00-00', 'Nulo', '3146438084', 'valentina_arce@yahoo.com', 'egresado', 'Nulo', 0, 'Nulo', '', 80),
('1005943627', 1, 'Katerin', 'Martinez Lenis', '0000-00-00', 'Nulo', '3002840585', 'KATHE0942@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 149),
('1005944676', 1, 'July Stephany', 'Salazar Lopez', '0000-00-00', 'Nulo', '3207516705', 'KITIGU-28@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 560),
('1005945078', 1, 'Kevin Stiven', 'Jojoa Zu?iga', '0000-00-00', 'Nulo', '3145913877', 'kjojoaz@gmail.com', 'egresado', 'Nulo', 0, 'diploma pdt', '', 306),
('1005945821', 1, 'Jhon Breyner', 'Orobio Mejia', '0000-00-00', 'Nulo', '3165005989', 'breynerjhon164@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 872),
('1005964744', 1, 'Elsio Andres', 'Quinto Dinas', '0000-00-00', 'Nulo', '3507742261', 'elsioandresq@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 404),
('1005964983', 1, 'Juan Manuel', 'Cuero Romero', '0000-00-00', 'Nulo', '3225377458', 'juanmacuero@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 226),
('1005965007', 1, 'Johan Sebastian', 'Molina Arbolea', '0000-00-00', 'Nulo', '3023724832', 'lunayniko426@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 903),
('1005965359', 1, 'Jessika', 'Lenis Mulato', '0000-00-00', 'Nulo', '3174263992', 'JESSIKAMULATO011825@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 143),
('1005967642', 1, 'Yulieth Valentina', 'Villamarin Hidrobo', '0000-00-00', 'Nulo', '3128268879', 'yuliethvillamarinu@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 248),
('1005967702', 1, 'Kevin Andres', 'Mejia Bahos', '0000-00-00', 'Nulo', '3215804757', 'andreskevinmejia19@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 868),
('1005968807', 2, 'Isabella', 'Morales Ramos', '0000-00-00', 'Nulo', '3168600032', 'isabellaramos912@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 532),
('1005975036', 1, 'Gina Marcela', 'Perea Sabogal', '0000-00-00', 'Nulo', '3044668750', 'GINNAPEREA19@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 387),
('1005976859', 1, 'Jeraldyn', 'Pabon Gomez', '0000-00-00', 'Nulo', '3158875087', 'GERO3115GOMEZ@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 458),
('1005977304', 2, 'Kevin Andres', 'Hernandez Montoya', '0000-00-00', 'Nulo', '3173857240', 'kanndres@outlook.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 529),
('1005978185', 2, 'Ana Maria', 'Mejia Rodriguez', '0000-00-00', 'Nulo', '3176223290', 'ANAMMRODRIGUEZ3110@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 799),
('1006008089', 1, 'Fabian Andres', 'Pretel Diaz', '0000-00-00', 'Nulo', '3207084465', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1106),
('1006009156', 1, 'Darwin', 'Alzate Ramirez', '0000-00-00', 'Nulo', 'Nulo', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 874),
('1006011248', 1, 'Luisa Maria', 'Buitrago Pino', '0000-00-00', 'Nulo', '3194742915', 'pinoluisa999@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 835),
('1006011663', 1, 'Angie Cristina', 'Marines Ortiz', '0000-00-00', 'Nulo', '3043877972', 'angiecristina051220@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 312),
('1006015362', 1, 'Juan Camilo', 'Figueroa Perilla', '0000-00-00', 'Nulo', '3052984173', 'juan.camilo.145@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 279),
('1006016921', 1, 'Bastidos', 'Jhonathan Hortua', '0000-00-00', 'Nulo', '311354359', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1072),
('1006035083', 1, 'Maira Alejandra', 'Aguilar Lozano', '0000-00-00', 'Nulo', '3165096986', 'AGUILARLOZANOMAYRA2002@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 16),
('1006035364', 1, 'Kaalebt JanPierre', 'Monta?o Mendoza', '0000-00-00', 'Nulo', '3216705508', 'kaalebt@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 844),
('1006036110', 1, 'Lina Marcela', 'Martinez Baron', '0000-00-00', 'Nulo', '3152266519', 'martinezbaron27@gmail.com', 'activo', 'Nulo', 0, 'Nulo', '', 909),
('1006037249', 1, 'Maria Camila', 'Rincon Naranjo', '0000-00-00', 'Nulo', '3028563357', 'mcrincon1109@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 848),
('1006037977', 1, 'Angie Camila', 'Artunduaga Chacon', '0000-00-00', 'Nulo', '3012733563', 'angiiecamila1885@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 84),
('1006048371', 1, 'Miguel Angel', 'Castillo Devia', '0000-00-00', 'Nulo', '3152429474', 'MIANCADE2000@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 47),
('1006048475', 1, 'Valentina', 'Sanchez Sanchez', '0000-00-00', 'Nulo', '3177753810', 'LL@LL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 196),
('1006048630', 1, 'Angie Daniela', 'Alcalde Vanegas', '0000-00-00', 'Nulo', '3206747551', 'angiehail2204@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 222),
('1006048789', 1, 'Andres Felipe ', 'Saenz Prado', '0000-00-00', 'Nulo', '3107106507', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1463),
('1006049034', 1, 'Valentina', 'Benitez Naranjo', '0000-00-00', 'Nulo', '3215031204', 'zairabenitez6@gmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 89),
('1006049347', 1, 'Brayan Estiben', 'Saenz Zapata', '0000-00-00', 'Nulo', '3158682283', 'BRASA2902@GAMIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 760),
('1006049946', 1, 'Justin Fabian', 'Mu?oz Orozco', '0000-00-00', 'Nulo', '3177866542', 'justinmunozorozco1108@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 871),
('1006050008', 2, 'Linda Katerine', 'Tangarife Agredo', '0000-00-00', 'Nulo', '3157003905', 'AA@AA.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 808),
('1006050009', 1, 'Nicol Tatiana', 'Tangarife Agredo', '0000-00-00', 'Nulo', '3165849155', 'tatiana.tangarife@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 809),
('1006051116', 1, 'Juli Tatiana', 'Giraldo Cardenas', '0000-00-00', 'Nulo', '3184792588', 'T@T.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 713),
('1006051297', 1, 'Rosa Nathalia', 'Mina Delgado', '0000-00-00', 'Nulo', '3178030270', 'MINADELGADONATHALIA17@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 320),
('1006051636', 2, 'David Alejandro', 'Ramirez Serna', '0000-00-00', 'Nulo', '3128010904', 'vivianasernac@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 516),
('1006053167', 1, 'Katherine', 'Marin Benjumea', '0000-00-00', 'Nulo', '3144146203', 'katherinemarin323@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 383),
('1006055679', 1, 'Miguel Angel', 'Gruezo Escobar', '0000-00-00', 'Nulo', '3135196299', 'Lilguelmi@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 419),
('1006071638', 1, 'Maria Isabel', 'Rubio Leal', '0000-00-00', 'Nulo', '3177198102', 'MANUJITARUBIO8@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 194),
('1006072064', 1, 'Melanny Hellen', 'Patichoy Cely', '0000-00-00', 'Nulo', '3153122551', 'MELANNY1825@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 28),
('1006072923', 2, 'Mileidy Yanith', 'Chica Mahecha', '0000-00-00', 'Nulo', '3016680601', 'MILICHICA06@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 505),
('1006096921', 1, 'Jhonathan', 'Hortua Bastidas', '0000-00-00', 'Nulo', '3113543579', 'JHORTUABASTIDAS@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 445),
('1006097291', 1, 'Angie Julieth', 'Ceron Gaviria', '0000-00-00', 'Nulo', '3116852053', 'ceron2141@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 593),
('1006101270', 2, 'Anderson', 'Piedrahita Leon', '0000-00-00', 'Nulo', '3107484962', 'NANETON2012@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 423),
('1006101376', 1, 'Danna Valentina', 'Hurtado Cardona', '0000-00-00', 'Nulo', '3223561861', 'DANNAHURTADO@CCED.EDU.CO', 'inactivo', 'Nulo', 0, 'Nulo', '', 472),
('1006102125', 1, 'Juan Esteban', 'Jaramillo Moncada', '0000-00-00', 'Nulo', '3167135978', 'hostin2a23@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 865),
('1006102351', 1, 'Andres Felipe', 'Gutierrez Garcia', '0000-00-00', 'Nulo', '3193857189', 'gutieuo@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 863),
('1006103078', 1, 'Santiago', 'Silva Erazo', '0000-00-00', 'Nulo', '3226134427', 'silvaerazosantiago@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 900),
('1006108216', 1, 'Daniel', 'Rojas Mejia', '0000-00-00', 'Nulo', '3106724505', 'KAFERMOGA18@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 394),
('1006110053', 1, 'Carlos Alberto', 'Serna Gutierrez', '0000-00-00', 'Nulo', 'Nulo', 'carlosjustice14@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 880),
('1006110344', 2, 'Sebastian', 'Mu?oz Ospina', '0000-00-00', 'Nulo', '3137471837', 'SEBAS.6@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 422),
('1006165852', 1, 'Maicol Stiven', 'Bermudez Chacon', '0000-00-00', 'Nulo', '3184319613', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1114),
('1006166571', 1, 'Samantha', 'Charry Montoya', '0000-00-00', 'Nulo', '3217000595', 'sammycharry0307@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 815),
('1006167683', 2, 'Wilmer Adrian', 'Ruiz Pantoja', '0000-00-00', 'Nulo', '3137025176', 'NOTIENECOREA@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 425),
('1006169792', 1, 'Juan Pablo', 'Ortiz Castillo', '0000-00-00', 'Nulo', '3146793995', 'johannadarly34@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 873),
('10061700154', 1, 'Stefanny', 'Silva Trujillo', '0000-00-00', 'Nulo', '3177369330', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1073),
('1006170048', 1, 'Juan Camilo', 'Mopan Collo', '0000-00-00', 'Nulo', '4366122', 'MM@MM.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 456),
('1006170154', 1, 'Stefanny', 'Silva Trujillo', '0000-00-00', 'Nulo', '3177369330', 'stephanielml428@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 201),
('1006179099', 1, 'Leidy Laura', 'Mendez Ortiz', '0000-00-00', 'Nulo', '3152662914', 'LAURAMENDEZ0798@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 489),
('1006180360', 1, 'Jeison', 'Soto Gil', '0000-00-00', 'Nulo', '3124959825', 'JEI199620@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 43),
('1006181011', 1, 'Jessica Mileny', 'Cabezas Valencia', '0000-00-00', 'Nulo', '3116154114', 'mileinycabezas2015@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 836),
('1006181987', 1, 'Katherin Yuleisi', 'Victoria Valencia', '0000-00-00', 'Nulo', '3168265727', 'katerinyuleisivictoriavalencia@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 856),
('1006182930', 1, 'Ana Milena', 'Chipe Diaz', '0000-00-00', 'Nulo', '1006182930', 'anamilenachipe2002@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 886),
('1006184949', 1, 'Yonathan Alexander', 'Mesias Riascos', '0000-00-00', 'Nulo', '3163172263', 'jonathanmesias202@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 889),
('1006185131', 1, 'Angie Lizeth', 'Perea Hoyos', '0000-00-00', 'Nulo', '3175667254-3052', 'notien@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 827),
('1006186992', 1, 'Julian Andres', 'Herrera Ceballos', '0000-00-00', 'Nulo', '3043907033', 'JULIANHERRERA239@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 511),
('1006189144', 1, 'Leydi Tatiana', 'Olave Valencia', '0000-00-00', 'Nulo', '3152905345', 'leidyzitaa@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 331),
('1006189891', 1, 'Brayan Marino', 'Diuza Arroyo', '0000-00-00', 'Nulo', '3116960983', 'bmda6969@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 507),
('1006190823', 1, 'Jairo Hernan', 'Zapata Lopez', '0000-00-00', 'Nulo', '3122350333', 'notes@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 427),
('1006193143', 1, 'Daimer Andres', 'Gomez Viveros', '0000-00-00', 'Nulo', '3104875341', 'daimerandrespapi@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 292),
('1006193493', 1, 'Laura Tamar', 'Gongora Salas', '0000-00-00', 'Nulo', '3194675560', 'LAUUGON9@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 125),
('1006198442', 1, 'Daniel Mauricio', 'Daniel Mauricio', '0000-00-00', 'Nulo', '3188187897', 'DANIEL-MAURICIO@HOTMAIL.ES', 'egresado', 'Nulo', 0, 'Nulo', '', 2),
('1006202071', 1, 'Luis Miguel', 'Hidrobo Arroyo', '0000-00-00', 'Nulo', '3114004900', 'LUIS-MIGUELITO.2000@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 471),
('1006204430', 1, 'Anderson', 'Maturama Torres', '0000-00-00', 'Nulo', '3228997371', 'MATURAMAANDERSON98@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 672),
('1006206001', 1, 'Jose Luis', 'Zuluaga Serna', '0000-00-00', 'Nulo', '3226333701', 'ZULUAGA.SERNA2000@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 249),
('1006206139', 2, 'Kevin Mauricio', 'Alegria Villafa?e', '0000-00-00', 'Nulo', '3007126030', 'ALEGRIAMAURICIO7@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 429),
('1006207889', 1, 'Sebastian', 'Balanta Guapacha', '0000-00-00', 'Nulo', '3215284920', 'FEFS@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 370),
('1006332993', 1, 'Daniel Stiven', 'Suarez Madro?ero', '0000-00-00', 'Nulo', '3107335087', 'DAANIEL.S2000@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 462),
('1006363296', 2, 'Mabel Liseth', 'Monta?o Campaz', '0000-00-00', 'Nulo', '3135840273', 'LISEETH06@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 455),
('1007015601', 1, 'Yulivan Steeven', 'Aviles Ramirez', '0000-00-00', 'Nulo', '3226354582', 'NOUSSA@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 410),
('1007022828', 1, 'Melanye', 'Rivillas Motato', '0000-00-00', 'Nulo', '3164166884', 'MALANIERIVILLAS3@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 517),
('1007037088', 1, 'Maria Elena', 'Camayo Urbano', '0000-00-00', 'Nulo', '3225979399', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 927),
('1007143143', 1, 'Katherine', 'Fernandez Angela', '0000-00-00', 'Nulo', '3023607045', 'ANGIFER87@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 485),
('1007145822', 1, 'Ivan', 'Zu?iga Carlos', '0000-00-00', 'Nulo', '3126970879', 'pogbay757@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 428),
('1007201921', 1, 'Yonatan Elian', 'Castro Cometa', '0000-00-00', 'Nulo', '3145013886', 'yonatan13920elian@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 269),
('1007362596', 1, 'Virginia', 'Ramos Riascos', '0000-00-00', 'Nulo', '3233861467', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1215),
('1007369064', 1, 'Kevin Joshua', 'Porras Lopez', '0000-00-00', 'Nulo', '3166381889', 'keeviin886@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 641),
('1007444016', 2, 'Gabriela Faisuri', 'Pacue Mendez', '0000-00-00', 'Nulo', '3234488786', 'NOOOTIENE1@HOTRMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 743),
('1007472264', 1, 'Kelly Patricia', 'Bola?os Tuquerrez', '0000-00-00', 'Nulo', '3227002207', 'patriciabolanos2018@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 477),
('1007478432', 1, 'Luis Felipe ', 'Ortiz Sanchez', '0000-00-00', 'Nulo', '3128648686', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1396),
('1007489390', 2, 'David Felipe', 'Portillo Cordoba', '0000-00-00', 'Nulo', '3044516127', 'PORTILLO2524@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 474),
('1007490470', 1, 'Angel Daniel', 'Calderon Mesias', '0000-00-00', 'Nulo', '3155252706', 'calderonangelctc@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 858),
('1007553967', 1, 'Diana Yissela', 'Gonzalez Ramirez', '0000-00-00', 'Nulo', '3176922533', 'DIANIITAGON2023@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 129),
('1007560606', 1, 'Angie Lizeth', 'Tintinago Villamarin', '0000-00-00', 'Nulo', '3126494291', 'lindalizeth-747@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 208),
('1007561940', 1, 'Adriana Lucia', 'Rodriguez Cuero', '0000-00-00', 'Nulo', '3178624440', 'NEEE@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 651),
('1007579855', 1, 'Cristian David', 'Rojas Baltan', '0000-00-00', 'Nulo', '3113836307', 'LEIDYVANESACEBALLOS@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 496),
('1007590939', 1, 'Joan Harvey', 'Castro Ortiz', '0000-00-00', 'Nulo', '3217866834', 'jhoanc390@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 375),
('1007650411', 1, 'Andres Camilo', 'Triana Palacio', '0000-00-00', 'Nulo', '3227545123', 'NOTENGO@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 397),
('1007671780', 1, 'Paula Andrea', 'Sabogal Echavarria', '0000-00-00', 'Nulo', '3053166865', 'PSABOGAL11@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 351),
('1007689703', 2, 'Angel Steven', 'Medina Lopez', '0000-00-00', 'Nulo', '3206150500', 'ERGI@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 452),
('1007694463', 1, 'Leidy Tatiana', 'Cuadros Morales', '0000-00-00', 'Nulo', '3168566915', 'ltatiana.cm22@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 48),
('1007734789', 1, 'Ivette Cecilia', 'Angulo Bravo', '0000-00-00', 'Nulo', '3117100258', 'sin dato', 'egresado', 'Nulo', 0, 'Nulo', '', 828),
('1007734898', 1, 'Julieth', 'Sanchez Zambrano', '0000-00-00', 'Nulo', '3012234516', 'JULIETHSANCHEZ11@OUTLOOK.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 198),
('1007815213', 1, 'Jean Carlo', 'Cortes Gonzalez', '0000-00-00', 'Nulo', '3152979142', 'pa.olita15316@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 838),
('1007834769', 2, 'Diana Marcela', 'Cardona Rivera', '0000-00-00', 'Nulo', '3167297524', 'dianacardona210103@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 503),
('1007839053', 1, 'Melissa', 'Arboleda Qui?onez', '0000-00-00', 'Nulo', '3156700418', 'MELISAARBOLEA2113@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 467),
('1007849760', 1, 'Brayan Stiven', 'Alomia Arboleda', '0000-00-00', 'Nulo', '3106179253', 'DAIMI8889@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 409),
('1007960566', 2, 'Juan Sebastian', 'Florez Cordoba', '0000-00-00', 'Nulo', '3147471195', 'FLOREZS18082002@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 415),
('1010000789', 1, 'Camilo', 'Delgado Murillo', '0000-00-00', 'Nulo', '3168461543', 'kamilogeazy2001@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 413),
('1010049463', 1, 'Soraid', 'Valencia Manyoma', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1195),
('1010050980', 1, 'Michael Dayana', 'Rodriguez Calero', '0000-00-00', 'Nulo', 'Nulo', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 925),
('1010053868', 1, 'Ximena ', 'Cardozo Nathaly', '0000-00-00', 'Nulo', '3152989358', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1573),
('1010064079', 1, 'Ingrid', 'Garzon carvajal', '0000-00-00', 'Nulo', '3165516539', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1451),
('1010066047', 1, 'Maria Isabel', 'Garzon Caicedo', '0000-00-00', 'Nulo', '3114342072', 'ELISA-1106@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 379),
('1010073920', 1, 'Michelee Dayana', 'Montoya Marin', '0000-00-00', 'Nulo', '3207496085', 'MICHEMARI1303@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 234),
('1010100668', 1, 'Ruth Daniela', 'Manyoma Alomia', '0000-00-00', 'Nulo', '3232273768', 'dnlmanyoma@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 147),
('1010103754', 1, 'Yessica Liceth', 'Duque Gil', '0000-00-00', 'Nulo', '3167545781', 'Duquegilyessica@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 399),
('1010104222', 1, 'Nicolas', 'Meneses Paz', '0000-00-00', 'Nulo', '3234720260', 'NIKIPAZ.16@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 151),
('1010116083', 1, 'Sara', 'Carvajal Ruiz', '0000-00-00', 'Nulo', '3156459547', 'saritacarvajal2000@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 265),
('1010159674', 1, 'Angie Tatiana', 'Casanova Villareal', '0000-00-00', 'Nulo', '3185858386', 'angiecasanovavillare@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 266),
('1018484189', 1, 'Maria Camila', 'Valencia Rojas', '0000-00-00', 'Nulo', '3052612979', 'CAMILAVALENCIA.R2322@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 464),
('1019125972', 1, 'Hermila', 'Zambrano Calambas', '0000-00-00', 'Nulo', '3229045811', 'PRINCEMILENITA96@GMAI.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 775),
('1026250683', 1, 'Yina Luz ', 'Cardona Betin', '0000-00-00', 'Nulo', '3108921030', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1633),
('1026583960', 1, 'Geraldin', 'Samboni Bustamante', '0000-00-00', 'Nulo', '3185303129', 'GERALDINE.2019@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 655),
('1028187447', 1, ' Henry Mauricio', 'Preciado Mendoza', '0000-00-00', 'Nulo', '3162825620', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1315),
('1032251994', 1, 'Luis ', 'Burgos Padilla', '0000-00-00', 'Nulo', '3043356567', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1277),
('1034290693', 1, 'Henry Alonzo ', 'Diaz Herrera', '0000-00-00', 'Nulo', '3168400076', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1367),
('1046699709', 1, 'Maria Jose', 'Lemus Navas', '0000-00-00', 'Nulo', '3007433326', 'MARIJOLAGUNA20@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 142),
('1047381452', 1, 'Nathalie', 'Calceta Mendoza', '0000-00-00', 'Nulo', '3113827689', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1578),
('1047493857', 1, 'Yolima', 'Buitrago Avila', '0000-00-00', 'Nulo', '3135113791', 'yolima.buitrago@yahoo.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 93),
('1048846312', 1, 'Christian Danilo', 'Montoya Martin', '0000-00-00', 'Nulo', '3017508517', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1588),
('10493406', 1, 'Hogany', 'Ascue Campo', '0000-00-00', 'Nulo', '3223607937', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 959),
('10498668', 1, 'Jairo Armando', 'Madrid Guerra', '0000-00-00', 'Nulo', '3104503669', 'nandomadrid39@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 60),
('1051661761', 1, 'Dairo', 'Bustos Angarita', '0000-00-00', 'Nulo', '3158090410', 'DAIRO2588@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 543),
('1054989879', 1, 'Vanessa', 'Osorio Ramirez', '0000-00-00', 'Nulo', '3104325217', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1528),
('1056302615', 1, 'Cesar Alban', 'Rios Orozco', '0000-00-00', 'Nulo', '3235173292', 'cesaralban849@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 341),
('1058965818', 1, 'Margoth', 'Imbachi Samboni', '0000-00-00', 'Nulo', '3186283345', 'NOTIEEW123@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 719),
('1059360059', 1, 'La Cruz Lorena', 'Chito De', '0000-00-00', 'Nulo', '3182419210', 'LORENACHITODELACRUZ24@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 271),
('10594336', 1, 'Julio Cesar', 'Araujo Timana', '0000-00-00', 'Nulo', '3137733665', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1637),
('1059447106', 1, 'Maximina ', 'Castro Monta?o', '0000-00-00', 'Nulo', '3137244815', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1641),
('1059901539', 1, 'Yonier David', 'Ibarra Guevara', '0000-00-00', 'Nulo', '3137346026', 'X@X.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 718),
('1059903175', 1, 'Marinella', 'Ledezma Araque', '0000-00-00', 'Nulo', '3157936862', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1000),
('1059908216', 1, 'Yexenia', 'Peralta Llanos', '0000-00-00', 'Nulo', '3116214521', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1398),
('1059913907', 1, 'Cristian Gildardo', 'Ibarra Mosquera', '0000-00-00', 'Nulo', '3184996131', 'jhosuetmosquera@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 864),
('1059988889', 1, 'Monica Dayana', 'Oyola Correa', '0000-00-00', 'Nulo', '3166739632', 'MONICAOYOLA@CCED.EDU.CO', 'egresado', 'Nulo', 0, 'Nulo', '', 11),
('105999539', 1, 'Yonier David ', 'Ibarra Guevara', '0000-00-00', 'Nulo', '3137346026', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1272),
('1060186061', 1, 'Nerly Johana', 'Belalcazar Arce', '0000-00-00', 'Nulo', '3114875609', 'joharce1998@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 687),
('1060356184', 1, 'Maria Luzeima', 'Mina Carabali', '0000-00-00', 'Nulo', '3102332448', 'zuleimamina@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 630),
('1060359417', 1, 'Katterine ', 'Carabali Nadia', '0000-00-00', 'Nulo', '3117249198', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1698),
('1060362841', 1, 'Darly', 'Mina', '0000-00-00', 'Nulo', '3122466948', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1181),
('1060876146', 1, 'Dahiana Isamar', 'Llanten Alegria', '0000-00-00', 'Nulo', '3106675710', 'DLLANTENALEGRIA@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 232),
('1061021094', 1, 'Yeniffer', 'Castro Benitez', '0000-00-00', 'Nulo', '3128402486', 'jeniffer2801.97@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 693),
('1061021356', 1, 'Edwin Fernando', 'Ordo?ez Toro', '0000-00-00', 'Nulo', '3216055744', 'II@II.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 635),
('1061112779', 2, 'Adelis', 'Garcia Aragon', '0000-00-00', 'Nulo', '3163760767', 'ARELISGARCIA765@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 509),
('1061701913', 1, 'Diana Carolina', 'Rosero Gonzalez', '0000-00-00', 'Nulo', '3172376812', 'dianaroserog@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 347),
('1061741538', 1, 'Claudia Maria', 'Valencia Cardona', '0000-00-00', 'Nulo', '3205553133', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1718),
('1061757971', 1, 'Omar Fabian', 'Anacona Ramos', '0000-00-00', 'Nulo', '3212444320', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1781),
('1061989334', 1, 'Yesica', 'Fernandez Mu?oz', '0000-00-00', 'Nulo', '3148887741', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1043),
('1062292627', 1, 'Evelin', 'Mu?oz Andrea', '0000-00-00', 'Nulo', '3225329020', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1524),
('1062292803', 1, 'Zulery', 'Diaz Mina', '0000-00-00', 'Nulo', '3184363810', 'zule03@live.com', 'egresado', 'Nulo', 0, 'Nulo', '', 114),
('1062313641', 1, 'De Los Angeles', 'Hurtado Maria', '0000-00-00', 'Nulo', '3153458770', 'sherlinhurtado@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 797),
('1062328692', 1, 'Fanny Nataly', 'Perez Garcia', '0000-00-00', 'Nulo', '3135341388', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1180),
('1062330911', 1, 'Jessica Katerine', 'Casas Cadavid', '0000-00-00', 'Nulo', '3225098897', 'katerin3723@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 837),
('1064430145', 1, 'Marco Cesar', 'Tenebuel Yalanda', '0000-00-00', 'Nulo', '3155791979', 'MARKOSEZAR@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 766),
('1067470094', 1, 'Dayana Paola', 'Camayo Huila', '0000-00-00', 'Nulo', '3166746090', 'DAYANACAMAYO404@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 262),
('1070624315', 1, 'Vladimir', 'Tenorio Ramirez', '0000-00-00', 'Nulo', '3004907345', 'tenoriojunior1997@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 358),
('1075225191', 1, 'Andres', 'Tovar Jorge', '0000-00-00', 'Nulo', '3188666692', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1601),
('1075228096', 1, 'Diana Amparo', 'Chavez Bahamon', '0000-00-00', 'Nulo', '3128573396', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1647),
('1075244447', 1, 'Monica Marcela', 'Aya Guzman', '0000-00-00', 'Nulo', '3135663325', 'monimarcel2015@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 684),
('1075271790', 1, 'Miguel Angel', 'Pastrana Benavides', '0000-00-00', 'Nulo', '3206989438', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1192),
('1075305639', 1, 'Keren Tatiana', 'Casta?o Pin?eros', '0000-00-00', 'Nulo', '3225258251', 'karenyamirz@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 481),
('10755460', 1, 'Yinmi Javier', 'Molina Muelas', '0000-00-00', 'Nulo', '3154577827', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1770),
('1076985327', 1, 'Kelly del Pilar', 'Casta?eda Rivas', '0000-00-00', 'Nulo', '3127259996', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1046),
('1080830206', 1, 'Jorge Esteban', 'Ruas Ortiz', '0000-00-00', 'Nulo', '3024365341', 'jorterua895@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 757),
('1080900766', 1, 'Willinton', 'Ortiz Martinez', '0000-00-00', 'Nulo', '3127074426', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1529),
('1080901848', 1, 'Jenifer Sofia', 'Martinez Lopez', '0000-00-00', 'Nulo', '3057626544', 'jeniferlopez1216@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 725),
('1081274362', 1, 'Solains Valentina', 'Enriquez Ricaurte', '0000-00-00', 'Nulo', '3234378832', 'valentinaenriquez250@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 841),
('1082657334', 1, 'Lina Lizeth', 'Cordoba Pantoja', '0000-00-00', 'Nulo', '3216972871', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1059),
('1082690879', 1, 'Merly', 'Cuesta Rodriguez', '0000-00-00', 'Nulo', '3233641699', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1437),
('1085268732', 1, 'Andrea ', 'Puerres Nelcy', '0000-00-00', 'Nulo', '3164840032', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1503),
('1085333016', 1, 'Oanny Yuliza', 'Meneses Ortiz', '0000-00-00', 'Nulo', '3117924317', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 929),
('1085635214', 1, 'Del carmen ', 'Arevalo Delia', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1264),
('1085928158', 1, 'Jessika', 'Coral Arciniegas', '0000-00-00', 'Nulo', '3157148596', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 982),
('1086043337', 1, 'Patricia Margarita', 'Qui?ones Torres', '0000-00-00', 'Nulo', '3156826738', 'laflacalunar@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 752),
('1086195613', 1, 'Duber Esneider', 'Oliveros Angulo', '0000-00-00', 'Nulo', '3148127589', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1395),
('1087114031', 1, 'Alvaro', 'Rodriguez Cuero', '0000-00-00', 'Nulo', '3167778507', 'alvarorodriguezcuero1@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 878),
('1087806603', 1, 'Ruben Dario', 'Grueso Valencia', '0000-00-00', 'Nulo', '3112135905', 'a@a.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 130),
('1087958493', 1, 'Yeniffer ', 'Pati?o Ponce', '0000-00-00', 'Nulo', '3176990325', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1478),
('1088217858', 1, 'Yudy Yennizet', 'Imbacuan Arevalo', '0000-00-00', 'Nulo', '3014714494', 'yudyyenni@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 798),
('1088241100', 1, 'Yuliana Andrea', 'Mesa Morales', '0000-00-00', 'Nulo', '3167150712', 'YULIANAN@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 531),
('1088286977', 1, 'Diana Marcela', 'Hoyos Montoya', '0000-00-00', 'Nulo', '3192655392', 'BLACKBOXDIANA@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 302),
('1088300958', 1, 'Yeraldin', 'Henao Ospino', '0000-00-00', 'Nulo', '3173072426', 'geralhenaoospi9206@gailm.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 231),
('1088597356', 1, 'Edicson Andres', 'Colimba Taramuel', '0000-00-00', 'Nulo', '3177009856', 'andresfcb5@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 595),
('1088976065', 1, 'Jhon Estiven', 'Realpe Erazo', '0000-00-00', 'Nulo', '3235220424', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1142),
('1088976819', 1, 'Luis Gustavo', 'Cometa Molina', '0000-00-00', 'Nulo', '3216912220', 'gustavo.itincolacruz@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 108),
('1089000701', 1, 'Yendy Margoth', 'Klinger Cuero', '0000-00-00', 'Nulo', '3215512452', 'e.sli.yendy.kingler@cali.edu.co', 'inactivo', 'Nulo', 0, 'Nulo', '', 902),
('1089483443', 1, 'Ingrid Vaneza', 'Martinez Obregon', '0000-00-00', 'Nulo', '3204932014', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1717),
('1089484722', 1, 'Mabel Giselly', 'Montero Martinez', '0000-00-00', 'Nulo', '3184033508', 'UU@U.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 728),
('1089509349', 1, 'Laura Vanessa', 'Tenorio Qui?ones', '0000-00-00', 'Nulo', '3147552746', 'lauratenorio4030@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 855),
('1089794804', 1, 'Anyi Fernanda', 'Ruiz Fajardo', '0000-00-00', 'Nulo', '3148799229', 'anyiruz48@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 851),
('1089801866', 1, 'Mirza', 'Delgado Angulo', '0000-00-00', 'Nulo', '3225430396', 'mirzita1998@fgmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 598),
('1089801958', 1, 'Heissemberg', 'Castro Caicedo', '0000-00-00', 'Nulo', '3224786189', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1138),
('1090394993', 1, 'Shirley Johana', 'Velasquez Ruiz', '0000-00-00', 'Nulo', '3148136677', 'SHIRLEYVELAZQUEZ19844@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 71),
('1094881395', 1, 'Adriana', 'Rivera Giraldo', '0000-00-00', 'Nulo', '3167179040', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 956),
('1094892909', 1, 'Yuli Veronica', 'Murillo Motato', '0000-00-00', 'Nulo', '3166272707', 'VERONICAM_323@YAHOO.ES', 'egresado', 'Nulo', 0, 'Nulo', '', 235),
('1094942534', 1, 'Juan Diego', 'Maldonado Tamayo', '0000-00-00', 'Nulo', '3215970125', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1294),
('1094955112', 1, 'Maria Fernanda', 'Beltran Zapata', '0000-00-00', 'Nulo', '3145222375', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1113),
('1097390163', 1, 'Paola Diana', 'Cano Baena', '0000-00-00', 'Nulo', '3164675942', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1355),
('1102359723', 1, 'Cindy Carolina', 'Esteban Garcia', '0000-00-00', 'Nulo', '3184018654', 'carolina.29@icloud.com', 'egresado', 'Nulo', 0, 'Nulo', '', 793),
('1102826315', 1, 'Marlon David', 'Romero Barreto', '0000-00-00', 'Nulo', '3204017755', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 972),
('1105361930', 1, 'Laura Sofia', 'Rangel Londo?o', '0000-00-00', 'Nulo', '3158155285', 'lairerangel118@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 875),
('1105929827', 2, 'Luisa maria', 'Morales Morales', '0000-00-00', 'Nulo', '3105293324', 'luisamariamorales27@gmail.com', 'activo', 'Nulo', 0, 'Nulo', '', 891),
('1106512029', 1, 'David', 'Solarte Serna', '0000-00-00', 'Nulo', '3136617004', 'dsolarte821@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 908),
('1106515021', 1, 'Kevin Steven', 'Vasquez Gonzalez', '0000-00-00', 'Nulo', '3187521341', 'vaskevin06@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 906),
('1107034012', 1, 'Walter Duan', 'Medina Romero', '0000-00-00', 'Nulo', '3176629629', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1738),
('1107034053', 1, 'Daniela', 'Erazo Vasquez', '0000-00-00', 'Nulo', '3217518092', 'erazodaniela27@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 117),
('1107035220', 1, 'Blanca', 'Gomez Medina', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1278),
('1107036455', 1, 'Omar', 'Morales Castillo', '0000-00-00', 'Nulo', '3148060427', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1169),
('1107038686', 1, 'Maryzabell', 'Garcia Rengifo', '0000-00-00', 'Nulo', '3155215343', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1571),
('1107039903', 1, 'Sofia', 'Minota Alzate', '0000-00-00', 'Nulo', '3157794442', 'SOFIA.ALZATE.05@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 515),
('1107040706', 1, 'Jasmin', 'Banguero', '0000-00-00', 'Nulo', '3175456481', 'BLANCANIEVES_2411@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 86),
('1107042646', 1, 'Andres Yesid', 'Rodallega Viveros', '0000-00-00', 'Nulo', '3182239219', 'andresyesyd@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 877),
('1107045317', 1, 'Roger ', 'Rengifo Diaz', '0000-00-00', 'Nulo', '3153857201', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1504),
('1107045505', 1, 'Angelica Maria ', 'Hincapie Garcia', '0000-00-00', 'Nulo', '3172144475', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1378),
('1107047203', 1, 'Dancy Dayana', 'Hoyos Cocu?ame', '0000-00-00', 'Nulo', '3206249128', 'dayanahoyos87@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 616),
('1107048911', 1, 'Nataly', 'Campo Garces', '0000-00-00', 'Nulo', '3128435629', 'naty0787@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 96),
('1107055654', 1, 'Margarita Rosa', 'Colonia Corrales', '0000-00-00', 'Nulo', '3013161583', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 985),
('1107056825', 1, 'Sandra Vanessa', 'Bastias Orrego', '0000-00-00', 'Nulo', '3153564090', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1349),
('1107057810', 1, 'Katherin Liliana', 'Montoya Franco', '0000-00-00', 'Nulo', '3117506202', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1017),
('1107058042', 1, 'Jose Fernando', 'Renteria Esteban', '0000-00-00', 'Nulo', '3158016698', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1502),
('1107058146', 1, 'Sthephanie', 'Barbosa Carrasquilla', '0000-00-00', 'Nulo', '3225779137', 's.a.b23@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 789),
('1107061885', 1, 'Vanessa', 'Guerrero Trujillo', '0000-00-00', 'Nulo', '3148424450', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1708),
('1107063557', 1, 'Liana Patricia', 'Buitrago Mosquera', '0000-00-00', 'Nulo', '3168709212', 'liana142015@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 884),
('1107064192', 1, 'Mayerlin', 'Alvarez Cruz', '0000-00-00', 'Nulo', '3178535045', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1692),
('1107064351', 1, 'Alba', 'Criollo', '0000-00-00', 'Nulo', '3013215805', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 949),
('1107065286', 1, 'Jeferson Steven', 'Arbelaez Joaqui', '0000-00-00', 'Nulo', '3103844651', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1642),
('1107066175', 1, 'Monica Marcela', 'Lopez Alvear', '0000-00-00', 'Nulo', '3015925762', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1103),
('1107066382', 1, 'Gustavo Adolfo', 'Ruiz Carabali', '0000-00-00', 'Nulo', '3122924614', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1767),
('1107067684', 1, 'Valeria ', 'Aguilar Agudelo', '0000-00-00', 'Nulo', '3216252124', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1689),
('1107067744', 1, 'Stephania', 'Ortiz Cabal', '0000-00-00', 'Nulo', '3207926463', 'STEPHA-0911@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 332),
('1107068493', 1, 'Andrea Estefanya', 'Barrera Valencia', '0000-00-00', 'Nulo', '3135352672', 'andreadidi42@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 579),
('1107068665', 1, 'Nestor Samuel', 'Cuartas Mina', '0000-00-00', 'Nulo', '3148361187', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1365),
('1107068828', 1, 'Marielly Andrea', 'Quimbayo Rodriguez', '0000-00-00', 'Nulo', '3173179745', 'jmfquimbayo1991@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 751),
('1107069728', 1, 'John Freddy', 'Ruiz Arboleda', '0000-00-00', 'Nulo', '3197171722', 'JOHNFREDDYRUIZ0@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 195),
('1107070552', 1, 'Juana Yissenia', 'Tuquerres Rodas', '0000-00-00', 'Nulo', '3164882039', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1317),
('1107070964', 1, 'Ana Gabriel ', 'Casta?o Angulo', '0000-00-00', 'Nulo', '3207321143', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1045),
('1107071114', 1, 'Vanessa Nataly', 'Gomez Gil', '0000-00-00', 'Nulo', '3104651141', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1666),
('1107071136', 1, 'Jonathan Steven', 'Montes Acevedo', '0000-00-00', 'Nulo', '3176790793', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1543),
('1107071231', 1, 'Jhon Fredy', 'Sabogal Velandia', '0000-00-00', 'Nulo', '3205804819', 'jhonfreddy0408@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 352),
('1107071786', 1, 'Carolina ', 'Caicedo Benavides', '0000-00-00', 'Nulo', '300704945', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1320),
('1107072121', 1, 'Manuel Fernando', 'Ferrerosa Riascos', '0000-00-00', 'Nulo', '3173679001', 'manuelfdo16@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 706),
('1107074090', 1, 'Daniel', 'Arce Cardona', '0000-00-00', 'Nulo', '3185437130', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1149),
('1107075848', 1, 'Angela Lucia', 'Ramirez Rodriguez', '0000-00-00', 'Nulo', '3105274016', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1216),
('1107075957', 1, 'Sebastian', 'Arrieta Castro', '0000-00-00', 'Nulo', '3154986123', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1785),
('1107076174', 1, 'Natalia', 'Duque Higuita', '0000-00-00', 'Nulo', '3155930210', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1153),
('1107076618', 1, 'Natalia', 'Gomez Corredor', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1569),
('1107076631', 1, 'Jenny Mariana', 'Zapata Bernal', '0000-00-00', 'Nulo', '3178574905', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1728),
('1107076974', 1, 'Johana', 'Ojeda Bastidas', '0000-00-00', 'Nulo', '3113724142', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 961),
('1107078540', 1, 'Steffanny Yulieth', 'Burbano Ramos', '0000-00-00', 'Nulo', '3103098389', 'steffy1622@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 790),
('1107078764', 1, 'Brayan Fernando', 'Gaviria Acosta', '0000-00-00', 'Nulo', '3186811276', 'bfga.bfga74@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 121),
('1107079816', 1, 'Ingrid Geraldine', 'Eraso Llalles', '0000-00-00', 'Nulo', '3175420527', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1025),
('1107082834', 1, 'Kevin Jhoan', 'Prieto Mu?oz', '0000-00-00', 'Nulo', '3152636633', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1429),
('1107083411', 1, 'Yosely', 'Montenegro Varona', '0000-00-00', 'Nulo', '3004092578', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1204),
('1107083669', 1, 'Claudia Andrea', 'Medina Liscano', '0000-00-00', 'Nulo', '3182470301', 'CLAUMEDINA94@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 316),
('1107084707', 1, 'Alexander', 'Tabares Restrepo', '0000-00-00', 'Nulo', '3128698655', 'ALEXTABARES10@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 356),
('1107084955', 1, 'Heidy Tatiana', 'Guerrero Fajardo', '0000-00-00', 'Nulo', '3154037648', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 998),
('1107086380', 1, 'Yenifer', 'Rodriguez Villegas', '0000-00-00', 'Nulo', '3188450769', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1230),
('1107086796', 1, 'Yesica Alejandra', 'Fernandez Velasco', '0000-00-00', 'Nulo', '3137333950', 'jesicafernandez2111@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 278),
('1107087687', 1, 'Maria Alejandra', 'Castro Caipe', '0000-00-00', 'Nulo', '3154978245', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1251),
('1107087876', 1, 'Stefany', 'Linares Mejia', '0000-00-00', 'Nulo', '3233341211', 'NIAMEJIA13@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 310),
('1107088234', 1, 'Claudia Marcela', 'Cardona Cruz', '0000-00-00', 'Nulo', '3162949088', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1190),
('1107089760', 1, 'Cristian David', 'Dagua Mera', '0000-00-00', 'Nulo', '3106583800', 'andres_19952007@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 49);
INSERT INTO `estudiantes` (`estudiantes_no_documento`, `estudiantes_tipo_documento`, `estudiantes_nombre`, `estudiantes_apellidos`, `estudiantes_fecha_nacimiento`, `estudiantes_genero`, `estudiantes_telefono`, `estudiantes_correo`, `estudiantes_estado`, `estudiantes_direccion`, `estudiantes_adjunto_id`, `estudiantes_observaciones`, `estudiantes_doble_titulacion`, `estudiantes_doble_titulacion_id`) VALUES
('1107091185', 1, 'Danny Moises', 'Florez Murillo', '0000-00-00', 'Nulo', 'Nulo', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 924),
('1107094019', 1, 'Kevin Alexander', 'Quiroz Moran', '0000-00-00', 'Nulo', '3175635005', 'kevin-a-95@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 30),
('110709499', 1, 'Kevin Alexander', 'Quiroz Moran', '0000-00-00', 'Nulo', '3165551614', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1307),
('1107096468', 1, 'Julio Cesar', 'Ocampo Casta?eda', '0000-00-00', 'Nulo', '3127389267', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1327),
('1107097381', 1, 'Johana', 'Alegria Leslie', '0000-00-00', 'Nulo', '3183774241', 'kale-gria@outlook.es', 'egresado', 'Nulo', 0, 'Nulo', '', 820),
('1107099185', 1, 'Lina Melissa', 'Caviedes Diaz', '0000-00-00', 'Nulo', '3163686067', 'Y@Y.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 592),
('1107099224', 1, 'Mayra Alejandra', 'Ramirez Gonzalez', '0000-00-00', 'Nulo', '3165883628', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1186),
('1107099269', 1, 'Angelica', 'Restrepo Chacon', '0000-00-00', 'Nulo', '3218434318', 'angelica_9606@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 339),
('1107099295', 1, 'Nicole Dayana', 'Alvear Fajardo', '0000-00-00', 'Nulo', '3153725291', 'NICOLEALVEAR116@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 252),
('1107100120', 1, 'Leidy Vanessa', 'Arroyo Chocue', '0000-00-00', 'Nulo', '3136448119', 'VVANNE18@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 683),
('1107100594', 1, 'Juliet', 'Gonzalez Trompeta', '0000-00-00', 'Nulo', '3163600431', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1177),
('1107100643', 1, 'Santiago ', 'Ceballos Torres', '0000-00-00', 'Nulo', '3186088589', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1321),
('1107100893', 1, 'Brayan', 'Paz Hernandez', '0000-00-00', 'Nulo', '3042059629', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1035),
('1107101371', 1, 'Carlos Andres', 'Valencia Garcia', '0000-00-00', 'Nulo', '3012851950', 'zychv1@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 882),
('1107103015', 1, 'Laura Marcela', 'Tellez Mora', '0000-00-00', 'Nulo', '3177480738', 'laura-marcela-114@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 357),
('1107103877', 1, 'Tania Andrea', 'Manzano Lopez', '0000-00-00', 'Nulo', '3004648975', 'TANIAMANZANO59@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 148),
('1107104345', 1, 'Maria Elena', 'Quiceno Torres', '0000-00-00', 'Nulo', '3224442356', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1596),
('1107105068', 1, 'Gladis Vanessa', 'Minotta Largacha', '0000-00-00', 'Nulo', '6560134', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1039),
('1107105341', 1, 'Jhorman Leandro', 'Delgado Cadena', '0000-00-00', 'Nulo', '3137055047', 'JHORMAAN96@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 377),
('1107105529', 1, 'Lorena Andre', 'Carmona Jimenez', '0000-00-00', 'Nulo', '3225991746', 'loresami28@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 264),
('110749141', 1, 'Diana Lorena ', 'Lopez Corrales', '0000-00-00', 'Nulo', '3173929109', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1713),
('1107507121', 1, 'Geraldine', 'Quinto Dinas', '0000-00-00', 'Nulo', '3145518361', 'dinasgera0125@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 405),
('1107507318', 1, 'Santiago', 'Diaz Gonzalez', '0000-00-00', 'Nulo', '3105343356', 'SATIGO97@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 113),
('1107508177', 1, 'Yudi Andrea', 'Zu?iga Flores', '0000-00-00', 'Nulo', '3178163477', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1233),
('1107508258', 1, 'Alejandro', 'Pelaez Rios', '0000-00-00', 'Nulo', '3226108618', 'alejo405@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 63),
('1107509067', 1, 'Brayan Andres', 'Gaviria Tavera', '0000-00-00', 'Nulo', '3146784639', 'brayantavera11@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 439),
('1107509193', 1, 'Natalia Andrea', 'Galindez Samboni', '0000-00-00', 'Nulo', '3188678893', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1552),
('1107509539', 1, 'Hannys Hernan', 'Buitrago Mosquera', '0000-00-00', 'Nulo', '3155207272', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 883),
('1107510857', 1, 'Johan Sebastian', 'Puertas Lopez', '0000-00-00', 'Nulo', '3207632885', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1331),
('1107512418', 1, 'Jose Luis  ', 'Villamizar Escobar', '0000-00-00', 'Nulo', '3148922995', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1592),
('1107512648', 1, 'Ingrid Julieth', 'Zu?iga Benavides', '0000-00-00', 'Nulo', '3188389915', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1060),
('1107513184', 1, 'Adriana', 'Panesso Diaz', '0000-00-00', 'Nulo', '3186226270', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1143),
('1107513506', 1, 'Melissa', 'Ovalle Arcila', '0000-00-00', 'Nulo', '3185384172', 'meli-ovalle1997@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 898),
('1107513751', 1, 'Brayan Felipe', 'Preciado Cortes', '0000-00-00', 'Nulo', '3133801654', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1330),
('1107513764', 1, 'Angie Daniela', 'Montilla Mendieta', '0000-00-00', 'Nulo', '3233405045', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1209),
('1107513984', 1, 'Vanessa', 'Astorquiza Qui?ones', '0000-00-00', 'Nulo', '3206379904', 'chiquivane1223@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 85),
('1107514231', 1, 'Jefferson', 'Villaquiiran Bravo', '0000-00-00', 'Nulo', '3186681227', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1206),
('1107515734', 1, 'Vanessa', 'Colorado Ramirez', '0000-00-00', 'Nulo', '3126078278', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1292),
('1107516521', 1, 'Giovann Alberto', 'Henao Payan', '0000-00-00', 'Nulo', '3176693619', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1240),
('1107517137', 1, 'Elisa Elena', 'Godoy Martinez', '0000-00-00', 'Nulo', '3215333206', 'elisag2102@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 469),
('1107517411', 1, 'Stephany', 'Ossa Loaiza', '0000-00-00', 'Nulo', '3156925982', 'OSSALOAIZASTEPHANY@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 334),
('1107518650', 1, 'Carlos Hurmberto', 'Gutierrez Rico', '0000-00-00', 'Nulo', '3226471014', 'carlos.santiago1105@outlook.es', 'egresado', 'Nulo', 0, 'Nulo', '', 297),
('1107518665', 1, 'Diana Marcela ', 'Insuasti Gilon', '0000-00-00', 'Nulo', '3138893675', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1291),
('1107519702', 1, 'Mayra Alejandra', 'Asprilla Andrade', '0000-00-00', 'Nulo', '3216508945', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1176),
('1107522146', 1, 'Karen Julieth', 'Cortez Robledo', '0000-00-00', 'Nulo', '3126522872', 'karenjulieth.cortezrobledo@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 273),
('1107523579', 1, 'Pedro Camilo', 'Zabala Raga', '0000-00-00', 'Nulo', '3215727407', 'pedrozabalar@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 366),
('1107523701', 1, 'Tatiana Lizeth', 'Gutierrez Lopez', '0000-00-00', 'Nulo', '3172503482', 'TATIANALOPEZ416@GMAIL.COM', 'egresado', 'Nulo', 0, 'DOBLE TITULACION ADMON', '', 8),
('1107524490', 1, 'Carlos Alfonso', 'Rodriguez Tello', '0000-00-00', 'Nulo', '3143715347', 'caaral0z1999@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 344),
('1107524848', 1, 'Vivian Giselle', 'Tenorio Quintana', '0000-00-00', 'Nulo', '3225093188', 'GISELLEQ99@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 207),
('1107525836', 1, 'Cinthya Nicole', 'Velez Marin', '0000-00-00', 'Nulo', '3104175720', 'nicolvelezmarin@outlook.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 217),
('1107526600', 1, 'Esteban', 'Llanos Gallego', '0000-00-00', 'Nulo', '3174337359', 'ESTEBANLLANOS4@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 473),
('1107526701', 1, 'Collazos', 'Garces Julian', '0000-00-00', 'Nulo', '3122942088', 'JULIANCOLLAZOS99@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 416),
('1107527170', 1, 'reys Sara Carolina', 'De los', '0000-00-00', 'Nulo', '3224597709', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1227),
('1107528436', 1, 'Helen Mildred', 'Castellano Guerrero', '0000-00-00', 'Nulo', '3173565874', 'helen_ohz@hotmil.com', 'egresado', 'Nulo', 0, 'Nulo', '', 102),
('1107530276', 1, 'Sebastian', 'Burbano Juan', '0000-00-00', 'Nulo', '3003618946', 'SEBASTIAN241507@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 373),
('1107531287', 1, 'Nathalia', 'Gonzalez Martinez', '0000-00-00', 'Nulo', '3128672636', 'NATHALIAGONAZALEZ@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 128),
('1107531642', 1, 'Romario Armando', 'Sandoval Fajardo', '0000-00-00', 'Nulo', '3137013817', 'romario.sandoval@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 354),
('1107531912', 1, 'Nathalia', 'Henao Chipe', '0000-00-00', 'Nulo', '3127603367', 'nathhyhenao104@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 298),
('1107533701', 1, 'Tatiana Lizeth', 'Gutierres Lopez', '0000-00-00', 'Nulo', '3172503482', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1078),
('1108559614', 1, 'Laura Michell', 'Zuluaga Zuluaga', '0000-00-00', 'Nulo', '3172541790', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 914),
('1109540727', 1, 'Luis Miguel', 'Gomez Gonzalez', '0000-00-00', 'Nulo', '3184102623', 'ORTUA3199@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 290),
('1109660728', 1, 'Juan Felipe', 'Posso Diaz', '0000-00-00', 'Nulo', '3212116055', 'NO54@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 179),
('1109663560', 1, 'Brigith Valentina', 'Salinas Montes', '0000-00-00', 'Nulo', '3053782126', 'smbrigithvalentina@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 535),
('1109920800', 2, 'Hilary Samantha', 'Mosquera Mina', '0000-00-00', 'Nulo', '3173608936', 'samanthamina2330@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 869),
('1110282954', 1, 'Bryan Alexis', 'Erazo Rengifo', '0000-00-00', 'Nulo', '3052487300', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1455),
('1110284635', 1, 'Danna Maryuri', 'Villada Chaguendo', '0000-00-00', 'Nulo', '3059205254', 'dannitavillada@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 363),
('1110285564', 1, 'Jhonier', 'Giraldo Grisales', '0000-00-00', 'Nulo', '3115655348', 'jhonierg1208@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 528),
('1110287652', 1, 'Andres', 'Marin Espinosa', '0000-00-00', 'Nulo', '3162062026', 'livarohe@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 843),
('1110288363', 2, 'Jhijailin', 'Mu?oz Gaviria', '0000-00-00', 'Nulo', '3168200551', 'auragabi2000@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 801),
('1110365418', 1, 'Sara', 'Masmela Leon', '0000-00-00', 'Nulo', '3218012492', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 913),
('1110535808', 1, 'Luisa Fernanda', 'Rubiano Gomez', '0000-00-00', 'Nulo', '3176797114', 'rubianoluisa22@gamil.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 676),
('1110602717', 1, 'Yuli Paola', 'Villamarin Jimenes', '0000-00-00', 'Nulo', '3104528916', 'paolavillamarinjimenes@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 857),
('1111478034', 2, 'Katherine Daniela', 'Castro Castro', '0000-00-00', 'Nulo', '3182006764', 'daniicastroo2016@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 860),
('1111478094', 1, 'Oscar Ivan', 'Tellez Molina', '0000-00-00', 'Nulo', '3174149249', 'carolina198611@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 905),
('1111542958', 1, 'Valeria', 'Satizabal Riascos', '0000-00-00', 'Nulo', '3233876251', 'valeriasatizabal621@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 896),
('1111661222', 1, 'Joselin Tatiana', '?a?ez Esterilla', '0000-00-00', 'Nulo', '3206208258', 'nanezjoselin0@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 845),
('1111666006', 1, 'David Manuel', 'Rosero Cordoba', '0000-00-00', 'Nulo', '3113927031', 'manuelitohd32@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 850),
('1111668840', 1, 'Jhohan Andres', 'Toloza Estupi?an', '0000-00-00', 'Nulo', '3185335344', 'jhohantoloza2@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 823),
('1111671940', 1, 'Juan Camilo', 'Lozano Ortiz', '0000-00-00', 'Nulo', '3137512738', 'Camilozatiz@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 818),
('1111784467', 1, 'Raul Andres', 'Duran Rodas', '0000-00-00', 'Nulo', '3172706075', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1310),
('1111792129', 1, 'Andrea Estefania', 'Cortes Castrillon', '0000-00-00', 'Nulo', '3215847006', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1727),
('1111795409', 1, 'Aura Maria', 'Gomez Hernandez', '0000-00-00', 'Nulo', '3116691851', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 934),
('1111815213', 1, 'Yerson Erasmo', 'Alomia Vivas', '0000-00-00', 'Nulo', '3166767864', 'e.alomia@misena.edu.co', 'inactivo', 'Nulo', 0, 'Nulo', '', 17),
('1112101664', 1, 'Luis Alejandro', 'Vargas Correa', '0000-00-00', 'Nulo', '3162381920', 'LUVACO22@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 564),
('111220473', 1, 'Sara Yesenia', 'Rivas Murillo', '0000-00-00', 'Nulo', '3217199753', 'sorayani63@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 647),
('1112220473', 1, 'Sara Yesenia ', 'Rivas Murillo', '0000-00-00', 'Nulo', '3217199753', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1084),
('1112229638', 1, 'Jessica', 'Uribe Cayapu', '0000-00-00', 'Nulo', '3185093894', 'jessik.melisa04@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 14),
('1112461664', 1, 'Rocio', 'Serna Claudia', '0000-00-00', 'Nulo', '3135988186', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1199),
('1112464983', 1, 'Nelson Enrique', 'Gomez Mosquera', '0000-00-00', 'Nulo', '3163821982', 'enyiemz300@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 608),
('1112466164', 1, 'Vanessa', 'Cordoba', '0000-00-00', 'Nulo', '3156710251', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1582),
('1112468638', 1, 'Ingird Marcela ', 'Campo Guevara', '0000-00-00', 'Nulo', '3217269285', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1697),
('1112470921', 1, 'Diana Marcela', 'Rios Ordo?ez', '0000-00-00', 'Nulo', '3172310403', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 942),
('1112472479', 1, 'Katherine', 'Berrio Burbano', '0000-00-00', 'Nulo', '3152029495', 'kathebebur@gmail.com', 'inactivo', 'Nulo', 0, 'PDT MODULOS Y PROYECTO', '', 90),
('1112475139', 1, 'Marcela', 'Perez Sonia', '0000-00-00', 'Nulo', '3154775800', 'SO_MARCE@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 178),
('1112475796', 1, 'Giron Claudia', 'Taimal ', '0000-00-00', 'Nulo', '3184920527', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1297),
('1112475871', 1, 'Katherin Julieth', 'Popayan Rengifo', '0000-00-00', 'Nulo', '3215826768', 'BB@BB.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 804),
('1112478754', 1, 'Jonathan', 'Figueroa Garcia', '0000-00-00', 'Nulo', '3178679924', 'JONATHANFIGUEROA9370@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 600),
('1112479887', 1, 'Julio Alberto', 'Guzman Paredes', '0000-00-00', 'Nulo', '3152871477', 'julio12518@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 136),
('1112488655', 1, 'Heidy Lorena', 'Hoyos Zu?oga', '0000-00-00', 'Nulo', '3104378260', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1235),
('1112489834', 1, 'Kensy Mayerli', 'Quiguanas Suarez', '0000-00-00', 'Nulo', '3127025734', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1162),
('1112491052', 1, 'Isabella', 'Rivera Monta?o', '0000-00-00', 'Nulo', '3187729902', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1234),
('1112491192', 1, 'Diego Fernando ', 'Varona Galindez', '0000-00-00', 'Nulo', '3154040103', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1188),
('1112492281', 1, 'Angely Del Valle', 'Osuna Micolta', '0000-00-00', 'Nulo', '3188177968', 'angelyosuna@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 742),
('1112493442', 1, 'Daniela', 'Ramirez Ocoro', '0000-00-00', 'Nulo', '3167820924', 'DANIELARO467@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 391),
('1112493771', 1, 'Linda Nayibe', 'Callejas Gallego', '0000-00-00', 'Nulo', '3136472064', 'lindacallejas53@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 479),
('1112879495', 1, 'Diana Lorena', 'Cardenas Montes', '0000-00-00', 'Nulo', '3163996941', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1631),
('1112966468', 1, 'Diana Lorena', 'Palau Gonzalez', '0000-00-00', 'Nulo', '3155194666', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1523),
('1113037327', 1, 'Faizuly', 'Diaz Cardozo', '0000-00-00', 'Nulo', '31164860', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1309),
('11130632311', 1, 'Yarley Rosana', 'Balanta Angulo', '0000-00-00', 'Nulo', '3173774489', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1002),
('11130670349', 1, 'Fabio', 'Ni?o Mayor', '0000-00-00', 'Nulo', '3135685373', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1136),
('11130672570', 1, 'Luisa Fernanda', 'Cardona Garcia', '0000-00-00', 'Nulo', '3124284020', 'luisitaf87@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 98),
('1113512604', 1, 'Kely Bibiana ', 'Bejarano Paz', '0000-00-00', 'Nulo', '3184843910', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1350),
('1113513465', 1, 'Luz Angela', 'Puliche Valencia', '0000-00-00', 'Nulo', '3177698462', 'angel-86m07@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 29),
('1113516521', 1, 'Sandra Johanna', 'Alba Castrillon', '0000-00-00', 'Nulo', '3155028283', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1691),
('1113517128', 1, 'Yudy Alexandra', 'Nupan Gualguan', '0000-00-00', 'Nulo', '3104255750', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1457),
('1113517202', 1, 'Jhon Edinson', 'Palau Pinimue', '0000-00-00', 'Nulo', '3006069861', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1743),
('1113518067', 1, 'Claudia Patricia', 'Figueroa ?a?es', '0000-00-00', 'Nulo', '3153907285', 'clauidapf_19@yahoo.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 50),
('1113518724', 1, 'Yecica ', 'Viera Arango', '0000-00-00', 'Nulo', '3178797479', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1687),
('1113519646', 1, 'Claudia Lorena', 'Giraldo Martinez', '0000-00-00', 'Nulo', '3148057011', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1295),
('1113521717', 1, 'Maria Fernanda', 'Gutierrez Pe?uela', '0000-00-00', 'Nulo', '3183775630', 'NOTENGO@HOTMAIL.COM.CO', 'inactivo', 'Nulo', 0, 'Nulo', '', 380),
('1113523115', 1, 'Yessica', 'Ortiz Arboleda', '0000-00-00', 'Nulo', '3003997877', 'JESICAORTIZ2601@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 556),
('1113523568', 1, 'Sandra', 'Contreras Vivas', '0000-00-00', 'Nulo', '3044717110', 'SANDRAMILENACONTRERASVIVAS@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 779),
('1113526305', 1, 'Wilmer Herney', 'Charria Florez', '0000-00-00', 'Nulo', '3153287610', 'NO.TIENE13345@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 270),
('1113527557', 1, 'Carolina', 'Rios', '0000-00-00', 'Nulo', '3183812031', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1498),
('1113528532', 1, 'Dennis Stevens', 'Jaramillo Tafurth', '0000-00-00', 'Nulo', '3187487945', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 994),
('1113528820', 1, 'Andrea Viviana', 'Botina Eraso', '0000-00-00', 'Nulo', '3215810576', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1129),
('1113539457', 1, 'Vanessa', 'Enrquez Raquel', '0000-00-00', 'Nulo', '3218495394', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1207),
('1113627409', 1, 'Cindy Lorena', 'Fernandez Luna', '0000-00-00', 'Nulo', '3196015474', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1415),
('1113647845', 1, 'Wilynson', 'Mu?oz Molano', '0000-00-00', 'Nulo', '3104579158', 'BILLY_M27@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 733),
('1113649918', 1, 'Katheirne', 'Montoya Nievas', '0000-00-00', 'Nulo', '3163261374', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1015),
('1113651086', 1, 'Diana Marcela', 'Ocampo Lopez', '0000-00-00', 'Nulo', '3176989752', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1063),
('1113661800', 1, 'Stephanie', 'Alvear Velez', '0000-00-00', 'Nulo', '3156309416', 'TATIS.17.17@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 680),
('1113665564', 1, 'Sulma Mireya', 'Santiesteban Arboleda', '0000-00-00', 'Nulo', '3218070940', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1236),
('1113667927', 1, 'Manuel Felipe', 'Garrido Valencia', '0000-00-00', 'Nulo', '3165664445', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1141),
('1113684749', 1, 'Angeli', 'Valencia Casanpva', '0000-00-00', 'Nulo', '3228606474', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1178),
('1113689238', 1, 'Valentina', 'Alzate Torres', '0000-00-00', 'Nulo', '3172872119', 'andreat3003@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 76),
('11144209797', 1, 'Lizbeth Andrea', 'Fernandez Franco', '0000-00-00', 'Nulo', '3207981302', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1076),
('1114455181', 1, 'Francisco Alexis', 'Valdes Gallego', '0000-00-00', 'Nulo', '3156321199', 'TT@TT.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 660),
('1114457996', 1, 'Arce', 'Maria Fatima', '0000-00-00', 'Nulo', '3103728767', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1515),
('1114480800', 1, 'Alejandra', 'Saavedra Gallego', '0000-00-00', 'Nulo', '3177570632', 'alejaimagenes1@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 759),
('1114726882', 1, 'Ronald', 'Pillimue Pati?o', '0000-00-00', 'Nulo', '3003159287', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1033),
('1114727150', 1, 'Jeyson Alberto', 'Ordo?ez Martinez', '0000-00-00', 'Nulo', '3046318180', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 990),
('1114732333', 1, 'Juan Brian', 'Sanchez Alvarado', '0000-00-00', 'Nulo', '8942358', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1494),
('1114735618', 1, 'Derian Esteban', 'Ijaji Gomez', '0000-00-00', 'Nulo', '3172128522', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1102),
('1114814314', 1, 'Jennifer', 'Mera Bermudez', '0000-00-00', 'Nulo', '3102963026', 'jmera@scicolombia.com.co', 'inactivo', 'Nulo', 0, 'Nulo', '', 403),
('1114832057', 1, 'Fhanor Adolfo', 'Montenegro Restrepo', '0000-00-00', 'Nulo', '3166237056', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1228),
('1114887981', 1, 'Edward Fernando', 'Cuartas Solarte', '0000-00-00', 'Nulo', '3147967878', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1613),
('1114893236', 1, 'Daniela ', 'Cuero Mosquera', '0000-00-00', 'Nulo', '3229489509', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1417),
('1115063818', 1, 'Jenny  Patricia ', 'Florez Hurtado', '0000-00-00', 'Nulo', '3234579068', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1302),
('1115070754', 1, 'Karen Vanessa', 'Vega Villa', '0000-00-00', 'Nulo', '3182402927', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1766),
('1115082477', 1, 'Stiven', 'Marulanda Hincapie', '0000-00-00', 'Nulo', '3126186929', 'estivenmaru2530@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 314),
('1115182185', 1, 'Damaris Jacquelin', 'Gonzalez Casta?eda', '0000-00-00', 'Nulo', '3126109569', 'damaris_gonzalez@cced.edu.co', 'inactivo', 'Nulo', 0, 'Nulo', '', 611),
('1115420117', 1, 'Ximena Andrea', 'Tabima Garcia', '0000-00-00', 'Nulo', '3172285257', 'XTABIMA@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 497),
('1116131953', 1, 'Diana Lorena', 'Alzate Zluaga', '0000-00-00', 'Nulo', '3004499212', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1269),
('1116156636', 1, 'Cindy Tatiana', 'Escobar Mondragon', '0000-00-00', 'Nulo', '3226508307', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 984),
('1116243060', 1, 'Yefferson', 'Sanchez Hernandez', '0000-00-00', 'Nulo', '3155532507', 'Boy21@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 242),
('1116255967', 1, 'Viviana ', 'Mejia Bedoya', '0000-00-00', 'Nulo', '3187111319', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1270),
('1116265333', 1, 'Cristian Andres', 'Suaza Guevara', '0000-00-00', 'Nulo', '3152132465', 'suaza_323@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 203),
('1116271269', 1, 'Niyiret Estefani', 'Lopez Ramirez', '0000-00-00', 'Nulo', '3163725390', 'niyiretlopez@emdb.edu.co', 'inactivo', 'Nulo', 0, 'Nulo', '', 58),
('1116373219', 1, 'Solany', 'Hernandez Quigua', '0000-00-00', 'Nulo', '3224621113', '25hernandezsolany25@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 717),
('1116725430', 1, 'Carlos', 'Murillo Vargas', '0000-00-00', 'Nulo', '3113891714', 'karlostomy34@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 735),
('1118257449', 1, 'Elkin Alejandro', 'Giraldo Parra', '0000-00-00', 'Nulo', '3128827418', 'alejandrogiraldo36@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 287),
('1118282806', 1, 'Diana Milena', 'Garcia Ortega', '0000-00-00', 'Nulo', '3145677325', 'DIANAMILENA@cced.edu.co', 'egresado', 'Nulo', 0, 'Nulo', '', 283),
('1118285140', 1, 'Lucia', 'Herrera Duque', '0000-00-00', 'Nulo', '3182324055', 'CAROLA-1123@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 381),
('1118286091', 1, 'Jesicca', 'Ruano Cruz', '0000-00-00', 'Nulo', '3147861062', 'jesiccaruano91@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 193),
('1118286263', 1, 'Maria Dioselina', 'Acosta Ojeda', '0000-00-00', 'Nulo', '3127566310', 'mariadoselinaa@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 786),
('1118290760', 1, 'Wilmer', 'Ordo?ez Mu?oz', '0000-00-00', 'Nulo', '3234437666', 'yuranimartinez30@gmail.com', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 168),
('1118292881', 1, 'Adriana Fernanda', 'Samboni Imbachi', '0000-00-00', 'Nulo', '3217394268', 'ADRIANA.SAMBONI03@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 656),
('1118301624', 1, 'Natalia', 'Perea Valderrama', '0000-00-00', 'Nulo', '3187413988', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1022),
('1118305561', 1, 'Leidy', 'Oviedo Noguera', '0000-00-00', 'Nulo', '3002008223', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1174),
('1118308180', 1, 'Juan Sebastian', 'Llanos Florez', '0000-00-00', 'Nulo', '3042491705', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1160),
('1118308793', 1, 'Lina Maria', 'Mu?eton Serna', '0000-00-00', 'Nulo', '3235831774', 'LINAMS1697@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 490),
('1118311435', 1, 'Victor Manuelle', 'Trivi?o Serna', '0000-00-00', 'Nulo', '3229006005', 'VICTOR0624SERNA@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 360),
('1121860985', 1, 'Stephania', 'Rojas Cortes', '0000-00-00', 'Nulo', '3185201073', 'samiestefrojas17@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 345),
('1121926906', 1, 'Heida', 'Mina Sandoval', '0000-00-00', 'Nulo', '3137589358', 'LORENA-MINASANDOVAL@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 154),
('1122236426', 1, 'Zully Viviana', 'Portocarrero Hinojosa', '0000-00-00', 'Nulo', 'Nulo', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 846),
('1123306841', 1, 'Yohana Fernanda', 'David Gomez', '0000-00-00', 'Nulo', '3216680182', 'fernandadavid1933@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 792),
('1123326002', 1, 'Daira Daniela', 'Daza Tapasco', '0000-00-00', 'Nulo', '3207675671', 'ddanieladaza@hotmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 435),
('1125251378', 1, 'Stephania', 'Guahu?a Paz', '0000-00-00', 'Nulo', '3104484990', 'tefapaz28@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 131),
('1125271524', 1, 'Stephany ', 'Galindo Osorio', '0000-00-00', 'Nulo', '3177528600', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1663),
('1125278246', 1, 'Mauricio', 'Rojas Douglas', '0000-00-00', 'Nulo', '3234798599', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1266),
('1125678795', 1, 'Ramiro Andres', 'Ramirez Diaz', '0000-00-00', 'Nulo', '3058881954', 'RRELFRANCES@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 753),
('1127208268', 1, 'Daniel Felipe', 'Luligo Diaz', '0000-00-00', 'Nulo', '3187784186', 'dfelipelulico@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 447),
('1127215086', 1, 'Nicolas', 'Ruiz Gregory', '0000-00-00', 'Nulo', '3008138864', 'nicolasruiz@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 904),
('1127603826', 1, 'Maria del Pilar', 'Diaz Valencia', '0000-00-00', 'Nulo', '3186422670', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1273),
('1127942233', 1, 'Geovanna Andrea ', 'Guevara Duque', '0000-00-00', 'Nulo', '3004494376', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1323),
('1128439510', 1, 'Elizabeth', 'Pulgarin Monterrosa', '0000-00-00', 'Nulo', '3176406967', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1024),
('1129904982', 1, 'Diana Lizeth', 'Rodriguez Bermudez', '0000-00-00', 'Nulo', '3122341142', 'DIANITA_089@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 189),
('1130584492', 1, 'Diego Fernando', 'Bautista Mosquera', '0000-00-00', 'Nulo', '3132548189', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 987),
('1130584669', 1, 'Carolina', 'Molina', '0000-00-00', 'Nulo', '3163440769', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1581),
('1130584926', 1, 'Lizeth', 'Morales Velasquez', '0000-00-00', 'Nulo', '3163221949', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 930),
('1130585647', 1, 'Viviana', 'Mosquera Mosquera', '0000-00-00', 'Nulo', '3167020031', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1763),
('1130585813', 1, 'Diana Carolina', 'Rios Rengifo', '0000-00-00', 'Nulo', '3178356694', 'DIANACRIOSR@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 342),
('1130585828', 1, 'Ana Mile ', 'Benavides Mu?oz', '0000-00-00', 'Nulo', '3193543323', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1281),
('1130587411', 1, 'Miledy', 'Ledesma Betacourt', '0000-00-00', 'Nulo', '3137816023', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 946),
('1130588555', 1, 'Cruz Tatiana', 'Gomez Hernandez', '0000-00-00', 'Nulo', '3137559859', 'cruztatianagomez14@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 607),
('1130589194', 1, 'Lorena ', 'perdomo Arias', '0000-00-00', 'Nulo', '3166188525', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1419),
('1130590257', 1, 'Vivian Lorena ', 'Valencia Ortega', '0000-00-00', 'Nulo', '3113654422', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1408),
('1130590531', 1, 'Maira  Alejandra', 'Borrero Hormaza', '0000-00-00', 'Nulo', '3234831256', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1319),
('1130590769', 1, 'Maida Iruth', 'Benavidez Mu?oz', '0000-00-00', 'Nulo', '3152595618', 'maryis86@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 688),
('1130590943', 1, 'Diana Paola ', 'Castillo Medina', '0000-00-00', 'Nulo', '3187725120', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1701),
('1130591225', 1, ' Paulo Cesar ', 'Barreto Ortegon', '0000-00-00', 'Nulo', '3113560492', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1348),
('1130592742', 1, ' Cindy', 'Galvez Flores', '0000-00-00', 'Nulo', '3176857935', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1097),
('1130593739', 1, 'Oscar David', 'Perez Rosero', '0000-00-00', 'Nulo', '3178385844', 'davidprez529@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 389),
('1130593836', 1, 'Lorena', 'Orozco Duque', '0000-00-00', 'Nulo', '3176828218', 'lorenaaadukeee2186@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 169),
('1130594053', 1, 'Arleyda', 'Cardona Cruces', '0000-00-00', 'Nulo', '3137257778', 'arca1928@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 587),
('1130595263', 1, 'Mireya', 'Sandoval Lopez', '0000-00-00', 'Nulo', '3184759340', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1189),
('1130595772', 1, 'Oscar Daniel', 'Moreno Botero', '0000-00-00', 'Nulo', '3185592323', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1541),
('1130596359', 1, 'Nazly Yulieth', 'Hernandez Lozano', '0000-00-00', 'Nulo', '3178956382', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1335),
('1130596439', 1, 'Sirley', 'Imbachi Botina', '0000-00-00', 'Nulo', '3153833104', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1670),
('1130597169', 1, 'John Steven', 'Cortes Holguin', '0000-00-00', 'Nulo', '3046222541', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 932),
('1130599216', 1, 'Ruben Dario', 'Ipia Sarria', '0000-00-00', 'Nulo', '3155082847', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1559),
('1130599799', 1, 'Elsa Liliana', 'Sanchez Lozano', '0000-00-00', 'Nulo', '3167047038', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1765),
('1130601605', 1, 'Saul Andres', 'Certuche Arcos', '0000-00-00', 'Nulo', '3137671618', 'saul880922@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 105),
('1130603887', 1, 'Walter De Jesus', 'Alvarez Cifuentes', '0000-00-00', 'Nulo', '3105399576', 'alvarezwalter129@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 499),
('1130604151', 1, 'Lina Maria', 'Valencia Cabezas', '0000-00-00', 'Nulo', '3207162260', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1020),
('1130604402', 1, 'Andres Felipe', 'Riascos Cosme', '0000-00-00', 'Nulo', '3184232670', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1499),
('1130606409', 1, 'Carolina', 'Durango Toledo', '0000-00-00', 'Nulo', '3153226769', 'CARODUTO86@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 277),
('1130609267', 1, 'Yensi Tatiana', 'Ayala Galarza', '0000-00-00', 'Nulo', '3228901427', 'tatiayalalemo@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 369),
('1130610031', 1, 'Alan', 'Echeverry Gomez', '0000-00-00', 'Nulo', '3163160445', 'alan1912@outlook.com', 'inactivo', 'Nulo', 0, 'DEBE DERECHOS DE GRADOS', '', 5),
('1130610044', 1, 'Johana Andrea', 'Leal Cumba', '0000-00-00', 'Nulo', 'Nulo', 'JOHANALEALC@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 551),
('1130611569', 1, 'Gabriel', 'Alarcon Valencia', '0000-00-00', 'Nulo', '3175418479', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1342),
('1130611843', 1, 'Diana Maria', 'Escobar Gutierrez', '0000-00-00', 'Nulo', '3164858216', 'lilu2412@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 436),
('1130612688', 1, 'Fabian Andres', 'Zamora Casta?eda', '0000-00-00', 'Nulo', '3007571244', 'NOOOOOTIENE@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 784),
('1130612916', 1, 'Ingrid Katherine', 'Loaiza Suarez', '0000-00-00', 'Nulo', '3165515945', 'ingridloaizasuarez@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 624),
('1130613942', 1, 'Yasmin', 'Lucumi Collazos', '0000-00-00', 'Nulo', '3206729910', 'JZ8725@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 382),
('1130614737', 1, 'Lenis Dorena', 'Mu?oz Orozco', '0000-00-00', 'Nulo', '3164907426', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1052),
('1130615191', 1, 'Maryury', 'Mu?oz Zapata', '0000-00-00', 'Nulo', '3154724787', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 986),
('1130617596', 1, 'Diana Paola', 'Nicanquer Moriones', '0000-00-00', 'Nulo', '3008295757', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1751),
('1130618494', 1, 'Jose Luis', 'Camacho Ceballos', '0000-00-00', 'Nulo', '3122706242', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1058),
('1130618525', 1, 'Serna Xiomara', 'Serna Xiomara', '0000-00-00', 'Nulo', '3163757819', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1539),
('1130619319', 1, 'Javier Francisco', 'Collazos Silva', '0000-00-00', 'Nulo', '3146681500', 'JFCOLLAZOSS@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 483),
('1130619515', 1, 'Jhon Omar', 'Cuero Bazan', '0000-00-00', 'Nulo', '3194879341', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1430),
('1130620665', 1, 'Zulley', 'Castillo', '0000-00-00', 'Nulo', '3137622832', 'zuley_castillo@cced.edu.co', 'inactivo', 'Nulo', 0, 'Nulo', '', 268),
('1130621393', 1, 'Carolina', 'Castillo Castro', '0000-00-00', 'Nulo', '3113435839', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 975),
('1130621734', 1, 'Eyson Andres', 'Camargo Ultengo', '0000-00-00', 'Nulo', '3133075426', 'andresc.24@hotmail.com', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 95),
('1130621825', 1, 'Martha Isabel', 'Miranda Casta?eda', '0000-00-00', 'Nulo', '3157118608', 'ISABELITAVARGAS11M@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 155),
('1130622141', 1, 'Sandra Milena', 'Gutierrez Artuanga', '0000-00-00', 'Nulo', '3154466055', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1324),
('1130622962', 1, 'Jenny Andrea ', 'Torres Serna', '0000-00-00', 'Nulo', '3147573481', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1121),
('1130623694', 1, 'Yorledy', 'Lucumi', '0000-00-00', 'Nulo', '3135968358', 'yorluma123@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 628),
('1130623876', 1, 'Lina Maryuri ', 'Ramirez Soler', '0000-00-00', 'Nulo', '3146447520', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1681),
('1130628434', 1, 'Lorena', 'Mejia Valencia', '0000-00-00', 'Nulo', '3185248826', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1725),
('1130629410', 1, 'Edith Julieth', 'Alvarez Gil', '0000-00-00', 'Nulo', '3188201473', 'alvaresedith@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 18),
('1130629960', 1, 'Angel Mauricio', 'Cabrera Giraldo', '0000-00-00', 'Nulo', '3503431457', 'ANGEL.C.G@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 45),
('1130630148', 1, 'Xiomara', 'Franco Cabrera', '0000-00-00', 'Nulo', '3172340558', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1579),
('1130630263', 1, 'Yuly Carol', 'Valencia Rendon', '0000-00-00', 'Nulo', '3122920783', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1409),
('1130630720', 1, ' Diana Lucia ', 'Potes Mejia', '0000-00-00', 'Nulo', '3217361927', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1338),
('1130632097', 1, 'Rosenver', 'Gongora Ossa', '0000-00-00', 'Nulo', '3172236440', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1013),
('1130632388', 1, 'katerine', 'Olivero Hernandez', '0000-00-00', 'Nulo', '3116127685', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 993),
('1130632853', 1, 'Veronica', 'Valdes', '0000-00-00', 'Nulo', '3146574623', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1124),
('1130633162', 1, 'Elver Iohan', 'Fajardo Palta', '0000-00-00', 'Nulo', '3163843460', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1731),
('1130633493', 1, 'Angie Lorena', 'Campo Cardona', '0000-00-00', 'Nulo', '3117202185', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1627),
('1130633705', 1, 'Christian Eduardo', 'Osorio Espinosa', '0000-00-00', 'Nulo', '3023565380', 'credos1986l@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 171),
('1130635660', 1, 'Natalia Cristina', 'Rios Mu?eton', '0000-00-00', 'Nulo', '3102859640', 'nata887@hotmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION ADMON', '', 12),
('1130636226', 1, 'Cindy Viviana', 'Taborda Echeverry', '0000-00-00', 'Nulo', '3187395370', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1198),
('1130638294', 1, 'Diana Paola ', 'Chicue Casanova', '0000-00-00', 'Nulo', '3146645502', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1366),
('1130638413', 1, 'Cindy Paola', 'Anzola Ortiz', '0000-00-00', 'Nulo', '3163843460', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1750),
('1130638555', 1, 'Suley Katerin ', 'Casta?eda Narvaez', '0000-00-00', 'Nulo', '3185944936', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1640),
('1130639067', 1, 'Paola Andrea', 'Piedrahita Garcia', '0000-00-00', 'Nulo', '3157443223', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1399),
('1130639088', 1, 'Ingrid Johanna', 'Gonzalez Ibarguen', '0000-00-00', 'Nulo', '3152445247', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1667),
('1130639568', 1, 'Carlos Alberto', 'Rojas Qui?onez', '0000-00-00', 'Nulo', '3177570632', 'alejaimagenes@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 346),
('1130639805', 1, 'Diana Marcela ', 'Medina Ospina', '0000-00-00', 'Nulo', '3105491623', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1434),
('1130640065', 1, 'Jefferson ', 'Rodriguez Marmolejo', '0000-00-00', 'Nulo', '3172482955', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1439),
('1130640238', 1, 'Deisy Lucia', 'Joaquin Papamija', '0000-00-00', 'Nulo', '3167853235', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1379),
('1130640542', 1, 'Ninfa Nohemi', 'Rodriguez Murillo', '0000-00-00', 'Nulo', '3172802529', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1734),
('1130640629', 1, 'Alba Mery', 'Castillo Medina', '0000-00-00', 'Nulo', '3157125488', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1700),
('1130641902', 1, 'Eidy Johana', 'Ante Lopez', '0000-00-00', 'Nulo', '3164981151', 'nicoll0709@hotmail.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 787),
('1130642453', 1, 'Leidy Johana', 'Bedoya Fonseca', '0000-00-00', 'Nulo', '3146414625', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1047),
('1130642807', 1, 'Jennifer Elianna ', 'Diaz Ortiz', '0000-00-00', 'Nulo', '3044140690', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1652),
('1130643102', 1, 'Cindy', 'Muriel Hernandez', '0000-00-00', 'Nulo', '3187441858', 'bysister29@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 802),
('1130644198', 1, 'Camilo Eduardo', 'Andrade Grisales', '0000-00-00', 'Nulo', '3185610690', 'KAMILOANDRADEG@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 78),
('1130644996', 1, 'Maria Cecilia', 'Gonzalez Preciado', '0000-00-00', 'Nulo', '3122876406', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1042),
('1130649887', 1, 'Leidy Tatiana ', 'Ni?o Correa', '0000-00-00', 'Nulo', '3015379765', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1326),
('1130650184', 1, 'Claudia Yobana', 'Zu?iga Yela', '0000-00-00', 'Nulo', '3146388464', 'chiquitasteicuy@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 368),
('1130650284', 1, 'Linda Vanessa', 'Figueroa Moran', '0000-00-00', 'Nulo', '3137644256', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 969),
('1130650412', 1, 'Jhon Jairo', 'Asprilla Cardona', '0000-00-00', 'Nulo', '3128476418', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1636),
('1130650700', 1, 'Leydi Vanessa', 'Florez Marmolejo', '0000-00-00', 'Nulo', '3108906679', 'aremarfeli@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 119),
('1130651603', 1, 'Martha Lucia', 'Millan Concha', '0000-00-00', 'Nulo', '3007414465', 'e@e.com', 'egresado', 'Nulo', 0, 'Nulo', '', 153),
('1130652403', 1, 'Leonardo Fabio', 'Mosquera Estacio', '0000-00-00', 'Nulo', '3188541584', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1139),
('1130653257', 1, 'Carolina ', 'Sandoval Gonzalez', '0000-00-00', 'Nulo', '3103948435', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1405),
('1130653432', 1, 'Nataly', 'Arcila Bonilla', '0000-00-00', 'Nulo', '3146725932', 'nathal08@hotmail.com', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 573),
('1130653699', 1, 'Leidy Faisuri', 'Guerrero Vidal', '0000-00-00', 'Nulo', '3184692795', 'leidy06387@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 825),
('1130655474', 1, 'Maricela', 'Chavez Yury', '0000-00-00', 'Nulo', '3182668812', 'yurychavez1@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 376),
('1130655681', 1, 'Stefanny', 'Londo?o Arias', '0000-00-00', 'Nulo', '3216710495', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1336),
('1130656392', 1, 'Alexandra Yulieth', 'Carrillo Pulgarin', '0000-00-00', 'Nulo', '3104110733', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1639),
('1130657051', 1, 'Yony Adolfo', 'Oviedo Castillo', '0000-00-00', 'Nulo', '3104963105', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1525),
('1130657333', 1, 'Yeny', 'Trejos Tabares', '0000-00-00', 'Nulo', '3156283021', 'JENNYTREJOSTABARES@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 770),
('1130658042', 1, 'Rummy Yuliana', 'Sanchez Velasco', '0000-00-00', 'Nulo', '3117774493', 'RYSANCHEZV@GRUPO-EXITO.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 353),
('1130658150', 1, 'Lincey Nataly', 'Quintero Delgado', '0000-00-00', 'Nulo', '3176359968', 'NATALYQUINTERO01@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 643),
('1130658961', 1, 'Fausto', 'Castillo Viveros', '0000-00-00', 'Nulo', '3206948864', 'FAUSTO.1130@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 589),
('1130659068', 1, 'Marcela', 'Alvarez Lina', '0000-00-00', 'Nulo', '3155259904', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1484),
('1130660581', 1, 'Anyela Viviana', 'Borrero Garcia', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1352),
('1130661373', 1, 'Stefanny', 'Cortes Swimhy', '0000-00-00', 'Nulo', '3117174305', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1105),
('1130662047', 1, 'Alexis ', 'Mu?oz Gomez', '0000-00-00', 'Nulo', '3186384719', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1392),
('1130662960', 1, 'Hector Julian', 'Ibarguen Ordo?ez', '0000-00-00', 'Nulo', '3153287473', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1561),
('1130664652', 1, 'Jose Armando', 'Guzman Envacoa', '0000-00-00', 'Nulo', '3176674443', 'compras@controlaringenieria.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 135),
('1130665127', 1, 'Andry Yuleibi', 'Suarez Gonzalez', '0000-00-00', 'Nulo', '3147467789', 'ANDRYSAM24@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 657),
('1130665422', 1, 'Luis Eduardo', 'Betancur Garcia', '0000-00-00', 'Nulo', '3153319843', 'LUIBETAR-65@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 582),
('1130666243', 1, 'Jhoanna  Andrea ', 'Cabrera Joaqui', '0000-00-00', 'Nulo', '3177106237', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1625),
('1130666281', 1, 'Martha Viviana', 'Nieva Vicu?a', '0000-00-00', 'Nulo', '3216380086', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 923),
('1130666409', 1, 'Julian', 'Colonia Otero', '0000-00-00', 'Nulo', '3117696011', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1615),
('1130667676', 1, 'Victor Andres', 'Delgado Ramirez', '0000-00-00', 'Nulo', '3185603980', 'victor860609@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 816),
('1130670349', 1, 'Fabio', 'Ni?o Mayor', '0000-00-00', 'Nulo', '3104293241', 'FABNINO2017@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 533),
('1130670527', 1, 'Vanessa', 'Castro Prado', '0000-00-00', 'Nulo', '3186839872', 'mauroandre10@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 591),
('1130670604', 1, 'Diana Katerine', 'Angulo Caicedo', '0000-00-00', 'Nulo', '3106005750', 'katerine878910@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 476),
('1130671220', 1, 'Nataly', 'Gil Maya', '0000-00-00', 'Nulo', '3156461921', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1665),
('1130672325', 1, 'Claudia Marcela', 'Hoyos Osorio', '0000-00-00', 'Nulo', 'Nulo', 'TATAJHOCLA0714@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 617),
('1130672785', 1, 'Leidy Carina', 'Morales Serrato', '0000-00-00', 'Nulo', '3137250571', 'KARINA1587@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 385),
('1130673063', 1, 'July Vivian', 'Cruz Salinas', '0000-00-00', 'Nulo', '3185197371', 'juvicsa07@hotamil.com', 'egresado', 'Nulo', 0, 'Nulo', '', 698),
('1130673878', 1, 'Leydy Yuliana', 'Sailema Suarez', '0000-00-00', 'Nulo', '3177354390', 'ladysailema@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 761),
('1130674158', 1, 'Johan Rocardo', 'Lozano Ocampo', '0000-00-00', 'Nulo', '3137985644', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1551),
('1130674654', 1, 'Fabian Mauricio', 'Erazo Preciado', '0000-00-00', 'Nulo', '3166681870', 'FMERAZO@AUTOCEIBA.COM.CO', 'inactivo', 'Nulo', 0, 'Nulo', '', 548),
('1130676253', 1, 'Luz Karime', 'Bastidas Alvarez', '0000-00-00', 'Nulo', '3234152590', 'karimealvarez@outlook.com', 'egresado', 'Nulo', 0, 'Nulo', '', 87),
('1130678315', 1, 'Gloria Consuelo', 'Trochez Gonzalez', '0000-00-00', 'Nulo', '3166933976', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1479),
('1130678425', 1, 'Claudia Patricia', 'Gomez Salinas', '0000-00-00', 'Nulo', '3166410733', 'ER@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 609),
('1130679524', 1, 'Victor Hugo', 'Salamanca Galvez', '0000-00-00', 'Nulo', '3186195349', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 979),
('1130680996', 1, 'Leidy', 'Leon Imbol', '0000-00-00', 'Nulo', '3166968119', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1746),
('1130682024', 1, 'Estepany', 'Toro Gutierrez', '0000-00-00', 'Nulo', '3117412462', 'stefanny-0527@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 769),
('1130682793', 1, 'Diana marcela', 'Gordillo Rosales', '0000-00-00', 'Nulo', '3046685328', 'rosalesgordillo@gmail.com', 'activo', 'Nulo', 0, 'Nulo', '', 887),
('1130682976', 1, 'Juan David', 'Sanchez Perez', '0000-00-00', 'Nulo', '3172966395', 'JUANCHO1907@HOTMAIL.ES', 'egresado', 'Nulo', 0, 'Nulo', '', 763),
('1130683802', 1, 'Yerson Andres', 'Zea Quintero', '0000-00-00', 'Nulo', '3147882700', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1466),
('1130683821', 1, 'Ivan Dario', 'Cortes Gomez', '0000-00-00', 'Nulo', '3015719656', 'S@S.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 596),
('1130945468', 1, 'Julieth', 'Cordoba Mu?os', '0000-00-00', 'Nulo', '3188053294', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1364),
('1130950344', 1, 'Mayra Alejandra', 'Hoyos Zu?iga', '0000-00-00', 'Nulo', '3045324485', 'MALEJA.H.Z@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 618),
('1130950906', 1, 'Juan Camilo', 'Zu?iga Mejia', '0000-00-00', 'Nulo', '3117152705', 'jcamilitoo@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 367),
('1136059644', 1, 'Jackeline', 'Agudelo Hernandez', '0000-00-00', 'Nulo', '3177972338', 'jacke88cristo@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 568),
('113665564', 1, 'Sulma Mireya', 'Santiesteban Arboleda', '0000-00-00', 'Nulo', '3218070940', 'smsantiesteban@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 807),
('1140421585', 1, 'Gabriela de jesus', 'Oliveros Torrealba', '0000-00-00', 'Nulo', '3237606414', 'djoliveros94@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 819),
('1140879402', 1, 'Cristhian David', 'Ramos Balanta', '0000-00-00', 'Nulo', '3043771078', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1472),
('11411154749', 1, 'Camilo', 'Melendez', '0000-00-00', 'Nulo', '3505602019', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1071),
('114176566', 1, 'Faisury Andrea ', 'Rendon Valencia', '0000-00-00', 'Nulo', '3043976523', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1414),
('1143459401', 1, 'Betsy Milena', 'Maza Garcia', '0000-00-00', 'Nulo', '3004486295', 'betsymaza@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 867),
('1143809250', 1, 'Monica', 'Ospita Bastidas', '0000-00-00', 'Nulo', '3105478820', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 962),
('1143826018', 1, 'Cory Greis', 'Epia Sanchez', '0000-00-00', 'Nulo', '3113834655', 'KORE.Y.89@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'DOBLE TITULACION', '', 116),
('1143826090', 1, 'Paola Andrea ', 'Iles Garcia', '0000-00-00', 'Nulo', '3136004062', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1452),
('1143826305', 1, 'Sandra', 'Candamil Ortiz', '0000-00-00', 'Nulo', '3128283777', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1629),
('1143826509', 1, 'Maria del Pilar', 'Borrego Amaya', '0000-00-00', 'Nulo', '3215395935', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1533),
('1143827424', 1, 'Faisury', 'Andazury Rodriguez', '0000-00-00', 'Nulo', '3053575360', 'FAISURYAR@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 571),
('1143828026', 1, 'Victoria  Eugenia ', 'Alvarez Restrepo', '0000-00-00', 'Nulo', '3147510335', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1344),
('1143828794', 1, 'Eliana ', 'Escobar Sanchez', '0000-00-00', 'Nulo', '3146724702', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1703),
('1143829904', 1, 'Mayra Alejandra', 'Londo?o Herrera', '0000-00-00', 'Nulo', '3163899924', 'alejandra211@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 144),
('1143830613', 1, 'William Andres', 'Ordo?ez Santamaria', '0000-00-00', 'Nulo', '3146725932', 'WORDONEZ1527@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 555),
('1143830819', 1, 'Bryan', 'Jimenez Calambas', '0000-00-00', 'Nulo', '3153294527', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1558),
('1143832202', 1, 'Yuli Andrea', 'Tobar Perez', '0000-00-00', 'Nulo', '3166639512', 'Yulyandreatobar@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 246);
INSERT INTO `estudiantes` (`estudiantes_no_documento`, `estudiantes_tipo_documento`, `estudiantes_nombre`, `estudiantes_apellidos`, `estudiantes_fecha_nacimiento`, `estudiantes_genero`, `estudiantes_telefono`, `estudiantes_correo`, `estudiantes_estado`, `estudiantes_direccion`, `estudiantes_adjunto_id`, `estudiantes_observaciones`, `estudiantes_doble_titulacion`, `estudiantes_doble_titulacion_id`) VALUES
('1143832506', 1, 'Katherine', 'Tenorio Arce', '0000-00-00', 'Nulo', '3188975758', 'katherinearce@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 463),
('1143833728', 1, 'Erika Julieth', 'Vargas Martinez', '0000-00-00', 'Nulo', '3146427338', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1654),
('1143834373', 1, 'Faber Humberto', 'Ledesma Achicue', '0000-00-00', 'Nulo', '3205077064', 'faberledesma@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 722),
('1143835191', 1, 'Daniel Enriquez ', 'Ordo?ez Arce', '0000-00-00', 'Nulo', '3155645236', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1531),
('1143835978', 1, 'Diana Vanessa', 'Medina Collazos', '0000-00-00', 'Nulo', '3002150583', 'DIANAMEDINA1505@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 673),
('1143836678', 1, 'Veronica', 'Pillimue Valdes', '0000-00-00', 'Nulo', '3188389978', 'verovaldez91@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 640),
('1143836985', 1, 'Carlos Mario', 'Silva Rivera', '0000-00-00', 'Nulo', '3152670619', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1487),
('1143837671', 1, 'Yeraldin', 'Gutierrez Higidio', '0000-00-00', 'Nulo', '3228763190', 'GERALDING14@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 296),
('114383768', 1, 'Maria Delpilar', 'Lopez Aroca', '0000-00-00', 'Nulo', '3136383968', 'MM@HTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 402),
('1143837686', 1, 'Maria del Pilar', 'Lopez Aroca', '0000-00-00', 'Nulo', '3136383968', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1382),
('1143838187', 1, 'Jonathan', 'Castro', '0000-00-00', 'Nulo', '3157968219', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1595),
('1143838466', 1, 'Didier Arley', 'Ramirez Montes', '0000-00-00', 'Nulo', '3136798632', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1163),
('1143838913', 1, 'Kevin Keith', 'Moreno Hincapie', '0000-00-00', 'Nulo', '3146779952', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1187),
('1143838973', 1, 'Evelyn Xiomara', 'Rodriguez Pachon', '0000-00-00', 'Nulo', '3217574640', 'evelynxiomara18@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 652),
('1143839411', 1, 'Leydy Yuliel', 'Burbano Samboni', '0000-00-00', 'Nulo', '3166190308', 'leidy.burbano@outlook.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 260),
('1143839629', 1, 'Lizeth Dahian', 'Pe?a Salazar', '0000-00-00', 'Nulo', '3147340236', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 996),
('1143839664', 1, 'Johana Marcela', 'Alzate Ijaji', '0000-00-00', 'Nulo', '3113584712', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1231),
('1143840378', 1, 'Luz Angela', 'Agudelo Casilimas', '0000-00-00', 'Nulo', '3206437303', 'laykaagu5@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 75),
('1143840433', 1, 'Jhon Alexander', 'Ibarguen Asprilla', '0000-00-00', 'Nulo', '3003792357', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1722),
('1143840612', 1, 'Johana', 'Achinte Leidy', '0000-00-00', 'Nulo', '3128861339', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1201),
('1143840816', 1, 'Sebastian ', 'Bautista Arenas', '0000-00-00', 'Nulo', '3188584357', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1431),
('1143841059', 1, 'Estefania', 'Saray Rodriguez', '0000-00-00', 'Nulo', '3167545792', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1445),
('1143841076', 1, 'Deiby Ferney', 'Mosca Lizcano', '0000-00-00', 'Nulo', '3158909076', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1540),
('1143841935', 1, 'Vanessa', 'Guizado Renteria', '0000-00-00', 'Nulo', '3184144372', 'VANEX_0412@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 614),
('1143844628', 1, 'Paola Andrea', 'Hoyos Quilindo', '0000-00-00', 'Nulo', '3128627936', 'pao927@hotmail.es', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 796),
('1143845157', 1, 'Luis Eduardo', 'Criollo Millan', '0000-00-00', 'Nulo', '3187122527', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1614),
('1143845523', 1, 'Yerson Andres', 'Torijano Colorado', '0000-00-00', 'Nulo', '3173817814', 'yerson.torijano@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 768),
('1143845865', 1, 'Cesar Augusto', 'Ciceri Camacho', '0000-00-00', 'Nulo', '3142447341', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1620),
('1143845934', 1, 'Alejandra ', 'Chavez Brenda', '0000-00-00', 'Nulo', '3148526167', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1598),
('1143846335', 1, 'Jeimi Ximena', 'Trochez Cuero', '0000-00-00', 'Nulo', '3117842043', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1756),
('1143846693', 1, 'Jefferson', 'Bravo Carabali', '0000-00-00', 'Nulo', '3218537933', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1165),
('1143847659', 1, 'Angelica Alejandra', 'Hernandez Parra', '0000-00-00', 'Nulo', '3183447346', 'NAHLEJA93@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 23),
('1143847779', 1, 'Jorge Hernan', 'Zorrilla Chamorro', '0000-00-00', 'Nulo', '3104635600', 'JORGHERNAN93@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 221),
('1143847941', 1, 'Christian Camilo ', 'Cifuentes Orozco', '0000-00-00', 'Nulo', '3152441254', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1618),
('1143849958', 1, 'Valdes Carvajal', 'Cristian Stiven', '0000-00-00', 'Nulo', '3174749781', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1477),
('1143850012', 1, 'Anny Gissell', 'Barona Tabares', '0000-00-00', 'Nulo', '3146778143', 'nanisbarona@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 525),
('1143850037', 1, 'Angelica Maria', 'Aragon gonzalez', '0000-00-00', 'Nulo', '3054308209', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1023),
('1143850261', 1, 'Cristian Fabian', 'Rodriguez Valencia', '0000-00-00', 'Nulo', '3166823923', 'crisdkapac@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 895),
('1143850495', 1, 'Paula Andrea', 'Grajales Garzon', '0000-00-00', 'Nulo', '3166246886', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1374),
('1143850978', 1, 'Daniela Marcela', 'Na?ez Mendez', '0000-00-00', 'Nulo', '3154002430', 'danielanamen@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 736),
('1143851574', 1, 'Laura Marcela', 'Cabrera Anaya', '0000-00-00', 'Nulo', '3207658660', 'marcela.c1493@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 829),
('1143851910', 1, 'Nicholls', 'Lopez Ortegon', '0000-00-00', 'Nulo', '3045319780', 'nichollslopez@outlok.es', 'egresado', 'Nulo', 0, 'Nulo', '', 57),
('1143852510', 1, 'Magaly', 'Perdomo Mu?oz', '0000-00-00', 'Nulo', '3163721578', 'LOORENAPERDOMO@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 238),
('1143852910', 1, 'Ortegon Nicholes', 'Lopez ', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1070),
('1143854229', 1, 'Jhoanna ', 'Muriele Henao', '0000-00-00', 'Nulo', '3183335767', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1424),
('1143854344', 1, 'Hellen', 'Marin Hernandez', '0000-00-00', 'Nulo', '3157448978', 'HELLEN_MARINH@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 384),
('1143854482', 1, 'Lina Rocio', 'Arias Mejia', '0000-00-00', 'Nulo', '3133388383', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1158),
('1143854871', 1, 'Paola Andrea', 'Florez Bola?os', '0000-00-00', 'Nulo', '3003977859', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1168),
('1143855972', 1, 'Pino Laura', 'Pino Laura', '0000-00-00', 'Nulo', '3108248369', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1585),
('1143856401', 1, 'Rommel Hernan', 'Cadena Criollo', '0000-00-00', 'Nulo', '3145969040', 'romel-cadena2235@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 94),
('1143857405', 1, 'Marlyn Jiseth', 'Mina Casanova', '0000-00-00', 'Nulo', '3176173419', 'marcita03@hotmail.es', 'egresado', 'Nulo', 0, 'DOBLE TITULACION', '', 25),
('1143858408', 1, 'Jennifer Patricia', 'Hoyos Ocampo', '0000-00-00', 'Nulo', '3157509671', 'JENNIFER.HOYOS1143@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 446),
('1143858589', 1, 'Natalia', 'Sandoval Vasquez', '0000-00-00', 'Nulo', '3017838760', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1050),
('1143858879', 1, 'Setefhania', 'Ca?as', '0000-00-00', 'Nulo', '3217251657', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1194),
('1143859237', 1, 'Ruby Esmeralda', 'Fonseca Bastidas', '0000-00-00', 'Nulo', '3225571380', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 965),
('1143859603', 1, 'Wilson', 'Avila Chacon', '0000-00-00', 'Nulo', '3188537693', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1155),
('1143861337', 1, 'Claudia  Yurany', 'Hurtado Monta?o', '0000-00-00', 'Nulo', '3219222052', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1241),
('1143861369', 1, 'Felipe ', 'Rodriguez Andres', '0000-00-00', 'Nulo', '3127570094', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1287),
('1143862134', 1, 'Marlen Lorena', 'Salazar Ortega', '0000-00-00', 'Nulo', '3207907689', 'skarlethcardona26@hotmai.com', 'egresado', 'Nulo', 0, 'Nulo', '', 806),
('1143862885', 1, 'Brayan Camilo', 'Perez Rosero', '0000-00-00', 'Nulo', '3185980600', 'bryan-131@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 388),
('1143862942', 1, 'Cristian Andres', 'Navia Ordo?ez', '0000-00-00', 'Nulo', '3136507940', 'CRISTIANAVIA222@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 164),
('1143863083', 1, 'Carlos Andres', 'Cervantes Erazo', '0000-00-00', 'Nulo', '3225223216', 'monicaaep67@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 482),
('1143863516', 1, 'Kelly Jhoana', 'Mu?oz Luna', '0000-00-00', 'Nulo', '3106440501', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1752),
('1143864655', 1, 'Anyi Yiced', 'Gaviria Verdugo', '0000-00-00', 'Nulo', '3054427830', 'ANGIEGAVIRIA2495@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 122),
('1143864981', 1, 'Vicky Alexandra ', 'Quiroga Guzman', '0000-00-00', 'Nulo', '3155151968', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1300),
('1143865042', 1, 'Jose Andres', 'Ibarra Mamian', '0000-00-00', 'Nulo', '3133263212', 'JEFE023MAESTRO@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 24),
('1143865951', 1, 'Lina Marcela', 'Espinosa Cardenas', '0000-00-00', 'Nulo', '3167529868', 'linamarcelaespinosa@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 401),
('1143866014', 1, 'Briyeth Jakeline', 'Eraso Llalles', '0000-00-00', 'Nulo', '3187391908', 'brillierazo@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 22),
('1143866544', 1, 'Juliana', 'Casta?o Giraldo', '0000-00-00', 'Nulo', '3146064555', 'julianacastano6544@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 267),
('1143866699', 1, 'Aniyulied', 'Feria Cabas', '0000-00-00', 'Nulo', '3182723889', 'ANNIEFERIAC96@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 228),
('1143866935', 1, 'Natalia', 'Berrio Gonzalez', '0000-00-00', 'Nulo', '3214729537', 'NATI.BERRIO96@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 371),
('1143867081', 1, 'Nathaly', 'Palau Casta?eda', '0000-00-00', 'Nulo', '3103269292', 'natapalau96@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 830),
('1143867609', 1, 'Narlyn Xiomara', 'Marin Rojas', '0000-00-00', 'Nulo', '3136351852', 'NARLYNXIOMARA2906@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 451),
('1143868813', 1, 'Anlly Paola', 'Arce Restrepo', '0000-00-00', 'Nulo', '3145926481', 'angieteamo_1026@hotmail.com', 'inactivo', 'Nulo', 0, 'DEBE DERECHOS DE GRADOS', '', 19),
('1143869837', 1, 'Peniel Antonio', 'Pe?a Marin', '0000-00-00', 'Nulo', '3162275034', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1175),
('1143870647', 1, 'Angie Meliza', 'Mu?oz Narvaez', '0000-00-00', 'Nulo', '3148860399', 'meli-meli2827@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 328),
('1143873496', 1, 'Camilo Andres', 'Gonzalez Rosero', '0000-00-00', 'Nulo', '3168111719', 'CA-MILO48B@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 486),
('1143873598', 1, 'Juan David', 'Gonzalez Galeano', '0000-00-00', 'Nulo', '3165443410', 'GONZALES142010@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 293),
('1143873692', 1, 'Zulit', 'Betancourt', '0000-00-00', 'Nulo', '3168878029', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1252),
('1143873785', 1, 'Tatiana', 'Guzman Mu?oz', '0000-00-00', 'Nulo', '3182370579', 'TATIANAAJ2013@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 488),
('1143874052', 1, 'Yeimy Marley ', 'Casta?eda Caballero', '0000-00-00', 'Nulo', '3115699163', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1134),
('1143874910', 1, 'Luz Alejandra', 'Figueroa Vente', '0000-00-00', 'Nulo', '3213209439', 'LUZALEJANDRA20FIGUEROA@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 438),
('11438755813', 1, 'Juan Camilo ', 'Rivero Guzman', '0000-00-00', 'Nulo', '3117760023', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1083),
('1143875813', 1, 'Juan Camilo', 'Rivero Guzman', '0000-00-00', 'Nulo', '3117760023', 'juankr2110@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 68),
('1143876937', 1, 'Kimberlyn', 'Ramirez Villareal', '0000-00-00', 'Nulo', '3227056831', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1144),
('1143877249', 1, 'Luana Milagros', 'Epia Sanchez', '0000-00-00', 'Nulo', '3206302970', 'lumiepsa2199@hotmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION', '', 6),
('1143877322', 1, 'Juan Esteban', 'Alvarez Solis', '0000-00-00', 'Nulo', '3012615711', 'jesteban2192@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 834),
('1143878515', 1, 'Valentina', 'Mu?oz Gomez', '0000-00-00', 'Nulo', '3106348520', 'valentinamg290599@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 327),
('1143879869', 1, 'Lopez Marilin', 'Santacruz ', '0000-00-00', 'Nulo', '3137159785', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1564),
('11438832156', 1, 'Blanca Nercy', 'Solarte Navia', '0000-00-00', 'Nulo', '3165376303', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1683),
('1143890244', 1, 'Lesly Niyiba', 'Izquierdo Escobar', '0000-00-00', 'Nulo', '3506431193', 'LESLI.USC@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 513),
('1143925410', 1, 'John Andres', 'Cano Diaz', '0000-00-00', 'Nulo', '3185570354', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1775),
('1143925579', 1, 'Diana Lorena', 'Balanta Riascos', '0000-00-00', 'Nulo', '3158571298', 'dianalorenabr@hotmail.com', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 257),
('1143926208', 1, 'Jennifer Julieth', 'Jordan Dagua', '0000-00-00', 'Nulo', '3116300790', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1116),
('1143926644', 1, 'Llarlen Rut', 'Huila Ruiz', '0000-00-00', 'Nulo', '3935945', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1726),
('1143927192', 1, 'Jennifer', 'Angulo Bermudez', '0000-00-00', 'Nulo', '3172192637', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1619),
('1143927991', 1, 'Leidy Johanna', 'Lier Gaso', '0000-00-00', 'Nulo', '3108935309', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 981),
('1143928306', 1, 'Edwin Fernando', 'Restrepo Monsalve', '0000-00-00', 'Nulo', '3042356693', 'edwinrestrepo2409@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 894),
('1143928737', 1, 'Stefany', 'Escudero Cabuyales', '0000-00-00', 'Nulo', '3163552108', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1368),
('1143930361', 1, 'Paula Andrea', 'Potes Buitrago', '0000-00-00', 'Nulo', '3155566965', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1679),
('1143931534', 1, 'Carmen Alicia ', 'Dulcey Lucio', '0000-00-00', 'Nulo', '3147764202', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1661),
('1143932194', 1, 'Brian Stevent', 'Hurtado Popo', '0000-00-00', 'Nulo', '3153037308', 'notiene@notiene.com', 'egresado', 'Nulo', 0, 'Nulo', '', 53),
('1143932238', 1, 'Yuly Andrea', 'Nieva Gomez', '0000-00-00', 'Nulo', '3184027655', 'andrea002@hotmail.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 634),
('1143932880', 1, 'Lizeth Viviana', 'Morostoque Rodriguez', '0000-00-00', 'Nulo', '3164636549', 'lizz.20@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 159),
('1143933937', 1, 'Nohemy Marcela', 'Cortes Escobar', '0000-00-00', 'Nulo', '3117749692', 'marcelacortes759@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 697),
('1143934098', 1, 'Gina Dayana', 'Qui?ones Garcia', '0000-00-00', 'Nulo', '3147665542', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1118),
('1143935043', 1, 'Anggie Vanessa ', 'Abadia Miana', '0000-00-00', 'Nulo', '3162471372', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1653),
('1143935652', 1, 'Eidel Andres', 'Martinez Lasso', '0000-00-00', 'Nulo', '3213633895', 'eidel1990@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 313),
('1143935769', 1, 'Yuly Stella', 'Rengifo Torres', '0000-00-00', 'Nulo', '3116663608', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1212),
('1143935775', 1, 'Stefanny', 'Cardona Sanchez', '0000-00-00', 'Nulo', '3148007609', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1638),
('1143935870', 1, 'Yeraldin', 'Angulo Qui?onez', '0000-00-00', 'Nulo', '3185948542', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1345),
('1143936021', 1, 'Sandra Liliana', 'Ceballos Aguado', '0000-00-00', 'Nulo', '3166839009', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1644),
('1143936318', 1, 'Mayerlyn', 'Ararart Ballesteros', '0000-00-00', 'Nulo', '3006687493', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 978),
('1143937608', 1, 'Paola Andrea ', 'Balanta Riascos', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1694),
('1143937755', 1, 'Johana ', 'Garcia Leidy', '0000-00-00', 'Nulo', '3182933812', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1262),
('1143937861', 1, 'Edwin', 'Cuella Sanchez', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1612),
('1143938044', 1, 'Jhonn Anderson', 'Manrique Velasquez', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1548),
('1143939649', 1, 'Jessica Dayana', 'Qui?onez Garcia', '0000-00-00', 'Nulo', '3215913623', 'DAYAN1215@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 181),
('1143940045', 1, 'Angie Lizeth', 'Garcia Ceballos', '0000-00-00', 'Nulo', '3183891318', 'angielizgarcia0628@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 709),
('1143940912', 1, 'Cristian Mauricio', 'Tovar Hernandez', '0000-00-00', 'Nulo', '3153513900', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1485),
('1143941160', 1, 'Stephania Clelia', 'Alvarez Rivera', '0000-00-00', 'Nulo', '3103925572', 'stefannyalva16@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 679),
('1143941570', 1, 'Maria Angelica', 'Casta?eda Arias', '0000-00-00', 'Nulo', '3134880412', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1202),
('1143942091', 1, 'Fabiola ', 'Hrtado Obando', '0000-00-00', 'Nulo', '3137599048', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1709),
('1143942230', 1, 'Pasaje Diana', 'Pasaje Diana', '0000-00-00', 'Nulo', '3205451549', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1517),
('1143942829', 1, 'Maria Alejandra ', 'Aristizabal Ca?averal', '0000-00-00', 'Nulo', '3155383043', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1623),
('1143943855', 1, 'Erika Alejandra', 'Aguirre Orejuela', '0000-00-00', 'Nulo', '3053178764', 'ALEJITAGUIRRE25@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 536),
('1143945338', 1, 'Maira Alejandra', 'Casta?o Paredes', '0000-00-00', 'Nulo', '3166344479', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1006),
('1143945739', 1, 'Frnacy Johanna', 'Buitron Ortega', '0000-00-00', 'Nulo', '3128455162', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1624),
('1143945787', 1, 'Lina Maria', 'Diaz Gomez', '0000-00-00', 'Nulo', '3205372823', 'linamdiaz92@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 275),
('1143945896', 1, 'Leidy Viviana', 'Mosquera Lopez', '0000-00-00', 'Nulo', '3104313075', 'viviana__1993@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 675),
('1143946115', 1, 'Kevin', 'Tello Monta?o', '0000-00-00', 'Nulo', '3152947652', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1486),
('1143947736', 1, 'Yesica Fernanda', 'Ortega Montealegre', '0000-00-00', 'Nulo', '3176981629', 'YSIKA.ORTEGA@GMAIL.COM', 'egresado', 'Nulo', 0, 'DOBLE TITULACION', '', 170),
('1143947822', 1, 'Esteban Camilo', 'Orejuela Reyes', '0000-00-00', 'Nulo', '3057670286', 'orejuela01@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 237),
('1143948610', 1, 'Jhon Deiner', 'Casta?o Sanchez', '0000-00-00', 'Nulo', '3182987709', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1334),
('1143949561', 1, 'Gonzalez  Lina Rocio', 'Quintero ', '0000-00-00', 'Nulo', '3134271242', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1600),
('1143950585', 1, 'Francy Juliana ', 'Marin Carvajal', '0000-00-00', 'Nulo', '3216434770', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1715),
('1143950603', 1, 'Luz Mery', 'Trejos Tabares', '0000-00-00', 'Nulo', '3218950830', 'luztrejos92@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 810),
('11439512282', 1, 'Brayan ', 'Gomez Osorio', '0000-00-00', 'Nulo', '3154528346', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1074),
('1143951576', 1, 'Jennifer Andrea', 'Casta?o Colorado', '0000-00-00', 'Nulo', '3184286721', 'jennyferco@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 691),
('1143952450', 1, 'Erick Javier', 'Agudelo Vela', '0000-00-00', 'Nulo', '3233674277', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1283),
('1143952460', 1, 'Jennifer', 'Arango Papamija', '0000-00-00', 'Nulo', '3152388677', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1783),
('1143953508', 1, 'Yuri Paola', 'Cifuentes Quintero', '0000-00-00', 'Nulo', '3225303856', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1128),
('1143953551', 1, 'Yesica Lorena ', 'Botina Imbachi', '0000-00-00', 'Nulo', '3158059380', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1696),
('1143953905', 1, 'David Stiven', 'Ramirez Cortez', '0000-00-00', 'Nulo', '3206445133', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1285),
('1143954111', 1, 'Monica Alexandra', 'Lerma Ortiz', '0000-00-00', 'Nulo', '3186594273', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1126),
('1143954350', 1, 'Alexandra', 'Ocoro Ararat', '0000-00-00', 'Nulo', '3218538386', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1064),
('1143954628', 1, 'Carlos Andres ', 'Buitrago Luango', '0000-00-00', 'Nulo', '3153617727', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1353),
('1143954966', 1, 'Christian David', 'Herrera Viveros', '0000-00-00', 'Nulo', '3178506949', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1562),
('1143955464', 1, 'Carlos Andres', 'Quijano Manchola', '0000-00-00', 'Nulo', '3182338392', 'SPLATTERHAKU@OUTLOOK.ES', 'inactivo', 'Nulo', 0, 'Nulo', '', 424),
('1143958476', 1, 'Kelly Johana', 'Morales Morales', '0000-00-00', 'Nulo', '3168451881', 'johana.morales-92@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 730),
('1143958842', 1, 'Leidy Vanessa', 'Argote Porras', '0000-00-00', 'Nulo', '3187694254', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1164),
('1143958915', 1, 'Johanna ', 'Vidal Kelly', '0000-00-00', 'Nulo', '3172554283', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1280),
('1143959002', 1, 'Mary', 'Aragon Gonzalez', '0000-00-00', 'Nulo', '3117080190', 'MARII-GONZALES01@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 538),
('1143960167', 1, 'Diana Vanessa', 'Solarte Alban', '0000-00-00', 'Nulo', '3185110891', 'VANESSITA9307@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 202),
('1143962861', 1, 'Oscar Ivan', 'Franco Gomez', '0000-00-00', 'Nulo', '3197372297', 'OSCARFRANCO19942015@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 280),
('1143962965', 1, 'Claudia Patricia ', 'Jordan Montoya', '0000-00-00', 'Nulo', '3183964032', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1166),
('1143964612', 1, 'Leidy Paola', 'Ruiz Grisales', '0000-00-00', 'Nulo', '3182048373', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1029),
('1143964946', 1, 'Angie Tatiana', 'Casta?eda Cabrera', '0000-00-00', 'Nulo', '3135399111', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1732),
('1143965683', 1, 'Marlon Alexander', 'Vargas Castillo', '0000-00-00', 'Nulo', '3207943535', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1720),
('1143967938', 1, 'Angie Lizeth', 'Escobar ?a?ez', '0000-00-00', 'Nulo', '3188632355', 'angieescobar5513@hotmail.com', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 599),
('1143968753', 1, 'Liceth', 'Gomez Agudelo', '0000-00-00', 'Nulo', '3146498981', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1532),
('1143969735', 1, 'Lina Marcela', 'Bravo Caicedo', '0000-00-00', 'Nulo', '3222185692', 'NASLISOFIA11@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 92),
('1143970894', 1, 'Jahnnie Faisury', 'Espa?a Caicedo', '0000-00-00', 'Nulo', '3177223588', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1271),
('1143970914', 1, 'Ingrid Stephania', 'Gamboa Vasquez', '0000-00-00', 'Nulo', '3207913580', 'ISGB0106@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 229),
('1143972745', 1, 'Bryan David', 'Ma?unga Villa', '0000-00-00', 'Nulo', '3176641461', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1087),
('1143973052', 1, 'Yasmin', 'Escudero Sonia', '0000-00-00', 'Nulo', '3186681430', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1456),
('1143973759', 1, 'Maria Isabel', 'Leon Rivera', '0000-00-00', 'Nulo', '3156800659', 'isa-leon@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 842),
('1143973993', 1, 'Jhoana Katherine', 'Roldan Monta?o', '0000-00-00', 'Nulo', '3023268690', 'ABIGAIRROLDAN610@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 756),
('1143974728', 1, 'Dallana Mildred', 'Castiblanco Trujillo', '0000-00-00', 'Nulo', '3113811990', 'CHETHO1995@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 668),
('1143975015', 1, 'Lina Marcela', 'Rojas Rojas', '0000-00-00', 'Nulo', '3125569134', 'jslmrbebe1206@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 461),
('1143977243', 1, 'Brayan Stiven', 'Angulo Tunja', '0000-00-00', 'Nulo', '3156301084', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1782),
('1143977384', 1, 'Leidy Marcela', 'Maca Sanchez', '0000-00-00', 'Nulo', '3188429387', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1243),
('1143981253', 1, 'Karen Alejandra', 'Mottoa Nu?ez', '0000-00-00', 'Nulo', '3162864230', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1674),
('1143981254', 1, 'Lucero Esstefan', 'Taborda Martinez', '0000-00-00', 'Nulo', '3187244017', 'NOOO@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 205),
('1143981364', 1, 'Jhon Alexander', 'Castro Lemos', '0000-00-00', 'Nulo', '3154998558', 'castrojhon004@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 374),
('1143981555', 1, 'Cortes Alejandra', 'Cortes Alejandra', '0000-00-00', 'Nulo', '3172373797', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1476),
('1143981871', 1, 'Ashly Mariel', 'Bravo Villaquiran', '0000-00-00', 'Nulo', '3155726865', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1214),
('1143982349', 1, 'Kelly Johana', 'Paniquita Pelaez', '0000-00-00', 'Nulo', '3183890750', 'MANIQITA21@HOTMAIL.ES', 'inactivo', 'Nulo', 0, 'Nulo', '', 459),
('1143983108', 1, 'Deyson David', 'Delgado Rivera', '0000-00-00', 'Nulo', '3043719545', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1258),
('1143983662', 1, 'Marlen Dayana', 'Moreno Asprilla', '0000-00-00', 'Nulo', '3192686927', 'MDMORENO26@MISENA.EDU.CO', 'inactivo', 'Nulo', 0, 'Nulo', '', 158),
('1143987016', 1, 'Miguel Angel', 'Garcia Restrepo', '0000-00-00', 'Nulo', '3104066405', 'angelgarcia098712@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 284),
('1143990169', 1, 'Gladis Rocio', 'Chicaisa Trujillo', '0000-00-00', 'Nulo', '3215902114', 'jaramillo.199816@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 433),
('1143992282', 1, 'Brayan Estiben', 'Gomez Osorio', '0000-00-00', 'Nulo', '3154928346', 'B.9805296@GMAIL.COM', 'egresado', 'Nulo', 0, 'DOBLE TITULACION', '', 124),
('1143992309', 1, 'Cinthia Dayana', 'Caicedo Carmona', '0000-00-00', 'Nulo', '3127526085', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1130),
('1143992414', 1, 'Maria Antonia', 'Portocarrero Angulo', '0000-00-00', 'Nulo', '3233412387', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1135),
('1143993471', 1, 'Daniela', 'Ramirez Ladino', '0000-00-00', 'Nulo', '3174862200', 'danielaraladino@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 184),
('1143994649', 1, 'Brayan David', 'Salazar Toro', '0000-00-00', 'Nulo', '3235304354', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1115),
('1143995025', 1, 'Natalia', 'Duarte Marulanda', '0000-00-00', 'Nulo', '3152760609', 'naaty09duarte@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 527),
('1143995993', 1, 'Isabella', 'Martinez Alarcon', '0000-00-00', 'Nulo', '3016035888', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1453),
('1143996121', 1, 'Juan Pablo', 'Bravo Gonzalez', '0000-00-00', 'Nulo', '3162381920', 'juanpbg832@gamil.com', 'egresado', 'Nulo', 0, 'Nulo', '', 583),
('1143996474', 1, 'Maria Camila', 'Vergara Aristizabal', '0000-00-00', 'Nulo', '3007775102', 'camilaVA0630@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 521),
('1144019187', 1, 'Dahiana Andrea', 'Mamian Aguirre', '0000-00-00', 'Nulo', '3156336589', 'dahicar2714@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 448),
('1144024244', 1, 'Yamile', 'Dipaz Hernandez', '0000-00-00', 'Nulo', '3183433139', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1090),
('1144025538', 1, 'Liceth Katerine', 'Colorado Cuero', '0000-00-00', 'Nulo', '3148288156', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1748),
('1144025746', 1, 'Andres Felipe ', 'Cepeda Velasquez', '0000-00-00', 'Nulo', '3176880503', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1362),
('1144025804', 1, 'Jasmin Juliana ', 'Calle Molina', '0000-00-00', 'Nulo', '3166285017', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1507),
('1144026509', 1, 'Danna Marcela', 'Lopez Rivillas', '0000-00-00', 'Nulo', '3176537812', 'DANNA.LOPEZ@GIROSYFINANZAS.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 626),
('1144027304', 1, 'Nohra Mirian', 'Gutierrez Zapata', '0000-00-00', 'Nulo', '3175045502', 'NOHRAGUTIERREZZ89@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 550),
('1144027328', 1, 'Steven Alberto', 'Rivera Garcia', '0000-00-00', 'Nulo', '3163847992', 'DJNOTBAT@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 648),
('1144027573', 1, 'July Angelica', 'Rivera Lopez', '0000-00-00', 'Nulo', '3178208291', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1771),
('1144027950', 1, 'Gloria Aydee', 'Zapata Fiscal', '0000-00-00', 'Nulo', '3152855072', 'gloriz19989@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 220),
('1144028029', 1, 'Oneyda', 'Casta?o Sanchez', '0000-00-00', 'Nulo', '3736284', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1744),
('1144028446', 1, 'Cristhian Mateo', 'Perdomo Bohada', '0000-00-00', 'Nulo', '3192905143', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1034),
('1144028731', 1, 'Manuel', 'Marin Gonzalez', '0000-00-00', 'Nulo', '3103672602', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1197),
('1144032042', 1, 'Katerin', 'Saucedo Salazar', '0000-00-00', 'Nulo', '3218998891', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1250),
('1144032058', 1, 'Tatiana', 'Vanegas Zorilla', '0000-00-00', 'Nulo', '3014520795', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1109),
('1144033919', 1, 'Carlos Fernando', 'Perez Betancourt', '0000-00-00', 'Nulo', '3146050304', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1513),
('1144033935', 1, 'Juan Pablo', 'Marin Navarro', '0000-00-00', 'Nulo', '3182218581', 'juan1390@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 449),
('1144033980', 1, 'Christian Julian', 'Gue Cravajal', '0000-00-00', 'Nulo', '3178102069', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1375),
('1144034256', 1, 'Javier Mauricio', '?a?ez Arias', '0000-00-00', 'Nulo', '3137643340', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1534),
('1144034895', 1, 'Esteban', 'Ramirez Penilla', '0000-00-00', 'Nulo', '3182481391', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1735),
('1144035043', 1, 'Katherin Marisol', 'Granada Garcia', '0000-00-00', 'Nulo', '3162244566', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 966),
('1144035536', 1, 'Ana Milena', 'Orozco Charria', '0000-00-00', 'Nulo', '3172166550', 'anita9524@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 636),
('1144036288', 1, 'Dahiana', 'Brand Bola?os', '0000-00-00', 'Nulo', '3184329990', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1179),
('1144037103', 1, 'Margie Julieth', 'Soto Pedroza', '0000-00-00', 'Nulo', '3174304281', 'margiesoto@cced.edu.ci', 'egresado', 'Nulo', 0, 'Nulo', '', 824),
('1144038452', 1, 'Cristhian Andres', 'Bravo Castillo', '0000-00-00', 'Nulo', '3157104388', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1555),
('1144038571', 1, 'Yohana', 'Lamos Alape', '0000-00-00', 'Nulo', '3173305518', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1170),
('1144039329', 1, 'Paola Andrea ', 'Getial Alvarez', '0000-00-00', 'Nulo', '3128898217', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1664),
('1144040941', 1, 'Brigith Lizeth', 'Mafla Claros', '0000-00-00', 'Nulo', '3104757102', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1741),
('1144041544', 1, 'Samir', 'Calderon Rodriguez', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1630),
('1144042062', 1, 'Aura Lucia', 'Getial Mayang', '0000-00-00', 'Nulo', '3128552740', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1312),
('1144042332', 1, 'Carlos Alfredo', 'Zu?iga Astudillo', '0000-00-00', 'Nulo', '3196093266', 'nomo1077@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 664),
('1144043661', 1, 'Paola Andrea ', 'Buitrago Sanchez', '0000-00-00', 'Nulo', '3137692046', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1657),
('1144043841', 1, 'Cruz Cardenas Diana Lizeth', 'De La', '0000-00-00', 'Nulo', '3107385863', 'n@n.com', 'egresado', 'Nulo', 0, 'Nulo', '', 274),
('1144044208', 1, 'Katheryn  Johanna', 'Cachimbo Posada', '0000-00-00', 'Nulo', '3154514199', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1626),
('1144044448', 1, 'Junior', 'Qui?onez Hector', '0000-00-00', 'Nulo', '3174811641', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1505),
('1144045878', 1, 'Rafael Ricardo', 'Restrepo Mendoza', '0000-00-00', 'Nulo', '3006838240', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1500),
('1144046129', 1, 'Jonathan', 'Plaza Hurtado', '0000-00-00', 'Nulo', '3148894589', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1510),
('1144046811', 1, 'Michael Javier', 'Garcia Botero', '0000-00-00', 'Nulo', '3183199648', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1605),
('1144047107', 1, 'Maribel', 'Aristizabal Diaz', '0000-00-00', 'Nulo', '3002736415', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1784),
('1144047255', 1, ' Jenifer', 'Ceron Cardenas', '0000-00-00', 'Nulo', '3217751703', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1219),
('1144047566', 1, 'Ricardo', 'Arambulo Marin', '0000-00-00', 'Nulo', '3166377728', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1346),
('1144047638', 1, 'Zuleima ', 'Martinez Casta?o', '0000-00-00', 'Nulo', '3164778625', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1716),
('1144047971', 1, 'Wilmar', 'Calvo Portilla', '0000-00-00', 'Nulo', '3054047222', 'WILMAR412@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 431),
('1144048704', 1, 'Yurani', 'Marin Osorio', '0000-00-00', 'Nulo', '3157870158', 'yurigat10@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 450),
('1144049451', 1, 'Claudia Xiomara', 'Pechene Tunubala', '0000-00-00', 'Nulo', '3117143545', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1676),
('1144049583', 1, 'Jessica', 'Agudelo Vela', '0000-00-00', 'Nulo', '3114161563', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1140),
('1144049738', 1, 'Yeraldin', 'Torres Ocampo', '0000-00-00', 'Nulo', '3137618695', 'jhoanna8432@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 359),
('1144050450', 1, 'Samuel', 'Garcia Ordo?ez', '0000-00-00', 'Nulo', '3178952853', 'sgarcia@icesi.edu.co', 'egresado', 'Nulo', 0, 'Nulo', '', 603),
('1144051202', 1, 'Jhon Anderson', 'Sanza Pillimue', '0000-00-00', 'Nulo', '3128537268', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1489),
('1144051473', 1, 'Carlos Andres', 'Londo?o Parra', '0000-00-00', 'Nulo', '3128364262', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1556),
('1144051563', 1, 'Andres Daniel', 'Celis Velasco', '0000-00-00', 'Nulo', '3178418254', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1182),
('1144052685', 1, 'Martha Lucia', 'Obando Mu?oz', '0000-00-00', 'Nulo', '3154537399', 'MARTIKAOBANDO1718@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 165),
('1144053012', 1, 'Mauricio', 'Gonzalez Iquira', '0000-00-00', 'Nulo', '3176810971', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1450),
('1144053024', 1, 'Yesica Alejandra', 'Ceballos Cata?o', '0000-00-00', 'Nulo', '3106751930', 'asesor809@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 907),
('1144053257', 1, 'Leydi Katherine', 'Enriques Hurtado', '0000-00-00', 'Nulo', '3134438385', 'LADYKATHE92@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 227),
('1144053275', 1, 'Juan Sebastian', 'Monta?a Roncacion', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1145),
('1144054011', 1, 'Myra Alejandra ', 'Gamboa Ortiz', '0000-00-00', 'Nulo', '3167364287', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1370),
('1144054620', 1, 'John Byron', 'Oviedo Noguera', '0000-00-00', 'Nulo', '3217251028', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1173),
('1144055610', 1, 'Miguel Angel', 'Sanchez Quintero', '0000-00-00', 'Nulo', '3046854290', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1147),
('1144055665', 1, 'Maria', 'Orjuela Aurora', '0000-00-00', 'Nulo', '3203044462', 'kata-1029@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 493),
('1144056204', 1, 'Kelly Tatiana', 'Montenegro Pasos', '0000-00-00', 'Nulo', '3155226239', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1154),
('1144056669', 1, 'Erika', 'Castro Mesa', '0000-00-00', 'Nulo', '3113950188', 'erika-2729@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 103),
('1144056688', 1, 'Milton Alberto', 'Zapata Guerrero', '0000-00-00', 'Nulo', '3164942823', 'tomyguerrero08@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 73),
('1144057759', 1, 'Sandra Lorena', 'Ramos Serna', '0000-00-00', 'Nulo', '3124613117', 'LORENA-R7@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 240),
('1144058216', 1, 'Lizeth Katherine', 'Proa?os Mera', '0000-00-00', 'Nulo', '3217982507', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1196),
('1144058905', 1, 'Alexander', 'Gil Sinisterra', '0000-00-00', 'Nulo', '3113238713', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1570),
('1144062032', 1, 'Andrea', 'Ariza Jessica', '0000-00-00', 'Nulo', '3176943657', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1152),
('1144062689', 1, ' Isabel Carolina', 'Alarcon Serna', '0000-00-00', 'Nulo', '3185198176', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1341),
('1144063200', 1, 'Dayan Andrea ', 'Ocampo Zuleta', '0000-00-00', 'Nulo', '3170871793', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1394),
('1144063303', 1, 'Jennifer', 'Martinez Jimenez', '0000-00-00', 'Nulo', '3197286317', 'JLO_2727@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 724),
('1144066095', 1, 'Jairo', 'Espa?a Hernadez', '0000-00-00', 'Nulo', '3173062316', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1474),
('1144066445', 1, 'Estrella Lucia', 'Arcila Duque', '0000-00-00', 'Nulo', '3003997877', 'ESTRELLITADULCE2@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 574),
('1144066714', 1, 'Stefany', 'Alvarez Rengifo', '0000-00-00', 'Nulo', '3147211149', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1161),
('1144067242', 1, 'Vanessa', 'Henao Diaz', '0000-00-00', 'Nulo', '3128788429', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1737),
('1144067270', 1, 'Milton Mauriciio', 'Muriel Maca', '0000-00-00', 'Nulo', '3155007724', 'mauricio1661@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 162),
('1144067338', 1, 'Sharon Andrea', 'Quintero Tangarife', '0000-00-00', 'Nulo', '3182308792', 'sharonqh2014@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 337),
('1144068077', 1, 'Stephania', 'Ospina Arce', '0000-00-00', 'Nulo', '3166219531', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1125),
('1144068262', 1, 'Juliana', 'Leon Derly', '0000-00-00', 'Nulo', '3205470712', 'aaa@aaa.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 309),
('1144068508', 1, 'Ana Maria', 'Jimenez Muriel', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1276),
('1144069223', 1, 'Ingrid Carolina', 'Rangel Tabares', '0000-00-00', 'Nulo', '3212211647', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 941),
('1144071003', 1, 'Carolina', 'Serna Becoche', '0000-00-00', 'Nulo', '3126474413', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 999),
('1144071344', 1, 'Kelly Johana', 'Moreno Mendez', '0000-00-00', 'Nulo', '3122991355', 'JOHANA_MORENO5@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 674),
('1144071855', 1, 'Brian Steven', 'Rodriguez Benavides', '0000-00-00', 'Nulo', '3182793880', 'BRIAN.07181994@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 241),
('1144072312', 1, 'Jorge Humberto', 'Huertas Rodriguez', '0000-00-00', 'Nulo', '3218560503', 'jorgehhrodriguez@gmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION', '', 10),
('1144072733', 1, 'Maryury Elizabeth', 'Pineda Lopez', '0000-00-00', 'Nulo', '3057170701', 'MARYU0820@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 748),
('1144073902', 1, ' Michel Andrea', 'Mosquera Ramirez', '0000-00-00', 'Nulo', '3105552470', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1447),
('1144074304', 1, 'Jose Luis', 'Moreno Andrade', '0000-00-00', 'Nulo', '3732663', 'JOSELUISMORENOANDRADE@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 324),
('1144074445', 1, 'Bryan Steven ', 'Osorio Casta?o', '0000-00-00', 'Nulo', '3166742132', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1435),
('1144074746', 1, 'Carlos Julio', 'Varela Pe?a', '0000-00-00', 'Nulo', '3176733102', 'CARLOVARELA318@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 215),
('1144075719', 1, 'Katerin', 'Urbano Mueller', '0000-00-00', 'Nulo', '3153038493', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1736),
('1144076264', 1, 'Jhordany', 'Mu?oz Vidal', '0000-00-00', 'Nulo', '3182201441', 'jhordany1994m.v@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 734),
('1144076874', 1, 'Juan Pablo', 'Murillo Serna', '0000-00-00', 'Nulo', '3173823265', 'jpablomserna@hotmail.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 457),
('1144076979', 1, 'Jesus Ferney', 'Casta?o Muriel', '0000-00-00', 'Nulo', '3167829230', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1308),
('1144077046', 1, 'Mayra Alejandra', 'Rojas Cruz', '0000-00-00', 'Nulo', '3137256445', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1459),
('1144078051', 1, 'Juan Sebastian', 'Tabares Varela', '0000-00-00', 'Nulo', '3154506801', 'HH@HH.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 658),
('1144079162', 1, 'Jhon Alexander', 'Gomez Bambague', '0000-00-00', 'Nulo', '3188109437', 'alexander5435@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 123),
('1144082013', 1, 'Nathalia', 'Lasso', '0000-00-00', 'Nulo', '3172139607', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1584),
('1144083225', 1, 'Mayerly Alexandra', 'Guevara Cuchimba', '0000-00-00', 'Nulo', '3128911223', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1099),
('1144083390', 1, 'Diana Marcela', 'Velazquez Mamian', '0000-00-00', 'Nulo', '3168433711', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1108),
('1144083456', 1, 'Katerin Yulieth', 'Mazabuel Moriones', '0000-00-00', 'Nulo', '3175516482', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1306),
('1144086259', 1, 'Daniela', 'Garcia Renteria', '0000-00-00', 'Nulo', '3145543583', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1322),
('1144086999', 1, 'Cristian Camilo', 'Gil Urrea', '0000-00-00', 'Nulo', '3007777647', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 977),
('1144088015', 1, 'Paola Andrea', 'Chara Ambuila', '0000-00-00', 'Nulo', '3136302638', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1759),
('1144090435', 1, 'Angie Milena', 'Ampudia Ordo?ez', '0000-00-00', 'Nulo', '3043471405', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1239),
('1144091279', 1, 'Vanessa', 'Jaramillo Bastidas', '0000-00-00', 'Nulo', '3186298295', 'NOTIENENCONOCIMIENTODELCO@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 621),
('1144091862', 1, 'John Alexander ', 'Aguirre Rodriguez', '0000-00-00', 'Nulo', '3177240142', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1333),
('1144092572', 1, 'Diana Carolina', 'Molina Anturi', '0000-00-00', 'Nulo', '314 3299845', 'dianacarolinamolina69@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 890),
('1144093303', 1, 'John Jairo', 'Luna Mu?oz', '0000-00-00', 'Nulo', '3117768152', 'SERGIOBELTRAN98@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 146),
('1144093775', 1, 'Ruber Hernan', 'Chilito Joaqui', '0000-00-00', 'Nulo', '3216562507', 'CHILITORUBER2014@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 225),
('1144094371', 1, 'Luz Angela', 'Agredo Rivera', '0000-00-00', 'Nulo', '3177135875', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1065),
('1144094404', 1, 'Juan Jose', 'Moreno Jimenez', '0000-00-00', 'Nulo', '3217536461', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1100),
('1144094511', 1, 'Jhon Fredy', 'Parra Ramirez', '0000-00-00', 'Nulo', '3104193908', 'jhonparra1996@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 173),
('1144096184', 1, 'Daniela', 'Azcarate Henao', '0000-00-00', 'Nulo', '3225400996', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1112),
('1144096770', 1, 'Daniel', 'Mercado Piedrahita', '0000-00-00', 'Nulo', '3158347730', 'DANIELMERCADO18@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 152),
('1144098555', 1, 'Alejandro', 'Quintero Rodriguez', '0000-00-00', 'Nulo', '3213160124', 'GIROQR@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 65),
('1144098766', 1, 'Daniela Alejandra', 'Gomez Barona', '0000-00-00', 'Nulo', '3164867026', 'gomezlab.b@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 289),
('1144099058', 1, 'Brand David', 'Gomez Molano', '0000-00-00', 'Nulo', '3233555720', 'BRAND.GOMEZM@OUTLOOK.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 291),
('1144099242', 1, 'Dayana Alejandra', 'Sabogal Pati?o', '0000-00-00', 'Nulo', '3219945992', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1156),
('1144100621', 1, 'Dayana', 'Rodriquez Duque', '0000-00-00', 'Nulo', '3225901916', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1205),
('1144101097', 1, 'Diana Alexandra', 'Tutistar Soto', '0000-00-00', 'Nulo', '3125788331', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 937),
('1144101543', 1, 'Ana Maria', 'Gonzalez Arenas', '0000-00-00', 'Nulo', '3175456120', 'anitamariag1998@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 126),
('1144102445', 1, 'Yesennia', 'Caicedo Perea', '0000-00-00', 'Nulo', '3216386378', 'priss598@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 478),
('1144104886', 1, 'Lina Maria', 'Pantoja Castillo', '0000-00-00', 'Nulo', '3226055036', 'linapantoja143@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 892),
('1144105142', 1, 'Nicolas', 'Escobar Lozano', '0000-00-00', 'Nulo', '3108365697', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1245),
('1144106160', 1, 'Mayte Yesenia', 'Abello Casta?o', '0000-00-00', 'Nulo', '3182807634', 'MAY-ABE99@OUTLOOK.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 785),
('1144106288', 1, 'Karen Vanessa', 'Gil Jaramillo', '0000-00-00', 'Nulo', '3017534696', 'karengil2315@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 440),
('1144106372', 1, 'Lina Marcela', 'Grajales Sanchez', '0000-00-00', 'Nulo', '3007505375/3235', 'grajelesmaecela99@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 716),
('1144107136', 1, 'Daniela Valentina', 'Montilla Fernandez', '0000-00-00', 'Nulo', '3235213278', 'DANIVALEN424@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 156),
('1144108462', 1, 'Jonathan', 'Velasquez Vargas', '0000-00-00', 'Nulo', '3004863625', 'JONATHANV84@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 216),
('1144109244', 1, 'Julisa', 'Yotumbo Martinez', '0000-00-00', 'Nulo', '3163026802', 'yulizamartin99@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 813),
('1144109695', 1, 'Jefry Fernando', 'Daza Hortua', '0000-00-00', 'Nulo', '3148030081', 'JEFFRYCARVAJAL141999@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 484),
('1144110239', 1, 'Andres Felipe', 'Giraldo Camacho', '0000-00-00', 'Nulo', '3155412298', 'andres854bmx@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 468),
('1144124111', 1, 'Adriana Esther', 'Serna Garcia', '0000-00-00', 'Nulo', '3183560842', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 967),
('114412446', 1, 'Elizabeth', 'Toro Toro', '0000-00-00', 'Nulo', '3016365675', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1001),
('1144124776', 1, 'Lina Marcela', 'Encarnacion Tovar', '0000-00-00', 'Nulo', '3173728813', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 980),
('1144125499', 1, 'Jennifer', 'Rodriguez Gil', '0000-00-00', 'Nulo', '3184033508', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1754),
('1144128584', 1, 'Leidy Tatiana ', 'Torres Grajales', '0000-00-00', 'Nulo', '3178317558', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1685),
('1144128838', 1, 'Jennifer Julieth', 'Jimenez Botina', '0000-00-00', 'Nulo', '3128419965', 'yiyi8927@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 305),
('1144129146', 1, 'Andres Felipe', 'Soto Osorio', '0000-00-00', 'Nulo', '3164081779', 'inventarios@gamaquim.com.co', 'egresado', 'Nulo', 0, 'Nulo', '', 355),
('1144129235', 1, 'Leidy Viviana', 'Bravo Gonzalez', '0000-00-00', 'Nulo', '3182103250', 'leidy_bravo@cced.edu.co', 'egresado', 'Nulo', 0, 'Nulo', '', 584),
('1144129284', 1, 'Carlos Andres', 'Quintero Pacheco', '0000-00-00', 'Nulo', '3103936147', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1747),
('1144129899', 1, 'Mitchel Andrea', 'Lopez Quintero', '0000-00-00', 'Nulo', '3174720603', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1384),
('1144130060', 1, 'Carolina', 'Leon Gonzalez', '0000-00-00', 'Nulo', '3148278235', 'leoncarolina200@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 623),
('1144130357', 1, 'Alvaro Javier', 'Gutierrez Rodriguez', '0000-00-00', 'Nulo', '31483953542', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1603),
('1144130364', 1, 'Francy Viviana ', 'Zuluaga Hernandez', '0000-00-00', 'Nulo', '3122408165', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1261),
('1144130382', 1, 'Nataly', 'Abril Mosquera', '0000-00-00', 'Nulo', '3158793845', 'NATA_LY_13@HORTMAIL.ES', 'inactivo', 'Nulo', 0, 'Nulo', '', 74),
('1144130433', 1, 'Diego Fernando', 'Gutierrez Taborda', '0000-00-00', 'Nulo', '3155083632', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1377),
('1144131351', 1, ' Dennys Lorena', 'Moreno Cortes', '0000-00-00', 'Nulo', '3156001591', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1389),
('1144131912', 1, 'Yina Marcela', 'Amezquita Lemos', '0000-00-00', 'Nulo', '3173679389', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1769),
('1144131914', 1, 'Angie Nicole', 'Medina Maca', '0000-00-00', 'Nulo', '3147409512', 'ANMEDINAMACA89@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 727),
('1144133273', 1, 'Marilyn Andrea', 'Gonzalez Jimenez', '0000-00-00', 'Nulo', '3117766169', 'GLAXO8915@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 612),
('1144133315', 1, 'Debbie Vanessa', 'Guzman Perez', '0000-00-00', 'Nulo', '3228816177', 'GUZMANDEBBIEJJ@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 137),
('1144133710', 1, 'Jorge Leonardo', 'Pe?a Gracia', '0000-00-00', 'Nulo', '3167147348', 'LEONARDO259@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 557);
INSERT INTO `estudiantes` (`estudiantes_no_documento`, `estudiantes_tipo_documento`, `estudiantes_nombre`, `estudiantes_apellidos`, `estudiantes_fecha_nacimiento`, `estudiantes_genero`, `estudiantes_telefono`, `estudiantes_correo`, `estudiantes_estado`, `estudiantes_direccion`, `estudiantes_adjunto_id`, `estudiantes_observaciones`, `estudiantes_doble_titulacion`, `estudiantes_doble_titulacion_id`) VALUES
('1144135117', 1, 'Bryan', 'Vasquez Ramirez', '0000-00-00', 'Nulo', '3137186551', 'bryanr198905@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 783),
('1144135555', 1, 'Wilson Armando', 'Nieva Caicedo', '0000-00-00', 'Nulo', '3165632234', 'WILSON.WANC.WN@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 633),
('1144136384', 1, 'Vanessa', 'Valencia Varela', '0000-00-00', 'Nulo', '3118033327', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1410),
('1144136546', 1, 'Marcela', 'Fernanadez Mayorga', '0000-00-00', 'Nulo', '3128018174', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1369),
('1144137553', 1, 'Diego Leon', 'Sanchez Lozada', '0000-00-00', 'Nulo', '3162806037', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1491),
('1144137984', 1, 'Stephany', 'Hinestroza Guerra', '0000-00-00', 'Nulo', '3143718583', 'NANYANDFELI@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 300),
('1144138613', 1, 'Elisabeth', 'Alvarez Ruiz', '0000-00-00', 'Nulo', '3128552916', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1777),
('1144138982', 1, 'Maria ', 'Paz Angelica', '0000-00-00', 'Nulo', '3206288907', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1547),
('1144139797', 1, 'Enlly Lorena', 'Ochoa Murillo', '0000-00-00', 'Nulo', '3136514944', 'U@U.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 738),
('1144140021', 1, 'Catherine', 'Bedoya Sandoval', '0000-00-00', 'Nulo', '3153519316', 'antmon1712@hotmail.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 88),
('1144140091', 1, 'Eylen Rocio', 'Diago Rubio', '0000-00-00', 'Nulo', '3012231129', 'eylendiago07@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 702),
('1144140834', 1, 'Aura Maria', 'Hernandez Perea', '0000-00-00', 'Nulo', '3217081857', 'asistenteproducccionemporium@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 140),
('1144142208', 1, 'John Edinson', 'Mendez Lopez', '0000-00-00', 'Nulo', '3187873256', 'jhonmendez1990@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 318),
('1144144676', 1, 'Yuly Vanessa', 'Lopez Mu?oz', '0000-00-00', 'Nulo', '3207754973', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1714),
('1144144693', 1, 'Yesika Andrea', 'Ariza Vargas', '0000-00-00', 'Nulo', '3117865787', 'OEGR1130@GMIAL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 83),
('1144145009', 1, 'Leslie Tatiana', 'Trivi?o Sanchez', '0000-00-00', 'Nulo', '3135111811', 'TATIANASDJP@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 69),
('1144145426', 1, 'Maria Lizeth', 'Martinez Lopez', '0000-00-00', 'Nulo', '3163883898', 'marialisetmartinezl@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 629),
('1144145628', 1, 'Marinela', 'Guerrero Molina', '0000-00-00', 'Nulo', '3165316375', 'maguemo227@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 52),
('1144146468', 1, 'Jury Esmeralda', 'Londo?o Cruz', '0000-00-00', 'Nulo', '3166686876', 'JURY0918@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 671),
('1144147752', 1, 'Nilton', 'Cuenca Echeverry', '0000-00-00', 'Nulo', '3182056474', 'NILTON.CUENCA@CORREOUNIVALLE.EDU.CO', 'egresado', 'Nulo', 0, 'Nulo', '', 35),
('1144147842', 1, 'Carlos Andres', 'Rodriguez Camayo', '0000-00-00', 'Nulo', '3157739356', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1200),
('1144148897', 1, 'Darly', 'Estupi?an Toloza', '0000-00-00', 'Nulo', '3122470943', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1662),
('1144149054', 1, ' Vivian Andrea', 'Collazos Cobo', '0000-00-00', 'Nulo', '315276446', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1363),
('1144149910', 1, 'Lina Maria', 'Madrid Pardo', '0000-00-00', 'Nulo', '3225382298', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 944),
('1144150033', 1, 'Claudia Marcela', 'Rubio Chavez', '0000-00-00', 'Nulo', '3017196658', 'claudia_rubio_19@hotmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION', '', 32),
('1144150136', 1, 'Suyi', 'Ponce Perdomo', '0000-00-00', 'Nulo', '3188175709', 'SUYIPONCE@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 390),
('1144151244', 1, 'Dayan Andrea ', 'Castillo Arboleda', '0000-00-00', 'Nulo', '3158016117', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1359),
('1144151978', 1, 'Andrea Stephania', 'Salinas Garcia', '0000-00-00', 'Nulo', '3104331805', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1739),
('1144152674', 1, 'Millan Ana Carolina ', 'Londo?o ', '0000-00-00', 'Nulo', '3113621226', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1712),
('1144153018', 1, 'Erika Victoria', 'Velasquez Sterling', '0000-00-00', 'Nulo', '3187946804', 'erika-9115@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 774),
('1144153070', 1, 'Diana Cecilia', 'Diaz Cepedes', '0000-00-00', 'Nulo', '3163351549', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1650),
('1144153146', 1, 'Maryurley', 'Meneses Buesaquillo', '0000-00-00', 'Nulo', '3128173878', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1387),
('1144153423', 1, 'Diego Alejandro', 'Perafan Rosero', '0000-00-00', 'Nulo', '3104563268', 'DIEGOPERAFAN@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 386),
('1144153683', 1, 'Christian Eduardo', 'Portilla Hurtado', '0000-00-00', 'Nulo', '3007898366', 'portillacristian5@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 642),
('1144154051', 1, 'Ingrid', 'Alfonso Rodriguez', '0000-00-00', 'Nulo', '3158330277', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1449),
('1144154749', 1, 'Andres Camilo', 'Melendez Cancimanci', '0000-00-00', 'Nulo', '3122719881', 'camilo-501@hotmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 150),
('1144154854', 1, 'Yesica Lorena', 'Aristizabal Giraldo', '0000-00-00', 'Nulo', '3147116589', 'YESIARISTI@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 254),
('1144154913', 1, 'Andrea Stefania', 'Potosi Paz', '0000-00-00', 'Nulo', '3168265173', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1032),
('1144155538', 1, 'Adli Maritza ', 'Villa Vargas', '0000-00-00', 'Nulo', '3178368136', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1688),
('1144156153', 1, 'Lina Marcela ', 'Carvajal Ospina', '0000-00-00', 'Nulo', '3113858146', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1699),
('1144156598', 1, ' Lizeth', 'Ortiz Trivi?o', '0000-00-00', 'Nulo', '3158432811', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1226),
('1144156705', 1, 'Nayibe Andrea', 'Mosquera Ramirez', '0000-00-00', 'Nulo', '3128934903', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1537),
('1144157886', 1, 'Yessika', 'Roncancio Rios', '0000-00-00', 'Nulo', '3117271944', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1402),
('1144158118', 1, 'Luis Ariel', 'Ortega Quijano', '0000-00-00', 'Nulo', '3128492038', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1733),
('1144158722', 1, 'Eduin', 'Preciado Cortes', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1508),
('1144158771', 1, 'Yury Vanessa', 'Agudelo Castro', '0000-00-00', 'Nulo', '3506170304', 'yuryv9004@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 678),
('1144158981', 1, 'William', 'Lopez Rodriuguez', '0000-00-00', 'Nulo', '3183788582', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1040),
('1144159314', 1, 'Lizeth Andrea', 'Mondragon Vanegas', '0000-00-00', 'Nulo', '3177632294', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1038),
('1144159708', 1, 'Diana Katherin', 'Vargas Tamayo', '0000-00-00', 'Nulo', '3183917418', 'antemisa_9223@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 362),
('1144161085', 1, 'Johana Milena', 'Lizarazo Lievano', '0000-00-00', 'Nulo', '3183207812', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1255),
('1144161270', 1, 'Andrea ', 'Coy Arias', '0000-00-00', 'Nulo', '3178492603', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1702),
('1144161377', 1, 'Marxin Jomaly', 'Valencia Murillo', '0000-00-00', 'Nulo', '3187041388', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1686),
('1144162545', 1, 'David Eduardo', 'Lopez Morales', '0000-00-00', 'Nulo', '3117616455', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1554),
('1144162959', 1, 'Steven', 'Triana Barrios', '0000-00-00', 'Nulo', '3188502271', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1481),
('1144163191', 1, 'Jennifer', 'Vega Ceron', '0000-00-00', 'Nulo', '3014064169', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1146),
('1144163319', 1, 'Ingrid Tatiana ', 'Guevara Jimenez', '0000-00-00', 'Nulo', '3105168918', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1454),
('1144163708', 1, 'Kevin Andrey', 'Londo?o Candado', '0000-00-00', 'Nulo', '3158996076', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1104),
('1144163868', 1, 'Michael Antonio', 'Llamosa Herrera', '0000-00-00', 'Nulo', '3105093675', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1550),
('1144164156', 1, 'Jessica Alejandra ', 'Meneses Vitery', '0000-00-00', 'Nulo', '3113590905', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1672),
('1144165064', 1, 'Nathalia ', 'Lora Medina', '0000-00-00', 'Nulo', '3155072500', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1671),
('1144166120', 1, 'William', 'Toro Jaramillo', '0000-00-00', 'Nulo', '3165202394', 'williamtoro1993@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 209),
('1144166211', 1, 'Erik Steven', 'Caicedo Serna', '0000-00-00', 'Nulo', '3146725860', 'ERIKSERNA0941@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 585),
('1144167099', 1, 'William', 'Cardona Cobo', '0000-00-00', 'Nulo', '3152686171', 'WILLIAMCOBOCARDONA@GAMIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 546),
('1144167210', 1, 'Andres Felipe', 'Rivera Acosta', '0000-00-00', 'Nulo', '3127550047', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1651),
('1144167330', 1, 'Gustavo Adolfo', 'Gironza Duran', '0000-00-00', 'Nulo', '3105414273', 'gustavocr7@outlook.com', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 288),
('1144167686', 1, 'Marisol', 'Rodriguez Bedoya', '0000-00-00', 'Nulo', '3235214036', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1030),
('1144167904', 1, 'Maria Fernanda', 'Gomez Salinas', '0000-00-00', 'Nulo', '3146841538', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1567),
('1144168494', 1, 'Jeisson', 'Carabali Perea', '0000-00-00', 'Nulo', '3207593765', 'jeisson19931@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 545),
('1144168777', 1, 'Claudia Karina', 'Izquierdo Zuluaga', '0000-00-00', 'Nulo', '3158577563', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1172),
('1144168793', 1, 'Eblix Giselle', 'Zambrano Linda', '0000-00-00', 'Nulo', '3206909329', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1193),
('1144169605', 1, 'Crhistian Eduardo', 'Ituyan Casta?o', '0000-00-00', 'Nulo', '3164158082', 'cristianituyan14@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 304),
('1144170013', 1, 'Brayan Orlando', 'Gonzalez Martinez', '0000-00-00', 'Nulo', '3164940568', 'br_serio@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 715),
('1144170280', 1, 'Yeison Alirio', 'Perea Qui?onez', '0000-00-00', 'Nulo', '3182296860', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1514),
('1144171633', 1, 'Paola Andrea', 'Silva Cuetia', '0000-00-00', 'Nulo', '3183701025', 'pauguerrero10@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 881),
('1144171915', 1, 'Jhon Alejandro', 'Sabogal Meneses', '0000-00-00', 'Nulo', '3185827068', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1137),
('1144172251', 1, 'Edison Andres', 'Mi?o Londo?o', '0000-00-00', 'Nulo', '3174765226', 'ANDRSS.LO@OUTLOOK.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 321),
('1144173103', 1, 'Ingrid Lorena', 'Camacho Jimenez', '0000-00-00', 'Nulo', '3054205637', 'miloreverde2@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 586),
('1144173332', 1, 'Yeniffer', 'Monta?o Obando', '0000-00-00', 'Nulo', '3207143605', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1753),
('1144173806', 1, 'Miguel Angel', 'Agredo Betancourt', '0000-00-00', 'Nulo', '3182203618', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1776),
('1144173970', 1, 'Luz Viviana', 'Criollo Holguin', '0000-00-00', 'Nulo', '3175885255', 'LUZVIVICRIOLLA1994@GMAIL.COM', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 109),
('1144174281', 1, 'Bladimir Edeheiver', 'Alvarez Solarte', '0000-00-00', 'Nulo', '3234938737', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1131),
('1144174526', 1, 'Alejandra', 'Cardona Martinez', '0000-00-00', 'Nulo', '3168667191', 'alejandracm9304@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 99),
('1144174961', 1, 'Angiee Lizeth', 'Lotero Gonzalez', '0000-00-00', 'Nulo', '3057528501', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 945),
('1144176400', 1, 'Alejandra', 'Rojas Echeverri', '0000-00-00', 'Nulo', '3117137234', 'alejandra.rojas0509@outlook.com', 'egresado', 'Nulo', 0, 'Nulo', '', 805),
('1144176802', 1, 'Jeidy Alejandra', 'Quijano Cortes', '0000-00-00', 'Nulo', '3146072019', 'JEIDYQUIJANO@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 750),
('1144176901', 1, 'Lina Marcela', 'Viera Prado', '0000-00-00', 'Nulo', '3023187209', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1110),
('1144177117', 1, 'Angie Viviana', 'Becerra Lopez', '0000-00-00', 'Nulo', '3169816922', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1268),
('1144178434', 1, 'Anyela Patricia', 'Barona Ambuila', '0000-00-00', 'Nulo', '3207516705', 'pati742-@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 578),
('1144178899', 1, 'Leyda Victoria', 'Arenas Mendoza', '0000-00-00', 'Nulo', '3163451189', 'VICTORIAMENDOZA1911@GMIAL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 576),
('1144179694', 1, 'Jennifer', 'Vasquez Chacon', '0000-00-00', 'Nulo', '31223022229', 'jennifervasquezch@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 70),
('1144180023', 1, 'Angie Lizeth', 'Villarreal Chimunja', '0000-00-00', 'Nulo', '3117121557', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1184),
('1144180945', 1, 'Dania Paola', 'Barreiro Daza', '0000-00-00', 'Nulo', '3152686914', 'dania0160@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 526),
('1144181053', 1, 'Chisthian Fernando', 'Ospina Males', '0000-00-00', 'Nulo', '3183823050', 'cristian_ospina1994@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 333),
('1144181331', 1, 'Katerine', 'Osorio Espinosa', '0000-00-00', 'Nulo', '3172990104', 'kespinosaosorio@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 172),
('1144181579', 1, 'James', 'Casta?eda', '0000-00-00', 'Nulo', '3012307208', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1222),
('1144181970', 1, 'Jhonathan', 'Morales Bedoya', '0000-00-00', 'Nulo', '3012307208', 'j_nathan1127@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 27),
('1144182513', 1, 'Cristian Javier', 'Guerrero Aguirre', '0000-00-00', 'Nulo', '3116280067', 'merlyguerrero4@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 862),
('1144183262', 1, 'Gina Lizette', 'Riascos Murillo', '0000-00-00', 'Nulo', '3166460117', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1021),
('1144183808', 1, 'Catherine', 'Acosta Leidy', '0000-00-00', 'Nulo', '3154161733', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1066),
('1144183917', 1, 'Luiza Fernanda', 'Joaqui Torres', '0000-00-00', 'Nulo', '3206368832', 'FER.TORRRES@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 56),
('1144184519', 1, ' Yuri  Nathalia', 'Artega Casta?o', '0000-00-00', 'Nulo', '3162484076', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1089),
('1144184608', 1, 'Mauricio Antonio', 'Acosta Urbano', '0000-00-00', 'Nulo', '3178944907', 'maoacosta01@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 250),
('1144185155', 1, 'David', 'Gonzalez Montero', '0000-00-00', 'Nulo', '3132677015', 'DAVIDLYRICS10@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 510),
('1144185724', 1, 'Jose Freddy', 'Payan Caicedo', '0000-00-00', 'Nulo', '3156446750', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1062),
('1144186111', 1, 'Daniela ', 'Galindez Gomez', '0000-00-00', 'Nulo', '3126770171', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1462),
('1144187732', 1, 'Julian', 'Jimenez Cajigas', '0000-00-00', 'Nulo', '3154211971', 'julianguti21@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 55),
('1144189041', 1, 'Stephany', 'Ponce Perdomo', '0000-00-00', 'Nulo', '3152495080', 'STEPHANY.PONCE@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 336),
('1144190325', 1, 'Paola Andrea', 'Yepes Rincon', '0000-00-00', 'Nulo', '3168564927', 'paolayrincon@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 365),
('1144190482', 1, 'Sergio Alejandro', 'Lopez Ca?averal', '0000-00-00', 'Nulo', '3174558781', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1210),
('1144190550', 1, 'Armando', 'Ramirez Rafael', '0000-00-00', 'Nulo', '3225191848', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 933),
('1144192290', 1, 'Karen Johanna', 'Mosquera Yermanos', '0000-00-00', 'Nulo', '3014632389', 'b@b.com', 'egresado', 'Nulo', 0, 'Nulo', '', 161),
('1144192355', 1, 'Edwin Alberto', 'Rodriguez Melo', '0000-00-00', 'Nulo', '3127019193', 'edwin.r96@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 190),
('1144192438', 1, 'Jonathan ', 'Gallego Londo?o', '0000-00-00', 'Nulo', '3214623228', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1311),
('1144192518', 1, 'Anyi Daniela', 'Roman Paramo', '0000-00-00', 'Nulo', '3016071087', 'PRINCEROMAN.1996@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 518),
('1144194815', 1, 'Maria Jakeline', 'Mondragon Valero', '0000-00-00', 'Nulo', '3008593287', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1560),
('1144195360', 1, 'Stefany', 'Callejas Calderon', '0000-00-00', 'Nulo', '3104405378', 'STEFANYCALLEJASC@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 544),
('1144196001', 1, 'Geraldiny', 'Vanegas Gutierrez', '0000-00-00', 'Nulo', '3183877048', 'geraldiny211996@hotmail.es', 'egresado', 'Nulo', 0, 'Nulo', '', 214),
('1144196849', 1, 'Valencia David', 'Valencia David', '0000-00-00', 'Nulo', '3166870554', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1544),
('1144197473', 1, 'Ibon', 'Gisell Hernandez', '0000-00-00', 'Nulo', '3163907304', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1580),
('1144197596', 1, 'Maria Alejandra', 'Rodriguez Arbelaez', '0000-00-00', 'Nulo', '3113371715', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1068),
('1144198875', 1, 'Victor Alfonso', 'Sanchez Mesias', '0000-00-00', 'Nulo', '3116063191', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1120),
('1144198877', 1, 'Henry Javier', 'Zabala Raga', '0000-00-00', 'Nulo', '3148348191', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1123),
('1144198913', 1, 'Carolina', 'Perez', '0000-00-00', 'Nulo', '3135947691', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1051),
('1144199642', 1, 'Jaslhy Camila', 'Klinger Zapata', '0000-00-00', 'Nulo', '3194743911', 'jklingerzapata@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 307),
('1144201717', 1, 'Alvaro', 'Enrique Guzman', '0000-00-00', 'Nulo', '3182499815', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1423),
('1144201722', 1, 'Jhoan Sebastian', 'Carabali Barreiro', '0000-00-00', 'Nulo', '3160838676', 'jhoancarabali1997@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 859),
('1144202177', 1, 'Jessica Yulieth', 'Sanchez Suarez', '0000-00-00', 'Nulo', '3182880267', 'JESSCIAJULIETH_1997@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 197),
('1144203186', 1, 'Laura', 'Arbelaez Carvajal', '0000-00-00', 'Nulo', '3152075965', 'LAURA0812000@gmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 430),
('1144204801', 1, 'Sebastian', 'Martinez Bueno', '0000-00-00', 'Nulo', '3182450484', 'sebastian30@live.com', 'egresado', 'Nulo', 0, 'Nulo', '', 831),
('1144205635', 1, 'Tania Carolina', 'Chiran Realpe', '0000-00-00', 'Nulo', '3147766859', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1183),
('1144206039', 1, 'Sara Lucia', 'Amaya Murillo', '0000-00-00', 'Nulo', '3156075205', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1458),
('1144206053', 1, 'Juan Camilo ', 'Gil Velazco', '0000-00-00', 'Nulo', '3147387370', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1303),
('1144206564', 1, 'Yulieth', 'Restrepo Machado', '0000-00-00', 'Nulo', '3147903432', 'restrepo1998@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 340),
('1144206648', 1, 'Mitituy Jhon  Stiven', 'Vanegas ', '0000-00-00', 'Nulo', '3116875543', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1332),
('1144207326', 1, 'Gabriel Eduardo', 'Sierra Gutierrez', '0000-00-00', 'Nulo', '3187009194', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1249),
('1144209268', 1, 'Ivonne Alexandra', 'Murcia Bahamon', '0000-00-00', 'Nulo', '3175610038', 'ALEXANDRAMB2812@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 491),
('1144209601', 1, 'Maria Alejandra ', 'Cruz Mendoza', '0000-00-00', 'Nulo', '3135644701', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1247),
('1144209610', 1, 'Juan Pablo', 'Rojas Nieto', '0000-00-00', 'Nulo', '3188568833', 'LUISROJAS1907@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 460),
('1144209797', 1, 'Lizbeth Andrea', 'Hernandez Franco', '0000-00-00', 'Nulo', '3207981302', 'lizbeth19991@hotmail.com', 'inactivo', 'Nulo', 0, 'SE RETIRO', '', 139),
('1144209980', 1, 'Diego Andres ', 'Fernandez Gil', '0000-00-00', 'Nulo', '3138749277', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1591),
('1144210625', 1, 'Jarvi', 'Vallejo Collazos', '0000-00-00', 'Nulo', '3146681500', 'JAVIVALLEJO456@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 212),
('1144210998', 1, 'Kevin Andres', 'Tarquino Solarte', '0000-00-00', 'Nulo', '3178087312', 'KEVTARQUINO@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 206),
('1144213435', 1, 'Jhonier Alexander', 'Mosquera Daza', '0000-00-00', 'Nulo', '3184025873', 'JHONNIER7605@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 160),
('1144213455', 1, 'Jhoiner Alexander', 'Mosquera Daza', '0000-00-00', 'Nulo', '3184025873', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1082),
('1144213913', 1, 'Isabeli Cristina', 'Ramirez Villarreal', '0000-00-00', 'Nulo', '3183260615', 'isa14rv@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 475),
('1144213932', 1, 'Luis Carlos', 'Nari?o Gomez', '0000-00-00', 'Nulo', '3148665678', 'LUIS105SIEMPRE@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 492),
('1144746468', 1, 'Yuri Esmeralda', 'Londo?o Cruz', '0000-00-00', 'Nulo', '3166886876', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 928),
('1144994402', 1, 'Laura Valentina', 'Alvarado Gomez', '0000-00-00', 'Nulo', '3155976369', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1093),
('1148192095', 1, 'Eduar Jesid', 'Rivas Murillo', '0000-00-00', 'Nulo', '3114052010', 'V@V.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 754),
('1151457856', 1, 'Juan Jose', 'Campo Vega', '0000-00-00', 'Nulo', '3168632323', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1010),
('1151934864', 1, 'Malory', 'Serna Agredo', '0000-00-00', 'Nulo', '3185103386', 'MALORYSERNA@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 243),
('1151935678', 1, 'Douglas Javid', 'Cadavid Tangarife', '0000-00-00', 'Nulo', '3,13E+13', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1760),
('1151935806', 1, 'Brigiette Pamela ', 'Cortes Cortes', '0000-00-00', 'Nulo', '3184376527', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1465),
('1151936651', 1, 'Carlo Julio', 'Rodriguez Valenzuela', '0000-00-00', 'Nulo', '3184005416', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1497),
('1151939662', 1, 'Jennifer', 'Castrillon Echeverry', '0000-00-00', 'Nulo', '3016236349', 'jenifer.castrillon@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 590),
('1151939800', 1, 'Yury Marcela ', 'Cardona Gaviria', '0000-00-00', 'Nulo', '3127044832', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1635),
('1151939859', 1, 'Jennifer Jhoana', 'Betancourt Orozco', '0000-00-00', 'Nulo', '3043522627', 'jenniferbetancourt13@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 91),
('1151940853', 1, 'Anderson', 'Flor Manzano', '0000-00-00', 'Nulo', '3177380606', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1208),
('1151940888', 1, 'Jhonatan', 'Mu?oz Mu?oz', '0000-00-00', 'Nulo', '3107071480', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1232),
('1151942316', 1, 'Diana Marcela', 'Casta?o Cleves', '0000-00-00', 'Nulo', '3163518347', 'dianaygabriela2008@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 690),
('1151942758', 1, 'Marcela ', 'Cuellar Diana', '0000-00-00', 'Nulo', '3219595904', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1566),
('1151943293', 1, 'Jhonneison', 'Murillo Asprilla', '0000-00-00', 'Nulo', '3106863960', 'JHONSIMURILLO1208@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 631),
('1151943753', 1, 'Rodrigo', 'Becerra Cortes', '0000-00-00', 'Nulo', '3188153419', 'rodribecerra1540@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 685),
('1151943782', 1, 'Yeraldin Andrea', 'Valles Salazar', '0000-00-00', 'Nulo', '3116465476', 'ANDREAFAVALLESSALZAR@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 811),
('1151944437', 1, 'Maria Mirta', 'Tapia Benitez', '0000-00-00', 'Nulo', '3114517451', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1237),
('1151945840', 1, 'Luz Angelica', 'Laverde Muriel', '0000-00-00', 'Nulo', '3136523844', 'luza_lave@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 721),
('1151946461', 1, 'Estefania', 'Landazuri Mendez', '0000-00-00', 'Nulo', '3128310499', 'ESTEFANIALANDAZURYMENDEZ@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 308),
('1151947681', 1, 'Jorge Andres', 'Diaz Fernandez', '0000-00-00', 'Nulo', '3234834725', 'JORGEFER11.09@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 703),
('1151948866', 1, 'Hernandez Karen  Lorena ', 'Loboa ', '0000-00-00', 'Nulo', '3184969120', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1246),
('1151949980', 1, 'Lina Isabel', 'Delgado Buitrago', '0000-00-00', 'Nulo', '3156801542', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1648),
('1151952155', 1, 'Leidy Melisa', 'Arenas Botero', '0000-00-00', 'Nulo', '3225458137', 'leidy1316@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 81),
('1151952428', 1, 'Yesica Stefania', 'Pasquel Ceballos', '0000-00-00', 'Nulo', '3207035441', 'kimramirez501@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 175),
('1151952631', 1, 'Federico', 'Murillo Toro', '0000-00-00', 'Nulo', '3218537611', 'toro94251@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 632),
('1151953051', 1, 'Marilin', 'Cabrera', '0000-00-00', 'Nulo', '3178538532', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1008),
('1151954302', 1, 'Paola Andrea', 'Cortes Gutierres', '0000-00-00', 'Nulo', '3152979142', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1086),
('1151955700', 1, 'Cristhian Andres', 'Hurtado Salamanca', '0000-00-00', 'Nulo', '3158368917', 'cristhianandreshurtadosalamanca@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 54),
('1151956459', 1, 'Andres', 'Casta?o Londo?o', '0000-00-00', 'Nulo', '3107407701', 'PARIS.JOSHUA2411@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 224),
('1151960255', 1, 'Ange Dahiana', 'Buitrago Mendoza', '0000-00-00', 'Nulo', '3128945992', 'ange.buitrago.10@gmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION', '', 20),
('1151961151', 1, 'Luis David', 'Villaquiran Carvajal', '0000-00-00', 'Nulo', '3217360293', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1132),
('1151961356', 1, 'Jara Lisbeth', 'Hernandez Pineda', '0000-00-00', 'Nulo', '3145765443', 'd@d.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 443),
('1151961748', 1, 'Karol Viviana', 'Hurtado Salazar', '0000-00-00', 'Nulo', '3014383881', 'kvhz-16@outoolk.com', 'egresado', 'Nulo', 0, 'Nulo', '', 620),
('1151961886', 1, 'Gerardo Enrique', 'Cordoba Casta?eda', '0000-00-00', 'Nulo', '3122396103', 'gcordobacastaneda@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 272),
('1151963261', 1, 'Jhon Ancizar', ' Garcia', '0000-00-00', 'Nulo', '3128669504', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1211),
('1151963410', 1, 'Marcela', 'Vargas Correa', '0000-00-00', 'Nulo', '3127708749', 'MARCEVACO.12@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 782),
('1151964538', 1, 'Daniela', 'Guaspud Valencia', '0000-00-00', 'Nulo', '3147226442', 'VALENCIAGD@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 613),
('1151965806', 1, 'Lina Marcela', 'Zuluaga Quintero', '0000-00-00', 'Nulo', '3218009359', 'linamarcela0124@hotmail.com', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 663),
('1151968725', 1, 'Adriana Rocio', 'Ni?o Mu?oz', '0000-00-00', 'Nulo', '3103476812', 'adrirmn3112@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 330),
('1151968733', 1, 'Valentina', 'Hortua Zuleta', '0000-00-00', 'Nulo', '3006381512', 'hortua3199@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 301),
('1151968968', 1, 'Paula Andrea', 'Ocampo Lopez', '0000-00-00', 'Nulo', '3184748978', 'pauocampo99@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 166),
('1151970426', 1, 'Johan Sebastian', 'Lozada Tobon', '0000-00-00', 'Nulo', '3108400378', 'jslozada99@gmail.com', 'activo', 'Nulo', 0, 'Nulo', '', 888),
('1151970557', 1, 'Geraldine', 'Chaurra Urrea', '0000-00-00', 'Nulo', '3145597502', 'geraldinechaurra@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 106),
('1151970729', 1, 'Ingrid Lorena', 'Delgado Bellaiza', '0000-00-00', 'Nulo', '3184827998', 'ingriddelgado409@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 111),
('117816688', 1, 'Orfa Marcela ', 'Vargas Liscano', '0000-00-00', 'Nulo', '3113985045', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1412),
('1192761380', 1, 'Laura Carolay', 'Anaya Ceballos', '0000-00-00', 'Nulo', '3148092748', 'LAURAANAYA438@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 77),
('1192761426', 1, 'Nathalia', 'Grisales Mafla', '0000-00-00', 'Nulo', '3156498597', 'NAGRIMA1522@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 487),
('1192771500', 1, 'Isabella', 'Dominguez Valenzuela', '0000-00-00', 'Nulo', '3045367647', 'isabella.dom.val@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 276),
('1192771561', 1, 'Maryi Natalia', 'Piamba Galindo', '0000-00-00', 'Nulo', '3217264251', 'NOSELOSABEA@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 239),
('1192773447', 1, 'Brigit Marcela', 'Trujillo Posada', '0000-00-00', 'Nulo', '3122120804', 'BRIGITTRUJILLO@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 210),
('1192778703', 1, 'Carlos Andres', 'Estrada Escobar', '0000-00-00', 'Nulo', '3166552268', 'karlosandres21@hotmail.com', 'inactivo', 'Nulo', 0, 'PDT MODULOS Y PROYECTO', '', 437),
('1192780158', 1, 'Andres Steven', 'Ruiz Silva', '0000-00-00', 'Nulo', '3126887446', 'g@g.com', 'egresado', 'Nulo', 0, 'Nulo', '', 350),
('1192784512', 1, 'Astrid Carolina', 'Saldarriaga Rodallega', '0000-00-00', 'Nulo', '3024800209', 'lucysaldarriaga30@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 852),
('1192793357', 1, 'Nicolas', 'Cabrera Gomez', '0000-00-00', 'Nulo', '3216975167', 'nicolas2.00@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 261),
('1192804112', 1, 'Lina Daniela', 'Loaiza Torres', '0000-00-00', 'Nulo', '3104200157', 'linadanielaloaizatorres29@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 311),
('1192805014', 1, 'Vanessa', 'Tapasco Agudelo', '0000-00-00', 'Nulo', '3226357969', 'VANESATAPA28@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 245),
('1192817074', 1, 'Darlyn Daniela', 'Pati?o Orjuela', '0000-00-00', 'Nulo', '3022885404', 'DARLINGPATI06@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 335),
('1192907740', 2, 'Angie Daniela', 'Meneses Mu?oz', '0000-00-00', 'Nulo', '3226456984', 'angiemunoz2516@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 454),
('1192911696', 1, 'Bryan David', 'Valencia Caicedo', '0000-00-00', 'Nulo', '3174933188', 'BRYANVALENCIA120@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 247),
('1192914134', 1, 'Camila', 'Mendoza Ocampo', '0000-00-00', 'Nulo', '3148450689', 'ocampo.camila1@outlook.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 453),
('1192915928', 1, 'Laura Vanessa', 'Baquero Rivero', '0000-00-00', 'Nulo', '3116444372', 'lauravanessabr08@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 223),
('1192918438', 1, 'Melanie Isabella', 'Ordo?ez Bastidas', '0000-00-00', 'Nulo', '3176624879', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 958),
('1192919769', 1, 'Juan Pablo', 'Trujillo Garcia', '0000-00-00', 'Nulo', '3188476199', 'LILDAVID1234@ICLOUD.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 498),
('1193081764', 2, 'Clara Ximena', 'Valencia Velazco', '0000-00-00', 'Nulo', '3182334421', 'XIMENAVALENCIAVELASCO@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 520),
('1193084161', 1, 'Cristian David', 'Rodriguez Rengifo', '0000-00-00', 'Nulo', '3126041966', 'cristiandavidrodriguez0@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 879),
('1193084205', 1, 'Cesar Luis', 'Herrera Cuellar', '0000-00-00', 'Nulo', '3219255894', 'cesarluisherrera2002@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 470),
('1193105565', 1, 'Jose Arvey', 'Bomba Caviche', '0000-00-00', 'Nulo', '3508077801', 'JOSEARVEYBOMBA05@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 259),
('1193118997', 1, 'Santiago', 'Molina Mu?oz', '0000-00-00', 'Nulo', '3014771321', 'SANTIAGOMOLINA546@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 26),
('1193133647', 2, 'Jhon Erik', 'Casta?eda Gomez', '0000-00-00', 'Nulo', '3206338044', 'gomeserik2002@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 411),
('1193136550', 2, 'Michael David', 'Sabogal Pati?o', '0000-00-00', 'Nulo', '3042183126', 'dayanasabogal@outlook.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 426),
('1193144062', 1, 'Ingrid', 'Castillo Castillo', '0000-00-00', 'Nulo', '3167063598', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1282),
('1193216211', 1, 'Nathalia', 'Cardona Mu?oz', '0000-00-00', 'Nulo', '3126704303', 'NATHALIACARDONAM1018@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 100),
('1193226734', 1, 'Nicole Alejandra', 'Campo Yujo', '0000-00-00', 'Nulo', '3226322391', 'NIKOALEJA12@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 97),
('1193232404', 1, 'Luis Fernando', 'Mosquera Mina', '0000-00-00', 'Nulo', '3173608936', 'lmosqueramina527@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 870),
('1193232746', 1, 'Hector Fabio', 'Angulo Balanta', '0000-00-00', 'Nulo', '3216169963', 'Nulo', 'activo', 'Nulo', 0, 'Nulo', '', 921),
('1193251966', 1, 'Laura Isabel', 'Giraldo Grisales', '0000-00-00', 'Nulo', '3106321876', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1599),
('1193254114', 2, 'Juan Sebastian', 'Cortes Casanova', '0000-00-00', 'Nulo', '3005229311', 'NOSEACUERDA@GMAIL.COM', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 434),
('1193269051', 1, 'Kevin Andres', 'Salamanca Campo', '0000-00-00', 'Nulo', '3166493827', 'kevinscampo07@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 899),
('1193269842', 2, 'Sebastian', 'Correa Gaviria', '0000-00-00', 'Nulo', '3146206807', 'NOSELOOSABEE@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 412),
('1193384074', 1, 'Joseph Luis', 'Posso Pantoja', '0000-00-00', 'Nulo', '3166059882', 'JOSEPHPOSSO228_@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 749),
('1193384280', 1, 'Paola Andrea', 'Cifuentes Lopez', '0000-00-00', 'Nulo', '3188054860', 'melissaporo11@gmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 107),
('1193405150', 1, 'Juan Felipe', 'Montoya Bocanegra', '0000-00-00', 'Nulo', '3166179413', 'jfmontoya859@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 62),
('1193406808', 1, 'Gabriela', 'Sepulveda Moreno', '0000-00-00', 'Nulo', '3165362183', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 995),
('1193415591', 1, 'Llorquin Andres', 'Naranjo Posada', '0000-00-00', 'Nulo', '3156420446', 'llorguin123@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 329),
('1193415610', 1, 'Antony', 'Romero Valencia', '0000-00-00', 'Nulo', '3145966767', 'ARVROMERO2001@HOTMAIL.ES', 'egresado', 'Nulo', 0, 'Nulo', '', 192),
('1193424420', 2, 'Sergio Daniel', 'Aguirre Lucumi', '0000-00-00', 'Nulo', '3043454970', 'SERGIODANIEL@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 408),
('1193432623', 1, 'Luis Alejandro', 'Hoyos Biojo', '0000-00-00', 'Nulo', '3164421489', 'NOSELOSABE32@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 420),
('1193439775', 1, 'Isabella', 'Cuenca Pantoja', '0000-00-00', 'Nulo', '3104631366', 'ISABELLACUENCA1@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 506),
('1193455965', 1, 'Anyeli', 'Vergara Quimbayo', '0000-00-00', 'Nulo', '3143633301', 'ANGELY220@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 72),
('1193536334', 1, 'Andres Felipe', 'Cuero Sinisterra', '0000-00-00', 'Nulo', '3207601879', 'cueroandres02@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 861),
('1193556021', 2, 'Andres Fernando', 'Idarraga Astaiza', '0000-00-00', 'Nulo', '3146118840', 'NO.TIENE.CORRERO@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 421),
('1193582890', 1, 'Marlon  Estiben', 'Reina Dinas', '0000-00-00', 'Nulo', '3157683041', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1088),
('1193583890', 1, 'Marlon Estiben', 'Reina Dinas', '0000-00-00', 'Nulo', '3157683041', 'marlonwtf919@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 876),
('12195189', 1, 'Rito', 'Vargas Joven', '0000-00-00', 'Nulo', '3182103250', 'vargasj0812@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 565),
('1234190268', 1, 'Valentina', 'Rincon Garcia', '0000-00-00', 'Nulo', '3183134765', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1067),
('1234190903', 1, 'Nestor Andres', 'Valencia Lopez', '0000-00-00', 'Nulo', '3217363698', 'mavl.19@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 211),
('1234191292', 1, 'Luz Angela', 'Vanegas Nu?ez', '0000-00-00', 'Nulo', '3158186486', 'angelavanegas_14@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 771),
('1234191579', 1, 'Carolina', 'Correa Gaviria', '0000-00-00', 'Nulo', '3183283969', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1148),
('1234191663', 1, 'Yenny Carolina', 'Montoya Bocanegra', '0000-00-00', 'Nulo', '3147878304', 'yennymontoya.02@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 323),
('1234191877', 1, 'Maria Camila', 'Pe?a Oyola', '0000-00-00', 'Nulo', '3017315965', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1213),
('1234191885', 1, 'Jaime Andres', 'Mosquera Restrepo', '0000-00-00', 'Nulo', '3014001658', 'FF@FF.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 326),
('1234192878', 1, 'Carolina', 'Cardona Ramirez', '0000-00-00', 'Nulo', '3218275775', 'cardonaramirezcarolina@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 101),
('1234193527', 1, 'Nicolas', 'Ceballos Casta?eda', '0000-00-00', 'Nulo', '3218913878', 'nicoceballos1026@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 104),
('1234193535', 1, 'Wendy Samira', 'Angulo Bravo', '0000-00-00', 'Nulo', '3218251945', 'LIBIALOREAN@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 572),
('1234194971', 1, 'Karen Lisbeth', 'Ruano Zuniga', '0000-00-00', 'Nulo', '3176038037', 'LISBETHZZ23@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 349),
('1234195240', 1, 'Lina Marcela', 'Aguirre Portillo', '0000-00-00', 'Nulo', '3235829035', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1133),
('1234195730', 1, 'Ivan Andres', 'Cardona Sanchez', '0000-00-00', 'Nulo', '3042182975', 'ivan.andres315531@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 263),
('1234195808', 1, 'Leidy Tatiana', 'Duque Torres', '0000-00-00', 'Nulo', '3215350285', 'duqueleidy78@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 840),
('12341959001', 1, 'Jhan Edwin', 'Dinas Arango', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1075),
('1234195909', 1, 'Jhon Edwin', 'Dinas Arango', '0000-00-00', 'Nulo', '3205305444', 'JHONEDWIN0420@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 115),
('1234197000', 1, 'Nelson Fernando', 'Sanchez Vallecilla', '0000-00-00', 'Nulo', '3217836653', 'nelsonfernandosanchezvallecila@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 832),
('1234197617', 1, 'Jean Carlos', 'Gonzalez Escobar', '0000-00-00', 'Nulo', '3173977155', 'JEANKRLOSMULLER@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 418),
('1334197617', 1, 'Jean Carlos ', 'Gonzalez Escobar', '0000-00-00', 'Nulo', '3177971155', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1081),
('14608052', 1, 'Bermudes Alexander', 'Bermudes Alexander', '0000-00-00', 'Nulo', '3045354401', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1220),
('14609308', 1, 'Carlos Alberto', 'Ocampo rivas', '0000-00-00', 'Nulo', '3022897436', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 952),
('14623520', 1, 'Jorge Edinson ', 'Ibarra Sinisterra', '0000-00-00', 'Nulo', '3218666249', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1460),
('14637034', 1, 'Jonathan', 'Penagos Florez', '0000-00-00', 'Nulo', '3205953100', 'PAPAPULI@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 639),
('14637560', 1, 'Edwin Javier', 'Gamboa Ojeda', '0000-00-00', 'Nulo', '3186639132', 'jawer43@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 281),
('14639222', 1, 'John Edward', 'Valencia Medina', '0000-00-00', 'Nulo', '3004841694', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1407),
('14639587', 1, 'Jonathan', 'Bola?os Franco', '0000-00-00', 'Nulo', '3166031720', 'JOBOFRA@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 540),
('14700521', 1, 'Freddy', 'Orrego Vasquez', '0000-00-00', 'Nulo', '3138893384', 'fredy.orrego@claro.com.co', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 637),
('1476965', 1, 'Albeiro', 'Ortega Ordo?ez', '0000-00-00', 'Nulo', '3122999889', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1521),
('148363622', 1, 'Jhony Dustin', 'Soto Quijano', '0000-00-00', 'Nulo', '3205341983', 'ESTELLA1162@HOTMAIL.ES', 'inactivo', 'Nulo', 0, 'Nulo', '', 519),
('14837366', 1, 'Ricardo', 'Ruiz Ramirez', '0000-00-00', 'Nulo', '3168415551', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 951),
('14960370', 1, 'Enrique', 'Cano Mosquera', '0000-00-00', 'Nulo', '3113457652', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 973),
('14996150', 1, 'Oscar', 'Mejia Mejia', '0000-00-00', 'Nulo', '3162461551', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 991),
('16274685', 1, 'Luis Hernesto ', 'Restrepo Berrio', '0000-00-00', 'Nulo', '3205742511', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1446),
('16286712', 1, 'Luis Hector', 'Martinez Malte', '0000-00-00', 'Nulo', '3128248433', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1749),
('16287807', 1, 'Julio Cesar', 'Garcia Alvarez', '0000-00-00', 'Nulo', '3174383518', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1606),
('16351582', 1, 'Jahir', 'Gutierrez Paz', '0000-00-00', 'Nulo', '3108336991', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1242),
('16375622', 1, 'Jeffeson', 'Suarez Marquez', '0000-00-00', 'Nulo', '3226210867', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1538),
('16377957', 1, 'John Jairo', 'Gomez Gorge', '0000-00-00', 'Nulo', '3162731754', 'o@o.com', 'egresado', 'Nulo', 0, 'Nulo', '', 606),
('16379338', 1, 'Hugo Armando', 'Alzate Gomez', '0000-00-00', 'Nulo', '3045858640', 'gohu@hotmail.es', 'egresado', 'Nulo', 0, 'Nulo', '', 3),
('16513372', 1, 'Jaime', 'Ardila Cuero', '0000-00-00', 'Nulo', '3167147348', 'dinojaime@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 575),
('16606557', 1, ' Julio ', 'Galeano Carlos', '0000-00-00', 'Nulo', '3168718017', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1425),
('1662103', 1, 'Edgar', 'Perez Romero', '0000-00-00', 'Nulo', '3163451189', 'EPEREZRDM@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 558),
('16626501', 1, 'Carlos Arturo', 'Perdomo Vargas', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1418),
('16643119', 1, 'Mario', 'Rivera', '0000-00-00', 'Nulo', '3013664122', '2222@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 41),
('16669469', 1, 'Luis Alberto', 'Luna Ocampo', '0000-00-00', 'Nulo', '3012931553', '1111@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 38),
('16699066', 1, 'Carlos Arturo', 'Triana Agudelo', '0000-00-00', 'Nulo', '3138970137', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1107),
('16756332', 1, 'Salvador', 'Caipe Garcia', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1634),
('16783248', 1, 'Mario Alexander', 'Betancourt Sanchez', '0000-00-00', 'Nulo', '3105171197', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1229),
('16797779', 1, 'Carlos Alberto', 'Giraldo Yara', '0000-00-00', 'Nulo', '3167550007', 'DIECARL2006@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 604),
('16841324', 1, 'Jorge Ivan', 'Garces Fandi?o', '0000-00-00', 'Nulo', '3183750100', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1607),
('16845955', 1, 'Marlon', 'Mamian Chamorro', '0000-00-00', 'Nulo', '3168653186', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1385),
('16863607', 1, 'Diego Fernando', 'Gaitan Quintero', '0000-00-00', 'Nulo', '3004346622', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1004),
('16895223', 1, 'Oscar Eduardo', 'Garcia Ceballos', '0000-00-00', 'Nulo', '3167464149', 'oscareduardogarcia0382@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 602),
('16917210', 1, 'Luis Gonzalo', 'Bermeo Gomez', '0000-00-00', 'Nulo', '3045306229', 'luis16917210@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 581),
('16927501', 1, 'Arvey', 'Bonilla Diaz', '0000-00-00', 'Nulo', '3206347517', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1094),
('16928358', 1, 'Ricardo', 'Sanclemente Tigreros', '0000-00-00', 'Nulo', '3136185262', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1496),
('16929141', 1, 'Cesar Tulio', 'Zu?iga Pardo', '0000-00-00', 'Nulo', '3152236956', 'CZ04123@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 777),
('16932627', 1, 'Heider', 'Villalobos Benavidez', '0000-00-00', 'Nulo', '3117192120', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1469),
('16936162', 1, 'Juan Carlos', 'Castillo Barreto', '0000-00-00', 'Nulo', '3143892339', 'juank8203@yahoo.com', 'egresado', 'Nulo', 0, 'Nulo', '', 692),
('16936212', 1, 'Carlos Alberto', 'Ospina Revelo', '0000-00-00', 'Nulo', '3127910132', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1012),
('16936612', 1, 'Juan David', 'Isaza Daravi?a', '0000-00-00', 'Nulo', '3153135853', 'jua.no19@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 141),
('16937015', 1, 'Jose Honorio', 'Garcia Garcia', '0000-00-00', 'Nulo', '3167409599', 'NOSEACUERDA@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 120),
('16937531', 1, 'Jhon A', 'Rojas Gonzalez', '0000-00-00', 'Nulo', '3207658035', 'ninimostacilla@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 191),
('16939617', 1, 'Arturo', 'Trochez Carlos', '0000-00-00', 'Nulo', '3182814352', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1724),
('16940858', 1, 'Fabian ', 'Gomez Barreto', '0000-00-00', 'Nulo', '3205867903', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1421),
('16941221', 1, 'Juan Carlos', 'Schiavenato Carrillo', '0000-00-00', 'Nulo', '3002223980', 'juank51281@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 199),
('16944197', 1, 'Fabian Alfonso', 'Perea Morante', '0000-00-00', 'Nulo', '3187124350', 'perea0317@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 177),
('16977871', 1, 'Jhon ', 'Rojas Gonzales', '0000-00-00', 'Nulo', '7226552426', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1077),
('19231237', 1, 'Antonio Jose', 'Ochoa Cuberos', '0000-00-00', 'Nulo', '3006878058', 'TONYOCHOA54@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 40),
('21562916', 1, 'Jose Nathanael', 'Fernandez Colmenarez', '0000-00-00', 'Nulo', '3157662943', 'nathanaelfdez@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 508),
('21953216', 1, 'Lucia ', 'Tangarife Dora', '0000-00-00', 'Nulo', '3167405199', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1511),
('25025699', 1, 'Claudia Yaneth', 'Rios Aguirre', '0000-00-00', 'Nulo', '3167891551', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1031),
('25285489', 1, 'Nidia Amparo ', 'Vasquez Garcia', '0000-00-00', 'Nulo', '3104010476', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1542),
('25479287', 1, 'Luz Marina', 'Mu?oz Piamba', '0000-00-00', 'Nulo', '3106758731', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1037),
('25527753', 1, 'Luz Enit', 'Martinez Rey', '0000-00-00', 'Nulo', '3165328850', 'LMARTINEZREY1961@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 726),
('25528293', 1, 'Gloria Estella', 'Castillo Luligo', '0000-00-00', 'Nulo', '3182667635', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 964),
('289724', 3, 'Florentina Noemi', 'Huaman Lizarme', '0000-00-00', 'Nulo', '3206031107', 'fnoe15@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 619),
('29105538', 1, 'Consuelo', 'Aristizabal Cruz', '0000-00-00', 'Nulo', '3172324507', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1347),
('29107818', 1, 'Mariays', 'Mosquera Peralta', '0000-00-00', 'Nulo', '3216088718', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1391),
('29109108', 1, 'Mary Luz', 'Velez Duran', '0000-00-00', 'Nulo', '3177216059', 'maryvelez2870@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 15),
('29115840', 1, 'Clara Elizabeth', 'Martinez Erazo', '0000-00-00', 'Nulo', '3127728420', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1191),
('29116142', 1, 'Lucero', 'Lopez Santacruz', '0000-00-00', 'Nulo', '3177816698', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1244),
('29118655', 1, 'Andrea', 'Escobar Paola', '0000-00-00', 'Nulo', '3173698620', 'ANDREAE77@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 118),
('29119085', 1, 'Paola Andrea ', 'Rivera Delgado', '0000-00-00', 'Nulo', '3108486342', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1482),
('29119091', 1, 'Nohemy', 'Mora Guatame', '0000-00-00', 'Nulo', '3137678279', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1729),
('29120607', 1, 'Sandra Liliana', 'Chacon Sanchez', '0000-00-00', 'Nulo', '3177571792', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1044),
('29122360', 1, 'Mayerlin', 'Hinestroza', '0000-00-00', 'Nulo', '3155748862', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1721),
('29123516', 1, 'Maria Del Pilar', 'Asprilla Riascos', '0000-00-00', 'Nulo', '3188298575', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 992),
('29125814', 1, 'Sandra Patricia', 'Rosero Valdes', '0000-00-00', 'Nulo', '3103937035', 'SANRRO2027@YAHOO.ES', 'inactivo', 'Nulo', 0, 'Nulo', '', 348),
('29127477', 1, 'Bacca Angela Maria', 'Del Campo', '0000-00-00', 'Nulo', '3103877076', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1096),
('291349736', 1, 'Veronica', 'Arboleda', '0000-00-00', 'Nulo', '3128745386', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1274),
('29136627', 1, 'Blecida', 'Gallego Restrepo', '0000-00-00', 'Nulo', '3148095725', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1238),
('29177474', 1, 'Blanca Nubia', 'Paz Perez', '0000-00-00', 'Nulo', '3122210097', 'BLANCA.NUBIA.PAZ@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 176),
('29178898', 1, 'Sandra ', 'Quintero Valencia', '0000-00-00', 'Nulo', '313 5922145', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1265),
('29180167', 1, 'Angela', 'Perdomo Molina', '0000-00-00', 'Nulo', '3184829953', 'ANGELA.1913@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 747),
('29180210', 1, 'Maribel', 'Quiroz Tapiero', '0000-00-00', 'Nulo', '3178254745', 'JCDR.1976@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 182),
('29346649', 1, 'Sujey Johanna', 'Posso Valencia', '0000-00-00', 'Nulo', '3167944300', 'sujy83888@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 523),
('29352408', 1, 'Alba Deicy', 'Diaz Barco', '0000-00-00', 'Nulo', '3173922380', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1267),
('29352415', 1, 'Leidy Johanna', 'Martinez Caicedo', '0000-00-00', 'Nulo', '3218251945', 'LEIDYSS712@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 553);
INSERT INTO `estudiantes` (`estudiantes_no_documento`, `estudiantes_tipo_documento`, `estudiantes_nombre`, `estudiantes_apellidos`, `estudiantes_fecha_nacimiento`, `estudiantes_genero`, `estudiantes_telefono`, `estudiantes_correo`, `estudiantes_estado`, `estudiantes_direccion`, `estudiantes_adjunto_id`, `estudiantes_observaciones`, `estudiantes_doble_titulacion`, `estudiantes_doble_titulacion_id`) VALUES
('29363758', 1, 'Lina Marcela', 'Zorrilla Villada', '0000-00-00', 'Nulo', '3104640273', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 974),
('29363884', 1, 'Hasbleidy', 'Herrera', '0000-00-00', 'Nulo', '3043322421', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1577),
('29433189', 1, 'Carmen Maria', 'Izquierdo Orejuela', '0000-00-00', 'Nulo', '3108277350', 'car-maizo@hotmail.es', 'egresado', 'Nulo', 0, 'Nulo', '', 720),
('29435597', 1, 'Marcela ', 'Carvajal Diana', '0000-00-00', 'Nulo', '3136609968', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1357),
('29504905', 1, 'Maria Yolanda ', 'Qui?ones Casanova', '0000-00-00', 'Nulo', '3164106580', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1461),
('29506472', 1, 'Paola Andrea ', 'Ortiz Caicedo', '0000-00-00', 'Nulo', '3157726057', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1117),
('29509281', 1, 'Sandra Paola', 'Sanchez Londo?o', '0000-00-00', 'Nulo', '3127609750', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1492),
('29544488', 1, 'Carolina', 'Moreno Lopez', '0000-00-00', 'Nulo', '3185788713', 'caromo9999@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 325),
('29567798', 1, 'Ana Milena', 'Charry Qui?ones', '0000-00-00', 'Nulo', '3045441411', 'ANACHARRY1978@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 696),
('29584953', 1, 'Jovanna Milena', 'Ramos Guerrero', '0000-00-00', 'Nulo', '3176924201', 'kamisantijm@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 822),
('29662762', 1, 'Paola Angelica', 'Diaz Buitrago', '0000-00-00', 'Nulo', '3105343356', 'PAOLADIAZ79@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 112),
('29666966', 1, 'Luz Angela', 'Rivero Pulido', '0000-00-00', 'Nulo', '3165339615', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1444),
('29741610', 1, 'Dolly', 'Bedoya', '0000-00-00', 'Nulo', '3103026702', 'dollybe0526@ghotmial.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION ADMON', '', 4),
('29761002', 1, 'Lina Yineth', 'Pelaez Jaramillo', '0000-00-00', 'Nulo', '3113371715', 'lina9va85@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 745),
('29973196', 1, 'Carmen Liliana', 'Rivera Otero', '0000-00-00', 'Nulo', '3147164140', 'lilianacami82@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 188),
('30226200', 1, 'Yanet', 'Franco Montoya', '0000-00-00', 'Nulo', '3126238214', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 938),
('30305021', 1, 'Carmenza ', 'Giraldo Gallego', '0000-00-00', 'Nulo', '3137971978', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1098),
('30329654', 1, 'Gloria Ines', 'Echeverry Pachon', '0000-00-00', 'Nulo', '3113324316', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 943),
('30329992', 1, 'Claudia Patricia', 'Garcia Ceicedo', '0000-00-00', 'Nulo', '3173788127', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1101),
('30360805', 1, 'Lucas', 'Bedoya Montes', '0000-00-00', 'Nulo', '3053782126', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1080),
('30360865', 1, 'Lucelly', 'Montes Bedoya', '0000-00-00', 'Nulo', '3053782126', 'lucelly.1975_@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 729),
('30744262', 1, 'Monica Alejandra ', 'Lopez Arevalo', '0000-00-00', 'Nulo', '3157623610', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1428),
('31203110', 1, 'Liliana', 'Gonzalez Osorio', '0000-00-00', 'Nulo', '3163098831', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1111),
('31261701', 1, 'Constanza', 'Jaramillo Larrahondo', '0000-00-00', 'Nulo', '3155595366', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1016),
('31301806', 1, 'Luz Marietta', 'Aguirre Orobio', '0000-00-00', 'Nulo', '3175045502', 'marieta0902@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 569),
('31306318', 1, 'Leidy Liney', 'Vasquez Villada', '0000-00-00', 'Nulo', '3216441538', 'leidy-li@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 773),
('31308784', 1, 'Julieth', 'Aguirre Gutierrez', '0000-00-00', 'Nulo', '3007500352', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 935),
('31308902', 1, 'Liliana', 'Solarte Hernandez', '0000-00-00', 'Nulo', '3113467632', 'soli84@live.com', 'egresado', 'Nulo', 0, 'Nulo', '', 765),
('31320275', 1, 'Heydi   Ximara ', 'Palacios Cordoba', '0000-00-00', 'Nulo', '3168737483', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1337),
('31321135', 1, 'Limar ', 'Escobar Hurtado', '0000-00-00', 'Nulo', '3052504734', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1159),
('31322985', 1, 'Joahanna', 'Armero Camargo', '0000-00-00', 'Nulo', '3173475262', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 971),
('31323205', 1, 'candelo cordoba', 'Doris Fernanda', '0000-00-00', 'Nulo', '3158112944', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 918),
('31324168', 1, 'Leidy Diana', 'Gomez Fajardo', '0000-00-00', 'Nulo', '3113362198', 'l-diana-426@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 37),
('31324285', 1, 'Karen', 'Casta?eda Monta?o', '0000-00-00', 'Nulo', '3145245106', 'KARENC1923@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 667),
('31324363', 1, 'Elizabeth', 'Garces Vasquez', '0000-00-00', 'Nulo', '3147258580', 'licita1984@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 708),
('31387873', 1, 'Neyla Fiorella', 'Zambrano Rosales', '0000-00-00', 'Nulo', '3163229886', 'MAOSA23@HOTMAIL.ES', 'egresado', 'Nulo', 0, 'Nulo', '', 776),
('31445051', 1, 'Paola Andrea', 'Sendoya Idarraga', '0000-00-00', 'Nulo', '3163477464', 'paolasendoya@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 200),
('31478334', 1, 'Yamileth', 'Aguilar Arboleda', '0000-00-00', 'Nulo', '3103826788', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1340),
('31481898', 1, 'del Socorro ', 'Jaramillo Matdory', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1509),
('31484488', 1, 'Aracely', 'Garcia Arias', '0000-00-00', 'Nulo', '3183337344', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1745),
('31485730', 1, 'Jenny Adriana', 'Cruz Pillimue', '0000-00-00', 'Nulo', '3183751996', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1730),
('31486526', 1, 'Kelly Yohanna', 'Cuellar Malpu', '0000-00-00', 'Nulo', '3103883899', 'kyohanna1114@hotmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 110),
('31486705', 1, 'Ana Maria', 'Saavedra Suarez', '0000-00-00', 'Nulo', '3193849539', 'maria_princesa0708@yahoo.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 33),
('31529060', 1, 'Ana Deisy', 'Zu?iga Ortiz', '0000-00-00', 'Nulo', '3113533266', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 916),
('31533482', 1, 'Monica', 'Herran Navarro', '0000-00-00', 'Nulo', '3167623475', 'monikhn_@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 299),
('31533849', 1, 'Yenny Patricia', 'Cano Quintero', '0000-00-00', 'Nulo', '3174968554', 'yennyjypecano@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 46),
('31534386', 1, 'Luz Dary', 'Salazar Gonzalez', '0000-00-00', 'Nulo', '3116244534', 'darysalazar@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 654),
('31535703', 1, 'Patricia', 'Cardona Claudia', '0000-00-00', 'Nulo', '3175436263', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1055),
('31536092', 1, 'Francia Edith', 'Vasquez Velasco', '0000-00-00', 'Nulo', '3225871292', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 955),
('31565377', 1, 'Angela Yaneth', 'Gonzalez Jimenez', '0000-00-00', 'Nulo', '3146725860', 'AG3084624@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 566),
('31565798', 1, 'Veronica', 'Gustines Garcia', '0000-00-00', 'Nulo', '3152410810', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1565),
('31567174', 1, 'Magda Patricia ', 'Lopez Mu?oz', '0000-00-00', 'Nulo', '3136383968', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1383),
('31572904', 1, 'Jenny ', 'Portillo Astrid', '0000-00-00', 'Nulo', '3137498882', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1400),
('31575268', 1, 'Gloria Nancy', 'Yepes Casta?o', '0000-00-00', 'Nulo', '3122617038', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1026),
('31576031', 1, 'Ana Belle', 'Quintero Quijano', '0000-00-00', 'Nulo', '3174334028', 'aqcoomeva@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 64),
('31576059', 1, 'Mary Yuled', 'Ramos Serna', '0000-00-00', 'Nulo', '3168944633', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1467),
('31576544', 1, 'Ana Carola', 'Ceron Ortega', '0000-00-00', 'Nulo', '3182596344', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 988),
('31576637', 1, 'Dufay', 'Pe?a', '0000-00-00', 'Nulo', '3004368365', 'DUFAYPENA80@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'PENDIENTE DIPLOMA', '', 746),
('31577197', 1, 'Clara Ines', 'Pillmue Piamba', '0000-00-00', 'Nulo', '3147070267', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 963),
('31577209', 1, 'Angela Maria ', 'Polez Aroca', '0000-00-00', 'Nulo', '3137686164', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1380),
('31577525', 1, 'Luz Haydee', 'Cortes Balanta', '0000-00-00', 'Nulo', '3117569668', 'luzaidecortez19@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 780),
('31582758', 1, 'Carolina Isabel', 'Salazar Cardenas', '0000-00-00', 'Nulo', '3176151819', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1436),
('31583415', 1, 'Diana Patricia', 'Chamorro Grisales', '0000-00-00', 'Nulo', '3136181563', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 940),
('31584854', 1, 'Paola Andrea ', 'Mu?oz Paramo', '0000-00-00', 'Nulo', '3113240551', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1393),
('31602873', 1, 'Milvia', 'Hinestroza', '0000-00-00', 'Nulo', '3154964882', 'MILVIA@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 530),
('31710937', 1, 'Maria Viviana', 'Garcia Sanchez', '0000-00-00', 'Nulo', '3113701301', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1764),
('31711503', 1, 'Fabiola  Carolina', 'Guerrero Lievano', '0000-00-00', 'Nulo', '3158979140', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1376),
('31711621', 1, 'Marin Ximena', 'Marin Ximena', '0000-00-00', 'Nulo', '3182290050', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1518),
('31712250', 1, 'Ana Beatriz', 'Giron Chavez', '0000-00-00', 'Nulo', '3153687446', 'bettykgi18@yahoo.es', 'egresado', 'Nulo', 0, 'Nulo', '', 714),
('31712737', 1, 'Seleny Verenis ', 'Guerrero Calderon', '0000-00-00', 'Nulo', '3116082718', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1706),
('31713611', 1, 'Jhoanna ', 'Henao Leidy', '0000-00-00', 'Nulo', '31736558443', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1493),
('31714191', 1, 'Jazbleiby', 'Duque', '0000-00-00', 'Nulo', '3154208895', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1495),
('31714877', 1, ' Paola Andrea ', 'Pineda Rengifo', '0000-00-00', 'Nulo', '3103731081', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1305),
('31838021', 1, 'Marina', 'Mu?oz Dalia', '0000-00-00', 'Nulo', '3167082365', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 939),
('31871844', 1, 'Nora ', 'Molina Martha', '0000-00-00', 'Nulo', '3108915108', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1416),
('31873505', 1, 'Sonia', 'Pati?o Silva', '0000-00-00', 'Nulo', '3177007579', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1036),
('31905006', 1, 'Carmenza', 'Molina Valderama', '0000-00-00', 'Nulo', '3117195315', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1557),
('31919638', 1, 'Astrid Mercedes', 'Vega Lopez', '0000-00-00', 'Nulo', '3116255354', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 950),
('31930898', 1, 'Maria Luisa', 'Vasco Ortiz', '0000-00-00', 'Nulo', '3218388986', 'LUISDA.VASCO@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 772),
('31935482', 1, 'Lucy', 'Arboleda Pedroza', '0000-00-00', 'Nulo', '3207408703', 'lucyarboleda20@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 682),
('31964711', 1, 'Martha Marisol', 'Davila Rojas', '0000-00-00', 'Nulo', '3045280179', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1594),
('31970015', 1, 'Patricia', 'Marmolejo', '0000-00-00', 'Nulo', '3023209317', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1549),
('31971534', 1, 'Jackeline', 'Constain Mejia', '0000-00-00', 'Nulo', '3152137070', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 948),
('31973240', 1, 'Mariana', 'Correa Martinez', '0000-00-00', 'Nulo', '3127343456', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1774),
('31985022', 1, 'Andrea', 'Nieto Gonzales', '0000-00-00', 'Nulo', '3006610411', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1284),
('31993059', 1, 'Ines Elvira', 'Tabares Castro', '0000-00-00', 'Nulo', '3148559478', 'ines6875@hotmail.com', 'inactivo', 'Nulo', 0, 'SE GRADUA DIC 2024', '', 204),
('32728855', 1, 'Mariela', 'Garzon Martinez', '0000-00-00', 'Nulo', '3107427969', 'MARIELITAGARZON@OUTLOOK.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 711),
('331996044', 1, 'Janeth', 'Mu?os Vinasco', '0000-00-00', 'Nulo', '3117420850', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1433),
('34319460', 1, 'Marisela ', 'Salazar Ruiz', '0000-00-00', 'Nulo', '31662398020', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1442),
('34341475', 1, 'Elizabeth', 'Anacona Samboni', '0000-00-00', 'Nulo', '3127714465', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1290),
('34544363', 1, 'Luz Mireya', 'Giron Sarria', '0000-00-00', 'Nulo', '3157014120', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1127),
('34616698', 1, ' Leidy Patricia', 'Vasquez Carabali', '0000-00-00', 'Nulo', '3117713763', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1441),
('34673122', 1, 'Martha Ximena', 'Rengifo Mesa', '0000-00-00', 'Nulo', '3216260245', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1203),
('35546239', 1, 'Luz Arcelly', 'Mosquera Hinestroza', '0000-00-00', 'Nulo', '3135579767', 'LUAMO12-2@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 731),
('36281128', 1, 'Gloria Yasmin ', 'Bola?os Osorio', '0000-00-00', 'Nulo', '3043819774', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1440),
('36305234', 1, 'Damaris', 'Estela Talaga', '0000-00-00', 'Nulo', '3136081790', 'damarisestela@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 705),
('36756849', 1, 'Andrea Maribel', 'Genoy Lopez', '0000-00-00', 'Nulo', '3117054231', 'ANDREAINSTITUTOAB@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 712),
('37626081', 1, 'Claudia Esperanza', 'Parra Merchan', '0000-00-00', 'Nulo', '3207819817', 'claespame@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 638),
('381561223', 1, 'Buitrago Paola', 'Buitrago Paola', '0000-00-00', 'Nulo', '3207264902', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1488),
('38245780', 1, 'Yamile ', 'Bravo Mendez', '0000-00-00', 'Nulo', '3154677278', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1590),
('38460105', 1, 'Isabel', 'Salgar Ramirez', '0000-00-00', 'Nulo', '3172363392', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1028),
('38461145', 1, 'Mary Isabel', 'Morales Ortiz', '0000-00-00', 'Nulo', '3168523958', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1011),
('384611919', 1, 'Rosaura ', 'Caicedo Rodriguez', '0000-00-00', 'Nulo', '3207146149', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1304),
('38461293', 1, 'Larranhondo', 'Choco', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1610),
('38461700', 1, 'Patricia', 'Peteche Claudia', '0000-00-00', 'Nulo', '3113483778', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1254),
('38461710', 1, 'Zorayda', 'Angulo Ocoro', '0000-00-00', 'Nulo', '3147705245', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1645),
('38461919', 1, 'Rosaura', 'Caicedo Rodriguez', '0000-00-00', 'Nulo', '3207146149', 'rosaurajulio79@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 791),
('38462780', 1, 'Maria Concepcion', 'Gomez Gomez', '0000-00-00', 'Nulo', '3125757336', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1167),
('38463436', 1, 'Diana Berenice', 'Castillo Ballesteros', '0000-00-00', 'Nulo', '3177412459', 'benjie088@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 669),
('38463476', 1, 'Narqui Guibioli', 'Gonzalez Gonzalez', '0000-00-00', 'Nulo', '3117452716', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1373),
('38550710', 1, 'Ana Milena', 'Loaiza Guzman', '0000-00-00', 'Nulo', '3003845155', 'LOAIZAVALENCIASARA2009@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 723),
('38551589', 1, 'Diana Cecilia', 'Benites Perez', '0000-00-00', 'Nulo', '3107098035', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1091),
('38552145', 1, 'Senubielh', 'Perez Dorado', '0000-00-00', 'Nulo', '3233660375', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1289),
('38552463', 1, 'Yenny', 'Rodriguez', '0000-00-00', 'Nulo', '3008102096', 'jenroguez2018@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 755),
('38553133', 1, 'Lorena ', 'Gomez Rodas', '0000-00-00', 'Nulo', '3173076000', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1372),
('38554564', 1, 'Andrea', 'Pardo Paola', '0000-00-00', 'Nulo', '3153951275', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1151),
('38554682', 1, 'Johanna', 'Morales Cardona', '0000-00-00', 'Nulo', '3128062463', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1589),
('38556017', 1, 'Lina Marcela', 'Higuita Mu?oz', '0000-00-00', 'Nulo', '3175517129', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1053),
('38556048', 1, 'Lorena', 'Diaz Vargas', '0000-00-00', 'Nulo', '3165314886', 'lorenadiaz81@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 21),
('38558188', 1, 'Yamileth', 'Garcia', '0000-00-00', 'Nulo', '3117378749', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1587),
('38558818', 1, 'Gloria', 'Garcia Castillo', '0000-00-00', 'Nulo', '3106036274', 'lorisgacia1982@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 282),
('38559030', 1, 'Carmen Alicia', 'Carre?o Sandoval', '0000-00-00', 'Nulo', '3108473903', 'alicars81@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 689),
('38560667', 1, 'Jimena ', 'Lopez Aroca', '0000-00-00', 'Nulo', '3148818252', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1381),
('38562284', 1, 'Yaneth', 'Trujillo Delgado', '0000-00-00', 'Nulo', '3045343905', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1049),
('38563482', 1, 'Marina', 'Rodriguez Luz', '0000-00-00', 'Nulo', '3103474554', 'MARINARODRIGUEZ1307@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 13),
('38565883', 1, 'Sandra Patricia', 'Lopez Semanate', '0000-00-00', 'Nulo', '3168515208', 'PATRICIA22151@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 627),
('38565903', 1, 'Alexandra', 'Carmona Borrero', '0000-00-00', 'Nulo', '3203264936', 'alexacarmonaborrero@hotmail.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 588),
('38567662', 1, 'Mabel', 'Hernandez Moreno', '0000-00-00', 'Nulo', '3208285983', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1313),
('38568643', 1, 'del Carmen', 'Andrade Lilia', '0000-00-00', 'Nulo', '3113558395', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1275),
('38595159', 1, 'Fernanda', 'Bermudez Maria', '0000-00-00', 'Nulo', '3106311603', 'ninafernandabermudez@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 539),
('38596006', 1, 'Maria Terselina', 'Aguilar Zu?iga', '0000-00-00', 'Nulo', '3206159094', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1057),
('38601249', 1, 'Adriana Maria', 'Mesa Rios', '0000-00-00', 'Nulo', '3177606780', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 983),
('38602079', 1, 'Angelica ', 'Molano Martinez', '0000-00-00', 'Nulo', '3158998469', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1673),
('38602891', 1, 'Yaneth', 'Florez Martinez', '0000-00-00', 'Nulo', '3137385246', 'YANETH.FLOREZ@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 707),
('38602967', 1, 'Lady Mercedes', 'Valencia Caste?eda', '0000-00-00', 'Nulo', '3173871457', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1406),
('38603432', 1, 'Yurany', 'Torres Casta?o', '0000-00-00', 'Nulo', '3128310632', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1480),
('38603739', 1, 'Martha Milena', 'Murillo Mosquera', '0000-00-00', 'Nulo', '3206898194', 'mi.le.niya@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 821),
('38611295', 1, 'Adriana Maria ', 'Quivano Correa', '0000-00-00', 'Nulo', '3126025865', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1253),
('38612254', 1, 'Yuli Fernanda', 'Palma Giraldo', '0000-00-00', 'Nulo', '3123817952', 'YULIFPG@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 744),
('38612678', 1, 'Niyineth', 'Prada Orjuela', '0000-00-00', 'Nulo', '3183703304', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1048),
('38613335', 1, 'Diana Marcela', 'Diaz Valderrama', '0000-00-00', 'Nulo', '3147508755', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 954),
('38614066', 1, 'Marlen', 'Herrera Osorno', '0000-00-00', 'Nulo', '3145297153', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1150),
('38642710', 1, 'Derly Yurani', 'Casta?o Rodriguez', '0000-00-00', 'Nulo', '3207850620', 'comercial.imbera@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 833),
('38643874', 1, 'Yuly Amparo', 'Henriquez Ledesma', '0000-00-00', 'Nulo', '3176940944', 'yuly2925s@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 138),
('38665340', 1, 'Sandra Lorena', 'Oidor Torres', '0000-00-00', 'Nulo', '3104616655', 's.andriss@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 739),
('38665910', 1, 'Leydi Johanna', 'Zamudio Rios', '0000-00-00', 'Nulo', '3104170267', 'LZAMUDIORIOS27@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 814),
('38667760', 1, 'Yurley', 'Colonia Castro', '0000-00-00', 'Nulo', '3186690786', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1522),
('38668890', 1, 'Narda Patricia', 'Garzon Caldas', '0000-00-00', 'Nulo', '3204646263', 'TORAXASISTENTE@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 285),
('38669493', 1, 'Eblin Edith', 'Gutierrez Torres', '0000-00-00', 'Nulo', '3166980947', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1772),
('38669799', 1, 'Diana Milena', 'Lopez Gomez', '0000-00-00', 'Nulo', '3157344710', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1217),
('38671061', 1, 'Verena ', 'Moran Ruiz', '0000-00-00', 'Nulo', '3122573832', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1299),
('38671250', 1, 'Faima Suley', 'Crabali Valencia', '0000-00-00', 'Nulo', '3218389829', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1628),
('38681060', 1, 'Adriana Maria', 'Garcia Arango', '0000-00-00', 'Nulo', '3104322500', 'LASARCAADRI@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 601),
('38682776', 1, 'Malizana', 'Sanchez Casta?eda', '0000-00-00', 'Nulo', '3122710330', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1263),
('38682917', 1, 'May Liscaren', 'Valencia Rendon', '0000-00-00', 'Nulo', '3163310362', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 957),
('38683368', 1, ' Beatriz ', 'Medina Llanos', '0000-00-00', 'Nulo', '3216662626', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1298),
('38683852', 1, 'Esmeralda', 'Moran Romero', '0000-00-00', 'Nulo', '3168613260', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1576),
('38684973', 1, 'Yury Alexandra', 'Meneses Pe?a', '0000-00-00', 'Nulo', '3207926773', 'hm@h.co', 'inactivo', 'Nulo', 0, 'Nulo', '', 319),
('38865467', 1, 'Maria Nancy', 'Cata?o Urrea', '0000-00-00', 'Nulo', '3113502270', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1360),
('39572793', 1, 'Maria Victoria', 'Prada Rangel', '0000-00-00', 'Nulo', '3217854898', 'MARIAVICTORIAPRADAR27@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 494),
('39577865', 1, 'Andrea', 'Nieto Yirley', '0000-00-00', 'Nulo', '3208043897', 'sahuesa.nieto@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 737),
('41872498', 1, 'Luz Ena', 'Rubio Arboleda', '0000-00-00', 'Nulo', '3144043709', 'LUZENA.84@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 758),
('43645405', 1, 'Beatriz Elena', 'Gomez Garcia', '0000-00-00', 'Nulo', '3186148902', 'BEATRIZGOMEZGARCIA1978@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 670),
('43702927', 1, 'Maria Elinet', 'Ciro Marin', '0000-00-00', 'Nulo', '3013585405', 'MARIA_ELINET@CCED.EDU.CO', 'inactivo', 'Nulo', 0, 'Nulo', '', 594),
('45454545', 1, 'C?rdoba', 'Prueba Melissa', '0000-00-00', 'Nulo', '54545454', 'mcordoba@q10solucion.ecom', 'inactivo', 'Nulo', 0, 'Nulo', '', 495),
('52372211', 1, 'Nilde', 'Narvaez Rosero', '0000-00-00', 'Nulo', '3218144588', 'Nildrex@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 236),
('52395929', 1, 'Susy', 'Martinez Hernandez', '0000-00-00', 'Nulo', '3005213987', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 976),
('53057393', 1, 'Dora Amalia ', 'Eastmond Cifuentes', '0000-00-00', 'Nulo', '3196682091', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1583),
('54251813', 1, 'Minerva', 'Mosquera Mosquera', '0000-00-00', 'Nulo', '3127938268', 'minervamos@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 732),
('55067924', 1, 'Ana', 'Caldos Barrera', '0000-00-00', 'Nulo', '3128587111', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1354),
('55130465', 1, 'Jenny Amparo', 'Valencia Luna', '0000-00-00', 'Nulo', '3152935973', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1475),
('59680863', 1, 'Mirna Lucia', 'Viera Mu?oz', '0000-00-00', 'Nulo', '3166257897', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1027),
('59707949', 1, 'Viviana Rocio', 'Lopez Meneses', '0000-00-00', 'Nulo', '3106222385', 'LVIVIANA474@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 625),
('59815765', 1, 'Elvia Ninfa', 'Ortega Rosero', '0000-00-00', 'Nulo', '3154575818', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1438),
('59856630', 1, 'Olga Lucia', 'Ibancuan Erazzo', '0000-00-00', 'Nulo', '3155872922', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1710),
('60328431', 1, 'Luz America', 'Linthon Llanos', '0000-00-00', 'Nulo', '3174096509', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1432),
('6097618', 1, 'Leandro', 'Ruiz Ruiz', '0000-00-00', 'Nulo', '3173179514', 'leru5912@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 653),
('6102303', 1, 'Andres Mauricio', 'Moreno Soto', '0000-00-00', 'Nulo', '3177026090', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1575),
('6103108', 1, 'Wilmar Javier', 'Benavides Aldana', '0000-00-00', 'Nulo', '3108390353', 'wilmerjb1015@hotmail.com', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 44),
('6106383', 1, 'Eduard', 'Rios Nu?ez', '0000-00-00', 'Nulo', '3184810993', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1009),
('6253248', 1, 'Fernando', 'Buitrago Chacon', '0000-00-00', 'Nulo', '3164541714', 'PROGRAMACIONSEGURIDAD@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 542),
('6254314', 1, 'Fabio Andres ', 'Vargas Grande', '0000-00-00', 'Nulo', '3166267055', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1411),
('6333285', 1, 'Frank Steven', 'Martinez Salazar', '0000-00-00', 'Nulo', '3175266697', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1545),
('6333983', 1, 'David', 'Leon Velasco', '0000-00-00', 'Nulo', '3196580137', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1248),
('63480326', 1, 'Yasmin Edith', 'Amado Florez', '0000-00-00', 'Nulo', '3177653495', 'amadoyasmin@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 537),
('6392772', 1, 'Jairo Alonso', 'Giraldo Bedoya', '0000-00-00', 'Nulo', '3136383968', 'JAIROALONSOGIRALDO@GMAIL.COM', 'inactivo', 'Nulo', 0, '3207604267', '', 51),
('6407152', 1, 'Edinson', 'Guiral Rengifo', '0000-00-00', 'Nulo', '3217588883', 'edinsonguiral14@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 133),
('65480634', 1, 'Alejandro Esteban ', 'Maya Garcia', '0000-00-00', 'Nulo', '3146305756', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1386),
('6548928', 1, 'Jimmy', 'Castro Oliveros', '0000-00-00', 'Nulo', '3137051266', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1622),
('65829558', 1, 'Marcela', 'Bocanegra Diana', '0000-00-00', 'Nulo', '3154971257', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1056),
('66555008', 1, 'Erika Andrea ', 'Caro Escaria', '0000-00-00', 'Nulo', '3154503406', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1602),
('66660008', 1, 'Luz Hermila', 'Arboleda Sanchez', '0000-00-00', 'Nulo', '3185867304', 'LUZHERMILA34@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'DOBLE TITULACION', '', 788),
('66681509', 1, 'Patricia', 'Casanova Capote', '0000-00-00', 'Nulo', '3117598636', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1358),
('66747235', 1, 'Mary', 'Monta?o Stella', '0000-00-00', 'Nulo', '3105525488', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1420),
('66752609', 1, 'Francy Janeth', 'Hernandez Londo?o', '0000-00-00', 'Nulo', '3147184820', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1041),
('66765384', 1, 'Claudia Patricia', 'Hernandez Motato', '0000-00-00', 'Nulo', '3146909289', 'claudiahdez40@hotmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION ADMON', '', 9),
('66772156', 1, 'Eugenia ', 'Valverde Cruz', '0000-00-00', 'Nulo', '3137797339', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1426),
('66801149', 1, 'Patricia', 'Diaz Castro', '0000-00-00', 'Nulo', '3165877681', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1259),
('66804159', 1, 'Claudia Viviana', 'Gonzalez Cuesta', '0000-00-00', 'Nulo', '3226198773', 'vivigonza85@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 442),
('66812354', 1, 'Amparo', 'Rosales', '0000-00-00', 'Nulo', '3153670050', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1519),
('66813468', 1, 'Betty', 'Alvarez Ramos', '0000-00-00', 'Nulo', '3206799236', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1427),
('66821279', 1, 'Dora Elisa', 'Qui?onez Cortes', '0000-00-00', 'Nulo', '3148410882', 'doraq1970@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 644),
('66826985', 1, 'Luz Janeth', 'Gutinez Obando', '0000-00-00', 'Nulo', '3103909460', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1574),
('66828360', 1, 'Gladys Astrid', 'Walter Hernandez', '0000-00-00', 'Nulo', '3153015631', 'gladys.a.walter.h@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 812),
('66836899', 1, 'Maria Lilia', 'Ramirez Castrillon', '0000-00-00', 'Nulo', '3178065267', 'marialiliaramirez72@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 645),
('66837021', 1, 'Deicy', 'Mosquera Banguera', '0000-00-00', 'Nulo', '3002499681', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1572),
('66837259', 1, 'Molina Claudia', 'Molina Claudia', '0000-00-00', 'Nulo', '3182216372', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1490),
('66841580', 1, 'Nayibe Catalina', 'Arenas Calderon', '0000-00-00', 'Nulo', '3146235011', 'c@c.com', 'egresado', 'Nulo', 0, 'Nulo', '', 82),
('66845492', 1, 'Yaneth', 'Vidal Mu?oz', '0000-00-00', 'Nulo', '3157910192', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 970),
('66845987', 1, 'Claudia', 'Ramirez Rendon', '0000-00-00', 'Nulo', '3128847080', 'claudiaramirez72@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 559),
('66846664', 1, 'Darlin', 'Becerra Rico', '0000-00-00', 'Nulo', '3174171765', 'l@l.com', 'egresado', 'Nulo', 0, 'Nulo', '', 258),
('66847772', 1, 'Ana Milena', 'Sanchez Marin', '0000-00-00', 'Nulo', '3183001100', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1339),
('66849006', 1, 'Zulima Maritza', 'Ramirez Narvaez', '0000-00-00', 'Nulo', '3117197652', 'zulima1999@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 185),
('66851710', 1, 'Rocio', 'Tenorio', '0000-00-00', 'Nulo', '3113895328', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1157),
('66852215', 1, 'Esperanza Eulalia', 'Enriquez Jurado', '0000-00-00', 'Nulo', '3007776695', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1773),
('66855789', 1, 'Hilda Patricia', 'Hernandez Mosquera', '0000-00-00', 'Nulo', '3163470781', 'hilpatri@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 615),
('66859475', 1, 'Gran Monica', 'Gran Monica', '0000-00-00', 'Nulo', '3136869601', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1448),
('66864765', 1, 'Enelia Patricia', 'Sanchez Franco', '0000-00-00', 'Nulo', '3217853858', 'PATY-7231@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 677),
('66865941', 1, 'Amanda Stella', 'Meneses Silva', '0000-00-00', 'Nulo', '3023441934', 'AMANDA.MENESES73@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 233),
('66884307', 1, 'Clara', 'Botina Rodriguez', '0000-00-00', 'Nulo', '3013452270', 'clarabrodriguez@outlook.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 778),
('66884784', 1, 'Millerlandy', 'Tafur Cardona', '0000-00-00', 'Nulo', '3122600439', 'MTAFUR@ALFAYOMEGAINSTRUMENTACION.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 561),
('66906700', 1, 'Andrea', 'Velasco Paola', '0000-00-00', 'Nulo', '3014306700', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1568),
('66912161', 1, 'Yara Viviana', 'Rengifo Gongora', '0000-00-00', 'Nulo', '3175249665', 'bailes88@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 338),
('66915289', 1, 'Liliana ', 'Guerrero Jaramillo', '0000-00-00', 'Nulo', '3206874283', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1669),
('66919111', 1, 'Sara', 'Cordoba', '0000-00-00', 'Nulo', '3104712932', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1593),
('66920176', 1, 'Luz Stella', 'Restrepo Gonzalez', '0000-00-00', 'Nulo', '3104524733', 'stellarestrepog@outlook.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 186),
('66920830', 1, 'Beatriz Eugenia', 'Asprilla Viafara', '0000-00-00', 'Nulo', '3897548', 'idiagonb@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 255),
('66925321', 1, 'Liliana Patricia', 'Ortiz Forero', '0000-00-00', 'Nulo', '3053391280', 'PATRICIAFORER@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 741),
('66926216', 1, 'Danny Piedad', 'Rosales Cuastumal', '0000-00-00', 'Nulo', '3183774241', 'danny90-20@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 395),
('66926534', 1, 'Luz Bernoy ', 'Pati?o Cachaya', '0000-00-00', 'Nulo', '3178740055', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1443),
('66927368', 1, 'Julia Cecilia', 'Silva Reina', '0000-00-00', 'Nulo', '3007720105', 'juliasilva_75@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 764),
('66927796', 1, 'Libia Liliana', 'Delgado Orozco', '0000-00-00', 'Nulo', '3225027005', 'lilo.andres.74@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 701),
('66933724', 1, 'Katerine', 'Hurtado Jimenez', '0000-00-00', 'Nulo', '3185874709', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1530),
('66949221', 1, 'Ana Milena ', 'Rivera Urrea', '0000-00-00', 'Nulo', '3153091417', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1085),
('66949949', 1, 'Trinidad Del Socorro', 'Castro Delgado', '0000-00-00', 'Nulo', '3148511947', 'tcd975@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 694),
('66951640', 1, 'Alba Lucia', 'Grisales Rico', '0000-00-00', 'Nulo', '3106321876', 'torralba77@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 294),
('66957026', 1, 'Carolina', 'Vanegas', '0000-00-00', 'Nulo', '3105784172', 'f@f.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 213),
('66958717', 1, 'Luz Marina', 'Becerra Gutierrez', '0000-00-00', 'Nulo', '3177941759', 'luzmbg27@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 686),
('66959170', 1, 'Monica Wiriya', 'Urreste Romero', '0000-00-00', 'Nulo', '3007305522', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1079),
('66960303', 1, 'Giraldo Diana Lilia', 'Ospina ', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1314),
('66968608', 1, 'Floripez', 'Castro Martines', '0000-00-00', 'Nulo', '3188871210', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1223),
('66972624', 1, 'Francia Elena', 'Giraldo Espinosa', '0000-00-00', 'Nulo', '3128382080', 'PARIS19501950@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 230),
('66977355', 1, 'Monica', 'Puentes Castro', '0000-00-00', 'Nulo', '3178183417', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1019),
('66977774', 1, 'Claudia', 'Hurtado Atehortua', '0000-00-00', 'Nulo', '3128424296', 'claudiahurtado@yahoo.es', 'egresado', 'Nulo', 0, 'Nulo', '', 303),
('66980806', 1, 'Judit', 'Marquez Sandoval', '0000-00-00', 'Nulo', '3176570345', 'judith.marquez@mecsa.co', 'inactivo', 'Nulo', 0, 'Nulo', '', 61),
('66990369', 1, 'Gomez Constanza', 'Gomez Constanza', '0000-00-00', 'Nulo', '3175800956', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1586),
('66991180', 1, 'Geimy Faride', 'Sanchez Davila', '0000-00-00', 'Nulo', '3128836520', 'y.psdavila1977@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 524),
('66991959', 1, 'Esmeralda ', 'Flor Leal', '0000-00-00', 'Nulo', '3116482666', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1470),
('66992644', 1, 'Elizabeth', 'Grajales Mafla', '0000-00-00', 'Nulo', '3166058099', 'elizabeth.grajales.asiisam@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 794),
('66994293', 1, 'Paola Andrea', 'Daza Perez', '0000-00-00', 'Nulo', '3015090998', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1054),
('66995132', 1, 'Betsy Milena', 'Buitrago Lozada', '0000-00-00', 'Nulo', '3004052655', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 989),
('66996606', 1, 'Yazmin', 'Gonzalez Ardila', '0000-00-00', 'Nulo', '3158247534', 'JAZSADI@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 610),
('66997165', 1, 'Andrea', 'Villafa?e Paola', '0000-00-00', 'Nulo', '3133805074', 'JULIANDAVID000@LIVE.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 218),
('66997743', 1, 'Claudia Lorena', 'Hoyos Garcia', '0000-00-00', 'Nulo', '3182969558', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1018),
('66999008', 1, 'Erika Andrea', 'Caro Escarria', '0000-00-00', 'Nulo', '3154903406', 'erikcaro36@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 547),
('67000428', 1, 'Paola Andrea', 'Escobar Arenas', '0000-00-00', 'Nulo', '3167535416', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 926),
('67000747', 1, 'Sanchez Lorena', 'Sanchez Lorena', '0000-00-00', 'Nulo', '3147257225', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1535),
('67002410', 1, 'Diana Milena', 'Ortegon Torres', '0000-00-00', 'Nulo', '3158119676', 'dianamile1998@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 740),
('67004620', 1, 'Anzorena', 'Rodriguez Noguera', '0000-00-00', 'Nulo', '3207748390', 'ANZORENARODRIGUEZ@GMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 393),
('67005481', 1, 'Diana Rocio', 'Ramirez Burbano', '0000-00-00', 'Nulo', '3176948856', 'DIANA.RAMIREZ@AUDIFARMA.COM.CO', 'inactivo', 'Nulo', 0, 'Nulo', '', 183),
('67006057', 1, 'Neyer', 'Bastidas Ana', '0000-00-00', 'Nulo', '3217910775', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 960),
('67006428', 1, 'Paola Andrea', 'Escobar Arenas', '0000-00-00', 'Nulo', '3167535416', 'PAOLANDREA1977@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 378),
('67006510', 1, 'Andrea', 'Lopez Amezquita', '0000-00-00', 'Nulo', '3153180188', 'anlopam@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 817),
('67011438', 1, 'Diana Maria', 'Salguero Agrado', '0000-00-00', 'Nulo', '3126144567', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1301),
('67012293', 1, 'Magnolia ', 'Galeno Toro', '0000-00-00', 'Nulo', '3155374073', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1422),
('67013356', 1, 'Paola Andrea', 'Sanchez Meza', '0000-00-00', 'Nulo', '3104092841', 'POLIANDRESAN78@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 762),
('67013726', 1, 'Ana Cristina', 'Dehakiz Hernandez', '0000-00-00', 'Nulo', '3172198725', 'anac_dehakiz@yahoo.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 699),
('67018375', 1, 'Jakeline', 'Macca Cortes', '0000-00-00', 'Nulo', '3053575360', 'JAKELINE@CCED.EDU.CO', 'inactivo', 'Nulo', 0, 'Nulo', '', 552),
('67019335', 1, 'Maritza', 'Castillo Riascos', '0000-00-00', 'Nulo', '3117224505', 'MARITZA@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 432),
('67019617', 1, 'Jenny', 'Arias Garzon', '0000-00-00', 'Nulo', '3128847080', 'recepcion@bellezaexpress.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 577),
('67020863', 1, 'Lorena Idali', 'Qui?ones Henao', '0000-00-00', 'Nulo', '3217570961', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1768),
('67021762', 1, 'Viviana', 'Gonzales Guzman', '0000-00-00', 'Nulo', '3153399524', 'vivan_83@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 441),
('67024395', 1, 'Gloria Margarita', 'Angulo Monta?o', '0000-00-00', 'Nulo', '3187952032', 'glorymontano@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 398),
('67027220', 1, 'Diana', 'Bravo', '0000-00-00', 'Nulo', '3167939157', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 936),
('67027803', 1, 'Carolina ', 'Ospina Davila', '0000-00-00', 'Nulo', '3044771138', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1597),
('67028546', 1, 'Luz Elena', 'Mejia Ospina', '0000-00-00', 'Nulo', '3163120133', 'ELENAJUAN8@HOTMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 317),
('67029268', 1, 'Claudia Patricia', 'Belalcazar Solis', '0000-00-00', 'Nulo', '3122600439', 'claudiapatriciabelalcazar@gmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 580),
('67031053', 1, 'Lina Constanza', 'Vinasco Bedoya', '0000-00-00', 'Nulo', '3214046973', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1260),
('67031836', 1, 'Ingrid Johanna', 'Rendon Acosta', '0000-00-00', 'Nulo', '3127508549', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1758),
('67032678', 1, ' Ana Arboleda', 'Martinez Mera', '0000-00-00', 'Nulo', '3116707061', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1325),
('67037412', 1, 'Katherine', 'Palacio Figueroa', '0000-00-00', 'Nulo', '3184144516', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 968),
('67037533', 1, 'Milena', 'Delgado Ana', '0000-00-00', 'Nulo', '3105498091', 'anmide1720@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 700),
('67038128', 1, 'Leidy Johanna', 'Arenas Hoyos', '0000-00-00', 'Nulo', '3174399907', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1279),
('67038500', 1, 'Viviana Maria', 'Ortiz Meza', '0000-00-00', 'Nulo', '3146536687', 'vima.o@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 803),
('67041026', 1, 'Mabel Johanna', 'Zu?iga Sanchez', '0000-00-00', 'Nulo', '3128680443', 'atuca6640@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 901),
('67045387', 1, 'Alejandra', 'Echeverry', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1604),
('67049030', 1, 'Leidy Tatiana ', 'Aguilar Gonzalez', '0000-00-00', 'Nulo', '3136392063', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1690),
('67051027', 1, 'Maria Nidia', 'Parra Sanchez', '0000-00-00', 'Nulo', '3207716688', 'marianidiaparra@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 893),
('71711588', 1, 'Angel Alberto', 'Ducuara Prieto', '0000-00-00', 'Nulo', '3122800168', '3333@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 36),
('7382963', 1, 'Mizael de Jesus ', 'Combatt Paternina', '0000-00-00', 'Nulo', '3218289678', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1501),
('74433548', 1, 'Diego Emerson', 'Acosta Puentes', '0000-00-00', 'Nulo', '3166681870', 'acostapuentes433548@outlook.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 567),
('75002496', 1, 'Yury Nathalia', 'Arteaga Casta?o', '0000-00-00', 'Nulo', '3162484076', 'YUNARJM@GMAIL.COM', 'egresado', 'Nulo', 0, 'Nulo', '', 665),
('76331008', 1, 'Juan Manuel', 'Bonilla Hernandez', '0000-00-00', 'Nulo', '3212232116', 'NNN@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 541),
('78714261', 1, 'Juan Bautista', 'Montes Acosta', '0000-00-00', 'Nulo', '3107002739', 'JUANBAUTISTA@CCED.EDU.CO', 'inactivo', 'Nulo', 0, 'Nulo', '', 39),
('80831786', 1, 'Andres', 'Sanabria', '0000-00-00', 'Nulo', '3138893448', 'gerencia@cloudpbx.com.co', 'inactivo', 'Nulo', 0, 'Nulo', '', 42),
('87718628', 1, 'Guider Olegario', 'Medicis Chapuel', '0000-00-00', 'Nulo', '3214782343', 'GUIDER26@YAHOO.ES', 'egresado', 'Nulo', 0, 'Nulo', '', 315),
('87944006', 1, 'Jeffer Alfonso', 'Qui?ones Valencia', '0000-00-00', 'Nulo', '3005309990', 'JEFFER@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 534),
('9302914256', 1, 'Lina Marcela ', 'Benitez Minda', '0000-00-00', 'Nulo', '3104618230', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1655),
('93031811277', 1, 'Lina Melisa ', 'Castro Tierradentro', '0000-00-00', 'Nulo', '3147340778', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1660),
('93041600878', 1, 'Zaira Daniela ', 'Sanchez Moreno', '0000-00-00', 'Nulo', '3148828225', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1682),
('93050720673', 1, 'Luisa Fernanda ', 'Castellanos Velez', '0000-00-00', 'Nulo', '3164190708', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1659),
('93052400218', 1, 'Paola Isabel ', 'Ordo?ez Alban', '0000-00-00', 'Nulo', '3175916073', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1675),
('93061521532', 1, 'Yudy Meliza ', 'Guarnizo Contreras', '0000-00-00', 'Nulo', '3164456789', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1705),
('93071913684', 2, 'David', 'Cifuentes velez', '0000-00-00', 'Nulo', '3177964224', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1617),
('9308190670', 1, 'Liseth Tatiana', 'Herrera Diaz', '0000-00-00', 'Nulo', 'vacio', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1563),
('93090813526', 2, 'Carlos Alberto', 'Villaci Ordo?ez', '0000-00-00', 'Nulo', '3162952926', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1471),
('93091430671', 1, 'Sirley Yoana ', 'Pineda Caicedo', '0000-00-00', 'Nulo', '3188893296', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1677),
('9310016062', 2, 'Jhon Stiven', 'Quiroz Uran', '0000-00-00', 'Nulo', '3206450576', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1401),
('93100221010', 1, 'Gerlyn Andre', 'Jimenez Bedoya', '0000-00-00', 'Nulo', '3105252750', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1711),
('93101513236', 1, 'Angie Johana', 'Guerrero Ruiz', '0000-00-00', 'Nulo', '3152651714', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1707),
('93110808117', 1, 'Angie Steffany', 'Tabares Mejia', '0000-00-00', 'Nulo', '3146467097', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1684),
('93111307979', 1, 'Daniela', 'Borja Holguin', '0000-00-00', 'Nulo', '3136173499', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1695),
('93120307019', 1, 'Maritza Elena ', 'Botina Pino', '0000-00-00', 'Nulo', '3122372194', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1656),
('93120420184', 1, 'Brayan ', 'Pati?o Luna', '0000-00-00', 'Nulo', '3103904794', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1397),
('93121109547', 1, 'Carlos Guillermo ', 'Sanchez Sanchez', '0000-00-00', 'Nulo', '3157902179', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1404),
('93121314337', 1, 'Maria Alexandra', 'Ramirez Restrepo', '0000-00-00', 'Nulo', '3137751836', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1680),
('93121515588', 1, 'Yenzo Orlando', 'Angulo Sandoval', '0000-00-00', 'Nulo', '3117162702', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1643),
('93121714173', 2, 'Diana Isabel', 'Bola?os VIllalba', '0000-00-00', 'Nulo', '3155345911', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1351),
('93121813058', 1, 'Angelly Brigitte', 'Angulo Cordoba', '0000-00-00', 'Nulo', '3166975726', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1693),
('93122412359', 1, 'Maria Alejandra ', 'Gonzales Pulgarin', '0000-00-00', 'Nulo', '3104602730', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1668),
('93122914567', 1, 'Jhon Eduard', 'Centeno Cortes', '0000-00-00', 'Nulo', '3168143885', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1361),
('94022404622', 2, 'Humberto', 'Lozano Aristizabal', '0000-00-00', 'Nulo', '3137410348', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1553),
('94031320628', 2, 'Daniel Alfredo', 'Pardo Gonzalez', '0000-00-00', 'Nulo', '3166526811', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1520),
('94032304723', 2, 'Juan David', 'Zu?iga Martinez', '0000-00-00', 'Nulo', '3218351898', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1464),
('94032605600', 2, 'Jhoan Carlo', 'Marmolejo Quintero', '0000-00-00', 'Nulo', '3158384867', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1546),
('94032606002', 2, 'Daniela Aadrea ', 'Rubiano Montero', '0000-00-00', 'Nulo', '3127766594', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1403),
('94040304414', 1, 'Betsey Liseth', 'Garcia Colina', '0000-00-00', 'Nulo', '3103825054', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1704),
('94041505162', 2, 'Jhon Jairo', 'Quijano Realpe', '0000-00-00', 'Nulo', '3177266777', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1506),
('94051705020', 2, 'Javier Andres ', 'Garcia Enriquez', '0000-00-00', 'Nulo', '3174084612', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1371),
('94052604430', 1, ' Marilin', 'Pati?o Talaga', '0000-00-00', 'Nulo', '3103927372', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1516),
('94060304755', 1, 'Cinthia Melissa', 'Alcibar Ruiz', '0000-00-00', 'Nulo', '3158345392', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1343),
('94062505847', 2, 'John Anderson', 'Garces Cardona', '0000-00-00', 'Nulo', '3172895542', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1608),
('94064872', 1, 'Daniel Andres ', 'Alonso Restrepo', '0000-00-00', 'Nulo', '3157363256', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1646),
('94070404677', 1, 'Angie Daniela ', 'Possu Caracas', '0000-00-00', 'Nulo', '3157685592', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1678),
('94071209886', 2, 'Nestor Enrique', 'Zapata Mina', '0000-00-00', 'Nulo', '3148597347', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1468),
('94071509', 1, 'Cesar Julio', 'Trejos Mu?oz', '0000-00-00', 'Nulo', '3183377169', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1483),
('94074192', 1, 'Felipe', 'Lopez Andres', '0000-00-00', 'Nulo', '3004648975', 'a-fel@hotmail.com', 'egresado', 'Nulo', 0, 'DOBLE TITULACION CONTA', '', 145),
('94082404885', 2, 'Gustavo Adolfo', 'Pinto Sanchez', '0000-00-00', 'Nulo', '3177921112', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1512),
('94082714108', 2, 'Matius Alejandro', 'Chica Herrera', '0000-00-00', 'Nulo', '3113922835', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1611),
('94083104737', 1, 'Paula Andrea ', 'Camayo Cifuentes', '0000-00-00', 'Nulo', '3113080426', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1658),
('94092633688', 2, 'Erick Antonio', 'Ospina Paredes', '0000-00-00', 'Nulo', '3218836819', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1526),
('94154961', 1, 'Gesner', 'Lopez Ramirez', '0000-00-00', 'Nulo', '3137975675', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1003),
('94366271', 1, 'Jilmer ', 'Velasquez Vargas', '0000-00-00', 'Nulo', '3155177604', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1473),
('94374912', 1, 'Fernando ', 'Soto Quiroz', '0000-00-00', 'Nulo', '3173257885', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1316),
('94379651', 1, 'Jose Orlay', 'Alomias Martinez', '0000-00-00', 'Nulo', '3188161034', 'joammart@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 570),
('94400253', 1, 'Freddy', 'Echevery Caicedo', '0000-00-00', 'Nulo', '3215745182', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 997),
('94417542', 1, 'Edward Robert', 'Varela Rosero', '0000-00-00', 'Nulo', '3122524357', 'varela-01@hotmail.com', 'egresado', 'Nulo', 0, 'Nulo', '', 34),
('94420376', 1, 'Howard Andres', 'Riascos Ordo?ez', '0000-00-00', 'Nulo', '3136558394', 'almacenagromarino@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 187),
('94421432', 1, 'Juan Carlos', 'Hernandez Rengifo', '0000-00-00', 'Nulo', '3155539742', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1286),
('94422933', 1, 'Gilmer Stivel', 'Alvarez Salas', '0000-00-00', 'Nulo', '3175456027', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1778),
('94462794', 1, 'Franco Nel', 'Quiroga Cortes', '0000-00-00', 'Nulo', '3136094477', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1119),
('94488738', 1, 'Hermes Fabian', 'Tutistar Botina', '0000-00-00', 'Nulo', '3104702636', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 947),
('94492215', 1, 'German', 'Nieto Zapata', '0000-00-00', 'Nulo', '3188270707', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1536),
('94496513', 1, 'Huberney', 'Bola?os Martinez', '0000-00-00', 'Nulo', '3175890609', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1092);
INSERT INTO `estudiantes` (`estudiantes_no_documento`, `estudiantes_tipo_documento`, `estudiantes_nombre`, `estudiantes_apellidos`, `estudiantes_fecha_nacimiento`, `estudiantes_genero`, `estudiantes_telefono`, `estudiantes_correo`, `estudiantes_estado`, `estudiantes_direccion`, `estudiantes_adjunto_id`, `estudiantes_observaciones`, `estudiantes_doble_titulacion`, `estudiantes_doble_titulacion_id`) VALUES
('94502047', 1, 'Juan Carlos', 'Daza Santamaria', '0000-00-00', 'Nulo', '3104744181', 'jkdaza77@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 597),
('94502440', 1, 'Gilberto', 'Rivera Isaza', '0000-00-00', 'Nulo', '3215020838', 'gilbertori77@hotmail.com', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 67),
('94507115', 1, 'Alexander', 'Calambas Naranjo', '0000-00-00', 'Nulo', '3153298408', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1632),
('94517910', 1, 'Alexander', 'Tutistar Bastidas', '0000-00-00', 'Nulo', '3045306229', 'alex080722@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 562),
('94531388', 1, 'Maro Aly', 'Ceballos Ortiz', '0000-00-00', 'Nulo', '3163418899', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1621),
('94531862', 1, 'Robert Alexander', 'Aranzazu Ricaurte', '0000-00-00', 'Nulo', '3105172213', 'reacing24@hotmail.Com', 'egresado', 'Nulo', 0, 'Nulo', '', 681),
('94534000', 1, 'Jose Antonio', 'Vivas Castillo', '0000-00-00', 'Nulo', '3216900107', 'chomelo.10@hotmail.es', 'egresado', 'Nulo', 0, 'Nulo', '', 219),
('94538347', 1, 'Andres Giovanny', 'Mosquera Florez', '0000-00-00', 'Nulo', '3145926481', 'AGMOSQUERA6269@HOTMAIL.COM', 'inactivo', 'Nulo', 0, 'Nulo', '', 554),
('94538479', 1, 'Winston Mario', 'Aguas Parra', '0000-00-00', 'Nulo', '3184901084', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1649),
('94541232', 1, 'Juan Ricardo', 'Hurtado Capote', '0000-00-00', 'Nulo', '3105296879', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1742),
('94542994', 1, 'Nestor Raul', 'Pretel Moreno', '0000-00-00', 'Nulo', '3044998149', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1527),
('94556809', 1, 'Diego Andres', 'Mora Zu?iga', '0000-00-00', 'Nulo', '3013646044', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1388),
('94556840', 1, 'Luis Eduardo', 'Gironza Duran', '0000-00-00', 'Nulo', '3187837843', 'Nulo', 'egresado', 'Nulo', 0, 'Nulo', '', 1069),
('94558382', 1, 'Jorge Luis', 'Hincapie Alzate', '0000-00-00', 'Nulo', '3218782325', 'jorgehinca1985@gmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 444),
('95021809161', 2, 'Victor Hugo', 'Garaya Sierra', '0000-00-00', 'Nulo', '3105988959', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1609),
('96020921983', 1, 'Dayron', 'Isaza Moreno', '0000-00-00', 'Nulo', '3104705656', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1390),
('96030414036', 1, 'Erika Julieth', 'Amaya Leiva', '0000-00-00', 'Nulo', '3113371560', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1779),
('96082021016', 1, 'Maria Camila', 'Velez Munoz', '0000-00-00', 'Nulo', '3168528472', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1761),
('96092619831', 2, 'Karen Julieth', 'Miranda Madro?ero', '0000-00-00', 'Nulo', '3163787373', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1723),
('97082804696', 1, 'Alexandra', 'Guarnizo Castro', '0000-00-00', 'Nulo', '3165867786', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1755),
('97122407890', 1, 'Daniela', 'Gil Hernandez', '0000-00-00', 'Nulo', '3182133424', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1762),
('97122504054', 2, 'Jarlynn Carolina', 'Soto Toro', '0000-00-00', 'Nulo', '3117673508', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1719),
('9806697', 1, 'Nelson', 'Duque Martinez', '0000-00-00', 'Nulo', '3206937244', 'conquistadorlospinos@hotmail.com', 'inactivo', 'Nulo', 0, 'Nulo', '', 400),
('98379043', 1, 'Hugo Andres', 'Ramos Cardenas', '0000-00-00', 'Nulo', '3122256901', 'harc0611@gmail.com', 'inactivo', 'Nulo', 0, 'NO PRESENTO PROYECTO', '', 66),
('99022106275', 2, 'Milagros', 'Epia Luana', '0000-00-00', 'Nulo', '3206302970', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1221),
('99022613037', 2, 'Lina Marcela', 'Aguirre Portillo', '0000-00-00', 'Nulo', '3235829035', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1225),
('99050403820', 1, 'Briant Stiven', 'Osorio Castro', '0000-00-00', 'Nulo', '3106193009', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1329),
('99050806304', 2, 'Esteban Andrey', 'Campo Duque', '0000-00-00', 'Nulo', '3015500345', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1185),
('99060207476', 2, 'Karen Dayana ', 'Rodriguez Riascos', '0000-00-00', 'Nulo', '3185126166', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1224),
('99071413116', 1, 'Valentina', 'Agudelo Perez', '0000-00-00', 'Nulo', '3152955615', 'erikaperez2014@outlook.es', 'inactivo', 'Nulo', 0, 'Nulo', '', 251),
('99092107007', 1, 'Daniel', 'Montero Gonzalez', '0000-00-00', 'Nulo', '3137174046', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1296),
('99100212028', 1, 'Yefer Esteban', 'Ojeda Mu?oz', '0000-00-00', 'Nulo', '3197804313', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1328),
('99101610019', 2, 'Paula Camila', 'Vasquez Hernandez', '0000-00-00', 'Nulo', '3223077680', 'Nulo', 'inactivo', 'Nulo', 0, 'Nulo', '', 1122);

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
-- Estructura de tabla para la tabla `grupos_estudiantes`
--

CREATE TABLE `grupos_estudiantes` (
  `grupos_id` int(11) NOT NULL,
  `grupos_estudiantes_estudiantes_no_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jornadas`
--

CREATE TABLE `jornadas` (
  `jornadas_codigo` int(11) NOT NULL,
  `jornadas_periodo` enum('Diurna','Nocturna','Sabatina') NOT NULL,
  `jornadas_horarios` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `programas_nombre` varchar(255) NOT NULL,
  `programas_descripcion` varchar(255) NOT NULL,
  `programas_precio` varchar(255) NOT NULL,
  `programas_duracion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `roles_id` int(11) NOT NULL,
  `roles_nombre` varchar(255) NOT NULL,
  `roles_codigo_permisos` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  MODIFY `adjuntos_id` int(11) NOT NULL AUTO_INCREMENT;

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
