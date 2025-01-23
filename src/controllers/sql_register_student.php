<?php
session_start();
require_once '../../config/db.php';
header('Content-Type: application/json');

// Verificar conexión
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

    $valorTipo;
    $estudiantes_no_documento = $_POST['estudiantes_no_documento'];
    $estudiantes_tipo_documento = $_POST['estudiantes_tipo_documento'];
    $estudiantes_nombre = $conn->real_escape_string($_POST['estudiantes_nombre']);
    $estudiantes_apellidos = $conn->real_escape_string($_POST['estudiantes_apellidos']) ;
    $estudiantes_fecha_nacimiento = $_POST['estudiantes_fecha_nacimiento'];
    $estudiantes_genero = $conn->real_escape_string($_POST['estudiantes_genero']);
    $estudiantes_telefono = $conn->real_escape_string($_POST['estudiantes_telefono']);
    $estudiantes_direccion = $conn->real_escape_string($_POST['estudiantes_direccion']);
    $estudiantes_correo = $conn->real_escape_string($_POST['estudiantes_correo']);
    $estudiantes_estado = $conn->real_escape_string($_POST['estudiantes_estado']);
    $estudiantes_observaciones = $conn->real_escape_string($_POST['estudiantes_observaciones']);

    if($estudiantes_tipo_documento == "cc"){
        $valorTipo = 1;
    }elseif($estudiantes_tipo_documento == "ti"){
        $valorTipo = 2;
    }elseif($estudiantes_tipo_documento == "ce"){
        $valorTipo = 3;
    }else{
        $valorTipo = NULL;
    }

    $vali = "SELECT estudiantes_no_documento FROM estudiantes WHERE estudiantes_no_documento = ?";
    $exe = $conn->prepare($vali);
    $exe->bind_param('s',$estudiantes_no_documento);
    $exe->execute();

    //Obtengo el resultado de la consulta
    $comparacion = $exe->get_result();

    if($fila = $comparacion->fetch_assoc()){
        $documentoDB = $fila['estudiantes_no_documento'];   
    }

    if($documentoDB == $estudiantes_no_documento){
        $data=['Valor duplicado'];
        ob_clean();
        echo json_encode($data);
    }else{
        $sql = "INSERT INTO estudiantes 
        (estudiantes_no_documento,
        estudiantes_tipo_documento,
        estudiantes_nombre, 
        estudiantes_apellidos, 
        estudiantes_fecha_nacimiento,
        estudiantes_genero,
        estudiantes_telefono,
        estudiantes_correo,
        estudiantes_estado,
        estudiantes_direccion,
        estudiantes_observaciones) 
                VALUES ('$estudiantes_no_documento', '$valorTipo', '$estudiantes_nombre', '$estudiantes_apellidos', '$estudiantes_fecha_nacimiento','$estudiantes_genero', '$estudiantes_telefono', '$estudiantes_correo', '$estudiantes_estado','$estudiantes_direccion','$estudiantes_observaciones')";
    
        $registrarEstudiante = $conn -> prepare($sql);
        $registrarEstudiante->execute();

        if($registrarEstudiante){
            $data=['Registro exitoso',$registrarEstudiante];
            ob_clean();
            echo json_encode($data);
        }
        $exe->close();
        $registrarEstudiante->close();
        $conn->close();
    
    }
?>