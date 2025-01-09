document.getElementById('menuToggle').addEventListener('click', function() {
    var leftMenu = document.getElementById('lftmenu');
    var mainContent = document.querySelector('.main');
    var footer = document.getElementById('footer');
    var formatDiv = document.getElementById('format');
    
    leftMenu.classList.toggle('collapsed');
    mainContent.classList.toggle('expanded');
    footer.classList.toggle('expanded');
    formatDiv.classList.toggle('expanded');
});


document.getElementById('dropdownToggle').addEventListener('click', function() {
    document.getElementById('dropdownMenu').classList.toggle('show');
});

$(document).ready(function() {

    var tabla = $('#myTable').DataTable({
        "autoWidth":true,
        //data: null,
        "responsive": true,
        "processing": true,
        "serverSide": false,
        "language":{
            "url":"assets/js/es-ES.json"
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
                "defaultContent": "<div class='text-center'><div class='btn-group' role='group' aria-label='Button group'><button id='btnEditar' class='btn btn-primary editbtn' type='button' ><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-pencil-square' viewBox='0 0 16 16'><path d='M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z'/><path fill-rule='evenodd' d='M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z'/></svg></button><button id='btnEliminar' class='btn btn-info eliminarbtn' type='button' ><svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-trash-fill' viewBox='0 0 16 16'><path d='M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z'/></svg></button></div></div>",
                //Quito las flechas de busqueda
                sortable: false
            }
        ],
            "ajax": {
                "type": "POST",
                "url": "../src/controllers/fetch_students.php",
                "datatype": 'array',
                "dataSrc": "",
                "cache": false,
                // "success":function(response){
                //     return console.log(response);
                // }
                
            },
            
    });

    
});

    // $(document).on('click', '.editbtn', function(e) {

    //     e.preventDefault();
    //     e.stopPropagation();

    //     let boton = $(this).closest('tr');

    //     //Obtener datos de la fila seleccionada.
    //     let rowData = tabla.row(boton).data();
        
    //     // Llenar el formulario del modal
    //     $('#estudiantes_tipo_documento').val(rowData.sigla);
    //     $('#estudiantes_no_documento').val(rowData.nroDocumento);
    //     $('#estudiantes_nombre').val(rowData.nombre);
    //     $('#estudiantes_apellidos').val(rowData.apellido);
    //     $('#estudiantes_fecha_nacimiento').val(rowData.fechaNacimiento);
    //     $('#estudiantes_correo').val(rowData.correo);
    //     $('#estudiantes_genero').val(rowData.genero);
    //     $('#estudiantes_telefono').val(rowData.telefono);
    //     $('#estudiantes_estado').val(rowData.estado);
    //     $('#estudiantes_observaciones').val(rowData.observaciones);
        
    //     // Muestra el modal
    //     $('#edit-modal').css('display', 'flex');
    // });

    
    // Actualizar datos
    // $('#edit-form').submit(function(e) {
    //     e.preventDefault();

    //     // Captura de datos
    //     const estudiantes_tipo_documento = $('#estudiantes_tipo_documento').val();
    //     const estudiantes_no_documento = $('#estudiantes_no_documento').val();
    //     const estudiantes_nombre = $('#estudiantes_nombre').val();
    //     const estudiantes_apellidos = $('#estudiantes_apellidos').val();
    //     const estudiantes_fecha_nacimiento = $('#estudiantes_fecha_nacimiento').val();
    //     const estudiantes_telefono = $('#estudiantes_telefono').val();
    //     const estudiantes_genero = $('#estudiantes_genero').val();
    //     const estudiantes_correo = $('#estudiantes_correo').val();
    //     const estudiantes_estado = $('#estudiantes_estado').val();
    //     const estudiantes_observaciones = $('#estudiantes_observaciones').val();

    //     // Enviar los datos al servidor usando AJAX
    //     $.ajax({
    //         url: '../src/controllers/update_students.php', 
    //         type: 'POST',
    //         data: {
    //             estudiantes_tipo_documento: estudiantes_tipo_documento,
    //             estudiantes_no_documento: estudiantes_no_documento,
    //             estudiantes_nombre: estudiantes_nombre,
    //             estudiantes_apellidos: estudiantes_apellidos,
    //             estudiantes_fecha_nacimiento: estudiantes_fecha_nacimiento,
    //             estudiantes_genero: estudiantes_genero,
    //             estudiantes_telefono: estudiantes_telefono,
    //             estudiantes_correo: estudiantes_correo,
    //             estudiantes_estado: estudiantes_estado,
    //             estudiantes_observaciones:estudiantes_observaciones
    //         },
    //         success: function(response) {
    //             alert("Registro actualizado correctamente."); // Muestra un mensaje de éxito
    //             tabla.ajax.reload(); // Actualiza la tabla
    //             $('#edit-modal').css('display', 'none'); // Cierra el modal
    //         },
    //         error: function(xhr, status, error) {
    //             console.error("Error en la actualización: ", error);
    //             alert("Error al actualizar los datos. Intenta de nuevo.");
    //         }
    //     });
    // });

    // Cierra el modal al hacer clic en "x"
    $('.close').click(function() {
        $('#edit-modal').css('display', 'none');
    });

