USE [fanfueled]
GO

/****** Object:  Table [dbo].[FFUserOrganizerPage]    Script Date: 02/09/2012 15:58:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FFUserOrganizerPage](
	[FFUserID] [bigint] NOT NULL,
	[OrganizerUrl] [varchar](50) NOT NULL,
	[AboutOrganizer] [varchar](max) NULL,
	[ImageID] [int] NULL,
	[FBFanPage] [varchar](50) NULL,
 CONSTRAINT [PK_FFUserOrganizerPage] PRIMARY KEY CLUSTERED 
(
	[FFUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[FFUserOrganizerPage]  WITH CHECK ADD  CONSTRAINT [FK_FFUserOrganizerPage_FFUser] FOREIGN KEY([FFUserID])
REFERENCES [dbo].[FFUser] ([FFUserID])
GO

ALTER TABLE [dbo].[FFUserOrganizerPage] CHECK CONSTRAINT [FK_FFUserOrganizerPage_FFUser]
GO


