USE [SistemaObrero]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE sp_MovimientoHorasOrdinarias  @outResultCode INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	CREATE TABLE #MarcasAsistenciasAux (Id INT,FechaInicio SMALLDATETIME,FechaFin SMALLDATETIME,IdJornada INT);

	INSERT INTO #MarcasAsistenciasAux
		(
		Id,
		FechaInicio,
		FechaFin,
		IdJornada
		)
		SELECT * FROM MarcasAsistencia;

	DECLARE @indexMarcaAsistencia INT;
	SELECT @indexMarcaAsistencia = COUNT(*) FROM #MarcasAsistenciasAux;

	WHILE @indexMarcaAsistencia > 0

		BEGIN
			DECLARE @FechaInicio SMALLDATETIME = (SELECT TOP(1) FechaInicio FROM #MarcasAsistenciasAux);
			DECLARE @FechaFin SMALLDATETIME = (SELECT TOP(1) FechaFin FROM #MarcasAsistenciasAux) ;
			DECLARE @IdJornada INT = (SELECT TOP(1) IdJornada FROM #MarcasAsistenciasAux);
			DECLARE @IdTipoJornada INT = (SELECT IdTipoJornada FROM Jornada WHERE @IdJornada = Jornada.Id);
			DECLARE @IdEmpleado INT = (SELECT IdEmpleado FROM Jornada WHERE @IdJornada = Jornada.Id);
			DECLARE @idPuesto INT = (SELECT IdPuesto FROM Empleado WHERE Id = @IdEmpleado);
			DECLARE @horasTrabajadas INT = DATEDIFF(HOUR,@fechaInicio,@fechaFin);
			DECLARE @horasOrdinarias INT = DATEDIFF(HOUR,(SELECT HoraInicio FROM TipoJornada WHERE @IdTipoJornada = TipoJornada.Id),
														 (SELECT HoraFin FROM TipoJornada WHERE @IdTipoJornada = TipoJornada.Id));
			IF @horasTrabajadas<=@horasOrdinarias
				BEGIN
					INSERT INTO TipoMovimientoPlanilla
						VALUES(

						)

					
				END


			
			
			DELETE TOP(1) FROM #MarcasAsistenciasAux;
			SELECT @indexMarcaAsistencia = COUNT(*) FROM #MarcasAsistenciasAux;
		END

	DROP TABLE #MarcasAsistenciasAux
	SET NOCOUNT OFF;
END
GO

EXEC sp_MovimientoHorasOrdinarias 0

DROP PROCEDURE sp_MovimientoHorasOrdinarias