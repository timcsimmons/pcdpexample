DROP TABLE IF EXISTS visit;
CREATE TABLE visit (
    "Year" INT,
    "Visit" INT,
    "Patient" INT,
    "Gender" TEXT,
    "Race" INT,
    "Ethnicity" INT,
    "TriageCat" INT,
    "PayerType" INT,
    "EDDisposition" INT,
    "ModeOfArrival" INT,
    "AgeInYears" INT,
    "AgeInMonths" INT,
    "AgeInDays" INT,
    "TriageDayofWeek" INT,
    "TriageHour" INT,
    "TriageToDischargeMinutes" INT
);


DROP TABLE IF EXISTS cpt;
CREATE TABLE cpt (
     "Visit" INT,
     "Patient" INT,
     "Year" INT,
     "CPT" TEXT
);

DROP TABLE IF EXISTS diagnosis;
CREATE TABLE diagnosis (
     "Visit" INT,
     "Patient" INT,
     "Year" INT,
     "DX" TEXT     
);

DROP TABLE IF EXISTS ecode;
CREATE TABLE ecode (
     "Visit" INT,
     "Patient" INT,
     "Year" INT,
     "Ecode" TEXT
);

DROP TABLE IF EXISTS proccode;
CREATE TABLE proccode (
     "Visit" INT,
     "Patient" INT,
     "Year" INT,
     "ProcCode" TEXT
);

.mode csv

.import visit2014.csv visit
.import cpt2014.csv cpt
.import diagnosis2014.csv diagnosis
.import ecode2014.csv ecode
.import proccode2014.csv proccode

DELETE FROM visit
WHERE "Year" <> 2014;

DELETE FROM cpt
WHERE "Year" <> 2014;

DELETE FROM diagnosis
WHERE "Year" <> 2014;

DELETE FROM ecode
WHERE "Year" <> 2014;

DELETE FROM proccode
WHERE "Year" <> 2014;


UPDATE visit SET "Gender" = NULL WHERE "Gender" = '';
UPDATE visit SET "Race" = NULL WHERE "Race" = '';
UPDATE visit SET "Ethnicity" = NULL WHERE "Ethnicity" = '';
UPDATE visit SET "TriageCat" = NULL WHERE "TriageCat" = '';
UPDATE visit SET "PayerType" = NULL WHERE "PayerType" = '';
UPDATE visit SET "EDDisposition" = NULL WHERE "EDDisposition" = '';
UPDATE visit SET "ModeOfArrival" = NULL WHERE "ModeOfArrival" = '';
UPDATE visit SET "AgeInYears" = NULL WHERE "AgeInYears" = '';
UPDATE visit SET "AgeInMonths" = NULL WHERE "AgeInMonths" = '';
UPDATE visit SET "AgeInDays" = NULL WHERE "AgeInDays" = '';
UPDATE visit SET "TriageDayofWeek" = NULL WHERE "TriageDayofWeek" = '';
UPDATE visit SET "TriageHour" = NULL WHERE "TriageHour" = '';
UPDATE visit SET "TriageToDischargeMinutes" = NULL WHERE "TriageToDischargeMinutes" = '';
    
UPDATE CPT SET "CPT" = NULL WHERE "CPT" = '';
UPDATE diagnosis SET "DX" = NULL WHERE "DX" = '';
UPDATE ecode SET "Ecode" = NULL WHERE "Ecode" = '';
UPDATE proccode SET "proccode" = NULL WHERE "proccode" = '';



