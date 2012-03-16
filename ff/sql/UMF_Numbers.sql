select * from EN_Program

--select COUNT(distinct ActionID) from EN_UserBadgeAction where ActionID IN (select ActionID from EN_Action where ProgramID=6)

select * from EN_UserBadgeAction uba, EN_Action a where uba.ActionID=a.ActionID and a.ProgramID=6
select COUNT(distinct UserID) from EN_UserBadgeAction uba, EN_Action a where uba.ActionID=a.ActionID and a.ProgramID=6
select COUNT(distinct uba.ActionID) from EN_UserBadgeAction uba, EN_Action a where uba.ActionID=a.ActionID and a.ProgramID=6
select COUNT(uba.ActionID) from EN_UserBadgeAction uba, EN_Action a where uba.ActionID=a.ActionID and a.ProgramID=6
select a.Name, COUNT(uba.UserID) from EN_UserBadgeAction uba, EN_Action a where uba.ActionID=a.ActionID and a.ProgramID=6 group by a.Name