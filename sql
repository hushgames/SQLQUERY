CREATE DATABASE PilapilH_db;

USE PilapilH_db;

CREATE TABLE DEPARTMENT(
	DEPTNO CHAR(3) NOT NULL PRIMARY KEY,
	DEPTNAME VARCHAR(60) NOT NULL,
	MGRNO INT NULL,
	ADMRDEPT CHAR(3) NOT NULL,
	LOCATION VARCHAR(60) NULL
);

INSERT INTO DEPARTMENT(DEPTNO, DEPTNAME, MGRNO, ADMRDEPT, LOCATION)
VALUES
	('A00', 'SpiFFY COMPUTER SERVICE DIV.', '000010', 'A00', 'ADMIN BLDG. 1ST FLOOR'),
	('B01', 'PLANNING', '000020', 'A00', 'ADMIN BLDG. 2ND FLOOR'),
	('C01', 'INFORMATION CENTER', '000030', 'A00', 'ADMIN BLDG. GROUND FLOOR'),
	('D01', 'DEVELOPMENT CENTER', NULL, 'A00', 'DEV BDLG. GROUND AND 1ST FLOOR'),
	('D11', 'MANUFACTURING SYSTEMS', '000060', 'D01', 'DEV BDLG. 2ND, 3RD, AND 4TH FLOOR'),
	('D21', 'ADMINISTRATION SYSTEMS', '000070', 'D01', 'ADMIN BLDG. 1ST FLOOR NORTH-WING'),
	('E01', 'SUPPORT SERVICES', '000050', 'A00', 'ADMIN BLDG. 1ST FLOOR WEST-WING'),
	('E11', 'OPERATIONS', '000090', 'E01', NULL),
	('E21', 'SUPPORT SUPPORT', '000100', 'E01', NULL),
	('F22', 'BRANCH OFFICE F2', NULL, 'E01', NULL),
	('G22', 'BRANCH OFFICE G2', NULL, 'E01', NULL),
	('H22', 'BRANCH OFFICE H2', NULL, 'E01', NULL),
	('I22', 'BRANCH OFFICE I2', NULL, 'E01', NULL),
	('J22', 'BRANCH OFFICE J2', NULL, 'E01', NULL);
      
SELECT * FROM pilapilh_db.department;

ALTER TABLE department
ADD CONSTRAINT FOREIGN KEY (MGRNO) REFERENCES EMPLOYEE(empno);

CREATE TABLE EMPLOYEE(
	empno CHAR(6) NOT NULL PRIMARY KEY,
	firstname VARCHAR(20) NOT NULL,
	midinit CHAR(1) NULL,
	lastname VARCHAR(20) NOT NULL,
	workdept CHAR(3) NOT NULL,
	phoneno CHAR(11) NOT NULL,
	hiredate DATE NOT NULL,
	job VARCHAR(20) NOT NULL,
	edlevel CHAR(2) NOT NULL,
	gender CHAR(1) NOT NULL,
	birthdate CHAR(10) NOT NULL,
	salary DECIMAL NOT NULL,
	bonus DECIMAL NULL,
	comm DECIMAL NULL
);

