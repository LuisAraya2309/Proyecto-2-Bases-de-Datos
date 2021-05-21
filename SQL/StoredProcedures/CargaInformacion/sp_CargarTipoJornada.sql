
USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarTipoJornada 

AS
BEGIN

    INSERT INTO TipoJornada

        SELECT
            tipoJornada.value('@Id','INT') AS id,
            tipoJornada.value('@Nombre','VARCHAR(40)') AS nombre,
            tipoJornada.value('@HoraEntrada','VARCHAR(40)') AS horaEntrada,
            tipoJornada.value('@HoraSalida','VARCHAR(40)') AS horaSalida
            
        FROM
        (
            SELECT CAST(c AS XML) FROM
            OPENROWSET(
                BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
                SINGLE_BLOB
            ) AS T(c)
            ) AS S(C)
            CROSS APPLY c.nodes('Datos/Catalogos/TiposDeJornada/TipoDeJornada') AS A(tipoJornada)
    



END
GO