use FanFueled

--select * from FFEvent where FFEvent.FFUserID='12922'

--select * from FFServiceFee where FFServiceFee.FFEventID in (select FFEvent.FFEventID from FFEvent where FFEvent.FFUserID='12922')

select * from FFEvent e 
left outer join FFServiceFee sf 
on e.FFEventID=sf.FFEventID
where e.FFUserID = '12922'