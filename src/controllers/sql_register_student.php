<?php
session_start();
require_once '../../config/db.php';
// Crear conexión
$conn = new mysqli($host, $user, $pass, $db);

// Verificar conexión
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $dni = $_POST['dni'];
    $dni_type = $_POST['dni_type'];
    $first_name = $_POST['fname'];
    $last_name = $_POST['lname'];
    $dob = $_POST['dob'];
    $gender = $_POST['gender'];
    $phone = $_POST['phone'];
    $email = $_POST['email'];
    $status = $_POST['status'];

    $sql = "INSERT INTO estudiantes 
    (estudiantes_no_documento,
    estudiantes_tipo_documento,
    estudiantes_nombre, 
    estudiantes_apellidos, 
    estudiantes_fecha_nacimiento,
    estudiantes_genero, 
    estudiantes_telefono, 
    estudiantes_correo, 
    estudiantes_estado) 
            VALUES ('$dni', '$dni_type', '$first_name', '$last_name', '$dob', '$gender', '$phone', '$email', '$status')";


    if ($conn->query($sql) === TRUE) {
        $_SESSION['message'] = "Estudiante registrado exitosamente"; // Mensaje de éxito
        $_SESSION['msg_type'] = "success"; // Tipo de mensaje
        header("Location: ../../public/student_register.php"); // Redirigir al formulario
        exit();
    } else {
        $_SESSION['message'] = "Ocurrio un error al intentar agregar el estudiante."; // Mensaje de error
        $_SESSION['msg_type'] = "error"; // Tipo de mensaje
        header("Location: ../../public/student_register.php"); // Redirigir al formulario
        exit();
    }
}



$conn->close();
?>