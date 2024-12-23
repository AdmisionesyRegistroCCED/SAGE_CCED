<?php
session_start();
if (!isset($_SESSION['userdata?'])) {
    header("Location: ../src/views/login.php");
    exit();
}
$correo = $_SESSION['userdata?'];

require_once "../../config/db.php";
// Conexión a la base de datos
$conn = new mysqli($host, $user, $pass, $db);

// Verificar conexión
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Inicializa la consulta base
$sql = "SELECT * FROM `estudiantes` WHERE 1=1"; // 'WHERE 1=1' permite agregar condiciones fácilmente

// Agregar filtros a la consulta
if (!empty($_GET['document_type'])) {
    $document_type = $conn->real_escape_string($_GET['document_type']);
    $sql .= " AND estudiantes_tipo_documento = '$document_type'";
}

if (!empty($_GET['status'])) {
    $status = $conn->real_escape_string($_GET['status']);
    $sql .= " AND estudiantes_estado = '$status'";
}

$result = $conn->query($sql);

$output = ''; // Variable para almacenar la salida HTML

if ($result->num_rows > 0) {
    // Salida de datos de cada fila
    while ($row = $result->fetch_assoc()) {
        $output .= "<tr>
                        <td>" . $row['estudiantes_tipo_documento'] . "</td>
                        <td>" . $row["estudiantes_no_documento"] . "</td>
                        <td>" . $row["estudiantes_nombre"] . "</td>
                        <td>" . $row["estudiantes_apellidos"] . "</td>
                        <td>" . $row["estudiantes_fecha_nacimiento"] . "</td>
                        <td>" . $row["estudiantes_genero"] . "</td>
                        <td>" . $row["estudiantes_telefono"] . "</td>
                        <td>" . $row["estudiantes_correo"] . "</td>
                        <td>" . $row["estudiantes_estado"] . "</td>
                        <td class='optionsforlist'><a class='optionbtn editbtn' href='#edit_student'id=". $row["estudiantes_no_documento"]. "'>Editar</a>
                            <a class='optionbtn deletebtn' href='#'>Eliminar</a>
                        </td>
                    </tr>";
    }
} else {
    $output .= "<tr><td colspan='9'>No se encontraron estudiantes.</td></tr>";
}

echo $output; // Devuelve la salida HTML
$conn->close(); // Cerrar la conexión
?>

