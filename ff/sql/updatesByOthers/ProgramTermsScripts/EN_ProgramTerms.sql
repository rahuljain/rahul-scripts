USE [Engage]
GO

/****** Object:  Table [dbo].[EN_ProgramTerms]    Script Date: 03/21/2012 14:34:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[EN_ProgramTerms](
	[ProgramTermsID] [int] IDENTITY(1,1) NOT NULL,
	[ProgramID] [int] NOT NULL,
	[Terms] [varchar](max) NOT NULL,
 CONSTRAINT [PK_EN_ProgramTerms] PRIMARY KEY CLUSTERED 
(
	[ProgramTermsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[EN_ProgramTerms]  WITH CHECK ADD  CONSTRAINT [FK_EN_ProgramTerms_EN_Program] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[EN_Program] ([ProgramID])
GO

ALTER TABLE [dbo].[EN_ProgramTerms] CHECK CONSTRAINT [FK_EN_ProgramTerms_EN_Program]
GO


