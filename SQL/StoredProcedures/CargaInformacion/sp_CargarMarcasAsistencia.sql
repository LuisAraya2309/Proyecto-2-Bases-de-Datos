USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarMarcasAsistencia

AS
BEGIN
    INSERT INTO dbo.MarcaAsistencia
        SELECT

            marcaAsistencia.value('@FechaEntrada','VARCHAR(40)') AS fechaEntrada,
            marcaAsistencia.value('@FechaSalida','VARCHAR(40)') AS fechaSalida,
            (SELECT TOP 1 J.id 
            FROM dbo.Jornada AS J 
            WHERE J.IdEmpleado IN (SELECT TOP 1 E.id 
                                    FROM dbo.Empleado AS E 
                                    WHERE E.ValorDocumentoIdentidad = marcaAsistencia.value('@ValorDocumentoIdentidad','INT')))
        FROM
        (
            SELECT CAST(c AS XML) FROM
            OPENROWSET(
                BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
                SINGLE_BLOB
            ) AS T(c)
            ) AS S(C)
            CROSS APPLY c.nodes('Datos/Operacion/MarcaDeAsistencia') AS A (marcaAsistencia)
            
END
GO