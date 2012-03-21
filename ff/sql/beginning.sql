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
CREATE TABLE dbo.ProgramActionType
	(
	ActionTypeID int NOT NULL,
	Name varchar(50) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ProgramActionType ADD CONSTRAINT
	PK_ProgramActionType PRIMARY KEY CLUSTERED 
	(
	ActionTypeID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProgramActionType SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.EngageProgram
	(
	ProgramID int NOT NULL,
	Name varchar(100) NOT NULL,
	CreatedDate datetime NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.EngageProgram ADD CONSTRAINT
	PK_EngageProgram PRIMARY KEY CLUSTERED 
	(
	ProgramID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.EngageProgram SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.UserProgram
	(
	FFUserID int NOT NULL,
	ProgramID int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.UserProgram ADD CONSTRAINT
	FK_UserProgram_EngageProgram FOREIGN KEY
	(
	ProgramID
	) REFERENCES dbo.EngageProgram
	(
	ProgramID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.UserProgram SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ProgramAction
	(
	ActionID int NOT NULL,
	ProgramID int NOT NULL,
	Name nchar(10) NOT NULL,
	ActionTypeID int NOT NULL,
	PointsGiven int NOT NULL,
	ActionData varchar(75) NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ProgramAction ADD CONSTRAINT
	PK_ProgramAction PRIMARY KEY CLUSTERED 
	(
	ActionID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProgramAction ADD CONSTRAINT
	FK_ProgramAction_EngageProgram FOREIGN KEY
	(
	ProgramID
	) REFERENCES dbo.EngageProgram
	(
	ProgramID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProgramAction ADD CONSTRAINT
	FK_ProgramAction_ProgramActionType FOREIGN KEY
	(
	ActionTypeID
	) REFERENCES dbo.ProgramActionType
	(
	ActionTypeID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProgramAction SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.UserAction
	(
	ActionID int NOT NULL,
	CompleteDate datetime NOT NULL,
	FFUserID int NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.UserAction ADD CONSTRAINT
	DF_UserAction_CompleteDate DEFAULT GETDATE() FOR CompleteDate
GO
ALTER TABLE dbo.UserAction ADD CONSTRAINT
	FK_UserAction_ProgramAction FOREIGN KEY
	(
	ActionID
	) REFERENCES dbo.ProgramAction
	(
	ActionID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.UserAction SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ProgramReward
	(
	RewardID int NOT NULL,
	ProgramID int NOT NULL,
	Name varchar(100) NOT NULL,
	Description varchar(MAX) NULL,
	PointsRequired int NOT NULL,
	QuantityAvailable int NOT NULL,
	IsRaffle bit NOT NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.ProgramReward ADD CONSTRAINT
	PK_ProgramReward PRIMARY KEY CLUSTERED 
	(
	RewardID
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.ProgramReward ADD CONSTRAINT
	FK_ProgramReward_EngageProgram FOREIGN KEY
	(
	ProgramID
	) REFERENCES dbo.EngageProgram
	(
	ProgramID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
ALTER TABLE dbo.ProgramReward SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
