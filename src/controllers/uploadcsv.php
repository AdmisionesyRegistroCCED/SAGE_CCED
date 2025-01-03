<?php
require '../../config/db.php'; // Configuración de la base de datos

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Verificar si el archivo fue cargado
    if (isset($_FILES['file']['tmp_name'])) {
        $filePath = $_FILES['file']['tmp_name'];

        // Abrir el archivo CSV
        if (($handle = fopen($filePath, 'r')) !== FALSE) {
            // Leer la primera fila (encabezados)
            $headers = fgetcsv($handle, 1000, ';'); // Asegúrate de usar ';' como delimitador

            // Preparar la consulta SQL (adaptar a tu tabla)
            $sql = "INSERT INTO estudiantes (
                estudiantes_no_documento, 
                estudiantes_tipo_documento, 
                estudiantes_nombre, 
                estudiantes_apellidos, 
                estudiantes_fecha_nacimiento, 
                estudiantes_genero, 
                estudiantes_telefono, 
                estudiantes_correo, 
                estudiantes_estado, 
                estudiantes_direccion,
                estudiantes_observaciones,
                estudiantes_doble_titulacion, 
                estudiantes_doble_titulacion_id
            ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = $pdo->prepare($sql);

            // Leer y procesar cada fila del archivo
            while (($row = fgetcsv($handle, 1000, ';')) !== FALSE) {
                // Eliminar las columnas vacías al final de la fila
                $row = array_filter($row, function($value) {
                    return !is_null($value) && $value !== '';
                });

                // Asegurarse de que el número de columnas coincida con la tabla
                if (count($row) == 13) {
                    // Insertar solo las columnas válidas
                    $stmt->execute(array_values($row)); // Insertar fila en la base de datos
                } else {
                    echo "Fila ignorada debido a un número incorrecto de columnas: " . implode(';', $row) . "<br>";
                }
            }

            fclose($handle);
            echo "Datos cargados con éxito.";
        } else {
            echo "Error al abrir el archivo CSV.";
        }
    } else {
        echo "No se ha cargado ningún archivo.";
    }
} catch (PDOException $e) {
    echo "Error en la base de datos: " . $e->getMessage();
} catch (Exception $e) {
    echo "Error general: " . $e->getMessage();
}
?>
