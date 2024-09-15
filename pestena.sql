-- PROBLEM 1: Produce a report that list all employees that were younger than their managers and also hired before their managers. List employee work department, work department name, employee's last name as EMPLOYEE, employee's birthdate as EMP-DOB, manager's last name as MANAGER, the manager's birthdate as MGR-DOB, and
-- the hiring dates of both the employee and the manager. List only those employees and manager working at departments with CENTER and SYSTEMS as part of the 
-- department names. Sequence the cursor list by the department name and then by employee's lastname.

SELECT 		E1.workdept, D.DEPTNAME, E1.birthdate AS EMP_DOB, E1.hiredate AS EMP_HIREDATE, E2.hiredate AS MGR_HIREDATE
FROM 		EMPLOYEE E1
JOIN 		DEPARTMENT D 
	ON 		E1.workdept = D.DEPTNO
JOIN 		EMPLOYEE E2 
	ON 		D.MGRNO = E2.empno
WHERE 		E1.birthdate > E2.birthdate
	AND 	E1.hiredate < E2.hiredate
	AND 	(D.DEPTNAME LIKE '%CENTER%' OR D.DEPTNAME LIKE '%SYSTEMS%')
ORDER BY 	D.DEPTNAME, E1.lastname;



SELECT 		e.workdept, d.deptname, e.lastname AS EMPLOYEE, e.birthdate AS "EMP-DOB",e.hiredate, m.lastname as MANAGER, m.birthdate AS "MGR-DOB", m.hiredate
FROM   		employee e JOIN department d
	ON 		e.workdept = d.deptno
		JOIN employee m
		ON d.mgrno = e.empno
WHERE e.birthdate > m.birthdate
    AND e.hiredate < m.hiredate
    AND (d.deptname LIKE '%CENTER%' OR d.deptname LIKE '%SYSTEMS%')
ORDER BY d.deptname, e.lastname;

-- PROBLEM 2: The second line manager needs a list of activities which begin on March 20, 2017 up to January 15, 2020. The data included in the list are the
-- department number, department name, activity number, project name, employee number, employee last name assigned to the project, gender as MALE or FEMALE and application level in words for male employees only. Filter the list by activity number that is divisible by 3. Order the list by activity number descending 
-- within department number ascending.

SELECT D.DEPTNO, D.DEPTNAME, EA.actno, P.PROJNAME, E.empno, E.lastname, 
   CASE E.gender
	   WHEN 'M' THEN 'MALE'
	   WHEN 'F' THEN 'FEMALE'
   END AS GENDER,
   CASE 
	   WHEN E.gender = 'M' THEN
		   CASE E.edlevel
			   WHEN '12' THEN 'High School'
			   WHEN '14' THEN 'Associate Degree'
			   WHEN '16' THEN 'Bachelor\'s Degree'
			   WHEN '18' THEN 'Master\'s Degree'
			   ELSE 'Other'
		   END
	   ELSE NULL
   END AS "APPLICATION_LEVEL"
FROM 		EMP_ACT EA JOIN EMPLOYEE E 
	ON 		EA.empno = E.empno JOIN PROJECT P 
		ON  EA.projno = P.PROJNO JOIN DEPARTMENT D 
			ON P.DEPTNO = D.DEPTNO
WHERE 		EA.emstdate >= '2017-03-20'
	AND 	EA.emstdate <= '2020-01-15'
		AND EA.actno % 3 = 0
ORDER BY 	D.DEPTNO ASC, EA.actno DESC;



-- PROBLEM 3: Separate a tax due summary list for all employees according to the given tax table below.	The tax due summary list includess the department number,
-- department name, employee number, employee last name and first name, job and the total income (sum of the salary, bonus, and commission of the fifteen highest total
-- income non-president, non-manager employee. Set total income to 0(zero) if NULL. Exclude in the list those employees with NULL total income. Order the list by
-- department number and then by the total income, highest total income first.

SELECT 		D.DEPTNO, D.DEPTNAME, E.empno, E.lastname, E.firstname, E.job, (E.salary + COALESCE(E.bonus, 0) + COALESCE(E.comm, 0)) AS total_income
FROM 		EMPLOYEE E
JOIN 		DEPARTMENT D 
  ON 		E.workdept = D.DEPTNO
WHERE 		E.job NOT IN ('President', 'Manager')
  AND 		(E.salary + COALESCE(E.bonus, 0) + COALESCE(E.comm, 0)) IS NOT NULL
ORDER BY 	D.DEPTNO ASC, total_income DESC
LIMIT 		15;
