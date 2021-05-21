USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarPuestos 

AS
BEGIN

    INSERT INTO Puestos

            SELECT
                puesto.value('@Id','INT') AS id,
                puesto.value('@Nombre','VARCHAR(40)') AS Nombre,
                puesto.value('@SalarioXHora','INT') AS salarioxHora,
                1 AS activo  
                
            FROM
            (
                SELECT CAST(c AS XML) FROM
                OPENROWSET(
                    BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
                    SINGLE_BLOB
                ) AS T(c)
                ) AS S(C)
                CROSS APPLY c.nodes('Datos/Catalogos/Puestos/Puesto') AS A(puesto)


END
GO