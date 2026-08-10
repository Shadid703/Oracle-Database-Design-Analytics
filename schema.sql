-- ========================================================
-- Enterprise Sports Management & Analytics Engine
-- Database Schema Definition (DDL)
-- Database Engine: Oracle SQL
-- ========================================================

-- 1. Table: COACH
CREATE TABLE Coach (
    coachID      VARCHAR2(8),
    coFirstName  VARCHAR2(50) NOT NULL,
    coLastName   VARCHAR2(50) NOT NULL,
    coDOB        DATE,
    coStartDate  DATE,
    coPhoneNo    VARCHAR2(15),
    coEmail      VARCHAR2(100),
    coStatus     VARCHAR2(20),
    CONSTRAINT Coach_PK PRIMARY KEY (coachID)
);

-- 2. Table: OFFICIAL
CREATE TABLE Official (
    officialID   VARCHAR2(8),
    ofFirstName  VARCHAR2(50) NOT NULL,
    ofLastName   VARCHAR2(50) NOT NULL,
    ofDOB        DATE,
    ofEmail      VARCHAR2(100),
    ofStartDate  DATE,
    CONSTRAINT Official_PK PRIMARY KEY (officialID)
);

-- 3. Table: OFFICIALROLE
CREATE TABLE OfficialRole (
    officialRoleID VARCHAR2(8),
    ofRoleDescript VARCHAR2(50) NOT NULL,
    CONSTRAINT OfficialRole_PK PRIMARY KEY (officialRoleID)
);

-- 4. Table: RACEMEET
CREATE TABLE RaceMeet (
    raceMeetID       VARCHAR2(8),
    raceMeetDate     DATE NOT NULL,
    raceMeetLocation VARCHAR2(100),
    raceMeetDescript VARCHAR2(100),
    CONSTRAINT RaceMeet_PK PRIMARY KEY (raceMeetID)
);

-- 5. Table: EVENT
CREATE TABLE Event (
    eventID       VARCHAR2(8),
    eventDescript VARCHAR2(255),
    eventDistance VARCHAR2(100),
    CONSTRAINT Event_PK PRIMARY KEY (eventID)
);

-- 6. Table: RESULT
CREATE TABLE Result (
    resultID       VARCHAR2(8),
    resultScore    NUMBER(10,2),
    resultDescript VARCHAR2(30),
    CONSTRAINT Result_PK PRIMARY KEY (resultID)
);

-- 7. Table: DIVISION
CREATE TABLE Division (
    divisionID VARCHAR2(8),
    divName    VARCHAR2(50) NOT NULL,
    divAge     VARCHAR2(20),
    divSex     CHAR(1),
    coachID    VARCHAR2(8),
    CONSTRAINT Division_PK PRIMARY KEY (divisionID),
    CONSTRAINT Division_Coach_FK FOREIGN KEY (coachID) REFERENCES Coach (coachID)
);

-- 8. Table: SWIMMER
CREATE TABLE Swimmer (
    swimmerID   VARCHAR2(8),
    swFirstName VARCHAR2(50) NOT NULL,
    swLastName  VARCHAR2(50) NOT NULL,
    swDOB       DATE,
    swAge       VARCHAR2(20),
    swHeight    NUMBER(5,2),
    swWeight    NUMBER(5,2),
    divisionID  VARCHAR2(8),
    CONSTRAINT Swimmer_PK PRIMARY KEY (swimmerID),
    CONSTRAINT Swimmer_Division_FK FOREIGN KEY (divisionID) REFERENCES Division (divisionID)
);

-- 9. Table: RACEMEETEVENT
CREATE TABLE RaceMeetEvent (
    raceMeetEventID        VARCHAR2(8),
    raceMeetEventStartTime TIMESTAMP(6),
    raceMeetEventEndTime   TIMESTAMP(6),
    raceMeetEventDate      DATE,
    raceMeetID             VARCHAR2(8) NOT NULL,
    eventID                VARCHAR2(8) NOT NULL,
    CONSTRAINT RaceMeetEvent_PK PRIMARY KEY (raceMeetEventID),
    CONSTRAINT RME_RaceMeet_FK FOREIGN KEY (raceMeetID) REFERENCES RaceMeet (raceMeetID),
    CONSTRAINT RME_Event_FK FOREIGN KEY (eventID) REFERENCES Event (eventID)
);

-- 10. Table: RACE
CREATE TABLE Race (
    raceID          VARCHAR2(8),
    raceStartTime   VARCHAR2(50),
    raceMeetEventID VARCHAR2(8),
    divisionID      VARCHAR2(8),
    CONSTRAINT Race_PK PRIMARY KEY (raceID),
    CONSTRAINT Race_RaceMeetEvent_FK FOREIGN KEY (raceMeetEventID) REFERENCES RaceMeetEvent (raceMeetEventID),
    CONSTRAINT Race_Division_FK FOREIGN KEY (divisionID) REFERENCES Division (divisionID)
);

-- 11. Table: RACEMEETOFFICIAL
CREATE TABLE RaceMeetOfficial (
    raceMeetOfficialID VARCHAR2(8),
    officialID         VARCHAR2(8) NOT NULL,
    raceMeetID         VARCHAR2(8) NOT NULL,
    officialRoleID     VARCHAR2(8) NOT NULL,
    CONSTRAINT RaceMeetOfficial_PK PRIMARY KEY (raceMeetOfficialID),
    CONSTRAINT RMO_Official_FK FOREIGN KEY (officialID) REFERENCES Official (officialID),
    CONSTRAINT RMO_RaceMeet_FK FOREIGN KEY (raceMeetID) REFERENCES RaceMeet (raceMeetID),
    CONSTRAINT RMO_OfficialRole_FK FOREIGN KEY (officialRoleID) REFERENCES OfficialRole (officialRoleID)
);

-- 12. Table: SWIMMERRACE
CREATE TABLE SwimmerRace (
    swimmerRaceID   VARCHAR2(8),
    swimmerRaceLane NUMBER,
    swimmerRaceTime NUMBER(10,2),
    swimmerID       VARCHAR2(8) NOT NULL,
    raceID          VARCHAR2(8) NOT NULL,
    resultID        VARCHAR2(8) NOT NULL,
    CONSTRAINT SwimmerRace_PK PRIMARY KEY (swimmerRaceID),
    CONSTRAINT SR_Swimmer_FK FOREIGN KEY (swimmerID) REFERENCES Swimmer (swimmerID),
    CONSTRAINT SR_Race_FK FOREIGN KEY (raceID) REFERENCES Race (raceID),
    CONSTRAINT SR_Result_FK FOREIGN KEY (resultID) REFERENCES Result (resultID)
);
