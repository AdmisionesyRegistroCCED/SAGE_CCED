<?php
$host = '15.235.86.58';
$user = 'ccedcomc_testdev'; 
$pass = '@Pines2025_'; 
$db = 'ccedcomc_sagecced';

$conn = new mysqli($host, $user, $pass, $db);
$conn->set_charset("utf8mb4");
try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Conexión fallida: " . $e->getMessage();
    exit();
}
?>