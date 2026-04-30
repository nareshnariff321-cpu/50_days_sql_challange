use 50_days_sql_challenge;

--1) create temp table of salaries  and use it--

with salary_cte as(
    select emp_id,salary
    from cleaned_salaries
)
select * from salary_cte
where emp_id=25;

--2) combine employees and salaries using cte --

with emp_salary as(
select e.emp_id,e.dept_id,s.salary
from cleaned_employees e
join cleaned_salaries s 
on e.emp_id=s.emp_id
)

select * from emp_salary
where dept_id=5;

--3)  calculate the department average salary --

with dept_avg as(
    select e.dept_id,avg(s.salary) as avg_salary 
    from cleaned_employees e
    join cleaned_salaries s 
    on e.emp_id=s.emp_id
    group by e.dept_id
)
select * from dept_avg;

--4) find employees earning more than dept_avg --

with dept_avg as(
    select e.dept_id,avg(s.salary) as avg_salary 
    from cleaned_employees e
    join cleaned_salaries s
    on e.emp_id=s.emp_id
    group by e.dept_id
)

select e.emp_id,e.dept_id,s.salary
from cleaned_employees e
join cleaned_salaries s 
on e.emp_id=s.emp_id
join dept_avg d
on e.dept_id=d.dept_id
where s.salary > d.avg_salary;