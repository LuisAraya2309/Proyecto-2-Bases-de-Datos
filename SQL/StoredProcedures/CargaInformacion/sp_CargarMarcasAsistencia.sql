USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarMarcasAsistencia
@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarMarcasAsistencia
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
				BEGIN TRANSACTION TSaveMov
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
								BULK 'C:\Users\Sebastian\Desktop\TEC\IIISemestre\Bases de Datos\Proyecto-2-Bases\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
								SINGLE_BLOB
							) AS T(c)
							) AS S(C)
							CROSS APPLY c.nodes('Datos/Operacion/MarcaDeAsistencia') AS A (marcaAsistencia)
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