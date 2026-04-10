
--Removing duplicate values--


--Employees table--

with cc as (
    select *,row_number() over(partition by emp_id,emp_name,city order by emp_id ) as ranks
    from cleaned_employees 
)
delete from cleaned_employees
where emp_id in (select emp_id from cc where ranks>1);

--department table--

with cc as (
    SELECT *,row_number() over(partition by dept_id )as ranks
    from cleaned_departments
)
delete from cleaned_departments
where dept_id in (select dept_id from cc where ranks>1);

--attendence table--

with cc as (
select *,row_number() over(partition by attendance_id)as ranks 
from cleaned_attendence)

delete from cleaned_attendance 
where attendance_id in (select attendance_id from cc where ranks>1);

--salaries--

with cc as(
select *,row_number() over(partition by salary_id )as ranks
from cleaned_salaries)

delete from cleaned_salaries where salary_id in (
select salary_id from cc where ranks>1);

--performance table--

with cc as (
select *,row_number()over(partition by emp_id  order by emp_id  )as ranks
from cleaned_performance)

delete from cleaned_performance
   where emp_id in (
      select emp_id from cc where ranks>1
);

select distinct city from cleaned_employees;

--identifying and correcting inconsistency in city colunm--

update cleaned_employees
set city=
           concat(upper(substring(trim(city),1,1)),
                 lower(substring(trim(city),2)));


update cleaned_employees
set city=case
        when city in ('Dlhi','New delhi') then 'Delhi'
        when city in ('Bangalore') then 'Bangaluru'
        when city in ('hydbd')then 'Hyderabad'
        else city end;








