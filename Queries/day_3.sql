--updating missing values--
update cleaned_performance
set rating_2023='0'
where rating_2023='';

update cleaned_employees
set emp_name='unknown'
where emp_name is null or emp_name='';

update cleaned_employees 
set city='Delhi'
where city is null or city='';

--Find duplicate values--

--employees

select emp_id,emp_name,city,count(*) as duplicates
from cleaned_employees group by emp_id,emp_name,city
having count(*)>1

--departments--

select dept_id,dept_name,count(*) as duplicates 
from cleaned_departments
group by dept_id,dept_name having count(*)>1;

--attendence--

select attendance_id,count(*) as duplicates
from cleaned_attendence
group by attendance_id 
having count(*)>1;

--performance--

select emp_id,count(*) as duplicates
from cleaned_performance
group by emp_id 
having count(*)>1;

--salaries--

select salary_id,salary_date,count(*) as duplicates
from cleaned_salaries
group by salary_id,salary_date
having count(*)>1;

