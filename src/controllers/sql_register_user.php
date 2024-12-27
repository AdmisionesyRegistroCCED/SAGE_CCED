<?php
session_start();
require_once '../../config/db.php';

try {
    // Crear conexión
    $conn = new mysqli($host, $user, $pass, $db);

    // Verificar conexión
    if ($conn->connect_error) {
        throw new Exception("Error de conexión: " . $conn->connect_error);
    }

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = $conn->real_escape_string($_POST['username']); // Escapar entradas
        $email = $conn->real_escape_string($_POST['email']);
        $pass = $_POST['pass'];
        $usertype = (int) $_POST['user_type']; // Asegurar tipo de dato
        $hashedPass = password_hash($pass, PASSWORD_DEFAULT);
        $currentDate = date('Y-m-d H:i:s');

        // Construir la consulta SQL
        $sql = "INSERT INTO usuarios 
                (usuarios_nombre, usuarios_correo, usuarios_contrasena, usuarios_rol_id, usuarios_fecha_creacion) 
                VALUES ('$username', '$email', '$hashedPass', $usertype, '$currentDate')";

        // Ejecutar la consulta y verificar errores
        if ($conn->query($sql) === TRUE) {
            $_SESSION['message'] = "Usuario registrado exitosamente"; // Mensaje de éxito
            $_SESSION['msg_type'] = "success"; // Tipo de mensaje
            header("Location: ../../public/user_register.php"); // Redirigir al formulario
            exit();
        } else {
            throw new Exception("Error al insertar en la base de datos: " . $conn->error);
        }
    }
} catch (Exception $e) {
    // Capturar errores y mostrar mensajes
    $_SESSION['message'] = "Ocurrió un error: " . $e->getMessage();
    $_SESSION['msg_type'] = "error"; // Tipo de mensaje
    header("Location: ../../public/user_register.php"); // Redirigir al formulario
    exit();
} finally {
    // Cerrar la conexión
    if (isset($conn)) {
        $conn->close();
    }
}
?>
