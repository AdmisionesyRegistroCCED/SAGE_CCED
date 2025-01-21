<?php 
    require "../src/controllers/session_start.php";
    if(substr($binperms, 2, 1) == 2){
?>
<html>
<head>
    <title>SAGE - Registro de usuarios</title>
    <link rel="icon" type="image/x-icon" href="assets/imgs/favicon-CCED.png">
    <link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
    <header>
        <?php require_once "../src/models/header.php" ?>
    </header>
    <main>
    <?php 
        require_once "../src/models/leftmenu.php";
    ?>
            <div class="structure">
                <div id="main" class="main on">
                <?php if (isset($_SESSION['message'])): ?>
                    <div class="notification <?php echo $_SESSION['msg_type']; ?>" id="notification">
                        <?php
                            echo $_SESSION['message'];
                            unset($_SESSION['message']); // Limpiar el mensaje después de mostrarlo
                            unset($_SESSION['msg_type']); // Limpiar el tipo de mensaje después de mostrarlo
                        ?>
                    </div>
                <?php endif; ?>
                <div class="headerdataform">
                    <h1 class="mindata_username">Registro de usuarios</h1>
                </div>
                <!-- <p class="infoinmain_topp">Esta es tu página de inicio</p> -->
                <hr><br>
                <form action="../src/controllers/sql_register_user.php" method="post" id="formRegistrarEstudiante">
                <div class="container_register">
                    <div>
                        <label for="fname">Nombre de usuario</label>
                        <input type="text" id="fname" name="username" required>
                    </div>
                    <div>
                        <label for="email">Correo electronico</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div>
                        <label for="dni">Contraseña</label>
                        <input type="text" id="dni" name="pass" required>
                    </div>
                    <div>
                        <label for="dni_type">Tipo de usuario</label>
                        <select name="user_type" id="dni_type" required>
                            <option value="none">Seleccione una opción</option>
                            <?php
                                if($codeRole == 1){
                                    echo '<option value="2">Administrador ⚠️</option>';
                                }
                            ?>
                            <option value="3">Academico</option>
                            <option value="4">Comercial</option>
                            <option value="5">Docente</option>
                            <option value="6">Estudiante</option>
                        </select>
                    </div>
                    <div class="full-width">
                        <button type="submit" class="submit-btn">Registrar</button>
                    </div>
                </div>
            </form>
                <script>
                    // Mostrar la notificación si existe
                    window.onload = function() {
                        var notification = document.getElementById("notification");
                        if (notification) {
                            notification.style.display = "block"; // Mostrar la notificación
                            setTimeout(function() {
                                notification.style.display = "none"; // Ocultar después de 5 segundos
                            }, 5000);
                        }
                    };
                </script>
            </div>
            <footer class=".footer">
                <?php require_once "../src/models/footer.php" ?>
            </footer>
        </div>
    </main>
    <script src="assets/js/main.js"></script>
</body>
</html>
<?php
}else{
    header("location: dashboard.php");
}
?>