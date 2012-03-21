--select * from EN_Reward
select * from EN_Program
insert into EN_Program (Name, Description, CreatedDate, Enabled, Subdomain)
values
('Camp Bisco', 'Camp Bisco', GETDATE(), 0, 'campbisco')

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


--