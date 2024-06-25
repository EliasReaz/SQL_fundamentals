-----------------------------------------------------------------
-- Q1 How many unique transactions in transactions table
-----------------------------------------------------------------
select
  count(distinct transaction_id) as count_trans
 from 
  grocery_db.transactions;

-----------------------------------------------------------------
-- Q2 How many customers were in each mailer_type category for 
--- delivery club campaign
-----------------------------------------------------------------

select 
  mailer_type,
  count(distinct customer_id)
from grocery_db.campaign_data
where campaign_name = 'delivery_club'
group by mailer_type;


-----------------------------------------------------------------
-- Q3 Return list of customers who spent more than $500 and had 5 or more unique transactions in the month of Aug 2020
----------------------------------------------------------------

select 
  customer_id,
  sum(sales_cost) as total_cost,
  count(distinct transaction_id) as count_transaction 
 from
  grocery_db.transactions
where transaction_date between '2020-08-01' and '2020-08-31'
group by customer_id
having (sum(sales_cost)>500) AND (count(distinct transaction_id)>=5) ;



-----------------------------------------------------------------
-- Q4 Return a list of duplicate credit scores that exist in customer_details tahle
-----------------------------------------------------------------
select 
  credit_score,
  count(credit_score) as count_score
 from grocery_db.customer_details
 group by credit_score
 having count(credit_score) > 1; 
 
----------------------------------------------------------------
-- Q5 Return customer_id(s) for the customer(s) who has/have 2nd highest cresit score. Make sure 
-- your code would work for the n-th highest score as well
-----------------------------------------------------------------
with credit_rank as(
select 
  customer_id,
  credit_score,
  dense_rank() over (order by credit_score desc) as credit_score_rank
 from
   grocery_db.customer_details
 where credit_score is not null)


select * from credit_rank where credit_score_rank = 2;
