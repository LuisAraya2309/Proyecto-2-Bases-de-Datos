
USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarFeriados

AS
BEGIN
    INSERT INTO Feriados

            SELECT
                feriado.value('@Fecha','VARCHAR(64)') AS fecha,
                feriado.value('@Nombre','VARCHAR(64)') AS nombre
                
            FROM 
            (
                SELECT CAST(c AS XML) FROM
                OPENROWSET(
                    BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
                    SINGLE_BLOB
                ) AS T(c)
                ) AS S(C)
                CROSS APPLY c.nodes('Datos/Catalogos/Feriados/Feriado') AS A(feriado)

END
GO