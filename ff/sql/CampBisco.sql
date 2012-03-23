--select * from EN_Reward
select * from EN_Program

--add the program
insert into EN_Program (Name, Description, CreatedDate, Enabled, Subdomain)
values
('Camp Bisco', 'Camp Bisco', GETDATE(), 0, 'campbisco')

--Rewards
insert into EN_Reward (ProgramID,Name,Description,CreatedDate,Enabled,Points,Quantity,SubtractsPoints)
values
(7, 'Win a Pair of Camp Bisco Weekend Passes', 'Camp Bisco is consistently one of the premier music festivals of the year and this is your chance to win a pair of free passes to this can’t-miss event. The top three players at the end of Camp Bisco Engage will win the passes. The platform ends 7/9/12 at 11.59PM EST.', GETDATE(), 1, 30000, 3, 0),
(7, 'Dance on Stage with The Disco Biscuits', 'Make sure to wear your dancing shoes, because you could be up on stage dancing with The Disco Biscuits at this year’s festival! Once you hit 25,000 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.', GETDATE(), 1, 25000, 1, 0),
(7, 'Win a Free Long-Distance Shuttle Pass', 'Let’s face it. To have as much fun as we do, we’ve got to get out and away from it all. This prize gets you free access to a long-distance shuttle from Albany, Baltimore, Boston, Buffalo, Burlington, NYC, and Philly, as well as prime camping space with room for 3 campers. Once you hit 23,500 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.', GETDATE(), 1, 23500, 10, 0),
(7, 'Win a Pair of VIP Upgrades for your Camp Bisco Tickets', 'Experience Camp Bisco in style with these VIP upgrades. With a separate entrance, VIP only showers, heavily discounted drinks, and plenty more, VIP is the only way to go! Once you hit 22,000 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.', GETDATE(), 1, 22000, 2, 0),
(7, 'Win a Camp Bisco Artist Meet-and-Greet', 'You know how you’ve always wanted to ask your favorite artist about his favorite food while you shake his favorite hand? Now is your chance! Camp Bisco Engage gives you the opportunity to meet and greet one of the artists performing at the festival. Once you hit 21,500 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.', GETDATE(), 1, 21500, 5, 0),
(7, 'Win a Golf Cart Ride around the Camp Grounds with Marc Brownstein of The Disco Biscuits', 'Tired of walking all the way across the festival grounds? Then hop in your very own golf cart and take a ride across Camp Bisco with Marc Brownstein from The Disco Biscuits. Once you hit 21,500 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.', GETDATE(), 1, 21000, 2, 0),
(7, 'Win a Camp Bisco 11 Poster Signed by The Disco Biscuits and More!', 'Never forget the memories from Camp Bisco Eleven with this poster, autographed by The Disco Biscuits and more of your favorite artists! Once you hit 20,000 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.', GETDATE(), 1, 20000, 10, 0),
(7, 'Win an Official Camp Bisco 2012 Hoodie', 'What’s better than great Camp Bisco swag? FREE Camp Bisco swag! Let all your friends know what you did this summer by rocking this sweet Camp Bisco hoodie.', GETDATE(), 1, 18000, 10, 1),
(7, 'Win a Car Camping Pass', 'There’s nothing like a road trip with the buds, especially when you’re headed to Camp Bisco. Take advantage of this free car camping pass and keep your ride close by all weekend.', GETDATE(), 1, 18000, 10, 1),
(7, 'Win an Official Camp Bisco 2012 T-Shirt', 'Own the catwalk (or your poli sci lecture) with this official Camp Bisco t-shirt. Keep Engaging to earn even better prizes!', GETDATE(), 1, 17500, 25, 1),
(7, 'Win a Camp Bisco 2012 Poster', 'The last thing you want to see naked is your wall. Dress up your room with this official Camp Bisco 2012 poster!', GETDATE(), 1, 15000, 50, 1),
(7, 'Win a Free Music Download from The Disco Biscuits', 'Don’t stop the rock! Keep the bangin’ tunes of The Disco Biscuits with you always with these great song downloads.', GETDATE(), 1, 15000, 50, 1),
(7, 'Win Free Phone Wall Paper', 'Relive Camp Bisco 2012 every time you get a text message with this sweet phone wall paper.', GETDATE(), 1, 135000, 250, 1)


