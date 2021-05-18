CREATE TRIGGER AsignarDeduccion
ON Empleado
AFTER INSERT
AS
PRINT 'Agregando deduccion'