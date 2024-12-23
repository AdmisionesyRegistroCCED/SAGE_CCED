<div class="burgermenu">
    <a href="javascript:void(0);" id="menuToggle">
        <svg id="closeIcon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="30" height="50">
            <path fill="white"
                d="M0 96C0 78.3 14.3 64 32 64l384 0c17.7 0 32 14.3 32 32s-14.3 32-32 32L32 128C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32l384 0c17.7 0 32 14.3 32 32s-14.3 32-32 32L32 288c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32L32 448c-17.7 0-32-14.3-32-32s14.3-32 32-32l384 0c17.7 0 32 14.3 32 32z" />
        </svg>
        <svg id="burgerIcon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" width="30" height="50">
            <path fill="white"
            d="M376.6 84.5c11.3-13.6 9.5-33.8-4.1-45.1s-33.8-9.5-45.1 4.1L192 206 56.6 43.5C45.3 29.9 25.1 28.1 11.5 39.4S-3.9 70.9 7.4 84.5L150.3 256 7.4 427.5c-11.3 13.6-9.5 33.8 4.1 45.1s33.8 9.5 45.1-4.1L192 306 327.4 468.5c11.3 13.6 31.5 15.4 45.1 4.1s15.4-31.5 4.1-45.1L233.7 256 376.6 84.5z"/>
        </svg>
    </a>
</div>
<div class="topsearchbar">
    <!-- <form action="">
                <input type="text" placeholder="Busqueda...">
            </form> -->
</div>
<div class="useractive">
    <div class="imguser">
        <img src="assets/imgs/useractive.png" alt="" srcset="">
    </div>
    <div class="dropdwn">
        <a href="javascript:void(0);" id="dropdownToggle">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512" width="20" height="20">
                <path fill="white"
                    d="M137.4 374.6c12.5 12.5 32.8 12.5 45.3 0l128-128c9.2-9.2 11.9-22.9 6.9-34.9s-16.6-19.8-29.6-19.8L32 192c-12.9 0-24.6 7.8-29.6 19.8s-2.2 25.7 6.9 34.9l128 128z" />
            </svg>
        </a>
        <ul id="dropdownMenu" class="dropdown-content">
            <li><a href="#">Ver mi cuenta</a></li>
            <?php
                if($userRole == "administrador"){
                    echo  '<li><a href="#">Administrar cuentas</a></li>';
                }
            ?>
            <li><a href="#">Cerrar sesión</a></li>
        </ul>
    </div>
</div>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const menuToggle = document.getElementById("menuToggle");
    const burgerIcon = document.getElementById("burgerIcon");
    const closeIcon = document.getElementById("closeIcon");

    // Ocultar el ícono de cierre al cargar la página
    closeIcon.style.display = "none";

    menuToggle.addEventListener("click", function() {
        // Verificar si el ícono de hamburguesa es visible
        if (burgerIcon.style.display !== "none") {
            // Ocultar el ícono de hamburguesa y mostrar la X
            burgerIcon.style.display = "none";
            closeIcon.style.display = "block";
        } else {
            // Mostrar el ícono de hamburguesa y ocultar la X
            burgerIcon.style.display = "block";
            closeIcon.style.display = "none";
        }
        
        // Aquí puedes agregar la lógica de apertura/cierre del menú
    });
});
</script>