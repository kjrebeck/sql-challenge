--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	emp.emp_no,
	emp.last_name,
	emp.first_name,
	emp.sex,
	sal.salary
FROM
	employees emp
	JOIN salaries sal ON emp.emp_no = sal.emp_no
ORDER BY
	emp.last_name ASC,
	emp.first_name ASC,
	emp.emp_no ASC;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	emp.first_name,
	emp.last_name,
	emp.hire_date
FROM
	employees emp
WHERE
	emp.hire_date >= '1986-01-01'
	AND emp.hire_date <= '1986-12-31'
ORDER BY
	emp.last_name ASC,
	emp.first_name ASC,
	emp.hire_date ASC;


--3. List the manager of each department along with their department number, department name, 
--employee number, last name, and first name.
SELECT
	t.title,
	dm.dept_no,
	dep.dept_name,
	dm.emp_no,
	emp.last_name,
	emp.first_name
FROM
	dept_manager dm
	JOIN departments dep ON dm.dept_no = dep.dept_no
	JOIN employees emp ON dm.emp_no = emp.emp_no
	JOIN titles t ON emp.emp_title_id = t.title_id
ORDER BY
	dm.dept_no ASC,
	emp.last_name ASC,
	emp.first_name ASC,
	dm.emp_no ASC;


--4. List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name.
SELECT
	de.dept_no,
	de.emp_no,
	emp.last_name,
	emp.first_name,
	dep.dept_name
FROM
	dept_emp de
	JOIN employees emp on de.emp_no = emp.emp_no
	JOIN departments dep on de.dept_no = dep.dept_no
ORDER BY
	emp.last_name ASC,
	emp.first_name ASC,
	de.emp_no ASC;


--5. List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B.
SELECT
	emp.first_name,
	emp.last_name,
	emp.sex
FROM
	employees emp
WHERE
	emp.first_name = 'Hercules'
	AND emp.last_name LIKE 'B%'
ORDER BY
	emp.last_name ASC;


--6. List each employee in the Sales department, including their employee number, 
--last name, and first name.
SELECT
	dep.dept_name,
	de.emp_no,
	emp.last_name,
	emp.first_name
FROM
	dept_emp de
	JOIN departments dep ON de.dept_no = dep.dept_no
	JOIN employees emp ON de.emp_no = emp.emp_no
WHERE
	dep.dept_name = 'Sales'
ORDER BY
	emp.last_name ASC,
	emp.first_name ASC;


--7. List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT
	de.emp_no,
	emp.last_name,
	emp.first_name,
	dep.dept_name
FROM
	dept_emp de
	JOIN departments dep ON de.dept_no = dep.dept_no
	JOIN employees emp on de.emp_no = emp.emp_no
WHERE
	dep.dept_name = 'Sales'
	OR dep.dept_name = 'Development'
ORDER BY
	emp.last_name ASC,
	emp.first_name ASC;


--8. List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).
SELECT	
	emp.last_name AS "Last Name",
	COUNT(emp.last_name) AS "Employee Count"
FROM 
	employees emp
GROUP BY
	emp.last_name
ORDER BY
	"Employee Count" DESC,
	emp.last_name ASC;
