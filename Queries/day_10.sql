use 50_days_sql_challenge;

--1) what are performance rating of each employee--

select e.emp_id,p.rating_2022,p.rating_2023,p.rating_2024 
from cleaned_employees e 
join cleaned_performance p 
on e.emp_id=p.emp_id ;

--2) which employees do not have any salary records --

select e.emp_id,e.emp_name
from cleaned_employees e
left join cleaned_salaries s
on e.emp_id=s.emp_id
where s.emp_id is null;

--3) which employees do not have any attendence record--

select e.emp_id,e.emp_name,a.emp_id
from cleaned_employees e
left join cleaned_attendence a 
on e.emp_id=a.emp_id
where a.emp_id is null;

--4) what is the emp_name, dept , salary togerther --

select e.emp_name,d.dept_name,s.salary 
from cleaned_employees e 
join cleaned_departments d on e.dept_id=d.dept_id
join cleaned_salaries s on e.emp_id=s.emp_id ;