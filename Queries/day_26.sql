use 50_days_sql_challenge;

--1) Find the rank of employees within each department based on salary --

select e.emp_id,e.dept_id,s.salary,row_number() over(partition by e.dept_id order by s.salary desc) as ranks
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id;
                     
                         (or)

--Find the rank of employees within each department based on total salary --

select e.emp_name,d.dept_name,sum(s.salary) as total_salary,row_number() over(partition by d.dept_name order by sum(s.salary) desc) as ranks
from cleaned_employees e
join cleaned_departments d on e.dept_id=d.dept_id
join cleaned_salaries s on e.emp_id=s.emp_id
group by e.emp_name,d.dept_name;


--2) compare each employee's salary with their department average salary ( salary >avg = above average
salary <avg salary - belw average) --

select e.emp_id,e.dept_id,s.salary,avg(s.salary) over(partition by e.dept_id ) as dept_avg_salary,
case 
    when  s.salary > avg(s.salary) over(partition by e.dept_id ) then 'Above_avg'
    when s.salary < avg(s.salary) over(partition by e.dept_id ) then 'Below_abg'
    else ' Equal' 
    end as 'comparision'
from cleaned_employees e
join cleaned_salaries s on e.emp_id=s.emp_id;


--3) find top 3 highest paid employees in each department --
 select * from (
select e.emp_id,e.dept_id,s.salary,row_number() over(partition by e.dept_id order by s.salary desc) as ranks
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id)t
where ranks <=3;


--4)  find lowest salary employee in each department -- 

 select * from (
select e.emp_id,e.dept_id,s.salary,row_number() over(partition by e.dept_id order by s.salary asc) as ranks
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id)t
where ranks = 1;
