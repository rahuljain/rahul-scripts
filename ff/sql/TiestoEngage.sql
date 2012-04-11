select * from EN_Program

insert into EN_Program (Name, Description, CreatedDate, Enabled, Subdomain, StartDate, GoogleAnalyticsID)
values
('Tiesto', 'Tiesto FanFueled Engage Program', GETDATE(), 1, 'tiesto', GETDATE(), 'UA-29850058-5')

insert into EN_Action (ProgramID, ActionTypeID, DisplayName, Description, Enabled, CreatedDate, Points, ActionData, HasReferralPoints, IsRepeatable, StartDate, EndDate, OrderIndex) values 
(8, 1, 'Refer-a-friend and you will earn 5% of your referral''s total points.', 'Refer a friend to FanFueled''s Engage Platform by posting this link to your Wall. You will earn 5% of all of your referral''s total points. If your referrals get their friends to sign up, you will receive 5% of their total points, too. That''s because FanFueled''s patented ''Share, Track, Reward'' software tracks your influence across multiple degrees of separation and rewards you for it.', 1, GETDATE(), 5, 'description=Sign up for Tiësto Engage for a chance to win exclusive prizes and experiences, like a trip to see Tiësto perform at XS in Vegas .;link=https://fanfueledengage.com/tiesto;name=Tiesto', 0, 1, '4/9/2012', NULL, 2),
(8, 6, 'Refer-a-friend and you will earn 5% of your referral''s total points.', 'Refer a friend to FanFueled''s Engage Platform by posting this link to your Twitter feed. You will earn 5% of all of your referral''s total points. If your referrals get their friends to sign up, you will receive 5% of their total points, too. That''s because FanFueled''s patented ''Share, Track, Reward'' software tracks your influence across multiple degrees of separation and rewards you for it.', 1, GETDATE(), 5, 'Sign up for Tiësto Engage for a chance to win exclusive prizes and experiences, like a trip to see Tiësto perform at XS in Vegas .', 0, 1, '4/9/2012', NULL, 3),
(8, 2, 'Like Tiësto on Facebook', '', 1, GETDATE(), 100, 'https://www.facebook.com/tiesto', 0, 0, '4/9/2012', NULL, NULL),
(8, 2, 'Like Musical Freedom on Facebook', '', 1, GETDATE(), 100, 'http://www.facebook.com/musicalfreedom', 0, 0, '4/9/2012', NULL, NULL),
(8, 5, 'Follow Tiësto on Twitter.', '', 1, GETDATE(), 100, 'http://twitter.com/tiesto', 0, 0, '4/9/2012', NULL, NULL),
(8, 1, 'Share Tiësto''s tour schedule with your friends.', '', 1, GETDATE(), 150, 'description=Check out Tiësto''s upcoming tour schedule.;link=http://www.tiesto.com/Tiesto-tours;name=Tiesto', 1, 0, '4/9/2012', '4/11/2012', 1),
(8, 6, 'Retweet Tiësto''s latest tweet about his ClubLife podcast.', '', 1, GETDATE(), 50, '189357868317810691', 0, 0, '4/9/2012', '4/11/2012', 1),
(8, 5, 'Follow Musical Freedom on Twitter.', '', 1, GETDATE(), 100, 'https://twitter.com/musicalfreedom', 0, 0, '4/11/2012', '4/12/2012', 1),
(8, 8, 'Watch this video of Tiësto''s new track, "Chasing Summers."', '', 1, GETDATE(), 200, 'http://www.youtube.com/watch?v=0EYSi2iD4yA&list=UUPk3RMMXAfLhMJPFpQhye9g&index=2&feature=plcp', 0, 0, '4/11/2012', '4/12/2012', 1),
(8, 1, 'Share Tiësto''s official online store with your friends.', '', 1, GETDATE(), 150, 'description=Check out Tiësto''s awesome online store!;link=http://shoptiesto.com/);name=Tiesto', 1, 0, '4/12/2012', '4/13/2012', 1),
(8, 6, 'Tweet @Tiësto with #ClubLifeVol2.', '', 1, GETDATE(), 100, 'Can''t wait for @tiesto''s new album out on 4/24. #ClubLifeVol2. ', 0, 0, '4/12/2012', '4/13/2012', 1),
(8, 9, 'Check out this great article on ArtistDirect.com about Tiësto.', '', 1, GETDATE(), 50, 'http://www.artistdirect.com/entertainment-news/article/ti-sto-talks-club-life-volume-2-ultra-music-festival-app-soccer-and-his-first-club-experience/9910655', 0, 0, '4/13/2012', '4/14/2012', 1),
(8, 1, 'Share the Club Life Volume 2 website with your friends.', 'Post the Club Life Volume 2 site to your Wall and earn an additional 50 points for every ''Like'' your post receives. ', 1, GETDATE(), 150, 'link=https://fanfueledengage.com/tiesto;name=Tiesto', 1, 0, '4/13/2012', '4/14/2012', 1)


