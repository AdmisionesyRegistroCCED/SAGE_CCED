$(document).ready(function () {

    $('#formRegistrarEstudiante').submit(function (e) {
        e.preventDefault();

        let estudiantes_nombre = $('#estudiantes_nombre').val();
        let estudiantes_apellidos = $('#estudiantes_apellidos').val();
        let estudiantes_tipo_documento = $('#estudiantes_tipo_documento').val();
        let estudiantes_no_documento = $('#estudiantes_no_documento').val();
        let estudiantes_fecha_nacimiento = $('#estudiantes_fecha_nacimiento').val();
        let estudiantes_correo = $('#estudiantes_correo').val();
        let estudiantes_estado = $('#estudiantes_estado').val();
        let estudiantes_direccion = $('#estudiantes_direccion').val();
        let estudiantes_genero = $('#estudiantes_genero').val();
        let estudiantes_telefono = $('#estudiantes_telefono').val();
        let estudiantes_observaciones = $('#estudiantes_observaciones').val();
        let estudiantes_ciudad_exp = $('#estudiantes_ciudad_exp').val();
        let estudiantes_depto_exp = $('#estudiantes_depto_exp').val();

        console.log(estudiantes_telefono);


        $.ajax({
            url: '../src/controllers/sql_register_student.php',
            type: "POST",
            data: {
                estudiantes_nombre: estudiantes_nombre,
                estudiantes_apellidos: estudiantes_apellidos,
                estudiantes_tipo_documento: estudiantes_tipo_documento,
                estudiantes_no_documento: estudiantes_no_documento,
                estudiantes_fecha_nacimiento: estudiantes_fecha_nacimiento,
                estudiantes_ciudad_exp:estudiantes_ciudad_exp,
                estudiantes_depto_exp:estudiantes_depto_exp,
                estudiantes_estado: estudiantes_estado,
                estudiantes_direccion: estudiantes_direccion,
                estudiantes_genero: estudiantes_genero,
                estudiantes_telefono: estudiantes_telefono,
                estudiantes_correo: estudiantes_correo,
                estudiantes_observaciones: estudiantes_observaciones
            },
            datatype: "json",
            cache: false,
            success: function (response) {
                if (response[0] === 'Valor duplicado') {
                    alert("El número de documento ingresado ya está registrado en la base de datos"); 
                } else {
                    alert("Estudiante agregado con éxito");
                    console.log(response);
                    $('#formRegistrarEstudiante')[0].reset();
                }
            },
            error: function (xhr, status, error) {
                alert("Error al registrar el estudiante");
                console.log(error);
            }
        });
    });

});