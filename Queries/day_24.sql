--1) current salary and next salary --

select emp_id,salary_date,salary,lead(salary) over(partition by emp_id order by salary_date) as next_salary
from cleaned_salaries;

--2) growth compare the current salary with the next salary--

select emp_id,salary_date,salary,((salary)-lag(salary) over (partition by emp_id order by salary_date )) as salary_difference
from cleaned_salaries;

--3)trend prediction (today vs next day ) attendence--

select emp_id,attendence_date,status,lead(status) over(partition by emp_id order by attendence_date) as next_day_status
from cleaned_attendence;




