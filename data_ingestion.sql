-- ========================================================
-- Enterprise Sports Management & Analytics Engine
-- Data Population Script (DML)
-- ========================================================

-- Populate COACH
INSERT ALL
    INTO Coach (coachID, coFirstName, coLastName, coDOB, coStartDate, coPhoneNo, coEmail, coStatus) VALUES ('CO1', 'Alice', 'Khan', TO_DATE('05/15/1980', 'MM/DD/YYYY'), TO_DATE('09/01/2018', 'MM/DD/YYYY'), '0400111222', 'a.appleby@email.com', 'Active')
    INTO Coach (coachID, coFirstName, coLastName, coDOB, coStartDate, coPhoneNo, coEmail, coStatus) VALUES ('CO2', 'Bob', 'Baker', TO_DATE('11/20/1975', 'MM/DD/YYYY'), TO_DATE('03/15/2019', 'MM/DD/YYYY'), '0400111223', 'b.baker@email.com', 'Active')
    INTO Coach (coachID, coFirstName, coLastName, coDOB, coStartDate, coPhoneNo, coEmail, coStatus) VALUES ('CO3', 'Charlie', 'Carter', TO_DATE('02/10/1988', 'MM/DD/YYYY'), TO_DATE('07/01/2020', 'MM/DD/YYYY'), '0400111224', 'c.carter@email.com', 'Active')
    INTO Coach (coachID, coFirstName, coLastName, coDOB, coStartDate, coPhoneNo, coEmail, coStatus) VALUES ('CO4', 'Diana', 'Davis', TO_DATE('08/25/1990', 'MM/DD/YYYY'), TO_DATE('01/10/2021', 'MM/DD/YYYY'), '0400111225', 'd.davis@email.com', 'Active')
    INTO Coach (coachID, coFirstName, coLastName, coDOB, coStartDate, coPhoneNo, coEmail, coStatus) VALUES ('CO5', 'Ethan', 'Evans', TO_DATE('12/01/1982', 'MM/DD/YYYY'), TO_DATE('06/01/2017', 'MM/DD/YYYY'), '0400111226', 'e.evans@email.com', 'Active')
    INTO Coach (coachID, coFirstName, coLastName, coDOB, coStartDate, coPhoneNo, coEmail, coStatus) VALUES ('CO6', 'Fiona', 'Fisher', TO_DATE('04/30/1992', 'MM/DD/YYYY'), TO_DATE('08/20/2022', 'MM/DD/YYYY'), '0400111227', 'f.fisher@email.com', 'Active')
SELECT * FROM dual;

-- Populate OFFICIAL
INSERT ALL
    INTO Official (officialID, ofFirstName, ofLastName, ofDOB, ofEmail, ofStartDate) VALUES ('OF01', 'Peter', 'Piper', TO_DATE('01/15/1970', 'MM/DD/YYYY'), 'p.piper@gmail.com', TO_DATE('02/01/2015', 'MM/DD/YYYY'))
    INTO Official (officialID, ofFirstName, ofLastName, ofDOB, ofEmail, ofStartDate) VALUES ('OF02', 'Quentin', 'Quick', TO_DATE('03/20/1985', 'MM/DD/YYYY'), 'q.quick@gmail.com', TO_DATE('05/10/2016', 'MM/DD/YYYY'))
    INTO Official (officialID, ofFirstName, ofLastName, ofDOB, ofEmail, ofStartDate) VALUES ('OF03', 'Rachel', 'Ready', TO_DATE('06/25/1990', 'MM/DD/YYYY'), 'r.ready@gmail.com', TO_DATE('08/15/2017', 'MM/DD/YYYY'))
    INTO Official (officialID, ofFirstName, ofLastName, ofDOB, ofEmail, ofStartDate) VALUES ('OF04', 'Sam', 'Steady', TO_DATE('09/30/1978', 'MM/DD/YYYY'), 's.steady@gmail.com', TO_DATE('11/20/2018', 'MM/DD/YYYY'))
    INTO Official (officialID, ofFirstName, ofLastName, ofDOB, ofEmail, ofStartDate) VALUES ('OF05', 'Tina', 'Timer', TO_DATE('12/05/1982', 'MM/DD/YYYY'), 't.timer@gmail.com', TO_DATE('01/25/2019', 'MM/DD/YYYY'))
SELECT * FROM dual;

-- Populate OFFICIALROLE
INSERT ALL
    INTO OfficialRole (officialRoleID, ofRoleDescript) VALUES ('OFRID1', 'Starter')
    INTO OfficialRole (officialRoleID, ofRoleDescript) VALUES ('OFRID2', 'Scrutineer')
    INTO OfficialRole (officialRoleID, ofRoleDescript) VALUES ('OFRID3', 'Admin/Results Officials')
SELECT * FROM dual;

-- Populate RACEMEET
INSERT ALL
    INTO RaceMeet (raceMeetID, raceMeetDate, raceMeetDescript, raceMeetLocation) VALUES ('RMID1', TO_DATE('02/02/2024', 'MM/DD/YYYY'), 'Week 1', 'Wanneroo Aquatic Centre')
    INTO RaceMeet (raceMeetID, raceMeetDate, raceMeetDescript, raceMeetLocation) VALUES ('RMID2', TO_DATE('02/09/2024', 'MM/DD/YYYY'), 'Week 2', 'Wanneroo Aquatic Centre')
    INTO RaceMeet (raceMeetID, raceMeetDate, raceMeetDescript, raceMeetLocation) VALUES ('RMID3', TO_DATE('02/16/2024', 'MM/DD/YYYY'), 'Week 3', 'Wanneroo Aquatic Centre')
    INTO RaceMeet (raceMeetID, raceMeetDate, raceMeetDescript, raceMeetLocation) VALUES ('RMID4', TO_DATE('02/23/2024', 'MM/DD/YYYY'), 'Week 4', 'Wanneroo Aquatic Centre')
