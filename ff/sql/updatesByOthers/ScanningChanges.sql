USE [fanfueled]
GO

/****** Object:  Table [dbo].[FFScannerUser]    Script Date: 12/21/2011 12:42:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[FFScannerUser](
	[FFScannerUserID] [int] IDENTITY(1,1) NOT NULL,
	[FFEventID] [int] NOT NULL,
	[Email] [varchar](75) NOT NULL,
	[Password] [varchar](75) NOT NULL,
 CONSTRAINT [PK_FFScannerUser] PRIMARY KEY CLUSTERED 
(
	[FFScannerUserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[FFScannerUser]  WITH CHECK ADD  CONSTRAINT [FK_FFScannerUser_FFEvent] FOREIGN KEY([FFEventID])
REFERENCES [dbo].[FFEvent] ([FFEventID])
GO

ALTER TABLE [dbo].[FFScannerUser] CHECK CONSTRAINT [FK_FFScannerUser_FFEvent]
GO


/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.FFApiSessions ADD
	ScannerUserID int NULL
GO
ALTER TABLE dbo.FFApiSessions SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
