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
                            <th>Documento</th>
                            <th>Numero de documento</th>
                            <th>Nombre completo</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                            <th>Genero</th>
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
                        <label for="fname">Tipo de documento</label>
                        <input type="text" id="estudiantes_tipo_documento" name="fname" required>
                    </div>
                    <div>
                        <label for="lname">Nro documento</label>
                        <input type="text" id="estudiantes_no_documento" name="lname" required>
                    </div>
                    <!-- <div>
                        <label for="dni_type">Tipo de documento</label>
                        <select name="dni_type" id="dni_type" required>
                            <option value="ti">Tarjeta de identidad</option>
                            <option value="cc">Cedula de ciudadania</option>
                            <option value="ce">Cedula de extranjeria</option>
                        </select>
                    </div> -->
                    <div>
                        <label for="dni">Nombre</label>
                        <input type="text" id="estudiantes_nombre" name="dni" required>
                    </div>
                    <div>
                        <label for="apellido">Apellidos</label>
                            <input type="text" name="estudiantes_apellidos" id="estudiantes_apellidos">
                    </div>
                    <div>
                        <label for="dob">Fecha de matricula</label>
                        <input type="date" id="dob" name="dob" required>
                    </div>
                    
                    <div>
                        <label for="phone">Correo electronico</label>
                        <input type="email" id="estudiantes_correo" name="phone" required>
                    </div>
                    <div>
                        <label for="gender">Genero</label>
                        <select id="gender" name="gender" required>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>                        
                        </select>
                    </div>
                    <div>            
                        <label for="status">Estado</label>
                        <select name="status" id="estado" required>
                            <option value="activo">Activo</option>
                            <option value="inactivo">Inactivo</option>
                        </select>
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
    <!-- <script src="https://cdn.datatables.net/v/dt/dt-2.1.8/datatables.min.js"></script> -->

    <script src="https://cdn.datatables.net/v/dt/dt-2.1.8/datatables.min.js"></script>



    
    <script src="assets/js/main.js"></script>
    <script src="assets/js/datatable.js"></script>
    <!-- <script>
    // Función para cargar estudiantes a través de AJAX usando jQuery
    function fetchStudents(filters = {}) {
        $.ajax({
            url: "../src/controllers/fetch_students.php",
            type: "GET",
            data: filters, // Enviar los filtros como parámetros
            success: function(response) {
                $("#student-table-body").html(response); // Llenar el tbody con la respuesta
            },
            error: function(xhr, status, error) {
                console.error("Error en la carga de estudiantes: ", xhr.responseText); // Ver errores en la consola
            }
        });
    }

    // Cargar estudiantes cuando la página esté lista
    $(document).ready(function() {
        fetchStudents(); // Cargar todos los estudiantes al inicio

        // Evento de clic para el botón de filtro
        $("#filter-button").click(function() {
            const documentType = $("#document-type").val();
            const status = $("#status").val();

            // Crear un objeto de filtros
            const filters = {
                document_type: documentType,
                status: status
            };

            fetchStudents(filters); // Cargar estudiantes con filtros
        });
    });
</script> -->
        
</body>
</html>
<?php
}else{
    header("location: dashboard.php");
}
?>