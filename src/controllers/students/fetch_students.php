<?php
ob_start();
session_start();
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json charset=UTF-8");
error_reporting(E_ALL);
ini_set('display_errors', 1);
require_once($_SERVER['DOCUMENT_ROOT'] . '/config/db.php');

if (!isset($_SESSION['userdata?'])) {
    echo json_encode(['error' => 'No autorizado', 'redirect' => '/src/views/login.php']);
    exit();
}

$correo = $_SESSION['userdata?'];

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Consulta SQL
$sql = "SELECT tpd.tipo_documento_sigla AS `sigla`, est.estudiantes_no_documento AS `nroDocumento`, est.estudiantes_nombre AS `nombre`, est.estudiantes_apellidos AS 'apellido', est.estudiantes_telefono AS `telefono`, est.estudiantes_correo AS `correo`, est.estudiantes_fecha_nacimiento AS `fechaNacimiento`, est.estudiantes_genero AS `genero`, est.estudiantes_estado AS `estado`, est.estudiantes_direccion AS 'direccion', est.estudiantes_observaciones AS `observaciones`
        FROM estudiantes est 
        INNER JOIN tipo_documento tpd ON tpd.tipo_documento_id = est.estudiantes_tipo_documento
        WHERE est.estudiantes_estado <> 'Inhabilitado'";

// $sql = "SELECT estudiantes_apellido, HEX(estudiantes_apellido) FROM estudiantes WHERE 1 = 1;";

// $sql = "SELECT * FROM estudiantes WHERE estudiantes_estado <> 'Inhabilitado'";

// $result = $conn->query($sql);
// $conn->set_charset("utf8mb4");
$prepare = $conn->prepare($sql);
if (!$prepare) {
    echo json_encode(["error" => "Error en la consulta: " . $conn->error]);
    exit();
}

$prepare->execute();
$result = $prepare->get_result();
$data = array();

if ($result->num_rows > 0) {
    // foreach ($result as $data) {
    //     $data = array(
    //     "sigla" => $data['sigla'],
    //     "nroDocumento" => $data['nroDocumento'],
    //     "nombre" => $data['nombre'],
    //     "apellido" => $data['apellido'],
    //     "telefono" => $data['telefono'],
    //     "correo" => $data['correo'],
    //     "direccion" => $data['direccion'],
    //     "fechaNacimiento" => $data['fechaNacimiento'],
    //     "genero" => $data['genero'],
    //     "estado" => $data['estado'],
    //     "observaciones" => $data['observaciones']
    //     );
    // } 
    while ($row = $result->fetch_assoc()) {

        $data[] = $row;
    }
    // print_r($data);
    // $data = [
    //             "sigla" => "cc",
    //             "nroDocumento" => "1234",
    //             "nombre" => "alejo",
    //             // "apellido" => "�����",
    //             "telefono" => "1234",
    //             "correo" => "a@gm�il.com",
    //             // "direccion" => "calle 23",
    //             "fechaNacimiento" => "23-05-2000",
    //             "genero" => "masculino",
    //             "estado" => "Activo",
    //             "observaciones" => "fjklagehlash"
    //         ];
    ob_clean();
    $jscode = json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
    // print_r($jscode);
    if (!empty($jscode)) {
        // echo "existe";   
        echo $jscode;
    } else {
        $data = [
            "error" => "No existe"
        ];
        echo json_encode($data);
    }
} else {
    $data = [];
    echo json_encode(["error" => "No hay datos disponibles", 'data' => $data]);
}
$conn->close();
// print_r($data);
// if (empty($data)) {
//     echo json_encode(["error" => "No hay datos disponibles"]);
// } else {
//     $data = [
//         "sigla" => "cc",
//         "nroDocumento" => "1234",
//         "nombre" => "alejo",
//         "apellido" => "ceron",
//         "telefono" => "1234",
//         "correo" => "a@gm�il.com",
//         "direccion" => "calle 23",
//         "fechaNacimiento" => "23-05-2000",
//         "genero" => "masculino",
//         "estado" => "Activo",
//         "observaciones" => "fjklagehlash"
//     ];
//     $subData = $data;
//     echo json_encode($subData, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE);
// }












// echo var_dump($result);

// if ($result->num_rows > 0) {

//     $subData[] = array();

// while ($data = $result->fetch_assoc()) {
//     $subData = array( 
//         "sigla" => $data['sigla'],
//         "nroDocumento" => $data['nroDocumento'],
//         "nombre" => $data['nombre'],
//         "apellido" => $data['apellido'],
//         "telefono" => $data['telefono'],
//         "correo" => $data['correo'],
//         "direccion" => $data['direccion'],
//         "fechaNacimiento" => $data['fechaNacimiento'],
//         "genero" => $data['genero'],
//         "estado" => $data['estado'],
//         "observaciones" => $data['observaciones']
//     );
// }


// foreach ($data as $row) {
// }

// echo $subData[];

// }
// for ($i=0; $i < count($subData) ; $i++) { 
//     echo $subData[$i]. "<br>";
//     // }
//     echo json_encode($subData, JSON_PRETTY_PRINT);

// } else {
//     echo "No se encontraron resultados.<br>";
// }

// Cerrar la conexión y el resultado
// $result->close();
// $conn->close();
