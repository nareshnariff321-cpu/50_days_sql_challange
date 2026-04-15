
-- replacing invalid months with null  from date functions--

update cleaned_employees
set hire_date = null
where 
cast(substring_index(substring_index(hire_date,'-',2),'-',-1)as unsigned)>12


--converting the date into yyyy-mm--dd formate---


update cleaned_employees
    set hire_date=
          concat(right(hire_date,4),'-',substring(hire_date,4,2),'-',
          left(hire_date,2))
          where hire_date like '__-__-____';



--replacing invalid dates with null--


update cleaned_employees
    set hire_date= null
       where cast(right(hire_date,2)as unsigned)>31; 

-- changing the data type of date column--

alter table cleaned_employees
modify hire_date  date;


--replacing the null values ---

update cleaned_employees
set hire_date = case
 when hire_date = 'null' then '2024-02-15' else 'no'
  end where hire_date is null;

--updating the date column of attendence table--

update cleaned_attendence
set attendence_date = concat(right(attendence_date,4),'-',substring(attendence_date,4,2),'-',
left(attendence_date,2));

--updating the salary_date column of salary table--

update cleaned_salaries 
set salary_date = concat(right(salary_date,4),'-',substring(salary_date,4,2),'-',
left(salary_date,2)) where salary_date like '__-__-____';

