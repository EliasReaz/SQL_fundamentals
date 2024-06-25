select * from grocery_db.customer_details limit 3;
select * from grocery_db.loyalty_scores limit 3;

select 
  a.customer_id,
  a.credit_score,
  b.customer_loyalty_score
 from grocery_db.customer_details a
  inner join grocery_db.loyalty_scores b ON a.customer_id = b.customer_id;
 
