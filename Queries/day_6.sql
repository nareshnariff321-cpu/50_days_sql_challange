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
 when salary_id = 17 then 65000
 when salary_id = 37 then 97000 else 'no'
 end 
 where salary_id in (17,37);


