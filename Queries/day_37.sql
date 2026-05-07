use 50_days_sql_challenge;

---1) procedure with if condition---

 create procedure salaries_check (in emp int)
begin
     declare sal int;
     select salary into sal
     from cleaned_salaries
     where emp_id=emp
     limit 1 ;

  if sal > 50000 then
   select 'high salary' as result;
   else 
   select 'low salary' as result;
   end if;
   end;   
     
 call salaries_ckeck(101);    

---2) procedure with case (categorise the employees salary > 70000 then >40000 then medium < 40000 then low )---

create procedure emp_category(in emp int)
begin 
     select emp_id,salary,
      case
         when salary > 70000 then 'high'
         when salary > 40000 then 'medium'
         when salary < 40000 then 'low'
         else 'no'
         end as 'salary_category'
    from cleaned_salaries
       where emp_id=emp;

 end; 

call emp_category(105);


---3)procedure with agrigation (total salary per employee)---

create procedure employee_total_salary()
begin
 select e.emp_id,e.emp_name,sum(s.salary) as total_salary
 from cleaned_employees e
 join cleaned_salaries s
 on e.emp_id=s.emp_id
 group by e.emp_id,e.emp_name;
 end;

call employee_total_salary();

