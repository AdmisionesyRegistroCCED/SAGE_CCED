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
    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

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
?>