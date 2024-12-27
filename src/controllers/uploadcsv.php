<?php
require '../../config/db.php'; // Configuración de la base de datos

$pdo = new PDO("mysql:host=$host;dbname=$db", $user, $pass);
$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

// Recibir el archivo cargado
if (isset($_FILES['file']['tmp_name'])) {
    $filePath = $_FILES['file']['tmp_name'];

    // Paso 1: Descomprimir el archivo .xlsx
    $zip = new ZipArchive;
    if ($zip->open($filePath) === TRUE) {
        // Extraemos los archivos
        $extractPath = 'extracted/';
        $zip->extractTo($extractPath);
        $zip->close();

        // Paso 2: Leer el archivo XML de la primera hoja (sheet1.xml)
        $xmlFile = $extractPath . 'xl/worksheets/sheet1.xml';  // Asume que es la primera hoja
        $xml = simplexml_load_file($xmlFile);

        if ($xml === false) {
            echo "Error al leer el archivo XML.";
            exit;
        }

        // Depuración: Ver la estructura del XML
        echo '<pre>';
        var_dump($xml);
        echo '</pre>';

        // Paso 3: Obtener los namespaces
        $namespaces = $xml->getNamespaces(true);
        echo '<pre>';
        var_dump($namespaces); // Ver los namespaces disponibles
        echo '</pre>';

        // El namespace principal del archivo .xlsx
        $namespace = $namespaces[''];  // Namespace vacío si no tiene prefijo

        // Probar una expresión XPath simple para ver si funciona
        $xpathQuery = '//*[local-name()="sheetData"]';  // Comprobar si existe la etiqueta <sheetData>
        $sheetData = $xml->xpath($xpathQuery);  // XPath con el namespace

        // Depuración: Ver los resultados de la consulta XPath
        echo '<pre>';
        var_dump($sheetData);
        echo '</pre>';

        // Si no obtenemos resultados de la consulta XPath, mostramos un mensaje
        if (empty($sheetData)) {
            echo "No se encontraron datos en el archivo XML.";
            exit;
        }

        // Preparar la consulta SQL
        $sql = "INSERT INTO estudiantes (estudiantes_no_documento, estudiantes_tipo_documento, estudiantes_nombre, estudiantes_apellidos, estudiantes_fecha_nacimiento, estudiantes_genero, estudiantes_telefono, estudiantes_correo, estudiantes_estado, estudiantes_doble_titulacion, estudiantes_doble_titulacion_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $pdo->prepare($sql);

        // Iterar sobre las filas y extraer datos
        foreach ($sheetData as $row) {
            // Obtener las celdas de la fila
            $cellData = $row->xpath('.//*[local-name()="cell"]///*[local-name()="data"]');

            // Comprobar si $cellData es un arreglo y tiene celdas
            if (is_array($cellData) && count($cellData) > 0) {
                // Verificar que la fila tiene el número esperado de celdas (12 columnas)
                if (count($cellData) == 12) {
                    $values = [];
                    foreach ($cellData as $cell) {
                        $values[] = (string) $cell;  // Extraer el valor de la celda
                    }

                    // Inserta los datos en la base de datos
                    try {
                        $stmt->execute($values);
                    } catch (Exception $e) {
                        echo "Error al insertar los datos: " . $e->getMessage();
                    }
                } else {
                    echo "Fila con datos incompletos o incorrectos detectada.";
                }
            } else {
                echo "No se encontraron celdas en esta fila.";
            }
        }

        echo "Datos cargados con éxito.";
    } else {
        echo "Error al abrir el archivo ZIP.";
    }
} else {
    echo "No se ha cargado ningún archivo.";
}
?>
