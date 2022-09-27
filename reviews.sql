/* These exercises are reviews of exercises in Codeup SQL course.
They comprise exercises and bonus exercises but also tests that I did
to better understand the scope or meaing of a query or a function. */
USE chipotle;
USE elo_db;
SELECT COUNT(*) FROM transactions;
SHOW DATABASES;
USE saas_llc;
SELECT database();
SHOW CREATE DATABASE saas_llc;
SHOW TABLES FROM saas_llc;
SHOW COLUMNS FROM churn;
SELECT COUNT(*) FROM churn;
SELECT COUNT(*) FROM transactions;
USE employees;
SHOW TABLES FROM employees;
SHOW tables;
SHOW CREATE table dept_manager;
USE albums_db;
SHOW tables;
SELECT COUNT(*) FROM albums;

SELECT * FROM albums;
SELECT COUNT(DISTINCT (artist)) FROM albums;
SHOW CREATE table albums;
SELECT MAX(release_date) FROM albums;
SELECT MIN(release_date) FROM albums;
SELECT name FROM albums WHERE artist = 'Pink Floyd';
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';
SELECT * FROM albums;
SELECT * FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';
SELECT genre FROM albums WHERE name = 'Nevermind';
SELECT name FROM albums WHERE release_date LIKE '199_';
SELECT name FROM albums WHERE sales < 20;
SELECT name FROM albums WHERE genre LIKE 'ROCK';
USE employees;
SHOW tables;
SHOW columns FROM employees;
SELECT * FROM employees LIMIT 10;
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena') OR first_name IN ('Vidya') OR first_name IN ('Maya');
SELECT gender, first_name, last_name FROM employees WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';
SELECT first_name, last_name FROM employees WHERE last_name LIKE 'E%';
SELECT first_name, last_name FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
SELECT COUNT(*) FROM employees WHERE last_name LIKE '%E' AND last_name NOT LIKE 'E%';
SHOW columns FROM employees;
USE epmloyees;
SELECT hire_date, first_name, last_name FROM employees WHERE hire_date LIKE '199%';
SELECT COUNT(*) FROM employees WHERE hire_date LIKE '199%';
SELECT * FROM employees LIMIT 10;
SELECT birth_date, first_name, last_name FROM employees WHERE birth_date LIKE '%12-24';
SELECT * FROM employees WHERE birth_date LIKE '%12-24' AND hire_date LIKE '199%';
SELECT first_name, last_name FROM employees WHERE last_name LIKE '%q%';
SELECT COUNT(*) FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name;
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name LIMIT 1;
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name DESC;
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name, last_name;
SELECT first_name, last_name FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') ORDER BY first_name DESC, last_name DESC;
SELECT emp_no, first_name, last_name FROM employees WHERE last_name LIKE 'E%e' ORDER BY emp_no;
SELECT hire_date, birth_date, first_name, last_name FROM employees WHERE last_name LIKE 'E%e' ORDER BY birth_date;
SELECT birth_date, hire_date, first_name, last_name FROM employees WHERE birth_date LIKE '____-12-24' AND hire_date LIKE '199%' ORDER BY birth_date ASC, hire_date DESC;
SELECT CONCAT(
    'Teaching people to code for ',
    UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'),
    ' seconds'
);
SELECT UNIX_TIMESTAMP();
SELECT UNIX_TIMESTAMP('2014-02-04');
SELECT CONCAT(
    'Teaching people to code for ',
    NOW() - UNIX_TIMESTAMP('2014-02-04'),
    ' seconds'
);
SELECT NOW();
/* SELECT CONCAT(
    'Teaching people to code for ',
    UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04'),
    ' seconds'
);
This give me the time since Jan 1st 1970 00h 00m 00s until now minus the time since Jan 1st 1970 00h 00m 00s until the date between parenthesis

And if I do 

SELECT CONCAT(
    'Teaching people to code for ',
    NOW() - UNIX_TIMESTAMP('2014-02-04'),
    ' seconds'
);
This gives me the time that is right now minus the time from Jan 1st 1970 00h 00m 00s until the date between parenthesis.
But honestly I don’t really understand the result I get and it’s probably not important right now.
I just need to know it’s not the right operation if I want to know the number of seconds since
I have been doing something using the linux epoch 6tm.*/

