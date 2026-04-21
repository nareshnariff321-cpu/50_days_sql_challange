
--1)Latest salary

select * from (

select *, row_number() over(partition by emp_id order by salary_date desc) as ranks
from cleaned_salaries)t 

  where ranks=1;


  --2)first salaries 

  select * from (

select *, rank() over(partition by emp_id order by salary_date ) as ranks
from cleaned_salaries)t

where ranks=1;

--3) rating per employee (rank salary entries for each employee)--

select emp_id,salary,row_number() over(partition by emp_id order by salary desc) as ranks
from cleaned_salaries;

--4) get top 2 salary records per employees--

select * from(

select *,row_number() over(partition by emp_id ) as ranks
from cleaned_salaries)t

where ranks<=2;
