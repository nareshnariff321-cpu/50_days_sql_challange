--departments
select * from cleaned_departments
where dept_id=" " or dept_id is null
OR
dept_name=" " or dept_name is null;

--employees
select * from cleaned_employees 
where emp_id="" or emp_id is null
or
emp_name=" " or emp_name is NULL 
or
age=" " or age is NULL
Or
city=" " or city is NULL
OR
dept_id=" " or dept_id is NULL
OR
hire_date=" " or hire_date is NULL;

--attendence
select * from cleaned_attendence
where attendance_id=" " or attendance_id is null
or
emp_id=" " or emp_id is null
or
attendence_date=" " or attendence_date is null
or
status=" " or status is null;

--performance

select * from cleaned_performance
where emp_id=" " or emp_id is null
or
rating_2022=" " or rating_2022 is null
or
rating_2023=" " or rating_2023 is null
or
rating_2024=" " or rating_2024 is null;

--salaries

select * from cleaned_salaries
where salary_id=" " or salary_id is null
or
emp_id=" " or emp_id is null
or
salary=" " or salary is null
or
salary_date=" " or salary_date is null;






