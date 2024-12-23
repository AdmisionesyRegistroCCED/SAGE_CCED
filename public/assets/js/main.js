document.getElementById('menuToggle').addEventListener('click', function() {
    var leftMenu = document.getElementById('lftmenu');
    var mainContent = document.querySelector('.main');
    
    leftMenu.classList.toggle('collapsed');
    mainContent.classList.toggle('expanded');
});


document.getElementById('dropdownToggle').addEventListener('click', function() {
    document.getElementById('dropdownMenu').classList.toggle('show');
});


$(document).ready(function() {
    $(document).on('click', '.editbtn', function(e) {
        e.preventDefault();

        // Obtener los datos del estudiante
        const typedni = $(this).closest('tr').find('td:nth-child(1)').text();
        const dni = $(this).closest('tr').find('td:nth-child(2)').text();
        const firstName = $(this).closest('tr').find('td:nth-child(3)').text();
        const lastName = $(this).closest('tr').find('td:nth-child(4)').text();
        const dob = $(this).closest('tr').find('td:nth-child(5)').text();
        const gender = $(this).closest('tr').find('td:nth-child(6)').text();
        const phone = $(this).closest('tr').find('td:nth-child(7)').text();
        const mail = $(this).closest('tr').find('td:nth-child(8)').text();
        const status = $(this).closest('tr').find('td:nth-child(9)').text();
        console.log('Estado obtenido:', status);

        // Llenar el formulario del modal
        $('#dni_type').val(typedni);
        $('#dni').val(dni);
        $('#fname').val(firstName);
        $('#lname').val(lastName);
        $('#dob').val(dob);
        $('#gender').val(gender);
        $('#phone').val(phone);
        $('#email').val(mail);
        $('#status :selected').val(status).change();
        console.log('Valor del dropdown de estado:', $('#status :selected').val());
        
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
