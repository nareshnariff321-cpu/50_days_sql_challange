use 50_days_sql_challenge;

--1) employees earning more than average salary--

select e.emp_id,e.emp_name,s.salary from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id
where s.salary > (select avg(salary) as avg_salary from cleaned_salaries);

--2) employees with salary equal to maximum salary--

select e.emp_id,e.emp_name,s.salary from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id
where s.salary = ( select max(salary) as max_salary from cleaned_salaries);

--3) employees with less than average salary--

select e.emp_id,e.emp_name,s.salary from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id
where s.salary < (select avg(salary) as avg_salary from cleaned_salaries);

--4) employees with minimum salary --

select e.emp_id,e.emp_name,s.salary from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id
where s.salary = ( select min(salary) as max_salary from cleaned_salaries);

