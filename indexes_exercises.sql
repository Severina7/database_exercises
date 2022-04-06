USE employees;
DESCRIBE departments;
# It has a PK which is the department number and a unique key that is the department name.
# It has 2 columns
DESCRIBE dept_emp;
# It has 2 PK which are the department number and the employee number (composite keys) and no unique key.
# It has 4 columns
DESCRIBE dept_manager;
# It has 2 PK which are the department number and the employee number (composite keys) and no unique key.
# It has 4 columns
DESCRIBE employees;
# It has a PK which is the employee number and no unique key.
# It has 6 columns
DESCRIBE salaries;
# It has 2 PK which are the employee number and the 'from_date value' (composite keys). It has no unique key.
# It has 4 columns
DESCRIBE titles;
# It has 3 PK which are the employee number, the title, and the 'from_date value' (composite keys). It has no unique key.
# It has 4 columns