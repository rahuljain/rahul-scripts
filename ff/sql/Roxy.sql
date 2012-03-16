select * from EN_Action where ProgramID=4
select * from EN_ActionType

insert into EN_Action (ProgramID, ActionTypeID, Name, DisplayName, Description, Enabled, CreatedDate, Points, ActionData) values
(4, 2, 'FacebookLikeSunsetStripMusicFestival', 'Like the ''Sunset Strip Music Festival'' on Facebook.', 'Like the ''Sunset Strip Music Festival'' on Facebook.', 1, GETDATE(), 100, 'http://www.facebook.com/sunsetstripmusicfestival')
--(4, 1, 'FacebookPostRoxyFlyers', 'Post one of our flyers to your Wall and tell us what you like about it.', 'Check out our flyers here: http://TheRoxyTheatre.imagekind.com. You will receive an additional 5 points for every ''Like'' your post receives.', 1, GETDATE(), 100, 'message=Check out Roxy''s fliers;link=http://TheRoxyTheatre.imagekind.com.')

update EN_Action set DisplayName='Like the Roxy Theatre on Facebook.', ActionData='http://www.facebook.com/theroxy' where ActionID=392
update EN_Action set DisplayName='Like The Sunset Strip on Facebook.', ActionData='http://www.facebook.com/TheSunsetStrip' where ActionID=393
update EN_Action set Description='Donate to WesFest 7! Learn more here: http://weswehmiller.net/. You will earn 20 points for every $1 donated.', ActionData='http://weswehmiller.net/donate/' where ActionID=394
update EN_Action set DisplayName='Post our March event calendar to your Wall.' where ActionID=398
update EN_Action set DisplayName='If you could see any artist perform a secret show at The Roxy, who would it be?', Description='You will receive an additional 5 points for every ''Like'' your post receives' where ActionID=399 
update EN_Action set DisplayName='Tweet About the Sunset Strip Music Festival Dates', Description='' where ActionID=401
update EN_Action set DisplayName='Watch the Foo Fighters YouTube video of when they shot their documentary here last Februrary!' where ActionID=402
update EN_Action set DisplayName='Watch this video of Adele at The Roxy in 2007!' where ActionID=403

--Week One Actions--
update EN_Action set ActionData='http://www.facebook.com/KarlStraussBrewingCompany' where ActionID=404
update EN_Action set ActionData='http://www.facebook.com/adlerintegrated' where ActionID=406

--Week Two Actions--
update EN_Action set Enabled=0, ActionData='http://www.facebook.com/AndazWestHollywood' where ActionID=409
update EN_Action set Enabled=0 where ActionID=410
update EN_Action set Enabled=0 where ActionID=411
update EN_Action set DisplayName='Watch this installment of RoxyTV featuring Bonnie Dune', Enabled=0 where ActionID=412

--Week Three Actions--
update EN_Action set Enabled=0 where ActionID=413
update EN_Action set Enabled=0 where ActionID=414

--Prizes--
select * from EN_Reward where ProgramID=4

update EN_Reward set Description='Cash in 5,000 points for $5 in Roxy Bucks. You can use these Roxy Bucks towards upcoming events, merchandise, food, drink, and more!' where RewardID=131
update EN_Reward set Name='Grab a Drink with Nic Adler in the House Booth!' where RewardID=138
update EN_Reward set Quantity=3, Description='Win access to any show you want for an entire month! Become a Roxy regular for a month and take in as many shows as possible. Once you reach 16,000 points, hit ''Enter'' to be eligible for this exclusive raffle. Your points will not be deducted unless you win.
Earn 16,000 Amount of Points to be Entered into an Exclusive Raffle for this Prize.' where RewardID=139
update EN_Reward set Quantity=2, Description='Win backstage access and meet your favorite band performing at The Roxy. Once you reach 17,500 points, hit ''Enter'' to be eligible for this exclusive raffle. Your points will not be deducted unless you win.
Earn 17,500 Amount of Points to be Entered into an Exclusive Raffle for this Prize.' where RewardID=140
update EN_Reward set Quantity=2, Description='Become the ultimate Roxy VIP and gain exclusive access to the soundcheck of your choice. Once you reach 18,500 points, hit ''Enter'' to be eligible for this exclusive raffle. Your points will not be deducted unless you win.' where RewardID=141
update EN_Reward set Quantity=2, Description='Win a signed set list and VIP access to the show of your choice. This is a once-in-a-lifetime prize and available only on Roxy Engage. Once you reach 18,500 points, hit ''Enter'' to be eligible for this exclusive raffle. Your points will not be deducted unless you win.
Earn 20,000 Amount of Points to be Entered into an Exclusive Raffle for this Prize.' where RewardID=142


--Images--
select * from EN_RewardImage
select * from EN_Reward where ProgramID=4

insert into EN_RewardImage (RewardID, Path, IsPrimary) values
(131, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_5cash_Prize.jpg', 1),
(131, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_5cash_Prize.jpg', 1),
(132, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_BOGONext_Prize.jpg', 1),
(132, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_BOGONext_Prize.jpg', 1),
(133, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_Bandana_Prize.jpg', 1),
(133, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_Bandana_Prize.jpg', 1),
(134, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_Food_Prize.jpg', 1),
(134, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_Food_Prize.jpg', 1),
(135, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_Tee_Prize.jpg', 1),
(135, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_Tee_Prize.jpg', 1),
(136, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_Poster_Prize.jpg', 1),
(136, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_Poster_Prize.jpg', 1),
(137, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_Question_Prize.jpg', 1),
(137, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_Question_Prize.jpg', 1),
(138, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_NicAdler_Prize.jpg', 1),
(138, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_NicAdler_Prize.jpg', 1),
(139, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_Month_Prize.jpg', 1),
(139, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_Month_Prize.jpg', 1),
(140, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_Backstage_Prize.jpg', 1),
(140, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_Backstage_Prize.jpg', 1),
(141, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_Soundcheck_Prize.jpg', 1),
(141, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_Soundcheck_Prize.jpg', 1),
(142, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Large_Setlist_Prize.jpg', 1),
(142, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-prizes/Roxy_Med_Setlist_Prize.jpg', 1)
