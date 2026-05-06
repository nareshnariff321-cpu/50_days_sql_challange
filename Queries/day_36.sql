use 50_days_sql_challenge;

---1) create the procedure to get employee data---

 create procedure all_emp_details()
 begin
  select * from cleaned_employees;
  end;

  call all_emp_details();

---2)procedure with input parameter---

create procedure get_emp_by_id (in emp_id_input  int)
 begin
  select * from cleaned_employees
  where emp_id=emp_id_input;
  end;

call get_emp_by_id(120);


---3)procedure with join (employee and salary details)---

create procedure emp_salary_details()
begin
 select e.emp_id,e.emp_name,s.salary,s.salary_date
 from cleaned_employees e
 join cleaned_salaries s
 on e.emp_id=s.emp_id;
 end;

call emp_salary_details();


---4)procedure for salary report (generate report for hihg salary employees>50000)---

create procedure high_salary_emp()
begin
 select * from cleaned_salaries
 where salary > 50000;
 end;

 call high_salary_emp();