<?php 
require_once($_SERVER['DOCUMENT_ROOT'] . '/src/controllers/session/session_start.php');
?>
<html>

<head>
    <title>SAGE - Dashboard</title>
    <link rel="icon" type="image/x-icon" href="assets/imgs/favicon-CCED.png">
    <link rel="stylesheet" href="assets/css/main.css">
</head>

<body>
    <header>
        <?php require_once($_SERVER['DOCUMENT_ROOT'] . '/src/models/header.php'); ?>
    </header>
    <main>
        <?php
                require_once($_SERVER['DOCUMENT_ROOT'] . '/src/models/leftmenu.php');;
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
                
                //SQL para datos del dashboard

                $activos = 0;
                $inactivos = 0;
                $egresados = 0;
                $interesados = 0;
                $no_interesados = 0;
                
                $sql = "
                    SELECT 
                        SUM(CASE WHEN estudiantes_estado = 'Activo' THEN 1 ELSE 0 END) AS activos,
                        SUM(CASE WHEN estudiantes_estado = 'Inactivo' THEN 1 ELSE 0 END) AS inactivos,
                        SUM(CASE WHEN estudiantes_estado = 'Egresado' THEN 1 ELSE 0 END) AS egresados,
                        SUM(CASE WHEN estudiantes_estado = 'Interesado' THEN 1 ELSE 0 END) AS interesados,
                        SUM(CASE WHEN estudiantes_estado = 'No Interesado' THEN 1 ELSE 0 END) AS no_interesados
                    FROM estudiantes
                ";
                $result = mysqli_query($conn, $sql);
                
                if ($result) {
                    $row = mysqli_fetch_assoc($result);
                
                    $activos = $row['activos'] ?? 0;
                    $inactivos = $row['inactivos'] ?? 0;
                    $egresados = $row['egresados'] ?? 0;
                    $interesados = $row['interesados'] ?? 0;
                    $no_interesados = $row['no_interesados'] ?? 0;
                } else {
                    echo "Error en la consulta: " . mysqli_error($conn);
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
                    <!-- div class="dashboard">
                        <canvas id="chartBar"></canvas>
                        <canvas id="chartLine"></canvas>
                        <canvas id="chartPie"></canvas>
                    </div> -->
                </div> 
                <!-- <div id="footer" class="footer">
                <?php // require_once "../src/models/footer.php" ?>
                </div> -->
            </div>
            
        </div>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="assets/js/toggleMenu.js"></script>
    <script src="assets/js/main.js"></script>

</body>
<script>
document.addEventListener("DOMContentLoaded", () => {
    const contadores = [
        { id: "contador1", final: <?php echo $activos?> },
        { id: "contador2", final: <?php echo $inactivos?> },
        { id: "contador3", final: <?php echo $egresados?> },
        { id: "contador4", final: <?php echo $interesados?> },
        { id: "contador5", final: <?php echo $no_interesados?> },
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
                data: [150, 30, 450, 1200],
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
</html>