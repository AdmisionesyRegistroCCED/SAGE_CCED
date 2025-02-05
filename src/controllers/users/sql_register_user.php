<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/src/controllers/session/session_start.php');
require_once($_SERVER['DOCUMENT_ROOT'] . '/config/db.php');

header('Content-Type: application/json');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $conn->real_escape_string($_POST['username']);
    $email = $conn->real_escape_string($_POST['email']);
    $pass = password_hash($_POST['pass'], PASSWORD_DEFAULT);
    $user_type = intval($_POST['user_type']);
    // Validación simple
    if ($user_type == "none") {
        echo json_encode(["success" => false, "message" => "Debes seleccionar un tipo de usuario."]);
        exit;
    }

    // Verificar si el usuario ya existe
    $checkUser = $conn->prepare("SELECT * FROM usuarios WHERE usuarios_correo = ?");
    $checkUser->bind_param("s", $email);
    $checkUser->execute();
    $result = $checkUser->get_result();


    if ($result->num_rows > 0) {
        echo json_encode(["success" => false, "message" => "El correo ya está registrado."]);
    } else {
        // Insertar usuario
        $query = $conn->prepare("INSERT INTO usuarios (usuarios_nombre, usuarios_correo, usuarios_contrasena, usuarios_rol_id) VALUES (?, ?, ?, ?)");
        $query->bind_param("sssi", $username, $email, $pass, $user_type);
        if ($query->execute()) {
            echo json_encode(["success" => true, "message" => "Usuario registrado con éxito."]);
        } else {
            echo json_encode(["success" => false, "message" => "Error al registrar el usuario."]);
        }
    }

    $conn->close();
}
?>
