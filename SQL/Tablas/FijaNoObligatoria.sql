USE [SistemaObrero]
GO

/****** Object:  Table [dbo].[FijaNoObligatoria]    Script Date: 16/05/2021 12:22:39 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FijaNoObligatoria](
	[Id] [int] NOT NULL,
 CONSTRAINT [PK_FijaNoObligatoria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FijaNoObligatoria]  WITH CHECK ADD  CONSTRAINT [FK_FijaNoObligatoria_DeduccionXEmpleado] FOREIGN KEY([Id])
REFERENCES [dbo].[DeduccionXEmpleado] ([Id])
GO

ALTER TABLE [dbo].[FijaNoObligatoria] CHECK CONSTRAINT [FK_FijaNoObligatoria_DeduccionXEmpleado]
GO

