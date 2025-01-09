<?php
// Verifica que se haya recibido el nombre del archivo
if (isset($_POST['fileName'])) {
    $fileName = $_POST['fileName'];
    $filePath = $fileName;  // Cambia 'ruta/del/archivo' por la ruta donde se guarda el archivo JSON

    // Verifica si el archivo existe
    if (file_exists($filePath)) {
        // Elimina el archivo
        if (unlink($filePath)) {
            echo 'Archivo eliminado exitosamente.';
        } else {
            echo 'Error al eliminar el archivo.';
        }
    } else {
        echo 'El archivo no existe.';
    }
} else {
    echo 'No se recibió el nombre del archivo.';
}
?>
