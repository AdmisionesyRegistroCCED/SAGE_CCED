<?php

session_start();
if(!isset($_POST['userdata?'])){
    header("Location: ../src/views/login.php");
    exit();
}
$correo = $_SESSION['userdata?'];

require_once '../../config/db.php';

if($conn->connect_error){
    die("Connection failed: " . $conn->connect_error);

}

$estudiantes_estado = $_POST['estudiantes_estado'];
$estudiantes_no_documento = $_POST['estudiantes_no_documento'];

$sql = "UPDATE estudiantes SET estado='$estudiantes_estado' WHERE estudiantes_no_documento = '$estudiantes_no_documento";

if ($conn->query($sql)==TRUE) {
    echo json_encode($sql);
}else{
    echo "Error al cambiar estado: " . $conn->error;
}


$coon->close();

?>