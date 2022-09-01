USE employees;
SHOW tables;
SELECT * FROM employees;
DESCRIBE employees;
DESCRIBE titles;
DESCRIBE salaries;
DESCRIBE dept_manager;
DESCRIBE dept_emp;
DESCRIBE departments;
# Which table(s) do you think contain a numeric type column? All the table except departments contain at least a numeric type of column
# Which table(s) do you think contain a string type column? All contain at least one string type of column but department is the only one to only have string type of column
# Which table(s) do you think contain a date type column? All except the department table contain a date type column
# What is the relationship between the employees and the departments tables? It is a one to many (from departments to employees) relationship because MySQL connects the elements of tables to each others in an almost infinite entanglement of links
# Show the SQL that created the dept_manager table.
SHOW CREATE TABLE dept_manager;
'CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1'