// $(document).ready(function(){

//     //Inhabilitar estudiante
//     $(document).on('click','#btnEliminar', function (f) {
        
//         f.preventDefault();
//         // f.stopPropagation();
        
        
//         let fila = $(this).closest('tr');
//         let borrarDato = tabla.row(fila).data();

        
//         console.log(fila);
//         console.log({borrarDato});
//         let inhabilitarAlert = confirm("¿Esta seguro que desea Inhabilitar este registro?");
//         if (inhabilitarAlert) {
//             $.ajax({
//                 url: '../src/controllers/delete_students.php',  
//                 type: 'POST',                 
//                 data: {
//                     estudiantes_estado: estudiantes_estado,
//                     estudiantes_no_documento: estudiantes_no_documento
//                 },                  
//                 dataType: 'json', 
//                 cache:false,           
//                 success: function(response) { 
                    
//                     if(data.success){
                        
//                     var data = JSON.parse(response);
//                     tabla.row(fila.parents("tr")).remove().draw();
//                     tabla.row(row).remove().draw();

//                     console.log(data);
//                     }else{
//                         alert("error");
//                     }
//                 },
//                 error: function(xhr, status, error) {  
//                     callback(error, null);           
//                 }
//             });


//         }

//     })


// });

    //Registrar estudiante
    // $('#formRegistrarEstudiante').submit(function(e){
    //     e.preventDefault();

    //     let estudiantes_nombre = $('#estudiantes_nombre').val();
    //     let estudiantes_apellidos = $('#estudiantes_apellidos').val();
    //     let estudiantes_tipo_documento = $('#estudiantes_tipo_documento').val();
    //     let estudiantes_no_documento = $('#estudiantes_no_documento').val();
    //     let estudiantes_fecha_nacimiento = $('#estudiantes_fecha_nacimiento').val();
    //     let estudiantes_correo = $('#estudiantes_correo').val();
    //     let estudiantes_estado = $('#estudiantes_estado').val();
    //     let estudiantes_genero = $('#estudiantes_genero').val();
    //     let estudiantes_telefono = $('#estudiantes_telefono').val();



    //     // {estudiantes_nombre,
    //     //     estudiantes_apellidos,
    //     //     estudiante_tipo_documento,
    //     //     estudiantes_no_documento,
    //     //     estudiantes_fecha_nacimiento,
    //     //     estudiantes_correo,
    //     //     estudiantes_estado,
    //     //     estudiantes_genero}


    //     $.ajax({
    //         url: '../src/controllers/sql_register_student.php',  
    //         type:"POST",
    //         data:{
    //             estudiantes_nombre:estudiantes_nombre,
    //             estudiantes_apellidos:estudiantes_apellidos,
    //             estudiantes_tipo_documento:estudiantes_tipo_documento,
    //             estudiantes_no_documento:estudiantes_no_documento,
    //             estudiantes_fecha_nacimiento:estudiantes_fecha_nacimiento,
    //             estudiantes_correo:estudiantes_correo,
    //             estudiantes_estado:estudiantes_estado,
    //             estudiantes_genero:estudiantes_genero,
    //             estudiantes_telefono: estudiantes_telefono
    //         },
    //         datatype:"json",
    //         cache:false,
    //         success:function (data){
    //             if(data){
    //                 console.log("Registro exitoso"+data);
    //             }
    //         }

    //     });

    // });

