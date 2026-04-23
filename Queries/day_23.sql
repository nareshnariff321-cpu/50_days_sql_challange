
use 50_days_sql_challenge;

--1) employees current salary and previous salary--

select emp_id,salary,salary_date,lag(salary) over(partition by emp_id order by salary_date ) as previous_salary
from cleaned_salaries;

--1) Difference betwwen current salary and previous salary--

select emp_id,salary,lag(salary) over(partition by emp_id order by salary_date ) as previous_salary,
((salary)- lag(salary) over(partition by emp_id order by salary_date))as difference
from cleaned_salaries;

--3) attendence trend (check if attendence Improved or Declained)--


select emp_id,status,lag(status) over(partition by emp_id order by attendence_date) as previous_status,
CASE
when status ='Present' and  lag(status) over(partition by emp_id order by attendence_date) = 'Present' then  'improved'
else 'Declained' end as attendence_trend
from cleaned_attendence;
