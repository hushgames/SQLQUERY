USE PilapilH_db;


-- Problem 1: For employees whose salary, increased by 5 percent, is less than or equal to $60000. List the following: Lastname, Current Salary, Salary increased by 5 percent, 
-- Monthly salary increased by 5 percent. List the following column names for the generated columns: INC-Y-SALARY and INC-M-SALARY. Use the proper conversion function to display 
-- the increased salary and monthly salary with two digits to the right of the decimal point. Sort the results by annual salary.

SELECT 		e.lastname, e.salary AS "Current Salary", ROUND(e.salary * 1.05, 2) AS "INC-Y-SALARY", ROUND((e.salary * 1.05) / 12, 2) AS "INC-M-SALARY"
FROM		employee e
WHERE 		(e.salary * 1.05) <= 60000
ORDER BY	INC-Y-SALARY;


-- Problem 2: All employees with an education level of 18 or 20 will receive a salary increase of $1800.00 and their bonus will be cut in half. 
-- List concatenated first name, middle initial, and last name as EMPLOYEE NAME, education level in words, new salary, and the new bonus. Display the new salary and new bonus with 
-- two digits to the right  of the decimal point. Use the column names NEW-SALARY nd NEW-BONUS for the generated columns. Employees with an education level of 20 should be listed first. 
-- For employees with the same education level, sort the list by salary.

SELECT 			CONCAT(e.firstname, ' ', COALESCE(e.midinit, ''), ' ', e.lastname) AS "EMPLOYEE NAME",
	CASE 		e.edlevel
		WHEN 	18 THEN 'EIGHTEEN'
        WHEN 	20 THEN 'TWENTY'
	END AS 		"Education Level", 
    ROUND		(e.salary + 1800, 2) AS "NEW-SALARY",
	ROUND		(e.bonus / 2, 2) AS "NEW-BONUS"
FROM 			employee e
WHERE 			e.edlevel IN(18, 20)
ORDER BY 		e.edlevel DESC, e.salary;


-- Problem 3: The salary will be decreased by $1000.00 for all employees matching the following criteria: *They belong to department D11 *Their salary is more than or equal to 80% of $50000.00 
-- *Their salary is less than or equal to 120% of $50000.00. Use the name DECR-SALARY for the derived column. List department number, department name, last name, salary, and decreased salary. 
-- Sort the results by salary. 

SELECT 		d.deptno, d.deptname, e.lastname, ROUND(e.salary, 2) AS "Salary", ROUND(e.salary - 1000, 2) AS "DECR-SALARY"
FROM 		department d
	JOIN 	employee e 
		ON 	d.deptno = e.workdept
WHERE 		e.workdept = 'D11'
	AND 	e.salary >= 0.80 * 50000
		AND e.salary <= 1.20 * 50000
ORDER BY 	e.salary;


-- Problem 4: Produce a list of all employees in department D11 that have an income (sum of salary, commission, and bonus) that is greater than their salary increased by 10 percent. 
-- Name the generated column INCOME. List department name, concatenated first letter of the employees first name followed by a period, middle initial period, and last name AS EMP-NAME, 
-- and income. Sort the result list in descending order by income. For this problem consider that there are employees that may not have a bonus or a commission. Even though, they have 
-- their salary as income, so it should not be a NULL salary value.

SELECT 			d.deptname, CONCAT(LEFT(e.firstname, 1), '.', COALESCE(e.midinit, ''), '.', e.lastname) AS "EMP-NAME",  (e.salary + COALESCE(e.comm, 0) + COALESCE(e.bonus, 0)) AS "INCOME"
FROM 			department d 
	JOIN		employee e
		ON		d.deptno = e.workdept
WHERE 			e.workdept = 'D11' 
	AND 		(e.salary + COALESCE(e.comm, 0) + COALESCE(e.bonus, 0)) > e.salary * 1.10
ORDER BY		INCOME DESC;


-- Problem 5: List all departments that have no manager assigned. List department number, department name, and the manager number. Replace unknown manager numbers with the text 
-- "UNKNOWN MANAGER" and name the column MGRNO. Order the list by department number.

