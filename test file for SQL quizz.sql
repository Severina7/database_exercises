USE employees;
SELECT COUNT(*) FROM employees GROUP BY gender;
SELECT * FROM employees ORDER BY gender ASC LIMIT 10;
SELECT SUBSTR("Krassimir", 5, 2) FROM employees; 
USE departments;
USE employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_emp WHERE emp_no < '10006' OR dept_no >= 'd005';
SELECT distinct(first_name) FROM employees;
SELECT CONCAT(first_name, ' ', last_name), SUBSTR("Krassimir Michaels", 12, 7) as NewName FROM employees WHERE first_name = 'Krassimir' AND last_name = 'Michaels';
SELECT * FROM 