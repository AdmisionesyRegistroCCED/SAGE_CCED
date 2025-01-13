<?php
session_start();
if (!isset($_SESSION['userdata?'])) {
    header("Location: ../views/login.php");
    exit();
}

require_once "../../config/db.php";

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$estudiantes_tipo_documento = $conn->real_escape_string($_POST['estudiantes_tipo_documento']);
$estudiantes_no_documento = $conn->real_escape_string($_POST['estudiantes_no_documento']);
$estudiantes_nombre = $conn->real_escape_string($_POST['estudiantes_nombre']);
$estudiantes_apellidos = $conn->real_escape_string($_POST['estudiantes_apellidos']);
$estudiantes_fecha_nacimiento = $conn->real_escape_string($_POST['estudiantes_fecha_nacimiento']);
$estudiantes_genero = $conn->real_escape_string($_POST['estudiantes_genero']);
$estudiantes_telefono = $conn->real_escape_string($_POST['estudiantes_telefono']);
$estudiantes_correo = $conn->real_escape_string($_POST['estudiantes_correo']);
$estudiantes_estado = $conn->real_escape_string($_POST['estudiantes_estado']);
$estudiantes_observaciones = $conn->real_escape_string($_POST['estudiantes_observaciones']);

if($estudiantes_tipo_documento == "cc"){
    $tipoDocumento = 1;
}elseif($estudiantes_tipo_documento == "ti"){
    $tipoDocumento = 2;
}elseif($estudiantes_tipo_documento == "ce"){
    $tipoDocumento = 3;
}

$sql = "UPDATE estudiantes SET estudiantes_tipo_documento='$tipoDocumento', estudiantes_nombre='$estudiantes_nombre', estudiantes_apellidos='$estudiantes_apellidos', estudiantes_fecha_nacimiento='$estudiantes_fecha_nacimiento', estudiantes_genero='$estudiantes_genero', estudiantes_telefono='$estudiantes_telefono', estudiantes_correo='$estudiantes_correo', estudiantes_estado='$estudiantes_estado', estudiantes_observaciones = '$estudiantes_observaciones' WHERE estudiantes_no_documento='$estudiantes_no_documento'";

$prepare = $conn->prepare($sql);
$prepare->execute();


if (!$prepare) {
    echo "Error al actualizar". $conn ->error;
}

$prepare->close();
$conn->close();
?>
