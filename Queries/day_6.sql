--finding outliers in salaries--

select * from cleaned_salaries;

--changing the data type--

alter table cleaned_salaries
modify salary int;

--adding new column--

alter table cleaned_salaries
add  column is_outlier int;

select * from cleaned_salaries;

--updating outliers--

update  cleaned_salaries 
set is_outlier=
case when salary <20000 or salary >200000
then 1 
else 0 
end ;

select * from cleaned_salaries
where is_outlier=1;

--updatng the salary column--

update cleaned_salaries 
set salary= case 
 when emp_id = 17 then 65000
 when emp_id = 37 then 97000
 end 
 where emp_id in (17,37);


select * from cleaned_salaries;


select * from cleaned_employees;


select concat(city,' ',age) from cleaned_employees;

select concat(right(hire_date,4) ,'-', substring(hire_date,4,2),
'-',left(hire_date,2))as formated_hire_date from cleaned_employees;