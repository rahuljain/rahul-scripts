use FanFueled

select * from Badge
insert into Badge (FFEventID, BadgeName, BadgeDescription, PointGoal) values (0, 'Dada Life', 'Win lots of prizes!', 20000)

select * from BadgeAction where BadgeID=7
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'Census', 1, 30)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'FBLikeDadaLife', 2, 20)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'FBLikeWhiteWonderland', 4, 15)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'FBLikeFanFueled', 8, 10)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'FBLikeLightsAllNight', 16, 15)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'FBLikeWebsterHall', 32, 15)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'TwitterFollowDadaLife', 64, 15)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'TwitterFollowInsomniacPresents', 128, 15)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'TwitterFanFueled', 256, 10)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'TweetDadaMusic', 512, 30)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'TweetDadaFavItem', 1024, 15)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'TweetDadaYouTubeChannel', 2048, 20)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'FBWallPostDadaMostRecentVideo', 4096, 20)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'FBWallPostDadaResolution', 8192, 50)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'FBWallPostDada', 16384, 15)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'FBWallPostDadaSpotify', 32768, 15)
insert into BadgeAction (BadgeID,ActionName,ActionValue,ActionPoints) values (7, 'FBWallPostDadaSongkick', 65536, 20)

select * from BadgeReward where BadgeID=7
insert into BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
values (7, 'Grand Prize', 'diamond', 'Dance on stage in banana costumes, you + 1 and VIP tickets to Winter Wonderland event, and a meet and greet with dada life backstage!', 20000, 1)
insert into BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
values (7, '1st Runner Up', 'gold', '1 hoodie, 1 shirt, 1 pacifier, 1 item signed inflatable banana each', 800, 1)
insert into BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
values (7, '2nd Runner Up', 'platinum', 'the Dada Life Survival kit: bananas, pacifiers, tattoos', 700, 1)
insert into BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
values (7, '3rd Runner Up', 'signedBanana', 'You are sent a signed banana...literally a banana signed by Dada Life!', 590, 1)
insert into BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
values (7, '4th Runner Up', 'shoutout', 'Dada Life picks 5 winners and gives them a shoutout on a Follow Friday on Twitter', 500, 5)
insert into BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
values (7, '5th Runner Up', 'tshirt', 'Dada Life T-Shirt!', 440, 20)
insert into BadgeReward (BadgeID, RewardName, RewardTag, RewardDescription, Points, Available)
values (7, '6th Runner Up', 'download', 'A free Dada Life single dowload!', 390, 100000)

select * from SocialMessage
insert into SocialMessage (SocialMessageType, SocialMessageContent) values ('TweetDadaMusic', 'Dada Life Music')
insert into SocialMessage (SocialMessageType, SocialMessageContent) values ('TweetDadaFavItem', 'Dada Life Items: http://thegreatfashionistaswindle.com/shop/body.php?module=store&id=212')
insert into SocialMessage (SocialMessageType, SocialMessageContent) values ('TweetDadaYouTubeChannel', 'Dada Life YouTube Channel: http://www.youtube.com/user/wwwDADALIFEcom/featured')

