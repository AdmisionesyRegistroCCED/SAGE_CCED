<?php
session_start();
require_once($_SERVER['DOCUMENT_ROOT'] . '/config/db.php'); // Conexión a la base de datos

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Preparar consulta SQL para buscar el usuario
    $stmt = $conn->prepare("SELECT * FROM usuarios WHERE LOWER(usuarios_correo) = LOWER(?)");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Verificar la contraseña
        if (password_verify($password, $user['usuarios_contrasena'])) {
            // Inicio de sesión exitoso, guardar usuario en sesión
            $_SESSION['userdata?'] = $user['usuarios_correo'];
            header("Location: /public/dashboard.php");
            exit();
        } else {
            $_SESSION['message'] = "Correo o contraseña incorrecto, porfavor verifique la información diligenciada."; // Mensaje de error
            $_SESSION['msg_type'] = "error"; // Tipo de mensaje
            header("Location: /src/views/login.php"); // Redirigir al formulario
            exit();
            }
    } else {
        $_SESSION['message'] = "Correo o contraseña incorrecto, porfavor verifique la información diligenciada."; // Mensaje de error
            $_SESSION['msg_type'] = "error"; // Tipo de mensaje
            header("Location: /src/views/login.php"); // Redirigir al formulario
            exit();
        }
    }
    // $hashed_password = password_hash('test2000', PASSWORD_DEFAULT);
    // echo $hashed_password;
?>
