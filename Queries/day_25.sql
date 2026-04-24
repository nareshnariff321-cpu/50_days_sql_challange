use 50_days_sql_challenge;

--salary running total (calculate salary for each employee over time)

select emp_id,salary_date,salary,sum(salary) over(partition by emp_id order by salary_date)as running_total
from cleaned_salaries; 


--Attendence running count (finf total attendence count over time)--

select emp_id,attendence_date,count(attendance_id) over(partition by emp_id order by attendence_date) as running_total
from cleaned_attendence;


--department salary (total salary accumulated in each department over time)

select d.dept_id,d.dept_name,s.salary_date,s.salary,sum(s.salary) over(partition by d.dept_id, d.dept_name order by s.salary_date) as running_salary
from cleaned_employees e 
join cleaned_departments d on e.dept_id=d.dept_id
join cleaned_salaries s on e.emp_id=s.emp_id
