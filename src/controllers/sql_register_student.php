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
    $estudiantes_no_documento = $_POST['estudiantes_no_documento'];
    $estudiante_tipo_documento = $_POST['estudiante_tipo_documento'];
    $estudiantes_nombre = $_POST['estudiantes_nombre'];
    $estudiantes_apellidos = $_POST['estudiantes_apellidos'];
    $estudiantes_fecha_nacimiento = $_POST['estudiantes_fecha_nacimiento'];
    $estudiantes_genero = $_POST['estudiantes_genero'];
    $estudiantes_telefono = $_POST['estudiantes_telefono'];
    $estudiantes_correo = $_POST['estudiantes_correo'];
    $estudiantes_estado = $_POST['estudiantes_estado'];

    if($estudiante_tipo_documento == "cc"){
        $valorTipo = 1;
    }elseif($estudiante_tipo_documento == "ti"){
        $valorTipo = 2;
    }elseif($estudiante_tipo_documento == "ce"){
        $valorTipo = 3;
    }

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
            VALUES ('$estudiantes_no_documento', '$valorTipo', '$estudiantes_nombre', '$estudiantes_apellidos', '$estudiantes_fecha_nacimiento', '$estudiantes_genero', '$estudiantes_telefono', '$estudiantes_correo', '$estudiantes_estado')";


    // if ($conn->query($sql) === TRUE) {
    //     $_SESSION['message'] = "Estudiante registrado exitosamente"; // Mensaje de éxito
    //     $_SESSION['msg_type'] = "success"; // Tipo de mensaje
    //     header("Location: ../../public/student_register.php"); // Redirigir al formulario
    //     exit();
    // } else {
    //     $_SESSION['message'] = "Ocurrio un error al intentar agregar el estudiante."; // Mensaje de error
    //     $_SESSION['msg_type'] = "error"; // Tipo de mensaje
    //     header("Location: ../../public/student_register.php"); // Redirigir al formulario
    //     exit();
    // }


    $select = "SELECT * FROM estudiantes ORDER BY estudiantes_no_documento DESC LIMIT 1";

    if($data = $conn -> query($select))

        $Newdata = mysqli_fetch_assoc($data);

        print json_encode($Newdata, JSON_UNESCAPED_UNICODE);


}



$conn->close();
?>