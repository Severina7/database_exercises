USE jemison_1741;
DROP TABLE IF exists employees_with_departments;
CREATE TEMPORARY TABLE employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

# Test
SELECT * FROM employees_with_departments;

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
ALTER TABLE employees_with_departments ADD COLUMN full_name VARCHAR(31);

# TEST
SELECT * FROM employees_with_departments;

# b. Update the table so that full name column contains the correct data
UPDATE employees_with_departments SET full_name = CONCAT(first_name, ' ', last_name);

# TEST
SELECT * FROM employees_with_departments;

# c. Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments DROP COLUMN first_name;
ALTER TABLE employees_with_departments DROP COLUMN last_name;

# TEST
SELECT * FROM employees_with_departments;

# d. What is another way you could have ended up with this same table?
# By running the following code:
/* CREATE TEMPORARY TABLE employees_with_departments AS
SELECT dept_name, CONCAT(first_name, last_name) AS full_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100; */


# 2. Create a temporary table based on the payment table from the sakila database.
# Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment.
# For example, 1.99 should become 199.

CREATE TEMPORARY TABLE new_payment AS SELECT payment_id, dustomer_id, staff_id, rental_id, amount * 100 AS new_amount, payment_date, last_update FROM sakila.payment 