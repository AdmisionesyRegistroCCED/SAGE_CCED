<?php
require_once($_SERVER['DOCUMENT_ROOT'] . '/src/controllers/session/session_start.php');
if (substr($binperms, 9, 1) == 1 || substr($binperms, 9, 1) == 2) {
?>
    <html>

    <head>
        
        <title>SAGE - Consulta de usuarios</title>
        <link rel="icon" type="image/x-icon" href="/public/assets/imgs/favicon-CCED.png">
        <link rel="stylesheet" href="/public/assets/css/main.css">
        <!-- Datables links -->
        <link href="https://cdn.datatables.net/v/dt/dt-2.1.8/r-3.0.3/datatables.min.css" rel="stylesheet">
        <!-- Primero jquery -->
        <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
        <!-- Segundo datatable -->
        <script src="https://cdn.datatables.net/v/dt/dt-2.1.8/datatables.min.js"></script>
        <!-- Tercero script main.js -->
        <script src="../assets/js/main.js"></script>
        <script src="/src/controllers/users/mainusers.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>

    <body>
    <header>
        <?php require_once($_SERVER['DOCUMENT_ROOT'] . '/src/models/header.php'); ?>
    </header>
    <main>
        <?php  require_once($_SERVER['DOCUMENT_ROOT'] . '/src/models/leftmenu.php'); ?>
            <div class="structure">
                <div id="tabla" class="main on">
                    <h1 class="mindata_username">Consulta de usuarios</h1>
                    <!-- <p class="infoinmain_topp">Esta es tu página de inicio</p> -->
                    <hr><br>
                    <table id="myTable" class="">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Correo</th>
                                <th>Rol</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="">
                            <!-- información render desde ajax -->
                        </tbody>
                    </table>
                </div>
                <footer>
                    <?php require_once "../src/models/footer.php" ?>
                </footer>
            </div>
        </main>


    </body>

    </html>
<?php
} else {
    header("location: /public/dashboard.php");
}
?>