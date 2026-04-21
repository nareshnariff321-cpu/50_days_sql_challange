
--1) department avgerage salary (show each employee with average salary of their department )--

select e.emp_id,e.emp_name,e.dept_id,
avg(s.salary) over(partition by e.dept_id) as avg_dept_salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id;

--2) total salaries of each department(emp_id,dept-id,salary)

select e.emp_id,e.emp_name,e.dept_id,
sum(s.salary) over(partition by e.dept_id) as total_salary_dept
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id;

--3) average performance of each department --

select e.emp_id,e.dept_id,
avg((p.rating_2022+p.rating_2023+p.rating_2024)/3) over(partition by e.dept_id) as avg_per_dept
from cleaned_employees e
join cleaned_performance p
on e.emp_id=p.emp_id;

