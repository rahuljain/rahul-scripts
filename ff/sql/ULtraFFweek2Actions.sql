

--(6, 1, 'PostFFEngagePrize', 'Tell us about the FanFueled Engage prize you''re most excited about by posting the answer to your Wall.', 'What FanFueled Engage prize are you going after?', 1, GETDATE(), 150, '')

insert into EN_Action (ProgramID, ActionTypeID, Name, DisplayName, Description, Enabled, CreatedDate, Points, ActionData)
values 
(6, 2, 'LikeKaskade', 'Like Kaskade', 'Like Kaskade on Facebook', 1, GETDATE(), 100, 'http://www.facebook.com/kaskade/61011643972'),
(6, 2, 'LikeSkrillex', 'Like Skrillex', 'Like Skrillex on Facebook', 1, GETDATE(), 100, 'http://www.facebook.com/skrillex/119702488081975'),
(6, 5, 'FollowKraftwerk', 'Follow Kraftwerk ', 'Follow Kraftwerk on Twitter', 1, GETDATE(), 100, 'KRAFTWERK'),
(6, 1, 'PostCarlCoxInterview', 'Share this link to an interview with Carl Cox at Ultra 2011', 'This link will be posted to your wall: http://www.nme.com/nme-video/youtube/id/10WXB8F4Zqg', 1, GETDATE(), 100, 'description=Check out this interview with Carl Cox at Ultra 2011:;link=http://www.nme.com/nme-video/youtube/id/10WXB8F4Zqg'),
(6, 6, 'TweetUltraPhotoGallery', 'Tweet out Ultra''s photo gallery to your friends.', 'This is what appears on the tweet: Check out these awesome photos from Ultra: http://www.ultramusicfestival.com/photo-gallery/)', 1, GETDATE(), 150, 'Check out these awesome photos from Ultra: http://www.ultramusicfestival.com/photo-gallery/'),
(6, 7, 'ReTweetUltra', 'Retweet Ultra Music Festival''s latest tweet about CAN U FEEL IT.', 'You will be Retweeting https://twitter.com/#!/ultramusic/status/179650870961635328', 1, GETDATE(), 50, '179650870961635328'),
(6, 8, 'WatchUltra2011', 'Relive Ultra 2011 with this video from last year''s festival', '', 1, getdate(), 200, 'http://www.youtube.com/watch?v=iWXOOWOFRow&list=FLndfUzXCcrgdE4ecZhr79yw&index=4&feature=plpp_video'),
(6, 11, 'DonateKeepABreastFoundation', 'Donate to the Keep-a-Breast Foundation and earn 20 points for every $1 spent.', 'A participant in the Ultra Eco Village, the Keep-a-Breast Foundation seeks to help eradicate breast cancer by exposing young people to methods of prevention, early detection and support.', 1, GETDATE(), 150, ''),
(6, 11, 'DonateBestBuddies', 'Donate to Best Buddies and earn 20 points for every $1 spent.', 'A participant in the Ultra Eco Village, Best Buddies is dedicated to creating opportunities for one-to-one friendships, integrated employment and leadership development for people with intellectual and developmental disabilities.', 1, GETDATE(), 150, '')

insert into EN_Action (ProgramID, ActionTypeID, Name, DisplayName, Description, Enabled, CreatedDate, Points, ActionData)
values 
(1, 2, 'LikeCampBisco', 'Like our new Engage partner, Camp Bisco, on Facebook.', 'https://www.facebook.com/campbiscofanpage', 1, GETDATE(), 100, ' https://www.facebook.com/campbiscofanpage/266601769299')

insert into EN_Action (ProgramID, ActionTypeID, Name, DisplayName, Description, Enabled, CreatedDate, Points, ActionData)
values 
(1, 1, 'PostFanFueledPrize', 'Tell us about the FanFueled Engage prize you''re most excited about by posting the answer to your Wall.', 'What FanFueled Engage prize are you going after?', 1, GETDATE(), 150, '')

insert into EN_Action (ProgramID, ActionTypeID, Name, DisplayName, Description, Enabled, CreatedDate, Points, ActionData)
values 
(1, 1, 'PostHypebot', 'Share this recent article about us in Hypebot with your friends.', 'In addition to your message, this will be posted on your wall: Hey, everyone check out this great article on FanFueled in Hypebot: http://bit.ly/zDwbVn).', 1, GETDATE(), 150, 'message=Hey, everyone check out this great article on FanFueled in Hypebot:;link=http://bit.ly/zDwbVn')

insert into EN_Action (ProgramID, ActionTypeID, Name, DisplayName, Description, Enabled, CreatedDate, Points, ActionData)
values 
(1, 9, 'FFPartnerPressRelease', 'Check out the press release on our newest partners, The Roxy, Ultra, Camp Bisco, and LXM Pro.', 'http://news.yahoo.com/world-renowned-roxy-major-festivals-flock-fanfueled-150059195.html', 1, GETDATE(), 150, 'http://fanfueled.wordpress.com/2012/03/15/quick-tutorial-on-the-new-fanfueled-com')

insert into EN_Action (ProgramID, ActionTypeID, Name, DisplayName, Description, Enabled, CreatedDate, Points, ActionData)
values 
(1, 7, 'ReTweetFFPressRelease', 'Retweet FanFueled''s latest tweet about our new press release.', 'You will be Retweeting: https://twitter.com/#!/FanFueled/status/179719889643253760', 1, GETDATE(), 50, '179719889643253760')