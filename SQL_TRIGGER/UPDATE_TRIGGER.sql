CREATE TRIGGER au_mg_log ON CS_IMDbSys31_MG
	AFTER UPDATE
	AS
		DECLARE @sid SMALLINT, @sname VARCHAR(30);
		SELECT @sid = c.sid FROM CS_IMDbSys31_MG c;
		SELECT @sname = c.sname FROM CS_IMDbSys31_MG c;

		IF UPDATE(mgrade)
			INSERT INTO MTG_LOG (sid,sname, operation, log_date, log_by)
			VALUES
				(@sid, @sname, 'UPDATE', GETDATE(), SUSER_NAME());
	GO


UPDATE CS_IMDbSys31_MG
SET mgrade = 3.0, remarks = 'Passed'
WHERE sid = 180;


SELECT * FROM CS_IMDbSys31_MG
SELECT * FROM MTG_LOG