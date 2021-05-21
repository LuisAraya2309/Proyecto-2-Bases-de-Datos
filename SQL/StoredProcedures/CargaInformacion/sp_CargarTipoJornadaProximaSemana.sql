USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarTipoJornadaProximaSemana

AS
BEGIN
    INSERT INTO dbo.Jornada
        SELECT

            tipoJornadaProximaSemana.value('@IdJornada','INT') AS idJornada,
            (SELECT E.Id FROM dbo.Empleado AS E WHERE E.ValorDocumentoIdentidad = tipoJornadaProximaSemana.value('@ValorDocumentoIdentidad','INT')),
            (SELECT Id FROM dbo.SemanaPlanilla WHERE Id = (SELECT IDENT_CURRENT('SemanaPlanilla')))
            
        FROM 
        (
            SELECT CAST(c AS XML) FROM
            OPENROWSET(
                BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
                SINGLE_BLOB
            ) AS T(c)
            ) AS S(C)
            CROSS APPLY c.nodes('Datos/Operacion/TipoDeJornadaProximaSemana') AS A (tipoJornadaProximaSemana)

END
GO