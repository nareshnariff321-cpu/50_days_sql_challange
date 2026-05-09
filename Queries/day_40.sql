use 50_days_sql_challenge;

create temporary table emp_salary(emp_id int,total_salary int);

insert into emp_salary(emp_id, total_salary)
select emp_id,sum(salary) 
from cleaned_salaries
group by emp_id;

select * from emp_salary;


select e.emp_id,e.emp_name,t.total_salary
from emp_salary t
join cleaned_employees e
on t.emp_id=e.emp_id;