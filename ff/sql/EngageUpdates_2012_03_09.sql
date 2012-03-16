select * from EN_Reward
select * from EN_Program
select * from EN_Action



update EN_Reward set Description='Enter for your chance to win two passes for the Coachella Valley Music and Arts Festival on April 20-22, featuring The Black Keys, Radiohead, Dr. Dre & Snoop Dogg, Bon Iver, Swedish House Mafia, and more. Once you hit 20,000 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.' 
where RewardID=117

update EN_Reward set Description = 'Enter for your chance to win two passes to Ultra 2012! Heralded as the ''World''s Premier Electronic Festival,'' Ultra has been sold out for weeks. Here''s your opportunity to win passes to this year''s fest. Once you hit 10,000 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.'
where RewardID=118

update EN_Reward set Description = 'Enter for your chance to win two tickets to see The Ting Tings perform at the Metro in Chicago on April 3rd. Jam puts on some of the best events in the country and this show is no exception! Once you hit 5,000 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.'
where RewardID=122

update EN_Reward set Description = 'Enter for your chance to win two tickets to see The Naked and the Famous at the Vic Theatre in Chicago on April 15th. Once you hit 7,500 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.'
where RewardID=123

update EN_Reward set Description = 'Enter for your chance to win two tickets to see Death Cab for Cutie with the Magik Magik Orchestra at The Chicago Theatre on April 17th. Once you hit 8,000 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.'
where RewardID=127

update EN_Reward set Description = 'Enter for your chance to win two tickets to see M83 at the House of Blues in Boston on May 9th. Once you hit 10,000 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.'
where RewardID = 124

update EN_Reward set Description = 'Enter for your chance to win two tickets to see M83 at the Marathon Music Works in Nashville TN on May 15th. Once you hit 10,000 points, hit Enter to be eligible for this exclusive raffle. Your points will not be deducted unless you win.'
where RewardID=126



insert into EN_Reward (ProgramID, Name, Description, CreatedDate, StartDate, EndDate, Enabled, Points, Quantity, SubtractsPoints)
values
(1, 'Win Two Tickets to See Foster the People in Austin, Texas - June 5th', 'Win a pair of tickets to see Foster the People at The Backyard at Bee Cave in Austin Texas on June 5th.', GETDATE(), null, null, null, null, 0),
(1, 'Win Two Tickets to See Foster the People in Chicago, Illinois - June 21st', 'Win a pair of tickets to see Foster the People at Congress Theatre in Chicago Illinois on June 21st.', GETDATE(), null, null, null, null, 0),
(1, '2 Tickets for Passion Pit @ the Bank of America Pavilion in Boston, MA - June 22nd', 'Win 2 tickets to see Passion Pit at the Bank of America Pavilion in Boston, MA on June, 22.', GETDATE(), null, null, null, 2, 0)


--- FanFueled ACTIONS updates ---

--Changes made by Vamsi
update EN_Action
set points = 20
where actiontypeid = 11
 
 
update en_action SET description = 'Post the Phase 2 Lineup to your Facebook wall. For every ''Like'' you get, you''ll receive an extra 5 points!'
where actionid = 46
 
update en_action set description = 'Post the CAN U FEEL IT movie trailer to your wall. For ever ''Like'' you get, you''ll receive an exra 5 points!'
where ActionID = 47
 
update en_reward set Name = 'GRAND PRIZE! A PAIR OF VIP Tickets to Ultra 2012 (Must be 21+)!'
where RewardID = 198
 
 
update EN_Reward SET Quantity = 25 where RewardID = 208
 
 
update EN_Action set
name = 'WatchGroupMiami', DisplayName = 'Watch the Group Therapy Miami Trailer', Description = 'Watch the Group Therapy Miami Trailer on Youtube', ActionData = 'http://www.youtube.com/watch?feature=player_embedded&v=TsQl09fuqa8'
where actionid = 456
 
update EN_Action
set Enabled = 0 where ProgramID = 6 AND ActionID > 462
 
update en_action SET Name = 'LikeArminVanBuuren', DisplayName = 'Like Armin Van Buuren', Description = 'Like Armin Van Buuren on Facebook', actiondata = 'http://www.facebook.com/arminvanbuuren/25498833315'
where ActionID = 464
 
UPDATE en_action
SET Enabled = 0
where actionid IN (459, 457)
 
 
UPDATE EN_Action
SET DisplayName = 'How many years have you attended Ultra? Post the answer to your Facebook Wall'
where ActionID = 458
 
update en_reward
set Quantity = 1 WHERE SubtractsPoints = 0
and ProgramID = 1

--- end of Vamsi changes


update EN_Action set DisplayName='Like FanFueled on Facebook', Description = 'Like FanFueled on Facebook', ActionData='http://www.facebook.com/pages/FanFueled/226076074138781'
where ActionID=214

