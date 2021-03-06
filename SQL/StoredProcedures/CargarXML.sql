USE [SistemaObrero]

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE sp_CargarXML 

AS
BEGIN
-- Codigo para probar sp
--EXEC sp_CargarXML

	SET NOCOUNT ON

	INSERT INTO Puestos

		SELECT
			puesto.value('@Id','INT') AS id,
			puesto.value('@Nombre','VARCHAR(40)') AS Nombre,
			puesto.value('@SalarioXHora','INT') AS salarioxHora,
			1 AS activo  
			
		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/Puestos/Puesto') AS A(puesto)

	
    INSERT INTO Departamento

		SELECT
			departamento.value('@Id','INT') AS id,
			departamento.value('@Nombre','VARCHAR(40)') AS nombre, 
			1 AS activo
			
		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/Departamentos/Departamento') AS A(departamento)


    INSERT INTO TipoDocIdentidad

		SELECT
			tipodoc.value('@Id','INT') AS id,
			tipodoc.value('@Nombre','VARCHAR(40)') AS nombre,
			1 AS activo
			
		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/Tipos_de_Documento_de_Identificacion/TipoIdDoc') AS A(tipodoc)

    
    INSERT INTO TipoJornada

		SELECT
			tipoJornada.value('@Id','INT') AS id,
			tipoJornada.value('@Nombre','VARCHAR(40)') AS nombre,
            tipoJornada.value('@HoraEntrada','VARCHAR(40)') AS horaEntrada,
            tipoJornada.value('@HoraSalida','VARCHAR(40)') AS horaSalida
			
		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/TiposDeJornada/TipoDeJornada') AS A(tipoJornada)



    INSERT INTO TipoMovimientoPlanilla

		SELECT
			tipoMovimiento.value('@Id','INT') AS id,
			tipoMovimiento.value('@Nombre','VARCHAR(40)') AS nombre
			
		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/TiposDeMovimiento/TipoMovimiento') AS A(tipoMovimiento)

    

    INSERT INTO Feriados

		SELECT
			feriado.value('@Fecha','VARCHAR(64)') AS fecha,
			feriado.value('@Nombre','VARCHAR(64)') AS nombre
			
		FROM 
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/Feriados/Feriado') AS A(feriado)


    INSERT INTO TipoDeduccion

		SELECT

			tipoDeduccion.value('@Id','INT') AS id,
			tipoDeduccion.value('@Nombre','VARCHAR(40)') AS nombre,
			tipoDeduccion.value('@Obligatorio','VARCHAR(40)') AS esObligatorio,
            tipoDeduccion.value('@Porcentual','VARCHAR(40)') AS esPorcentual
            --tipoDeduccion.value('@Valor','VARCHAR(40)') AS valor


		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/Deducciones/TipoDeDeduccion') AS A (tipoDeduccion)


	 INSERT INTO Usuarios

		SELECT
		    usuario.value('@username','VARCHAR(64)') AS username,
			usuario.value('@pwd','INT') AS pwd,
			usuario.value('@tipo','INT') AS tipo,
			1 AS activo
			
		FROM 
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Usuarios/Usuario') AS A(usuario);

INSERT INTO Usuarios
	SELECT

		empleado.value('@Username','VARCHAR(64)') AS username,
		empleado.value('@Password','INT') AS pwd,
		'2' AS tipo,
		1 AS activo
		
	FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Operacion/NuevoEmpleado') AS A (empleado)

INSERT INTO Empleado
	SELECT

		empleado.value('@Nombre','VARCHAR(40)') AS nombre,
		empleado.value('@ValorDocumentoIdentidad','INT') AS valorDocIdentidad,
		CAST(empleado.value('@FechaNacimiento','VARCHAR(40)')AS DATE)  AS fechaNacimiento,
		empleado.value('@idPuesto','INT') AS idPuesto,
		empleado.value('@idDepartamento','INT') AS idDepartamento,
		empleado.value('@idTipoDocumentacionIdentidad','INT') AS idTipoDoc,
		(SELECT id FROM Usuarios AS U WHERE U.Pwd = empleado.value('@Password','INT')),
		1 AS activo
		
	FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Operacion/NuevoEmpleado') AS A (empleado)

--El siguiente proceso es para insertar las semanas y meses
DECLARE @countFechas INT; DECLARE @countSemanas INT;
CREATE TABLE #FechasTemporales(fecha DATE);
CREATE TABLE #FechasSemana(fecha DATE);
SET LANGUAGE Spanish 

