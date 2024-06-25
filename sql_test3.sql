--------------------------------------------------------------------------------------
-- Q1 Return a list of customers from the loyalty_scores table
-- who have a customer_loyalty_score of 0.77, 0.88, or 0.99
---------------------------------------------------------------------------------------
select 
  *
 from grocery_db.loyalty_scores
 where customer_loyalty_score in (0.77, 0.88, 0.99);

------------------------------------------------------------------------------------
-- Q2 Return the average customer_loyalty_score for customers, split by gender 
-----------------------------------------------------------------------------------
select 
  a.gender,
  avg(b.customer_loyalty_score)
from grocery_db.customer_details a
  inner join grocery_db.loyalty_scores b 
  on a.customer_id = b.customer_id
group by a.gender;
 
---------------------------------------------------------------------------------------------
-- Q3 Return customer_id, distance_from_store, and a new column called distance_category that tags customers 
-- whoare less than 1 mile from store as "Walking Distance", 
-- 1 mile or more from store as "Driving Distance" and "Unknown" for customers 
-- where we do not know their distance from the store 
------------------------------------------------------------------------------------------------

select 
  customer_id,
  distance_from_store,
  case 
    when distance_from_store is null then 'Unknown'
    when distance_from_store < 1 then 'Walking Distance'
    when distance_from_store >= 1 then 'Driving Distance'
    else 'Other'
  end AS distance_category
 from 
  grocery_db.customer_details;

-----------------------------------------------------------------------------------
-- Q4 For the 400 customers with a customer_loyalty_score, divide them up into 10 deciles, 
-- and calculate the average distance_from_store for each decile
-----------------------------------------------------------------------------------
with cust_loyalty_info as( 
select 
  a.customer_id,
  a.distance_from_store,
  b.customer_loyalty_score,
  a.gender,
  ntile(10) over (order by customer_loyalty_score desc) as loyalty_decile
from grocery_db.customer_details a
  inner join grocery_db.loyalty_scores b 
  on a.customer_id = b.customer_id)

select 
  loyalty_decile,
  avg(distance_from_store) as avg_distance
from cust_loyalty_info
group by
  loyalty_decile;


------------------------------------------------------------------------------------
-- Q5 Return data showing, for each product_area_name - the total sales, and the percentage of overall sales that each product area makes up
---------------------------------------------------------------------------------------
with product_sales as(
select 
  a.product_area_name,
  sum(b.sales_cost) as total_sales_by_area
from 
  grocery_db.product_areas a
  inner join grocery_db.transactions b
  on a.product_area_id = b.product_area_id
group by a.product_area_name)

select
  product_area_name,
  total_sales_by_area,
  total_sales_by_area / (select sum(total_sales_by_area) from product_sales) as percent_sales 
from product_sales; 
