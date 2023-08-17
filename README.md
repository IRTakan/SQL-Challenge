# SQL-Challenge

This challenge focuses on a research project about people whom Pewlett Hackard (a fictional company)employed during the 1980s and 1990s. 
All that remained was an employee database from that period are six CSV files which I used for my analysis. I created tables to hold the data from the CSV files, 
import them into a SQL database, and then answered questions about the data. Three tasks had to be performed; 

## -- Data modeling 
I inspected all of the CSV files, and then sketched an Entity Relationship Diagram of the tables. 
To create the sketch, I used a free tool called QuickDBDLinks.

## -- Data engineering
With the provided information I created a table schema for each of the six CSV files. 
I Remembered to specify the data types, primary keys, foreign keys, and other constraints.
It was important that for the primary keys, the columns were unique, and that tables were created in the correct order to handle the foreign keys.
Once everything looked good I imported each CSV file into its corresponding SQL table.

## -- Data Analysis.
For the data analysis I created queries that did these things;

Listed the employee number, last name, first name, sex, and salary of each employee.
```
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;
```
Listed the first name, last name, and hire date for the employees who were hired in 1986.
```
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-1-1' AND '1986-12-31'
ORDER BY hire_date ASC;
```
Listed the manager of each department along with their department number, department name, employee number, last name, and first name.
```
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_name ASC;
```
Listed the department number for each employee along with that employee’s employee number, last name, first name, and department name.
```
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
ORDER BY dept_name ASC;
```
Listed first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B. 
```
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name ASC;
```
Listed each employee in the Sales department, including their employee number, last name, and first name.
```
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';
```
Listed each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
```
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'  OR departments.dept_name = 'Development'
ORDER BY departmemts.dept_name ASC;
```
Listed the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
```
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;
```
*Technologies used: Microsoft Visual Studio Code and PgAdmin4 v7 &
QuickDBD: https://app.quickdatabasediagrams.com/
