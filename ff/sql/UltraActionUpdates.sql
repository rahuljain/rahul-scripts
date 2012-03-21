select * from EN_Action where ProgramID=6

insert into EN_Action (ProgramID, ActionTypeID, Name, DisplayName, Description, Enabled, CreatedDate, Points, ActionData)
values 
(6, 2, 'LikeWolfgangGartner', 'Like Wolfgang Gartner on Facebook.', '', 1, GETDATE(),  100, 'http://www.facebook.com/djwolfganggartner/51203778235'),
(6, 5, 'FollowBassnectar', 'Follow Bassnectar on Twitter.', '', 1, GETDATE(),  100, 'bassnectar'),
(6, 7, 'ReTweetCanUFeelItGiveaway', 'Retweet our tweet about a CAN U FEEL IT giveaway.', '', 1, GETDATE(),  50, '181504993046700033'),
(6, 8, 'WatchUltraTimeLapse', 'Watch this awesome time-lapse video from Ultra 2011.', '', 1, GETDATE(),  200, 'http://www.youtube.com/watch?v=wVrGS7A-UjQ&list=PL48FC2602F2ABCFD9&index=3&feature=plpp_video'),
(6, 9, 'CanUFeelItFathomEvents', 'Check out CAN U FEEL IT on Fathom Events for premier info.', 'Check out Fathom Events for info on where CAN U FEEL IT is playing near you.', 1, GETDATE(),  50, 'http://www.fathomevents.com/concerts/event/canufeelit.aspx?d=3/22/2012'),
(6, 11, 'DonateLifebeat', 'Donate to Lifebeat and earn 20 points for every $1 spent.', 'A participant in Ultra''s Eco Village, Lifebeat is a non-profit organization the fosters HIV/AIDS prevention by mobilizing the music industry.', 1, GETDATE(), 20, ''),

(1, 2, 'LikeComedyBar', 'Like The Comedy Bar on Facebook.', '', 1, GETDATE(), 100, 'http://www.facebook.com/TCBChicago/245698475454130'),
(1, 11, 'DonateASAPFoundation', 'Donate to the ASAP Foundation and earn 20 points for every $1 spent.', 'Since its inception in 2004, the ASAP Foundation’s primary goal has been to provide scholarships for disadvantaged students to help them succeed.', 1, GETDATE(), 20, ''),
(1, 1, 'PostNewLandingPage', 'Post our new ticketing landing page to your Wall.', '', 1, GETDATE(), 100, 'description=Check out FanFueled''s new ticketing landing page.;link=http://www.fanfueled.com/Home/FrontPage'),
(1, 9, 'CheekyChicago', 'Check out Cheeky Chicago and purchase a Cheeky Card.', '', 1, GETDATE(), 50, 'http://cheekychicago.com/'),
--(1, 6, 'TweetSummerEvent', 'Tweet us the event you''re looking forward to this summer and include #Engage.', '', 1, GETDATE(), 200, ''),
(1, 1, 'PostFathomEvents', 'Check out Fathom Events for info on where CAN U FEEL IT is playing near you.', '', 1, GETDATE(), 50, 'description=Check out CAN U FEEL IT on Fathom Events.;link=http://www.fathomevents.com/concerts/event/canufeelit.aspx?d=3/22/2012'),
(1, 7, 'ReTweetNewFFLayout', 'Retweet our tweet about FanFueled''s new layout.', '', 1, GETDATE(), 20, '180440832212598784')
--(1, 10, 'Buy51BassCampTicket', 'Buy a Ticket to 51BassCamp.', '51BassCamp will be held on August 25th, 2012 at Maple Ski Ridge in Rotterdam NY.', 0, GETDATE(), 200, 'http://www.fanfueled.com/Event/Details/1916-51basscamp-2012')