insert into EN_Reward (ProgramID, Name, Description, CreatedDate, EndDate, Enabled, Points, Quantity, SubtractsPoints) values 
(8, 'Win a VIP Trip for You & a Friend to See Tiësto Perform at XS at the Wynn in Las Vegas! ', 'Win the ultimate Tiësto fan experience. The GRAND PRIZE winner will win 2 VIP tickets to see Tiësto perform at XS at the Wynn in Las Vegas. This unbelievable prize includes roundtrip airfare, transportation, a hotel room at the Wynn, a comped meal at the Wynn, and 2 VIP tickets. Once you earn 10,000 points on Tiësto Engage, you are automatically entered into an exclusive raffle to win this prize. The drawing will be held at a date TBD. (Note: Airfare is only for players within the continental United States).  ', GETDATE(), NULL, 1, 15000, 1, 0),
(8, 'Win a Pair of Tickets to the Tiësto Show of your Choice!', 'Win a pair of tickets to see the Tiësto show of your choice. Check out his calendar for upcoming tour dates: http://www.tiesto.com/Tiesto-tours. The player at the top of the leader board at the end of Tiësto Engage will win this prize.', GETDATE(), NULL, 1, 20000, 1, 0),
(8, 'Win a Signed Club Life Volume 2 Album and T-Shirt.', 'Win a signed ''Club Life Volume 2'' album and t-shirt! This prize will go to players 2 through 11 at the top of the leader board when Tiësto Engage ends. ', GETDATE(), NULL, 1, 20000, 10, 0),
(8, 'Win a Deluxe Copy of Club Life Volume 2.', 'Win a Deluxe Copy of Club Life Volume 2. If you redeem this prize, 10,000 points will be subtracted from your total.', GETDATE(), NULL, 1, 10000, 15, 1),
(8, 'Win a Shout Out on Tiësto official Twitter page.', 'Win a shout out on Tiësto''s official Twitter page. If you redeem this prize, 8,500 points will be subtracted from your total.', GETDATE(), NULL, 1, 8500, 10, 1)

select * from EN_Reward where ProgramID=8
select * from EN_RewardImage order by RewardID

insert into EN_RewardImage (RewardID, Path, IsPrimary) values
(256, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-prizes/FINAL_Large_cxx.jpg', 1),
(256, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-prizes/FINAL_Med_image.jpg',1),
(257, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-prizes/Tiesto_Ticket_Large_image.png', 1),
(257, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-prizes/Tiesto_Ticket_Med_image.png', 1),
(258, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-prizes/tiesto_cl2cdsigned_Large_blackbg.jpg', 1),
(258, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-prizes/tiesto_cl2cdsigned_Med_blackbg.jpg', 1),
(259, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-prizes/tiesto_cl2cd_Large_clearbg.png', 1),
(259, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-prizes/tiesto_cl2cd_Med_clearbg.png', 1),
(260, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-prizes/Tiesto_Twitter_Large_image.png', 1),
(260, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-prizes/Tiesto_Twitter_Med_image.png', 1)

select * from EN_Image where ProgramID=8

insert into EN_Image (ImageTypeID, ProgramID, Path) values
(10, 8, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-banners/flyaway_header_1200x400_v2.jpg'),
(13, 8, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-banners/flyaway_header_1200x400_v2.jpg')