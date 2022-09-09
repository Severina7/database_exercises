USE employees;
SHOW tables;
SELECT * FROM employees;
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
ORDER BY first_name;
# The first first_name & last-name on the list is Irena Reutenauer (2a)
# The last first_name & last-name on the list is Vidya Simmen (2b)
SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya')
ORDER BY first_name, last_name;
# The first first_name & last-name on the list is Irena Acton (3a)
# The last first_name & last-name on the list is Vidya Zweizig (3b)
SELECT 
    *
FROM
    employees
WHERE
    (first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya')
ORDER BY last_name, first_name;
# The first first_name & last-name on the list is Irena Acton (4a)
# The last first_name & last-name on the list is Maya Zyda (4b)
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%E'
ORDER BY emp_no DESC;
# Number of employees found 899
# The first employee number is 10021 and first_name & last-name on the list is Ramzi Erde (5a)
# The last employee number is 499648 and first_name & last-name on the list is Tadahiro Erde (5b)
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%E'
ORDER BY hire_date DESC;
# Number of employees found 899 (6a)
# The name of the newest employee Teiji Eldridge (6b)
# The name of the oldest employee Sergi Erde (6c)
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199_-__-__'
        AND birth_date LIKE '____-12-24'
ORDER BY birth_date ASC , hire_date DESC;

# Number of employees found 381 (7a)
# The name of the oldest employee hired last Samphel Casperson (7b)
# The name of the youngest employee hired first Yinlin Kamfer (7c)
