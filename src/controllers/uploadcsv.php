<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
include('../../config/db.php');

$hasDuplicates = false;
$errorCount = 0;
$jsonFile = 'estudiantes.json';
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

            // Leer las filas y agregarlas al array
            while (($row = fgetcsv($handle, 1000, ';')) !== FALSE) {
                // Verificar que cada fila tenga el mismo número de columnas que las cabeceras
                if (count($row) == count($headers)) {
                    $data[] = array_combine($headers, $row); // Combinar cabeceras con los valores de la fila
                    $data = array_map(function ($item) {
                        if (is_string($item)) {
                            $item = str_replace('�', 'ñ', $item);
                            return mb_convert_encoding($item, 'UTF-8', 'auto');
                        }
                        return $item;
                    }, $data);
                } else {
                    // Si no coincide el número de columnas, muestra un mensaje de advertencia
                    echo "Advertencia: Fila con número de columnas diferente a las cabeceras. Ignorando fila.";
                }
            }

            fclose($handle);

            // Verificar si se cargaron datos
            if (empty($data)) {
                echo "No se encontraron datos válidos en el archivo CSV.";
            } else {
                $jsonData = json_encode($data, JSON_PRETTY_PRINT);

                // Verificar si hubo un error con json_encode
                if (json_last_error() !== JSON_ERROR_NONE) {
                    echo 'Error al convertir a JSON: ' . json_last_error_msg();
                } else {
                    echo "Datos convertidos a JSON correctamente.";
                }
                file_put_contents($jsonFile, $jsonData);
            }
        } else {
            echo "No se pudo abrir el archivo CSV.";
        }
    }


    if (isset($_POST['delete_id'])) {
        $deleteId = $_POST['delete_id'];

        if (file_exists($jsonFile)) {
            $data = json_decode(file_get_contents($jsonFile), true);
            $data = array_filter($data, fn($row) => $row['NoDocumento'] != $deleteId);

            file_put_contents($jsonFile, json_encode($data, JSON_PRETTY_PRINT));
        }
    }

    if (isset($_POST['edit_id'])) {
        $editId = $_POST['edit_id'];
        $field = $_POST['field'];
        $value = $_POST['value'];

        if (file_exists($jsonFile)) {
            $data = json_decode(file_get_contents($jsonFile), true);

            // Buscar el registro que coincida con el NoDocumento para editar
            foreach ($data as &$row) {
                if ($row['NoDocumento'] == $editId) {
                    $row[$field] = $value;
                    break;
                }
            }

            // Guardar los cambios en el archivo JSON
            file_put_contents($jsonFile, json_encode($data, JSON_PRETTY_PRINT));
        }
    }


    if (isset($_POST['upload_db'])) {
        $jsonFile = 'estudiantes.json';
        $table = 'estudiantes';

        // Verificar si el archivo JSON existe
        $data = file_exists($jsonFile) ? json_decode(file_get_contents($jsonFile), true) : [];

        try {
            // Obtener los IDs existentes en la base de datos
            $stmt = $pdo->query("SELECT 'estudiantes_no_documento' FROM estudiantes");
            $idsInDatabase = $stmt->fetchAll(PDO::FETCH_COLUMN, 0); // Obtener todos los IDs en un array

            // Asegurarse de que $idsInDatabase es un array válido
            if (!is_array($idsInDatabase)) {
                $idsInDatabase = []; // Si no es un array válido, inicialízalo como un array vacío
            }

            // Verificar si se obtuvo algún ID
            if ($idsInDatabase === false) {
                throw new Exception("Error al obtener los IDs de la base de datos.");
            }

            // Convertir el array de IDs en un conjunto (SET) para comparaciones rápidas
            $idsInDatabaseSet = array_flip($idsInDatabase); // Array flip para crear un conjunto

            // Si hay datos en el archivo CSV
            if (!empty($data)) {
                $hasDuplicates = false;

                // Verificar duplicados en el CSV y en la base de datos
                foreach ($data as $row) {
                    if (isset($idsInDatabaseSet[$row['ID']])) {
                        // Marcar como duplicado si el ID ya está en la base de datos
                        $row['is_duplicate'] = true;
                    } else {
                        $row['is_duplicate'] = false;
                    }

                    // Si encontramos duplicados, marcar la variable $hasDuplicates
                    if ($row['is_duplicate']) {
                        $hasDuplicates = true;
                    }
                }

                // Si no hay duplicados, proceder con la carga
                if (!$hasDuplicates) {
                    // Vaciar la tabla antes de insertar nuevos datos
                    // $pdo->exec("DELETE FROM $table");

                    // Preparar la consulta para insertar los datos
                    $stmt = $pdo->prepare("
                    INSERT INTO estudiantes (
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
                        estudiantes_adjuntos_id,
                        estudiantes_observaciones, 
                        estudiantes_doble_titulacion, 
                        estudiantes_doble_titulacion_id
                    ) VALUES (
                        :no_documento, 
                        :tipo_documento, 
                        :nombre, 
                        :apellidos, 
                        :fecha_nacimiento, 
                        :genero, 
                        :telefono, 
                        :correo, 
                        :estado, 
                        :direccion, 
                        :adjuntos_id,   
                        :observaciones, 
                        :doble_titulacion, 
                        :doble_titulacion_id
                    )
                ");
                    // Insertar los datos
                    foreach ($data as $row) {
                        $stmt->execute([
                            ':no_documento' => $row['NoDocumento'],
                            ':tipo_documento' => $row['TipoDocumento'],
                            ':nombre' => $row['Nombre'],
                            ':apellidos' => $row['Apellidos'],
                            ':fecha_nacimiento' => $row['FechaNacimiento'],
                            ':genero' => $row['Genero'],
                            ':telefono' => $row['Telefono'],
                            ':correo' => $row['Correo'],
                            ':estado' => $row['Estado'],
                            ':direccion' => $row['Direccion'],
                            ':adjuntos_id' => $row['AdjuntosID'],
                            ':observaciones' => $row['Observaciones'],
                            ':doble_titulacion' => $row['DobleTitulacion'],
                            ':doble_titulacion_id' => $row['DobleTitulacionID']
                        ]);
                    }
                    echo $stmt;

                    echo "<script>alert('Datos subidos exitosamente a la base de datos.');</script>";
                } else {
                    echo "<script>alert('Error: Algunos registros tienen IDs duplicados en la base de datos. Corrige los duplicados antes de intentar nuevamente.');</script>";
                }
            }
        } catch (PDOException $e) {
            echo "<script>alert('Error al obtener los IDs de la base de datos: {$e->getMessage()}');</script>";
        } catch (Exception $e) {
            echo "<script>alert('Error: {$e->getMessage()}');</script>";
        }
    }
}


