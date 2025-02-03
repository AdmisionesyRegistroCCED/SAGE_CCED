<div class="lftmenu" id="lftmenu">
    <div class="lftmenusection">
        <div class="mainobjectmenu">
            <ul class="full">
                <li>
                    <a href="dashboard.php" class="objectsformom">
                        <div class="icon">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="25" height="25">
                                <path fill="white"
                                    d="M575.8 255.5c0 18-15 32.1-32 32.1l-32 0 .7 160.2c0 2.7-.2 5.4-.5 8.1l0 16.2c0 22.1-17.9 40-40 40l-16 0c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1L416 512l-24 0c-22.1 0-40-17.9-40-40l0-24 0-64c0-17.7-14.3-32-32-32l-64 0c-17.7 0-32 14.3-32 32l0 64 0 24c0 22.1-17.9 40-40 40l-24 0-31.9 0c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2l-16 0c-22.1 0-40-17.9-40-40l0-112c0-.9 0-1.9 .1-2.8l0-69.7-32 0c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z" />
                            </svg>
                        </div>
                        <div class="txt">Dashboard</div>
                    </a>
                </li>
                <?php
                    if(substr($binperms, 1, 1) == 1 || substr($binperms, 1, 1) == 2){
                        
                ?>
                <li class="column">
                    <div class="mainobjectmenu">
                        <a href="#" class="objectsformom menu-toggle" data-toggle="submenu">
                            <div class="menu_toggle">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25" height="25" class="arrow-icon">
                                    <path fill="white"
                                        d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" />
                                </svg>
                            </div>
                            <div class="txt">Roles</div>
                        </a>
                    </div>
                    <div class="submenu">
                        <ul>
                            <?php 
                                if(substr($binperms, 1, 1) == 2){
                            ?>
                            <li>
                                <a href="../src/views/calendar.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="25" height="25">
                                            <path fill="white"
                                                d="M96 128a128 128 0 1 0 256 0A128 128 0 1 0 96 128zm94.5 200.2l18.6 31L175.8 483.1l-36-146.9c-2-8.1-9.8-13.4-17.9-11.3C51.9 342.4 0 405.8 0 481.3c0 17 13.8 30.7 30.7 30.7l131.7 0c0 0 0 0 .1 0l5.5 0 112 0 5.5 0c0 0 0 0 .1 0l131.7 0c17 0 30.7-13.8 30.7-30.7c0-75.5-51.9-138.9-121.9-156.4c-8.1-2-15.9 3.3-17.9 11.3l-36 146.9L238.9 359.2l18.6-31c6.4-10.7-1.3-24.2-13.7-24.2L224 304l-19.7 0c-12.4 0-20.1 13.6-13.7 24.2z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Registrar roles</div>
                                </a>
                            </li>
                            <?php 
                                }
                            ?>
                            <li>
                                <a href="consult_students.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="22"
                                            height="22">
                                            <path fill="white"
                                                d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Consultar roles</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <?php 
                    }
                    if(substr($binperms, 2, 1) == 1 || substr($binperms, 2, 1) == 2){
                        
                ?>
                <li class="column">
                    <div class="mainobjectmenu">
                        <a href="#" class="objectsformom menu-toggle" data-toggle="submenu">
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25" height="25" class="arrow-icon">
                                    <path fill="white"
                                        d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" />
                                </svg>
                            </div>
                            <div class="txt">Usuarios</div>
                        </a>
                    </div>
                    <div class="submenu">
                        <ul>
                            <?php
                                if(substr($binperms, 2, 1) == 2){                            
                            ?>
                            <li>
                                <a href="user_register.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="25"
                                            height="25">
                                            <path fill="white"
                                                d="M96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM0 482.3C0 383.8 79.8 304 178.3 304l91.4 0C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7L29.7 512C13.3 512 0 498.7 0 482.3zM504 312l0-64-64 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l64 0 0-64c0-13.3 10.7-24 24-24s24 10.7 24 24l0 64 64 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-64 0 0 64c0 13.3-10.7 24-24 24s-24-10.7-24-24z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Registrar usuario</div>
                                </a>
                            </li>
                            <?php
                            }
                            ?>
                            <li>
                                <a href="consult_students.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="22"
                                            height="22">
                                            <path fill="white"
                                                d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Consultar usuarios</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <?php 
                    }
                    if(substr($binperms, 9, 1) == 1 || substr($binperms, 9, 1) == 2){
                        
                ?>
                <li class="column">
                    <div class="mainobjectmenu">
                        <a href="#" class="objectsformom menu-toggle" data-toggle="submenu">
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25" height="25" class="arrow-icon">
                                    <path fill="white"
                                        d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" />
                                </svg>
                            </div>
                            <div class="txt">Estudiantes</div>
                        </a>
                    </div>
                    <div class="submenu">
                        <ul>
                            <?php 
                                if(substr($binperms, 9, 1) == 2){
                            ?>
                            <li>
                                <a href="../src/modules/students/student_register.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="25"
                                            height="25">
                                            <path fill="white"
                                                d="M96 128a128 128 0 1 1 256 0A128 128 0 1 1 96 128zM0 482.3C0 383.8 79.8 304 178.3 304l91.4 0C368.2 304 448 383.8 448 482.3c0 16.4-13.3 29.7-29.7 29.7L29.7 512C13.3 512 0 498.7 0 482.3zM504 312l0-64-64 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l64 0 0-64c0-13.3 10.7-24 24-24s24 10.7 24 24l0 64 64 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-64 0 0 64c0 13.3-10.7 24-24 24s-24-10.7-24-24z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Registrar estudiante</div>
                                </a>
                            </li>
                            <?php
                            }
                            ?>
                            <li>
                                <a href="consult_students.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="22"
                                            height="22">
                                            <path fill="white"
                                                d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Consultar estudiantes</div>
                                </a>
                            </li>
                            <?php 
                                if(substr($binperms, 9, 1) == 2){
                            ?>
                            <!-- <li>
                                <a href="consult_students.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" width="25" height="25">
                                            <path fill="white"
                                            d="M96 0C43 0 0 43 0 96L0 416c0 53 43 96 96 96l448 0c53 0 96-43 96-96l0-320c0-53-43-96-96-96L96 0zM64 96c0-17.7 14.3-32 32-32l448 0c17.7 0 32 14.3 32 32l0 320c0 17.7-14.3 32-32 32L96 448c-17.7 0-32-14.3-32-32L64 96zm159.8 80a48 48 0 1 0 -96 0 48 48 0 1 0 96 0zM96 309.3c0 14.7 11.9 26.7 26.7 26.7l56.1 0c8-34.1 32.8-61.7 65.2-73.6c-7.5-4.1-16.2-6.4-25.3-6.4l-69.3 0C119.9 256 96 279.9 96 309.3zM461.2 336l56.1 0c14.7 0 26.7-11.9 26.7-26.7c0-29.5-23.9-53.3-53.3-53.3l-69.3 0c-9.2 0-17.8 2.3-25.3 6.4c32.4 11.9 57.2 39.5 65.2 73.6zM372 289c-3.9-.7-7.9-1-12-1l-80 0c-4.1 0-8.1 .3-12 1c-26 4.4-47.3 22.7-55.9 47c-2.7 7.5-4.1 15.6-4.1 24c0 13.3 10.7 24 24 24l176 0c13.3 0 24-10.7 24-24c0-8.4-1.4-16.5-4.1-24c-8.6-24.3-29.9-42.6-55.9-47zM512 176a48 48 0 1 0 -96 0 48 48 0 1 0 96 0zM320 256a64 64 0 1 0 0-128 64 64 0 1 0 0 128z"/>
                                        </svg>
                                    </div>
                                    <div class="txt">Registrar grupo de estudiantes</div>
                                </a>
                            </li> -->
                            <?php
                            }
                            ?>
                        </ul>
                    </div>
                </li>
                <?php 
                    }
                    if(substr($binperms, 7, 1) == 1 || substr($binperms, 7, 1) == 2){
                        
                ?>
                <li class="column">
                    <div class="mainobjectmenu">
                        <a href="#" class="objectsformom menu-toggle" data-toggle="submenu">
                            <div class="menu_toggle">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25" height="25" class="arrow-icon">
                                    <path fill="white"
                                        d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" />
                                </svg>
                            </div>
                            <div class="txt">Docentes</div>
                        </a>
                    </div>
                    <div class="submenu">
                        <ul>
                            <?php 
                                if(substr($binperms, 7, 1) == 2){
                            ?>
                            <li>
                                <a href="../src/views/calendar.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="25" height="25">
                                            <path fill="white"
                                                d="M96 128a128 128 0 1 0 256 0A128 128 0 1 0 96 128zm94.5 200.2l18.6 31L175.8 483.1l-36-146.9c-2-8.1-9.8-13.4-17.9-11.3C51.9 342.4 0 405.8 0 481.3c0 17 13.8 30.7 30.7 30.7l131.7 0c0 0 0 0 .1 0l5.5 0 112 0 5.5 0c0 0 0 0 .1 0l131.7 0c17 0 30.7-13.8 30.7-30.7c0-75.5-51.9-138.9-121.9-156.4c-8.1-2-15.9 3.3-17.9 11.3l-36 146.9L238.9 359.2l18.6-31c6.4-10.7-1.3-24.2-13.7-24.2L224 304l-19.7 0c-12.4 0-20.1 13.6-13.7 24.2z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Registrar docente</div>
                                </a>
                            </li>
                            <?php
                            }
                            ?>
                            <li>
                                <a href="consult_students.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="22"
                                            height="22">
                                            <path fill="white"
                                                d="M416 208c0 45.9-14.9 88.3-40 122.7L502.6 457.4c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L330.7 376c-34.4 25.2-76.8 40-122.7 40C93.1 416 0 322.9 0 208S93.1 0 208 0S416 93.1 416 208zM208 352a144 144 0 1 0 0-288 144 144 0 1 0 0 288z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Consultar docente</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <?php 
                    }
                    if(substr($binperms, 5, 1) == 1 || substr($binperms, 5, 1) == 2){
                        
                ?>
                <li class="column">
                    <div class="mainobjectmenu">
                        <a href="#" class="objectsformom menu-toggle" data-toggle="submenu">
                            <div class="menu_toggle">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25" height="25" class="arrow-icon">
                                    <path fill="white"
                                        d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" />
                                </svg>
                            </div>
                            <div class="txt">Aulas</div>
                        </a>
                    </div>
                    <div class="submenu">
                        <ul>
                            <?php 
                                if(substr($binperms, 5, 1) == 2){
                            ?>
                            <li>
                                <a href="../src/views/calendar.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="25" height="25">
                                            <path fill="white"
                                                d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Registrar aulas</div>
                                </a>
                            </li>
                            <?php
                            }
                            ?>
                            <li>
                                <a href="../src/views/calendar.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="25" height="25">
                                            <path fill="white"
                                                d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Ver aulas</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <?php 
                    }
                    if(substr($binperms, 6, 1) == 1 || substr($binperms, 6, 1) == 2){
                        
                ?>
                <li class="column">
                    <div class="mainobjectmenu">
                        <a href="#" class="objectsformom menu-toggle" data-toggle="submenu">
                            <div class="menu_toggle">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25" height="25" class="arrow-icon">
                                    <path fill="white"
                                        d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" />
                                </svg>
                            </div>
                            <div class="txt">Franjas</div>
                        </a>
                    </div>
                    <div class="submenu">
                        <ul>
                            <?php
                            if(substr($binperms, 6, 1) == 2){
                            ?>
                            <li>
                                <a href="../src/views/calendar.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="25" height="25">
                                            <path fill="white"
                                                d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Registrar franjas</div>
                                </a>
                            </li>
                            <?php
                            }
                            ?>
                            <li>
                                <a href="../src/views/calendar.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="25" height="25">
                                            <path fill="white"
                                                d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Editar franjas</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <?php 
                    }
                    if(substr($binperms, 3, 1) == 1 || substr($binperms, 3, 1) == 2){
                        
                ?>
                <li class="column">
                    <div class="mainobjectmenu">
                        <a href="#" class="objectsformom menu-toggle" data-toggle="submenu">
                            <div class="menu_toggle">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25" height="25" class="arrow-icon">
                                    <path fill="white"
                                        d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" />
                                </svg>
                            </div>
                            <div class="txt">Programas y Contenidos</div>
                        </a>
                    </div>
                    <div class="submenu">
                        <ul>
                            <li>
                                <a href="../src/views/calendar.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="25" height="25">
                                            <path fill="white"
                                                d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Consultar Programas y Modulos</div>
                                </a>
                            </li>
                            <li>
                                <a href="../src/views/calendar.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="25" height="25">
                                            <path fill="white"
                                                d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Consultar tipos de estudio</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <?php 
                    }
                    if(substr($binperms, 8, 1) == 1 || substr($binperms, 8, 1) == 2){
                        
                ?>
                <li class="column">
                    <div class="mainobjectmenu">
                        <a href="#" class="objectsformom menu-toggle" data-toggle="submenu">
                            <div class="menu_toggle">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="25" height="25" class="arrow-icon">
                                    <path fill="white"
                                        d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z" />
                                </svg>
                            </div>
                            <div class="txt">Calendario</div>
                        </a>
                    </div>
                    <div class="submenu">
                        <ul>
                            <li>
                                <a href="../src/views/calendar.php" class="objectsformom">
                                    <div class="icon">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" width="25"
                                            height="25">
                                            <path fill="white"
                                                d="M128 0c17.7 0 32 14.3 32 32l0 32 128 0 0-32c0-17.7 14.3-32 32-32s32 14.3 32 32l0 32 48 0c26.5 0 48 21.5 48 48l0 48L0 160l0-48C0 85.5 21.5 64 48 64l48 0 0-32c0-17.7 14.3-32 32-32zM0 192l448 0 0 272c0 26.5-21.5 48-48 48L48 512c-26.5 0-48-21.5-48-48L0 192zm64 80l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm128 0l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0zM64 400l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16zm144-16c-8.8 0-16 7.2-16 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0zm112 16l0 32c0 8.8 7.2 16 16 16l32 0c8.8 0 16-7.2 16-16l0-32c0-8.8-7.2-16-16-16l-32 0c-8.8 0-16 7.2-16 16z" />
                                        </svg>
                                    </div>
                                    <div class="txt">Consultar calendario</div>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <?php
                }
                ?>
            </ul>
        </div>
        <div class="mainobjectmenu">
            <div class="bottomoption">
                <ul>
                    <li>
                        <a href="../src/controllers/closesession.php" class="objectsformom">
                            <div class="icon">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" width="24" height="24">
                                    <path fill="white"
                                        d="M288 32c0-17.7-14.3-32-32-32s-32 14.3-32 32l0 224c0 17.7 14.3 32 32 32s32-14.3 32-32l0-224zM143.5 120.6c13.6-11.3 15.4-31.5 4.1-45.1s-31.5-15.4-45.1-4.1C49.7 115.4 16 181.8 16 256c0 132.5 107.5 240 240 240s240-107.5 240-240c0-74.2-33.8-140.6-86.6-184.6c-13.6-11.3-33.8-9.4-45.1 4.1s-9.4 33.8 4.1 45.1c38.9 32.3 63.5 81 63.5 135.4c0 97.2-78.8 176-176 176s-176-78.8-176-176c0-54.4 24.7-103.1 63.5-135.4z" />
                                </svg>
                            </div>
                            <div class="txt">Cerrar sesión</div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const toggleButtons = document.querySelectorAll('.menu-toggle');

        toggleButtons.forEach(button => {
            button.addEventListener("click", function(event) {
                event.preventDefault();

                // Cerrar otros submenús y resetear flechas
                toggleButtons.forEach(btn => {
                    if (btn !== this) {
                        const otherSubmenu = btn.parentElement.nextElementSibling;
                        if (otherSubmenu && otherSubmenu.classList.contains('show')) {
                            otherSubmenu.style.height = 0; // Cierra el submenú
                            otherSubmenu.classList.remove('show');
                        }
                        btn.classList.remove('active');
                    }
                });

                // Mostrar/ocultar el submenú actual con transición
                const submenu = this.parentElement.nextElementSibling;
                if (submenu) {
                    if (submenu.classList.contains('show')) {
                        submenu.style.height = 0;
                    } else {
                        submenu.style.height = submenu.scrollHeight + 'px';
                    }
                    submenu.classList.toggle('show');
                }
                this.classList.toggle('active');
            });
        });
    });
</script>