use 50_days_sql_challenge;

--- index optimization --

---1) Analyze query before index --


explain analyze
select e.emp_name,s.salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id;


--- apply index 

create index idx_emp on cleaned_employees (emp_id);
create index idx_emp_sal on cleaned_salaries (emp_id);

--- after applying lets run analysis query again ---

explain analyze
select e.emp_name,s.salary
from cleaned_employees e
join cleaned_salaries s
on e.emp_id=s.emp_id;


---2) composite index ---

--- analy (where emp_id=101, salary_date=2024-01-01 ) ---

explain analyze
select emp_id,salary from cleaned_salaries
  where emp_id=101 and salary_date=2024-01-01;

  ---now index the columns--

  create index idx_emp_id on cleaned_salaries(emp_id);
  create index idx_emp_salary_date on cleaned_salaries (salary_date);


explain analyze
select emp_id,salary from cleaned_salaries
  where emp_id=101 and salary_date=2024-01-01;


---3)analyse the emp_id 101--


explain analyze
select * from cleaned_employees
where emp_id=101;

--indixing the emp_id---

create index idxn_emp on cleaned_employees (emp_id);

explain analyze
select * from cleaned_employees
where emp_id=101;
