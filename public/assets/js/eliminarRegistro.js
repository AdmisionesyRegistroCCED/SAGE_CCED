$(document).ready(function (){
    
    var tabla = $('#tabla_estudiantes').DataTable();

//Inhabilitar estudiante
$(document).on('click','#btnEliminar', function (f) {
        
    f.preventDefault();
    // f.stopPropagation();
    
    
    let fila = $(this).closest('tr');
    let borrarDato = tabla.row(fila).data();

    
    console.log(fila);
    console.log({borrarDato});
    let inhabilitarAlert = confirm("¿Esta seguro que desea Inhabilitar este registro?");
    if (inhabilitarAlert) {
        $.ajax({
            url: '../src/controllers/delete_students.php',  
            type: 'POST',                 
            data: {
                estudiantes_estado: estudiantes_estado,
                estudiantes_no_documento: estudiantes_no_documento
            },                  
            dataType: 'json', 
            cache:false,           
            success: function(response) { 
                console.log(response);
                var data = JSON.parse(response);
                if(data.success){
                    
                tabla.row(fila.parents("tr")).remove().draw();
                //tabla.row(row).remove().draw();

                console.log(data);
                }else{
                    alert("error");
                }
            },
            error: function(xhr, status, error) {  
                callback(error, null);           
            }
        });

    }

})
});    
