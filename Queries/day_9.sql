use 50_days_sql_challenge;


--1) find the employees who has valid departments --

select e.emp_id,e.emp_name,d.dept_name
from cleaned_employees e
join cleaned_departments d 
on e.dept_id=d.dept_id;

--2) find all employees even w/o department.

select e.emp_id,e.emp_name,d.dept_id 
from cleaned_employees e
left join cleaned_departments d
on e.dept_id=d.dept_id ;

--3) list employees without dept--

select e.emp_id,e.emp_name,d.dept_id from cleaned_employees e 
left join cleaned_departments d 
on e.dept_id=d.dept_id
where d.dept_id is null;

--4) find employees salary--

select e.emp_id,e.emp_name,s.salary 
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id order by emp_id;

--5) find employees who salary is null;


select e.emp_id,e.emp_name,s.salary 
from cleaned_employees e
left join cleaned_salaries s
on e.emp_id=s.emp_id where s.salary  is null;

