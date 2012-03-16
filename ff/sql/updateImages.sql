select * from EN_ImageType

insert into EN_ImageType (Name) values
('event-view-image')

select * from EN_Image where ProgramID=1
insert into EN_Image (ImageTypeID, ProgramID, Path)
values 
(12, 1, 'https://s3.amazonaws.com/fanfueled-engage/images/Engage-Events-Section.jpg')
--(12, 6, 'https://s3.amazonaws.com/fanfueled-engage/images/umf-events-image.jpg')

--(12, 4, 'https://s3.amazonaws.com/fanfueled-engage/images/roxy-images/roxy-banners/Roxy_Events_Section.jpg')