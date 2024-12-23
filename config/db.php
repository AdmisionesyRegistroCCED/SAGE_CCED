<?php
$host = 'localhost';
$user = 'root'; 
$pass = '';
$db = 'sage_ccedspanish'; 
// $db = 'sage_cced'; 

$conn = new mysqli($host, $user, $pass, $db);

try {
    // Crear una nueva conexión PDO
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    // Configurar el modo de errores de PDO para que lance excepciones
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Conexión fallida: " . $e->getMessage();
    exit();
}
?>