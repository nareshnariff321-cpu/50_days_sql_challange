use 50_days_sql_challenge;

--1) employees where total salary > 100000 --

with total_salary as (
    select emp_id,sum(salary) as total_salary 
    from cleaned_salaries
    group by emp_id),

    high_earners as (
        select * from total_salary where total_salary > 100000 )

     select * from high_earners;   


--2) show employee salary along with department average --

with dept_avg_salary as(
    select e.dept_id,avg(salary) as avg_salary
    from cleaned_employees e
    join cleaned_salaries s
    on e.emp_id=s.emp_id 
    group by e.dept_id),

 all_table    as (
        select e.emp_id,s.salary,da.dept_id,da.avg_salary
        from cleaned_employees e
        join cleaned_salaries s on e.emp_id=s.emp_id
        join dept_avg_salary da on e.dept_id=da.dept_id)

        select * from emp order by dept_id asc;


--3) department with heighest salary per department --

with dept_salary as (
    select e.dept_id,sum(s.salary) as total_salary 
    from cleaned_employees e
    join cleaned_salaries s 
    on e.emp_id=s.emp_id
    group by e.dept_id),

    max_salary as (
        select dept_id,max(total_salary)  as heighest_salary
        from dept_salary group by dept_id)

        select * from max_salary;

