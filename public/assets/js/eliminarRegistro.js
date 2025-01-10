$(document).ready(function (){
    
    let tabla = $('#tabla_estudiantes').DataTable();

    async function eliminarRegistro(estudiantes_no_documento) {
        const response = await $.ajax({
            url: '../src/controllers/delete_students.php',  
            type:'POST',
            data:{
                estudiantes_no_documento:estudiantes_no_documento
            },
            dataType: 'json'
        });

        if (response) {
            alert("exitoso");
            return true;
        }else{
            alert("Fallo");
            return false;
        }
    }

//Inhabilitar estudiante
$('#myTable').on('click','#btnEliminar', async function (f) {
        
    f.preventDefault();
    // f.stopPropagation();
    
    
    let fila = $(this).closest('tr');
    let borrarDato = tabla.row(fila).data();

    
    console.log(fila);
    console.log({borrarDato});
    if (confirm("¿Esta seguro que desea Inhabilitar este registro?")) {
        const exito = await eliminarRegistro(estudiantes_no_documento);

        if(exito){
            tabla.row(fila).remove().draw();
        }
        // $.ajax({
        //     url: '../src/controllers/delete_students.php',  
        //     type: 'POST',                 
        //     data: {
        //         estudiantes_estado: estudiantes_estado,
        //         estudiantes_no_documento: estudiantes_no_documento
        //     },                  
        //     dataType: 'json', 
        //     cache:false,           
        //     success: function(response) { 
        //         console.log(response);
        //         var data = JSON.parse(response);
        //         if(data.success){
                    
        //         tabla.row(fila.parents("tr")).remove().draw();
        //         //tabla.row(row).remove().draw();

        //         console.log(data);
        //         }else{
        //             alert("error");
        //         }
        //     },
        //     error: function(xhr, status, error) {  
        //         callback(error, null);           
        //     }
        // });

    }

})
});    
