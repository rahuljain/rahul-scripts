update Engage..EN_Program
set Enabled = 1
where ProgramID = 4

select * from EN_Image where ProgramID=6
select * from EN_ImageType

select * from EN_Twitterauth

insert into EN_Twitterauth (ProgramID, ConsumerKey, ConsumerKeySecret)
values
(4, 'N4g58ZPFvlz7EMo4cPlpOw', 'TZ86rjftwa8J0YPDa6VvaDDUO2igiMQIvCmHFAG8k')

select * from EN_Program

select * from EN_Action where ActionID=455

update EN_Action set ActionData='http://www.facebook.com/theroxy/22947187999' where ActionID=392
update EN_Action set ActionData='http://www.facebook.com/TheSunsetStrip/152469230102' where ActionID=393
update EN_Action set ActionData='http://www.facebook.com/KarlStraussBrewingCompany/142025660844' where ActionID=404
update EN_Action set ActionData='http://www.facebook.com/adlerintegrated/270665859660758' where ActionID=406
update EN_Action set ActionData='http://www.facebook.com/AndazWestHollywood/93787480431' where ActionID=409
update EN_Action set ActionData='http://www.facebook.com/sunsetstripmusicfestival/80930691436' where ActionID=475

select * from EN_Action where ProgramID=6

update EN_Action set DisplayName='Like UMF Radio', Description='Like UMF Radio on Facebook'
where ActionID=446

update EN_Action set DisplayName='Like UMF TV', Description='Like UMF TV on Facebook'
where ActionID=447

update EN_Action set DisplayName='Follow UMF TV', Description='Follow UMF TV on Twitter'
where ActionID=449


update EN_Action set DisplayName='Follow UMF Radio', Description='Follow UMF Radio on Twitter'
where ActionID=450