update EN_Action set DisplayName='Follow FanFueled on Twitter.', Description='Follow FanFueled on Twitter.' where ActionID=215

update EN_Action set DisplayName='Watch the FanFueled Overview video.', Description='Watch the FanFueled Overview video.'  where ActionID=216

update EN_Action set DisplayName='Tweet our Blog out to your followers.', Description='Check out the FanFueled Blog: http://fanfueled.wordpress.com/'
where ActionID=217

update EN_Action set DisplayName='Tell us about the greatest live event you''ve ever been to. Post the answer to your Wall.'
where ActionID=218 --check with Will, what changes did he need?

update EN_Action set DisplayName='What artist, festival, brand, or team do you wish had its own Engage Platform? Post the answer to your Wall.'
where ActionID=219 --check with Will, what changes did he need?

update EN_Action set DisplayName='Donate to NextStep Fitness and receive 20 points for every $1 spent.', Description='Donate to NextStep Fitness and receive 20 points for every $1 spent.'
where ActionID=220

update EN_Action set Description='Donate to the Immerman Angels and receive 20 points for every $1 spent.'
where ActionID=221

--insert into EN_Action (ProgramID, ActionTypeID, Name, DisplayName, Description, Enabled,CreatedDate, Points,StartDate,EndDate,ActionData, HasReferralPoints)
--values(1, 8, 'YoutubeWatchNextStepFitness', 'Watch the NextStep Fitness story.', 'Watch the NextStep Fitness story.', GETDATE(), null, null, null, 'http://www.youtube.com/watch?v=1JHETOsrWY0', 0)




-- UMF changes --

update EN_Action set DisplayName='Like Ultra Music Festival Radio', Description='Like Ultra Music Festival Radio on Facebook'
where ActionID=446

update EN_Action set DisplayName='Like Ultra Music Festival TV', Description='Like Ultra Music Festival TV on Facebook'
where ActionID=447

update EN_Action set DisplayName='Follow Ultra Music Festival TV', Description='Follow Ultra Music Festival TV on Twitter'
where ActionID=449

update EN_Action set DisplayName='Follow Ultra Music Festival Radio', Description='Follow Ultra Music Festival Radio on Twitter'
where ActionID=450

update EN_Action set ActionData='description=Check out Ultra''s Phase 2 lineup!;link=http://www.ultramusicfestival.com/' where ActionID=451

update EN_Action set ActionData='description=You have to see this amazing trailer for Ultra''s ''CAN U FEEL IT'' trailer;link=http://www.youtube.com/watch?v=KXdq6aq82Ss' where ActionID=452

update EN_Action set DisplayName='Retweet Ultra Music Festival''s Tweet' where ActionID=454

update EN_Action set Description='Watch this video of Deadmau5 performing at Ultra Music Festival 2011' where ActionID=456

update EN_Action set DisplayName='How would you Maximize the Ultra Music Festival Experience?', Description='Post to Facebook about how you would maximize the overall Ultra Music Festival Experience', ActionData='link=http://www.ultramusicfestival.com;description=How would you maximize the Ultra Music Experience?'
where ActionID=457

update EN_Action set DisplayName='How many years have you attended Ultra Music Festival?', Description='Post to Facebook about how many years you have attended Ultra', ActionData='link=http://www.ultramusicfestival.com;description=How many years have you attended Ultra Music Festival?'
where ActionID=458

update EN_Action set DisplayName='Tweet Ultra Music Festival''s Photo Gallery', Description='Tweet out Ultra Music Festival''s photo gallery to your friends', ActionData='Check out Ultra''s Photo Gallery! http://www.ultramusicfestival.com/photo-gallery/'
where ActionID=468

update EN_Action set DisplayName='Post About Ultra Music Festival' where ActionID=470


-- UMF Rewards updates --
update EN_Reward set Name='Grand Prize! A Pair of VIP Tickets to Ultra Music Festival 2012.' where RewardID=197

update EN_Reward set Name='Two GA Tickets to Ultra Music Festival 2012.' where RewardID=199

update EN_Reward set Name='The First Pair of Tickets to Ultra Music Festival 15 in 2013.' where RewardID=201

update EN_Reward set Name='Official Ultra Music Festival 2012 T-Shirt.' where RewardID=207

update EN_Reward set Quantity=1 where RewardID=204

update EN_Reward set Name='Ticket to see CAN U FEEL IT in Theaters', 
Description='Win a pair of tickets to Ultra Carry On featuring Kaskade. This amazing party will be held at Amnesia on March 23rd. (Must be 21 or older to win this prize). 
CAN U FEEL IT is playing in five locations and there are ten tickets available to each location. Tickets and locations are first come, first serve. 
This prize expires on March 22nd at 11.59PM EST. 18,500 Points. (Expires 3/22 at 11.59PM EST)' where RewardID=204
