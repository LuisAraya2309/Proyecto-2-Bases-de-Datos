USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarEliminarEmpleados
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarEliminarEmpleados
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			DECLARE @count INT;
			CREATE TABLE #EliminarTemporal(id INT, valorDocIdentidad INT);

			BEGIN TRANSACTION TSaveMov
				INSERT INTO #EliminarTemporal
					SELECT
						eliminarEmpleado.value('@ValorDocumentoIdentidad','INT') 
					FROM
					(
						SELECT  CAST(c AS XML) FROM
						OPENROWSET(
							BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
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
			COMMIT TRANSACTION TSaveMov;


		END TRY
		BEGIN CATCH

						IF @@Trancount>0 
							ROLLBACK TRANSACTION TSaveMov;
						INSERT INTO dbo.Errores	VALUES (
							SUSER_SNAME(),
							ERROR_NUMBER(),
							ERROR_STATE(),
							ERROR_SEVERITY(),
							ERROR_LINE(),
							ERROR_PROCEDURE(),
							ERROR_MESSAGE(),
							GETDATE()
						);

						Set @OutResultCode=50005;
		END CATCH;

		SET NOCOUNT OFF;
END
GO