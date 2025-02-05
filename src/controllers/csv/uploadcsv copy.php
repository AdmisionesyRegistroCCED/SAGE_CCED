<?php
// Verificar si se ha enviado un archivo y si no hay errores en la carga
if (isset($_FILES['file']) && $_FILES['file']['error'] === 0) {
    // Extraer información del archivo
    $name = $_FILES['file']['name'];
    $ext = strtolower(pathinfo($name, PATHINFO_EXTENSION)); // Usar pathinfo para obtener la extensión de manera más confiable
    $tmpName = $_FILES['file']['tmp_name'];

    // Verificar que el archivo sea un CSV
    if ($ext === 'csv') {
        // Intentar abrir el archivo CSV
        if (($handle = fopen($tmpName, 'r')) !== FALSE) {
            // Permitir ejecución sin límite de tiempo en caso de archivos grandes
            set_time_limit(0);

            $row = 0;
            $response_data = [];  // Para almacenar los datos procesados

            // Leer cada línea del archivo CSV
            while (($data = fgetcsv($handle, 1000, ';')) !== FALSE) {  // Cambié la coma por punto y coma como delimitador
                $col_count = count($data);

                // Si el número de columnas es correcto, agregar la fila al array
                if ($col_count == 13) {  // Asegúrate de que tenga las 13 columnas necesarias
                    $response_data[] = [
                        'estudiantes_no_documento' => $data[0], 
                        'estudiantes_tipo_documento' => $data[1],
                        'estudiantes_nombre' => $data[2],
                        'estudiantes_apellidos' => $data[3],
                        'estudiantes_fecha_nacimiento' => $data[4],
                        'estudiantes_genero' => $data[5],
                        'estudiantes_telefono' => $data[6],
                        'estudiantes_correo' => $data[7],
                        'estudiantes_estado' => $data[8],
                        'estudiantes_direccion' => $data[9],
                        'estudiantes_observaciones' => $data[10],
                        'estudiantes_doble_titulacion' => $data[11],
                        'estudiantes_doble_titulacion_id' => $data[12]
                    ];
                }

                $row++;
            }

            fclose($handle);

            // Identificar los duplicados en la columna "No Documento"
            $documentos = array();
            $duplicados = array();

            foreach ($response_data as $index => $row_data) {
                if (in_array($row_data['estudiantes_no_documento'], $documentos)) {
                    $duplicados[] = $index;  // Si se repite, lo agregamos al array de duplicados
                } else {
                    $documentos[] = $row_data['estudiantes_no_documento'];
                }
            }

            // Mostrar la tabla con los datos procesados y resaltar duplicados
            echo "<h2>Datos del archivo CSV:</h2>";
            echo "<label for='records_per_page'>Mostrar por página:</label>";
            echo "<select id='records_per_page' onchange='updateTable()'>
                    <option value='5'>5</option>
                    <option value='10'>10</option>
                    <option value='20'>20</option>
                    <option value='50'>50</option>
                </select>";

            echo "<div id='pagination'></div>";  // Para la paginación
            echo "<table border='1' id='csv_table'>
                    <thead>
                        <tr>
                            <th>No Documento</th>
                            <th>Tipo Documento</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Fecha Nacimiento</th>
                            <th>Género</th>
                            <th>Teléfono</th>
                            <th>Correo</th>
                            <th>Estado</th>
                            <th>Dirección</th>
                            <th>Observaciones</th>
                            <th>Doble Titulación</th>
                            <th>ID Doble Titulación</th>
                        </tr>
                    </thead>
                    <tbody>";

            // Llenar la tabla con los datos procesados
            foreach ($response_data as $index => $row_data) {
                // Si la fila está en los duplicados, marcarla en rojo
                $row_class = in_array($index, $duplicados) ? ' class="duplicate"' : '';
                echo "<tr$row_class>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_no_documento']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_tipo_documento']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_nombre']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_apellidos']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_fecha_nacimiento']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_genero']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_telefono']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_correo']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_estado']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_direccion']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_observaciones']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_doble_titulacion']) . "</td>";
                echo "<td>" . htmlspecialchars($row_data['estudiantes_doble_titulacion_id']) . "</td>";
                echo "</tr>";
            }

            echo "</tbody></table>";
            
            // Responder con los datos procesados en formato JSON
            echo json_encode([
                'status' => 'success',
                'message' => 'Datos cargados correctamente.',
                'data' => $response_data  // Los datos procesados directamente
            ]);
        } else {
            // Responder con un error si no se puede abrir el archivo
            echo json_encode([
                'status' => 'error',
                'message' => 'No se pudo abrir el archivo CSV.'
            ]);
        }
    } else {
        // Responder con un error si el archivo no es un CSV válido
        echo json_encode([
            'status' => 'error',
            'message' => 'El archivo no es un CSV válido.'
        ]);
    }
} else {
    // Verificar si hubo algún error en la carga del archivo
    if (isset($_FILES['file']['error']) && $_FILES['file']['error'] != 0) {
        echo json_encode([
            'status' => 'error',
            'message' => 'Error en la carga del archivo: ' . $_FILES['file']['error']
        ]);
    } else {
        echo json_encode([
            'status' => 'error',
            'message' => 'No se ha enviado ningún archivo.'
        ]);
    }
}
echo json_encode([
    'status' => 'success',
    'message' => 'Datos cargados correctamente.',
    'data' => $response_data,  // Los datos procesados directamente
    'duplicados' => $duplicados // Pasar los índices de los duplicados también
]);
?>

