use 50_days_sql_challenge;

--1) Orders per day : find number of orders placed daily

select * from clean_orders;

select 
      order_date,

      count(order_id) as total_orders

from clean_orders 

group by order_date

order by order_date;

--2) Orders per month : find monthly order trend

select 
      month(order_date) as month,

      monthname(order_date) as monthname,

      count(order_id) as total_orders

from clean_orders

group by month(order_date),monthname(order_date)

order by month(order_date);

--3) Height order value : find height order value

select 
      order_id,
      
      sum(payment_amount) as order_value

from clean_payments 

group by order_id 

order by order_value desc

limit 1;

--4) Lowest order value : find lowest order

select 
      order_id,
      
      sum(payment_amount) as order_value

from clean_payments 

group by order_id 

order by order_value 

limit 1;

--5) average order size : find average quantity per order 

SELECT
      order_id,

      avg(quantity) as avg_quantity

      from clean_order_details

      group by order_id
      
      order by order_id;


--6) Order distribution : categorize orders by quantity size (quantity <=2 snall order,
      quantity <=5 medium order, else large order)

 select
        case
            when quantity <=2 then "small_order"

            when quantity <=5 then "medium_order"

            else "big_order" end as order_category,
            
            count(*)as total

    from clean_order_details
    
     group by order_category;

--7) peak sale day : find day with highest number of orders

SELECT
      order_date,

      count(order_id) as total_orders

      from clean_orders
      group by order_date
      order by total_orders desc
      limit 1;

