
--employees with more than 2 salary records--

select emp_id,count(*) as salary_records
from cleaned_salaries
group by emp_id having count(*) >2;

--departments with more than 3 employees--

select dept_id,count(emp_id) as total_employees
from cleaned_employees
group by dept_id
having count(emp_id)>3;

---employees with total_salary>100000--

select emp_id,sum(salary) as total_salary
from cleaned_salaries
group by emp_id
having sum(salary)>100000;

--department with high average salary 

select e.dept_id,avg(salary) as avg_salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id
group by e.dept_id;


select e.dept_id,avg(s.salary) as avg_salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id
group by e.dept_id
having avg(salary) >50000;