SELECT CONCAT (first_name, last_name) AS full_name, first_name, last_name FROM employees WHERE last_name LIKE 'E%e';
SELECT CONCAT (UPPER(first_name), UPPER(last_name)) AS full_name, UPPER(first_name), UPPER(last_name) FROM employees WHERE last_name LIKE 'E%e';
SELECT * , DATEDIFF(NOW(), hire_date)/365 AS tenure FROM employees WHERE birth_date LIKE '%12-24' AND hire_date LIKE '199%' ORDER BY tenure;
SHOW tables FROM employees;
SHOW columns FROM salaries;
SELECT MAX(salary) as maxsalary, MIN(salary) AS minsalary, to_date FROM salaries;
SELECT MAX(salary), MIN(salary) FROM salaries WHERE to_date > NOW();
/* In the above query, why do I need to write "to_date > CURDATE()/NOW()" and not "to_date = CURDATE()/NOW()"? */

SELECT * FROM employees LIMIT 10;
SELECT CONCAT(SUBSTR(LOWER(first_name), 1, 1), SUBSTR(LOWER(last_name), 1, 4), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) AS username, first_name, last_name, birth_date FROM employees;
SELECT concat(first_name, " ", last_name) AS full_name, count(*) AS n_same_full_name
FROM employees
GROUP BY full_name
HAVING n_same_full_name >= 1;

SELECT COUNT(*) FROM employees WHERE first_name LIKE 'Mokhtar' AND last_name LIKE 'Bernatsky';

SHOW tables FROM employees;
SHOW columns FROM titles;
SELECT COUNT(DISTINCT title) FROM titles;
SELECT last_name FROM employees WHERE last_name LIKE 'E%e' GROUP BY last_name;
SELECT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name;
SELECT last_name, COUNT(last_name) AS count_unique_last_names FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name;
SELECT first_name, gender, COUNT(*) AS gender_count_per_names FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya') GROUP BY first_name, gender ORDER BY gender ASC;
SELECT 
    CONCAT(SUBSTR(LOWER(first_name), 1, 1),
            SUBSTR(LOWER(last_name), 1, 4),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)) AS username,
    COUNT(*) AS count_of_unique_username
FROM
    employees
    GROUP BY username
    HAVING count_of_unique_username >= 1;
SELECT 
    CONCAT(SUBSTR(LOWER(first_name), 1, 1),
            SUBSTR(LOWER(last_name), 1, 4),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)) AS username
FROM
    employees;

SHOW columns FROM salaries;
SHOW columns FROM employees;
SELECT emp_no, AVG(salary) AS average_salary FROM salaries GROUP BY emp_no HAVING AVG(salary);
SELECT emp_no, salary FROM salaries WHERE emp_no = 10003;
SHOW tables FROM employees;
SHOW columns FROM dept_emp;
SELECT dept_no, COUNT(emp_no) AS current_emp_num FROM dept_emp WHERE to_date >= CURDATE() GROUP BY dept_no HAVING COUNT(emp_no);
SELECT dept_no, COUNT(emp_no) AS current_emp_num FROM dept_emp GROUP BY dept_no HAVING COUNT(emp_no);
SHOW columns FROM salaries;
SELECT emp_no, COUNT(salary) FROM salaries GROUP BY emp_no HAVING COUNT(salary) >= 1;
SELECT emp_no, MAX(salary) FROM salaries GROUP BY emp_no HAVING MAX(salary);
SELECT emp_no, MIN(salary) FROM salaries GROUP BY emp_no HAVING MIN(salary);
SELECT emp_no, STD(salary) AS salary_std FROM salaries GROUP BY emp_no HAVING STD(salary);
SELECT emp_no, MAX(salary) as max_salary FROM salaries GROUP BY emp_no HAVING MAX(salary) > 150000;
SELECT emp_no, AVG(salary) AS average_salary FROM salaries GROUP BY emp_no HAVING AVG(salary) BETWEEN 80000 AND 90000;
SELECT * FROM salaries WHERE emp_no BETWEEN 10003 AND 10013; -- Testing for the limits of BETWEEN...AND. It comprises the numbers at the limit (10003 and 10013)
DESCRIBE employees;
DESCRIBE salaries;
SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON de.emp_no = e.emp_no
JOIN departments AS d
  ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

