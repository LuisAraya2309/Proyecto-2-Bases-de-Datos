USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarEliminarEmpleados

AS
BEGIN

DECLARE @count INT;
CREATE TABLE #EliminarTemporal(id INT, valorDocIdentidad INT);

INSERT INTO #EliminarTemporal

		SELECT
			1 AS id,
			eliminarEmpleado.value('@ValorDocumentoIdentidad','INT') 
		FROM
		(
			SELECT  CAST(c AS XML) FROM
			OPENROWSET(
				BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Operacion/EliminarEmpleado') AS A (eliminarEmpleado)

SELECT @count = COUNT(*) FROM #EliminarTemporal;
WHILE @count > 0
BEGIN
    DECLARE @valorDocIdentidad INT = (SELECT TOP(1) valorDocIdentidad FROM #EliminarTemporal);
    UPDATE dbo.Empleado
	SET 
		Empleado.Activo = 0
	WHERE 
		Empleado.ValorDocumentoIdentidad = @ValorDocIdentidad;
	DELETE TOP (1) FROM #EliminarTemporal
    SELECT @count = COUNT(*) FROM #EliminarTemporal;
END
DROP TABLE #EliminarTemporal;


END
GO