CREATE TABLE CS_IMDbSys31_MG (
	sid		SMALLINT NOT NULL PRIMARY KEY,
	sname	VARCHAR(30) NOT NULL,
	mgrade	DECIMAL(2,1) NOT NULL,
	remarks VARCHAR(20)
);

CREATE TABLE MTG_LOG (
	log_id	SMALLINT IDENTITY(1,1) NOT NULL,
	sid		SMALLINT NOT NULL PRIMARY KEY,
	sname	VARCHAR(30) NOT NULL,
	operation VARCHAR(30),
	log_date DATETIME,
	log_by VARCHAR(100)
);

CREATE TRIGGER ai_mg_log ON CS_IMDbSys31_MG
	AFTER INSERT
	AS
		INSERT INTO MTG_LOG(sid, sname, operation, log_date, log_by)
		SELECT sid, sname, 'INSERT', GETDATE(), SUSER_NAME()
		FROM CS_IMDbSys31_MG;
	GO

INSERT INTO CS_IMDbSys31_MG
VALUES
	('100','Dietcan',1.9,'Passed'),
	('140','Norhpar',2.2,'Passed'),
	('180','Vinyam',3.2,'FAILED')

SELECT * FROM CS_IMDbSys31_MG
SELECT * FROM MTG_LOG