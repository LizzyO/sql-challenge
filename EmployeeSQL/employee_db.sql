CREATE TABLE titles (
	title_id VARCHAR NOT NULL PRIMARY KEY,
	title VARCHAR NOT NULL
);
 
 CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT
);

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    emp_title_id VARCHAR NOT NULL,
	birth_date  VARCHAR NOT NULL,
	first_name VARCHAR NOT NULL, 
	last_name VARCHAR NOT NULL, 
	sex VARCHAR NOT NULL,
	hire_date  VARCHAR NOT NULL,
    FOREIGN KEY(emp_title_id) REFERENCES titles (title_id),
	FOREIGN KEY(emp_no) REFERENCES salaries (emp_no)
);
 DROP TABLE dept_manager CASCADE;

CREATE TABLE departments (
	dept_no VARCHAR NOT NULL PRIMARY KEY,
	dept_name VARCHAR NOT NULL 
);	

CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
	emp_no INT, 
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE dept_emp (
    emp_no INT,
    dept_no VARCHAR NOT NULL,
    FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

SELECT * FROM dept_manager;

--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON s.emp_no=e.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%86';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT  m.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager m
LEFT JOIN employees e
ON e.emp_no=m.emp_no
RIGHT JOIN departments d
ON d.dept_no=m.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, n.last_name, n.first_name, d.dept_name
FROM employees n
LEFT JOIN dept_emp e ON e.emp_no= n.emp_no
RIGHT JOIN departments d ON d.dept_no= e.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT * FROM employees;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT d.dept_name, e.emp_no, n.last_name, n.first_name
FROM employees n
LEFT JOIN dept_emp e ON e.emp_no= n.emp_no
RIGHT JOIN departments d ON d.dept_no= e.dept_no
WHERE d.dept_name LIKE 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, n.last_name, n.first_name, d.dept_name
FROM employees n
LEFT JOIN dept_emp e ON e.emp_no= n.emp_no
RIGHT JOIN departments d ON d.dept_no= e.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT (last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;