SELECT * FROM employees LIMIT 25;
SELECT * FROM departments;
SELECT * FROM dept_manager;
# I could also use DESCRIBE employees/departments/dept_manager
SELECT 
    d.dept_name AS 'Department Name',
    (CONCAT(e.first_name, ' ', e.last_name)) AS 'Manager Name'
FROM
    employees AS e
        JOIN
    dept_manager AS dm ON e.emp_no = dm.emp_no
        JOIN
    departments AS d ON d.dept_no = dm.dept_no
ORDER BY dept_name;
SELECT * FROM employees LIMIT 25;
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT 
    dept_name AS 'Department Name',
    CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name'
FROM
    employees AS e
        JOIN
    dept_manager AS dm ON dm.emp_no = e.emp_no
    AND gender = 'F' AND to_date > CURDATE()
		JOIN
    departments AS d ON d.dept_no = dm.dept_no
    ORDER BY dept_name;
    
SHOW tables FROM employees;
SELECT * FROM dept_emp LIMIT 5;
SELECT * FROM departments;
SELECT * FROM titles LIMIT 5;
DESCRIBE titles;
/* For this one I started with the depatment names and the titles of employees 
before writing a query that looks like the example provided in the curriculum
with the number of employees for each title */
SELECT 
    d.dept_name AS 'Department Name', t.title AS 'Titles'
FROM
    titles AS t
        JOIN
    dept_emp AS de ON de.emp_no = t.emp_no
        AND de.to_date > CURDATE()
        JOIN
    departments AS d ON d.dept_no = de.dept_no
        AND dept_name = 'Customer Service'
GROUP BY dept_name, title;

SELECT 
    d.dept_name AS 'Department Name', t.title AS 'Titles', COUNT(*) AS 'Number of Employees with the Title'
FROM
    titles AS t
        JOIN
    dept_emp AS de ON de.emp_no = t.emp_no
        AND de.to_date > CURDATE()
        AND t.to_date > CURDATE()
        JOIN
    departments AS d ON d.dept_no = de.dept_no
        AND dept_name = 'Customer Service'
GROUP BY dept_name, title;
SHOW tables FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM salaries LIMIT 15;
SELECT * FROM departments;
SELECT * FROM employees LIMIT 10;
SELECT 
    d.dept_name AS 'Department Name',
    CONCAT(e.first_name, ' ', e.last_name) AS 'Manager Name',
    s.salary AS 'Current Salary'
FROM
    employees AS e
        JOIN
    salaries AS s ON s.emp_no = e.emp_no
        JOIN
    dept_manager AS dm ON dm.emp_no = e.emp_no
        AND dm.to_date > CURDATE()
        JOIN
    departments AS d ON d.dept_no = dm.dept_no
        AND s.to_date > CURDATE()
	ORDER BY dept_name;
    
    # 6. 
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

SELECT 
    de.dept_no AS 'Dept Number',
    d.dept_name AS 'Dept Name',
    COUNT(*) AS 'Number of Employees'
FROM
    dept_emp AS de
        JOIN
    departments AS d USING (dept_no) WHERE to_date > CURDATE()
    GROUP BY dept_no, dept_name
    ORDER BY dept_no;

# 7.
SELECT 
    d.dept_name AS 'Dept Name', ROUND(AVG(salary)) AS 'Average Salary'
