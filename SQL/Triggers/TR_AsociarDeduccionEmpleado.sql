USE SistemaObrero
GO
CREATE TRIGGER  TR_AsociarDeduccionEmpleado

ON Empleado

FOR INSERT

AS

DECLARE @IdEmpleado INT
	= ( SELECT Id 
	FROM dbo.Empleado AS E 
	WHERE 
		Id = (SELECT IDENT_CURRENT('Empleado')));


EXECUTE sp_AsignarDeduccionesEmpleado  @IdEmpleado,0;

--DROP TRIGGER TR_AsociarDeduccionEmpleado



