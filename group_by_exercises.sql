USE employees;
# 2 How many unique titles have there ever been? There are 7 distinct titles
SELECT DISTINCT title FROM titles;
# 3 Write a query to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY
SELECT last_name FROM employees WHERE last_name LIKE 'E%e' GROUP BY last_name;
# 4 Write a query to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT last_name, first_name FROM employees WHERE last_name LIKE 'E%e' GROUP BY last_name, first_name;
# 5 Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name;
# The unique last names I found are "Chleq", "Lindqvist", and "Qiwen"
# 6 Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
SELECT COUNT(last_name) FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%' GROUP BY last_name;
# 7 Find all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees
# for each gender with those names.
SELECT gender, first_name, COUNT(gender) FROM employees WHERE first_name IN ('Irena' , 'Vidya', 'Maya') ORDER BY gender, first_name;
# 8 Using your query that generates a username for all of the employees, generate a count employees for each unique username.
#   Are there any duplicate usernames? BONUS: How many duplicate usernames are there?
SELECT CONCAT (LOWER(SUBSTR(first_name, 1, 1)), LOWER(SUBSTR(last_name, 1, 4)), '_', SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2)) as user_name, COUNT(*) AS count_of_users FROM employees GROUP BY user_name HAVING count_of_users > 1;
# Yes, there are duplicates, and there is 300024 - 285872 = 14152 duplicates

# 9 More practice with aggregate functions:
# 9.a Determine the historic average salary for each employee. When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
# 9.b Using the dept_emp table, count how many current employees work in each department. The query result should show 9 rows, one for each department and the employee count.
# 9.c Determine how many different salaries each employee has had. This includes both historic and current.
# 9.d Find the maximum salary for each employee.
# 9.e Find the minimum salary for each employee.
# 9.f Find the standard deviation of salaries for each employee.
# 9.g Now find the max salary for each employee where that max salary is greater than $150,000.
# 9.h Find the average salary for each employee where that average salary is between $80k and $90k.
SELECT * FROM salaries;
# 9.a
SELECT AVG(salary) as 'Average salary' FROM salaries GROUP BY emp_no;
# 9.b
SELECT * FROM dept_emp;
SELECT COUNT(emp_no) FROM dept_emp GROUP BY dept_no;
# 9.c 2843453
SELECT COUNT(salary) FROM salaries GROUP BY emp_no, salary;
# 9.d 