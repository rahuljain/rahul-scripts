USE [FanFueled]
GO

/****** Object:  StoredProcedure [dbo].[spAdminGetEvents]    Script Date: 02/08/2012 15:01:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spAdminGetEvents] 
@EventName as nvarchar(100),
@CreatorName as varchar(50),
@CreatorEmail as nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;

SELECT e.FFEventID, e.EventTitle, u.FirstName, u.LastName, u.Email, e.StartDateTime, e.EndDateTime
, ur.FirstName as ReferrerFirstName, ur.LastName as ReferrerLastName
, ep.PaymentType
, (SELECT count(DISTINCT ov.FFOrderItemTicketID) from OrderTicketsView ov WHERE ov.FFEventID = e.FFEventID) as TicketsSold
, (SELECT sum(ov.TicketPrice) from OrderTicketsView ov WHERE ov.FFEventID = e.FFEventID) as TicketsRevenue
, (SELECT sum(ov.ServiceFee) from OrderTicketsView ov WHERE ov.FFEventID = e.FFEventID) as TotalServiceFees
, (select count(distinct sh.FFUserShareID) from FFUserShare sh where sh.FFEventID = e.FFEventID) as TotalShares
, (SELECT sum (ov.TicketingFee) from OrderTicketsView ov where ov.ffeventID = e.FFEventID AND ov.ticketfeeincluded = 1) as BakedInFees
, (SELECT sum (ov.TicketingFee) from OrderTicketsView ov where ov.ffeventID = e.FFEventID AND ov.ticketfeeincluded = 0) as FuelFees
, (SELECT sum(o.TotalCost) FROM FFOrder o WHERE o.FFOrderID IN (SELECT DISTINCT otv.FFOrderID FROM OrderTicketsView otv WHERE otv.FFEventID = e.FFEventID)) as TotalCost
, (select sum(u1.TotalCost) from UserReferralView u1 WHERE u1.FFEventID = e.FFEventID and u1.ReferrerID IN (select DISTINCT u2.FFUserID FROM UserReferralView u2 WHERE u2.FFEventID = e.FFEventID)) as ReferralRevenue
, (SELECT sum(o.TotalSurcharge) FROM FFOrder o WHERE o.FFOrderID IN (SELECT DISTINCT otv.FFOrderID FROM OrderTicketsView otv WHERE otv.FFEventID = e.FFEventID)) as TotalCCFees
, TotalCCOrderCost = CASE WHEN e.ProcessingFeesIncluded=1
  THEN (SELECT sum(ov.TicketPrice) FROM OrderTicketsView ov where ov.FFOrderID IN (select DISTINCT otv.FFOrderID from OrderTicketsView otv WHERE otv.FFEventID = e.ffeventid and otv.PaymentType = 'cc'))
  ELSE 0 END
, TotalSeperateFuelFeeCost = CASE WHEN e.ProcessingFeesIncluded=1
    THEN (SELECT sum(ov.TicketingFee) FROM OrderTicketsView ov where ov.FFOrderID IN (select DISTINCT otv.FFOrderID from OrderTicketsView otv WHERE otv.FFEventID = e.ffeventid and otv.PaymentType = 'cc') AND ov.TicketFeeIncluded=0)
  ELSE 0 END
, (SELECT sum(dbo.GetTicketDiscountAmount(ov.FFOrderItemTicketID)) FROM OrderTicketsView ov where ov.FFOrderID IN (select DISTINCT otv.FFOrderID from OrderTicketsView otv WHERE otv.FFEventID = e.ffeventid)) as TotalDiscounts
from FFEvent e
INNER JOIN FFUser u on e.FFUserID = u.FFUserID
LEFT JOIN FFUser ur ON u.ReferredFFUserID = ur.FFUserID
LEFT JOIN FFEventPayment ep on e.FFEventID = ep.FFEventID
WHERE e.EventTitle like @EventName
AND u.Email like @CreatorEmail
AND u.FirstName + ' ' + u.LastName like @CreatorName
ORDER BY e.FFEventID
END

GO

USE [FanFueled]
GO

/****** Object:  StoredProcedure [dbo].[spAdminGetOrders]    Script Date: 02/08/2012 11:16:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spAdminGetOrders] 
@StartDate as datetime,
@EndDate as datetime
AS
BEGIN
	SET NOCOUNT ON;
SELECT o.FFOrderID, o.FFUserID, u.FirstName, u.LastName, u.Email
, o.TotalCost, o.PaymentType, o.TotalProcessingFee, o.TotalSurcharge
, o.CreateDate, oi.Quantity, tt.TicketName, tt.TicketPrice, e.FFEventID
,e.EventTitle
,(SELECT count(DISTINCT sh.FFUserShareID) from FFUserShare sh 
where sh.FFUserID = o.FFUserID AND sh.FFEventID = e.FFEventID) as ShareCount
FROM FFOrder o
INNER JOIN FFOrderItem oi on o.FFOrderID = oi.FFOrderID
INNER JOIN FFUser u on o.FFUserID = u.FFUserID
inner JOIN FFOrderItemTicket oit ON oi.FFOrderItemID = oit.FFOrderItemID
inner join FFTicketType tt on oit.FFTicketTypeID = tt.FFTicketTypeID
inner JOIN FFEvent e on tt.FFEventID = e.FFEventID
where o.CreateDate between @StartDate and @EndDate
GROUP BY o.FFOrderID, o.FFUserID, u.FirstName, u.LastName, u.Email
, o.TotalCost, o.PaymentType, o.TotalProcessingFee, o.TotalSurcharge, o.CreateDate
,oi.Quantity, oi.FFOrderItemID, tt.TicketName, tt.TicketPrice, e.FFEventID
,e.EventTitle
ORDER BY o.FFOrderID
END

GO

USE [FanFueled]
GO

/****** Object:  StoredProcedure [dbo].[spAdminGetShares]    Script Date: 02/08/2012 11:16:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spAdminGetShares] 
@Name as varchar(50),
@Email as nvarchar(100),
@EventName as nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
select us1.FFUserID,u.Email, u.FirstName, u.LastName, us1.FFEventID, e.EventTitle, e.StartDateTime, 
count(DISTINCT u1.FFOrderID) as DirectRef, count(DISTINCT u2.FFOrderID) as SecondaryRef,
count (DISTINCT u3.FFOrderID) as TertiaryRef
,(SELECT sum(r.RewardAmount) from FFUserReward r WHERE r.FFUserID = us1.FFUserID and r.FFEventID = us1.FFEventID)as Rewards
, (SELECT count(DISTINCT sh.FFUserShareID) from FFUserShare sh WHERE sh.FFUserID = us1.FFUserID and sh.FFEventID = us1.FFEventID and sh.ShareTypeID = 3) as HasTwitter
, (SELECT count(DISTINCT sh.FFUserShareID) from FFUserShare sh WHERE sh.FFUserID = us1.FFUserID and sh.FFEventID = us1.FFEventID and sh.ShareTypeID IN(1.2)) as HasFacebook
from FFUserShare us1
inner join FFEvent e on us1.FFEventID = e.FFEventID
inner join FFUser u ON us1.FFUserID = u.FFUserID
left JOIN UserReferralView u1 ON us1.FFUserID = u1.ReferrerID and us1.FFEventID = u1.FFEventID
left join UserReferralView u2 ON u1.FFUserID = u2.ReferrerID and u1.FFEventID = u2.FFEventID
left join UserReferralView u3 ON u2.FFUserID = u3.ReferrerID and u2.FFEventID = u3.FFEventID
WHERE u.FirstName + ' ' + u.LastName like @Name
AND u.Email like @Email
and e.EventTitle like @EventName
GROUP BY us1.FFUserID, u.Email,u.FirstName,u.LastName, us1.FFEventID, e.EventTitle, e.StartDateTime
ORDER BY us1.FFUserID
END

GO

USE [FanFueled]
GO

/****** Object:  StoredProcedure [dbo].[spAdminGetUsers]    Script Date: 02/08/2012 11:16:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spAdminGetUsers] 
@UserName varchar(50),
		@Email nvarchar(100)	
AS
BEGIN
	SET NOCOUNT ON;		
DECLARE @tempOrders TABLE(orderid bigint, userid bigint, total money)
INSERT INTO @tempOrders(orderid,userid,total)
SELECT DISTINCT o.FFOrderID, o.FFUserID, o.TotalCost
FROM FFOrder o
INNER JOIN FFUser u on o.FFUserID = u.FFUserID
WHERE u.FirstName + ' ' + u.LastName like @UserName
AND u.Email like @Email

DECLARE @tempTickets TABLE(orderid bigint,userid bigint, orderItemticketid bigint, fftickettypeid bigint, ticketprice money)
INSERT INTO @tempTickets(orderid, userid,orderItemticketid,fftickettypeid,ticketprice)
SELECT DISTINCT o.FFOrderID, o.FFUserID, oit.FFOrderItemTicketID, tt.FFTicketTypeID, tt.TicketPrice
FROM FFOrder o
INNER JOIN FFOrderItem oi on o.FFOrderID = oi.FFOrderID
inner join FFOrderItemTicket oit on oi.FFOrderItemID = oit.FFOrderItemID
inner join FFTicketType tt ON oit.FFTicketTypeID = tt.FFTicketTypeID
INNER JOIN FFUser u on o.FFUserID = u.FFUserID
WHERE u.FirstName + ' ' + u.LastName like @UserName
AND u.Email like @Email

SELECT u.FFUserID, u.FirstName, u.LastName, u.Email, u.CreateDate
, count(DISTINCT us.FFUserShareID) as Shares
, (SELECT sum(total) from @tempOrders where userid = u.FFUserID) as TotalSpent
, count(DISTINCT e.FFEventID) as TotalEventsCreated
, (SELECT count(orderItemticketid) from @tempTickets where userid = u.FFUserID) as PurchasedTicketCount
, (SELECT sum(ticketprice) from @tempTickets where userid = u.ffuserid) as PurchasedTicketTotal
, count(DISTINCT u1.FFOrderID) as FirstLevelCount
, count(DISTINCT u2.FFOrderID) as SecondLevelCount
, count(DISTINCT u3.FFOrderID) as ThirdLevelCount
, count(DISTINCT u1.FFEventID) as EventsReferred
, st.RewardBalance
FROM FFUser u
LEFT JOIN FFOrder o ON u.FFUserID = o.FFUserID
LEFT JOIN FFUserShare us on u.FFUserID = us.FFUserID
LEFT JOIN FFEvent e on u.FFUserID = e.FFUserID
LEFT JOIN UserReferralView u1 ON u.FFUserID = u1.ReferrerID
LEFT JOIN UserReferralView u2 on u1.FFUserID = u2.ReferrerID AND u1.FFEventID = u2.FFEventID
LEFT JOIN UserReferralView u3 on u2.FFUserID = u3.ReferrerID AND u2.FFEventID = u3.FFEventID
LEFT JOIN FFUserStatistics st ON u.FFUserID = st.FFUserID
WHERE u.FirstName + ' ' + u.LastName like @UserName
AND u.Email like @Email
GROUP BY u.FFUserID, u.FirstName, u.LastName, u.Email, u.CreateDate, st.RewardBalance
ORDER by u.FFUserID asc

END

GO

USE [FanFueled]
GO

/****** Object:  StoredProcedure [dbo].[spEventOrganizerOrders]    Script Date: 02/08/2012 11:16:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spEventOrganizerOrders] 
@UserID as bigint,
@EventID as int,
@EventName as varchar(100),
@UserName as varchar(50)
AS
BEGIN
	SET NOCOUNT ON;		
IF @EventID = 0
	BEGIN	
		SELECT o.FFOrderID, o.FFUserID, u.FirstName, u.LastName, u.Email
		, o.CreateDate, oi.Quantity, tt.TicketName, tt.TicketPrice
		,e.FFUserID, e.FFEventID
		,(SELECT count(DISTINCT sh.FFUserShareID) from FFUserShare sh 
		where sh.FFUserID = o.FFUserID AND sh.FFEventID = e.FFEventID) as ShareCount
		, o.TotalDiscount, dc.DiscountCode, o.TotalProcessingFee, o.TotalSurcharge, oit.ServiceFee
		, count(DISTINCT u1.FFOrderID) as FirstLevelCount
		, count(DISTINCT u2.FFOrderID) as SecondLevelCount
		, count(DISTINCT u3.FFOrderID) as ThirdLevelCount
		,o.TotalCost
        , (SELECT sum(ov.TicketingFee) from OrderTicketsView ov WHERE ov.FFOrderID = o.FFOrderID and ov.TicketFeeIncluded=1 and ov.FFEventID = e.FFEventID) as TotalBakedInFees
		FROM FFOrder o
		INNER JOIN FFOrderItem oi on o.FFOrderID = oi.FFOrderID
		INNER JOIN FFUser u on o.FFUserID = u.FFUserID
		inner JOIN FFOrderItemTicket oit ON oi.FFOrderItemID = oit.FFOrderItemID
		inner join FFTicketType tt on oit.FFTicketTypeID = tt.FFTicketTypeID
		inner JOIN FFEvent e on tt.FFEventID = e.FFEventID
		LEFT JOIN FFDiscountCode dc on oit.FFDiscountCodeID = dc.FFDiscountCodeID
		LEFT JOIN UserReferralView u1 ON u.FFUserID = u1.ReferrerID AND u1.FFEventID = e.FFEventID
		LEFT JOIN UserReferralView u2 on u1.FFUserID = u2.ReferrerID AND u1.FFEventID = u2.FFEventID
		LEFT JOIN UserReferralView u3 on u2.FFUserID = u3.ReferrerID AND u2.FFEventID = u3.FFEventID
		where e.FFUserID = @UserID
		AND e.EventTitle like @EventName
		and u.FirstName + ' ' + u.LastName like @UserName
		GROUP BY o.FFOrderID, o.FFUserID, u.FirstName, u.LastName, u.Email
		 ,o.CreateDate,oi.Quantity, oi.FFOrderItemID, tt.TicketName
		 , tt.TicketPrice, e.FFUserID, e.FFEventID, o.TotalDiscount, dc.DiscountCode,
		 o.TotalProcessingFee, o.TotalSurcharge, oit.ServiceFee, o.TotalCost
		ORDER BY o.FFOrderID
	END
ELSE
	SELECT o.FFOrderID, o.FFUserID, u.FirstName, u.LastName, u.Email
	, o.CreateDate, oi.Quantity, tt.TicketName, tt.TicketPrice
	,e.FFUserID, e.FFEventID
	,(SELECT count(DISTINCT sh.FFUserShareID) from FFUserShare sh 
	where sh.FFUserID = o.FFUserID AND sh.FFEventID = e.FFEventID) as ShareCount
	, o.TotalDiscount, dc.DiscountCode, o.TotalProcessingFee, o.TotalSurcharge, oit.ServiceFee
	, count(DISTINCT u1.FFOrderID) as FirstLevelCount
	, count(DISTINCT u2.FFOrderID) as SecondLevelCount
	, count(DISTINCT u3.FFOrderID) as ThirdLevelCount
	,o.TotalCost
    , (SELECT sum(ov.TicketingFee) from OrderTicketsView ov WHERE ov.FFOrderID = o.FFOrderID and ov.TicketFeeIncluded=1 and ov.FFEventID = e.FFEventID) as TotalBakedInFees
	FROM FFOrder o
	INNER JOIN FFOrderItem oi on o.FFOrderID = oi.FFOrderID
	INNER JOIN FFUser u on o.FFUserID = u.FFUserID
	inner JOIN FFOrderItemTicket oit ON oi.FFOrderItemID = oit.FFOrderItemID
	inner join FFTicketType tt on oit.FFTicketTypeID = tt.FFTicketTypeID
	inner JOIN FFEvent e on tt.FFEventID = e.FFEventID
	LEFT JOIN FFDiscountCode dc on oit.FFDiscountCodeID = dc.FFDiscountCodeID
	LEFT JOIN UserReferralView u1 ON u.FFUserID = u1.ReferrerID AND u1.FFEventID = e.FFEventID
	LEFT JOIN UserReferralView u2 on u1.FFUserID = u2.ReferrerID AND u1.FFEventID = u2.FFEventID
	LEFT JOIN UserReferralView u3 on u2.FFUserID = u3.ReferrerID AND u2.FFEventID = u3.FFEventID
	where e.FFUserID = @UserID
			and e.FFEventID = @EventID
			AND e.EventTitle like @EventName
		and u.FirstName + ' ' + u.LastName like @UserName
	GROUP BY o.FFOrderID, o.FFUserID, u.FirstName, u.LastName, u.Email
	 ,o.CreateDate,oi.Quantity, oi.FFOrderItemID, tt.TicketName
	 , tt.TicketPrice, e.FFUserID, e.FFEventID, o.TotalDiscount, dc.DiscountCode,
	 o.TotalProcessingFee, o.TotalSurcharge, oit.ServiceFee, o.TotalCost
	 ORDER BY o.FFOrderID
END

GO

USE [FanFueled]
GO

/****** Object:  StoredProcedure [dbo].[spEventOrganizerPromoters]    Script Date: 02/08/2012 11:16:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spEventOrganizerPromoters] 
@UserID as bigint,
@EventID as int,
@PromoterName as varchar(100),
@PromoterEmail as nvarchar(50)
AS
BEGIN
	SET NOCOUNT ON;	
	IF @EventID = 0
	BEGIN	
	SELECT u.FFUserID, u.FirstName, u.LastName, u.Email, pev.TicketName, pev.TicketPrice, pev.TicketCount, pev.CommRate, pev.CommissionAmount
	from PromoterEventView pev
	inner JOIN FFUser u on pev.FFUserID = u.FFUserID
	where pev.FFUserID = @UserID
	AND u.Email like @PromoterEmail
	AND u.FirstName + ' ' +u.LastName like @PromoterName
	ORDER BY u.FFUserID
	END
	ELSE
		SELECT u.FFUserID, u.FirstName, u.LastName, u.Email,  pev.TicketName, pev.TicketPrice, pev.TicketCount, pev.CommRate, pev.CommissionAmount
	from PromoterEventView pev
	inner JOIN FFUser u on pev.FFUserID = u.FFUserID
	where pev.FFUserID = @UserID
	and pev.FFEventID = @EventID
	AND u.Email like @PromoterEmail
	AND u.FirstName + ' ' +u.LastName like @PromoterName
	ORDER BY u.FFUserID
END

GO

USE [FanFueled]
GO

/****** Object:  StoredProcedure [dbo].[spEventOrganizerRewards]    Script Date: 02/08/2012 11:17:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spEventOrganizerRewards] 
@UserID as bigint,
@EventID as int,
@EventName as varchar(100),
@UserName as varchar(50)
AS
BEGIN
	SET NOCOUNT ON;		
IF @EventID = 0
	BEGIN	
		SELECT DISTINCT otv.ffuserID, u.FirstName, u.LastName, u.Email, e.EventTitle, e.FFEventID
		,(SELECT count(DISTINCT sh.FFUserShareID) from FFUserShare sh where sh.FFUserID = otv.FFUserID AND sh.FFEventID = e.FFEventID) as ShareCount
		, count(DISTINCT u1.FFOrderID) as FirstLevelCount
		, (select sum(urv.totalcost) from UserReferralView urv WHERE urv.ReferrerID = otv.ffuserid and urv.FFEventID = e.FFEventID) as FirstLevelRevenue
		, count(DISTINCT u2.FFOrderID) as SecondLevelCount
		, sum(u2.totalcost) as SecondLevelRevenue
		, count(DISTINCT u3.FFOrderID) as ThirdLevelCount
		, sum(u3.totalcost) as ThirdLevelRevenue
		, (SELECT count(DISTINCT us.FFUserShareID) from FFUserShare us WHERE us.FFEventID = e.FFEventID AND us.FFUserID = otv.ffuserID AND us.ShareTypeID = 3) as TwitterShareCount
		, (SELECT count(DISTINCT us.FFUserShareID) from FFUserShare us WHERE us.FFEventID = e.FFEventID AND us.FFUserID = otv.ffuserID AND us.ShareTypeID IN (1,2)) as FBShareCount
		FROM OrderTicketsView otv
		INNER JOIN FFUser u on otv.ffuserid = u.FFUserID
		INNER JOIN FFEvent e ON otv.FFEventID = e.FFEventID
		LEFT JOIN UserReferralView u1 ON otv.FFUserID = u1.ReferrerID AND u1.FFEventID = otv.FFEventID
		LEFT JOIN UserReferralView u2 on u1.FFUserID = u2.ReferrerID AND u1.FFEventID = u2.FFEventID
		LEFT JOIN UserReferralView u3 on u2.FFUserID = u3.ReferrerID AND u2.FFEventID = u3.FFEventID
		WHERE e.FFUserID = @UserID
		AND e.EventTitle like @EventName
		and u.FirstName + ' '+ u.LastName like @UserName
		GROUP BY otv.ffuserID, u.FirstName, u.LastName, u.Email, e.EventTitle, e.FFEventID
		ORDER BY otv.FFUserID
	END
ELSE
	SELECT DISTINCT otv.ffuserID, u.FirstName, u.LastName, u.Email, e.EventTitle, e.FFEventID
		,(SELECT count(DISTINCT sh.FFUserShareID) from FFUserShare sh where sh.FFUserID = otv.FFUserID AND sh.FFEventID = e.FFEventID) as ShareCount
		, count(DISTINCT u1.FFOrderID) as FirstLevelCount
		, (select sum(urv.totalcost) from UserReferralView urv WHERE urv.ReferrerID = otv.ffuserid and urv.FFEventID = e.FFEventID) as FirstLevelRevenue
		, count(DISTINCT u2.FFOrderID) as SecondLevelCount
		, sum(u2.totalcost) as SecondLevelRevenue
		, count(DISTINCT u3.FFOrderID) as ThirdLevelCount
		, sum(u3.totalcost) as ThirdLevelRevenue
		, (SELECT count(DISTINCT us.FFUserShareID) from FFUserShare us WHERE us.FFEventID = e.FFEventID AND us.FFUserID = otv.ffuserID AND us.ShareTypeID = 3) as TwitterShareCount
		, (SELECT count(DISTINCT us.FFUserShareID) from FFUserShare us WHERE us.FFEventID = e.FFEventID AND us.FFUserID = otv.ffuserID AND us.ShareTypeID IN (1,2)) as FBShareCount
		FROM OrderTicketsView otv
		INNER JOIN FFUser u on otv.ffuserid = u.FFUserID
		INNER JOIN FFEvent e ON otv.FFEventID = e.FFEventID
		LEFT JOIN UserReferralView u1 ON otv.FFUserID = u1.ReferrerID AND u1.FFEventID = otv.FFEventID
		LEFT JOIN UserReferralView u2 on u1.FFUserID = u2.ReferrerID AND u1.FFEventID = u2.FFEventID
		LEFT JOIN UserReferralView u3 on u2.FFUserID = u3.ReferrerID AND u2.FFEventID = u3.FFEventID
		WHERE e.FFUserID = @UserID
		AND e.FFEventID = @EventID
		AND e.EventTitle like @EventName
		and u.FirstName + ' '+ u.LastName like @UserName
		GROUP BY otv.ffuserID, u.FirstName, u.LastName, u.Email, e.EventTitle, e.FFEventID
		ORDER BY otv.FFUserID
END

GO

USE [FanFueled]
GO

/****** Object:  StoredProcedure [dbo].[spEventOrganizerTotals]    Script Date: 02/08/2012 15:02:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spEventOrganizerTotals] 
@UserID as bigint,
@EventID as int,
@StartDate as datetime,
@EndDate as datetime
AS
BEGIN
	SET NOCOUNT ON;		
IF @EventID = 0
	BEGIN	
SELECT e.FFEventID, e.EventTitle
, (SELECT count(DISTINCT ov.FFOrderItemTicketID) from OrderTicketsView ov WHERE ov.FFEventID = e.FFEventID) as TicketsSold
, (SELECT sum(ov.TicketPrice) from OrderTicketsView ov WHERE ov.FFEventID = e.FFEventID) as TicketsRevenue
, (SELECT sum(ov.ServiceFee) from OrderTicketsView ov WHERE ov.FFEventID = e.FFEventID) as TotalServiceFees
, (select count(distinct sh.FFUserShareID) from FFUserShare sh where sh.FFEventID = e.FFEventID) as TotalShares
, (SELECT sum (ov.TicketingFee) from OrderTicketsView ov where ov.ffeventID = e.FFEventID AND ov.ticketfeeincluded = 1) as BakedInFees
, (SELECT sum (ov.TicketingFee) from OrderTicketsView ov where ov.ffeventID = e.FFEventID AND ov.ticketfeeincluded = 0) as FuelFees
, (SELECT sum(o.TotalCost) FROM FFOrder o WHERE o.FFOrderID IN (SELECT DISTINCT otv.FFOrderID FROM OrderTicketsView otv WHERE otv.FFEventID = e.FFEventID)) as TotalCost
, (select sum(u1.TotalCost) from UserReferralView u1 WHERE u1.FFEventID = e.FFEventID and u1.ReferrerID IN (select DISTINCT u2.FFUserID FROM UserReferralView u2 WHERE u2.FFEventID = e.FFEventID)) as ReferralRevenue
, (SELECT sum(o.TotalSurcharge) FROM FFOrder o WHERE o.FFOrderID IN (SELECT DISTINCT otv.FFOrderID FROM OrderTicketsView otv WHERE otv.FFEventID = e.FFEventID)) as TotalCCFees
, TotalCCOrderCost = CASE WHEN e.ProcessingFeesIncluded=1
  THEN (SELECT sum(ov.TicketPrice) FROM OrderTicketsView ov where ov.FFOrderID IN (select DISTINCT otv.FFOrderID from OrderTicketsView otv WHERE otv.FFEventID = e.ffeventid and otv.PaymentType = 'cc'))
  ELSE 0 END
, TotalSeperateFuelFeeCost = CASE WHEN e.ProcessingFeesIncluded=1
    THEN (SELECT sum(ov.TicketingFee) FROM OrderTicketsView ov where ov.FFOrderID IN (select DISTINCT otv.FFOrderID from OrderTicketsView otv WHERE otv.FFEventID = e.ffeventid and otv.PaymentType = 'cc') AND ov.TicketFeeIncluded=0)
  ELSE 0 END
, (SELECT sum(dbo.GetTicketDiscountAmount(ov.FFOrderItemTicketID)) FROM OrderTicketsView ov where ov.FFOrderID IN (select DISTINCT otv.FFOrderID from OrderTicketsView otv WHERE otv.FFEventID = e.ffeventid)) as TotalDiscounts

from FFEvent e
where e.FFUserID = @UserID
AND e.StartDateTime between @StartDate AND @EndDate
ORDER BY e.FFEventID
	END
ELSE
SELECT e.FFEventID, e.EventTitle
, (SELECT count(DISTINCT ov.FFOrderItemTicketID) from OrderTicketsView ov WHERE ov.FFEventID = e.FFEventID) as TicketsSold
, (SELECT sum(ov.TicketPrice) from OrderTicketsView ov WHERE ov.FFEventID = e.FFEventID) as TicketsRevenue
, (SELECT sum(ov.ServiceFee) from OrderTicketsView ov WHERE ov.FFEventID = e.FFEventID) as TotalServiceFees
, (select count(distinct sh.FFUserShareID) from FFUserShare sh where sh.FFEventID = e.FFEventID) as TotalShares
, (SELECT sum (ov.TicketingFee) from OrderTicketsView ov where ov.ffeventID = e.FFEventID AND ov.ticketfeeincluded = 1) as BakedInFees
, (SELECT sum (ov.TicketingFee) from OrderTicketsView ov where ov.ffeventID = e.FFEventID AND ov.ticketfeeincluded = 0) as FuelFees
, (SELECT sum(o.TotalCost) FROM FFOrder o WHERE o.FFOrderID IN (SELECT DISTINCT otv.FFOrderID FROM OrderTicketsView otv WHERE otv.FFEventID = e.FFEventID)) as TotalCost
, (select sum(u1.TotalCost) from UserReferralView u1 WHERE u1.FFEventID = e.FFEventID and u1.ReferrerID IN (select DISTINCT u2.FFUserID FROM UserReferralView u2 WHERE u2.FFEventID = e.FFEventID)) as ReferralRevenue
, (SELECT sum(o.TotalSurcharge) FROM FFOrder o WHERE o.FFOrderID IN (SELECT DISTINCT otv.FFOrderID FROM OrderTicketsView otv WHERE otv.FFEventID = e.FFEventID)) as TotalCCFees
, TotalCCOrderCost = CASE WHEN e.ProcessingFeesIncluded=1
  THEN (SELECT sum(ov.TicketPrice) FROM OrderTicketsView ov where ov.FFOrderID IN (select DISTINCT otv.FFOrderID from OrderTicketsView otv WHERE otv.FFEventID = e.ffeventid and otv.PaymentType = 'cc'))
  ELSE 0 END
, TotalSeperateFuelFeeCost = CASE WHEN e.ProcessingFeesIncluded=1
    THEN (SELECT sum(ov.TicketingFee) FROM OrderTicketsView ov where ov.FFOrderID IN (select DISTINCT otv.FFOrderID from OrderTicketsView otv WHERE otv.FFEventID = e.ffeventid and otv.PaymentType = 'cc') AND ov.TicketFeeIncluded=0)
  ELSE 0 END
, (SELECT sum(dbo.GetTicketDiscountAmount(ov.FFOrderItemTicketID)) FROM OrderTicketsView ov where ov.FFOrderID IN (select DISTINCT otv.FFOrderID from OrderTicketsView otv WHERE otv.FFEventID = e.ffeventid)) as TotalDiscounts
from FFEvent e
where e.FFUserID = @UserID
and e.FFEventID = @EventID
AND e.StartDateTime between @StartDate AND @EndDate
ORDER BY e.FFEventID
END

GO

USE [FanFueled]
GO

/****** Object:  View [dbo].[OrderTicketsView]    Script Date: 02/08/2012 11:17:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[OrderTicketsView]
AS
SELECT     dbo.FFTicketType.FFEventID, dbo.FFTicketType.TicketPrice, dbo.FFTicketType.TicketFeeIncluded, dbo.FFOrderItemTicket.FFOrderItemTicketID, 
                      dbo.FFOrderItemTicket.TicketingFee, dbo.FFOrderItem.FFOrderItemID, dbo.FFOrder.FFOrderID, dbo.FFOrder.TotalDiscount, dbo.FFOrder.PaymentType, 
                      dbo.FFOrder.FFUserID, dbo.FFOrder.TotalCost, dbo.FFOrderItemTicket.ServiceFee
FROM         dbo.FFOrder INNER JOIN
                      dbo.FFOrderItem ON dbo.FFOrder.FFOrderID = dbo.FFOrderItem.FFOrderID INNER JOIN
                      dbo.FFOrderItemTicket ON dbo.FFOrderItem.FFOrderItemID = dbo.FFOrderItemTicket.FFOrderItemID INNER JOIN
                      dbo.FFTicketType ON dbo.FFOrderItemTicket.FFTicketTypeID = dbo.FFTicketType.FFTicketTypeID

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "FFOrder"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "FFOrderItem"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 110
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FFOrderItemTicket"
            Begin Extent = 
               Top = 6
               Left = 458
               Bottom = 125
               Right = 648
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "FFTicketType"
            Begin Extent = 
               Top = 6
               Left = 686
               Bottom = 125
               Right = 862
            End
            DisplayFlags = 280
            TopColumn = 10
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2970
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderTicketsView'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OrderTicketsView'
GO

USE [FanFueled]
GO

/****** Object:  UserDefinedFunction [dbo].[GetTicketDiscountAmount]    Script Date: 02/08/2012 15:01:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetTicketDiscountAmount]
(
	-- Add the parameters for the function here
	@OrderItemTicketID int
)
RETURNS money
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ResultVar money,
	 @price money,
	 @amount money,
     @isDollar bit
	
	SELECT @price = tt.TicketPrice, @amount = isnull(dc.Amount,0), @isDollar = isnull(dc.IsDollarValue,0)
	FROM FFOrderItemTicket oit
	inner JOIN FFTicketType tt on oit.FFTicketTypeID = tt.FFTicketTypeID
	LEFT JOIN FFDiscountCode dc on oit.FFDiscountCodeID = dc.FFDiscountCodeID
	WHERE oit.FFOrderItemTicketID = @OrderItemTicketID
	
	IF @amount = 0
	BEGIN 
	RETURN 0
	END
	-- Return the result of the function
	IF @isDollar = 0
	BEGIN
		SET @ResultVar = @price * (@amount * .1)
	END
	ELSE
	BEGIN
		SET @ResultVar = @amount
    END
	
	RETURN @ResultVar

END

GO

USE [FanFueled]
GO

/****** Object:  View [dbo].[UserReferralView]    Script Date: 02/08/2012 11:18:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[UserReferralView]
AS
SELECT     dbo.FFOrder.FFOrderID, dbo.FFOrder.FFUserID, dbo.FFOrderItem.FFOrderItemID, dbo.FFOrderItemTicket.FFOrderItemTicketID, dbo.FFTicketType.FFTicketTypeID, 
                      dbo.FFTicketType.FFEventID, dbo.FFOrder.ReferrerID, 1 AS Counter, dbo.FFOrder.TotalCost
FROM         dbo.FFOrder INNER JOIN
                      dbo.FFOrderItem ON dbo.FFOrder.FFOrderID = dbo.FFOrderItem.FFOrderID INNER JOIN
                      dbo.FFOrderItemTicket ON dbo.FFOrderItem.FFOrderItemID = dbo.FFOrderItemTicket.FFOrderItemID INNER JOIN
                      dbo.FFTicketType ON dbo.FFOrderItemTicket.FFTicketTypeID = dbo.FFTicketType.FFTicketTypeID

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[21] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "FFOrder"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "FFOrderItem"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 110
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FFOrderItemTicket"
            Begin Extent = 
               Top = 6
               Left = 458
               Bottom = 125
               Right = 648
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FFTicketType"
            Begin Extent = 
               Top = 6
               Left = 686
               Bottom = 125
               Right = 862
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2385
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserReferralView'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UserReferralView'
GO

