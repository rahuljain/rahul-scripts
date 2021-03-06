USE [Engage]
GO
/****** Object:  StoredProcedure [dbo].[spEngageGetAllActiveActionsForProgram]    Script Date: 04/03/2012 20:30:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rahul Jain
-- Create date: 3/30/2012
-- Description:	Gets all active actions for program.
-- =============================================
CREATE PROCEDURE [dbo].[spEngageGetAllActiveActionsForProgram]
	-- Add the parameters for the stored procedure here
	@ProgramID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT A.ActionID, A.Name, A.DisplayName, A.Description, A.Points, A.ActionData, A.StartDate, A.EndDate, A.ActionTypeID, A.IsRepeatable, A.PointsDisplay
	FROM EN_Action A
	where A.ProgramID = @ProgramID 
	AND A.Enabled = 1
	AND (A.EndDate IS NULL OR A.EndDate > getdate())

END

