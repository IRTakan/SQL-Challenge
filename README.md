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

Listed the first name, last name, and hire date for the employees who were hired in 1986.

Listed the manager of each department along with their department number, department name, employee number, last name, and first name.

Listed the department number for each employee along with that employee’s employee number, last name, first name, and department name.

Listed first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B. 

Listed each employee in the Sales department, including their employee number, last name, and first name.

Listed each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

Listed the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

*Technologies used: Microsoft Visual Studio Code and PgAdmin4 v7
