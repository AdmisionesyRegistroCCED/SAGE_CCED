$(document).ready(function () {

  $('#formRegistrarEstudiante').submit(function(e){
    e.preventDefault();

    let estudiantes_nombre = $('#estudiantes_nombre').val();
    let estudiantes_apellidos = $('#estudiantes_apellidos').val();
    let estudiantes_tipo_documento = $('#estudiantes_tipo_documento').val();
    let estudiantes_no_documento = $('#estudiantes_no_documento').val();
    let estudiantes_fecha_nacimiento = $('#estudiantes_fecha_nacimiento').val();
    let estudiantes_correo = $('#estudiantes_correo').val();
    let estudiantes_estado = $('#estudiantes_estado').val();
    let estudiantes_genero = $('#estudiantes_genero').val();
    let estudiantes_telefono = $('#estudiantes_telefono').val();
    let estudiantes_observaciones = $('#estudiantes_observaciones').val();

    $.ajax({
        url: '../src/controllers/sql_register_student.php',  
        type:"POST",
        data:{
            estudiantes_nombre:estudiantes_nombre,
            estudiantes_apellidos:estudiantes_apellidos,
            estudiantes_tipo_documento:estudiantes_tipo_documento,
            estudiantes_no_documento:estudiantes_no_documento,
            estudiantes_fecha_nacimiento:estudiantes_fecha_nacimiento,
            estudiantes_correo:estudiantes_correo,
            estudiantes_estado:estudiantes_estado,
            estudiantes_genero:estudiantes_genero,
            estudiantes_telefono: estudiantes_telefono,
            estudiantes_observaciones:estudiantes_observaciones
        },
        datatype:"json",
        cache:false,
        success:function (data){
            if(data){
                alert("Registro exitoso: " + {data});

            }
        },
        error: function(xhr, status, error) {
            alert("Hubo un error al procesar la solicitud. Intenta de nuevo.");
        }


    });

});

});