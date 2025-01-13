<?php

session_start();
// if(!isset($_POST['userdata?'])){
//     echo "Hello world";
// }else{
//     header("Location: ../src/views/login.php");
//     exit();
// }
$correo = $_SESSION['userdata?'];

require_once "../../config/db.php";

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$estudiantes_estado = $conn->real_escape_string($_POST['estudiantes_estado']);
$estudiantes_no_documento = $_POST['estudiantes_no_documento'];
if($estudiantes_estado){
    $estudiantes_estado = "Inhabilitado";
}


$sql = "UPDATE estudiantes SET estudiantes_estado='$estudiantes_estado' WHERE estudiantes_no_documento = '$estudiantes_no_documento'";


$prepare = $conn->prepare($sql);
$prepare->execute();


if (!$prepare) {
    echo "Error al actualizar". $conn ->error;
    echo json_encode(['success' => false]);
}else{
    echo json_encode(['success' => true]);
    
}

$prepare->close();
$conn->close();

?>