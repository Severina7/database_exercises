USE employees;
SHOW tables;
SELECT * FROM employees;
# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');
# I found 709 entries that correspond to the code I entered (1)
SELECT * FROM employees WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';
# I found 709 entries that correspond to the code I entered (2)
# Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
SELECT * FROM employees WHERE (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') AND gender = 'M';
# I found 441 entries that correspond to the code I entered (4)
SELECT * FROM employees WHERE last_name LIKE 'E%';
# I found 7330 entries that correspond to the code I entered (5)
SELECT * FROM employees WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
# I found 30723 entries that correspond to the code I entered (6)
SELECT * FROM employees WHERE last_name LIKE 'E%E';
# I found 899 entries that correspond to the code I entered (7)
SELECT * FROM employees WHERE hire_date LIKE '199%';
# I found 135214 entries that correspond to the code I entered (8)
SELECT * FROM employees WHERE birth_date LIKE '____-12-24';
# I found 791 entries that correspond to the code I entered (9)
SELECT * FROM employees WHERE hire_date LIKE '199_-__-__' AND birth_date LIKE '____-12-24';
# I found 381 entries that correspond to the code I entered (10)
SELECT * FROM employees WHERE last_name LIKE '%q%';
# I found 1873 entries that correspond to the code I entered (11)
SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
# I found 547 entries that correspond to the code I entered (12)
