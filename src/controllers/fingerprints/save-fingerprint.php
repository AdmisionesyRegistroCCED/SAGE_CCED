<?php
// Establecer el tipo de contenido a JSON
header('Content-Type: application/json');

// Leer los datos JSON enviados por el cliente
$data = json_decode(file_get_contents('php://input'), true);

// Verificar que se recibió el fingerprint
if (isset($data['fingerprint'])) {
    $fingerprint = $data['fingerprint'];

    // Definir la ruta al archivo de fingerprints
    $filePath = __DIR__ . '/../../config/fingerprints.txt'; // Ajusta la ruta según la ubicación del archivo

    // Leer el contenido actual del archivo
    $existingFingerprints = file($filePath, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

    // Verificar si el fingerprint ya existe
    if (!in_array($fingerprint, $existingFingerprints)) {
        // Si no existe, guardar el fingerprint en fingerprints.txt
        file_put_contents($filePath, $fingerprint . PHP_EOL, FILE_APPEND);

        // Responder al cliente
        echo json_encode(['status' => 'success', 'message' => 'Fingerprint guardado']);
    } else {
        // Responder indicando que ya existe
        echo json_encode(['status' => 'exists', 'message' => 'Fingerprint ya existe']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Fingerprint no proporcionado']);
}
?>
