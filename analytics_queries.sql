-- ========================================================
-- Enterprise Sports Management & Analytics Engine
-- Business Intelligence & Analytics Queries
-- ========================================================

-- --------------------------------------------------------
-- 1. Competition Winner Summary (Ordered Chronologically)
-- Joins 8 tables to aggregate winners across all events
-- --------------------------------------------------------
SELECT
    r.raceID AS "Race No",
    rm.raceMeetDescript AS "RaceMeet", 
    rm.raceMeetDate AS "Date",
    rm.raceMeetLocation AS "Location",
    r.raceStartTime AS "Race Start Time",
    d.divName AS "Division Name",
    d.divAge AS "Age",
    d.divSex AS "Sex",
    e.eventDescript AS "Event",
    s.swFirstName AS "Winner First Name",
    s.swLastName AS "Winner Last Name",
    sr.swimmerRaceTime AS "Winning Time (in Seconds)"
FROM Race r
    INNER JOIN RaceMeetEvent rme ON r.raceMeetEventID = rme.raceMeetEventID
    INNER JOIN RaceMeet rm ON rme.raceMeetID = rm.RaceMeetID
    INNER JOIN Event e ON rme.eventID = e.EventID
    INNER JOIN Division d ON r.divisionID = d.DivisionID
    INNER JOIN SwimmerRace sr ON r.raceID = sr.raceID
    INNER JOIN Result res ON sr.resultID = res.ResultID
    INNER JOIN Swimmer s ON sr.swimmerID = s.SwimmerID
WHERE res.ResultDescript = '1st Place'
ORDER BY rm.raceMeetDate, r.raceID;


-- --------------------------------------------------------
-- 2. Division Champions Leaderboard (Full Season Points)
-- Uses subqueries to isolate maximum cumulative points per division
-- --------------------------------------------------------
SELECT
    sp.swimmerID AS "Swimmer ID",
    sp.swFirstName || ' ' || sp.swLastName AS "Winner's Full Name", 
    sp.divName AS "Division",
    sp.total_points AS "Total Points",
    sp.num_races AS "Number of Races"
FROM (
    SELECT
        s.swimmerID,
        s.swFirstName,
        s.swLastName,
        s.divisionID,
        d.divName,
        SUM(rst.resultScore) AS total_points,
        COUNT(sr.swimmerRaceID) AS num_races
    FROM Swimmer s
        JOIN Division d ON s.divisionID = d.divisionID
        JOIN SwimmerRace sr ON s.swimmerID = sr.swimmerID
        JOIN Result rst ON sr.resultID = rst.resultID
        JOIN Race r ON sr.raceID = r.raceID
        JOIN RaceMeetEvent rme ON r.raceMeetEventID = rme.raceMeetEventID
        JOIN RaceMeet rm ON rme.raceMeetID = rm.raceMeetID
    WHERE rm.raceMeetID IN ('RMID1', 'RMID2', 'RMID3', 'RMID4')
    GROUP BY s.swimmerID, s.swFirstName, s.swLastName, s.divisionID, d.divName
) sp
JOIN (
    SELECT
        divisionID,
        MAX(total_points) AS max_points
    FROM (
        SELECT
            s.divisionID,
            SUM(rst.resultScore) AS total_points
        FROM Swimmer s
            JOIN SwimmerRace sr ON s.swimmerID = sr.swimmerID
            JOIN Result rst ON sr.resultID = rst.resultID
            JOIN Race r ON sr.raceID = r.raceID
            JOIN RaceMeetEvent rme ON r.raceMeetEventID = rme.raceMeetEventID
            JOIN RaceMeet rm ON rme.raceMeetID = rm.raceMeetID
        WHERE rm.raceMeetID IN ('RMID1', 'RMID2', 'RMID3', 'RMID4')
        GROUP BY s.swimmerID, s.divisionID
    )
    GROUP BY divisionID
) dw ON sp.divisionID = dw.divisionID AND sp.total_points = dw.max_points
ORDER BY sp.divName, sp.swLastName;


-- --------------------------------------------------------
-- 3. Season Record: Fastest Freestyle Time
-- Subquery filtering for MIN time, excluding DQ/DNS statuses
-- --------------------------------------------------------
SELECT 
    s.swFirstName || ' ' || s.swLastName AS "Fastest Swimmer", 
    s.swimmerID AS "Swimmer ID",
    r.raceID AS "Race Number",
    rm.raceMeetDescript AS "Race Meet Week", 
    d.divName AS "Division Name", 
    d.divAge AS "Division Age",
    e.eventDescript AS "Event Description", 
    sr.swimmerRaceTime AS "Fastest Time" 
FROM SwimmerRace sr 
    INNER JOIN Race r ON sr.raceID = r.raceID 
    INNER JOIN RaceMeetEvent rme ON r.raceMeetEventID = rme.raceMeetEventID 
    INNER JOIN RaceMeet rm ON rme.raceMeetID = rm.raceMeetID 
    INNER JOIN Division d ON r.divisionID = d.divisionID 
    INNER JOIN Swimmer s ON sr.swimmerID = s.swimmerID 
    INNER JOIN Event e ON rme.eventID = e.eventID 
    INNER JOIN Result res ON sr.resultID = res.resultID
WHERE e.eventDescript = '50 metres Freestyle'
    AND sr.resultID NOT IN ('ResID9','ResID10', 'ResID0')  
    AND sr.swimmerRaceTime = (
        SELECT MIN(sr2.swimmerRaceTime)
        FROM SwimmerRace sr2
            INNER JOIN Race r2 ON sr2.raceID = r2.raceID
            INNER JOIN RaceMeetEvent rme2 ON r2.raceMeetEventID = rme2.raceMeetEventID
            INNER JOIN Event e2 ON rme2.eventID = e2.eventID
        WHERE e2.eventDescript = '50 metres Freestyle'
            AND sr2.resultID NOT IN ('ResID9','ResID10', 'ResID0')
    )
AND ROWNUM = 1;
