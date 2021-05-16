USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[DeduccionXEmpleado]    Script Date: 16/05/2021 12:21:27 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DeduccionXEmpleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdTipoDeduccion] [int] NOT NULL,
 CONSTRAINT [PK_DeduccionXEmpleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DeduccionXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionXEmpleado_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([Id])
GO

ALTER TABLE [dbo].[DeduccionXEmpleado] CHECK CONSTRAINT [FK_DeduccionXEmpleado_Empleado]
GO

ALTER TABLE [dbo].[DeduccionXEmpleado]  WITH CHECK ADD  CONSTRAINT [FK_DeduccionXEmpleado_TipoDeduccion] FOREIGN KEY([IdTipoDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([Id])
GO

ALTER TABLE [dbo].[DeduccionXEmpleado] CHECK CONSTRAINT [FK_DeduccionXEmpleado_TipoDeduccion]
GO

