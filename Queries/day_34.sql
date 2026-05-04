use 50_days_sql_challenge;

---1) create index on emp_id ---

create index idx_emp_id
on cleaned_employees(emp_id);

select * from cleaned_employees
where emp_id=101;

---2) create index on dept_id ---

create index idx_dept
on cleaned_departments (dept_id);

select * from cleaned_departments
where dept_id=3;


---3) composite index(emp_id,salary_date)---

create index idx_salary
on cleaned_salaries (emp_id,salary_date);

select * from cleaned_salaries
where emp_id = 102
and salary = '2024-01-01';