INSERT INTO  #FechasTemporales

	SELECT
		operacion.value('@Fecha','DATE') 
	FROM
	(
		SELECT  CAST(c AS XML) FROM
		OPENROWSET(
			BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
			SINGLE_BLOB
		) AS T(c)
		) AS S(C)
		CROSS APPLY c.nodes('Datos/Operacion') AS A (operacion)
	WHERE
		(((SELECT DATEPART(WEEKDAY,operacion.value('@Fecha','DATE'))) = 4) OR ((SELECT DATEPART(WEEKDAY,operacion.value('@Fecha','DATE'))) = 5));


SELECT @countFechas = COUNT(*) FROM #FechasTemporales;
SELECT @countSemanas = COUNT(*) FROM #FechasTemporales;

--Se crea la copia de la fechasTemporales
INSERT INTO #FechasSemana

	SELECT fecha
	FROM #FechasTemporales

--Se insertan los meses 
DECLARE @fechaInicio DATE = (SELECT DATEADD(DAY,1,(SELECT TOP (1) fecha FROM #FechasTemporales)));
DECLARE @mesActual INT = (SELECT DATEPART(MONTH, (SELECT TOP (1) fecha FROM #FechasTemporales)));

WHILE @countFechas > 0

	BEGIN
		DECLARE @fechaActual DATE = (SELECT TOP(1) fecha FROM #FechasTemporales);

		IF (SELECT DATEPART(WEEKDAY,@fechaActual)) = 4 AND  @mesActual <> (SELECT DATEPART(MONTH,@fechaActual))
			BEGIN
				INSERT INTO MesPlanilla
				VALUES(
					@fechaInicio
					,@fechaActual
				)
				SET @fechaInicio = (SELECT DATEADD(DAY,1,@fechaActual));
				SET @mesActual = (SELECT DATEPART(MONTH,@fechaActual));
			END
		DELETE TOP (1) FROM #FechasTemporales
		SELECT @countFechas = COUNT(*) FROM #FechasTemporales;
	END
DROP TABLE #FechasTemporales;

--Se insertan las semanas

WHILE @countSemanas > 0

	BEGIN
		DECLARE @fechaActualS DATE = (SELECT TOP(1) fecha FROM #FechasSemana);

		IF (SELECT DATEPART(WEEKDAY,@fechaActualS)) = 5
			BEGIN
				INSERT INTO SemanaPlanilla
				VALUES(
					@fechaActualS
					, (SELECT DATEADD(DAY,6,@fechaActualS))
					, (SELECT id FROM MesPlanilla AS MP WHERE(SELECT DATEPART(MONTH,MP.FechaIncio)) = (SELECT DATEPART(MONTH,@fechaActualS)))
				)
			END
		DELETE TOP (1) FROM #FechasSemana
		SELECT @countSemanas = COUNT(*) FROM #FechasSemana;
	END
DROP TABLE #FechasSemana;

--INSERT utilizado para asignar una nueva jornada a un Empleado
INSERT INTO dbo.Jornada
	SELECT

		tipoJornadaProximaSemana.value('@IdJornada','INT') AS idJornada,
		(SELECT E.Id FROM dbo.Empleado AS E WHERE E.ValorDocumentoIdentidad = tipoJornadaProximaSemana.value('@ValorDocumentoIdentidad','INT')),
		(SELECT Id FROM dbo.SemanaPlanilla WHERE Id = (SELECT IDENT_CURRENT('SemanaPlanilla')))
		
	FROM 
	(
		SELECT CAST(c AS XML) FROM
		OPENROWSET(
			BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
			SINGLE_BLOB
		) AS T(c)
		) AS S(C)
		CROSS APPLY c.nodes('Datos/Operacion/TipoDeJornadaProximaSemana') AS A (tipoJornadaProximaSemana)

--INSERT utilizado para asignar una Marca de asistencia a un Empleado
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
			BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
			SINGLE_BLOB
		) AS T(c)
		) AS S(C)
		CROSS APPLY c.nodes('Datos/Operacion/MarcaDeAsistencia') AS A (marcaAsistencia)





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
				BULK ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml',
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

SELECT * FROM MesPlanilla;
SELECT * FROM SemanaPlanilla;

END
GO

EXEC sp_CargarXML

/*
Path ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml'
*/

/*
Path ':\Proyecto-2-Bases-de-Datos\Datos_Tarea2.xml'
*/