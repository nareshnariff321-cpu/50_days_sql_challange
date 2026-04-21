use 50_days_sql_challenge;

--Rank employees by salaries --

select emp_id,salary,rank() over(order by salary desc) as ranks
from cleaned_salaries;

--Department wise ranking (rank employees inside each department) --

select e.emp_id,e.dept_id,s.salary,
dense_rank() over(partition by e.dept_id order by s.salary desc) as ranks
from cleaned_employees e
join cleaned_salaries s
 on e.emp_id=s.emp_id ;


--Top performance (calculate avg_rating rank)--

select emp_id,(rating_2022+rating_2023+rating_2024)/3 as avg_rating,
dense_rank() over(order by (rating_2022+rating_2023+rating_2024)/3 desc) as performance_ranks
from cleaned_performance;


--salary ranking (top 3 employees)--


select * from (
select emp_id,(rating_2022+rating_2023+rating_2024)/3 as avg_rating,
dense_rank() over(order by (rating_2022+rating_2023+rating_2024)/3 desc) as performance_ranks
from cleaned_performance)t

where performance_ranks<=3;
