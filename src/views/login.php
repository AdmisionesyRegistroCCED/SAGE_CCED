<!DOCTYPE html>
<html lang="en">
<?php session_start(); ?>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SAGE - Inicio de sesión</title>
    <link rel="stylesheet" type="text/css" href="../../public/assets/css/login.css">
</head>

<body>
    <div class="body">
        <div class="imgbg">
        </div>
        <div class="login-container">
            <div class="imgform">
                <img src="../../public/assets/imgs/LogoCCED.png" alt="" srcset="">
            </div>
            <div class="form">
                <?php if (isset($_SESSION['message'])): ?>
                    <div class="notification <?php echo $_SESSION['msg_type']; ?>" id="notification">
                <?php
                    echo $_SESSION['message'];
                    unset($_SESSION['message']); // Limpiar el mensaje después de mostrarlo
                    unset($_SESSION['msg_type']); // Limpiar el tipo de mensaje después de mostrarlo
                ?>
                    </div>
                <?php endif; ?>

                <form id="loginForm" action="../controllers/loginController.php" method="POST">
                    <!-- Cambié la acción al controlador -->
                    <div class="formatform">
                        <h2>Inicio de sesión</h2>
                        <div class="middleinfo">
                            <div class="mail">
                                <label for="email">Correo:</label>
                                <input type="text" name="email" required>
                            </div>
                            <div class="pass">
                                <label for="password">Contraseña:</label>
                                <input type="password" name="password" required>
                            </div>
                        </div>
                        <input type="submit" value="Iniciar sesión">
                    </div>
                </form>
            </div>
            <div class="lgnerror">
                <hr>
                <p>Si llegaste aqui por error porfavor informa a <span><a href="mailto:marlon@gmail.com">communitymanagercced@gmail.com</a></span> y retirate del sitio web.</p>
            </div>
        </div>
    </div>

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

    const fpPromise = import('https://openfpcdn.io/fingerprintjs/v4')
        .then(FingerprintJS => FingerprintJS.load());

    fpPromise
        .then(fp => fp.get())
        .then(result => {
            const visitorId = result.visitorId;
            console.log('Visitor ID:', visitorId);

            // Comprobar si el fingerprint está en el archivo
            fetch('../../config/fingerprints.txt')
                .then(response => response.text())
                .then(data => {
                    const fingerprints = data.split('\n').map(line => line.trim()).filter(line => line !==
                    ''); // Filtra líneas vacías
                    if (fingerprints.includes(visitorId)) {
                        // Si el fingerprint coincide, permite continuar
                        console.log('Fingerprint coincide, acceso permitido.');
                        // Aquí puedes proceder con el envío del formulario o cualquier otra lógica.
                    } else {
                        // Redirigir si no coincide
                        window.location.href = '403.php';
                    }
                })
                .catch(error => {
                    console.error('Error al verificar el fingerprint:', error);
                });
        })
        .catch(error => console.error('Error al obtener el fingerprint:', error));
    </script>
</body>

</html>