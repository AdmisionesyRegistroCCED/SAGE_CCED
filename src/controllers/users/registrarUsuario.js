$(document).ready(function () {
    $("#formRegistrarEstudiante").submit(function (e) {
        e.preventDefault(); // Evita el envío tradicional del formulario

        var formData = $(this).serialize();

        $.ajax({
            type: "POST",
            url: "/src/controllers/users/sql_register_user.php",
            data: formData,
            dataType: "json",
            beforeSend: function () {
                Swal.fire({
                    title: "Procesando...",
                    text: "Por favor, espera",
                    allowOutsideClick: false,
                    didOpen: () => {
                        Swal.showLoading();
                    }
                });
            },
            success: function (response) {
                if (response.success) {
                    Swal.fire({
                        icon: "success",
                        title: "¡Registro exitoso!",
                        text: response.message,
                        timer: 2000,
                        showConfirmButton: false
                    }).then(() => {
                        $("#formRegistrarEstudiante")[0].reset(); // Resetea el formulario
                    });
                } else {
                    Swal.fire({
                        icon: "error",
                        title: "Error",
                        text: response.message,
                        showConfirmButton: true
                    });
                }
            },
            error: function () {
                Swal.fire({
                    icon: "error",
                    title: "Error",
                    text: "Hubo un problema en el servidor. Intenta de nuevo.",
                    showConfirmButton: true
                });
            }
        });
    });
});
