# SQL_fundamentals

Following 5 tables are used:

## customer_details Table

| customer_id |  distance_from_store | gender | credit_score |
| ------       | -------             |---    | ---         |  
|754          | 1.17                 | M      | 0.75       |
|865          | 0.17                 | F      | 0.35       |
|954          |                      | M      |           |
|1001          | 4.17                | M      |         |
|754          | 2.17                 |        | 0.45       |

## transactions Table

| customer_id |  trasaction_date | transaction_id | product_area_id | num_items | sales_cost |
| ----        | ----             |-------------    | -------       | -------   | -------  |
|647          | 2020-04-01       | 4355233          |   4         | 3           |9.33      |
|647          | 2020-04-01       | 4355233          |   3         | 4           |23.82      |
|439          | 2020-07-15       | 4355500          |   4         | 1           |6.83      |
|439          | 2020-07-15       | 4355500          |   4         | 5           |9.44      |

## campaign_data Table

| customer_id |  campaign_name | campaign_date | mailer_type | signup_flag |
| ----        | ----             |-------------    | -------  | -------   | 
|74          |    delivery_club    | 2020-07-01    |   Mailer2 | 1        |
|655         |    delivery_club    | 2020-07-01    |   Mailer2 | 0        |
|607          |    delivery_club    | 2020-07-01    |  control | 0        |
|405          |    delivery_club    | 2020-07-01    |   Mailer1 | 1        |

## product_areas Table:
| product_area_id |  product_area_name | profit_margin |
|------------------| ------------------|----------------|
| 1                | Non-Food          | 0.25           |
| 2                | Vegetables         | 0.18           |
| 3                | Fruit              | 0.14           |
| 4                | Dairy              | 0.19           |
| 1                | Meat               | 0.11           |


## loyalty_scores Table
|customer_id | customer_loyalty_score |
| -----      | ----------             |
| 104        | 0.587                  |
| 69        | 0.156                  |
| 796        | 0.428                  |

