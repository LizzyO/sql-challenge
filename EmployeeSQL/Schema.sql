
titles
-
    title_id INT PK
    title VARCHAR(255)


salaries
-
emp_no INT PK
    salary INT

employees
-
emp_no INT PK FK >- salaries.emp_no
emp_title_id INT FK >- titles.title_id
     birth_date VARCHAR(255)
    first_name VARCHAR(255)
    last_name VARCHAR(255)
    sex VARCHAR(255)
    hire_date  VARCHAR(255)

dept_manager
-
dept_no INT FK >- departments.dept_no
emp_no INT

departments
-
dept_no INT PK
    dept_name

dept_emp
-
emp_no INT FK >- employees.emp_no
dept_no INT FK >- departments.dept_no
