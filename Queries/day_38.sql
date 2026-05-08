use 50_days_sql_challenge;

---1) before updating trigger(prevent negative salary)---

create trigger prevent_negative_salary
before update
on cleaned_salaries
for each row
begin
  if new.salary < 0 then
  set new.salary = old.salary;
 end if;
end;   

select * from cleaned_salaries where emp_id=102;

update cleaned_salaries
set salary = 50000
where emp_id=102;


---2)after insert trigger (attendence login)---

create table attendence_logs (emp_id int, attendence_date date, message varchar(10));

create trigger attendence_insert_log
after insert
on cleaned_attendence
for each row
begin
 insert into attendence_logs (emp_id, attendence_date, message)
 values (new.emp_id, new.attendence_date, 'attendence added');
 end;

 select * from attendence_logs;

 insert into cleaned_attendence values(202601,101,'2026-08-06','present');

