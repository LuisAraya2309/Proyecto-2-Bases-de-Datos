USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarDepartamentos
		@OutResultCode INT OUTPUT
	
AS
BEGIN
		--DECLARE
		--		@OutResultCode INT

		--EXEC sp_CargarDepartamentos
		--		@OutResultCode INT

		SET NOCOUNT ON;
		BEGIN TRY
			SELECT
				@OutResultCode=0 ;

			BEGIN TRANSACTION TSaveMov
				INSERT INTO Departamento

				SELECT
					departamento.value('@Id','INT') AS id,
					departamento.value('@Nombre','VARCHAR(40)') AS nombre, 
					1 AS activo
			
				FROM
				(
					SELECT CAST(c AS XML) FROM
					OPENROWSET(
						BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\StoredProcedures\CargaInformacion\Datos_Tarea2.xml',
						SINGLE_BLOB
					) AS T(c)
					) AS S(C)
					CROSS APPLY c.nodes('Datos/Catalogos/Departamentos/Departamento') AS A(departamento)

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