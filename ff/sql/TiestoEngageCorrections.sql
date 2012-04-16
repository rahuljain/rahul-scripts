select ActionID, DisplayName, Description, ActionData, StartDate, EndDate, Points, PointsDisplay, OrderIndex  
from EN_Action where ProgramID=8 and DisplayName like '%refer%'

select * from EN_Reward where ProgramID=8

update EN_Action set ActionData='tiesto' where ActionID=645
update EN_Action set ActionData='musicalfreedom' where ActionID=648
update EN_Action set ActionData='description=Check out Tiësto''s awesome Club Life Volume 2 website!;link=http://www.clublifemiami.com;name=Tiesto' where ActionID=653

update EN_Action set ActionData='https://www.facebook.com/pages/tiesto/12626353545' where ActionID=643
update EN_Action set ActionData='https://www.facebook.com/pages/musicalfreedom/112777558770533' where ActionID=644

update EN_Action set ActionTypeID=7 where ActionID=647
update EN_Action set ActionData='Sign up for Tiësto Engage for a chance to win exclusive prizes and experiences, like a trip to see Tiësto perform at XS in Vegas. https://fanfueledengage.com/tiesto'
where ActionID=651
update EN_Action set PointsDisplay=5, Points=0 where ActionID=642
update EN_Action set PointsDisplay=5, Points=0 where ActionID=641

update EN_Action set DisplayName='ReTweet Tiësto''s latest tweet about his ClubLife podcast.' where ActionID=647

update EN_Reward set Description='Win the ultimate Tiësto fan experience. The GRAND PRIZE winner will win 2 VIP tickets to see Tiësto perform at XS at the Wynn in Las Vegas. This unbelievable prize includes roundtrip airfare, transportation, a hotel room at the Wynn, a comped meal at the Wynn, and 2 VIP tickets. Once you earn 15,000 points on Tiësto Engage, you are automatically entered into an exclusive raffle to win this prize. The drawing will be held at a date TBD. (Note: Airfare is only for players within the continental United States).'
where RewardID=256

update EN_Action set Description='Refer a friend to the Tiësto Engage Platform by posting this link to your Wall. You will earn 5% of all of your referral''s total points. If your referrals get their friends to sign up, you will receive 5% of their total points, too. That''s because FanFueled''s patented ''Share, Track, Reward'' software tracks your influence across multiple degrees of separation and rewards you for it.'
where ActionID=641

update EN_Action set ActionData='description=Sign up for Tiësto Engage for a chance to win exclusive prizes and experiences, like a trip to see Tiësto perform at XS in Vegas.;link=https://fanfueledengage.com/tiesto;name=Tiesto'
where ActionID=641

update EN_Action set Description='Refer a friend to the Tiësto Engage Platform by posting this link to your Twitter feed. You will earn 5% of all of your referral''s total points. If your referrals get their friends to sign up, you will receive 5% of their total points, too. That''s because FanFueled''s patented ''Share, Track, Reward'' software tracks your influence across multiple degrees of separation and rewards you for it.'
where ActionID=642

update EN_Action set ActionData='Sign up for Tiësto Engage for a chance to win exclusive prizes and experiences, like a trip to see Tiësto perform at XS in Vegas. https://fanfueledengage.com/tiesto'
where ActionID=642

select * from EN_ImageType
select * from EN_Image, EN_ImageType where EN_Image.ImageTypeID=EN_ImageType.ImageTypeID and (ProgramID=8 or ProgramID=7) order by ProgramID, EN_Image.ImageTypeID

insert into EN_Image (ImageTypeID, Path, ProgramID) values
(11, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-banners/tiesto_score_thumb.png', 8),
(12, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-banners/Events_tiesto.jpg', 8),
(2, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-banners/Tiesto_Front_Page_Thumbnail.png', 8),
(1, 'https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-banners/Tiesto_Dropdown_thumb.png', 8)

update EN_Image set Path='https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-banners/tiesto_program_banner.jpg' where ProgramID=8 and ImageTypeID=10
update EN_Image set Path='https://s3.amazonaws.com/fanfueled-engage/images/tiesto-images/tiesto-banners/tiesto_program_login_splash.jpg' where ProgramID=8 and ImageTypeID=13

update EN_Reward set Name='Win a Shout Out on Tiësto''s official Twitter page.' where RewardID=260
update EN_Reward set Name='Win a VIP Trip for Two to see Tiësto at XS at the Wynn in Las Vegas!' where RewardID=256