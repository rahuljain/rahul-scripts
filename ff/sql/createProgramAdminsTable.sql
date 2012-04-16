CREATE TABLE EN_ProgramAdmins
(
AdminID int NOT NULL PRIMARY KEY,
UserID bigint NOT NULL,
ProgramID int NOT NULL,
FOREIGN KEY (ProgramID) REFERENCES EN_Program (ProgramID)
)

select * from EN_Program

select * from FanFueled.dbo.FFUser where FirstName='Rahul' and LastName='Jain'

insert into EN_ProgramAdmins (UserID, ProgramID)
values
(13635, 1),
(13635, 4),
(13635, 7)

update EN_ProgramAdmins set UserID=12922 where UserID=13635

select * from EN_ProgramAdmins