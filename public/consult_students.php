<?php
require "../src/controllers/session_start.php";
if (substr($binperms, 9, 1) == 1 || substr($binperms, 9, 1) == 2) {
?>
    <html>

    <head>
        <title>SAGE - Consulta de estudiantes</title>
        <link rel="stylesheet" href="assets/css/main.css">
        <!-- Datables links -->
        <link href="https://cdn.datatables.net/v/dt/dt-2.1.8/r-3.0.3/datatables.min.css" rel="stylesheet">
        <!-- <link href="https://cdn.datatables.net/v/dt/dt-2.1.8/datatables.min.css" rel="stylesheet"> -->
        <!-- <link rel="stylesheet" href="assets/css/datatable/datatables.min.css"> -->
    </head>

    <body>
        <header>
            <?php require_once "../src/models/header.php" ?>
        </header>
        <main>
            <?php

            require_once "../src/models/leftmenu.php";

            ?>
            <div class="structure">
                <div id="tabla" class="main on">
                    <h1 class="mindata_username">Consulta de estudiantes</h1>
                    <!-- <p class="infoinmain_topp">Esta es tu página de inicio</p> -->
                    <hr><br>
                    <table id="myTable" class="">
                        <thead>
                            <tr>
                                <th>Tipo documento</th>
                                <th>Documento</th>
                                <!-- Cubre campo nombre y apellido -->
                                <th>Nombre completo</th>
                                <th>Teléfono</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="">
                            <!-- información render desde ajax -->
                        </tbody>
                    </table>
                </div>
                <footer>
                    <?php require_once "../src/models/footer.php" ?>
                </footer>
            </div>
            <!-- Modal para editar estudiante -->
            <div id="edit-modal" class="modal">
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <h2 id="modal-title">Editar Estudiante</h2>
                    <form id="edit-form">
                        <div class="inputs">

                            <label for="estudiantes_tipo_documento">Tipo de documento</label>
                            <select name="estudiantes_tipo_documento" id="estudiantes_tipo_documento" required>
                                <option value="ti">Tarjeta de identidad</option>
                                <option value="cc">Cedula de ciudadania</option>
                                <option value="ce">Cedula de extranjeria</option>
                            </select>


                        </div>
                        <div class="inputs">
                            <label for="lname">Nro documento</label>
                            <input type="text" id="estudiantes_no_documento" name="lname" required>
                            <input type="hidden" id="estudiantes_no_documento_hidden" name="idHidden" required>


                        </div>

                        <div class="inputs">
                            <label for="dni">Nombre</label>
                            <input type="text" id="estudiantes_nombre" name="estudiantes_nombre" required>
                        </div>
                        <div class="inputs">
                            <label for="apellido">Apellidos</label>
                            <input type="text" name="estudiantes_apellidos" id="estudiantes_apellidos">
                        </div>
                        <div class="inputs">
                            <label for="estudiantes_fecha_nacimiento">Fecha de nacimiento</label>
                            <input type="date" id="estudiantes_fecha_nacimiento" name="estudiantes_fecha_nacimiento" required>
                        </div>

                        <div class="inputs">
                            <label for="estudiantes_correo">Correo electronico</label>
                            <input type="email" id="estudiantes_correo" name="estudiantes_correo" required>
                        </div>
                        <div class="inputs">
                            <label for="">Teléfono</label>
                            <input type="number" name="estudiantes_telefono" id="estudiantes_telefono">
                        </div>
                        <div class="inputs">
                            <label for="estudiantes_genero">Genero</label>
                            <select id="estudiantes_genero" name="estudiantes_genero" required>
                                <option value="Nulo">Nulo</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                            </select>
                        </div>
                        <div class="inputs">
                            <label for="estudiantes_estado">Estado</label>
                            <select name="estudiantes_estado" id="estudiantes_estado" required>
                                <option value="Activo">Activo</option>
                                <option value="Inactivo">Inactivo</option>
                                <option value="Egresado">Egresado</option>
                                <option value="Inhabilitado">Inhabilitado</option>
                            </select>
                        </div>
                        <div>
                            <label for="estudiantes_ciudad_exp">Ciudad Expedición</label>
                            <select class="" id="estudiantes_ciudad_exp">
                                <option value="Sin Ciudad"></option>
                                <option value="Arauca">Arauca</option>
                                <option value="Armenia">Armenia</option>
                                <option value="Barranquilla">Barranquilla</option>
                                <option value="Bogotá">Bogotá</option>
                                <option value="Bucaramanga">Bucaramanga</option>
                                <option value="Cali">Cali</option>
                                <option value="Cartagena">Cartagena</option>
                                <option value="Cúcuta">Cúcuta</option>
                                <option value="Florencia">Florencia</option>
                                <option value="Ibagué">Ibagué</option>
                                <option value="Leticia">Leticia</option>
                                <option value="Manizales">Manizales</option>
                                <option value="Medellín">Medellín</option>
                                <option value="Mitú">Mitú</option>
                                <option value="Mocoa">Mocoa</option>
                                <option value="Montería">Montería</option>
                                <option value="Neiva">Neiva</option>
                                <option value="Pasto">Pasto</option>
                                <option value="Pereira">Pereira</option>
                                <option value="Popayán">Popayán</option>
                                <option value="Puerto Carreño">Puerto Carreño</option>
                                <option value="Puerto Inírida">Puerto Inírida</option>
                                <option value="Quibdó">Quibdó</option>
                                <option value="Riohacha">Riohacha</option>
                                <option value="San Andrés">San Andrés</option>
                                <option value="San José del Guaviare">San José del Guaviare</option>
                                <option value="Santa Marta">Santa Marta</option>
                                <option value="Sincelejo">Sincelejo</option>
                                <option value="Tunja">Tunja</option>
                                <option value="Valledupar">Valledupar</option>
                                <option value="Villavicencio">Villavicencio</option>
                                <option value="Yopal">Yopal</option>
                            </select>
                        </div>
                        <div>
                            <label for="estudiantes_depto_exp">Departamento de expedición</label>
                            <select name="" id="estudiantes_depto_exp">
                                <option value="Sin Departamento"></option>
                                <option value="Amazonas">Amazonas</option>
                                <option value="Antioquia">Antioquia</option>
                                <option value="Arauca">Arauca</option>
                                <option value="Atlántico">Atlántico</option>
                                <option value="Bolívar">Bolívar</option>
                                <option value="Boyacá">Boyacá</option>
                                <option value="Caldas">Caldas</option>
                                <option value="Caquetá">Caquetá</option>
                                <option value="Casanare">Casanare</option>
                                <option value="Cauca">Cauca</option>
                                <option value="Cesar">Cesar</option>
                                <option value="Chocó">Chocó</option>
                                <option value="Córdoba">Córdoba</option>
                                <option value="Cundinamarca">Cundinamarca</option>
                                <option value="Guainía">Guainía</option>
                                <option value="Guaviare">Guaviare</option>
                                <option value="Huila">Huila</option>
                                <option value="La Guajira">La Guajira</option>
                                <option value="Magdalena">Magdalena</option>
                                <option value="Meta">Meta</option>
                                <option value="Nariño">Nariño</option>
                                <option value="Norte de Santander">Norte de Santander</option>
                                <option value="Putumayo">Putumayo</option>
                                <option value="Quindío">Quindío</option>
                                <option value="Risaralda">Risaralda</option>
                                <option value="San Andrés y Providencia">San Andrés y Providencia</option>
                                <option value="Santander">Santander</option>
                                <option value="Sucre">Sucre</option>
                                <option value="Tolima">Tolima</option>
                                <option value="Valle del Cauca">Valle del Cauca</option>
                                <option value="Vaupés">Vaupés</option>
                                <option value="Vichada">Vichada</option>
                            </select>
                        </div>
                        <div class="inputs">
                            <label for="estudiantes_observaciones">Observaciones:</label>
                            <textarea name="" id="estudiantes_observaciones" rows="10" cols="50"></textarea>
                        </div>
                        <br>
                        <div class="inputs">
                            <button type="submit" class="submit-btn" id="submitModal">Guardar Cambios</button>
                        </div>
                    </form>
                </div>
            </div>
        </main>

        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
        <!-- Primero jquery -->
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <!-- Segundo datatable -->
        <script src="https://cdn.datatables.net/v/dt/dt-2.1.8/datatables.min.js"></script>
        <!-- Tercero script main.js -->
        <script src="assets/js/toggleMenu.js"></script>
        <script src="assets/js/main.js"></script>


    </body>

    </html>
<?php
} else {
    header("location: dashboard.php");
}
?>