FROM
    dept_emp AS de
        JOIN
    salaries AS s ON de.emp_no = s.emp_no
        AND de.to_date > CURDATE()
        AND s.to_date > CURDATE()
        JOIN
    departments AS d ON de.dept_no = d.dept_no
GROUP BY d.dept_name ORDER BY ROUND(AVG(salary)) DESC;

# 8. 
USE employees;
SELECT 
    e.emp_no 'Emp Number',
    d.dept_name AS 'Department',
    CONCAT(e.first_name, ' ', e.last_name) AS 'Emp Name',
    s.salary AS 'Highest Salary'
FROM
    dept_emp AS de
        JOIN
    salaries AS s ON s.emp_no = de.emp_no
        AND s.to_date > CURDATE()
        AND de.to_date > CURDATE()
        JOIN
    departments AS d ON d.dept_no = de.dept_no
        AND d.dept_name = 'Marketing'
        JOIN
    employees AS e ON e.emp_no = de.emp_no
ORDER BY s.salary DESC LIMIT 1;

SELECT 
    e.emp_no 'Emp Number',
    d.dept_name AS 'Department',
    CONCAT(e.first_name, ' ', e.last_name) AS 'Emp Name',
    s.salary AS 'Highest Salary'
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

# 9. 
SELECT 
    d.dept_name, e.first_name, e.last_name, s.salary
FROM
    employees AS e
        JOIN
    dept_manager AS dm ON dm.emp_no = e.emp_no
        AND dm.to_date > CURDATE()
        JOIN
    salaries AS s ON s.emp_no = e.emp_no
        AND s.to_date > CURDATE()
        JOIN
    departments AS d ON d.dept_no = dm.dept_no
		AND dm.to_date > CURDATE()
ORDER BY s.salary DESC
LIMIT 1;

# 10. 
USE employees;
SELECT 
    d.dept_name AS 'Department Name',
    ROUND(AVG(s.salary)) AS 'Average Salary'
FROM
    dept_emp AS de
        JOIN
    departments AS d ON d.dept_no = de.dept_no
        JOIN
    salaries AS s ON s.emp_no = de.emp_no
        AND s.to_date > CURDATE()
        AND de.to_date > CURDATE()
GROUP BY dept_name
HAVING ROUND(AVG(s.salary))
ORDER BY ROUND(AVG(s.salary)) DESC;

#BONUS 
SELECT 
    dm.dept_no AS 'Dept Number',
    d.dept_name AS 'Dept Name',
    CONCAT(e.first_name, ' ', e.last_name) AS managers
FROM
    employees AS e
        JOIN
    dept_manager AS dm ON e.emp_no = dm.emp_no AND to_date > CURDATE()
		JOIN
	departments AS d ON d.dept_no = dm.dept_no AND to_date > CURDATE();

SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS 'Employee Name',
    d.dept_name AS 'Department Name',
    m.managers AS 'Manager Name'
FROM
    employees AS e
        JOIN
    dept_emp AS de ON e.emp_no = de.emp_no
        AND de.to_date > CURDATE()
        JOIN
    departments AS d ON de.dept_no = d.dept_no
        JOIN
    (SELECT 
        dm.dept_no,
            CONCAT(e.first_name, ' ', e.last_name) AS managers
    FROM
        employees AS e
    JOIN dept_manager AS dm ON e.emp_no = dm.emp_no
        AND to_date > CURDATE()) AS m ON m.dept_no = d.dept_no
ORDER BY d.dept_name;
USE employees;
SELECT COUNT(*) FROM employees;

USE employees;
(SELECT AVG(salary) FROM salaries WHERE to_date > CURDATE());
SELECT emp_no, salary
FROM salaries
WHERE salary > (SELECT AVG(salary) FROM salaries WHERE to_date > CURDATE())
AND to_date > CURDATE();


SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
)
LIMIT 10;

SELECT first_name, last_name, birth_date
FROM employees
WHERE emp_no = (
    SELECT emp_no
    FROM employees
    WHERE emp_no = 101010
);