<script>
let currentPage = 1;
let rowsPerPage = 5;
let totalPages = 1;
let data = [];  // Almacenará los datos que vienen del backend
let duplicados = [];  // Almacenará los índices de los duplicados

// Este código se ejecuta cuando el formulario se envía
function loadCSVData() {
    fetch('tu_archivo_php.php', {
        method: 'POST',
        body: new FormData(document.querySelector('form'))  // Enviar el formulario con el archivo CSV
    }).then(response => response.json())
    .then(response => {
        if (response.status === 'success') {
            data = response.data;
            duplicados = response.duplicados;
            totalPages = Math.ceil(data.length / rowsPerPage);  // Calcular el total de páginas
            displayTable(currentPage);  // Mostrar la primera página
        } else {
            alert(response.message);  // En caso de error
        }
    });
}

// Esta función muestra los datos en la tabla
function displayTable(page) {
    const tableBody = document.querySelector("#csv_table tbody");
    const start = (page - 1) * rowsPerPage;
    const end = start + rowsPerPage;

    // Limpiar la tabla antes de llenarla
    tableBody.innerHTML = "";

    // Obtener las filas correspondientes a la página actual
    const rowsToShow = data.slice(start, end);
    rowsToShow.forEach((row, index) => {
        let rowClass = '';
        if (duplicados.includes(start + index)) {
            rowClass = 'class="duplicate"';  // Si es duplicado, marcar la fila
        }

        let rowHTML = `<tr ${rowClass}>`;
        rowHTML += `<td>${row.estudiantes_no_documento}</td>`;
        rowHTML += `<td>${row.estudiantes_tipo_documento}</td>`;
        rowHTML += `<td>${row.estudiantes_nombre}</td>`;
        rowHTML += `<td>${row.estudiantes_apellidos}</td>`;
        rowHTML += `<td>${row.estudiantes_fecha_nacimiento}</td>`;
        rowHTML += `<td>${row.estudiantes_genero}</td>`;
        rowHTML += `<td>${row.estudiantes_telefono}</td>`;
        rowHTML += `<td>${row.estudiantes_correo}</td>`;
        rowHTML += `<td>${row.estudiantes_estado}</td>`;
        rowHTML += `<td>${row.estudiantes_direccion}</td>`;
        rowHTML += `<td>${row.estudiantes_observaciones}</td>`;
        rowHTML += `<td>${row.estudiantes_doble_titulacion}</td>`;
        rowHTML += `<td>${row.estudiantes_doble_titulacion_id}</td>`;
        rowHTML += "</tr>";

        tableBody.innerHTML += rowHTML;
    });

    // Paginación
    let paginationHTML = "";

    if (currentPage > 1) {
        paginationHTML += `<button onclick="changePage(${currentPage - 1})">Anterior</button>`;
    }

    paginationHTML += ` Página ${currentPage} de ${totalPages} `;

    if (currentPage < totalPages) {
        paginationHTML += `<button onclick="changePage(${currentPage + 1})">Siguiente</button>`;
    }

    let pageNumbers = '';
    for (let i = 1; i <= totalPages; i++) {
        pageNumbers += `<button onclick="changePage(${i})">${i}</button> `;
    }

    document.getElementById('pagination').innerHTML = paginationHTML + pageNumbers;
}

// Cambiar de página
function changePage(page) {
    currentPage = page;
    displayTable(currentPage);
}

// Actualizar la cantidad de registros por página
function updateTable() {
    rowsPerPage = parseInt(document.getElementById('records_per_page').value);
    totalPages = Math.ceil(data.length / rowsPerPage);
    currentPage = 1;  // Restablecer a la primera página
    displayTable(currentPage);
}

// Ejecutar al cargar la página
document.addEventListener('DOMContentLoaded', loadCSVData);

</script>

<style>
.duplicate {
    background-color: red;
    color: white;
}

#csv_table {
    width: 100%;
    border-collapse: collapse;
}

#csv_table th, #csv_table td {
    padding: 8px;
    text-align: left;
    border: 1px solid #ddd;
}

#pagination button {
    margin: 5px;
    padding: 5px 10px;
}

</style>