INSERT INTO EMPLOYEE(empno, firstname, midinit, lastname, workdept, phoneno, hiredate, job, edlevel, gender, birthdate, salary, bonus, comm)
VALUES
	('000010', 'CHRISTINE', 'I', 'HAAS', 'A00', '08131233978', '1995-01-01', 'PRESIDENT', 18, 'F', '1963-08-24', 152750.00, 1000.00, 4220.00),
	('000020', 'MICHAEL', 'L', 'THOMPSON', 'B01', '09082453476', '2003-10-10', 'MANAGER', 18, 'M', '1978-02-02', 94250.00, 800.00, 3300.00),
	('000030', 'SALLY', 'A', 'KWAN', 'C01', '09112544738', '2005-04-05', 'MANAGER', 20, 'F', '1971-05-11', 98250.00, 800.00, 3060.00),
	('000050', 'JOHN', 'B', 'GEYER', 'E01', '09136546789', '1979-08-17', 'MANAGER', 16, 'M', '1955-09-15', 80175.00, 800.00, 3214.00),
	('000060', 'IRVING', 'F', 'STERN', 'D11', '09196576423', '2003-09-14', 'MANAGER', 16, 'M', '1975-07-07', 72250.00, 500.00, 2580.00),
	('000070', 'EVA', 'D', 'PULASKI', 'D21', '09217857831', '2005-09-30', 'MANAGER', 16, 'F', '2003-05-26', 96170.00, 700.00, 2893.00),
	('000090', 'EILEEN', 'W', 'HENDERSON', 'E11', '09286855498', '2000-08-15', 'MANAGER', 16, 'F', '1971-05-15', 89750.00, 600.00, 2380.00),
	('000100', 'THEODORE', 'Q', 'SPENSER', 'E21', '09468740972', '2000-06-19', 'MANAGER', 14, 'M', '1980-12-18', '86150.00', '500.00', '2092.00'),
	('000110', 'VINCENZO', 'G', 'LUCCHESSI', 'A00', '09473653490', '1988-05-16', 'SALESREP', 19, 'M', '1959-11-05 ', '66500.00', '900.00', '3720.00'),
	('000120', 'SEAN', NULL, 'O''CONNELL', 'A00', '08173542167', '1993-12-05', 'CLERK', 14, 'M', '1972-10-18', '49250.00', '600.00', '2340.00'),
	('000130', 'DELORES', 'M', 'QUINTANA', 'C01', '09042574578', '2001-07-28', 'ANALYST', 16, 'F', '1955-09-15', '73800.00', NULL, '1904.00'),
	('000140', 'HEATHER', 'A', 'NICHOLLS', 'C01', '09157411793', '2006-12-15', 'ANALYST', 18, 'F', '1976-01-19', '68420.00', '600.00', '2274.00'),
	('000150', 'BRUCE', NULL, 'ADAMSON', 'D11', '09175244510', '2002-02-12', 'DESIGNER', 16, 'M', '1980-12-18', 86150.00, 500.00, 2092.00),
	('000160', 'ELIZABETH', 'R', 'PIANKA', 'D11', '09365473782', '2006-10-11', 'DESIGNER', 17, 'F', '1980-04-12', 62250.00, 400.00, 1780.00),
	('000170', 'MASATOSHI', 'J', 'YOSHIMURA', 'D11', '09542582890', '1999-09-15', 'DESIGNER', 16, 'M', '1981-01-05', 44680.00, 500.00, 1974.00),
	('000180', 'MARILYN', NULL, 'SCOUTTEN', 'D11', '90552141682', '2003-07-07', 'DESIGNER', 17, 'F', '1979-02-21', 51340.00, 500.00, 1707.00),
	('000190', 'JAMES', 'S', 'WALKER', 'D11', '09765482986', '2004-07-26', 'DESIGNER', 16, 'M', '1982-06-25', 50450.00, 400.00, 1636.00),
	('000200', 'DAVID', 'S', 'BROWN', 'D11', '08982144501', '2002-03-03', 'DESIGNER', 16, 'M', '1971-05-29', 57740.00, 600.00, 2217.00),
	('000210', 'WILLIAM', 'T', 'JONES', 'D11', '08974570942', '1998-04-11', 'DESIGNER', 17, 'M', '2003-02-23', 68270.00, 400.00, 1462.00),
	('000230', 'JAMES', 'J', 'JEFFERSON', 'D21', '09942502094', '1996-11-21', 'CLERK', 14, 'M', '1980-05-30', 42180.00, 400.00, 1774.00),
	('000240', 'SALVATORE', 'M', 'MARINO', 'D21', '09075843780', '2004-12-05', 'CLERK', 17, 'M', '2002-03-31', 48760.00, 600.00, 2301.00),
	('000250', 'DANIEL', 'S', 'SMITH', 'D21', '09102540961', '1999-10-30', 'CLERK', 15, 'M', '1969-11-12', 49180.00, 400.00, 1534.00),
	('000260', 'SYBIL', 'P', 'JOHNSON', 'D21', '09918368953', '2005-09-11', 'CLERK', 16, 'F', '1976-10-05', 47250.00, 300.00, 1380.00),
	('000270', 'MARIA', 'L', 'PEREZ', 'D21', '09301239001', '2006-09-30', 'CLERK', 15, 'F', '2003-05-26', '37380.00', '500.00', '2190.00'),
	('000280', 'ETHEL', 'R', 'SCHNEIDER', 'E11', '09386178997', '1997-03-24', 'OPERATOR', 17, 'F', '2003-05-26', 37380.00, 500.00, 2190.00),
	('000290', 'JOHN', 'R', 'PARKER', 'E11', '09468124502', '2006-05-30', 'OPERATOR', 12, 'M', '1985-07-09', 35340.00, 300.00, 1227.00),
	('000300', 'PHILIP', 'X', 'SMITH', 'E11', '09486572095', '2002-06-19', 'OPERATOR', 14, 'M', '1976-10-27', 37750.00, 400.00, NULL),
	('000310', 'MAUDE', 'F', 'SETRIGHT', 'E11', '09502343332', '1994-09-12', 'OPERATOR', 12, 'F', '1961-04-21', 35900.00, 300.00, 1272.00),
	('000320', 'RAMLAL', 'V', 'MENTA', 'E21', '09635479990', '1995-07-07', 'FIELDREP', 16, 'M', '1962-08-11', 39950.00, 400.00, 1596.00),
	('000330', 'WING', NULL, 'LEE', 'E21', '09895742103', '2006-02-23', 'FIELDREP', 14, 'M', '1971-07-18', 45370.00, 500.00, 2030.00),
	('000340', 'JASON', 'R', 'GOUNOT', 'E21', '09987525698', '1977-05-05', 'FIELDREP', 16, 'M', '1956-05-17', 43840.00, 500.00, 1907.00),
	('200010', 'DIAN', 'J', 'HEMMINGER', 'A00', '09051423978', '1995-01-01', 'SALESREP', 18, 'F', '1973-08-14', 46500.00, 1000.00, 4220.00),
	('200120', 'GREG', NULL, 'ORLANDO', 'A00', '09112582167', '2002-05-05', 'CLERK', 14, 'M', '1972-10-18', 39250.00, 600.00, 2340.00),
	('200140', 'KIM', 'N', 'NATZ', 'C01', '09175321793', '2006-12-15', 'ANALYST', 18, 'F', '1976-01-19', '68420.00', NULL, '2274.00'),
	('200170', 'KIYOSHI', NULL, 'YAMAMOTO', 'D11', '09548722890', '2005-09-15', 'DESIGNER', 16, 'M', '1981-01-05', '64680.00', '500.00', '1974.00'),
	('200220', 'REBA', 'K', 'JOHN', 'D11', '09284570672', '2005-08-29', 'DESIGNER', 18, 'F', '1978-03-19', '69840.00', '600.00', '2387.00'),
	('200240', 'ROBERT', 'M', 'MONTEVERDE', 'D21', '09244783780', '2004-12-05', 'CLERK', 17, 'M', '1984-03-31', '37760.00', '600.00', '2301.00'),
	('200280', 'EILEEN', 'R', 'SCHWARTZ', 'E11', '09892148997', '1997-03-24', 'OPERATOR', 17, 'F', '1966-03-28', '46250.00', '500.00', '2100.00'),
	('200310', 'MICHELLE', 'F', 'SPRINGER', 'E11', '09375483332', '1994-09-12', 'OPERATOR', 12, 'F', '1961-04-21', '35900.00', '300.00', NULL),
	('200330', 'HELENA', NULL, 'WONG', 'E21', '09094522103', '2006-02-23', 'FIELDREP', 14, 'F', '1971-07-18', '35370.00', '500.00', '2030.00'),
	('200340', 'ROY', 'R', 'ALONZO', 'E21', '09152475698', '1997-07-05', 'FIELDREP', 16, 'M', '1956-05-17', '31840.00', '500.00', '1907.00');

