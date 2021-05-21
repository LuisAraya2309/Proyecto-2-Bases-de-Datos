USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarTipoMovimientoPlanilla

AS
BEGIN
    INSERT INTO TipoMovimientoPlanilla

            SELECT
                tipoMovimiento.value('@Id','INT') AS id,
                tipoMovimiento.value('@Nombre','VARCHAR(40)') AS nombre
                
            FROM
            (
                SELECT CAST(c AS XML) FROM
                OPENROWSET(
                    BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
                    SINGLE_BLOB
                ) AS T(c)
                ) AS S(C)
                CROSS APPLY c.nodes('Datos/Catalogos/TiposDeMovimiento/TipoMovimiento') AS A(tipoMovimiento)

    
END
GO