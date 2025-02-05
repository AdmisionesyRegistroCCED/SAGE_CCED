$(document).ready(function () {

    'use strict';

    var tabla = $('#myTable').DataTable({
        "ajax": {
            "url": "/src/controllers/users/fetch_users.php",
            "type": "POST",
            "datatype": 'json',
            "dataSrc": function (data) { 
                console.log(data);
                if (data.lenght == 0) {
                    console.log({data});
                    return data || [];
                    
                }else{
                    return data || [];
                }
            },
            "error": function(xhr, status, error) {
                console.error("Error en la solicitud AJAX:", error);
            },
            "cache": false,
        },
        "columns": [
            {"data": "ID"},
            {"data": "Nombre"},
            {"data": "Correo"},
            {"data": "Rol"},
            {
                "data": null,
                "render": function(data) {
                    return `
                    <div class="text-center"><div class="btn-group" role="group" aria-label="Button group"><button id="btnDetalle" class="btn btn-info btnDetalle" type="button" ><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" width="16" height="16"><path fill="white" d="M288 32c-80.8 0-145.5 36.8-192.6 80.6C48.6 156 17.3 208 2.5 243.7c-3.3 7.9-3.3 16.7 0 24.6C17.3 304 48.6 356 95.4 399.4C142.5 443.2 207.2 480 288 480s145.5-36.8 192.6-80.6c46.8-43.5 78.1-95.4 93-131.1c3.3-7.9 3.3-16.7 0-24.6c-14.9-35.7-46.2-87.7-93-131.1C433.5 68.8 368.8 32 288 32zM144 256a144 144 0 1 1 288 0 144 144 0 1 1 -288 0zm144-64c0 35.3-28.7 64-64 64c-7.1 0-13.9-1.2-20.3-3.3c-5.5-1.8-11.9 1.6-11.7 7.4c.3 6.9 1.3 13.8 3.2 20.7c13.7 51.2 66.4 81.6 117.6 67.9s81.6-66.4 67.9-117.6c-11.1-41.5-47.8-69.4-88.6-71.1c-5.8-.2-9.2 6.1-7.4 11.7c2.1 6.4 3.3 13.2 3.3 20.3z" /></svg></button><button id="btnEditar" class="btn btn-primary editbtn" type="button" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16"><path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/><path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/></svg></button><button id="btnEliminar" data-id="${data.ID}" "class="btn btn-info eliminarbtn" type="button" ><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16"><path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/></svg></button></div></div>
                `;
                }
                
            }
        ],
        "render" : {
                
        },

        "serverSide": false,
        "autoWidth": false,
        "responsive": true,
        "processing": true,
        "deferRender": true,
        "language": {
            "url": "/public/assets/js/es-ES.json"
        }
    });


    var boton,rowData;

    $(document).on('click', '.editbtn', function (e) {
            e.preventDefault();
            e.stopPropagation();
            
            // Obtener los datos de la fila seleccionada
            let boton = $(this).closest('tr');
            let rowData = tabla.row(boton).data();
        
            // Crear el HTML del modal dinámicamente
            var modalHtml = `
                <div id="edit-modal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h2 id="modal-title">Editar Usuario</h2>
                        <form id="edit-form">
                            <div class="inputs">
                                <label for="usuarios_id">ID</label>
                                <input type="text" id="usuarios_id" name="usuarios_id" value="${rowData.ID}" disabled>
                                <input type="hidden" id="usuarios_id_hidden" name="idHidden" value="${rowData.ID}">
                            </div>
                            <div class="inputs">
                                <label for="usuarios_nombre">Nombre</label>
                                <input type="text" id="usuarios_nombre" name="usuarios_nombre" value="${rowData.Nombre}">
                            </div>
                            <div class="inputs">
                                <label for="usuarios_correo">Correo</label>
                                <input type="text" id="usuarios_correo" name="usuarios_correo" value="${rowData.Correo}">
                            </div>
                            <div class="inputs">
                                <label for="usuarios_rol_id">Tipo de documento</label>
                                <select name="usuarios_rol_id" id="usuarios_rol_id" required>
                                    <option value="1" ${rowData.ID == '1' ? 'selected' : ''}>SupAdmin</option>
                                    <option value="2" ${rowData.ID == '2' ? 'selected' : ''}>Admin</option>
                                    <option value="3" ${rowData.ID == '3' ? 'selected' : ''}>Académico</option>
                                    <option value="4" ${rowData.ID == '4' ? 'selected' : ''}>Comercial</option>
                                    <option value="5" ${rowData.ID == '5' ? 'selected' : ''}>Docente</option>
                                    <option value="6" ${rowData.ID == '6' ? 'selected' : ''}>Estudiante</option>
                                </select>
                            </div>
                            <div class="inputs">
                                <button type="submit" class="submit-btn" id="submitModal">Guardar Cambios</button>
                            </div>
                        </form>
                    </div>
                </div>
            `;

        
            // Agregar el modal al DOM
            $('body').append(modalHtml);
        
            // Mostrar el modal
            $('#edit-modal').css('display', 'flex');
        
            // Cerrar el modal cuando se haga clic en la "X"
            $('.close').on('click', function () {
                $('#edit-modal').remove();  // Eliminar el modal del DOM
            });

        
        
        const inputBtn = document.querySelector('#submitModal');
        const textTitle = document.querySelector('#modal-title');
    
        // Si el botón está oculto, lo mostramos, si no, dejamos la configuración normal
        if (inputBtn.style.display === 'none') {
            inputBtn.style.display = 'block';
        } else {
            textTitle.innerHTML = 'Editar usuario';
            inputBtn.style.display = 'flex';
        }
    
        // Llenar los campos del modal con los datos obtenidos de la fila
        // $('#usuarios_id').val(rowData.id);
        // $('#usuarios_nombre').val(rowData.nombre);
        // $('#usuarios_correo').val(rowData.correo);
        // $('#usuarios_rol_id').val(rowData.rol);
        // $('#usuarios_id_hidden').val(rowData.id);
    });
    
    


    // Actualizar datos
    $(document).on('click', '#submitModal', function (e) {
        e.preventDefault();
    
        // Captura de datos
        let estudiantes_tipo_documento = $('#estudiantes_tipo_documento').val();
        let estudiantes_no_documento = $('#estudiantes_no_documento').val();
        let estudiantes_no_documento_hidden = $('#estudiantes_no_documento_hidden').val();
        let estudiantes_nombre = $('#estudiantes_nombre').val();
        let estudiantes_apellidos = $('#estudiantes_apellidos').val();
        let estudiantes_genero = $('#estudiantes_genero').val();
        let estudiantes_estado = $('#estudiantes_estado').val();
        let estudiantes_observaciones = $('#estudiantes_observaciones').val();
    
        let estudiantes_fecha_nacimiento = ($('#estudiantes_fecha_nacimiento').val() != '' ? $('#estudiantes_fecha_nacimiento').val() : "0001-01-01");
        let estudiantes_correo = ($('#estudiantes_correo').val() != '' ? $('#estudiantes_correo').val() : "Sin correo"); 
        let estudiantes_direccion = ($('#estudiantes_direccion').val() != '' ? $('#estudiantes_direccion').val() : "Sin dirección");
        let estudiantes_telefono = ($('#estudiantes_telefono').val() != '' ? $('#estudiantes_telefono').val() : "Sin teléfono");

        console.log({
            estudiantes_tipo_documento,
            estudiantes_no_documento,
            estudiantes_no_documento_hidden,
            estudiantes_nombre,
            estudiantes_apellidos,
            estudiantes_genero,
            estudiantes_estado,
            estudiantes_observaciones,
            estudiantes_fecha_nacimiento,
            estudiantes_correo,
            estudiantes_direccion,
            estudiantes_telefono
        });
    
        // Esta información está repetida, la idea es cambiarla en funciones y no repetir el código.
        let nombre_upperCase = [];
        let arregloNombre = estudiantes_nombre.split(/\s+/);
    
        // campo Nombre
        if(arregloNombre.length === 1){
            arregloNombre[0] = arregloNombre[0].charAt(0).toUpperCase() + arregloNombre[0].slice(1).toLowerCase();
            estudiantes_nombre = arregloNombre[0];
        } else {
            for (let index = 0; index <= arregloNombre.length - 1; index++) {
                const element = arregloNombre[index];
                let elementUpperCase = element.charAt(0).toUpperCase() + element.slice(1).toLowerCase();
                nombre_upperCase.push(elementUpperCase);
            }
            estudiantes_nombre = nombre_upperCase.join(" ");
        }
    
        // Campo apellido
        let apellido_upperCase = [];
        let arregloApellidos = estudiantes_apellidos.split(/\s+/);
        if(arregloApellidos.length === 1){
            arregloApellidos[0] = arregloApellidos[0].charAt(0).toUpperCase() + arregloApellidos[0].slice(1).toLowerCase();
            estudiantes_apellidos = arregloApellidos[0];
        } else {
            for (let index = 0; index <= arregloApellidos.length - 1; index++) {
                const element = arregloApellidos[index];
                let elementUpperCaseApellido = element.charAt(0).toUpperCase() + element.slice(1).toLowerCase();
                apellido_upperCase.push(elementUpperCaseApellido);
            }
            estudiantes_apellidos = apellido_upperCase.join(" ");
        }
    
        // Suponemos que 'boton' está correctamente definido en algún lugar
        let index = tabla.row(boton).index();
    
        // Enviar los datos al servidor usando AJAX
        $.ajax({
            url: '/src/controllers/students/update_students.php',
            type: 'POST',
            data: {
                estudiantes_tipo_documento: estudiantes_tipo_documento,
                estudiantes_no_documento: estudiantes_no_documento,
                estudiantes_no_documento_hidden: estudiantes_no_documento_hidden,
                estudiantes_nombre: estudiantes_nombre,
                estudiantes_apellidos: estudiantes_apellidos,
                estudiantes_fecha_nacimiento: estudiantes_fecha_nacimiento,
                estudiantes_direccion: estudiantes_direccion,
                estudiantes_genero: estudiantes_genero,
                estudiantes_telefono: estudiantes_telefono,
                estudiantes_correo: estudiantes_correo,
                estudiantes_estado: estudiantes_estado,
                estudiantes_observaciones: estudiantes_observaciones
            },
            success: function (response) {
                console.log({"Respuesta": response});
                
                if (response.Error) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: response.error,
                        confirmButtonColor: '#d33'
                    });
                } else {
                    tabla.row(index).draw();
                    tabla.ajax.reload(null, false);
    
                    Swal.fire({
                        icon: 'success',
                        title: 'Éxito',
                        text: 'Registro actualizado correctamente.',
                        confirmButtonColor: '#3085d6'
                    });
                }
    
                $('#edit-modal').css('display', 'none'); // Cierra el modal
            },
            error: function (xhr, status, error) {
                console.log(error);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Error al actualizar los datos. Intenta de nuevo.',
                    confirmButtonColor: '#d33'
                });
    
                $('#edit-modal').css('display', 'none'); // Cierra el modal
            }
        });
    
    });
    



    // Cierra el modal al hacer clic en "x"
    $('.close').click(function () {
        $('#edit-modal').css('display', 'none');
    });


    async function eliminarRegistro(estudiantes_no_documento,estudiantes_estado) {

        try {
            const response = await $.ajax({
                url: '/src/controllers/students/delete_students.php',
                type: 'POST',
                data: {
                    estudiantes_no_documento: estudiantes_no_documento,
                    estudiantes_estado: estudiantes_estado
                },
                dataType: 'json'
            });
        
            if (response) {
                Swal.fire({
                    icon: 'success',
                    title: 'Registro eliminado correctamente.',
                    showConfirmButton: false,
                    timer: 1500
                });
                
                tabla.ajax.reload(); // Recargar la tabla después de la eliminación
                return true;
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Fallo',
                    text: 'Hubo un problema al eliminar el registro.'
                });
                return false;
            }
        } catch (error) {
            Swal.fire({
                icon: 'error',
                title: 'Error de la petición',
                text: 'Hubo un error al realizar la solicitud.'
            });
            console.log("Error en la petición.", error);
            return false;
        }
    }        

    // Inhabilitar estudiante
