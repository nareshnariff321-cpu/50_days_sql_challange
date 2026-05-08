use 50_days_sql_challenge;

---1) before insert trigger () ---

create trigger before_sal_insert
before insert 
on cleaned_salaries
for each row
begin
 if new.salary < 0 then set new.salary = 0 ;
 end if;
end; 

insert into cleaned_salaries( salary_id,emp_id,salary,salary_date)
values(501,901,-500,'2024-01-01');


---2)after update (when ever salary changes save  old salary new salary into log table)

create table salary_logs (emp_id int, old_salary int, new_salary int );

create trigger salary_update_triger
after update
on cleaned_salaries
for each row
begin
  insert into salary_logs
  (emp_id, old_salary, new_salary)
  values(old.emp_id,old.salary, new.salary );
  end;


update cleaned_salaries
set salary = 70000
where emp_id = 463;

select * from cleaned_logs;