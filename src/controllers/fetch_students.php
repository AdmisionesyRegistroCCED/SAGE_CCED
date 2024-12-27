<?php
session_start();
if (!isset($_SESSION['userdata?'])) {
    header("Location: ../src/views/login.php");
    exit();
}
$correo = $_SESSION['userdata?'];

require_once "../../config/db.php";

//Columnas tabla estudiantes
$col = array(
    0 => 'estudiantes_no_documento',
    1=> 'estudiantes_tipo_documento',
    2=> 'estudiantes_nombre',
    3=> 'estudiantes_apellido',
    4=> 'estudiantes_fecha_nacimiento',
    5=> 'estudiantes_genero',
    6=> 'estudiantes_telefono',
    7=> 'estudiantes_correo',
    8=> 'estudiantes_estado',

);


// Verificar conexión
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Inicializa la consulta base

//$sql = "SELECT estudiantes_no_documento,estudiantes_tipo_documento ,estudiantes_nombre,estudiantes_apellidos,estudiantes_correo, estudiantes_estado FROM estudiantes"; // 'WHERE 1=1' permite agregar condiciones fácilmente
$sql = "SELECT * FROM estudiantes"; // 'WHERE 1=1' permite agregar condiciones fácilmente



$result = $conn->query($sql);

$subData = array();
//$data= array();
if ($result->num_rows > 0) {
    while ($data = $result -> fetch_assoc()) {
        $estudiantes_no_documento = $data['estudiantes_no_documento']; // estudiantes_no_documento 
        $estudiantes_tipo_documento = $data['estudiantes_tipo_documento']; // estudiantes_tipo_documento
        $estudiantes_nombre = $data['estudiantes_nombre']; // estudiantes_nombre
        $estudiantes_apellidos = $data['estudiantes_apellidos']; // estudiantes_apellido
        $estudiantes_fecha_nacimiento = $data['estudiantes_fecha_nacimiento']; // estudiantes_apellido
        $estudiantes_genero = $data['estudiantes_genero']; // estudiantes_apellido
        $estudiantes_telefono = $data['estudiantes_genero']; // estudiantes_apellido
        $estudiantes_correo = $data['estudiantes_correo']; // estudiantes_correo
        $estudiantes_estado = $data['estudiantes_estado']; // estudiantes_estado


            
        $subData[]  = array(
        "estudiantes_no_documento"=>$estudiantes_no_documento,
        "estudiantes_tipo_documento" => $estudiantes_tipo_documento,
        "estudiantes_nombre" => $estudiantes_nombre,
        "estudiantes_apellidos" => $estudiantes_apellidos,
        "estudiantes_fecha_nacimiento" => $estudiantes_fecha_nacimiento,
        "estudiantes_genero" => $estudiantes_genero,
        "estudiantes_telefono" => $estudiantes_telefono,
        "estudiantes_correo" => $estudiantes_correo,
        "estudiantes_estado" => $estudiantes_estado,
        );

        

    }

    echo json_encode($subData);
} else {
    $output .= "<tr><td colspan='9'>No se encontraron estudiantes.</td></tr>";
}

$conn->close(); // Cerrar la conexión

?>

