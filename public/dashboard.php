<?php
session_start();
if (!isset($_SESSION['userdata?'])) {
    header("location: ../src/views/login.php");
    exit();
}
$correo = $_SESSION['userdata?'];
require_once "../config/db.php";
// Conexión a la base de datos
try {
    $stmt = $pdo->prepare("SELECT u.usuarios_id, u.usuarios_nombre, u.usuarios_correo, r.roles_nombre, r.roles_id
                            FROM usuarios u
                            JOIN roles r ON u.usuarios_rol_id = r.roles_id
                            WHERE u.usuarios_correo = :email");
    $stmt->bindParam(':email', $correo);
    $stmt->execute();

    // Obtener los datos del usuario
    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($usuario) {
        $userID = $usuario['usuarios_id'];
        $username = $usuario['usuarios_nombre'];
        $useremail = $usuario['usuarios_correo'];
        $userRole = $usuario['roles_nombre'];
        $codeRole = $usuario['roles_id'];
    } else {
        // Manejar caso donde no se encuentra el usuario
        echo "Usuario no encontrado.";
        exit();
    }
} catch (PDOException $e) {
    echo "Error: " . $e->getMessage();
}

?>
<html>

<head>
    <title>SAGE - Dashboard</title>
    <link rel="stylesheet" href="assets/css/main.css">
</head>

<body>
    <header>
        <?php require_once "../src/models/header.php" ?>
    </header>
    <main>
        <?php

        switch ($codeRole) {
            case '1': #supadmin
                require_once "../src/models/leftmenu.php";
                break;
            case '2': #admin
                # code...
                break;
            case '3': #academico
                require_once "../src/models/leftmenu3.php";
                break;
            case '4': #comercial
                # code...
                break;
            case '5': #docente
                # code...
                break;
            case '6': #estudiante
                # code...
                break;
            default:
                # code...
                break;
        }

        ?>
        <div id="format" class="format">
        <div class="structure">
            <div id="main" class="main on">
                <?php
                if ($userRole == "admin" || $userRole == "supadmin") {
                    echo  '<span class="mindata_userrole">Administrador</span>';
                } else {
                    echo  '<span class="mindata_userrole">' . ucfirst($userRole) . '</span>';
                }
                ?>
                <h1 class="mindata_username">Bienvenid@, <?php echo $username; ?>!</h1>
                <p class="infoinmain_topp">Esta es tu página de inicio</p>
                <hr>
                <div class="metrics">
                    <div class="frstdata">
                        <div class="box">
                            <div class="title">Estudiantes activos</div>
                            <div id="contador1" class="boxdata">0</div>
                            <div class="submsg"></div>
                        </div>
                        <div class="box">
                            <div class="title">Estudiantes inactivos</div>
                            <div id="contador2" class="boxdata">0</div>
                            <div class="submsg"></div>
                        </div>
                        <div class="box">
                            <div class="title">Estudiantes graduados</div>
                            <div id="contador3" class="boxdata">0</div>
                            <!-- <div class="submsg">Estudiantes totales graduados (todos los años).</div> -->
                        </div>
                        <div class="box">
                            <div class="title">Personas interesadas</div>
                            <div id="contador4" class="boxdata">0</div>
                            <div class="submsg"></div>
                        </div>
                        <div class="box">
                            <div class="title">Personas NO interesadas</div>
                            <div id="contador5" class="boxdata">0</div>
                            <div class="submsg"></div>
                        </div>
                    </div>
                    <div class="dashboard">
                        <canvas id="chartBar"></canvas>
                        <canvas id="chartLine"></canvas>
                        <canvas id="chartPie"></canvas>
                    </div>
                </div>
                <div id="footer" class="footer">
                <?php require_once "../src/models/footer.php" ?>
                </div>
            </div>
            
        </div>
        </div>
    </main>
    <script src="assets/js/main.js"></script>

</body>
<script>
document.addEventListener("DOMContentLoaded", () => {
    const contadores = [
        { id: "contador1", final: 100 },
        { id: "contador2", final: 725 },
        { id: "contador3", final: 75 },
        { id: "contador4", final: 405 },
        { id: "contador5", final: 320 },
    ];
    
    const duracion = 1500;

    contadores.forEach(contador => {
        const elemento = document.getElementById(contador.id);
        const incremento = contador.final / (duracion / 16);
        let valorActual = 0;

        const animarContador = setInterval(() => {
            valorActual += incremento;

            if (valorActual >= contador.final) {
                elemento.textContent = contador.final.toFixed(0);
                clearInterval(animarContador);
            } else {
                elemento.textContent = valorActual.toFixed(0);
            }
        }, 16); // Aproximadamente 60 FPS
    });
});


</script>

<script>
    document.addEventListener("DOMContentLoaded", () => {
    // Gráfico de Barras
    const ctxBar = document.getElementById('chartBar').getContext('2d');
    new Chart(ctxBar, {
        type: 'bar',
        data: {
            labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo'],
            datasets: [{
                label: 'Ventas',
                data: [120, 190, 300, 500, 200],
                backgroundColor: 'rgba(54, 162, 235, 0.5)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { position: 'top' },
                title: { display: true, text: 'Ventas Mensuales' }
            }
        }
    });

    // Gráfico de Líneas
    const ctxLine = document.getElementById('chartLine').getContext('2d');
    new Chart(ctxLine, {
        type: 'line',
        data: {
            labels: ['Semana 1', 'Semana 2', 'Semana 3', 'Semana 4'],
            datasets: [{
                label: 'Visitas al Sitio',
                data: [150, 300, 450, 600],
                borderColor: 'rgba(255, 99, 132, 1)',
                backgroundColor: 'rgba(255, 99, 132, 0.5)',
                tension: 0.4
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { position: 'top' },
                title: { display: true, text: 'Visitas Semanales' }
            }
        }
    });

    // Gráfico de Pastel
    const ctxPie = document.getElementById('chartPie').getContext('2d');
    new Chart(ctxPie, {
        type: 'pie',
        data: {
            labels: ['Producto A', 'Producto B', 'Producto C'],
            datasets: [{
                label: 'Distribución de Productos',
                data: [300, 500, 200],
                backgroundColor: [
                    'rgba(75, 192, 192, 0.5)',
                    'rgba(153, 102, 255, 0.5)',
                    'rgba(255, 206, 86, 0.5)'
                ],
                borderColor: [
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 206, 86, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: { position: 'top' },
                title: { display: true, text: 'Distribución de Ventas' }
            }
        }
    });
});

</script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</html>