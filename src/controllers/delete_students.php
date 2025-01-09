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
if($estudiantes_estado){
    $estudiantes_estado = "Inhabilitado";
}
$estudiantes_no_documento = $_POST['estudiantes_no_documento'];

$sql = "UPDATE estudiantes SET estudiantes_estado='$estudiantes_estado' WHERE estudiantes_no_documento = '$estudiantes_no_documento";

if ($conn->query($sql)==TRUE) {
    echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false]);
    }


$coon->close();

?>