<?php
session_start();
ob_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);
require_once($_SERVER['DOCUMENT_ROOT'] . '/config/db.php');
header('Content-Type: application/json');

// Verificar conexión
if ($conn->connect_error) {
    die(json_encode(["Error" => "Connection failed: " . $conn->connect_error]));
}

$patronTexto = '/[a-zA-Z]/';
$valorTipo = null;

$estudiantes_no_documento = $_POST['estudiantes_no_documento'];
$estudiantes_tipo_documento = $_POST['estudiantes_tipo_documento'];
$estudiantes_nombre = $conn->real_escape_string($_POST['estudiantes_nombre']);
$estudiantes_apellidos = $conn->real_escape_string($_POST['estudiantes_apellidos']);
$estudiantes_fecha_nacimiento = $_POST['estudiantes_fecha_nacimiento'];
$estudiantes_genero = $conn->real_escape_string($_POST['estudiantes_genero']);
$estudiantes_telefono = $conn->real_escape_string($_POST['estudiantes_telefono']);
$estudiantes_direccion = $conn->real_escape_string($_POST['estudiantes_direccion']);
$estudiantes_correo = $conn->real_escape_string($_POST['estudiantes_correo']);
$estudiantes_estado = $conn->real_escape_string($_POST['estudiantes_estado']);
$estudiantes_observaciones = $conn->real_escape_string($_POST['estudiantes_observaciones']);

// Asignar valor numérico al tipo de documento
$tipos_documento = ["cc" => 1, "ti" => 2, "ce" => 3, "co" => 4];
$valorTipo = $tipos_documento[$estudiantes_tipo_documento] ?? null;

// Validar si el número de documento ya existe
$vali = "SELECT estudiantes_no_documento FROM estudiantes WHERE estudiantes_no_documento = ?";
$exe = $conn->prepare($vali);
$exe->bind_param('s', $estudiantes_no_documento);
$exe->execute();
$comparacion = $exe->get_result();

if ($comparacion->num_rows > 0) {
    echo json_encode(["Error" => "El número de documento ya se encuentra registrado"]);
    $exe->close();
    $conn->close();
    return;
}


// Insertar nuevo estudiante en la base de datos
$sql = "INSERT INTO estudiantes 
    (estudiantes_no_documento, estudiantes_tipo_documento, estudiantes_nombre, 
    estudiantes_apellidos, estudiantes_fecha_nacimiento, estudiantes_genero, 
    estudiantes_telefono, estudiantes_correo, estudiantes_estado, 
    estudiantes_direccion, estudiantes_observaciones) 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sisssssssss", 
    $estudiantes_no_documento, $valorTipo, $estudiantes_nombre, 
    $estudiantes_apellidos, $estudiantes_fecha_nacimiento, $estudiantes_genero, 
    $estudiantes_telefono, $estudiantes_correo, $estudiantes_estado, 
    $estudiantes_direccion, $estudiantes_observaciones
);

if ($stmt->execute()){
    // Validar si el número de documento contiene letras (error)
    if (preg_match($patronTexto, $estudiantes_no_documento)) {
        // Insertar en la tabla matricula
        $matricula = "INSERT INTO matricula (matricula_id, matricula_estudiante_numero_documento) VALUES (?, ?)";
        $matriculaQuery = $conn->prepare($matricula);
        $matriculaQuery->bind_param("ss", $estudiantes_no_documento, $estudiantes_no_documento);
        $matriculaQuery->execute();
        $matriculaQuery->close();
        
        echo json_encode(["Success" => "Registro exitoso"]);
    }
} else {
    echo json_encode(["Error" => "No se pudo registrar el estudiante"]);
}

// Cerrar conexiones
$stmt->close();
$exe->close();
$conn->close();
?>