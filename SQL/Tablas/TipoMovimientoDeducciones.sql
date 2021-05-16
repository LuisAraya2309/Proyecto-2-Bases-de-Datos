USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[TipoMovimientoDeducciones]    Script Date: 16/05/2021 12:25:40 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TipoMovimientoDeducciones](
	[Id] [int] NOT NULL,
	[IdTipoDeduccion] [int] NOT NULL,
 CONSTRAINT [PK_TipoMovimientoDeducciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TipoMovimientoDeducciones]  WITH CHECK ADD  CONSTRAINT [FK_TipoMovimientoDeducciones_TipoDeduccion] FOREIGN KEY([IdTipoDeduccion])
REFERENCES [dbo].[TipoDeduccion] ([Id])
GO

ALTER TABLE [dbo].[TipoMovimientoDeducciones] CHECK CONSTRAINT [FK_TipoMovimientoDeducciones_TipoDeduccion]
GO

