use 50_days_sql_challenge;

-- 1) Top customers by orders  : find customers who placed most orders --

SELECT
      c.customer_id,

      c.customer_name,

      count(o.order_id) as total_orders

    from clean_customers c

    join clean_orders O
    on c.customer_id = o.order_id

    group by c.customer_id,c.customer_name

    order by total_orders desc;


--2) Top customers by revenue : find customers generating high revenue 

select 
      c.customer_id,

      c.customer_name,

      sum(p.payment_amount) as total_revenue

    from clean_customers c

    join clean_orders O
    on c.customer_id=o.customer_id

    join clean_payments p
    on o.order_id=p.order_id

    group by c.customer_id,c.customer_name

    order by total_revenue desc;


--3) Customers with no orders : find inactive customers

     select 

           c.customer_id,

           c.customer_name

        from clean_customers c

        left join clean_orders O
        on c.customer_id=o.customer_id

        where o.order_id is null;


--4) New customers trend : find customer signup trend month wise

SELECT
       MONTH(signup_date) as month_no,

       count(customer_id) as new_customers

    from clean_customers

    group by month(signup_date)

    order by month_no;


-- 5) Repeat customers : find customers with multiple orders

SELECT
      c.customer_id,

      c.customer_name,

      count(o.order_id) as total_orders

    from clean_customers c

    join clean_orders O
    on c.customer_id=o.customer_id

    GROUP BY c.customer_id,c.customer_name

    HAVING count(o.order_id) >1;


-- 6) customer lifetime value : find total spending of each customer

SELECT
      c.customer_id,

      c.customer_name,

      sum(p.payment_amount) as lifetime_value

      from clean_customers c

      join clean_orders O
      on c.customer_id=o.customer_id

      join clean_payments p
      on o.order_id=p.order_id

      group by c.customer_id,c.customer_name

      order by lifetime_value desc;



--- 7) Average Spending per customer : find average spending by each customer

select 
      c.customer_id,

      c.customer_name,

      avg(p.payment_amount) as avg_spending

    from clean_customers c

    join clean_orders O
    on c.customer_id=o.customer_id

    join clean_payments p
    on o.order_id=p.order_id

    group by c.customer_id,c.customer_name;


 --- 8) customers per city : find number of customers in each city 

 SELECT
       city,

       count(customer_id) as total_customers

    from clean_customers

    group by city
    
    order by total_customers desc;   




