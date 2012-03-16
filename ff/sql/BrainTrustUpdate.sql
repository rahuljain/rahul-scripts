use FanFueled

update BadgeAction set ActionPoints=30 where ActionName='TwitterFollowBrainTrust' and BadgeID=4
update BadgeAction set ActionPoints=10 where ActionName='FacebookLikeBaseTripRecords' and BadgeID=4
update BadgeAction set ActionPoints=10 where ActionName='TwitterFollowFF' and BadgeID=4
update BadgeAction set ActionPoints=10 where ActionName='FacebookLikeFF' and BadgeID=4
update BadgeAction set ActionName='FacebookWallPost' where ActionName='FacebookWallPostFavLiveEvent' and BadgeID=4
update BadgeAction set ActionPoints=10 where ActionName='FacebookWallPost' and BadgeID=4

delete from BadgeAction where ActionName='FacebookLikeMicahRaps' and BadgeID=4
delete from BadgeAction where ActionName='Census' and BadgeID=4
delete from BadgeAction where ActionName='FacebookWallPostFavMusicVenue' and BadgeID=4
delete from BadgeAction where ActionName='FacebookWallPostNewYearResolution' and BadgeID=4
select * from BadgeAction where BadgeID=4 order by ActionValue

select * from SocialMessage

select * from BadgeReward where BadgeID=4
update BadgeReward set RewardTag='brainTrustTee' where BadgeID=4 and RewardTag='brianTrustTee'
update BadgeReward set RewardDescription='One ticket to any Brain Trust show!' where BadgeID=4 and BadgeRewardID=67
update BadgeReward set RewardDescription='Two tickets to any Brain Trust show!' where BadgeID=4 and BadgeRewardID=70
update BadgeReward set RewardName='Brain Trust x Base Trip T' where BadgeID=4 and BadgeRewardID=68
update BadgeReward set RewardDescription='Brain Trust x Base Trip Records T-shirt' where BadgeID=4 and BadgeRewardID=68


select * from RewardRemption

delete from RewardRemption where FFUserID=14648
delete from BadgeReward where BadgeID=4

select * from FFUserBadge where BadgeID=4

delete from FFUserBadge where FFUserID=14648