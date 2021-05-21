USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarUsuarios

AS
BEGIN

    INSERT INTO Usuarios

    SELECT
        usuario.value('@username','VARCHAR(64)') AS username,
        usuario.value('@pwd','INT') AS pwd,
        usuario.value('@tipo','INT') AS tipo,
        1 AS activo
        
    FROM 
    (
        SELECT CAST(c AS XML) FROM
        OPENROWSET(
            BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
            SINGLE_BLOB
        ) AS T(c)
        ) AS S(C)
        CROSS APPLY c.nodes('Datos/Usuarios/Usuario') AS A(usuario);

    INSERT INTO Usuarios
        SELECT

            empleado.value('@Username','VARCHAR(64)') AS username,
            empleado.value('@Password','INT') AS pwd,
            '2' AS tipo,
            1 AS activo
            
        FROM
            (
                SELECT CAST(c AS XML) FROM
                OPENROWSET(
                    BULK'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
                    SINGLE_BLOB
                ) AS T(c)
                ) AS S(C)
                CROSS APPLY c.nodes('Datos/Operacion/NuevoEmpleado') AS A (empleado)


END
GO