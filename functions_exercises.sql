USE employees;
SELECT CONCAT (last_name, first_name) FROM employees WHERE last_name LIKE 'E%E';
SELECT CONCAT (UPPER (last_name), UPPER(first_name)) FROM employees WHERE last_name LIKE 'E%E';
SELECT DATEDIFF(CURDATE(), hire_date)/365 as Seniority FROM employees WHERE hire_date LIKE '199_-__-__' AND birth_date LIKE '____-12-24';
SELECT * FROM salaries LIMIT 10;
SHOW tables from employees;
SELECT MIN(salary) FROM salaries;
SELECT MIN(from_date) FROM salaries;
SELECT MIN(emp_no) FROM employees;