# REQUERIMIENTOS PARA VISTA ACADEMICA

### Carga masiva de estudiantes (ACA-001)-1
El sistema debe permitir al usuario con rol Academico cargar archivos planos como CSV mediante un formulario con un input de tipo file.

### Restricciones: 
- El sistema solo debe admitir archivos tipo CSV delimitado por comas.

- El limite de registros no debe exceder 1000 registros.

---
### Control de vistas por rol de usuario (ACA-002)-1
El sistema debe poder mostrar información dependiendo del rol del usuario que este ingresando a la plataforma.

siendo estos:

1. SupAdmin
2. Admin
3. Academicos
4. Comerciales
5. Estudiantes 
6. Docentes 

### Restricciones:
- El sistema debe mostrar las opciones en base al rol que inicio sesión en la plataforma.
- El rol no debe mostrar información de más de un rol a la vez.
- Los roles **Admin y SupAdmin** tiene acceso al rol academico.
---
### Registro de estudiantes (ACA-003)-1

El sistema debe permitir al usuario con rol academico, registrar estudiantes (Activos, Inactivos o Egresados) mediante el uso de formularios con los siguientes campos (Nombre, Apellidos, Tipo documento, Numero documento, Fecha de nacimiento, Genero, Números de teléfono, Correo electrónico, Dirección, Fecha de matricula, Jornada, Tipo de estudio, Programa, Graduado, Observaciones, ADJUNTOS "DNI, FOTO, EPS, RECIBO DE PAGO, DIPLOMA, ACTA")

#### Tipo de documento:
 - CC (Cedula de ciudadania)
 - TI (Tarjeta de identidad)
 - CE (Cedula de extranjeria)
 - PP (Pasaporte)
 - DIE (Documento de nacionalidad extranjera)

#### Genero:
- Masculino
- Femenino
- Prefiero no decirlo

#### Tipo de estudio:
- Bachillerato por ciclos
- Cursos
- Programas tecnicos

#### Programa:
- Información pendiente por recibir desde gerencia.

#### Graduado:
- Si
- No


### Restricciones:
- Los campos Tipo documento, genero, tipo estudio, programa y graduado deben ser de tipo select.

- El sistema no debe registrar datos de tipo texto en los siguientes campos: tipo documento, no. documento, estado.

- El sistema no debe registrar caracteres especiales como por ejemplo: #$%&!/&() en los siguientes campos: nombres, apellidos.

- Se debe dar por válido el correo electronico del estudiante si contiene el elemento de arroba (@) y su respectivo dominio tales como: @hotmail.com, @hotmail.es, @outlook.com, @gmail, entre otros.

- Los formatos admitidos por los campos de adjuntos unicamente deben ser (JPG, JPEG, PNG, WEBP, PDF, JFIF).

- Los siguientes campos son obligatorios:nombres, apellido, teléfono, tipo documento, numero documento, correo electronico, fecha de matricula, jornada, tipo de estudio y programa.
---
### Consulta de estudiantes (ACA-004)-1

El sistema debe permitir consultar la información de los estudiantes mostrando los siguientes campos:

1. Tipo de documento.
2. No documento.
3. Nombre.
4. Fecha de matricula.
5. Programa.
6. Estado.
7. Graduado
8. Columna de opciones con los siguientes botones (Editar, Inhabilitar, Ver detalle)

Y con posibilidad de ser filtrada por (Año, Programa, Nombre, No.documento, Franja).

### Restricciones:

- El limite de cantidad de datos mostrados por pagina debe ser de 25 maximo y minimo 10.
---
### Actualización de datos de estudiantes (ACA-005)-3

El sistema debe permitir al usuario con rol Academico actualizar a el estudiante seleccionado mendiante un formulario con los siguientes datos:

1. Tipo de documento
2. Nombre
3. Apellidos
4. Genero
5. Numeros de telefono
6. Correo electronico
7. Dirección
8. Jornada
9. Programa
10. Observaciones
11. Adjuntos

### Restricciones: 
- Los campos (Numero de documento, Fecha de nacimiento, Fecha de matricula y Tipo de estudio) no deben poder permitir modificación alguna.

- Los campos (Nombre y Numero de telefono) no deben tener caracteres especiales.

---
### Inhabilitación de estudiantes (ACA-006)-2

El sistema debe permitir inhabilitar a un estudiante mediante un botón de acción llamado "Eliminar" en la ventana de consulta de estudiantes el cual desplegara una ventana de confirmación de la acción la cual contendra un mensaje preguntando si desea proceder con la acción, un botón confirmar para cambiar el estado del estudiante a inhabilitado y un botón cancelar para detener la acción.

### Restricciones:

- El sistema no debe eliminar a más de un estudiante a la vez (Bulk delete)
---
### Ver detalle (ACA-007)-3 

El sistema debe permitir al usuario con rol academico ver el detalle de la información completa del estudiante tanto activos como inactivos

---


# Distribución de requerimientos

### Alejandro

- ACA-003-1
- ACA-004-1
- ACA-005-2
- ACA-006-3
- ACA-007-3

### Marlon

- ACA-001-1
- ACA-002-1