# Enterprise Sports Management & Performance Analytics Engine (Oracle SQL)

## Executive Overview
This repository contains a normalized (3NF) relational database architecture designed to manage complex event scheduling, participant rosters, referee allocations, and transactional performance scoring across multi-divisional sporting competitions. 

Built on Oracle SQL, the platform features robust database schemas, transactional data ingestion scripts, and complex analytical queries delivering enterprise-level performance metrics and automated leaderboards.

---

## Tech Stack & Key Concepts
* **Database Engine:** Oracle SQL (PL/SQL syntax)
* **Data Modeling:** Conceptual (ERD), Logical (DDL Schema), 3NF Normalization, Data Dictionary Definition
* **Key Features:** Multi-table JOINS (up to 8 tables), Aggregate & Window Functions (`SUM`, `MAX`, `MIN`), Nested Subqueries, Constraint Logic, Data Integrity Enforcement

---

## Database Architecture (12 Normalized Entities)
The schema maintains strict relational integrity across three core operational pillars:

1. **Participant & Organizational Roster:** `Coach`, `Division`, `Swimmer`, `Official`, `OfficialRole`
2. **Event Scheduling & Infrastructure:** `RaceMeet`, `Event`, `RaceMeetEvent`, `Race`
3. **Scoring & Performance Analytics:** `Result`, `SwimmerRace`, `RaceMeetOfficial`

---

## Key Analytics Capabilities
The query engine (`analytics_queries.sql`) provides automated reporting for key business requirements:

* **Competition Summaries:** Consolidated reports joining 8 relational tables to output event winners, location metrics, and timing benchmarks across 120+ competition events.
* **Leaderboards & Division Champions:** Subquery logic aggregating individual performance scores (`SUM`) across multi-week competitions to determine overall division champions.
* **Record-Breaking Performance Metrics:** Dynamic filtering isolating season-best performances by stroke/event type while accounting for disqualification/DNS edge cases.

---

## Deployment Instructions
1. Run `schema.sql` to generate database tables, primary keys, and foreign key constraints.
2. Execute `data_ingestion.sql` to populate operational records.
3. Execute `analytics_queries.sql` to generate performance analytics and leaderboards.
