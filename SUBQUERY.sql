SELECT		workdept, empno, lastname, FORMAT(salary, 'N2') AS salary
FROM		employee
WHERE		salary > (SELECT AVG(salary)
						 FROM employee )
UNION ALL
SELECT		'' AS workdept, 'Average Salary of All Employees + 5000' AS empno, '----->>>' AS lastname, FORMAT (AVG(salary) + 5000.00, 'N2') AS salary
FROM		employee
ORDER BY	empno;
