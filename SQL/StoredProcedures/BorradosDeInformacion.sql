USE SistemaObrero

delete from SemanaPlanilla;
delete from MesPlanilla;
delete from Jornada;
delete from Empleado;
delete from Departamento;
delete from Puestos;
delete from TipoDeduccion;
delete from TipoDocIdentidad;
delete from Usuarios;
delete from TipoJornada;
DROP PROCEDURE sp_CargarXML
DBCC CHECKIDENT ('Empleado', RESEED, 0)
DBCC CHECKIDENT ('MarcaAsistencia', RESEED, 0)
DBCC CHECKIDENT ('Jornada', RESEED, 0)
DBCC CHECKIDENT ('SemanaPlanilla', RESEED, 0)
DBCC CHECKIDENT ('MesPlanilla', RESEED, 0)
DBCC CHECKIDENT ('Usuarios', RESEED, 0)