/****** Script for SelectTopNRows command from SSMS  ******/
use FanFueled

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, '25% Off Coupon Code for select events', 'discount25', 'Keep sharing to earn the Diamond Package!', 500, 100000)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Ticket to Wobble Wednesday', 'wobbleWednesdayTkt', 'Keep sharing to earn the Diamond Package!', 1000, 100000)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, '50% Off Coupon Code for select events', 'discount50', 'Keep sharing to earn the Diamond Package!', 1000, 100000)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'ALBUM', 'anyAlbum', 'Any album from Base Trip Records x The Brain Trust catalog. Keep sharing to earn the Diamond Package!', 2000, 50)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Signed Gardo Hand Made Print', 'gardoPrint', 'Glossy 11 x 17 Hand Made Show Print (by Gardo). Keep sharing to earn the Diamond Package!', 2000, 50)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'One ticket to any Brain Trust show', 'oneticket', 'You just earned yourself one ticket!', 2000, 35)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Brain Trust x Base Trip Records T-Shirt', 'brainTrustTee', 'Keep sharing to earn the Diamond Package!', 3000, 35)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Month Pass to Wobble', 'monthPassWobble', 'Keep sharing to earn the Diamond Package!', 3000, 30)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Two tickets to any Brain Trust show', 'twotickets', 'You just earned yourself two tickets!', 4000, 25)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Signed copy of album', 'oneCDSigned', 'Keep sharing to earn the Diamond Package!', 4000, 25)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Signed Gardo Hand Made Print', 'gardoFramed', 'Signed and Framed 11 x 17 Hand Made Print by Gardo [Signed]!', 5000, 20)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Artist Meet and Greet', 'meet', 'You helped spread the word, now you are going to meet the artists! Keep sharing and you will get the Diamond Package in no time!', 7500, 15)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Gold Package', 'gold', '2 tickets to 2 events, 2 signed posters, TBT package!', 16000, 20)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'VIP Wobble Wednesday', 'vipWobble', 'Bottle, booth, waitress and entry for you and 4 friends. T-Shirt / Signed album of your choice, flash drive with all TBT music!', 20000, 5)

INSERT INTO BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
VALUES (5, 'Diamond Package', 'diamond', '2 tickets to 4 events of your choice (8 tickets), 4 signed prints, TBT shirt, FanFueled Hoodie, poster!', 22000, 1)

select * from BadgeReward where BadgeID=5
