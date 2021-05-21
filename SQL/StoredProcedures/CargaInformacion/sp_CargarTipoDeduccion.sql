USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarTipoDeduccion

AS
BEGIN

    INSERT INTO TipoDeduccion

        SELECT

            tipoDeduccion.value('@Id','INT') AS id,
            tipoDeduccion.value('@Nombre','VARCHAR(40)') AS nombre,
            tipoDeduccion.value('@Obligatorio','VARCHAR(40)') AS esObligatorio,
            tipoDeduccion.value('@Porcentual','VARCHAR(40)') AS esPorcentual
            --tipoDeduccion.value('@Valor','VARCHAR(40)') AS valor


        FROM
        (
            SELECT CAST(c AS XML) FROM
            OPENROWSET(
                BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
                SINGLE_BLOB
            ) AS T(c)
            ) AS S(C)
            CROSS APPLY c.nodes('Datos/Catalogos/Deducciones/TipoDeDeduccion') AS A (tipoDeduccion)
    



END
GO