USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_SimulacionCarga 

AS
BEGIN

    EXEC sp_CargarPuestos;
    EXEC sp_CargarDepartamentos;
    EXEC sp_CargarTipoDocIdentidad;
    EXEC sp_CargarTipoJornada;
    EXEC sp_CargarTipoMovimientoPlanilla;
    EXEC sp_CargarFeriados;
    EXEC sp_CargarTipoDeduccion;
    EXEC sp_CargarUsuarios;
    EXEC sp_CargarEmpleados;
    EXEC sp_CargarMesesSemanas;
    EXEC sp_CargarTipoJornadaProximaSemana;
    EXEC sp_CargarMarcasAsistencia;
    EXEC sp_CargarEliminarEmpleados;


END
GO




