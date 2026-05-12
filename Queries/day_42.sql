use 50_days_sql_challenge;

---1)
create table clean_customers 
as
select * from raw_customers;

---2)
create table clean_orders
as
select * from raw_orders;

---3)
create table clean_products
as
select * from raw_products;

---4)
create table clean_order_details
as
select * from raw_order_details;

---5)
create table clean_payments
as
select * from raw_payments;

---DATA CLEANING ---

--- CUSTOMERS TABLE ---


select * from clean_customers;


-- Remove spaces--

update clean_customers
set customer_id=trim(customer_id),
customer_name = trim(customer_name),
city = trim(city),
signup_date = trim(signup_date);


--Standardize Text--

update clean_customers
set 
   customer_name = upper(customer_name),
   city = upper(city);

--Replace NULL Values--

update clean_customers
set city = 'UNKNOWN'
where city is null;


update clean_customers
set customer_name = 'UNKNOWN'
where customer_name is null;


update clean_customers
set signup_date = '01-01-2024'
where signup_date is null;


--Remove Duplicate values--

delete from clean_customers
where customer_id in(

    select customer_id from (

select customer_id,row_number() over(partition by customer_id order by customer_id) as ranks
from clean_customers)t

where ranks > 1 );


--- ORDERS TABLE --

---remove space ---

UPDATE orders
set order_id = trim(order_id),
customer_id = trim(customer_id),
order_date = trim(order_date);

---PRODUCTS TABLE---

update clean_products
set product_name = trim(product_name),
category = trim(category);


