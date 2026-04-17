use 50_days_sql_challenge;

--1) employees earning more than the department average salary --

select e1.emp_id,e1.emp_name,d1.dept_id,d1.dept_name,s1.salary
from cleaned_employees e1
join cleaned_departments d1
on e1.dept_id=d1.dept_id
join cleaned_salaries s1
on e1.emp_id=s1.emp_id
where s1.salary >
(
select avg(s.salary) as avg_salary
from cleaned_employees e 
join cleaned_salaries s
on s.emp_id=e.emp_id
where e.dept_id=e1.dept_id);

--2) list the employees whose salary is higher per department--

select e.emp_id,e.emp_name,d.dept_name,s.salary
from cleaned_employees e
join cleaned_departments d
on e.dept_id=d.dept_id
join cleaned_salaries s
on e.emp_id=s.emp_id
where s.salary>(
    select max(s1.salary) as maximum_salary from
    cleaned_employees e1
    join cleaned_salaries s1
    on e1.emp_id=s1.emp_id
    where e1.dept_id=e.dept_id
);

