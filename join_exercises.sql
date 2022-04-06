# Exercises on JOIN
USE join_example_db;
SHOW tables;
SELECT * FROM roles;
SELECT * FROM users LIMIT 1;
# Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson.
# Before you run each query, guess the expected number of results.
# Email column added for testing
SELECT users.name AS users_name, users.email AS users_email, roles.name as role_name FROM users JOIN roles ON users.role_id = roles.id;
SELECT users.name AS users_name, users.email AS users_email, roles.name as role_name FROM users LEFT JOIN roles ON users.role_id = roles.id;
SELECT users.name AS users_name, users.email AS users_email, roles.name as role_name FROM users RIGHT JOIN roles ON users.role_id = roles.id;
# 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries.
# Use count and the appropriate join type to get a list of roles along with the number of users that has the role.
# Hint: You will also need to use group by in the query.USE employees;
SELECT u.name AS UName, r.name as RName, COUNT(r.name) as 'Role Count' FROM users as u RIGHT JOIN roles as r ON u.role_id = r.id GROUP BY u.name, r.name, 'Role Count';

# EMPLOYEES DATABASE

# 2 Using the example in the Associative Table Joins section as a guide,
# write a query that shows each department along with the name of the current manager for that department.
USE employees;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT d.dept_name as 'Department Name', (CONCAT (e.first_name, ' ', e.last_name)) as 'Manager Name' FROM employees as e JOIN dept_manager as dm ON e.emp_no = dm.emp_no JOIN departments as d ON d.dept_no = dm.dept_no ORDER BY dept_name;

# 3. Find the name of all departments currently managed by women.
USE employees;
SELECT * FROM employees LIMIT 10;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT d.dept_name as 'Department Name', (CONCAT (e.first_name, ' ', e.last_name)) as 'Manager Name', gender FROM employees as e JOIN dept_manager as dm ON e.emp_no = dm.emp_no AND to_date > NOW() AND gender = 'F' JOIN departments as d USING(dept_no) ORDER BY dept_name;

# 4. Find the current titles of employees currently working in the Customer Service department.
USE employees;
SELECT * FROM titles;
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT t.title, COUNT(de.emp_no) FROM dept_emp AS de JOIN titles AS t ON de.emp_no = t.emp_no AND t.to_date > NOW() AND de.to_date > NOW() JOIN departments AS d ON de.dept_no = d.dept_no AND d.dept_name = 'Customer Service' GROUP BY t.title;

# 5. Find the current salary of all current managers.
USE employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT 
    d.dept_name AS 'Department Name',
    CONCAT(e.first_name, ' ', e.last_name) AS 'Name',
    s.salary AS 'Salary'
FROM
    employees AS e
        JOIN
    salaries AS s ON e.emp_no = s.emp_no
        AND s.to_date > NOW()
        JOIN
    dept_manager AS dm ON dm.emp_no = e.emp_no
        AND dm.to_date > NOW()
        JOIN
    departments AS d USING (dept_no)
ORDER BY dept_name;

# 6. Find the number of current employees in each department.
SELECT * FROM dept_emp;
SELECT	* FROM departments;
SELECT	d.dept_no, d.dept_name, COUNT(emp_no) AS num_employees FROM dept_emp AS de JOIN departments AS d ON de.dept_no = d.dept_no AND de.to_date > CURDATE() GROUP BY dept_no, dept_name;

# 7. Which department has the highest average salary? Hint: Use current not historic information.
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT 
    d.dept_name, ROUND(AVG(salary), 2) AS average_salary
FROM
    dept_emp AS de
        JOIN
    salaries AS s ON de.emp_no = s.emp_no
        AND de.to_date > CURDATE()
        AND s.to_date > CURDATE()
        JOIN
    departments AS d ON de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

#8. Who is the highest paid employee in the Marketing department?
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT 
    e.first_name, e.last_name
FROM
    employees AS e
        JOIN
    dept_emp AS de ON e.emp_no = de.emp_no
        AND de.to_date > CURDATE()
        JOIN
    salaries AS s ON e.emp_no = s.emp_no
        AND s.to_date > CURDATE()
        JOIN
    departments AS d ON de.dept_no = d.dept_no
        AND d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;

# 9. Which current department manager has the highest salary?
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT 
    e.first_name, e.last_name, s.salary, d.dept_name
FROM
    employees AS e
        JOIN
    dept_manager AS dm ON e.emp_no = dm.emp_no
        AND to_date > CURDATE()
        JOIN
    salaries AS s ON e.emp_no = s.emp_no
        AND s.to_date > CURDATE()
        JOIN
    departments AS d USING (dept_no)
ORDER BY s.salary DESC
LIMIT 1;

# 10. Determine the average salary for each department. Use all salary information and round your results.
SELECT d.dept_name, ROUND(AVG(s.salary),0) AS avg_dept_salary FROM departments d JOIN dept_emp de ON d.dept_no = de.dept_no JOIN employees e ON e.emp_no = de.emp_no JOIN salaries s ON e.emp_no = s.emp_no GROUP BY d.dept_name ORDER BY avg_dept_salary DESC;

# 11. Bonus: Find the names of all current employees, their department name, and their current manager's name.
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT dm.dept_no, CONCAT(e.first_name, ' ', e.last_name) AS managers FROM employees AS e JOIN dept_manager AS dm ON e.emp_no = dm.emp_no AND to_date > CURDATE();

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name', d.dept_name AS 'Department Name', m.managers AS 'Manager Name' FROM employees AS e 