$jsonFile = 'estudiantes.json';
$data = file_exists($jsonFile) ? json_decode(file_get_contents($jsonFile), true) : [];
if (!empty($data)) {
    $ids = array_column($data, 'NoDocumento'); // Usamos NoDocumento en lugar de ID
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
                <h1>Subir CSV</h1>
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
            if (is_array($data) && !empty($data)) {
                foreach ($data as $row) {
                    if (count(array_keys($ids, $row['NoDocumento'])) > 1) { // Usamos NoDocumento en lugar de ID
                        $csvDuplicateCount++;
                    }
                }
            } else {
                echo "No hay datos disponibles para procesar.";
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
                                
                    <button id="showErrorsBtn" class="btn btn-danger">Ver Solo con Error</button>  
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
                                <th>AdjuntosID</th>
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
        </div>
    </div>

    <script>
        $(document).ready(function() {
            // Filtrar en tiempo real
            $('#filter').on('input', function() {
                let filterValue = $(this).val().toLowerCase();

                $('#data-table tbody tr').each(function() {
                    let row = $(this);
                    let textContent = row.data('no-documento') + ' ' + row.data('nombre') + ' ' + row.data('telefono') + ' ' + row.data('correo');
                    row.toggle(textContent.toLowerCase().includes(filterValue));
                });
            });

            // Hacer que todas las celdas sean editables
            $('td[contenteditable="true"]').on('blur', function() {
                const row = $(this).closest('tr');
                const noDocumento = row.data('no-documento');
                const field = $(this).data('field');
                const newValue = $(this).text().trim();

                // Actualizar el JSON (en este caso en el archivo PHP)
                $.post('uploadcsv.php', {
                        edit_no_documento: noDocumento,
                        field: field,
                        value: newValue
                    })
                    .done(function(response) {
                        console.log('Campo actualizado correctamente');
                        // Verificar si el NoDocumento actualizado es un duplicado
                        checkDuplicates(row, newValue);
                    })
                    .fail(function() {
                        alert('Error al actualizar el campo');
                    });
            });

            // Función para verificar duplicados en el CSV y base de datos
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
                row.removeClass('duplicate');
                row.removeClass('error');
                // Si es duplicado, agregar la clase correspondiente
                if (isDuplicateInDb) {
                    row.addClass('error'); // O 'error' dependiendo del caso
                }
                if (isDuplicateInCsv) {
                    row.addClass('duplicate'); // O 'error' dependiendo del caso
                }
            }

            // Eliminar una fila
            $('button[type="submit"].delete-btn').on('click', function(e) {
                e.preventDefault(); // Prevenir el envío del formulario

                const row = $(this).closest('tr');
                const noDocumento = row.data('no-documento');

                $.post('uploadcsv.php', {
                        delete_no_documento: noDocumento
                    })
                    .done(function(response) {
                        // Eliminar la fila de la tabla sin recargar la página
                        row.remove();
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
                        location.reload();
                        // Eliminar el archivo JSON después de que los datos fueron subidos
                        $.post('truncate.php', {
                                fileName: 'estudiantes.json' // Cambia 'archivo.json' por el nombre correcto del archivo JSON
                            })
                            .done(function() {
                                // alert('Datos subidos exitosamente y tabla de datos limpiada.');
                            })
                            .fail(function() {
                                // window.location.replace(`../../public/student_register.php?status=error`);
                            });
                        // window.location.replace(`../../public/student_register.php?status=success`);
                    })
                    .fail(function() {
                        alert('Hubo un error al subir los datos.');
                    });
            }
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
                        $sql = "
                                SELECT estudiantes_no_documento AS NoDocumento, estudiantes_nombre AS Nombre, estudiantes_telefono AS Telefono, estudiantes_correo AS Correo
                                FROM estudiantes
                                WHERE estudiantes_no_documento IN (" . implode(',', array_map('intval', $commonIds)) . ")
                                ORDER BY estudiantes_no_documento ASC
                            ";

                        // Ejecutar la consulta
                        $stmt = $pdo->query($sql);
                        $duplicatesInDatabase = $stmt->fetchAll(PDO::FETCH_ASSOC);
                        ?>
                        <?php foreach ($duplicatesInDatabase as $row): ?>
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