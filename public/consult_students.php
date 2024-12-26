<?php
session_start();
if (!isset($_SESSION['userdata?'])) {
    header("Location: ../src/views/login.php");
    exit();
}
$correo = $_SESSION['userdata?'];
require_once "../config/db.php";
// Conexión a la base de datos
try {
    $stmt = $pdo->prepare("SELECT u.usuarios_id, u.usuarios_nombre, u.usuarios_correo, r.roles_nombre
                            FROM usuarios u
                            JOIN roles r ON u.usuarios_rol_id  = r.roles_id
                            WHERE u.usuarios_correo = :email");
    $stmt->bindParam(':email', $correo);
    $stmt->execute();

    // Obtener los datos del usuario
    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($usuario) {
        $userID = $usuario['usuarios_id'];
        $username = $usuario['usuarios_nombre'];
        $useremail = $usuario['usuarios_correo'];
        $userRole = $usuario['roles_nombre'];
    } else {
        // Manejar caso donde no se encuentra el usuario
        echo "Usuario no encontrado.";
        exit();
    }

} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
// Verificar conexión
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

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
        <?php require_once "../src/models/leftmenu.php" ?>
        <div class="structure">
            <div id="tabla" class="main on">
                <h1 class="mindata_username">Consulta de estudiantes</h1>
                <!-- <p class="infoinmain_topp">Esta es tu página de inicio</p> -->
                <hr><br>
                <!-- <div id="filters">
                    <label for="document-type">Tipo de documento:</label>
                    <select id="document-type">
                        <option value="">Todos</option>
                        <option value="ti">Tarjeta de identidad</option>
                        <option value="cc">Cedula de ciudadania</option>
                        <option value="ce">Cedula de extranjeria</option>
                    </select>

                    <label for="status">Estado:</label>
                    <select id="status">
                        <option value="">Todos</option>
                        <option value="Activo">Activo</option>
                        <option value="Inactivo">Inactivo</option>
                    </select>

                    <button class="submit-btn" id="filter-button">Filtrar</button>
                </div> -->
                <table id="myTable" class="">
                    <thead>
                        <tr>
                            <th>Documento</th>
                            <th>Numero de documento</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Fecha de matricula</th>
                            <th>Programa</th>
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
                        <label for="fname">Nombres</label>
                        <input type="text" id="fname" name="fname" required>
                    </div>
                    <div>
                        <label for="lname">Apellidos</label>
                        <input type="text" id="lname" name="lname" required>
                    </div>
                    <div>
                        <label for="dni_type">Tipo de documento</label>
                        <select name="dni_type" id="dni_type" required>
                            <option value="ti">Tarjeta de identidad</option>
                            <option value="cc">Cedula de ciudadania</option>
                            <option value="ce">Cedula de extranjeria</option>
                        </select>
                    </div>
                    <div>
                        <label for="dni">Numero de documento</label>
                        <input type="number" id="dni" name="dni" required>
                    </div>
                    <div>
                        <label for="dob">Fecha de nacimiento</label>
                        <input type="date" id="dob" name="dob" required>
                    </div>
                    <div>
                        <label for="gender">Genero</label>
                        <select id="gender" name="gender" required>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>                        
                        </select>
                    </div>
                    <div>
                        <label for="phone">Numero de telefono</label>
                        <input type="text" id="phone" name="phone" required>
                    </div>
                    <div>
                        <label for="email">Correo electronico</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div>            
                        <label for="status">Estado</label>
                        <select name="status" id="status" required>
                            <option value="activo">Activo</option>
                            <option value="inactivo">Inactivo</option>
                        </select>
                    </div>
                    <br>
                        <button type="submit" class="submit-btn">Guardar Cambios</button>
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
