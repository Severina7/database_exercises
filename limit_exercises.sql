USE employees;
SHOW tables;
SELECT DISTINCT
    title
FROM
    titles;
SELECT 
    *
FROM
    employees;
SELECT DISTINCT
    last_name
FROM
    employees
LIMIT 10;
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199_-__-__'
        AND birth_date LIKE '____-12-24'
ORDER BY hire_date ASC
LIMIT 5;
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199_-__-__'
        AND birth_date LIKE '____-12-24'
ORDER BY hire_date ASC
LIMIT 5 OFFSET 50;
