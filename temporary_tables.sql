# Example with letters
USE jemison_1741;
DROP TABLE if exists my_letters;
CREATE TEMPORARY TABLE my_letters (n varchar(40) NOT NULL);
INSERT INTO my_letters(n) VALUES ('A'), ('B'), ('C'), ('D'), ('E'), ('F'), ('G');
SELECT * FROM my_letters;
DROP TABLE if exists my_letters;

# Example with numbers
USE jemison_1741;
CREATE TEMPORARY TABLE my_numbers (n INT UNSIGNED NOT NULL);
INSERT INTO my_numbers(n) VALUES (1), (2), (3), (4), (5), (6), (7);
SELECT * FROM my_numbers;
DROP TABLE if exists my_numbers;

# 1. Using the example from the lesson, create a temporary table called employees_with_departments
# that contains first_name, last_name, and dept_name
# for employees currently with that department.

USE jemison_1741;
DROP TABLE if exists employees_with_departments;
CREATE TEMPORARY TABLE employees_with_departments (N INT UNSIGNED NOT NULL, first_name varchar(20), last_name varchar(20), dept_name varchar(20));
INSERT INTO employees_with_departments(N) VALUES (1), (2), (3), (4), (5);
SELECT * FROM employees_with_departments;

# a. Add a column named full_name to this table.
# It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
ALTER TABLE employees_with_departments ADD full_name VARCHAR(40);
ALTER TABLE employees_with_departments DROP COLUMN email;
SELECT * FROM employees_with_departments;

# b. Update the table so that full name column contains the correct data

USE jemison_1741;
SELECT first_name, last_name, dept_name FROM jemison_1741 JOIN departments USING(dept_name) JOIN dept_emp USING(dept_no) JOIN employees USING(emp_no);