SELECT		d.deptno, d.deptname, COALESCE(d.mgrno, 'UNKNOWN MANAGER') AS "MGRNO"
FROM 		department d
WHERE 		d.mgrno IS NULL
ORDER BY 	d.deptno;


-- Problem 6: List the project number, major project number, mixed case concatenated first name and last name, day name of the project starting date, and project start date. 
-- List only projects that have a project number beginning with MA. If the major project number is unknown, display the text 'MAIN PROJECT". Name the derived columns: EMP-NAME, 
-- PRJ-START-DAY. Order the result list by projno.

-- SELECT		p.projno, p.majproj, CONCAT((e.firstname, ' ', e.lastname) AS "EMP-NAME", '', p.prstdate AS "DAY NAME", p.prstdate) AS "PRJ-START-DAY"

SELECT 		p.projno, COALESCE(p.majproj, 'MAIN PROJECT') AS "MAJPROJ", CONCAT(e.firstname, ' ', e.lastname) AS "EMP-NAME", DATE_FORMAT(p.prstdate, '%W') AS "DAY NAME", p.prstdate AS "PRJ-START-DAY"
FROM 		project p JOIN employee e
	ON		e.empno = p.respemp
WHERE 		p.projno LIKE 'MA%'
ORDER BY 	p.projno;


-- Problem 7: List all the employees who were younger than 25 when they joined the company. List their employee number, name(concatenad first name, middle initial, and last name), 
-- department name, and age when they joined the company. Name the derived column AGE. Sort the result by age and then by employee number. --

SELECT 		e.empno, CONCAT(e.firstname, ' ', COALESCE(e.midinit, ''), ' ', e.lastname) AS "NAME", d.deptname, FLOOR(DATEDIFF(e.hiredate, e.birthdate) / 365) AS "AGE"
FROM		employee e JOIN department d
	ON		e.workdept = d.deptno
WHERE 		FLOOR(DATEDIFF(e.hiredate, e.birthdate) / 365) < 25
	AND 	e.hiredate > e.birthdate
ORDER BY 	AGE, e.empno;



-- Problem 8: Provide a list of all projects which ended on December 1, 2002. Display  the year and month of the starting date and project number. Sort the result by project number. 
-- Name the derived columns MONTH and YEAR. Order the list by activity number within project number.

SELECT		ea.actno, p.projno, DATE_FORMAT(p.prstdate, '%M') AS "MONTH" ,DATE_FORMAT(p.prendate, '%Y') AS "YEAR"
FROM 		project p JOIN emp_act ea
	ON		p.respemp = ea.empno
WHERE		p.prendate = '2002-12-01'
ORDER BY 	ea.actno, p.projno;

-- Problem 9: List the project number, project name, and project duration, in weeks, for all projects that have a project number beggining with MA and DP. The duration should be rounded 
-- and displayed with one decimal postion. Name the derived columns DURATION IN WEEKS. Order the list by project number.

SELECT 		p.projno, p.projname, ROUND(DATEDIFF(p.prendate, p.prstdate) / 7, 1) AS "IN WEEKS"
FROM		project p
WHERE 		p.projno LIKE 'MA%' OR p.projno LIKE 'DP%'
ORDER BY	p.projno;



-- Problem 10: For projects that have a project number not beggining with MA, list the project number, employee name assigned to the project, department name of the employee, 
-- project ending date, and modified ending date assuming the projects will be delayed  by 10 percent. Name the column containing the PRENDATE values, ESTIMATED. Name the derived 
-- column EXPECTED. Order the list by project number.


SELECT 		p.projno, CONCAT(e.firstname, ' ', COALESCE(e.midinit, ''), ' ', e.lastname) AS "EMP-NAME", d.deptname, p.prendate AS "ESTIMATED", DATE_ADD(p.prendate, INTERVAL (DATEDIFF(p.prendate, p.prstdate) * 0.10) DAY) AS "EXPECTED"
FROM 		project p 
JOIN		employee e ON p.respemp = e.empno 
JOIN		department d ON e.workdept = d.deptno
WHERE 		p.projno NOT LIKE 'MA%'
ORDER BY	p.projno;
