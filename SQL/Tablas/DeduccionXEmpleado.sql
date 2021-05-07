USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[DeduccionXEmpleado]    Script Date: 06/05/2021 04:36:45 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DeduccionXEmpleado](
	[Id] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[IdTipoDeduccion] [int] NOT NULL,
 CONSTRAINT [PK_DeduccionXEmpleado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

