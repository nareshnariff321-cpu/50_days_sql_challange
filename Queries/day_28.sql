use 50_days_sql_challenge;

--1) top 2 employees per department (heighest paid employees in each department)--

select * from (
select e.emp_name,d.dept_name,s.salary,DENSE_RANK () over (partition by d.dept_name order by s.salary desc) as ranks
from cleaned_employees e
join cleaned_departments d on e.dept_id=d.dept_id
join cleaned_salaries s on e.emp_id=s.emp_id)t
where ranks<=2;


--2) salary gap (difference between current salary and previous salary)--

select emp_id,salary,lag(salary) over(partition by emp_id order by salary_date ) previous_salary,
((salary)-lag(salary) over(partition by emp_id order by salary_date )) salary_gap
from cleaned_salaries;


--3)performance gap (change in performance betwwen years)--

select emp_id,rating_2022,rating_2023,
rating_2024,(rating_2023-rating_2022) as 1st_gyp,
(rating_2024-rating_2023) as gyp_2024
from cleaned_performance;


--4) top performing (top performars only)--

select * from (
select e.emp_name,d.dept_name,s.salary,DENSE_RANK () over (partition by d.dept_name order by s.salary desc) as ranks
from cleaned_employees e
join cleaned_departments d on e.dept_id=d.dept_id
join cleaned_salaries s on e.emp_id=s.emp_id)t
where ranks=1;
