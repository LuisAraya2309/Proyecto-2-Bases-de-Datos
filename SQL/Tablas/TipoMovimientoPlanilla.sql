USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[TipoMovimientoPlanilla]    Script Date: 16/05/2021 12:25:54 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TipoMovimientoPlanilla](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TipoMovimientoPlanilla] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[TipoMovimientoPlanilla]  WITH CHECK ADD  CONSTRAINT [FK_TipoMovimientoPlanilla_TipoMovimientoDeducciones] FOREIGN KEY([Id])
REFERENCES [dbo].[TipoMovimientoDeducciones] ([Id])
GO

ALTER TABLE [dbo].[TipoMovimientoPlanilla] CHECK CONSTRAINT [FK_TipoMovimientoPlanilla_TipoMovimientoDeducciones]
GO

