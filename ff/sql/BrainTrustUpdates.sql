--select * from EN_Reward where ProgramID=2

insert into EN_RewardImage (RewardID, Path, IsPrimary) values 
(1, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_25_perc_off.jpg', 1),
(1, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_25_perc_off.jpg', 1),
(2, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_wobble_monthpass.jpg', 1),
(2, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_wobble_monthpass.jpg', 1),
(3, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_50_perc_off.jpg', 1),
(3, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_50_perc_off.jpg', 1),
(4, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_any_album_from_catalog.jpg', 1),
(4, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_any_album_from_catalog.jpg', 1),
(5, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_gardo_showprint.jpg', 1),
(5, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_gardo_showprint.jpg', 1),
(6, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_1_ticket_bt_show.jpg', 1),
(6, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_1_ticket_bt_show.jpg', 1),
(7, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_braintrust_tee.jpg', 1),
(7, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_braintrust_tee.jpg', 1),
(8, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_wobble_monthpass.jpg', 1),
(8, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_wobble_monthpass.jpg', 1),
(9, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_2_tickets_bt_show.jpg', 1),
(9, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_2_tickets_bt_show.jpg', 1),
(10, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_signed_bt_artist_album.jpg', 1),
(10, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_signed_bt_artist_album.jpg', 1),
(11, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_gardo_signed_showprint.jpg', 1),
(11, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_gardo_signed_showprint.jpg', 1),
(12, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_artist_meetgreet.jpg', 1),
(12, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_artist_meetgreet.jpg', 1),
(13, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_brainiac_package.jpg', 1),
(13, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_brainiac_package.jpg', 1),
(14, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_wobble_vip_bottleservice.jpg', 1),
(14, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_wobble_vip_bottleservice.jpg', 1),
(15, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_einstein_package.jpg', 1),
(15, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_einstein_package.jpg', 1),
(16, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Large_braintrust_package.jpg', 1),
(16, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-prizes/Braintrust_Med_braintrust_package.jpg', 1)

--select * from EN_Image where ProgramID=2

insert into EN_Image (ImageTypeID, ProgramID, Path)
values 
(10, 2, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-banners/braintrust-engage-banner.jpg'),
(11, 2, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-banners/Braintrust_Favicon.jpg'),
(1, 2, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-banners/Braintrust_Mid.jpg'), 
(12, 2, 'https://s3.amazonaws.com/fanfueled-engage/images/brain-trust-images/braintrust-banners/Braintrust_Events_Section.jpg')

--select * from EN_Action where ProgramID=2
delete from EN_Action where ActionID=50
delete from EN_Action where ActionID=55

update EN_Action set Description='' where ActionTypeID=2 and ProgramID=2
update EN_Action set ActionData='http://www.youtube.com/watch?v=BFQMbdxR1bA', ActionTypeID=8 where ActionID=67 and ProgramID=2
update EN_Action set Points=100 where ActionTypeID=2 and ProgramID=2
update EN_Action set Points=100 where ActionTypeID=5 and ProgramID=2
update EN_Action set Points=150 where ActionTypeID=6 and ProgramID=2
update EN_Action set Points=150 where ActionTypeID=1 and ProgramID=2
update EN_Action set Points=50 where ActionTypeID=9 and ProgramID=2
update EN_Action set Points=200 where ActionID=52


--select * from EN_Reward where ProgramID=2
update EN_Reward set Points=5000 where RewardID=1
update EN_Reward set Points=7500 where RewardID=2
update EN_Reward set Points=8500 where RewardID=3
update EN_Reward set Points=10000 where RewardID=4
update EN_Reward set Points=15000 where RewardID=5
update EN_Reward set Points=15000 where RewardID=6
update EN_Reward set Points=17500 where RewardID=7
update EN_Reward set Points=18500 where RewardID=8
update EN_Reward set Points=18500 where RewardID=9
update EN_Reward set Points=20000 where RewardID=10
update EN_Reward set Points=22000 where RewardID=11
update EN_Reward set Points=22500 where RewardID=12
update EN_Reward set Points=27000 where RewardID=13
update EN_Reward set Points=25000 where RewardID=14
update EN_Reward set Points=30000 where RewardID=15
