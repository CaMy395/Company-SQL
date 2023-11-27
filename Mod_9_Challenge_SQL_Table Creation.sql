-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/8e4QYF
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS Titles CASCADE;
DROP TABLE IF EXISTS Departments CASCADE;
DROP TABLE IF EXISTS Dept_emp CASCADE;
DROP TABLE IF EXISTS Salaries CASCADE;
DROP TABLE IF EXISTS Dept_manager CASCADE;
DROP TABLE IF EXISTS Employees CASCADE;

CREATE TABLE Titles (
    title_id VARCHAR(10) NOT NULL PRIMARY KEY,
    title VARCHAR(30) NOT NULL
);
CREATE TABLE Employees (
    emp_no INT NOT NULL PRIMARY KEY,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(15) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    sex CHAR NOT NULL,
    hire_date DATE NOT NULL,
    FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);
CREATE TABLE Departments (
    dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE Dept_manager (
    dept_no VARCHAR(10) NOT NULL,
    emp_no INT NOT NULL,
    PRIMARY KEY (dept_no,emp_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE Dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(10) NOT NULL,
	Primary KEY (emp_no,dept_no),
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

CREATE TABLE Salaries (
    emp_no INT NOT NULL PRIMARY KEY,
    salary NUMERIC NOT NULL, -- Assuming salary is a numeric value
    FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

COPY Departments FROM 'C:\Program Files\PostgreSQL\14\pgAdmin 4\runtime\data\departments.csv' WITH CSV HEADER;
COPY Titles FROM 'C:\Program Files\PostgreSQL\14\pgAdmin 4\runtime\data\titles.csv' WITH CSV HEADER;
COPY Employees FROM 'C:\Program Files\PostgreSQL\14\pgAdmin 4\runtime\data\employees.csv' WITH CSV HEADER;
COPY Dept_manager FROM 'C:\Program Files\PostgreSQL\14\pgAdmin 4\runtime\data\dept_manager.csv' WITH CSV HEADER;
COPY Dept_emp FROM 'C:\Program Files\PostgreSQL\14\pgAdmin 4\runtime\data\dept_emp.csv' WITH CSV HEADER;
COPY Salaries FROM 'C:\Program Files\PostgreSQL\14\pgAdmin 4\runtime\data\salaries.csv' WITH CSV HEADER;

