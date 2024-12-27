<?php
session_start();
if (!isset($_SESSION['userdata?'])) {
    header("location: ../src/views/login.php");
    exit();
}
$correo = $_SESSION['userdata?'];
require_once "../config/db.php";
// Conexión a la base de datos
try {
    $stmt = $pdo->prepare("SELECT u.usuarios_id, u.usuarios_nombre, u.usuarios_correo, r.roles_nombre, r.roles_id, r.roles_codigo_permisos
                            FROM usuarios u
                            JOIN roles r ON u.usuarios_rol_id = r.roles_id
                            WHERE u.usuarios_correo = :email");
    $stmt->bindParam(':email', $correo);
    $stmt->execute();

    // Obtener los datos del usuario
    $usuario = $stmt->fetch(mode: PDO::FETCH_ASSOC);

    if ($usuario) {
        $userID = $usuario['usuarios_id'];
        $username = $usuario['usuarios_nombre'];
        $useremail = $usuario['usuarios_correo'];
        $userRole = $usuario['roles_nombre'];
        $codeRole = $usuario['roles_id'];
        $binperms = $usuario['roles_codigo_permisos'];

    } else {
        // Manejar caso donde no se encuentra el usuario
        echo "Usuario no encontrado.";
        exit();
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}
if(substr($binperms, 9, 1) == 1 || substr($binperms, 9, 1) == 2){
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
                    <form action="../src/controllers/uploadcsv.php" method="post" enctype="multipart/form-data">
                        <label for="file">Cargar archivo</label>
                        <input type="file" name="file" id="file" accept=".csv">
                        <input type="submit" value="Subir">
                    </form>
                </div>
                <!-- <p class="infoinmain_topp">Esta es tu página de inicio</p> -->
                <hr><br>
                <form action="../src/controllers/sql_register_student.php" method="post">
                <div class="container_register">
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
                            <option value="none">Seleccione una opción</option>
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
                            <option value="none">Seleccione una opción</option>
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
                    <div class="full-width">
                        <button type="submit" class="submit-btn">Registrar</button>
                    </div>
                </div>
            </form>
                <script>
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
                </script>
            </div>
            <footer class=".footer">
                <?php require_once "../src/models/footer.php" ?>
            </footer>
        </div>
    </main>
    <script src="assets/js/main.js"></script>
</body>
</html>
<?php
}else{
    header("location: dashboard.php");
}
?>