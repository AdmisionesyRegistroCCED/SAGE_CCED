<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
require_once($_SERVER['DOCUMENT_ROOT'] . '/SAGE_CCED/config/db.php');
require "session_start.php";

$user_folder = 'uploads/' . $correo;
if (!is_dir($user_folder)) {
    mkdir($user_folder, 0777, true);  // Crear la carpeta si no existe.
}

$hasDuplicates = false;
$errorCount = 0;
$jsonFile = $user_folder . '/estudiantes.json';  // Guardar el archivo JSON en la carpeta del usuario.
$ids = [];

// Verificar si el archivo JSON existe
$data = file_exists($jsonFile) ? json_decode(file_get_contents($jsonFile), true) : [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    // Si el archivo JSON no existe, procesamos el CSV
    if (!file_exists($jsonFile) && isset($_FILES['csv_file'])) {
        $file = $_FILES['csv_file']['tmp_name'];
        $data = [];

        // Abrir el archivo CSV
        if (($handle = fopen($file, "r")) !== FALSE) {
            // Leer las cabeceras (primera línea del archivo CSV)
            $headers = fgetcsv($handle, 1000, ';');

            // Verificar si se pudieron leer las cabeceras correctamente
            if ($headers === false) {
                echo "Error al leer las cabeceras del archivo CSV.";
                fclose($handle);
                exit;
            }
            $warnings = []; // Para almacenar advertencias

            while (($row = fgetcsv($handle, 1000, ';')) !== FALSE) {
                // Verificar que cada fila tenga el mismo número de columnas que las cabeceras
                if (count($row) == count($headers)) {
                    // Combinar cabeceras con valores de la fila
                    $cleanRow = array_combine($headers, $row);

                    // Limpiar caracteres especiales y codificar en UTF-8
                    $cleanRow = array_map(function ($item) {
                        if (is_string($item)) {
                            $item = str_replace('�', 'ñ', $item);
                            return mb_convert_encoding($item, 'UTF-8', 'auto');
                        }
                        return $item;
                    }, $cleanRow);

                    // Agregar la fila limpia a los datos
                    $data[] = $cleanRow;
                } else {
                    // Guardar la advertencia sobre la fila ignorada
                    $warnings[] = "Fila con número de columnas diferente a las cabeceras: " . implode(';', $row);
                }
            }

            // Si necesitas devolver las advertencias junto con los datos
            if (!empty($warnings)) {
                file_put_contents('warnings.log', implode("\n", $warnings), FILE_APPEND);
            }

            fclose($handle);

            // Verificar si se cargaron datos
            if (empty($data)) {
                // echo "No se encontraron datos válidos en el archivo CSV.";
            } else {
                // Guardar los datos como JSON en la carpeta del usuario
                $jsonData = json_encode($data, JSON_PRETTY_PRINT);

                // Verificar si hubo un error con json_encode
                if (json_last_error() !== JSON_ERROR_NONE) {
                    // echo 'Error al convertir a JSON: ' . json_last_error_msg();
                } else {
                    // echo "Datos convertidos a JSON correctamente.";
                }
                file_put_contents($jsonFile, $jsonData);  // Guardar el archivo JSON único para este usuario
            }
        } else {
            // echo "No se pudo abrir el archivo CSV.";
        }
    }



    if (isset($_POST['deletejson'])) {
        if (isset($_POST['fileName'])) {
            $user_folder = 'uploads/' . $correo;
            $fileName = basename($_POST['fileName']); // Evita la manipulación de la ruta
            $filePath = $user_folder . '/' . $fileName; // Define la ruta donde se encuentran los archivos

            // Verifica si el archivo existe
            if (file_exists($filePath)) {
                // Elimina el archivo
                if (unlink($filePath)) {
                    echo json_encode(['status' => 'success', 'message' => 'Archivo eliminado exitosamente.']);
                } else {
                    echo json_encode(['status' => 'error', 'message' => 'Error al eliminar el archivo.']);
                }
            } else {
                echo json_encode(['status' => 'error', 'message' => 'El archivo no existe.']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'No se recibió el nombre del archivo.']);
        }
        exit;
    }




    if (isset($_POST['delete_no_documento'])) {
        $deleteId = $_POST['delete_no_documento']; // Usar 'delete_no_documento'

        // Suponiendo que $user_folder es la ruta donde se almacenan los archivos del usuario
        $user_folder = 'uploads/' . $correo; // Ejemplo de cómo se genera la carpeta del usuario

        // Ruta del archivo JSON para el usuario actual
        $jsonFile = $user_folder . '/estudiantes.json';

        // Verifica si el archivo JSON existe
        if (file_exists($jsonFile)) {
            // Leer el contenido del archivo JSON
            $data = json_decode(file_get_contents($jsonFile), true);

            // Filtrar los datos para eliminar el registro con el 'NoDocumento' que coincida con el ID
            $data = array_filter($data, fn($row) => $row['NoDocumento'] != $deleteId); // Filtrar usando 'NoDocumento'

            // Escribir los datos filtrados nuevamente en el archivo JSON
            file_put_contents($jsonFile, json_encode($data, JSON_PRETTY_PRINT));

            echo json_encode(['status' => 'success', 'message' => 'Registro eliminado correctamente.']);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'El archivo JSON no existe.']);
        }
    }




    if (isset($_POST['edit_no_documento'])) {
        $editId = $_POST['edit_no_documento'];
        $field = $_POST['field'];
        $value = $_POST['value'];

        // Ruta del archivo JSON del usuario
        $user_folder = 'uploads/' . $correo; // Asume que la carpeta del usuario es $correo
        $jsonFile = $user_folder . '/estudiantes.json'; // Ruta del archivo JSON

        if (file_exists($jsonFile)) {
            $data = json_decode(file_get_contents($jsonFile), true);

            // Buscar el registro que coincida con el NoDocumento para editar
            foreach ($data as &$row) {
                if ($row['NoDocumento'] == $editId) {
                    if (isset($row[$field])) { // Validar que la columna existe en los datos
                        $row[$field] = $value;
                    } else {
                        echo json_encode(['error' => 'Campo inválido']);
                        exit;
                    }
                    break;
                }
            }

            // Guardar los cambios en el archivo JSON
            file_put_contents($jsonFile, json_encode($data, JSON_PRETTY_PRINT));
            echo json_encode(['success' => true]); // Respuesta para el cliente
        } else {
            echo json_encode(['error' => 'Archivo JSON no encontrado']);
        }
    }

    if (isset($_POST['upload_db'])) {
        // Ruta del archivo JSON del usuario
        $user_folder = 'uploads/' . $correo; // Asume que la carpeta del usuario es $correo
        $jsonFile = $user_folder . '/estudiantes.json'; // Ruta del archivo JSON
    
        if (!file_exists($jsonFile)) {
            echo json_encode(['error' => 'Archivo JSON no encontrado']);
            exit;
        }
    
        ob_clean();
        $data = json_decode(file_get_contents($jsonFile), true);
        if (empty($data)) {
            echo json_encode(['error' => 'El archivo JSON está vacío']);
            exit;
        }
    
        try {
            // Obtener IDs existentes en la base de datos
            $stmt = $pdo->query("SELECT estudiantes_no_documento FROM estudiantes");
            $idsInDatabase = $stmt->fetchAll(PDO::FETCH_COLUMN, 0);
    
            if ($idsInDatabase === false) {
                $idsInDatabase = [];
            }
    
            // Definir mapeo de tipo de documento
            $tipoDocumentoMap = [
                'cc' => 1,
                'ti' => 2,
                'ce' => 3
            ];
    
            $duplicados = [];
            $insertValues = []; // Array para almacenar los valores a insertar
            $params = []; // Array de parámetros para preparar el INSERT
    
            foreach ($data as $row) {
                // Verificar duplicados
                if (in_array($row['NoDocumento'], $idsInDatabase)) {
                    $duplicados[] = $row['NoDocumento'];
                } else {
                    // Mapear el tipo de documento
                    $tipoDocumento = isset($tipoDocumentoMap[$row['TipoDocumento']]) ? $tipoDocumentoMap[$row['TipoDocumento']] : null;
    
                    if ($tipoDocumento === null) {
                        // Si no se encuentra en el mapeo, ignoramos el registro
                        continue;
                    }
    
                    // Preparar los valores para la inserción
                    $insertValues[] = "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    $params = array_merge($params, [
                        $row['NoDocumento'],
                        $tipoDocumento,  // Se usa el valor mapeado
                        $row['Nombre'],
                        $row['Apellidos'],
                        $row['FechaNacimiento'],
                        $row['Genero'],
                        $row['Telefono'],
                        $row['Correo'],
                        $row['Estado'],
                        $row['Direccion'],
                        $row['AdjuntosID'],
                        $row['Observaciones'],
                        $row['DobleTitulacion'],
                        $row['DobleTitulacionID']
                    ]);
                }
            }
    
            if (!empty($insertValues)) {
                $insertQuery = "INSERT INTO estudiantes (
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
                    estudiantes_adjunto_id,
                    estudiantes_observaciones, 
                    estudiantes_doble_titulacion, 
                    estudiantes_doble_titulacion_id
                ) VALUES ";
    
                $insertQuery .= implode(", ", $insertValues);
    
                try {
                    $stmtInsert = $pdo->prepare($insertQuery);
                    $stmtInsert->execute($params); // Ejecutar una sola consulta con todos los valores
                    echo json_encode(['success' => true]);
                } catch (PDOException $e) {
                    echo json_encode(['error' => 'Error al subir los datos', 'message' => $e->getMessage()]);
                }
            }
            
            $user_folder = 'uploads/' . $correo;
            $fileName = basename($_POST['fileName']); // Evita la manipulación de la ruta
            $filePath = $user_folder . '/' . $fileName; // Define la ruta donde se encuentran los archivos
            unlink($filePath);
            
            if (!empty($duplicados)) {
                echo json_encode(['error' => 'Se encontraron duplicados en la base de datos', 'duplicados' => $duplicados]);
            } else {
                echo json_encode(['success' => true]);
            }
        } catch (PDOException $e) {
            echo json_encode(['error' => 'Error al subir los datos: ' . $e->getMessage()]);
        }
    }
    
    
}


