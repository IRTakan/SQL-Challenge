-- Data Engineering

-- Drop tables (in reverse order, to avoid errors if they already exist).
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS title;
DROP TABLE IF EXISTS departments;

CREATE TABLE "departments" (
    -- dept_no - primary key, also found in dept_emp and dept_manager list
    "dept_no" VARCHAR   NOT NULL,
    -- department names
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
    -- # title_id - primary key, also found in employees as emp_title_id
    "title_id" VARCHAR   NOT NULL,
    -- list of titles
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    -- # emp_no - primary key, also found in dept_emp, dept_manager and salaries list
    "emp_no" INT   NOT NULL,
    -- # employees has a title id employees(emp_title_id), this id has relationship with the composite foreign key titles(title_id)
    "emp_title_id" VARCHAR   NOT NULL,
    -- employees birth date
    "birth_date" DATE   NOT NULL,
    -- employees first name
    "first_name" VARCHAR   NOT NULL,
    -- employees last name
    "last_name" VARCHAR   NOT NULL,
    -- employees sex
    "sex" VARCHAR   NOT NULL,
    -- employees hired date
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

CREATE TABLE "dept_emp" (
    -- # emp_no in dept_emp list which shares a unique key with employees(emp_no)
    "emp_no" INT   NOT NULL,
    -- # dept_no in dept_emp list and shares a unique key with dept_emp(dept_no)
    "dept_no" VARCHAR   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

CREATE TABLE "dept_manager" (
    -- # dept_no in dept_manager list and also shares a unique key with dept_emp(dept_no)
    "dept_no" VARCHAR   NOT NULL,
    -- # emp_no in dept_ mangager list which shares a unique key with employees(emp_no)
    "emp_no" INT   NOT NULL
);

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

CREATE TABLE "salaries" (
    -- # emp_no in salaries which shares unique keys with employees(emp_no)
    "emp_no" INT   NOT NULL,
    -- employees salaries
    "salary" INT   NOT NULL
);

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- viewing tables 
SELECT * FROM departments;
SELECT * FROM titles;	
SELECT * FROM employees;	
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;	
SELECT * FROM salaries;