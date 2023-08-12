-- Employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- First name, last name, and hire date for employees hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31'
ORDER BY hire_date ASC;

-- Managers of each department (Along with deptartment number, department name, employee number, last name, first name).
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;
ORDER BY d.dept_name ASC;

-- Department of each employee (Along with employee number, last name, first name, department name).
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;
ORDER BY d.dept_name ASC;

-- First name, last name, and sex for employees whose first name is "Hercules" and last name beings with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC;

-- Employees in Sales department (Including employee number, last name, first name, department name).
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

-- Employees in Sales and Development departments (Including employee number, last name, first name, department name).
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'  OR departments.dept_name = 'Development'
ORDER BY departmemts.dept_name ASC;

-- Frequency count in descending order of employee last names (How many employees share each last name).
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;

-- -- create view for bonus bar chard of avg salary by title
-- CREATE VIEW avg_salaries_by_title AS
-- SELECT round(avg(s.salary)) as avg_salary, t.title
-- FROM titles t
-- JOIN employees e
-- ON t.title_id = e.emp_title_id
-- JOIN salaries s
-- ON e.emp_no = s.emp_no
-- GROUP BY t.title;