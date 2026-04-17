
 --1) what is the avg salary in each department--

 select d.dept_name,avg(s.salary) as avg_salary
 from cleaned_employees e 
 join cleaned_departments d 
 on e.dept_id=d.dept_id
 join cleaned_salaries s 
 on e.emp_id=s.emp_id 
group by d.dept_name;

--2) how many days was each employee present--

select e.emp_id,e.emp_name,count(a.attendance_id) as total_present 
from cleaned_employees e 
left join cleaned_attendence a 
on e.emp_id=a.emp_id
where a.status='present'
group by e.emp_id,e.emp_name order by total_present desc;

--3) which employee belong to same department--

select dept_id, group_concat(emp_name) as employees 
from cleaned_employees
group by dept_id 
having count(*)>1;

--4) which employee have more than 1 salary record--

select e.emp_id,e.emp_name,count(s.salary_id) as total_records
from cleaned_employees e 
join cleaned_salaries s 
on e.emp_id=s.emp_id 
group by e.emp_id,e.emp_name
having count(s.salary_id)>1 order by e.emp_id asc;

