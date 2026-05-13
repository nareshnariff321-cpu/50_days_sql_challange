use 50_days_sql_challenge;

--1) total customers

select count(*) as total_customers
from clean_customers;

--2) total orders 

select count(*) as total_orders
from clean_orders;

--3) total revenue 

select sum(payment_amount) as total_revenue
from clean_payments;

--4) total products sold

select count(*) as total_products
from clean_order_details

--5) orders per customer

select customer_id,count(order_id) as total_orders
from clean_orders
group by customer_id;

