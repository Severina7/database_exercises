# 1. Write a query that returns all employees, their department number, their start date, their end date,
# and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.
USE employees;
SELECT e.emp_no, d.dept_no, e.first_name, e.last_name, e.hire_date, de.to_date,
CASE 
	WHEN to_date > NOW() THEN '1'
    ELSE '0' 
END AS is_current_employee
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d USING(dept_no) LIMIT 50;

# 2. Write a query that returns all employee names (previous and current),
# and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
USE employees;
SELECT first_name, last_name,
CASE
	WHEN last_name LIKE 'A%' or last_name LIKE 'B%' or last_name LIKE 'C%' or last_name LIKE 'D%' or last_name LIKE 'E%' or last_name LIKE 'F%' or last_name LIKE 'G%' or last_name LIKE 'H%' THEN 'A-H'
	WHEN last_name LIKE 'I%' or last_name LIKE 'J%' or last_name LIKE 'K%' or last_name LIKE 'L%' or last_name LIKE 'M%' or last_name LIKE 'N%' or last_name LIKE 'O%' or last_name LIKE 'P%' or last_name LIKE 'Q%' THEN 'I-Q'
	WHEN last_name LIKE 'R%' or last_name LIKE 'S%' or last_name LIKE 'T%' or last_name LIKE 'U%' or last_name LIKE 'V%' or last_name LIKE 'W%' or last_name LIKE 'X%' or last_name LIKE 'Y%' or last_name LIKE 'Z%' THEN 'R-Z'
    ELSE 'Other'
END AS alpha_group
FROM employees ORDER BY last_name;

# 3. How many employees (current or previous) were born in each decade?
SELECT MAX(birth_date), MIN(birth_date) FROM employees;
SELECT birth_date, 
	COUNT(CASE WHEN birth_date LIKE '195%' THEN birth_date ELSE NULL END) AS Birthdates_in_50s,
	COUNT(CASE WHEN birth_date LIKE '196%' THEN birth_date ELSE NULL END) AS Birthdates_in_60s
FROM employees
GROUP BY birth_date;

# 4. What is the current average salary for each of the following department groups:
# R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT * FROM departments;
SELECT * FROM salaries;
SELECT * 