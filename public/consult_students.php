<?php 
    require "../src/controllers/session_start.php";
if(substr($binperms, 9, 1) == 1 || substr($binperms, 9, 1) == 2){
?>
<html>
<head>
    <title>SAGE - Consulta de estudiantes</title>
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- Datables links -->
    <!-- <link href="https://cdn.datatables.net/v/dt/dt-2.1.8/r-3.0.3/datatables.min.css" rel="stylesheet"> -->

    <link href="https://cdn.datatables.net/v/dt/dt-2.1.8/datatables.min.css" rel="stylesheet">


    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
    </style>
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
                    <h2>Editar Estudiante</h2>
                    <form id="edit-form">
                    <div>
                        <!-- <label for="fname">Tipo de documento</label>
                        <input type="text" id="estudiantes_tipo_documento" name="fname" required>
                     -->
                        <label for="estudiantes_tipo_documento">Tipo de documento</label>
                        <select name="estudiantes_tipo_documento" id="estudiantes_tipo_documento" required>
                            <option value="ti">Tarjeta de identidad</option>
                            <option value="cc">Cedula de ciudadania</option>
                            <option value="ce">Cedula de extranjeria</option>
                        </select>


                    </div>
                    <div>
                        <label for="lname">Nro documento</label>
                        <input type="text" id="estudiantes_no_documento" name="lname" required>
                    </div>

                    <div>
                        <label for="dni">Nombre</label>
                        <input type="text" id="estudiantes_nombre" name="estudiantes_nombre" required>
                    </div>
                    <div>
                        <label for="apellido">Apellidos</label>
                            <input type="text" name="estudiantes_apellidos" id="estudiantes_apellidos">
                    </div>
                    <div>
                        <label for="estudiantes_fecha_nacimiento">Fecha de nacimiento</label>
                        <input type="date" id="estudiantes_fecha_nacimiento" name="estudiantes_fecha_nacimiento" required>
                    </div>

                    <div>
                        <label for="estudiantes_correo">Correo electronico</label>
                        <input type="email" id="estudiantes_correo" name="estudiantes_correo" required>
                    </div>
                    <div>
                        <label for="">Teléfono</label>
                        <input type="number" name="estudiantes_telefono" id="estudiantes_telefono">
                    </div>
                    <div>
                        <label for="estudiantes_genero">Genero</label>
                        <select id="estudiantes_genero" name="estudiantes_genero" required>
                            <option value="Nulo">Nulo</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                        </select>
                    </div>
                    <div>
                        <label for="estudiantes_estado">Estado</label>
                        <select name="estudiantes_estado" id="estudiantes_estado" required>
                            <option value="Activo">Activo</option>
                            <option value="Inactivo">Inactivo</option>
                            <option value="Egresado">Egresado</option>
                        </select>
                    </div>

                    <div class="">
                        <label for="estudiantes_observaciones">Observaciones:</label>
                        <textarea name="" id="estudiantes_observaciones" rows="10" cols="50"></textarea>
                    </div>
                    <br>
                    <div>

                        <button type="submit" class="submit-btn">Guardar Cambios</button>
                    </div>
                    </form>
                </div>
            </div>
    </main>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <!-- <script src="assets/js/datatable.js"></script> -->
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>

    <script src="https://cdn.datatables.net/v/dt/dt-2.1.8/datatables.min.js"></script>



    
    <script src="assets/js/main.js"></script>
    <script src="assets/js/datatable.js"></script>
        
</body>
</html>
<?php
}else{
    header("location: dashboard.php");
}
?>