
--employees whose average performance rating >4--

select e.emp_id,e.emp_name,(p.rating_2022+p.rating_2023+p.rating_2024)/3 as avg_rating
from cleaned_employees e
join cleaned_performance p
on e.emp_id=p.emp_id
where (p.rating_2022+p.rating_2023+p.rating_2024)/3 >4;


--employees with more than 10 present days --

select e.emp_id,e.emp_name,count(a.attendance_id) as total_present_days
from cleaned_employees e
join cleaned_attendence a
on e.emp_id=a.emp_id
where a.status='present'
group by e.emp_id,e.emp_name
having count(a.attendance_id)>3;

--departments where total salary pain more than 200000 --

select d.dept_id,d.dept_name,sum(salary) as total_salary
from cleaned_employees e
join cleaned_departments d on e.dept_id=d.dept_id
join cleaned_salaries s on e.emp_id=s.emp_id
group by d.dept_id,d.dept_name
having sum(salary)>200000;

--employees whose total salary is greater than department average salary --

select e1.emp_id,e1.emp_name,sum(s1.salary) as total_salary
from cleaned_employees e1
join cleaned_departments d1 on e1.dept_id=d1.dept_id
join cleaned_salaries s1 on e1.emp_id=s1.emp_id
group by e1.emp_id,e1.emp_name
having sum(s1.salary) >
(
select avg(salary) as avg_salary from cleaned_salaries);




