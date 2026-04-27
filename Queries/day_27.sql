use 50_days_sql_challenge;

--1)compare each employees salary with overall average salary( if salary > avg_salary then 'above avg_salary'
salary < avg_salary then 'below avg-salary')--

select emp_id,salary,avg(salary) over() as overall_avg_salary,
case 
     when salary>avg(salary) over() then 'Above_avg'
     when salary<avg(salary) over() then 'Below_avg'
     else 'equal' end as 'comparision'
from cleaned_salaries;


--2) compare employee salary with total salary of all employees 
(if 10% of total_salary > salary then 'high-contributor' else 'low-contributor') --

select emp_id,salary,sum(salary) over() as total_employees_salary,
case
    when  salary > (10*sum(salary) over()/100) then 'high_contributor'
    when salary < (10*sum(salary) over()/100) then 'low_contributor'
    else 'equal' end as 'comparision'
from cleaned_salaries;

--3)compare department total salary with overall total (if department total > 30% of total_salary then 'high'
 else 'low') --

 select distinct d.dept_name,sum(salary) over(partition by d.dept_name) as dept_total_salary,
 sum(salary)over()  as total_salary,
 case
     when sum(salary) over(partition by d.dept_name) > (30*sum(salary)over()/100) then 'high'
     when sum(salary) over(partition by d.dept_name) < (30*sum(salary)over()/100) then 'low'
     else 'equal' end as 'cpmparision'
 from cleaned_employees e
 join cleaned_departments d on e.dept_id=d.dept_id
 join cleaned_salaries s on e.emp_id=s.emp_id ;


