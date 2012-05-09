-- Per user
select pointslog.ProgramID, pointslog.UserID, actions.DisplayName, pointslog.Points/20 as 'Amount Donated'
from EN_UserPointsLog pointslog, EN_Action actions
where actions.ActionTypeID=11
and pointslog.Description like 'action%completed%'
and Convert(varchar(10), actions.ActionID) = pointslog.AdditionalData
order by pointslog.ProgramID

-- Net per action
select pointslog.ProgramID, actions.DisplayName, SUM(pointslog.Points)/20 as 'Amount Donated'
from EN_UserPointsLog pointslog, EN_Action actions
where actions.ActionTypeID=11
and pointslog.Description like 'action%completed%'
and Convert(varchar(10), actions.ActionID) = pointslog.AdditionalData
group by actions.DisplayName, pointslog.ProgramID