SELECT * FROM pilapilh_db.employee;

ALTER TABLE employee
ADD CONSTRAINT FOREIGN KEY (MGRNO) REFERENCES EMPLOYEE(empno);

CREATE TABLE PROJECT(
	PROJNO CHAR(6) NOT NULL PRIMARY KEY,  
	PROJNAME VARCHAR(30) NOT NULL,
	DEPTNO CHAR(3) NOT NULL,
	RESPEMP CHAR(6) NOT NULL,
	PRSTAFF DECIMAL NOT NULL,
	PRSTDATE DATE NOT NULL,
	PRENDATE DATE NOT NULL,
	MAJPROJ CHAR(6) NULL
);

INSERT INTO PROJECT(PROJNO, PROJNAME, DEPTNO, RESPEMP, PRSTAFF, PRSTDATE, PRENDATE, MAJPROJ)
VALUES
	('AD3100', 'ADMIN SERVICES', 'D01', '000010', '6.50', '2021-01-01', '2023-02-01', NULL),
	('AD3110', 'GENERAL ADMIN SYSTEMS', 'D21', '000070', '6.00', '2019-05-01', '2022-02-01', 'AD3100'),
	('AD3111', 'PAYROLL PROGRAMMING', 'D21', '000230', '2.00', '2020-03-01', '2022-02-01', 'AD3110'),
	('AD3112', 'PERSONNEL PROGRAMMING', 'D21', '000250', '1.00', '2018-04-01', '2021-02-01', 'AD3110'),
	('AD3113', 'ACCOUNT PROGRAMMING', 'D21', '000270', '2.00', '2018-06-01', '2022-02-01', 'AD3110'),
	('IF1000', 'QUERY SERVICES', 'C01', '000030', '2.00', '2020-01-01', '2021-02-01', NULL),
	('IF2000', 'USER EDUCATION', 'C01', '000030', '1.00', '2020-04-01', '2021-02-01', NULL),
	('MA2100', 'WELD LINE AUTOMATION', 'D01', '000010', '12.00', '2021-10-01', '2023-02-01', NULL),
	('MA2110', 'WL PROGRAMMING', 'D11', '000060', '9.00', '2018-08-01', '2020-02-01', 'MA2100'),
	('MA2111', 'WL PROGRAM DESIGN', 'D11', '000220', '2.00', '2019-01-01', '2020-12-01', 'MA2110'),
	('MA2112', 'WL ROBOT DESIGN', 'D11', '000150', '3.00', '2020-01-01', '2021-12-01', 'MA2110'),
	('MA2113', 'WL PROD CONT PROGS', 'D11', '000160', '3.00', '2017-02-15', '2019-12-01', 'MA2110'),
	('OP1000', 'OPERATION SUPPORT', 'E01', '000050', '6.00', '2019-01-01', '2020-02-01', NULL),
	('OP1010', 'OPERATION', 'E11', '000090', '5.00', '2020-04-01', '2021-02-01', 'OP1000'),
	('OP2000', 'GEN SYSTEMS SERVICES', 'E01', '000000', '0.00', '2017-01-01', '2019-02-01', NULL),
	('OP2010', 'SYSTEMS SUPPORT', 'E21', '000100', '4.00', '2020-05-01', '2021-02-01', 'OP2000'),
	('OP2011', 'SCP SYSTEMS SUPPORT', 'E21', '000320', '1.00', '2018-07-01', '2020-02-01', 'OP2010'),
	('OP2012', 'APPLICATIONS SUPPORT', 'E21', '000330', '1.00', '2018-09-01', '2021-02-01', 'OP2010'),
	('OP2013', 'DB/DC SUPPORT', 'E21', '000340', '1.00', '2020-02-01', '2022-02-01', 'OP2010'),
	('PL2100', 'WELD LINE PLANNING', 'B01', '000020', '1.00', '2017-07-01', '2020-09-15', 'MA2100');
      
