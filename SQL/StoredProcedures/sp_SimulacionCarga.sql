USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_SimulacionCarga 

AS
BEGIN
	DECLARE @OutResultCode INT = 0;
    EXEC sp_CargarPuestos @OutResultCode;
    EXEC sp_CargarDepartamentos @OutResultCode;
    EXEC sp_CargarTipoDocIdentidad @OutResultCode;
    EXEC sp_CargarTipoJornada @OutResultCode;
    EXEC sp_CargarTipoMovimientoPlanilla @OutResultCode;
    EXEC sp_CargarFeriados @OutResultCode;
    EXEC sp_CargarTipoDeduccion @OutResultCode;
    EXEC sp_CargarUsuarios @OutResultCode;
    EXEC sp_CargarEmpleados @OutResultCode;
    EXEC sp_CargarMesesSemanas @OutResultCode;
    EXEC sp_CargarTipoJornadaProximaSemana @OutResultCode;
    EXEC sp_CargarMarcasAsistencia @OutResultCode;
    EXEC sp_CargarEliminarEmpleados @OutResultCode;


END
GO

EXEC sp_SimulacionCarga 



