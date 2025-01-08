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

    
    let tabla = $('#myTable').DataTable({
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
                "cache": false
                // "success":function(response){
                //     console.log(response);
                // }
            },

        

 
    
    });

    //Agregar clase a fila
    tabla.rows().every(function (){
        $(this.node()).addClass('.fila');
    });
    
    

    $(document).on('click', '.editbtn', function(e) {

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
        $('#estudiantes_estado').val(rowData.estado);
        $('#estudiantes_observaciones').val(rowData.observaciones);



        console.log({ rowData });
        
        // Muestra el modal
        $('#edit-modal').css('display', 'flex');
    });

     // Cierra el modal al hacer clic en "x"
    $('.close').click(function() {
        $('#edit-modal').css('display', 'none');
    });

    // Cierra el modal si se hace clic fuera de él
    $(window).click(function(event) {
        if ($(event.target).is('#edit-modal')) {
            $('#edit-modal').css('display', 'none');
        }
    });

    $(document).on('click','.eliminarbtn', function (e) {
        console.log('botón de eliminar');
        e.preventDefault();
    })

    // Manejo del envío del formulario
    $('#edit-form').submit(function(e) {
        e.preventDefault();

        // Captura de datos
        const typedni = $('#dni_type').val();
        const dni = $('#dni').val();
        const firstName = $('#fname').val();
        const lastName = $('#lname').val();
        const dob = $('#dob').val();
        const gender = $('#gender').val();
        const phone = $('#phone').val();
        const email = $('#email').val();
        const status = $('#status').val();

        // Enviar los datos al servidor usando AJAX
        $.ajax({
            url: '../src/controllers/update_students.php', 
            type: 'POST',
            data: {
                dni_type: typedni,
                dni: dni,
                fname: firstName,
                lname: lastName,
                dob: dob,
                gender: gender,
                phone: phone,
                email: email,
                status: status
            },
            success: function(response) {
                alert(response); // Muestra un mensaje de éxito
                fetchStudents(); // Actualiza la tabla
                $('#edit-modal').css('display', 'none'); // Cierra el modal
            },
            error: function(xhr, status, error) {
                console.error("Error en la actualización: ", error);
                alert("Error al actualizar los datos. Intenta de nuevo.");
            }
        });
    });
});
