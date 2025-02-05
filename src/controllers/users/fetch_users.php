<?php
ob_start();
session_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
error_reporting(E_ALL);
ini_set('display_errors', 1);
require_once($_SERVER['DOCUMENT_ROOT'] . '/config/db.php');

// Verificar si el usuario está autenticado
if (!isset($_SESSION['userdata?'])) {
    echo json_encode(['error' => 'No autorizado', 'redirect' => '/src/views/login.php']);
    exit();
}

$correo = $_SESSION['userdata?'];

if ($conn->connect_error) {
    die(json_encode(["error" => "Conexión fallida: " . $conn->connect_error]));
}

// Consulta SQL con filtro por rol
$sql = "SELECT u.usuarios_id AS `ID`, u.usuarios_nombre AS `Nombre`, u.usuarios_correo AS `Correo`, r.roles_nombre AS 'Rol' 
        FROM usuarios u
        INNER JOIN roles r ON r.roles_id = u.usuarios_rol_id
        WHERE r.roles_id > (SELECT usuarios_rol_id FROM usuarios WHERE usuarios_correo = ? LIMIT 1)";

// Preparar la consulta
$prepare = $conn->prepare($sql);
if (!$prepare) {
    echo json_encode(["error" => "Error en la consulta: " . $conn->error]);
    exit();
}

// Enlazar parámetros
$prepare->bind_param("s", $correo);
$prepare->execute();
$result = $prepare->get_result();
$data = array();

// Obtener datos
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    ob_clean();
    echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
} else {
    echo json_encode(["error" => "No hay datos disponibles"]);
}

// Cerrar conexiones
$prepare->close();
$conn->close();
?>
