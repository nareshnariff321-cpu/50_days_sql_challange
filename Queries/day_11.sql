use 50_days_sql_challenge;

--1) what is the employee,department,performance rating--

select e.emp_name,d.dept_name,p.rating_2022,p.rating_2023,p.rating_2024
from cleaned_employees e 
join cleaned_departments d 
  on e.dept_id=d.dept_id
join cleaned_performance p 
  on e.emp_id=p.emp_id;

--2)what is the complete profile of each empolyee (dept,salary,performance)--

select e.emp_name,d.dept_name,s.salary,p.rating_2022,p.rating_2023,p.rating_2024
from cleaned_employees e 
left join cleaned_departments d 
  on e.dept_id=d.dept_id
left join cleaned_salaries s
  on e.emp_id=s.emp_id   
left join cleaned_performance p 
  on e.emp_id=p.emp_id;

--3) how many salary records does each employee has--

select e.emp_name,e.emp_id,count(s.salary_id)as total_records 
from cleaned_employees e 
left join cleaned_salaries s 
on e.emp_id=s.emp_id 
group by e.emp_name,e.emp_id;

--4) what is total salary paid to each employee--

select e.emp_id,e.emp_name,sum(s.salary) as total_salary
from cleaned_employees e 
LEFT JOIN cleaned_salaries s 
on e.emp_id=s.emp_id
group by e.emp_id,e.emp_name;