SELECT g.birth_date, g.emp_no, g.first_name from
(
    SELECT *
    FROM employees
    WHERE first_name like 'Geor%'
) as g;

SELECT g.birth_date, g.emp_no, g.first_name from
(
    SELECT *
    FROM employees
    WHERE birth_date = birth_date
) as g GROUP BY emp_no;

SELECT g.first_name, g.last_name, salaries.salary
FROM
    (
        SELECT *
        FROM employees
        WHERE first_name like 'Geor%'
    ) as g
JOIN salaries ON g.emp_no = salaries.emp_no
WHERE to_date > CURDATE();
SHOW tables FROM employees;
SHOW columns FROM employees;
SELECT 
    emp_no, first_name, last_name, hire_date
FROM
    employees
WHERE
    hire_date = (SELECT 
            hire_date
        FROM
            employees
        WHERE
            emp_no = 101010);
            
SELECT emp_no FROM employees WHERE first_name = 'Aamod';
SELECT DISTINCT title FROM titles;
SELECT title FROM titles WHERE emp_no = (SELECT emp_no FROM employees WHERE first_name = 'Aamod') AND to_date = CURDATE();
SELECT emp_no, first_name, title FROM employees WHERE emp_no IN (SELECT emp_no FROM titles WHERE to_date = CURDATE()) AND first_name = 'Aamod';

SELECT DISTINCT
    (t.title) AS 'All Titles', e.first_name AS 'First Name'
FROM
    titles AS t
        JOIN
    employees AS e ON e.emp_no = t.emp_no
        JOIN
    dept_emp AS de ON de.emp_no = e.emp_no
WHERE
    first_name IN (SELECT 
            first_name
        FROM
            employees
        WHERE
            first_name = 'Aamod')
        AND de.to_date > CURDATE()
GROUP BY first_name , title;

SELECT 
	emp_no,
    title,
    first_name
FROM
    titles
        JOIN
    employees USING (emp_no)
        JOIN
    dept_emp USING (emp_no)
WHERE
    first_name IN (SELECT 
            first_name
        FROM
            employees
        WHERE
            first_name = 'Aamod')
        AND dept_emp.to_date > CURDATE()
GROUP BY emp_no, title;

USE employees;
SELECT 
    COUNT(emp_no) AS 'Count of Non-Employees'
FROM
    employees
WHERE
    emp_no NOT IN (SELECT 
            emp_no
        FROM
            dept_emp
        WHERE
            to_date > CURDATE());
# There is a different result using '9999-01-01' OR 'CURDATE()', try to find out why
# Apparently it was a bug LoL

SELECT 
    CONCAT(first_name, ' ', last_name)
FROM
    employees
WHERE
    gender = 'F'
        AND emp_no IN (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            to_date > CURDATE());
		
USE employees;
SELECT 
    AVG(salary)
FROM
    salaries;
            
SELECT 
    e.emp_no AS 'Emp Number',
    CONCAT(e.first_name, ' ', e.last_name) AS 'Full Name',
    s.salary AS 'Salaries'
FROM
    employees AS e
        JOIN
    salaries AS s ON s.emp_no = e.emp_no
WHERE
    to_date > CURDATE()
        AND salary > (SELECT 
            AVG(salary)
        FROM
            salaries);
            
USE employees;
SELECT MAX(salary) FROM salaries WHERE to_date > CURDATE();
SELECT STD(salary) FROM salaries WHERE to_date > CURDATE();
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    to_date > CURDATE()
        AND salary > ((SELECT 
            MAX(salary)
        FROM
            salaries
        WHERE
            to_date > CURDATE()) - (SELECT 
            STDDEV(salary)
        FROM
            salaries
        WHERE
            to_date > CURDATE()));
            
SELECT DATABASE();
USE employees;

