-- select * from grocery_db.

SELECT 
  customer_id,
  sum(case when product_area_id =1 then sales_cost else 0 end) AS food_typr_1,
  sum(case when product_area_id =2 then sales_cost else 0 end) AS food_typr_2,
  sum(case when product_area_id =3 then sales_cost else 0 end) AS food_typr_3,
  sum(case when product_area_id =4 then sales_cost else 0 end) AS food_typr_4
  
FROM grocery_db.transactions
 GROUP BY customer_id   ;
 
 --SELECT * from grocery_db.customer_details LIMIT 3;
 
SELECT 
  customer_id,
  distance_from_store,
  CASE 
    WHEN distance_from_store > 2.5 THEN 'distance:far' 
    WHEN distance_from_store > 1 THEN 'distance:medium'
    ELSE 'distnace:close' END AS distance_from_store_category
 FROM 
  grocery_db.customer_details;
