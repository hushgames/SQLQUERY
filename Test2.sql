CREATE DATABASE PRELIM_DB;
USE PRELIM_DB;
CREATE TABLE patient (
	ptnt_id		SMALLINT	NOT NULL IDENTITY(100,1) PRIMARY KEY,
	ptnt_name	VARCHAR(40) NOT NULL,
	ptnt_dob	DATE,
	ptnt_gender CHAR(1)		NOT NULL CHECK(ptnt_gender IN('M','F')),
	ptnt_addr	VARCHAR(50)
);

CREATE TABLE appointment (
	aptmnt_id	SMALLINT NOT NULL IDENTITY PRIMARY KEY,
	ptnt_id		SMALLINT NOT NULL,
	doc_id		SMALLINT NOT NULL,
	aptmnt_date	DATE,
	FOREIGN KEY(ptnt_id)
		REFERENCES patient(ptnt_id)
);

EXEC sp_help 'patient';
EXEC sp_help 'appointment';

INSERT INTO patient 
	VALUES
		('Carla Espinosa', '1999-11-17', 'F', 'Cebu City'),
		('Robert Esguerra', '2003-03-25', 'M', 'Naga City'),
		('Juan Manuel', '2000-10-19', 'M', 'Talisay City');

SELECT * FROM patient;
SELECT * FROM appointment;

ALTER TABLE appointment 
	ADD  
		aptmnt_time		TIME,
		aptmnt_idea		VARCHAR(10),
		aptmnt_status	VARCHAR(20);

INSERT INTO appointment 
	VALUES
		(101, 3, '2024-09-10', '10:30', 'Check-up', 'scheduled'),
		(100, 2, '2024-09-12', '11:25', 'Follow-up', 're-schedule'),
		(102, 3, '2024-09-15', '09:15', 'Check-up', 'cancelled');

EXEC sp_rename 'appointment.aptmnt_idea', 'aptmnt_reason';

ALTER TABLE appointment
	ALTER COLUMN 
		aptmnt_reason VARCHAR(50);

UPDATE appointment
	SET 
		aptmnt_date = '2024-09-20',
		aptmnt_time = '10:15',
		aptmnt_status = 'scheduled';

DELETE FROM appointment
	WHERE
		ptnt_id = 100;
		 
SELECT * INTO patient_bkup FROM patient;
	SELECT * FROM patient_bkup;

SELECT * INTO appointment_bkup FROM appointment;
	SELECT * FROM appointment_bkup;