USE employees;
SELECT e.emp_no, d.dept_no, e.first_name, e.last_name, e.hire_date, de.to_date,
CASE 
	WHEN to_date > CURDATE() THEN '1'
    ELSE '0' 
END AS is_current_employee
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
JOIN departments AS d USING(dept_no) LIMIT 50;

USE employees;
SELECT first_name, last_name,
CASE
	WHEN last_name LIKE 'A%' or last_name LIKE 'B%' or last_name LIKE 'C%' or last_name LIKE 'D%' or last_name LIKE 'E%' or last_name LIKE 'F%' or last_name LIKE 'G%' or last_name LIKE 'H%' THEN 'A-H'
	WHEN last_name LIKE 'I%' or last_name LIKE 'J%' or last_name LIKE 'K%' or last_name LIKE 'L%' or last_name LIKE 'M%' or last_name LIKE 'N%' or last_name LIKE 'O%' or last_name LIKE 'P%' or last_name LIKE 'Q%' THEN 'I-Q'
	WHEN last_name LIKE 'R%' or last_name LIKE 'S%' or last_name LIKE 'T%' or last_name LIKE 'U%' or last_name LIKE 'V%' or last_name LIKE 'W%' or last_name LIKE 'X%' or last_name LIKE 'Y%' or last_name LIKE 'Z%' THEN 'R-Z'
    ELSE 'Other'
END AS alpha_group
FROM employees ORDER BY last_name;

SELECT MAX(birth_date), MIN(birth_date) FROM employees;
SELECT birth_date, 
	COUNT(CASE WHEN birth_date LIKE '195%' THEN birth_date ELSE NULL END) AS Birthdates_in_50s,
	COUNT(CASE WHEN birth_date LIKE '196%' THEN birth_date ELSE NULL END) AS Birthdates_in_60s
FROM employees
GROUP BY birth_date;

SELECT * FROM departments;
SELECT * FROM salaries;
SELECT * FROM employees WHERE emp_no IN (SELECT emp_no FROM dept_emp WHERE to_date > CURDATE());
SELECT * FROM employees WHERE gender = '';

USE employees;
SELECT * FROM employees LIMIT 10;
SELECT emp_no FROM employees WHERE hire_date LIKE '1985-01-%' AND emp_no = (SELECT DISTINCT emp_no FROM salaries WHERE to_date <> CURDATE());
SELECT e.emp_no FROM employees AS e INNER JOIN salaries AS s USING (emp_no) WHERE to_date != CURDATE();
SELECT * FROM salaries LIMIT 50;

SELECT 
    emp_no, MAX(to_date) AS 'Departure date'
FROM
    salaries
WHERE
    emp_no = '10001'
GROUP BY emp_no , to_date;

SELECT MAX(to_date) AS 'Departure date' FROM salaries;

SELECT emp_no, MAX(to_date) FROM salaries WHERE to_date != '9999-01-01' GROUP BY emp_no, to_date;

SELECT 
    emp_no,
    DATEDIFF(MAX(to_date), hire_date) / 365 AS tenure
FROM
    employees AS e
        JOIN
    salaries AS s USING (emp_no)
GROUP BY emp_no, to_date, hire_date;

SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name NOT LIKE '%a%'
GROUP BY first_name;

SELECT first_name, COUNT(first_name)
FROM employees
WHERE first_name LIKE 'Bodo'
GROUP BY first_name;

SELECT emp_no, MAX(to_date) AS 'Max date' FROM salaries WHERE to_date != '9999-01-01' GROUP BY emp_no, to_date;

SELECT COUNT(to_date) FROM salaries WHERE to_date = '9999-01-01';

SELECT DISTINCT COUNT(emp_no) FROM employees;

SELECT COUNT(emp_no) FROM employees;

SELECT COUNT(DISTINCT to_date) FROM salaries WHERE to_date = '9999-01-01';

SELECT DISTINCT emp_no FROM salaries;

USE employees;

SHOW tables FROM employees;

SELECT * FROM employees;

# , COUNT(emp_no) AS 'Count of emp recurrence' 