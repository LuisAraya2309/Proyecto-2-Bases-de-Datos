USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[MovimientoDeduccion]    Script Date: 16/05/2021 12:23:17 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MovimientoDeduccion](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_MovimientoDeduccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MovimientoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoDeduccion_DeduccionXEmpleado] FOREIGN KEY([Id])
REFERENCES [dbo].[DeduccionXEmpleado] ([Id])
GO

ALTER TABLE [dbo].[MovimientoDeduccion] CHECK CONSTRAINT [FK_MovimientoDeduccion_DeduccionXEmpleado]
GO

ALTER TABLE [dbo].[MovimientoDeduccion]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoDeduccion_MovimientoPlanilla] FOREIGN KEY([Id])
REFERENCES [dbo].[MovimientoPlanilla] ([Id])
GO

ALTER TABLE [dbo].[MovimientoDeduccion] CHECK CONSTRAINT [FK_MovimientoDeduccion_MovimientoPlanilla]
GO

