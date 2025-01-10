<?php
require "../src/controllers/session_start.php";
if (substr($binperms, 9, 1) == 2) {
?>
    <html>

    <head>
        <title>SAGE - Registro de estudiantes</title>
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
                            unset($_SESSION['message']); // Limpiar el mensaje después de mostrarlo
                            unset($_SESSION['msg_type']); // Limpiar el tipo de mensaje después de mostrarlo
                            ?>
                        </div>
                    <?php endif; ?>
                    <div class="headerdataform">
                        <h1 class="mindata_username">Registro de estudiante</h1>
                        <a class="auploadcsv" href="../src/controllers/uploadcsv.php">Cargar Csv</a>
                        <!-- <form id="uploadForm" action="../src/controllers/uploadcsv.php" method="post" enctype="multipart/form-data">
                        <label for="file">Cargar archivo</label>
                        <input type="file" name="file" id="file" accept=".csv">
                        <input type="submit" value="Subir">
                    </form> -->
                    </div>
                    <hr><br>
                    <form id="formRegistrarEstudiante">
                        <div class="container_register">
                            <div>
                                <label for="estudiantes_nombre">Nombres</label>
                                <input type="text" id="estudiantes_nombre" name="fname" required>
                            </div>
                            <div>
                                <label for="lname">Apellidos</label>
                                <input type="text" id="estudiantes_apellidos" name="lname" required>
                            </div>
                            <div>
                                <label for="estudiantes_tipo_documento">Tipo de documento</label>
                                <select name="dni_type" id="estudiantes_tipo_documento" required>
                                    <option value="--">Seleccione una opción</option>
                                    <option value="ti">Tarjeta de identidad</option>
                                    <option value="cc">Cedula de ciudadania</option>
                                    <option value="ce">Cedula de extranjeria</option>
                                </select>
                            </div>
                            <div>
                                <label for="estudiantes_no_documento">Numero de documento</label>
                                <input type="number" id="estudiantes_no_documento" name="dni" required>
                            </div>
                            <div>
                                <label for="estudiantes_fecha_nacimiento">Fecha de nacimiento</label>
                                <input type="date" id="estudiantes_fecha_nacimiento" name="fecha_nacimiento" required>
                            </div>
                            <div>
                                <label for="estudiantes_genero">Genero</label>
                                <select id="estudiantes_genero" name="gender" required>
                                    <option value="Nulo">Seleccione una opción</option>
                                    <option value="Masculino">Masculino</option>
                                    <option value="Femenino">Femenino</option>
                                </select>
                            </div>
                            <div>
                                <label for="estudiantes_telefono">Numero de telefono</label>
                                <input type="text" id="estudiantes_telefono" name="phone" required>
                            </div>
                            <div>
                                <label for="estudiantes_correo">Correo electronico</label>
                                <input type="email" id="estudiantes_correo" name="email" required>
                            </div>
                            <div>
                                <label for="estudiantes_estado">Estado</label>
                                <select name="status" id="estudiantes_estado" required>
                                    <option value="activo">Activo</option>
                                    <option value="inactivo">Inactivo</option>
                                    <option value="Egresado">Egresado</option>
                                </select>
                            </div>
                            <div>
                                <label for="estudiantes_telefono">Teléfono</label>
                                <input type="number" name="" id="estudiantes_telefono" min="0" required>
                            </div>

                        </div>
                        <div class="full-witdh">
                            <div class="container_register">
                                <label for="estudiantes_observaciones">Observaciones:</label>
                                <textarea name="" id="estudiantes_observaciones" rows="5" cols="50"></textarea>
                            </div>
                            <div class="container_register">
                                <button type="submit" class="submit-btn" id="btnRegistrar">Registrar</button>
                            </div>
                        </div>
                    </form>
                    <!-- <script>
                        // Mostrar la notificación si existe
                        window.onload = function() {
                            var notification = document.getElementById("notification");
                            if (notification) {
                                notification.style.display = "block"; // Mostrar la notificación
                                setTimeout(function() {
                                    notification.style.display = "none"; // Ocultar después de 5 segundos
                                }, 5000);
                            }
                        };
                    </script> -->
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
        <script src="assets/js/registrarEstudiante.js"></script>
        <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>


    </body>

    </html>

<?php
} else {
    header(header: "location: dashboard.php");
}
?>