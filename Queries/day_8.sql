use 50_days_sql_challenge;

--Remove extra space --

update cleaned_employees
set emp_name=trim(emp_name);

--change data types --

--1) employees table--

desc cleaned_employees;

alter table cleaned_employees
modify emp_id int,
modify emp_name varchar(100),
modify age int,
modify city varchar(50),
modify dept_id int,
modify hire_date date;


--2) Department table--

alter table cleaned_departments
modify dept_id int,
modify dept_name varchar(40);

--3) Attendence table--

alter table cleaned_attendence
modify attendance_id int,
modify emp_id int,
modify attendence_date date,
modify status varchar(60);

--4) Performance table--

alter table cleaned_performance
modify emp_id int,
modify rating_2022 int,
modify rating_2023 int,
modify rating_2024 int; 

--5) salaries table--

alter table cleaned_salaries
modify salary_id int,
modify emp_id int,
modify salary int,
modify salary_date date;

