use FanFueled

insert into Badge (FFEventID, BadgeName, BadgeDescription, PointGoal)
values (0, 'Bluegrass', 'Win lots of prizes!', 20000)

select * from Badge

--signup actions
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'Census', 1, 50)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBLikeCBBfestival', 2, 10)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBLikeGroupon', 4, 5)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBLikeDriveByTruckers', 8, 10)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBLikeSilverWrapper', 16, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBLikeDawes', 32, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBLikeChicagoReader', 64, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBLikeLastfm', 128, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBLikeFanFueled', 256, 5)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBLikeCoslive', 512, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBLikeJambase', 1024, 15)

insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBJoinGroupKingtello', 2048, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBJoinGroupReactPresents', 4096, 15)

insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TwitterFollowCBBFestival', 8192, 5)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TwitterFollowRelix', 16384, 5)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TwitterFollowDriveByTruckers', 32768, 10)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TwitterFollowReactPresents', 65536, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TwitterFollowSilverWrapper', 131072, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TwitterFollowDawes', 262144, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TwitterFollowChicagoReader', 524288, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TwitterFollowLastfm', 1048576, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TwitterFollowFanFueled', 2097152, 5)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TwitterFollowCoslive', 4194304, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TwitterFollowJambase', 8388608, 15)

insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'FBWallPostReactPresentsShow', 16777216, 15)
insert into BadgeAction (BadgeID, ActionName, ActionValue, ActionPoints) values(5, 'TweetFavCBBBand', 33554432, 15)

select * from BadgeAction where BadgeID=5


--Rewards
INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'CBB Posters', 'CBBPosters', 'Keep sharing to earn the Diamond Package!', 1000, 100000)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'CBB Band T-Shirts', 'CBBShirts', 'Keep sharing to earn the Diamond Package!', 2250, 50)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'FanFueled Hat', 'FFHat', 'Keep sharing to earn the Diamond Package!', 2000, 10)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Band Meet-and-Greet', 'meet', 'Keep sharing to earn the Diamond Package!', 2750, 10)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, '1 Ticket for 1 Day', 'oneTicket', '1 Ticket for 1 Day', 3000, 4)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, '2 Tickets for 1 Event', 'twoTickets', '2 Tickets for 1 Event', 3500, 3)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, '1 Weekend Pass', 'weekendPass', '1 Weekend Pass!', 3750, 2)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, '2 Two Weekend Pass', 'twoWeekendPass', '2 Two Weekend Pass!', 4000, 1)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Gold Package', 'gold', '2 Tickets to 1 React Presents, Kingtello, or Silver Wrapper events (terms and conditions apply). CBB Shirt and FanFueled Hat!', 10000, 1)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Platinum Package', 'platinum', '2 tickets to 3 React Presents, Kingtello, or Silver Wrapper events of your choice over the next year (terms and conditions apply). CBB shirt and FanFueled shirt!', 12500, 1)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Diamond Package', 'diamond', '2 tickets to 4 React Presents, Kingtello, or Silver Wrapper events of your choice over the next year (terms and conditions apply). CBB shirt and FanFueled Hoodie!', 15000, 1)

select * from BadgeReward where BadgeID=5
