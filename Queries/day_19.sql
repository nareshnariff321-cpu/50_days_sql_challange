use 50_days_sql_challenge;

--1) salary category (low<30,000 , medium between 30,000 - 60,000, high>60,000)--

select e.emp_id,e.emp_name,s.salary, 
CASE
  when s.salary < 30000 then 'low'
  when s.salary between 30000 and 60000 then 'Medium'
  else 'high' end as salary_category
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id;


 --2) performace category (avgerage rating >=4 then 'good' average rating >=3 then 'AVERAGE' else poor)

 select e.emp_name,(p.rating_2022+p.rating_2023+p.rating_2023)/3 as avg_rating,
 case
     when (p.rating_2022+p.rating_2023+p.rating_2023)/3>=4 then 'Good' 
     when (p.rating_2022+p.rating_2023+p.rating_2023)/3>=3 then 'Average' 
     else 'Poor' end as performance_category 
 from cleaned_employees e
 join cleaned_performance p
 on e.emp_id=p.emp_id;    


--3) attendence status category (present 'Active', else 'Inactive')--

select e.emp_name,a.status,
  case
      when a.status = 'Present' then 'Active'
      else 'inactive' end as attendence_category
from cleaned_employees e
join cleaned_attendence a
on e.emp_id=a.emp_id;      


--4)experience category( <2 then fresher,between 2 and 5 then mid-level, >5 experienced )--


select emp_id,emp_name,year(CURRENT_DATE())-year(hire_date) as experience,
case
    when year(CURRENT_DATE())-year(hire_date) < 2 then 'Fresher'
    when year(CURRENT_DATE())-year(hire_date) between 2 and 5 then 'Mid-level'
    else 'Experienced' end as experience_category 
from cleaned_employees; 
