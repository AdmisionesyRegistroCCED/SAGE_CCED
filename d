if (!empty($insertValues)) {
                $insertQuery = "INSERT INTO estudiantes (
                    estudiantes_no_documento, 
                    estudiantes_tipo_documento, 
                    estudiantes_nombre, 
                    estudiantes_apellidos, 
                    estudiantes_fecha_nacimiento, 
                    estudiantes_genero, 
                    estudiantes_telefono, 
                    estudiantes_correo, 
                    estudiantes_estado, 
                    estudiantes_direccion, 
                    estudiantes_adjunto_id,
                    estudiantes_observaciones, 
                    estudiantes_doble_titulacion, 
                    estudiantes_doble_titulacion_id
                ) VALUES ";

                $insertValues = [];
                $params = [];

                foreach ($data as $row) {
                    $insertValues[] = "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    $params = array_merge($params, [
                        $row['NoDocumento'],
                        $row['TipoDocumento'],
                        $row['Nombre'],
                        $row['Apellidos'],
                        $row['FechaNacimiento'],
                        $row['Genero'],
                        $row['Telefono'],
                        $row['Correo'],
                        $row['Estado'],
                        $row['Direccion'],
                        $row['AdjuntosID'],
                        $row['Observaciones'],
                        $row['DobleTitulacion'],
                        $row['DobleTitulacionID']
                    ]);
                }

                $insertQuery .= implode(", ", $insertValues);

                try {
                    $stmtInsert = $pdo->prepare($insertQuery);
                    $stmtInsert->execute($params); // Ejecutar una sola consulta con todos los valores
                    echo json_encode(['success' => true]);
                } catch (PDOException $e) {
                    echo json_encode(['error' => 'Error al subir los datos', 'message' => $e->getMessage()]);
                }
            }