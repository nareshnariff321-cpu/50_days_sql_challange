use 50_days_sql_challenge;

--- updatation of payment_date colum in payments table---

update clean_payments
set payment_date = 
  case
      when  cast(substring(payment_date,1,2) as unsigned) > 12
      then date_format(
        str_to_date(payment_date,'%d-%m-%y'),'%y-%m-%d')
      when cast(substring(payment_date,4,2) as unsigned) > 12
      then date_format(
        str_to_date(payment_date,'%m-%d-%y'),'%y-%m-%d'
      )
      else payment_date
      end;


update clean_payments
  set payment_date = date_format(
    str_to_date(payment_date,'%d-%m-%y'),'%y-%m-%d'
  );
   

  ---updation of order_date of orders table--


update clean_orders
set order_date = 
  case
      when  cast(substring(order_date,1,2) as unsigned) > 12
      then date_format(
        str_to_date(order_date,'%d-%m-%y'),'%y-%m-%d')
      when cast(substring(order_date,4,2) as unsigned) > 12
      then date_format(
        str_to_date(order_date,'%m-%d-%y'),'%y-%m-%d'
      )
      else order_date
      end;


update clean_orders
  set order_date = date_format(
    str_to_date(order_date,'%d-%m-%y'),'%y-%m-%d'
  );


--- updation of signupdate in customers table ---


update clean_customers
set signup_date = 
  case
      when  cast(substring(signup_date,1,2) as unsigned) > 12
      then date_format(
        str_to_date(signup_date,'%d-%m-%y'),'%y-%m-%d')
      when cast(substring(signup_date,4,2) as unsigned) > 12
      then date_format(
        str_to_date(signup_date,'%m-%d-%y'),'%y-%m-%d'
      )
      else signup_date
      end;


update clean_customers
  set signup_date= date_format(
    str_to_date(signup_date,'%d-%m-%y'),'%y-%m-%d'
  );


  --- when the whole column is in DD-MM-YYYY  format then we can update column by ---

--updation of  signup_date in clean_customers table

update clean_customers 
set signup_date = concat(right(signup_date,4),'-',substring(signup_date,4,2),'-',
                  left(signup_date,2)) ;              


---updation of order_date of orders table--

update clean_orders 
set order_date = concat(right(order_date,4),'-',substring(order_date,4,2),'-',
                  left(order_date,2)) ;              


--- updatation of payment_date colum in payments table---

update clean_payments
set payment_date = concat(right(payment_date,4),'-',substring(payment_date,4,2),'-',
                  left(payment_date,2)) ;              



--- DATA TYPE fix and Add Constrains ---

-- customers table--

alter table clean_customers
modify customer_id int primary key,
modify customer_name varchar(100),
modify city varchar(100),
modify signup_date date;

---products table---

alter table clean_products
modify product_id int primary key,
modify product_name varchar(100),
modify category varchar(100),
modify price decimal (10,2);

---orders table---

alter table clean_orders
modify order_id int primary key,
modify customer_id int,
modify order_date date;

alter table clean_orders
add constraint fk_customer
foreign key (customer_id)

REFERENCES
clean_customers(customer_id);

--- order_details---

alter table clean_order_details
modify order_details_id int primary key,
modify order_id int,
modify product_id int,
modify quantity int;

alter table clean_order_details
add constraint fk_orders
foreign key (order_id)
REFERENCES
clean_orders(order_id);

alter table clean_order_details
add constraint fk_product
foreign key (product_id)
references
clean_products(product_id);

---payments table---

alter table clean_payments
modify payment_id int primary key,
modify order_id int,
modify payment_amount decimal(10,2),
modify payment_date date;


alter table clean_payments
add constraint fk_payment_order
foreign key (order_id)
references
clean_orders (order_id);