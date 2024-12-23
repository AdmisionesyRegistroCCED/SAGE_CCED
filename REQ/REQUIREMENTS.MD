Normatividad educativa basada en 
    Ley 2170 de 2021 = crear entornos de aprendizaje virtuales para niños, niñas y adolescentes, corresponde al ministerio de educación nacional realizar el seguimiento e implementación
    Ley 115 de 1994 : Leer ley 30 de 1992
    Ley 1182 de 2008 : Saneamiento de propiedad del inmueble del centro de educación, títulos que conllevan la falsa tradición 
    Ley 2108 de 2021

    https://www.mineducacion.gov.co/1621/w3-printer-184681.html

# Requerimientos para el software SAGE_CCED (Sistema Administrativo de Gestión Educativa)

## Estructura jerarquica de roles

1. SupAdmin (Dirección general)
2. Admin (Area de sistemas)
3. Academicos (Admisiones y registroo, Contabilidad yfinanzas)
4. Comerciales = CARGAN DATOS DE ESTUDIANTES
5. Estudiantes 
6. Docentes = CARGAN NOTAS, NO ELIMINAN 

---

## Estudiantes - Egresados - Inactivos
    
    1.1 El sistema debe permitir registrar nuevos estudiantes con rol acádemico mediante el uso de formularios con los siguientes campos (tipo documento, no. documento, nombres, apellidos, fecha de nacimiento, genero, correo, telefono, estado, info sobre doble titulación )

    1.2 El sistema debe permitir consultar la información de los estudiantes con posibilidad de ser filtrada por (Año, Programa, Nombre, No.documento, Franja).

    1.3 El sistema debe permitir al usuario con rol academico y/o comercial ver el detalle de la información completa del estudiante tanto activos como inactivos

    1.4 El sistema debe permitir la carga de datos masivos por medio de archivos CSV.x CARGA MASIVA

    1.5 El sistema debe permitir descargar datos de estudiantes, egresados e inactivos en un archivo CSV.

    1.7 El sistema debe permitir cambiar estado de los estudiantes de activo y/o inactivo con un botón de acción en el apartado de consulta de estudiantes o consulta de inactivos.

    1.8 El sistema debe permitir al usuario cambiar la información básica de sus datos personales exceptuando el número de documento, fecha de nacimiento y genero. 

    1.9 El sistema debe permitir al usuario cargar archivos en formato pdf y jpg en caso de que se requiera una fotografía

    1.10 El sistema debe permitir al usuario con rol estudiante visualizar las notas sin motivos de modificar las respectivas calificaciones.
    
    1.11 El sistema debe permitir al usuario con rol estudiante visualizar el pensul al cual ha sido matriculado mediante una tabla o en su defecto una tabla o en su defecto un formato tipo .pdf

    1.12 El sistema debe permitir al usuario con rol estudiante visualizar el estado financiero más reciente de 

    RESTRICCIONES
        1.1 El sistema no debe registrar datos de tipo texto en los siguientes campos: tipo documento, no. documento, estado.
            El sistema no debe registrar caracteres especiales como por ejemplo: #$%&!/&() en los siguientes campos: nombres, apellidos.
            Se debe dar por válido el correo electronico del estudiante si contiene el elemento de arroba (@) y su respectivo dominio tales como: @hotmail.com, @hotmail.es, @outlook.com, @gmail, entre otros.
            Los siguientes campos son obligatorios: cedula de ciudadania, nombres, apellido, teléfono.
        
        1.2 Se debe filtrar la información exclusivamente con los criterios establecidos por el requisito 1.2

        1.4 La cantidad máxima registros por archivo plano es de 100

        1.5 El sistema debe permitir solamente descargar el archivo en formato .CSV
        
        1.7 El sistema no debe permitir cambiar el estado mediante campos de tipo texto, esclusivamente deben ser campos de tipo select

        1.8 La fecha de nacimiento debe de ser un campo de tipo date.

        1.9 El usuario con rol estudiante debe cargar archivos esclusivamente en formato .pdf y .jpg si es requerido.

        La visualización de las notas y el pensul no debe permitir al usuario modificar o eliminar dicha información


## Docentes
    
    2.1 El sistema debe permitir al usuario con rol docente la registrar notas de los estudiantes con un botón de acción que permita desplegar un formulario a traves de los siguientes campos: Nota1,Nota2,Nota3,NotaN. Esto según la cantidad de notas limites.

    2.2 El sistema debe permitir visualizar las notas que se han registrado por estudiante, estas notas serán visualizadas por el rol docente.

    
    2.3 El sistema debe permitir visualizar el modulo que el docente se encuentra instruyendo a sus estudiantes, La información visible será la siguiente: Nombre del modulo, fecha de apertura, fecha de cierre, ver detalle.
    
    2.5 El sistema debe permitir visualizar el grupo junto a información detallada a la cual el docente instruye, La información que debe ser visible es la siguiente: nombre del grupo, fecha de inicio, fecha fin, cantidad de estudiantes

    2.6 El sistema debe permitir visualizar los estudiantes mediante un botón de acción asignados al grupo. Los campos visibles son los siguientes: nombre completo, cedula y teléfono. 


    RESTRICCIONES
        2.1 Las notas digitadas deben tener un valor mayor a 0.
            Ninguna nota digitada debe ser menor o igual a 0.
            No se deben registrar datos de tipo texto en los campos de otas.
            Las notas solo serán cargadas por medio de un tiempo limite establecido por el usuario con rol administrador
        
        RESTRICCIONES GENERALES
        El docente no debe eliminar ni actualizar las notas cuando ya hayan sido registradas.
        Los grupos solo serán visibles mediante el modulo, es decir, solo podrá ver el grupo cuando haya accedido al modulo
        

## Modulos/Materias
    
    3.1 El sistema debe permitir al usuario con rol Academico visualizar los modulos registrados mediante una tabla junto a sus respectivos botones de acciones

    3.2 El sistema debe permitir al usuario con rol academico registrar los modulos que el docente vaya a instruir a través de los siguientes campos: (NÚMERO DE MODULO, NOMBRE DEL MODULO, DESCRIPCIÓN DEL MODULO), bóton en forma de icono para registrar la información

    3.3 El sistema debe permitir al usuario con rol academico asignar el modulo al usuario con rol 
    docente mediante un formulario con los siguientes campos: zona horaria, Docente, descripción (opcional).

    3.4 El sistema debe permitir al usuario con rol academico inhabilitar el modulo que el usuario considere necesario. 

    RESTRICCIONES
    
    3.2 El sistema no debe permitir registrar modulos repetidos
        Los modulos deben ser registrados por el usuario con rol administrador o academico
        El NÚMERO DEL MODULO NO DEBE TENER VALORES NEGATIVOS NI CARACTERES ESPECIALES.
    
    3.3 El sistema no debe permitir asignar 2 veces el modulo tanto al docente como al grupo.