$('#myTable').on('click', '#btnEliminar', async function (f) {
    f.preventDefault();
    f.stopPropagation();

    let fila = $(this).closest('tr');
    let borrarDato = tabla.row(fila).data();
    let estudiantes_no_documento = borrarDato.nroDocumento;
    let estudiantes_estado = borrarDato.estado;

    // Usar SweetAlert en lugar de confirm
    const { value: confirmar } = await Swal.fire({
        title: '¿Está seguro que desea inhabilitar este registro?',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Sí, inhabilitar',
        cancelButtonText: 'Cancelar',
        reverseButtons: true
    });

    if (confirmar) {
        const exito = await eliminarRegistro(estudiantes_no_documento, estudiantes_estado);

        if (exito) {
            tabla.row(fila).remove().draw();
            Swal.fire({
                icon: 'success',
                title: 'Registro inhabilitado con éxito.',
                timer: 1500,
                showConfirmButton: false
            });
        } else {
            Swal.fire({
                icon: 'error',
                title: 'Error al inhabilitar el registro.',
                text: 'Hubo un problema al intentar inhabilitar el estudiante.'
            });
        }
    } else {
        Swal.fire({
            icon: 'info',
            title: 'Operación cancelada.',
            text: 'No se inhabilitó el registro.'
        });
    }
});



    
$('#myTable').on('click', '#btnDetalle', function (g) {
    let btnDetalle = $(this).closest('tr');
    // Generar el modal dinámicamente
    const modalHtml = `
        <div id="edit-modal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h2 id="modal-title">Detalle del Estudiante</h2>
                <form id="edit-form">
                    <div class="inputs">
                        <label for="estudiantes_tipo_documento">Tipo de documento</label>
                        <select name="estudiantes_tipo_documento" id="estudiantes_tipo_documento" disabled>
                            <option value="ti">Tarjeta de identidad</option>
                            <option value="cc">Cédula de ciudadanía</option>
                            <option value="ce">Cédula de extranjería</option>
                            <option value="co">Código</option>
                        </select>
                    </div>
                    <div class="inputs">
                        <label for="estudiantes_no_documento">Nro documento</label>
                        <input type="text" id="estudiantes_no_documento" name="estudiantes_no_documento" disabled>
                    </div>
                    <div class="inputs">
                        <label for="estudiantes_nombre">Nombre</label>
                        <input type="text" id="estudiantes_nombre" name="estudiantes_nombre" disabled>
                    </div>
                    <div class="inputs">
                        <label for="estudiantes_apellidos">Apellidos</label>
                        <input type="text" id="estudiantes_apellidos" name="estudiantes_apellidos" disabled>
                    </div>
                    <div class="inputs">
                        <label for="estudiantes_fecha_nacimiento">Fecha de nacimiento</label>
                        <input type="date" id="estudiantes_fecha_nacimiento" disabled>
                    </div>
                    <div class="inputs">
                        <label for="estudiantes_correo">Correo electrónico</label>
                        <input type="text" id="estudiantes_correo" name="estudiantes_correo" disabled>
                    </div>
                    <div class="inputs">
                        <label for="estudiantes_telefono">Teléfono</label>
                        <input type="number" id="estudiantes_telefono" name="estudiantes_telefono" disabled>
                    </div>
                    <div class="inputs">
                        <label for="estudiantes_genero">Género</label>
                        <select name="estudiantes_genero" id="estudiantes_genero" disabled>
                            <option value="Nulo">Nulo</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                        </select>
                    </div>
                    <div class="inputs">
                        <label for="estudiantes_estado">Estado</label>
                        <select name="estudiantes_estado" id="estudiantes_estado" disabled>
                            <option value="Activo">Activo</option>
                            <option value="Inactivo">Inactivo</option>
                            <option value="Egresado">Egresado</option>
                            <option value="Inhabilitado">Inhabilitado</option>
                        </select>
                    </div>
                    <div class="inputs">
                        <label for="estudiantes_direccion">Dirección</label>
                        <input type="text" id="estudiantes_direccion" disabled>
                    </div>
                    <div class="inputs">
                        <label for="estudiantes_observaciones">Observaciones</label>
                        <textarea id="estudiantes_observaciones" disabled></textarea>
                    </div>
                    <div class="inputs">
                        <button type="submit" class="submit-btn" id="submitModal" style="display:none;">Guardar Cambios</button>
                    </div>
                </form>
            </div>
        </div>
    `;
    
    // Agregar el modal al DOM
    $('body').append(modalHtml);

    // Mostrar el modal
    $('#edit-modal').css('display', 'flex');

    // Obtener los datos de la fila seleccionada
    let rowDataDetalle = tabla.row(btnDetalle).data();

    // Llenar el formulario con los datos
    $('#estudiantes_tipo_documento').val(rowDataDetalle.sigla);
    $('#estudiantes_no_documento').val(rowDataDetalle.nroDocumento);
    $('#estudiantes_nombre').val(rowDataDetalle.nombre);
    $('#estudiantes_apellidos').val(rowDataDetalle.apellido);
    $('#estudiantes_fecha_nacimiento').val(rowDataDetalle.fechaNacimiento);
    $('#estudiantes_correo').val(rowDataDetalle.correo);
    $('#estudiantes_genero').val(rowDataDetalle.genero);
    $('#estudiantes_telefono').val(rowDataDetalle.telefono);
    $('#estudiantes_estado').val(rowDataDetalle.estado);
    $('#estudiantes_observaciones').val(rowDataDetalle.observaciones);
    $('#estudiantes_direccion').val(rowDataDetalle.direccion);
    
    // Implementa el valor del teléfono como placeholder así sea un campo de tipo numérico
    // document.getElementsByName('telefonoInput')[0].placeholder = rowDataDetalle.telefono;

    // Cambiar el título del modal y ocultar el botón de "Guardar Cambios"
    $('#modal-title').text('Detalle del Estudiante');
    $('#submitModal').hide(); // Ocultamos el botón "Guardar Cambios"

    // Cerrar el modal cuando se haga clic en la "X"
    $('.close').on('click', function () {
        $('#edit-modal').remove();
    });
});


    $(document).on('keydown', function(event) {
        if (event.key === 'Escape') {
            $('#edit-modal').remove();
        }
    });
    
});