SELECT * FROM dual;

-- Populate EVENT
INSERT ALL
    INTO Event (eventID, eventDescript, eventDistance) VALUES ('EV1', '50 metres Freestyle', '50m')
    INTO Event (eventID, eventDescript, eventDistance) VALUES ('EV2', '50 metres Breaststroke', '50m')
    INTO Event (eventID, eventDescript, eventDistance) VALUES ('EV3', '50 metres Butterfly', '50m')
    INTO Event (eventID, eventDescript, eventDistance) VALUES ('EV4', '50 metres Backstroke', '50m')
    INTO Event (eventID, eventDescript, eventDistance) VALUES ('EV5', '4 x 50 metres Ind. Medley', '200m')
SELECT * FROM dual;

-- Populate RESULT
INSERT ALL
    INTO Result (resultID, resultScore, resultDescript) VALUES ('ResID1', 8, '1st Place')
    INTO Result (resultID, resultScore, resultDescript) VALUES ('ResID2', 7, '2nd Place')
    INTO Result (resultID, resultScore, resultDescript) VALUES ('ResID3', 6, '3rd Place')
    INTO Result (resultID, resultScore, resultDescript) VALUES ('ResID4', 5, '4th Place')
    INTO Result (resultID, resultScore, resultDescript) VALUES ('ResID5', 4, '5th Place')
    INTO Result (resultID, resultScore, resultDescript) VALUES ('ResID6', 3, '6th Place')
    INTO Result (resultID, resultScore, resultDescript) VALUES ('ResID7', 2, '7th Place')
    INTO Result (resultID, resultScore, resultDescript) VALUES ('ResID8', 1, '8th Place')
    INTO Result (resultID, resultScore, resultDescript) VALUES ('ResID9', 0, 'DNS')
    INTO Result (resultID, resultScore, resultDescript) VALUES ('ResID10', 0, 'DNF')
    INTO Result (resultID, resultScore, resultDescript) VALUES ('ResID0', 0, 'DSQ')
SELECT * FROM dual;

-- Populate DIVISION
INSERT ALL
    INTO Division (divisionID, divName, divSex, divAge, coachID) VALUES ('DIV1', '13s - Boys', 'M', '13', 'CO1')
    INTO Division (divisionID, divName, divSex, divAge, coachID) VALUES ('DIV2', '13s - Girls', 'F', '13', 'CO2')
    INTO Division (divisionID, divName, divSex, divAge, coachID) VALUES ('DIV3', '14s - Boys', 'M', '14', 'CO3')
    INTO Division (divisionID, divName, divSex, divAge, coachID) VALUES ('DIV4', '14s - Girls', 'F', '14', 'CO4')
    INTO Division (divisionID, divName, divSex, divAge, coachID) VALUES ('DIV5', '15s - Boys', 'M', '15', 'CO5')
    INTO Division (divisionID, divName, divSex, divAge, coachID) VALUES ('DIV6', '15s - Girls', 'F', '15', 'CO6')
SELECT * FROM dual;

-- Populate SWIMMER (Sample Roster)
INSERT ALL
    INTO Swimmer (swimmerID, swFirstName, swLastName, swDOB, swAge, swHeight, swWeight, divisionID) VALUES ('SW001', 'Ankara', 'Messi', TO_DATE('11/04/2012', 'DD/MM/YYYY'), '13', 155, 49, 'DIV1')
    INTO Swimmer (swimmerID, swFirstName, swLastName, swDOB, swAge, swHeight, swWeight, divisionID) VALUES ('SW002', 'Starwars', 'Isbad', TO_DATE('04/08/2012', 'DD/MM/YYYY'), '13', 157, 46, 'DIV1')
    INTO Swimmer (swimmerID, swFirstName, swLastName, swDOB, swAge, swHeight, swWeight, divisionID) VALUES ('SW003', 'James', 'Williams', TO_DATE('24/11/2012', 'DD/MM/YYYY'), '13', 163, 46, 'DIV1')
    INTO Swimmer (swimmerID, swFirstName, swLastName, swDOB, swAge, swHeight, swWeight, divisionID) VALUES ('SW004', 'John', 'Brown', TO_DATE('14/10/2012', 'DD/MM/YYYY'), '13', 155, 45, 'DIV1')
    INTO Swimmer (swimmerID, swFirstName, swLastName, swDOB, swAge, swHeight, swWeight, divisionID) VALUES ('SW005', 'Randy', 'Orton', TO_DATE('07/02/2012', 'DD/MM/YYYY'), '13', 158, 53, 'DIV1')
    INTO Swimmer (swimmerID, swFirstName, swLastName, swDOB, swAge, swHeight, swWeight, divisionID) VALUES ('SW008', 'Mark', 'Moore', TO_DATE('15/05/2012', 'DD/MM/YYYY'), '13', 160, 50, 'DIV1')
SELECT * FROM dual;
