USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarEmpleados

AS
BEGIN
    INSERT INTO Empleado
        SELECT

            empleado.value('@Nombre','VARCHAR(40)') AS nombre,
            empleado.value('@ValorDocumentoIdentidad','INT') AS valorDocIdentidad,
            CAST(empleado.value('@FechaNacimiento','VARCHAR(40)')AS DATE)  AS fechaNacimiento,
            empleado.value('@idPuesto','INT') AS idPuesto,
            empleado.value('@idDepartamento','INT') AS idDepartamento,
            empleado.value('@idTipoDocumentacionIdentidad','INT') AS idTipoDoc,
            (SELECT id FROM Usuarios AS U WHERE U.Pwd = empleado.value('@Password','INT')),
            1 AS activo
            
        FROM
            (
                SELECT CAST(c AS XML) FROM
                OPENROWSET(
                    BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
                    SINGLE_BLOB
                ) AS T(c)
                ) AS S(C)
                CROSS APPLY c.nodes('Datos/Operacion/NuevoEmpleado') AS A (empleado)

    

END
GO