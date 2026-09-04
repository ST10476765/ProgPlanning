--Crating a database
create database Prog;

use Prog;

--All these tables can be found on the ERD/ match the erd

-- creating users table
--craeted users table with a primary key
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName VARCHAR(100) NOT NULL,
    UserEmail VARCHAR(100) UNIQUE NOT NULL,--Updated --Unique Constraint
    HashedPassword VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL -- There are two roles, Participant and Organiser
);
 --removed an extra );







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
    Item1 VARCHAR(50), -- has no use and meaning, its a miskate
    OrganiserID INT NOT NULL,
    FOREIGN KEY (OrganiserID) REFERENCES Organiser(OrganiserID)
);







--created event table
CREATE TABLE Event (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName VARCHAR(100) NOT NULL,
    EventDescription VARCHAR(255),
    EventType VARCHAR(50),
    EventDate DATE NOT NULL,-- critical column
    PlaceOfTheEvent VARCHAR(100),
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);







-- participant table
-- user is a foreign key on the participant table
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
--add insert for user table
INSERT INTO Users (UserName, UserEmail, HashedPassword, Role)
VALUES ('Juice Wrld ', 'jwrld@raceday.com', 'hashed123', 'Organiser'),
       ('Cristiano Ronaldo', 'Cr7@mail.com', 'pass123', 'Participant');

select * from Users;

-- Organiser
INSERT INTO Organiser (OrganiserName, CellNumber, Email, UserID)
VALUES ('Juice Wrld', '0821112222', 'jwrld@raceday.com', 1);


select * from Organiser;


-- Catergory
INSERT INTO Category (CategoryDescription, Distance, Item1, OrganiserID)
VALUES ('10km Run', '10km', 'Under 20', 1);

select * from Category;





-- EVENT
-- add isert data sample for the event
-- updated to have real event names
INSERT INTO Event (EventName, EventDescription, EventType, EventDate, PlaceOfTheEvent, CategoryID)
VALUES ('Joburg Marathon', 'Annual city marathon', 'Run', '2026-10-15', 'Johannesburg', 1);

Select * from Event;



-- Participant
--added insert sample for the participant table
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






