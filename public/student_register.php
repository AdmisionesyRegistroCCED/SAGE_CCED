<?php
require "../src/controllers/session_start.php";
if (substr($binperms, 9, 1) == 2) {
?>
    <html>

    <head>
        <title>SAGE - Registro de estudiantes</title>
        <link rel="icon" type="image/x-icon" href="assets/imgs/favicon-CCED.png">
        <link rel="stylesheet" href="assets/css/main.css">
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
                <div id="main" class="main on">
                    <?php if (isset($_SESSION['message'])): ?>
                        <div class="notification <?php echo $_SESSION['msg_type']; ?>" id="notification">
                            <?php
                            echo $_SESSION['message'];
                            unset($_SESSION['message']);
                            unset($_SESSION['msg_type']);
                            ?>
                        </div>
                    <?php endif; ?>
                    <div class="headerdataform">
                        <h1 class="mindata_username">Registro de estudiante</h1>
                        <!-- <a class="auploadcsv" href="../src/controllers/uploadcsv.php">Cargar Csv</a> -->
                    </div>
                    <hr><br>
                    <form id="formRegistrarEstudiante" class="container_register">
                        <div>
                            <label for="estudiantes_tipo_documento">Tipo de documento *</label>
                            <select required name="estudiantes_tipo_documento" id="estudiantes_tipo_documento" >
                                <option value="">Seleccione una opción</option>
                                <option value="ti">Tarjeta de identidad</option>
                                <option value="cc">Cedula de ciudadania</option>
                                <option value="ce">Cedula de extranjeria</option>
                                <option value="co">Código</option>
                            </select>
                        </div>
                        <div>
                            <label for="estudiantes_no_documento">Numero de documento *</label>
                            <input type="number" id="estudiantes_no_documento" name="dni" required>
                        </div>
                        <div>
                            <label for="estudiantes_nombre">Nombres *</label>
                            <input type="text" id="estudiantes_nombre" name="fname" required>
                        </div>
                        <div>
                            <label for="lname">Apellidos *</label>
                            <input type="text" id="estudiantes_apellidos" name="lname" required>
                        </div>
                        <div id="fecha">
                            <label for="estudiantes_fecha_nacimiento">Fecha de nacimiento</label>
                            <input type="date" id="estudiantes_fecha_nacimiento" name="fecha_nacimiento" >
                        </div>
                        <div id="genero">
                            <label for="estudiantes_genero">Genero</label>
                            <select id="estudiantes_genero" name="gender">
                                <option value="Nulo">Seleccione una opción</option>
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                            </select>
                        </div>
                        <div>
                            <label for="estudiantes_direccion">Teléfono (Fijo/Celular)</label>
                            <input type="number" id="estudiantes_telefono" name="phone" min="0">
                        </div>
                        <div>
                            <label for="estudiantes_direccion">Dirección</label>
                            <input type="text" id="estudiantes_direccion">
                        </div>
                        <div>
                            <label for="estudiantes_correo">Correo electronico:</label>
                            <input type="email" id="estudiantes_correo" name="email">
                        </div>
                        <div>
                            <label for="estudiantes_estado">Estado:</label>
                            <select name="status" id="estudiantes_estado" required>
                                <option value="activo">Activo</option>
                                <option value="inactivo">Inactivo</option>
                                <option value="Egresado">Egresado</option>
                            </select>
                        </div>
                        <div class="full-witdh ">
                            <div class="container_register no-Flex">
                                <label for="estudiantes_observaciones">Observaciones:</label>
                                <textarea name="" id="estudiantes_observaciones" rows="5" cols="50" resize=""></textarea>
                            </div>
                        </div>
                        <div class="">
                            <button type="submit" class="submit-btn" id="btnRegistrar">Registrar</button>
                        </div>

                    </form>
                </div>
                <footer class=".footer">
                    <?php require_once "../src/models/footer.php" ?>
                </footer>
            </div>
        </main>
        <!-- <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script> -->

        <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="assets/js/registrarEstudiante.js" type="module"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/toggleMenu.js"></script>
    </body>

    </html>

<?php
} else {
    header("location: dashboard.php");
}
?>