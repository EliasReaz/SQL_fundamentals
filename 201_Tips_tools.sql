-----------------------------------------------------------
-- USEFUL tips abd tricks (vol 1)
------------------------------------------------------------

---------------------------------------------------------------
-- Using sub-queries
------------------------------------------------------------------

select 
  product_area_name, 
  profit_margin
 from 
  grocery_db.product_areas
 where 
  profit_margin = (select max(profit_margin) from grocery_db.product_areas);
  
----------------------------------------------------------------------------
-- Lead & lag
----------------------------------------------------------------------------

create temp table cust_transaction AS (
 select distinct customer_id, transaction_date, transaction_id
 from grocery_db.transactions
 where customer_id in (1,2));


-- select * from cust_transaction;

select 
  *, 
  lag(transaction_date, 1) over (partition by customer_id order by transaction_date, transaction_id) as lag1,
  lag(transaction_date, 2) over (partition by customer_id order by transaction_date, transaction_id) as lag2,
  lead(transaction_date, 1) over (partition by customer_id order by transaction_date, transaction_id) as lead1,
  transaction_date - lag(transaction_date, 1) over (partition by customer_id order by transaction_date, transaction_id)  as day_diff 
from cust_transaction;   

------------------------------------------------------------------------
-- round()
------------------------------------------------------------------------

select 
  customer_id,
  sales_cost, 
  round(sales_cost, 1) as round_cost1,
  round(sales_cost, 0) as round_cost0,
  round(sales_cost, -1) as round_cost3 -- nearest tenth
 from grocery_db.transactions
 where customer_id=1;
   
---------------------------------------------------------------------------------
-- random ssampling
---------------------------------------------------------------------------------

select 
  *
from
 grocery_db.transactions
order by 
  random()
 limit 100;   
 
------------------------------------------------------------------
-- date_part() Extracting part of a date
------------------------------------------------------------------

select 
  distinct transaction_date,
  date_part('day', transaction_date) as day,
  date_part('month', transaction_date) as month,
  date_part('year', transaction_date) as year,
  date_part('dow', transaction_date) as day_of_week -- 0 = Sunday, 1 = Monday
from
 grocery_db.transactions
order by transaction_date desc
limit 100;  

------------------------------------------------------------------------- 
-- strings 
-----------------------------------------------------------------

select product_area_name,
 upper(product_area_name) as pan_upper,
 lower(product_area_name) as pan_lower, 
 char_length(product_area_name) as pan_len,
 concat(product_area_name, ' - Department') as pan_concat,
 substring(product_area_name, 2, 5) as pan_substring,
 repeat(product_area_name, 2) as pan_repeat
 from grocery_db.product_areas;
  

