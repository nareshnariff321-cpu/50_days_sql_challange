use 50_days_sql_challenge;

--1) update employee data using a view  (create a view and update the view)--

create view emp_basic as 
select emp_id,emp_name,city 
from cleaned_employees;

select * from emp_basic;

--- now update the details of emp_id=110 replace city with mumbai --

select * from emp_basic
where emp_id=110;

update emp_basic
set city ='mumbai'
where emp_id=110;


---2) create view for high salary employees(salary >50000) and use this view to fretch the data of employees--

create view high_salary_emp as 
select emp_id,salary,salary_date 
from cleaned_salaries 
where salary > 50000;

select * from high_salary_emp;


---3) multi-view (combine the employee, departments, salary,tables)---

create view emp_data AS
select e.emp_id,e.emp_name,d.dept_name,s.salary,s.salary_date
from cleaned_employees e
join cleaned_departments d
on e.dept_id=d.dept_id
join cleaned_salaries s
on e.emp_id=s.emp_id;

select * from emp_data;


---4) HR wants high salary employees with department view ---

create view hr_dashboard AS
select e.emp_id,e.emp_name,d.dept_name,s.salary
from cleaned_employees e
join cleaned_departments d
on e.dept_id=d.dept_id
join cleaned_salaries s
on e.emp_id=s.emp_id
where s.salary > 50000;

select * from hr_dashboard;
