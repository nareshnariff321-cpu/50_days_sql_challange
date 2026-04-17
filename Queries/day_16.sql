use 50_days_sql_challenge;

--1) total salary per employee--

select e.emp_id,e.emp_name,sum(s.salary) as total_salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name;

--2) average salary per employee--

select e.emp_id,e.emp_name,avg(s.salary)as average_salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name; 

--3) count of salary records per employee --

select e.emp_id,e.emp_name,count(s.salary_id) as total_salary_records
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name;

--4)maximum salary per employee--

select e.emp_id,e.emp_name,max(salary) as maximum_salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name;