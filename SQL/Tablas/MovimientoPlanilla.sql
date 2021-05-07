USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[MovimientoPlanilla]    Script Date: 06/05/2021 04:40:38 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MovimientoPlanilla](
	[Id] [int] NOT NULL,
	[Fecha] [varchar](64) NOT NULL,
	[Monto] [int] NOT NULL,
	[IdTipoMovimientoPlanilla] [int] NOT NULL,
	[IdPlanillaXSemanaXEmpleado] [int] NOT NULL,
	[IdMovimientoHoras] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoPlanilla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

