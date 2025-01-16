$(document).ready(function () {

    let tabla = $('#myTable').DataTable({
        "autoWidth": true,
        "responsive": true,
        "processing": true,
        "serverSide": false,
        "language": {
            "url": "assets/js/es-ES.json"
        },
        "columns": [
            { "data": "sigla" },
            { "data": "nroDocumento" },
            {
                "render": (data) => data.nombre + " " + data.apellido,
                "data": null
            },
            {
                "data": "telefono",
                sortable: false
            },
            {
                "data": "estado"
            },
            {
                "defaultContent": "<div class='text-center'><div class='btn-group' role='group' aria-label='Button group'><button id='btnEditar' class='btn btn-primary editbtn' type='button' ><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-pencil-square' viewBox='0 0 16 16'><path d='M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z'/><path fill-rule='evenodd' d='M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z'/></svg></button><button id='btnEliminar' class='btn btn-info eliminarbtn' type='button' ><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash-fill' viewBox='0 0 16 16'><path d='M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z'/></svg></button><button id='btnDetalle' class='btn btn-info btnDetalle' type='button' ><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-plus-fill' viewBox='0 0 16 16'><path d='M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z'/></svg></button></div></div>",
                //Quito las flechas de busqueda
                sortable: false
            }
        ],
        "ajax": {
            "type": "POST",
            "url": "../src/controllers/fetch_students.php",
            "datatype": 'json',
            "dataSrc": function (subData) {
                if (subData.lenght == 0) {
                    return alert(json.error);
                }else{
                    return subData || []; // Asegúrate de que 'data' existe en la respuesta JSON.
                }
            },
            "error": function (xhr, status, error) {
                console.error("Error en la solicitud AJAX: " + error);
            },
            "cache": false,
        }

    });


    //Capturar datos
    $(document).on('click', '.editbtn', function (e) {

        e.preventDefault();
        e.stopPropagation();

        
        const inputBtn = document.querySelector('#submitModal');
        const textTitle = document.querySelector('#modal-title');
        
        if(inputBtn.style === 'none'){
            inputBtn.style.display = 'block';
        }else{
            textTitle.innerHTML='Editar estudiante';
            inputBtn.style.display = 'flex';
            $('.modal').css('display','flex');
        }

        console.log(textTitle);

        let boton = $(this).closest('tr');

        //Obtener datos de la fila seleccionada.
        let rowData = tabla.row(boton).data();

        // Llenar el formulario del modal
        $('#estudiantes_tipo_documento').val(rowData.sigla);
        $('#estudiantes_no_documento').val(rowData.nroDocumento);
        $('#estudiantes_nombre').val(rowData.nombre);
        $('#estudiantes_apellidos').val(rowData.apellido);
        $('#estudiantes_fecha_nacimiento').val(rowData.fechaNacimiento);
        $('#estudiantes_correo').val(rowData.correo);
        $('#estudiantes_genero').val(rowData.genero);
        $('#estudiantes_telefono').val(rowData.telefono);
        $('#estudiantes_estado').val(rowData.estado);
        $('#estudiantes_observaciones').val(rowData.observaciones);
        $('#estudiantes_no_documento_hidden').val(rowData.nroDocumento);
        

        // Muestra el modal
        //$('#edit-modal').css('display', 'flex');
    });


    // Actualizar datos
    $('#edit-form').submit(function (e) {
        e.preventDefault();


        // Captura de datos
        const estudiantes_tipo_documento = $('#estudiantes_tipo_documento').val();
        const estudiantes_no_documento = $('#estudiantes_no_documento').val();
        const estudiantes_no_documento_hidden = $('#estudiantes_no_documento_hidden').val();
        const estudiantes_nombre = $('#estudiantes_nombre').val();
        const estudiantes_apellidos = $('#estudiantes_apellidos').val();
        const estudiantes_fecha_nacimiento = $('#estudiantes_fecha_nacimiento').val();
        const estudiantes_telefono = $('#estudiantes_telefono').val();
        const estudiantes_genero = $('#estudiantes_genero').val();
        const estudiantes_correo = $('#estudiantes_correo').val();
        const estudiantes_estado = $('#estudiantes_estado').val();
        const estudiantes_observaciones = $('#estudiantes_observaciones').val();

        // Enviar los datos al servidor usando AJAX
        $.ajax({
            url: '../src/controllers/update_students.php',
            type: 'POST',
            data: {
                estudiantes_tipo_documento: estudiantes_tipo_documento,
                estudiantes_no_documento: estudiantes_no_documento,
                estudiantes_no_documento_hidden:estudiantes_no_documento_hidden,
                estudiantes_nombre: estudiantes_nombre,
                estudiantes_apellidos: estudiantes_apellidos,
                estudiantes_fecha_nacimiento: estudiantes_fecha_nacimiento,
                estudiantes_genero: estudiantes_genero,
                estudiantes_telefono: estudiantes_telefono,
                estudiantes_correo: estudiantes_correo,
                estudiantes_estado: estudiantes_estado,
                estudiantes_observaciones: estudiantes_observaciones
            },
            success: function (response) {
                alert("Registro actualizado correctamente."); // Muestra un mensaje de éxito
                tabla.ajax.reload(); // Actualiza la tabla
                $('#edit-modal').css('display', 'none'); // Cierra el 

                return true;
            },
            error: function (xhr, status, error) {
                console.log(error);
                alert("Error al actualizar los datos. Intenta de nuevo.");
                return false;
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
                url: '../src/controllers/delete_students.php',
                type: 'POST',
                data: {
                    estudiantes_no_documento: estudiantes_no_documento,
                    estudiantes_estado:estudiantes_estado
                },
                dataType: 'json'
            });
    
            if (response) {
                alert("exitoso");
                tabla.ajax.reload();
                return true;
            } else {
                alert("Fallo");
                return false;
            }
        } catch (error) {
            alert("Error de la petición");
            console.log("Error en la petición.",error);
            return false;
        }
        
    }

    //Inhabilitar estudiante
    $('#myTable').on('click', '#btnEliminar', async function (f) {

        f.preventDefault();
        f.stopPropagation();

        let fila = $(this).closest('tr');
        let borrarDato = tabla.row(fila).data();
        let estudiantes_no_documento = borrarDato.nroDocumento;
        let estudiantes_estado = borrarDato.estado;
        if (confirm("¿Esta seguro que desea Inhabilitar este registro?")) {
            const exito = await eliminarRegistro(estudiantes_no_documento,estudiantes_estado);
            if (exito) {
                tabla.row(fila).remove().draw();
            }

        }

    });


    
    const inputBtn = document.querySelector('#submitModal');
    const textTitle = document.querySelector('#modal-title');
    //Ver detalle
    $('#myTable').on('click','#btnDetalle',function (g){

        let btnDetalle = $(this).closest('tr');

        //Obtener datos de la fila seleccionada.
        let rowDataDetalle = tabla.row(btnDetalle).data();

        
        // Llenar el formulario del modal
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

        if(inputBtn.style === 'none'){
            inputBtn.style.display = 'block';
        }else{
            textTitle.innerHTML = 'Detalle del estudiante';
            inputBtn.style.display = 'none';
            $('.modal').css('display','flex');
        }

    });
});