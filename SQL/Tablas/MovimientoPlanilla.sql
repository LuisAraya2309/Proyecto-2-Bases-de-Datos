USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[MovimientoPlanilla]    Script Date: 16/05/2021 12:23:33 p. m. ******/
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
 CONSTRAINT [PK_MovimientoPlanilla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoPlanilla_MovimientoHora] FOREIGN KEY([Id])
REFERENCES [dbo].[MovimientoHora] ([id])
GO

ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_MovimientoPlanilla_MovimientoHora]
GO

ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoPlanilla_PlanillaXSemanaXEmpleado] FOREIGN KEY([IdPlanillaXSemanaXEmpleado])
REFERENCES [dbo].[PlanillaXSemanaXEmpleado] ([Id])
GO

ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_MovimientoPlanilla_PlanillaXSemanaXEmpleado]
GO

ALTER TABLE [dbo].[MovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoPlanilla_TipoMovimientoPlanilla] FOREIGN KEY([IdTipoMovimientoPlanilla])
REFERENCES [dbo].[TipoMovimientoPlanilla] ([Id])
GO

ALTER TABLE [dbo].[MovimientoPlanilla] CHECK CONSTRAINT [FK_MovimientoPlanilla_TipoMovimientoPlanilla]
GO

