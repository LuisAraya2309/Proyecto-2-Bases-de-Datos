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
				BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
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
				BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
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
				BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
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
				BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/TiposDeJornada/TipoJornada') AS A(tipoJornada)



    INSERT INTO TipoMovimientoPlanilla

		SELECT
			tipoMovimiento.value('@Id','INT') AS id,
			tipoMovimiento.value('@Nombre','VARCHAR(40)') AS nombre
			
		FROM
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
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
				BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
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
				BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Catalogos/Deducciones/TipoDeDeduccion') AS A (tipoDeduccion)


	 INSERT INTO Usuarios

		SELECT
			usuario.value('@pwd','VARCHAR(64)') AS pwd,
			usuario.value('@tipo','INT') AS tipo,
			usuario.value('@username','INT') AS username,
			1 AS activo
			
		FROM 
		(
			SELECT CAST(c AS XML) FROM
			OPENROWSET(
				BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
				SINGLE_BLOB
			) AS T(c)
			) AS S(C)
			CROSS APPLY c.nodes('Datos/Usuarios/Usuario') AS A(usuario)



		SELECT
			


		FROM
			(
				SELECT CAST(c AS XML) FROM
				OPENROWSET(
					BULK 'E:\TEC\I SEMESTRE 2021\Bases de Datos I\Proyecto 2\Proyecto-2-Bases-de-Datos\SQL\Datos_Tarea2.xml',
					SINGLE_BLOB
				) AS T(c)
				) AS S(C)
				CROSS APPLY c.nodes('Datos/Operacion/Deducciones/TipoDeDeduccion') AS A (tipoDeduccion)
	

	
	
	
	
	
	SET NOCOUNT OFF
END
GO

EXEC sp_CargarXML