--Crating a database
create database Prog;

use Prog;

-- creating users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName VARCHAR(100) NOT NULL,
    UserEmail VARCHAR(100) UNIQUE NOT NULL,
    HashedPassword VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL -- There are two roles, Participant and Organiser
);


-- Add Age and Gender to Organiser

Alter table Organiser --add the age and gender attributes for the UserProfile functionality on the organiser table
Add Age Int NULL,
Gender VARCHAR(20) NULL;

-- Add Age and Gender to Participant
Alter Table Participant-- added the age and gender attributes for the userprofile functinality on the participant table
Add Age Int NULL,
Gender VARCHAR(20) NULL;




-- organiser tAble
CREATE TABLE Organiser (
    OrganiserID INT PRIMARY KEY IDENTITY(1,1),
    OrganiserName VARCHAR(100) NOT NULL,
    CellNumber VARCHAR(20),
    Email VARCHAR(100),
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);




-- category table
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryDescription VARCHAR(100) NOT NULL,
    Distance VARCHAR(50),
    Item1 VARCHAR(50),
    OrganiserID INT NOT NULL,
    FOREIGN KEY (OrganiserID) REFERENCES Organiser(OrganiserID)
);

--deleting unwanted column item1
ALTER TABLE Category
DROP COLUMN Item1; --removed item1 column because it was a mistake







-- event table
CREATE TABLE Event (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName VARCHAR(100) NOT NULL,
    EventDescription VARCHAR(255),
    EventType VARCHAR(50),
    EventDate DATE NOT NULL,
    PlaceOfTheEvent VARCHAR(100),
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

--adding OrganiserId in the event table 
ALTER TABLE Event
ADD OrganiserID INT NOT NULL
    CONSTRAINT DF_Event_Organiser DEFAULT 1;

ALTER TABLE Event
ADD CONSTRAINT FK_Event_Organiser FOREIGN KEY (OrganiserID)
REFERENCES Organiser(OrganiserID);






-- participant table
CREATE TABLE Participant (
    ParticipantID INT PRIMARY KEY IDENTITY(1,1),
    ParticipantName VARCHAR(100) NOT NULL,
    CellNumber VARCHAR(20),
    Email VARCHAR(100),
    RaceNumber VARCHAR(20),
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);







-- enrollment tables
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    EnrollmentDate DATE NOT NULL,
    EnrollmentStatus VARCHAR(50) NOT NULL,
    UserID INT NOT NULL,
    EventID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

--adding Category id
ALTER TABLE Enrollment
ADD CategoryID INT NOT NULL DEFAULT 1
FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID);






-- Result table
CREATE TABLE Result (
    ResultID INT PRIMARY KEY IDENTITY(1,1),
    EnrollmentID INT NOT NULL,
    FinishTime TIME,
    PodiumPlacement INT,
    FOREIGN KEY (EnrollmentID) REFERENCES Enrollment(EnrollmentID)
);




--Insert for the tables
-- USERS
INSERT INTO Users (UserName, UserEmail, HashedPassword, Role)
VALUES ('Juice Wrld ', 'jwrld@raceday.com', 'hashed123', 'Organiser'),
       ('Cristiano Ronaldo', 'Cr7@mail.com', 'pass123', 'Participant');

select * from Users;

-- Organiser
INSERT INTO Organiser (OrganiserName, CellNumber, Email, UserID)
VALUES ('Juice Wrld', '0821112222', 'jwrld@raceday.com', 1);

SELECT * FROM Organiser WHERE OrganiserID = 1;

INSERT INTO Organiser (OrganiserName, CellNumber, Email, UserID)
VALUES ('Test Organiser', '0839998888', 'test@raceday.com', 9);




select * from Organiser;


-- Catergory
INSERT INTO Category (CategoryDescription, Distance, Item1, OrganiserID)
VALUES ('10km Run', '10km', 'Under 20', 1);

INSERT INTO Category (CategoryDescription, Distance, OrganiserID)
VALUES ('10km Run', '10km', 1);

select * from Category;

SELECT * FROM Category WHERE CategoryID = 3;

INSERT INTO Category (CategoryDescription, Distance, Item1, OrganiserID)
VALUES ('Half Marathon', '21km', 'Adults', 2);





-- EVENT
INSERT INTO Event (EventName, EventDescription, EventType, EventDate, PlaceOfTheEvent, CategoryID)
VALUES ('Joburg Marathon', 'Annual city marathon', 'Run', '2026-10-15', 'Johannesburg', 1);

Select * from Event;



-- Participant
INSERT INTO Participant (ParticipantName, CellNumber, Email, RaceNumber, UserID)
VALUES ('Thabo Nkosi', '0833334444', 'thabo@mail.com', 'R001', 2);

select * from Participant;



-- enrollment
insert into Enrollment (EnrollmentDate, EnrollmentStatus, UserID, EventID)
VALUES ('2026-09-01', 'Confirmed', 2, 1);

select * from Enrollment;



-- result insert
INSERT INTO Result (EnrollmentID, FinishTime, PodiumPlacement)
VALUES (1, '03:45:10', 1);


select * from Result;



SELECT * FROM Category WHERE CategoryID = 1;
SELECT * FROM Organiser WHERE OrganiserID = 1;



