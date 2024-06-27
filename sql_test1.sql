----------------------------------------------------------
-- Q1 How many rows are there in the transactions table?
----------------------------------------------------------
select 
  count(*)
 from
  grocery_db.transactions;
  -- there are 38506 rows/ observations in the transactions table
  
--------------------------------------------------------------
 -- Q2 Return the customer_id for the customer who lives farthest from the store
 -------------------------------------------------------------- 
 select 
  customer_id,
  distance_from_store
 from 
  grocery_db.customer_details
 where
  distance_from_store = (select max(distance_from_store) from grocery_db.customer_details);
  
------------------------------------------------------------------------------
-- Q3 Return the number of unique customers in the customer_details table, split by gender 
 -------------------------------------------------------------------------------
 select
  gender, 
  count(distinct customer_id)
from 
  grocery_db.customer_details
 group by gender;
 

---------------------------------------------------------------------------------------
--  Q4 What were the total sales for each product area name for July 2020. Return these 
-- in the order of highest sales to lowest sales 
-----------------------------------------------------------------------------------------
select 
  product_area_name,
  sum(sales_cost) as total_sales
from 
  grocery_db.transactions a
  inner join grocery_db.product_areas b
  on a.product_area_id = b.product_area_id
where
  a.transaction_date between '2020-08-01' and '2020-08-31'
 group by b.product_area_name
 order by total_sales desc;
 
----------------------------------------------------------------------------------------------
-- Q5 Return a list of all customer_id's that do NOT havea loyalty score (i.e. they are in 
-- the customer_details table, but not in the loyalty_scores table  
-----------------------------------------------------------------------------------------------

select 
  a.customer_id,
  b.customer_loyalty_score
 from
  grocery_db.customer_details a
  left join grocery_db.loyalty_scores b
  on a.customer_id = b.customer_id
 where
  b.customer_loyalty_score is null;

  
 