SELECT * FROM pilapilh_db.project;

CREATE TABLE EMP_ACT(
	empno CHAR(6) not null PRIMARY KEY,
    projno CHAR(6) not null,
    actno SMALLINT not null,
    emptime DECIMAL not null,
    emstdate DATE not null,
    EMENDATE DATE not null
);

INSERT INTO EMP_ACT(empno, projno, actno, emptime, emstdate, EMENDATE)
VALUES
	('000010', 'AD3110', '100', '0.50', '2021-01-05', '2021-03-29'),
	('000020', 'AD3110', '10', '1.00', '2021-01-15', '2022-02-19'),
	('000030', 'AD3111', '60', '0.50', '2022-01-15', '2023-01-20'),
	('000040', 'AD3111', '60', '0.50', '2023-01-15', '2024-01-30'),
	('000050', 'AD3111', '80', '1.00', '2020-03-15', '2022-01-20'),
	('000060', 'AD3111', '80', '1.00', '2022-03-15', '2023-02-15'),
	('000070', 'AD3111', '70', '1.00', '2024-01-15', '2024-01-25'),
	('000080', 'AD3111', '70', '1.00', '2024-01-25', '2024-01-25'),
	('000090', 'AD3112', '80', '1.00', '2018-01-01', '2021-02-01'),
	('000100', 'AD3112', '70', '0.50', '2018-01-01', '2020-02-01'),
	('000110', 'AD3112', '70', '0.50', '2018-02-15', '2020-02-15'),
	('000120', 'AD3112', '60', '1.00', '2018-04-01', '2021-02-01'),
	('000130', 'AD3112', '60', '1.00', '2018-08-15', '2021-08-15'),
	('000140', 'AD3112', '70', '0.75', '2018-08-15', '2021-10-01'),
	('000150', 'AD3112', '70', '1.00', '2018-10-01', '2022-02-01'),
	('000160', 'AD3112', '70', '1.00', '2018-12-15', '2022-02-01'),
	('000170', 'AD3113', '80', '0.25', '2018-08-15', '2018-08-15'),
	('000180', 'AD3113', '180', '0.50', '2018-08-15', '2018-10-01'),
	('000190', 'AD3113', '180', '1.00', '2018-08-15', '2022-04-15'),
	('000200', 'AD3113', '180', '1.00', '2018-08-01', '2022-06-01'),
	('000210', 'AD3113', '180', '1.00', '2018-08-01', '2022-07-01'),
	('000220', 'AD3113', '180', '1.00', '2018-08-01', '2022-08-01'),
	('000230', 'AD3113', '180', '1.00', '2018-08-01', '2022-10-01'),
	('000240', 'AD3113', '180', '1.00', '2018-08-01', '2022-09-01'),
	('000250', 'AD3112', '70', '0.25', '2018-04-01', '2018-08-15'),
	('000260', 'AD3112', '80', '0.50', '2018-08-15', '2021-08-15'),
	('000270', 'AD3113', '180', '0.50', '2018-08-15', '2022-08-01'),
	('000280', 'AD3113', '180', '1.00', '2018-08-15', '2022-07-01'),
	('000290', 'AD3113', '180', '1.00', '2018-08-01', '2022-10-01'),
	('000300', 'AD3113', '180', '0.25', '2018-08-01', '2022-10-15'),
	('000310', 'AD3113', '70', '0.75', '2018-09-01', '2022-10-15'),
	('000320', 'AD3113', '70', '1.00', '2018-10-01', '2022-02-01'),
	('000330', 'AD3113', '80', '1.00', '2018-10-15', '2024-03-01'),
	('000340', 'AD3113', '180', '1.00', '2018-10-15', '2022-04-15'),
	('000350', 'IF1000', '100', '0.50', '2021-01-15', '2021-01-30'),
	('000360', 'IF1000', '100', '1.00', '2020-02-01', '2021-01-25'),
	('000370', 'IF1000', '90', '1.00', '2020-02-01', '2021-01-25'),
	('000380', 'IF1000', '100', '0.50', '2020-01-15', '2021-01-15'),
	('000390', 'IF2000', '90', '0.50', '2020-02-01', '2021-01-25'),
	('000400', 'IF2000', '90', '1.00', '2020-02-01', '2021-01-15'),
	('000410', 'IF2000', '100', '1.00', '2020-02-01', '2021-01-15'),
	('000420', 'IF2000', '110', '0.50', '2020-01-01', '2021-02-01'),
	('000430', 'IF2000', '100', '1.00', '2020-02-01', '2021-01-25'),
	('000440', 'MA2100', '200', '1.00', '2021-10-15', '2023-02-01'),
	('000450', 'MA2110', '110', '1.00', '2019-08-01', '2020-10-15'),
	('000460', 'MA2111', '80', '1.00', '2020-01-15', '2021-12-01'),
	('000470', 'MA2111', '100', '1.00', '2019-01-01', '2020-12-01'),
	('000480', 'MA2112', '100', '3.00', '2020-01-15', '2022-12-15'),
	('000490', 'MA2112', '110', '1.00', '2020-01-01', '2022-02-15'),
	('000500', 'MA2112', '110', '1.00', '2020-02-01', '2022-02-01'),
	('000510', 'MA2113', '70', '1.00', '2020-02-15', '2021-02-01'),
	('000520', 'MA2113', '80', '0.50', '2017-03-01', '2021-12-25'),
	('000530', 'MA2113', '90', '1.00', '2017-02-01', '2022-02-01'),
	('000540', 'OP1000', '130', '1.00', '2017-01-01', '2019-01-10'),
	('000550', 'OP1000', '140', '1.00', '2017-01-01', '2019-02-10'),
	('000560', 'OP1010', '130', '1.00', '2017-01-01', '2019-02-01'),
	('000570', 'OP1010', '140', '1.00', '2020-04-01', '2021-02-01'),
	('000580', 'OP2000', '10', '1.00', '2019-03-01', '2021-02-01'),
	('000590', 'OP2000', '140', '1.00', '2019-02-01', '2021-02-01'),
	('000600', 'OP2000', '130', '0.75', '2019-02-01', '2021-02-01'),
	('000610', 'OP2010', '140', '0.75', '2020-05-01', '2021-02-01'),
	('000620', 'OP2011', '140', '0.25', '2020-04-01', '2021-02-01'),
	('000630', 'OP2012', '140', '0.50', '2020-04-01', '2021-02-01'),
	('000640', 'OP2012', '140', '0.75', '2020-01-01', '2021-02-01'),
	('000650', 'OP2012', '140', '1.00', '2020-02-01', '2021-02-01'),
	('000660', 'OP2013', '70', '0.25', '2020-02-01', '2022-02-01'),
	('000670', 'OP2013', '70', '1.00', '2020-03-01', '2022-02-01'),
	('000680', 'PL2100', '30', '1.00', '2017-07-15', '2020-12-15');

SELECT * FROM pilapilh_db.EMP_ACT;