-- Create look up tables
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE lkup_EDDisposition (Code INT, Descr TEXT);
INSERT INTO "lkup_EDDisposition" VALUES(1,'23 Hour Observation Unit/RTU');
INSERT INTO "lkup_EDDisposition" VALUES(2,'Admitted');
INSERT INTO "lkup_EDDisposition" VALUES(3,'Left Against Medical Advice');
INSERT INTO "lkup_EDDisposition" VALUES(4,'Died');
INSERT INTO "lkup_EDDisposition" VALUES(5,'Discharged');
INSERT INTO "lkup_EDDisposition" VALUES(6,'Left Without Treatment');
INSERT INTO "lkup_EDDisposition" VALUES(7,'Other');
INSERT INTO "lkup_EDDisposition" VALUES(8,'Stated Unknown');
INSERT INTO "lkup_EDDisposition" VALUES(9,'Transferred');
CREATE TABLE lkup_Ethnicity (Code INT, Descr TEXT);
INSERT INTO "lkup_Ethnicity" VALUES(1,'Hispanic');
INSERT INTO "lkup_Ethnicity" VALUES(2,'Non-Hispanic');
INSERT INTO "lkup_Ethnicity" VALUES(3,'Stated Unknown');
CREATE TABLE lkup_ModeOfArrival (Code INT, Descr TEXT);
INSERT INTO "lkup_ModeOfArrival" VALUES(1,'EMS Air');
INSERT INTO "lkup_ModeOfArrival" VALUES(2,'EMS Ground');
INSERT INTO "lkup_ModeOfArrival" VALUES(3,'Non-EMS/Walk-in');
INSERT INTO "lkup_ModeOfArrival" VALUES(4,'Other');
INSERT INTO "lkup_ModeOfArrival" VALUES(5,'Stated Unknown');
CREATE TABLE lkup_PayerType (Code INT, Descr TEXT);
INSERT INTO "lkup_PayerType" VALUES(1,'Commercial Insurance');
INSERT INTO "lkup_PayerType" VALUES(2,'Medicaid (including SCHIP)');
INSERT INTO "lkup_PayerType" VALUES(3,'Medicare');
INSERT INTO "lkup_PayerType" VALUES(4,'Other');
INSERT INTO "lkup_PayerType" VALUES(5,'Other Governmental Insurance (including CHAMPUS/TRICARE)');
INSERT INTO "lkup_PayerType" VALUES(6,'Self Pay');
INSERT INTO "lkup_PayerType" VALUES(7,'Stated Unknown');
INSERT INTO "lkup_PayerType" VALUES(8,'Workers Compensation');
CREATE TABLE lkup_Race (Code INT, Descr TEXT);
INSERT INTO "lkup_Race" VALUES(1,'American Indian or Alaskan Native');
INSERT INTO "lkup_Race" VALUES(2,'Asian');
INSERT INTO "lkup_Race" VALUES(3,'Black or African American');
INSERT INTO "lkup_Race" VALUES(4,'Native Hawaiian or Other Pacific Islander');
INSERT INTO "lkup_Race" VALUES(5,'White');
INSERT INTO "lkup_Race" VALUES(6,'Multiple Races');
INSERT INTO "lkup_Race" VALUES(7,'Stated Unknown');
INSERT INTO "lkup_Race" VALUES(8,'Other');
CREATE TABLE lkup_TriageCat (Code INT, Descr TEXT);
INSERT INTO "lkup_TriageCat" VALUES(1,'Critical');
INSERT INTO "lkup_TriageCat" VALUES(2,'Emergent');
INSERT INTO "lkup_TriageCat" VALUES(3,'Urgent');
INSERT INTO "lkup_TriageCat" VALUES(4,'Not-urgent');
INSERT INTO "lkup_TriageCat" VALUES(5,'Non-acute');
INSERT INTO "lkup_TriageCat" VALUES(6,'Unknown');
CREATE TABLE lkup_TriageDayofWeek (Code INT, Descr TEXT);
INSERT INTO "lkup_TriageDayofWeek" VALUES('               .','Missing');
INSERT INTO "lkup_TriageDayofWeek" VALUES(1,'Sunday');
INSERT INTO "lkup_TriageDayofWeek" VALUES(2,'Monday');
INSERT INTO "lkup_TriageDayofWeek" VALUES(3,'Tuesday');
INSERT INTO "lkup_TriageDayofWeek" VALUES(4,'Wednesday');
INSERT INTO "lkup_TriageDayofWeek" VALUES(5,'Thursday');
INSERT INTO "lkup_TriageDayofWeek" VALUES(6,'Friday');
INSERT INTO "lkup_TriageDayofWeek" VALUES(7,'Saturday');
CREATE TABLE lkup_Gender(Code TEXT, Descr TEXT);
INSERT INTO "lkup_Gender" VALUES('F','Female');
INSERT INTO "lkup_Gender" VALUES('M','Male');
INSERT INTO "lkup_Gender" VALUES('U','Stated Unknown');
COMMIT;

VACUUM;


.mode column
.header on
