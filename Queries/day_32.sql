use 50_days_sql_challenge;


--1) create employee view (create a view of employee details)--

create view emp_view as 
    select emp_id,emp_name,dept_id, city from cleaned_employees ;


select * from emp_view where city= 'mumbai';

--2) create a salary view --

create view salary_view as 
    select emp_id,salary_date,salary from cleaned_salaries;

select * from salary_view
where emp_id=444;    

--3)create joined view emp_salary_view --


create view emp_salary_view as 
select e.emp_id,e.emp_name,d.dept_id,s.salary,s.salary_date
from cleaned_employees e 
join cleaned_departments d on e.dept_id=d.dept_id
join cleaned_salaries s on e.emp_id=s.emp_id ;


select * from emp_salary_view where salary >500000; 