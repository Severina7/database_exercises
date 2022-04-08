USE jemison_1741;
SHOW CREATE DATABASE jemison_1741;
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

# a. Add a column named full_name to this table.
# It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
SELECT * FROM employees_with_departments;
DESCRIBE table employees_with_departments;
SHOW CREATE TABLE employees_with_departments;
/* 'CREATE TEMPORARY TABLE `employees_with_departments` (
  `first_name` varchar(14) CHARACTER SET latin1 NOT NULL,
  `last_name` varchar(16) CHARACTER SET latin1 NOT NULL,
  `dept_name` varchar(40) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci' */
ALTER TABLE employees_with_departments ADD COLUMN full_name VARCHAR(30);
SELECT * FROM employees_with_departments;

# b. Update the table so that full name column contains the correct data
UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);