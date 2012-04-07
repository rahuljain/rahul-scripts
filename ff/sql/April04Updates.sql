--camp bisco updates

select * from EN_Action where ProgramID=7

insert into EN_Action (ProgramID, ActionTypeID, DisplayName, Description, Enabled, CreatedDate, Points, ActionData, IsRepeatable) values 
(7, 2, 'Like Archnemesis on Facebook', '', 1, GETDATE(), 100, 'https://www.facebook.com/pages/ArchMusic/180133822225', 0),
(7, 1, 'Share a link to the official Camp Bisco 2012 press release with your friends.', 'Post a link to the official Camp Bisco 2012 press release and you will receive an additional 50 points for every ''Like'' your post receives. ', 1, GETDATE(), 150, 'description=Check out the Camp Bisco 2012 press release!;link=http://campbisco.net/post.php?id=267;name=Camp Bisco', 0),
(7, 1, 'Post a link to campbisco.net on your Wall.', 'Post a link to campbisco.net and you will receive an additional 50 points for every ''Like'' your post receives. ', 1, GETDATE(), 150, 'description=Check out Camp Bisco 2012!;link=http://campbisco.net/;name=Camp Bisco', 0),
(7, 8, 'Watch this video of the Disco Biscuits performing at Camp Bisco 2011', '', 1, GETDATE(), 200, 'http://www.youtube.com/watch?v=stZQu5wf85o', 0),
(7, 1, 'Tell us how many years you have come to Camp Bisco by posting your answer to your Wall.', 'Tell your Facebook friends how many years you''ve come to Camp Bisco and you will receive an additional 50 points for every ''Like'' your post receives.', 1, GETDATE(), 150, 'description=How many years have you been to Camp Bisco?;link=https://campbisco.fanfueledengage.com;name=Camp Bisco', 0)

update EN_Action set Enabled=0 where ActionID=537
update EN_Action set Enabled=0 where ActionID=538
update EN_Action set Enabled=0 where ActionID=539
update EN_Action set Enabled=0 where ActionID=541

--FanFueled Actions
select * from EN_Action where ProgramID=1
insert into EN_Action (ProgramID, ActionTypeID, DisplayName, Description, Enabled, CreatedDate, Points, ActionData, IsRepeatable) values 
(1, 1, 'Tell your friends about our brand new Roxy Engage Platform. ', '', 1, GETDATE(), 150, 'description=Check out The Roxy''s Engage platform, the best place to win great prizes at one of the country''s most iconic venues!;link=https://roxy.fanfueledengage.com/;name=FanFueled Engage', 0),
(1, 5, 'Follow cartoonist Bill Plympton on Twitter.', 'We''re doing ticketing for a ''Special Evening with Bill Plympton'' at the Museum of Modern Art in NYC. Get your tickets today at FanFueled.com.', 1, GETDATE(), 100, 'plymptoons', 0),
(1, 1, 'Post the Camp Bisco Engage Platform to your Wall', 'Post the Camp Bisco Engage Platform, and you will receive an additional 50 points for every ''Like'' your post receives.', 1, GETDATE(), 150, 'description=Check out the Camp Bisco Engage Platform!;link=https://campbisco.fanfueledengage.com/Home;name=FanFueled Engage', 0),
(1, 7, 'Retweet our post about FanFueled''s new custom ticketing fields!', '', 1, GETDATE(), 50, '184692878860238850', 0),
(1, 1, 'Tell us what current FanFueled event you''re most excited about!', 'Tell us about your favorite event on the site and you will receive an additional 50 points for every ''Like'' your post receives.', 1, GETDATE(), 150, 'description=What FanFueled event are you most excited for!?;link=https://fanfueledengage.fanfueledengage.com;name=FanFueled Engage', 0)


--Roxy Actions
select * from EN_Action where ProgramID=4
insert into EN_Action (ProgramID, ActionTypeID, DisplayName, Description, Enabled, CreatedDate, Points, ActionData, IsRepeatable) values 
(4, 7, 'Retweet @NicAdler''s message about the new painting on the side of the Roxy', '', 1, GETDATE(), 50, '186629706798473216', 0),
(4, 1, 'Share the news about the @LAVeganBeerFest, happening at the Roxy', 'Share the link to the LA Vegan Beer & Food Fest, and you will receive an additional 50 points for every ''Like'' your post receives.', 1, GETDATE(), 150, 'description=Check out the LA Vegan Beer & Food Fest!;link=http://www.quarrygirl.com/post/20296431058/la-vegan-beer-food-fest;name=The Roxy', 0),
(4, 8, 'Watch this video for Madeon, coming to the Roxy on April 17', '', 1, GETDATE(), 200, 'http://www.youtube.com/watch?feature=player_embedded&v=IxPbgnO81sQ', 0),
(4, 1, 'Share this picture from the Roxy''s Tumblr of John and Yoko''s wedding in 1969.', 'Share this photo and you will receive an additional 50 points for every ''Like'' your post receives.', 1, GETDATE(), 150, 'description=Check out this photo from John and Yoko''s wedding!;link=http://theroxy.tumblr.com/post/19633567320/today-in-music-history-john-lennon-yoko-ono-wed;name=The Roxy', 0)

