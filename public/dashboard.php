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
    $stmt = $pdo->prepare("SELECT u.usuarios_id, u.usuarios_nombre, u.usuarios_correo, r.roles_nombre
                            FROM usuarios u
                            JOIN roles r ON u.usuarios_rol_id = r.roles_id
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

?>
<html>

<head>
    <title>SAGE - Dashboard</title>
    <link rel="stylesheet" href="assets/css/main.css">
</head>

<body>
    <header>
        <?php require_once "../src/models/header.php" ?>
    </header>
    <main>
        <?php require_once "../src/models/leftmenu.php" ?>
        <div class="structure">
            <div id="main" class="main on">
                <?php
                    if($userRole == "administrador"){
                        echo  '<span class="mindata_userrole">Administrador</span>';
                    }else{
                        echo "hello world";
                    }
                ?>
                <h1 class="mindata_username">Bienvenid@, <?php echo $username; ?>!</h1>
                <p class="infoinmain_topp">Esta es tu página de inicio</p>
                <hr>
            </div>
            <footer>
                <?php require_once "../src/models/footer.php" ?>
            </footer>
        </div>
    </main>
    <script src="assets/js/main.js"></script>
    
</body>

</html>