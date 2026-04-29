use 50_days_sql_challenge;

--1) latest salary per employee alomg with total salary till that point--

select emp_id,salary_date,salary,row_number() over(partition by emp_id order by salary_date desc) as ranks,
sum(salary) over(partition by emp_id) as total_salary
from cleaned_salaries)t
where ranks=1;

--2) Rank employees based on salary and compare with  department average --

select s.emp_id,s.salary,d.dept_name,dense_rank() over(partition by d.dept_name order by salary desc) as ranks,
avg(salary) over(partition by d.dept_name) as avg_salary 
from cleaned_employees e
join cleaned_departments d on e.dept_id=d.dept_id
join cleaned_salaries s on e.emp_id=s.emp_id;


--3)check if salary increase or decrease to previous salary --


select emp_id,salary_date, salary,lag(salary) over(partition by  emp_id order by salary_date) as previous_salary,
case 
    when lag(salary) over(partition by  emp_id order by salary_date) > salary then 'Increased'
    when lag(salary) over(partition by  emp_id order by salary_date) < salary then 'Decreased'
    when lag(salary) over(partition by  emp_id order by salary_date) = salary then 'equal'
    else 'no_previous_salary' end as salary_check 
from cleaned_salaries;


--
