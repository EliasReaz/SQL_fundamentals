-- USE OF DISTINCT, ORDER BY DESC, LIMIT 
select 
  distinct credit_score 
 from
  grocery_db.customer_details 
 Order by credit_score desc
 LIMIT 10;
 
-- ADD NEW COLUMN (HERE 2 COLUMNS ARE added)
select customer_id AS customer, 
  distance_from_store AS distance_in_mile,
  1 as col_1,
  distance_from_store*1.69 AS distance_in_km 
from
  grocery_db.customer_details
 limit 3;
