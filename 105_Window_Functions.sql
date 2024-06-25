---------------------------------------------------------------
-- WINDOW Functions
----------------------------------------------------------------

-- WINDOW FUNCTIONS

select 
  *, 
  sum(sales_cost) over (partition by transaction_id) AS transaction_total_sales
  sales_cost / sum(sales_cost) over (partition by transaction_id) AS transaction_sales_percent
from 

  grocery_db.transactions
  
limit 10;  


-- ROW NUMBER & RANK

SELECT 
  *,
  row_number() over (partition by customer_id order by transaction_date, transaction_id) AS transaction_number
  
from grocery_db.transactions limit 20;


-- REFERENCE
-- row_number() will give us a unique value to each row of data in the set even if there are ties in the order by logic
/********************************** 
100m time output
10s         1
10s         2
10s         3
11s         4
12s         5


RANK will give ties the same value, then skip to the next value in terms of the number of rows it has seen
100m time output
10s         1
10s         1
10s         1
11s         4
12s         5

DENSE RANK will give ties the same value, but will give to the next number in sequence after any ties
100m time output
10s         1
10s         1
10s         1
11s         2
12s         3
*********************/
SELECT 
  *,
  dense_rank() over (partition by customer_id order by transaction_date, transaction_id) AS transaction_rank
  
from grocery_db.transactions limit 20;

-- NTILE() for deciles/percentiles etc

/* CASE WHEN ..THEN ...END is hard coded, we specify the threshold
NTILE() uses deciles or percentiles to categorize 
*/

select 
  *,
  CASE
    when customer_loyalty_score > 0.66 then 'high loyal'
    when customer_loyalty_score > 0.33 then 'medium loyal'
    else 'low loyal' 
   END AS loyalty_category
from grocery_db.loyalty_scores limit 20;

----------------------------------------------------------------------------
-- USE of ntile() over - we now categorize the loyalty based on data, NOT based on our judgement  
------------------------------------------------------------------------------
select 
  *,
  ntile(3) over (order by customer_loyalty_score desc) AS loyalty_category,
  ntile(10) over (order by customer_loyalty_score desc) AS loyalty_category2
from grocery_db.loyalty_scores limit 40;

/************* TEST yourself
-------------------------------------------
The criteria for the ranking are:

Ranking will be in ascending order (i.e. rank 1 would be for the customer who is closest to the store)
Rankings will be split (hint: partitioned) by gender
In the case of tied rankings, we want the subsequent ranking to represent the number of rows seen rather than purely the next number (i.e. 1,1,1,4 rather than 1,1,1,2)


Your query will return four columns: customer_id, gender. distance_from_store, distance_from_store_rank (you will create this)

****************/

select 
   customer_id, gender, distance_from_store,
   rank() over (partition by gender order by distance_from_store) as diatance_from_store_rank
from grocery_db.customer_details
where gender is not null and distance_from_store is not null;

