<?php
require "../src/controllers/session_start.php";
if (substr($binperms, 9, 1) == 1 || substr($binperms, 9, 1) == 2) {
?>
    <html>

    <head>
        <title>SAGE - Consulta de estudiantes</title>
        <link rel="icon" type="image/x-icon" href="assets/imgs/favicon-CCED.png">
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
            <?php require_once "../src/models/leftmenu.php"; ?>
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
                                <option value="co">Código</option>
                            </select>


                        </div>
                        <div class="inputs">
                            <label for="lname">Nro documento</label>
                            <input type="text" id="estudiantes_no_documento" name="lname" required>
                            <input type="hidden" id="estudiantes_no_documento_hidden" name="idHidden">
                        </div>
                        <div class="inputs">
                            <label for="dni">Nombre</label>
                            <input type="text" id="estudiantes_nombre" name="estudiantes_nombre">
                        </div>
                        <div class="inputs">
                            <label for="apellido">Apellidos</label>
                            <input type="text" name="estudiantes_apellidos" id="estudiantes_apellidos">
                        </div>
                        <div class="inputs">
                            <label for="estudiantes_fecha_nacimiento">Fecha de nacimiento</label>
                            <input type="date" id="estudiantes_fecha_nacimiento">
                        </div>
                        
                        <div class="inputs">
                            <label for="estudiantes_correo">Correo electronico</label>
                            <input type="text" id="estudiantes_correo" name="estudiantes_correo">
                            
                        </div>
                        <div class="inputs">
                            <label for="">Teléfono</label>
                            <input type="number" name="telefonoInput" id="estudiantes_telefono" placeholder="">
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

                        <div  class="inputs">
                            <label for="estudiantes_direccion">Dirección:</label>
                            <input type="text" name="" id="estudiantes_direccion">
                        </div>
                        
                        
                        <div class="inputs">
                            <label for="estudiantes_observaciones">Observaciones:</label>
                            <textarea name="" id="estudiantes_observaciones" rows="10" cols="50"></textarea>
                        </div>
                        <br>
                        <div class="">
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