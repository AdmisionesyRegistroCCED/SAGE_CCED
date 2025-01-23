<?php
session_start();
if (!isset($_SESSION['userdata?'])) {
    header("Location: ../views/login.php");
    exit();
}

header('Content-Type: application/json');
require_once "../../config/db.php";

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$estudiantes_tipo_documento = $conn->real_escape_string($_POST['estudiantes_tipo_documento']);
$estudiantes_no_documento = $_POST['estudiantes_no_documento'];
$estudiantes_no_documento_hidden = $_POST['estudiantes_no_documento_hidden'];
$estudiantes_nombre = $conn->real_escape_string($_POST['estudiantes_nombre']);
$estudiantes_apellidos = $conn->real_escape_string($_POST['estudiantes_apellidos']);
$estudiantes_direccion = $conn->real_escape_string($_POST['estudiantes_direccion']);
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



$sql = "UPDATE estudiantes SET estudiantes_tipo_documento='$tipoDocumento', estudiantes_no_documento = '$estudiantes_no_documento', estudiantes_nombre='$estudiantes_nombre', estudiantes_apellidos='$estudiantes_apellidos', estudiantes_fecha_nacimiento='$estudiantes_fecha_nacimiento', estudiantes_genero='$estudiantes_genero', estudiantes_telefono='$estudiantes_telefono', estudiantes_correo='$estudiantes_correo', estudiantes_estado='$estudiantes_estado', estudiantes_direccion = '$estudiantes_direccion' , estudiantes_observaciones = '$estudiantes_observaciones' WHERE estudiantes_no_documento='$estudiantes_no_documento_hidden'";

$prepare = $conn->prepare($sql);
$prepare->execute();

$select = "SELECT 
    tpd.tipo_documento_sigla AS 'sigla', 
    est.estudiantes_no_documento AS 'nroDocumento', 
    est.estudiantes_nombre AS 'nombre', 
    est.estudiantes_apellidos AS 'apellido', 
    est.estudiantes_telefono AS 'telefono', 
    est.estudiantes_correo AS 'correo', 
    est.estudiantes_direccion AS 'direccion', 
    est.estudiantes_fecha_nacimiento AS 'fechaNacimiento', 
    est.estudiantes_genero AS 'genero', 
    est.estudiantes_estado AS 'estado', 
    est.estudiantes_observaciones AS 'observaciones' 
FROM estudiantes est
JOIN tipo_documento tpd ON est.estudiantes_tipo_documento  = tpd.tipo_documento_id
WHERE tpd.tipo_documento_sigla = '$estudiantes_tipo_documento'
AND est.estudiantes_no_documento = '$estudiantes_no_documento'";

$exe = $conn->prepare($select);

$exe->execute();
$response = [];

$result = $exe->get_result();



if($result->num_rows>0){

    while($data = $result->fetch_assoc()){
        
        $response[] = array(
            "sigla" => $data['sigla'],
            "nroDocumento" => $data['nroDocumento'],
            "nombre" => $data['nombre'],
            "apellido" => $data['apellido'],
            "telefono" => $data['telefono'],
            "correo" => $data['correo'],
            "direccion" => $data['direccion'],
            "fechaNacimiento" => $data['fechaNacimiento'],
            "genero" => $data['genero'],
            "estado" => $data['estado'],
            "observaciones" => $data['observaciones'],
        );
    }


}else{
    $response = ["Error" => "No hay datos"];
}



echo json_encode($response);
$prepare->close();
$conn->close();
?>
