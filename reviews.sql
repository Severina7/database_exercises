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
I have been doing something using the linux epoch 6tm.
