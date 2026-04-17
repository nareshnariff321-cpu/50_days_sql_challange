
--employees who has salary record(at least one salary record)--

select e.emp_id,e.emp_name
 from cleaned_employees e
 where exists 
 (select 1 from cleaned_salaries s where s.emp_id=e.emp_id);

 --employees no salary record--

 select e.emp_id,e.emp_name
 from cleaned_employees e
 where not exists
 (select 1 from cleaned_salaries s where s.emp_id=e.emp_id);

--employees who has attendence record(at least one attendence record)--

select e.emp_id,e.emp_name
from cleaned_employees e
where exists(select 1 from cleaned_attendence a where a.emp_id=e.emp_id);


--employees who do not have attendence record--

select e.emp_id,e.emp_name
from cleaned_employees e
where not exists
(select 1 from cleaned_attendence a where a.emp_id=e.emp_id);