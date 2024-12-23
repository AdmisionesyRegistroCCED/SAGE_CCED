<?php
session_start();
if (!isset($_SESSION['userdata?'])) {
    header("Location: ../views/login.php");
    exit();
}

require_once "../../config/db.php";
$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$dni_type = $conn->real_escape_string($_POST['dni_type']);
$dni = $conn->real_escape_string($_POST['dni']);
$fname = $conn->real_escape_string($_POST['fname']);
$lname = $conn->real_escape_string($_POST['lname']);
$dob = $conn->real_escape_string($_POST['dob']);
$gender = $conn->real_escape_string($_POST['gender']);
$phone = $conn->real_escape_string($_POST['phone']);
$email = $conn->real_escape_string($_POST['email']);
$status = $conn->real_escape_string($_POST['status']);

$sql = "UPDATE estudiantes SET dni_type='$dni_type', first_name='$fname', last_name='$lname', dob='$dob', gender='$gender', phone='$phone', email='$email', status='$status' WHERE dni='$dni'";
if ($conn->query($sql) === TRUE) {
    echo $sql;
} else {
    echo "Error al actualizar: " . $conn->error;
}

$conn->close();
?>
