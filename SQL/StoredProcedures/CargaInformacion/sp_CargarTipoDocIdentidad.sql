USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarTipoDocIdentidad

AS
BEGIN
    INSERT INTO TipoDocIdentidad

            SELECT
                tipodoc.value('@Id','INT') AS id,
                tipodoc.value('@Nombre','VARCHAR(40)') AS nombre,
                1 AS activo
                
            FROM
            (
                SELECT CAST(c AS XML) FROM
                OPENROWSET(
                    BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
                    SINGLE_BLOB
                ) AS T(c)
                ) AS S(C)
                CROSS APPLY c.nodes('Datos/Catalogos/Tipos_de_Documento_de_Identificacion/TipoIdDoc') AS A(tipodoc)


END
GO