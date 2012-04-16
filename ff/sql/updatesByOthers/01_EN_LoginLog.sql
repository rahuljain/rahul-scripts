USE [Engage]
GO

/****** Object:  Table [dbo].[EN_LoginLog]    Script Date: 04/10/2012 15:24:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[EN_LoginLog](
	[LoginLogId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[IP] [varchar](15) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_EN_LoginLog] PRIMARY KEY CLUSTERED 
(
	[LoginLogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


