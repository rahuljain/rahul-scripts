USE [Engage]
GO
/****** Object:  StoredProcedure [dbo].[spEngageGetAllActiveRewardsForProgram]    Script Date: 04/05/2012 14:08:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rahul Jain
-- Create date: 4/03/2011
-- Description:	Gets a list of all Enabled Rewards which have not ended.
-- =============================================
CREATE PROCEDURE [dbo].[spEngageGetAllActiveRewardsForProgram]
	-- Add the parameters for the stored procedure here
	@ProgamID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT DISTINCT r.RewardID, r.Name, r.Description, r.Points, r.Quantity, r.EndDate, r.SubtractsPoints
	FROM EN_Reward r
	WHERE r.Enabled = 1 and (r.EndDate is NULL or r.EndDate > getdate())
	AND r.ProgramID = @ProgamID
END

