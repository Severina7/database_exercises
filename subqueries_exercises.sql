# 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
USE employees;
SELECT 
    hire_date
FROM
    employees
WHERE
    emp_no = 101010;

SELECT 
    e.first_name AS 'First Name',
    de.to_date AS 'Current Employee'
FROM
    employees AS e
        JOIN
    dept_emp AS de ON e.emp_no = de.emp_no
WHERE
    to_date > CURDATE()
        AND hire_date = (SELECT 
            hire_date
        FROM
            employees
        WHERE
            emp_no = 101010);
# 2. Find all the titles ever held by all current employees with the first name Aamod.
SELECT first_name, emp_no FROM employees WHERE first_name = 'Aamod';

SELECT DISTINCT (titles.title) as all_titles, employees.emp_no as Eno, employees.first_name as Fna FROM employees JOIN titles ON employees.emp_no = titles.emp_no WHERE first_name = 'Aamod' GROUP BY title;

# 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
SELECT * FROM dept_emp LIMIT 10;
SELECT emp_no FROM dept_emp WHERE to_date LIKE '9999-01-01';
SELECT COUNT(emp_no) FROM employees WHERE emp_no NOT IN (SELECT emp_no FROM dept_emp WHERE to_date LIKE '9999-01-01');

# 4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT emp_no FROM dept_manager WHERE to_date > NOW();
SELECT emp_no, first_name FROM employees WHERE gender = 'F' AND emp_no IN (SELECT emp_no FROM dept_manager WHERE to_date > NOW());

# 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT avg(salary) FROM salaries;

SELECT e.emp_no as ENo, CONCAT (e.first_name, ' ', e.last_name) as 'Full Name', s.salary FROM employees as e JOIN salaries as s ON e.emp_no = s.emp_no WHERE to_date > NOW() AND salary > (SELECT avg(salary) FROM salaries) ORDER BY salary;

# 6. How many current salaries are within 1 standard deviation of the current highest salary?
# (Hint: you can use a built in function to calculate the standard deviation).
USE employees;
SELECT MAX(salary) FROM salaries WHERE to_date > NOW();

SELECT stddev(salary) FROM salaries WHERE to_date > NOW();

SELECT COUNT(*) FROM salaries WHERE to_date > NOW() AND salary > ((SELECT MAX(salary) FROM salaries WHERE to_date > NOW()) -(SELECT stddev(salary) FROM salaries WHERE to_date > NOW()));

# What percentage of all salaries is this?
SELECT COUNT(*) FROM salaries WHERE to_date > NOW(); 

SELECT ((SELECT COUNT(*) FROM salaries WHERE to_date > NOW() AND salary > ((SELECT MAX(salary) FROM salaries WHERE to_date > NOW()) -(SELECT stddev(salary) FROM salaries WHERE to_date > NOW()))) / (SELECT COUNT(*) FROM salaries WHERE to_date > NOW())) * 100;
# The number (count) of salaries that are within 1 standard deviation of the highest salary is 0.0346% of all current salaries.