--Actions
insert into EN_Action (ProgramID, ActionTypeID, DisplayName, Description, Enabled, CreatedDate, Points, ActionData, IsRepeatable) values 
(7, 2, 'Like Camp Bisco on Facebook.', '', 1, GETDATE(), 100, 'https://www.facebook.com/campbiscofanpage/266601769299', 0),
(7, 2, 'Like MCP Presents on Facebook.', '', 1, GETDATE(), 100, 'https://www.facebook.com/mcppresents/100000732917320', 0),
(7, 2, 'Like The Disco Biscuits on Facebook.', '', 1, GETDATE(), 100, 'https://www.facebook.com/16142418135', 0),
(7, 1, 'Post your favorite Camp Bisco Story from years past to your Wall.', 'Tell us about your favorite Camp Bisco memory and you will receive an additional 50 points for every ''Like'' your post receives. ', 1, GETDATE(), 150, 'description=Post your favorite Camp Bisco Story from years past to your Wall.', 0),
(7, 1, 'When it comes to Camp Bisco 2012, what are you most excited for? ', 'Tell us what you''re most looking forward to for Camp Bisco 2012 and you will receive an additional 50 points for every ''Like'' your post receives. ', 1, GETDATE(), 150, 'description=With Camp Bisco 2012, what are you most excited for?', 0),
(7, 2, 'Refer-a-friend and you''ll earn points when someone joins FanFueled Engage via your link and completes 1 action.', 'Refer a friend to Camp Bisco Engage. You will be rewarded with 200 points every time someone joins via your link and completes at least one action. If your friend joins the program and then invites one of his or her friends, you will receive 100 points once they sign up. If the friend-of-a-friend gets someone to sign up, you receive another 100 points. Due to FanFueled''s patented ''Share, Track, Reward'' software, your influence is tracked and rewarded across multiple degrees of separation.', 1, GETDATE(), 200, 'Post your Camp Bisco referral link to your Wall and you will earn 200 points when a friend signs and completes 1 action.', 1),
(7, 6, 'Tweet the artist you''re most excited to see at Camp Bisco 11 and include #CampBisco', '', 1, GETDATE(), 150, 'Tweet the artist you''re most excited to see at Camp Bisco 11 and include #CampBisco', 0),
(7, 8, 'Watch the official Camp Bisco X Aftermath Trailer!', '', 1, GETDATE(), 200, 'http://www.youtube.com/watch?v=PMYBuIuBjvg', 0),
(7, 11, 'Donate to Headcount and help register more voters! ', 'Headcount registers voters at concerts and make civic participation part of the live music experience.', 1, GETDATE(), 20, '', 1)

--Images
select * from EN_Reward where ProgramID=7
select * from EN_RewardImage
insert into EN_RewardImage (RewardID, Path, IsPrimary)
values
(231, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/DanceonStage_Large_357x230.jpg', 1),
(231, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/DanceonStage_Med_195x150.jpg', 1),
(232, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/Shuttle_Large_357x230.jpg', 1),
(232, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/Shuttle_Med_195x150.jpg', 1),
(233, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/VIPUpgrade_Large_357x230.jpg', 1),
(233, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/VIPUpgrade_Med_195x150.jpg', 1),
(234, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/MeetGreet_Large_357x230.jpg', 1),
(234, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/MeetGreet_Med_195x150.jpg', 1),

(235, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/GolfCart_Large_357x230.jpg', 1),
(235, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/GolfCart_Med_357x230.jpg', 1),

(236, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/Poster_Large_357x230.jpg', 1),
(236, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/Poster_Med_195x150.jpg', 1),

(237, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/Hoodie_Large_357x230.jpg', 1),
(237, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/Hoodie_Med_195x150.jpg', 1),

(238, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/Camping_Large_357x230.jpg', 1),
(238, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/Camping_Med_195x150.jpg', 1),

(239, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/TShirt_Large_357x230.jpg', 1),
(239, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/TShirt_Med_195x150.jpg', 1),

(240, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/Poster_Large_357x230.jpg', 1),
(240, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/Poster_Med_195x150.jpg', 1),

(241, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/FreeDownload_Large_357x230.jpg', 1),
(241, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/FreeDownload_Med_195x150.jpg', 1),

(242, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/PhoneWallpaper_Large_357x230.jpg', 1),
(242, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-prizes/PhoneWallpaper_Med_195x150.jpg', 1)

select * from EN_Image where ProgramID=4

insert into EN_Image (ImageTypeID, ProgramID, Path)
values
(1, 7, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-banners/Campbisco_Mid.jpg'),
(2, 7, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-banners/Campbisco_Landing_Banner.jpg'),
(10, 7, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-banners/campbisco-engage-banner.jpg'),
(11, 7, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-banners/Campbisco_Favicon.jpg'),
(12, 7, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/campbisco-banners/Campbisco_Events_Section.jpg')


--twitter keys
select * from EN_Twitterauth

insert into EN_Twitterauth (ProgramID, ConsumerKey, ConsumerKeySecret)
values 
(7,'we4EetFARyTUaaq7wBfg','YbsI5TRWWVAILqM3AUK6GhcpG34kPsfmEwMxqAgetmY')