// Ruta de la carpeta del usuario
$user_folder = 'uploads/' . $correo; // Asegúrate de que $correo esté definido y seguro
$jsonFile = $user_folder . '/estudiantes.json'; // Ruta completa al archivo JSON del usuario

// Verificar si el archivo existe
$data = file_exists($jsonFile) ? json_decode(file_get_contents($jsonFile), true) : [];

if (!empty($data)) {
    $ids = array_column($data, 'NoDocumento'); // Extraemos todos los valores de 'NoDocumento'
    $hasDuplicates = false;

    foreach ($data as $row) {
        if (count(array_keys($ids, $row['NoDocumento'])) > 1) { // Verificamos duplicados en NoDocumento
            $hasDuplicates = true;
            break;
        }
    }
}

?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subir CSV</title>
    <link rel="stylesheet" href="../../public/assets/css/csv.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



    <div class="wrapper">
        <div class="main">
            <header>
                <div class="header">
                    <div class="sec1">
                        <a class="backbtn" href="../../public/student_register.php"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="35" height="35">
                                <path fill="white"
                                    d="M177.5 414c-8.8 3.8-19 2-26-4.6l-144-136C2.7 268.9 0 262.6 0 256s2.7-12.9 7.5-17.4l144-136c7-6.6 17.2-8.4 26-4.6s14.5 12.5 14.5 22l0 72 288 0c17.7 0 32 14.3 32 32l0 64c0 17.7-14.3 32-32 32l-288 0 0 72c0 9.6-5.7 18.2-14.5 22z" />
                            </svg>
                        </a>
                    </div>
                    <div class="sec2">
                        <h1>Subir CSV</h1>
                    </div>
                </div>
            </header>
            <div class="form-container">
                <form method="POST" enctype="multipart/form-data">
                    <input type="file" name="csv_file" accept=".csv" required>
                    <button type="submit">Cargar Archivo</button>
                </form>
            </div>
            <?php
            $stmt = $pdo->query("SELECT estudiantes_no_documento FROM estudiantes");
            $idsInDatabase = $stmt->fetchAll(PDO::FETCH_COLUMN, 0);

            // Comparar los NoDocumento
            $commonIds = array_intersect($ids, $idsInDatabase);

            // Contador de duplicados en el CSV
            $csvDuplicateCount = 0;

            foreach ($data as $row) {
                if (count(array_keys($ids, $row['NoDocumento'])) > 1) {
                    $csvDuplicateCount++;
                }
            }
            // Contador de duplicados en la Base de Datos
            $dbDuplicateCount = count($commonIds);
            // Número de registros por página, con un valor predeterminado de 10
            $registrosPorPagina = isset($_GET['registros']) ? (int)$_GET['registros'] : 10;

            // Obtener la página actual desde la URL (si no está presente, se establece en la página 1)
            $páginaActual = isset($_GET['page']) ? (int)$_GET['page'] : 1;

            // Calcular el índice de inicio de los registros para la página actual
            $inicio = ($páginaActual - 1) * $registrosPorPagina;

            // Dividir los datos en páginas (usar array_slice para obtener la porción correcta)
            $páginaDatos = array_slice($data, $inicio, $registrosPorPagina);

            // Calcular el número total de páginas
            $totalPáginas = ceil(count($data) / $registrosPorPagina);

            if (file_exists($jsonFile)) {
            ?>

                <div class="filters">
                    <h2>Filtros:</h2>
                    <input type="text" id="filter" placeholder="Busqueda...">
                    <form method="GET" action="">
                        <label for="registros">Registros por página:</label>
                        <select name="registros" id="registros" onchange="this.form.submit()">
                            <option value="10" <?= ($registrosPorPagina == 10) ? 'selected' : '' ?>>10</option>
                            <option value="20" <?= ($registrosPorPagina == 20) ? 'selected' : '' ?>>25</option>
                            <option value="30" <?= ($registrosPorPagina == 30) ? 'selected' : '' ?>>50</option>
                        </select>
                    </form>
                </div>
                <div class="filters">

                    <div class="prettierdown">
                        <div class="rowdata dataup">
                            <div class="paginacion">
                                <!-- Enlace a la página anterior -->
                                <a href="?page=1&registros=<?= $registrosPorPagina ?>" class="prev">&lt;&lt;</a>
                                <a href="?page=<?= max(1, $páginaActual - 1) ?>&registros=<?= $registrosPorPagina ?>" class="prev">&lt;</a>

                                <!-- Páginas numéricas -->
                                <?php for ($i = 1; $i <= $totalPáginas; $i++): ?>
                                    <?php if ($i == 1 || $i == $totalPáginas || ($i >= $páginaActual - 2 && $i <= $páginaActual + 2)): ?>
                                        <a href="?page=<?= $i ?>&registros=<?= $registrosPorPagina ?>"
                                            class="<?= ($i == $páginaActual) ? 'active' : '' ?>"><?= $i ?></a>
                                    <?php elseif ($i == $páginaActual - 3 || $i == $páginaActual + 3): ?>
                                        <span>...</span>
                                    <?php endif; ?>
                                <?php endfor; ?>

                                <!-- Enlace a la página siguiente -->
                                <a href="?page=<?= min($totalPáginas, $páginaActual + 1) ?>&registros=<?= $registrosPorPagina ?>" class="next">&gt;</a>
                                <a href="?page=<?= $totalPáginas ?>&registros=<?= $registrosPorPagina ?>" class="next">&gt;&gt;</a>
                            </div>
                            <div class="fdata">
                                <div class="error-counter">
                                    <span class="error-circle"><?= $csvDuplicateCount ?></span> Duplicados en el CSV
                                </div>
                                <div class="error-counter">
                                    <span class="error-circle"><?= $dbDuplicateCount ?></span> Duplicados en la Base de Datos
                                </div>
                            </div>
                        </div>
                        <div class="buttons">
                            <button class="btn btn-danger" onclick="truncatejson()">Limpiar registros en la tabla</button>
                            <button id="showErrorsBtn" class="btn btn-danger">Ver Solo con Error</button>
                        </div>
                    </div>
                </div>
                <div class="datarows">
                    <?php if (!empty($páginaDatos)): ?>
                        <table id="data-table">
                            <thead>
                                <tr>
                                    <th>NoDocumento</th>
                                    <th>TipoDocumento</th>
                                    <th>Nombre</th>
                                    <th>Apellidos</th>
                                    <th>FechaNacimiento</th>
                                    <th>Genero</th>
                                    <th>Telefono</th>
                                    <th>Correo</th>
                                    <th>Estado</th>
                                    <th>Direccion</th>
                                    <th>AdjuntoID</th>
                                    <th>Observaciones</th>
                                    <th>DobleTitulacion</th>
                                    <th>DobleTitulacionID</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>

                            <tbody>
                                <?php
                                // Obtener los NoDocumento desde el archivo CSV
                                $ids = array_map(function ($row) {
                                    return $row['NoDocumento'];
                                }, $data);

                                // Obtener los NoDocumento desde la base de datos
                                $stmt = $pdo->query("SELECT estudiantes_no_documento FROM estudiantes");
                                $idsInDatabase = $stmt->fetchAll(PDO::FETCH_COLUMN, 0);

                                // Comparar los NoDocumento
                                $commonIds = array_intersect($ids, $idsInDatabase);

                                // Ahora mostrar los datos de la página actual
                                foreach ($páginaDatos as $row):
                                    $isDuplicate = count(array_keys($ids, $row['NoDocumento'])) > 1; // Verifica si hay duplicados en el CSV
                                    $isInDatabase = in_array($row['NoDocumento'], $commonIds); // Verifica si el NoDocumento está en la lista de comunes

                                    $rowClass = $isDuplicate ? 'duplicate' : ($isInDatabase ? 'error' : '');
                                ?>
                                    <tr class="<?= $rowClass ?>"
                                        data-no-documento="<?= $row['NoDocumento'] ?>"
                                        data-tipo-documento="<?= $row['TipoDocumento'] ?>"
                                        data-nombre="<?= $row['Nombre'] ?>"
                                        data-apellidos="<?= $row['Apellidos'] ?>"
                                        data-fecha-nacimiento="<?= $row['FechaNacimiento'] ?>"
                                        data-genero="<?= $row['Genero'] ?>"
                                        data-telefono="<?= $row['Telefono'] ?>"
                                        data-correo="<?= $row['Correo'] ?>"
                                        data-estado="<?= $row['Estado'] ?>"
                                        data-direccion="<?= $row['Direccion'] ?>"
                                        data-adjuntos-id="<?= $row['AdjuntosID'] ?>"
                                        data-observaciones="<?= $row['Observaciones'] ?>"
                                        data-doble-titulacion="<?= $row['DobleTitulacion'] ?>"
                                        data-doble-titulacion-id="<?= $row['DobleTitulacionID'] ?>">
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="NoDocumento">
                                            <?= htmlspecialchars($row['NoDocumento']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="TipoDocumento">
                                            <?= htmlspecialchars($row['TipoDocumento']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="Nombre">
                                            <?= htmlspecialchars($row['Nombre']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="Apellidos">
                                            <?= htmlspecialchars($row['Apellidos']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="FechaNacimiento">
                                            <?= htmlspecialchars($row['FechaNacimiento']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="Genero">
                                            <?= htmlspecialchars($row['Genero']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="Telefono">
                                            <?= htmlspecialchars($row['Telefono']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="Correo">
                                            <?= htmlspecialchars($row['Correo']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="Estado">
                                            <?= htmlspecialchars($row['Estado']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="Direccion">
                                            <?= htmlspecialchars($row['Direccion']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="AdjuntosID">
                                            <?= htmlspecialchars($row['AdjuntosID']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="Observaciones">
                                            <?= htmlspecialchars($row['Observaciones']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="DobleTitulacion">
                                            <?= htmlspecialchars($row['DobleTitulacion']) ?>
                                        </td>
                                        <td contenteditable="true" data-no-documento="<?= $row['NoDocumento'] ?>" data-field="DobleTitulacionID">
                                            <?= htmlspecialchars($row['DobleTitulacionID']) ?>
                                        </td>
                                        <td>
                                            <form method="POST" style="display: inline;">
                                                <input type="hidden" name="delete_no_documento" value="<?= $row['NoDocumento'] ?>">
                                                <button class="delete-btn" type="submit">Eliminar</button>
                                            </form>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    <?php endif; ?>

                    <div class="paginacion">
                        <!-- Enlace a la página anterior -->
                        <a href="?page=1&registros=<?= $registrosPorPagina ?>" class="prev">&lt;&lt;</a>
                        <a href="?page=<?= max(1, $páginaActual - 1) ?>&registros=<?= $registrosPorPagina ?>" class="prev">&lt;</a>

                        <!-- Páginas numéricas -->
                        <?php for ($i = 1; $i <= $totalPáginas; $i++): ?>
                            <?php if ($i == 1 || $i == $totalPáginas || ($i >= $páginaActual - 2 && $i <= $páginaActual + 2)): ?>
                                <a href="?page=<?= $i ?>&registros=<?= $registrosPorPagina ?>"
                                    class="<?= ($i == $páginaActual) ? 'active' : '' ?>"><?= $i ?></a>
                            <?php elseif ($i == $páginaActual - 3 || $i == $páginaActual + 3): ?>
                                <span>...</span>
                            <?php endif; ?>
                        <?php endfor; ?>

                        <!-- Enlace a la página siguiente -->
                        <a href="?page=<?= min($totalPáginas, $páginaActual + 1) ?>&registros=<?= $registrosPorPagina ?>" class="next">&gt;</a>
                        <a href="?page=<?= $totalPáginas ?>&registros=<?= $registrosPorPagina ?>" class="next">&gt;&gt;</a>
                    </div>
                </div>


                <button class="floating-button <?= $hasDuplicates ? 'disabled' : '' ?>" <?= $hasDuplicates ? 'disabled' : '' ?> onclick="uploadToDatabase()">Cargar a la base de datos</button>
            <?php
            } else {
                echo "<p>Para visualizar datos carga un archivo .CSV</p>";
            }
            ?>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            // Filtrar en tiempo real
            $('#filter').on('input', function() {
                let filterValue = $(this).val().toLowerCase();
                let currentUrl = new URL(window.location.href);

                // Si hay un filtro, actualizamos la URL
                if (filterValue) {
                    currentUrl.searchParams.set('filter', filterValue);
                } else {
                    currentUrl.searchParams.delete('filter'); // Eliminar filtro si está vacío
                }

                window.history.replaceState({}, '', currentUrl); // Cambiar la URL sin recargar la página

                // Aplicar el filtro a todas las filas
                let rows = $('#data-table tbody tr');
                rows.each(function() {
                    let row = $(this);
                    let textContent = row.data('no-documento') + ' ' + row.data('nombre') + ' ' + row.data('telefono') + ' ' + row.data('correo');
                    row.toggle(textContent.toLowerCase().includes(filterValue));
                });

                // Ajustar la paginación después del filtro
                adjustPagination();
            });

            // Función para ajustar la visibilidad de la paginación
            function adjustPagination() {
                let rows = $('#data-table tbody tr:visible'); // Solo filas visibles
                let rowsPerPage = parseInt($('#registros').val()); // Obtener el valor de registros por página desde el input
                let totalRows = rows.length;
                let totalPages = Math.ceil(totalRows / rowsPerPage); // Número de páginas

                // Si no hay filas visibles, vaciar la paginación
                if (totalRows === 0) {
                    $('.paginacion').empty(); // Vaciar la paginación
                    return;
                }

                let currentPage = getCurrentPageFromUrl();

                // Calcular las filas que deben ser visibles en la página actual
                let start = (currentPage - 1) * rowsPerPage;
                let end = start + rowsPerPage;

                // Ocultar todas las filas
                rows.hide();

                // Mostrar solo las filas correspondientes a la página actual
                rows.slice(start, end).show();

                // Actualizar los controles de paginación
                updatePagination(totalPages, currentPage);
            }

            // Función para obtener la página actual desde la URL
            function getCurrentPageFromUrl() {
                let urlParams = new URLSearchParams(window.location.search);
                return parseInt(urlParams.get('page')) || 1; // Si no se encuentra la página, por defecto es 1
            }

            // Función para actualizar la paginación
            function updatePagination(totalPages, currentPage) {
                let paginationContainer = $('.paginacion');
                paginationContainer.empty(); // Limpiar los enlaces de paginación actuales

                // Mostrar enlaces de paginación
                if (currentPage > 1) {
                    paginationContainer.append(`<a href="?page=1&registros=${$('#registros').val()}&filter=${getUrlParameter('filter')}" class="prev">&lt;&lt;</a>`);
                    paginationContainer.append(`<a href="?page=${currentPage - 1}&registros=${$('#registros').val()}&filter=${getUrlParameter('filter')}" class="prev">&lt;</a>`);
                }

                // Mostrar páginas numéricas
                for (let i = 1; i <= totalPages; i++) {
                    let pageLink = `<a href="?page=${i}&registros=${$('#registros').val()}&filter=${getUrlParameter('filter')}" class="${i === currentPage ? 'active' : ''}">${i}</a>`;
                    paginationContainer.append(pageLink);
                }

                // Mostrar enlaces de paginación para la siguiente página
                if (currentPage < totalPages) {
                    paginationContainer.append(`<a href="?page=${currentPage + 1}&registros=${$('#registros').val()}&filter=${getUrlParameter('filter')}" class="next">&gt;</a>`);
                    paginationContainer.append(`<a href="?page=${totalPages}&registros=${$('#registros').val()}&filter=${getUrlParameter('filter')}" class="next">&gt;&gt;</a>`);
                }
            }

            // Función para obtener un parámetro de la URL
            function getUrlParameter(name) {
                let urlParams = new URLSearchParams(window.location.search);
                return urlParams.get(name) || ''; // Si no existe, devolver un valor vacío
            }

            // Ejecutar ajuste de paginación al cargar la página
            $(document).ready(function() {
                // Rellenar el campo de filtro con el valor almacenado en la URL si existe
                let urlParams = new URLSearchParams(window.location.search);
                let filterValue = urlParams.get('filter');
                if (filterValue) {
                    $('#filter').val(filterValue); // Establecer el valor del filtro en el input
                }

                adjustPagination(); // Ajustar la paginación de acuerdo con los registros visibles
            });






            // Hacer que todas las celdas sean editables
            $('td[contenteditable="true"]').on('blur', function() {
                const row = $(this).closest('tr');
                const noDocumento = row.data('no-documento'); // Asegúrate de que `data-no-documento` esté en el HTML
                const field = $(this).data('field'); // Asegúrate de que `data-field` esté configurado
                const newValue = $(this).text().trim();
                const currentNoDocumento = row.find('td[data-field="NoDocumento"]').text(); // Obtén el NoDocumento actual
                // Obtener el NoDocumento actualizado desde la fila
                const newNoDocumento = row.find('td[data-field="NoDocumento"]').text().trim();
                // Verificar si no ha habido un cambio en el NoDocumento
                if (noDocumento === newValue || currentNoDocumento === newValue || noDocumento == newNoDocumento) {
                    return; // Si no ha cambiado, salimos de la función
                }




                // Verificar duplicados antes de enviar
                checkDuplicates(row, newNoDocumento);

                // Validar que no estén vacíos antes de enviar
                if (!noDocumento || !field) {
                    alert('Error: NoDocumento o campo no definido.');
                    return;
                }

                // Actualizar el JSON (en este caso en el archivo PHP)
                $.post('uploadcsv.php', {
                        edit_no_documento: noDocumento, // Clave que coincide con PHP
                        field: field,
                        value: newValue
                    })
                    .done(function(response) {
                        try {
                            const res = JSON.parse(response); // Analizar respuesta del servidor
                            if (res.success) {
                                console.log('Campo actualizado correctamente');
                                // Verificar duplicados después de la actualización
                                checkDuplicates(row, newNoDocumento); // Verifica duplicados con el nuevo valor
                            } else {
                                alert('Error: ' + (res.error || 'Actualización fallida'));
                            }
                        } catch (e) {
                            // alert('Error al procesar la respuesta del servidor');
                        }
                    })
                    .fail(function() {
                        alert('Error al actualizar el campo');
                    });
            });



            function checkDuplicates(row, newNoDocumento) {
                const allIdsInCsv = <?php echo json_encode(array_column($data, 'NoDocumento')); ?>;
                const idsInDatabase = <?php
                                        $stmt = $pdo->query("SELECT estudiantes_no_documento FROM estudiantes");
                                        $idsInDatabase = $stmt->fetchAll(PDO::FETCH_COLUMN, 0);
                                        echo json_encode($idsInDatabase);
                                        ?>;

                // Verificar si el nuevo NoDocumento está en el CSV o en la base de datos
                const isDuplicateInCsv = allIdsInCsv.includes(newNoDocumento);
                const isDuplicateInDb = idsInDatabase.includes(newNoDocumento);

                // Eliminar clases de duplicados o errores
                $(row).removeClass('duplicate');
                $(row).removeClass('error');

                // Si es duplicado en CSV o base de datos, agregar la clase correspondiente
                if (isDuplicateInDb) {
                    $(row).addClass('error'); // Marcamos como error si ya está en la base de datos
                }
                if (isDuplicateInCsv) {
                    $(row).addClass('duplicate'); // Marcamos como duplicado si ya está en el CSV
                }
            }

            // Llamar a esta función en el evento apropiado (cuando cambien las celdas editables)
            // $('#data-table').on('input', 'td[contenteditable="true"]', function() {
            //     const row = $(this).closest('tr'); // Obtén la fila del cambio
            //     const newNoDocumento = row.find('td[data-field="NoDocumento"]').text(); // Obtén el NoDocumento de la fila
            //     checkDuplicates(row, newNoDocumento); // Llama a la función para actualizar clases
            // });


            // Eliminar una fila
            $('button[type="submit"].delete-btn').on('click', function(e) {
                e.preventDefault(); // Prevenir el envío del formulario

                const row = $(this).closest('tr');
                const noDocumento = row.data('no-documento'); // Usar 'no-documento'
                if (!noDocumento) {
                    alert('Error: NoDocumento no definido.');
                    return;
                }

                // Confirmar antes de eliminar
                if (!confirm('¿Estás seguro de que deseas eliminar este registro?')) {
                    return;
                }
                $.post('uploadcsv.php', {
                        delete_no_documento: noDocumento // Enviar la clave 'delete_no_documento'
                    })
                    .done(function(response) {
                        row.fadeOut(300, function() {
                            $(this).remove(); // Eliminar completamente después de la animación
                        });
                    })
                    .fail(function() {
                        alert('Error al eliminar el registro');
                    });
            });
        });

        function uploadToDatabase() {
            if (confirm('¿Seguro que deseas subir estos datos a la base de datos?')) {
                $.post('uploadcsv.php', {
                        upload_db: true
                    })
                    .done(function(response) {
                        // Analizar la respuesta del servidor
                        let jsonResponse = JSON.parse(response);
                        if (jsonResponse.success) {
                            location.reload();
                            // Eliminar el archivo JSON después de que los datos fueron subidos
                            $.post('uploadcsv.php', {
                                    deletejson: true,
                                    fileName: 'estudiantes.json'
                                })
                                .done(function() {
                                    // alert('Datos subidos exitosamente y tabla de datos limpiada.');
                                })
                                .fail(function() {
                                    alert('Hubo un error al eliminar el archivo JSON.');
                                });
                        } else {
                            alert('Error al subir los datos: ' + (jsonResponse.message || 'Desconocido'));
                        }
                    })
                    .fail(function(jqXHR, textStatus, errorThrown) {
                        alert('Hubo un error al subir los datos. Detalles: ' + textStatus + ', ' + errorThrown);
                    });
            }
        }



        function truncatejson() {
            $.post('uploadcsv.php', {
                    deletejson: true,
                    fileName: 'estudiantes.json'
                })
                .done(function(response) {
                    try {
                        const jsonResponse = JSON.parse(response);
                        if (jsonResponse.status === 'success') {
                            alert(jsonResponse.message);
                            // Recargar la página con un parámetro único para evitar la caché
                            window.location.href = 'uploadcsv.php?nocache=' + new Date().getTime();
                        } else {
                            alert(jsonResponse.message);
                        }
                    } catch (e) {
                        alert('Error al procesar la respuesta del servidor.');
                    }
                })
                .fail(function() {
                    alert('Hubo un error al intentar limpiar la tabla.');
                });
        }
    </script>


</body>
<!-- Modal -->
<div id="errorModal" style="display: none;">
    <div class="modal-content">
        <span class="close-modal">&times;</span>
        <h2>Filas con errores</h2>
        <!-- Tabla duplicados del CSV -->
        <div>
            <h3>Duplicados en el CSV</h3>
            <table border="1">
                <thead>
                    <tr>
                        <th>NoDocumento</th>
                        <th>Nombre</th>
                        <th>Teléfono</th>
                        <th>Correo</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Filtrar los duplicados en el CSV
                    $duplicatesInCSV = array_filter($data, function ($row) use ($ids) {
                        return count(array_keys($ids, $row['NoDocumento'])) > 1;
                    });

                    // Ordenar los duplicados por NoDocumento en orden ascendente
                    usort($duplicatesInCSV, function ($a, $b) {
                        return $a['NoDocumento'] <=> $b['NoDocumento'];
                    });

                    // Mostrar los duplicados ordenados
                    foreach ($duplicatesInCSV as $row): ?>
                        <tr>
                            <td><?= htmlspecialchars($row['NoDocumento']) ?></td>
                            <td><?= htmlspecialchars($row['Nombre']) ?></td>
                            <td><?= htmlspecialchars($row['Telefono']) ?></td>
                            <td><?= htmlspecialchars($row['Correo']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </div>

        <div style="display: flex; gap: 20px; align-items: top; justify-content: space-around; margin-top: 20px">
            <!-- Tabla duplicados en la base de datos -->
            <div>
                <h3>Duplicados en la base de datos</h3>
                <table border="1" style="width: 100%">
                    <thead>
                        <tr>
                            <th>NoDocumento</th>
                            <th>Nombre</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Consulta para obtener detalles de los NoDocumento duplicados en la base de datos, ordenados por NoDocumento ascendente
                        // Asegúrate de que `$commonIds` no esté vacío antes de ejecutar la consulta
                        if (!empty($commonIds)) {
                            $sql = "
                                SELECT estudiantes_no_documento AS NoDocumento, estudiantes_nombre AS Nombre, estudiantes_telefono AS Telefono, estudiantes_correo AS Correo
                                FROM estudiantes
                                WHERE estudiantes_no_documento IN (" . implode(',', array_map('intval', $commonIds)) . ")
                                ORDER BY `estudiantes_no_documento` ASC
                            ";
                            // Ejecutar la consulta
                            $stmt = $pdo->query($sql);
                            $duplicatesInDatabase = $stmt->fetchAll(PDO::FETCH_ASSOC);

                            foreach ($duplicatesInDatabase as $row):
                        ?><tr>
                                    <td><?= htmlspecialchars($row['NoDocumento']) ?></td>
                                    <td><?= htmlspecialchars($row['Nombre']) ?></td>
                                    <td><?= htmlspecialchars($row['Telefono']) ?></td>
                                    <td><?= htmlspecialchars($row['Correo']) ?></td>
                                </tr>
                        <?php endforeach;
                        } else {
                            echo "No se encontraron registros duplicados.";
                        }

                        ?>
                    </tbody>
                </table>
            </div>

            <!-- Tabla para IDs iguales en el CSV -->
            <div>
                <h3>NoDocumento iguales de la Base de datos en el CSV cargado.</h3>
                <table border="1" style="width: 100%">
                    <thead>
                        <tr>
                            <th>NoDocumento</th>
                            <th>Nombre</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Ordenar los datos del CSV por NoDocumento ascendente
                        usort($data, function ($a, $b) {
                            return $a['NoDocumento'] <=> $b['NoDocumento'];
                        });

                        foreach ($data as $row):
                            $isInBoth = in_array($row['NoDocumento'], $commonIds);
                            if ($isInBoth): ?>
                                <tr>
                                    <td><?= htmlspecialchars($row['NoDocumento']) ?></td>
                                    <td><?= htmlspecialchars($row['Nombre']) ?></td>
                                    <td><?= htmlspecialchars($row['Telefono']) ?></td>
                                    <td><?= htmlspecialchars($row['Correo']) ?></td>
                                </tr>
                        <?php endif;
                        endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    // Mostrar el modal
    document.getElementById('showErrorsBtn').addEventListener('click', function() {
        document.getElementById('errorModal').style.display = 'block';
    });

    // Cerrar el modal
    document.querySelector('.close-modal').addEventListener('click', function() {
        document.getElementById('errorModal').style.display = 'none';
    });

    // Cerrar modal al hacer clic fuera del contenido
    window.addEventListener('click', function(event) {
        const modal = document.getElementById('errorModal');
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });
</script>

</html>