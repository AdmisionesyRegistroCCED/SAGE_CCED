<?php
session_start();
require_once "../../config/db.php";
header('Content-Type: application/json');
if (!isset($_SESSION['userdata?'])) {
    header("Location: ../src/views/login.php");
    exit();
}
$correo = $_SESSION['userdata?'];


// Verificar conexión
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT tpd.tipo_documento_sigla AS 'sigla', est.estudiantes_no_documento AS 'nroDocumento', est.estudiantes_nombre AS 'nombre', est.estudiantes_apellidos AS 'apellido', est.estudiantes_telefono AS 'telefono', est.estudiantes_correo AS 'correo', est.estudiantes_direccion AS 'direccion', est.estudiantes_fecha_nacimiento AS 'fechaNacimiento', est.estudiantes_genero AS 'genero', est.estudiantes_estado AS 'estado', est.estudiantes_observaciones AS 'observaciones' FROM estudiantes est INNER JOIN tipo_documento tpd ON tpd.tipo_documento_id = est.estudiantes_tipo_documento WHERE est.estudiantes_estado = 'Activo' OR est.estudiantes_estado = 'Inactivo' OR est.estudiantes_estado = 'Egresado'";

$result = $conn->query($sql);

$subData = array();
if ($result->num_rows > 0) {
    while ($data = $result->fetch_assoc()) {
        $estudiantes_sigla = $data['sigla'];
        $estudiantes_no_documento = $data['nroDocumento'];
        $estudiantes_nombre = $data['nombre'];
        $estudiantes_apellidos = $data['apellido'];
        $estudiantes_telefono = $data['telefono'];
        $estudiantes_correo = $data['correo'];
        $estudiantes_direccion = $data['direccion'];
        $estudiantes_fecha_nacimiento = $data['fechaNacimiento'];
        $estudiantes_genero = $data['genero'];
        $estudiantes_estado = $data['estado'];
        $estudiantes_observaciones = $data['observaciones'];

        $subData[]  = array(
            "sigla" => $estudiantes_sigla,
            "nroDocumento" => $estudiantes_no_documento,
            "nombre" => $estudiantes_nombre,
            "apellido" => $estudiantes_apellidos,
            "telefono" => $estudiantes_telefono,
            "correo" => $estudiantes_correo,
            "direccion" => $estudiantes_direccion,
            "fechaNacimiento" => $estudiantes_fecha_nacimiento,
            "genero" => $estudiantes_genero,
            "estado" => $estudiantes_estado,
            "observaciones" => $estudiantes_observaciones
        );
    }
    echo json_encode($subData);
} else {
    $subData = [];
    echo json_encode(['Error' => "No hay registros", 'data' => $subData]);
}

$result->close();
$conn->close(); // Cerrar la conexión
