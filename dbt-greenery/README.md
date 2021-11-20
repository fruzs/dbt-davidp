### Week 1 

Q: How many users do we have?
``` sql
SELECT 
  COUNT(DISTINCT user_id) 
FROM dbt_davidp.stg_users;
```
A: 130 users

---

Q: On average, how many orders do we receive per hour?
``` sql
WITH df AS (
    SELECT 
        DATE_TRUNC('hour', created_at) AS date_hour
       ,COUNT(*) AS num_orders 
    FROM stg_orders 
    WHERE created_at IS NOT NULL 
    GROUP BY 1)
SELECT ROUND(AVG(num_orders), 2)
FROM df;
```
A: 8.12 --> 8 orders per hour on average

---
Q: On average, how long does an order take from being placed to being delivered?
``` sql
WITH df AS (
    SELECT 
        order_id
       ,created_at
       ,delivered_at
       ,delivered_at - created_at AS order_duration 
    FROM stg_orders 
    WHERE 
        created_at IS NOT NULL 
        AND delivered_at IS NOT NULL) 
SELECT 
    AVG(order_duration) 
FROM df
```
A:  3 days, 22 hours, 13 minutes, 10 seconds, 504.451 milliseconds

---
Q: How many users have only made one purchase? Two purchases? Three+ purchases?
``` sql
WITH df AS (
    SELECT 
        user_id
       ,COUNT(*) AS num_orders
       ,CASE 
          WHEN COUNT(*) = 1 THEN '1_order' 
          WHEN COUNT(*) = 2 THEN '2_orders' 
          ELSE '3+orders' 
        END AS user_group  
    FROM stg_orders 
    GROUP BY 1) 
SELECT 
    user_group
   ,COUNT(*) 
FROM df 
GROUP BY 1
```
A:
| orders_group | num_users |
|--------------|-----------|
| 1 order      | 25 users  |
| 2 orders     | 22 users  |
| 3+ orders    | 81 users  |

---
Q: On average, how many unique sessions do we have per hour?
``` sql
WITH df AS (
    SELECT 
        DATE_TRUNC('hour', created_at)
       ,COUNT(DISTINCT session_id) AS num_uq_sessions 
    FROM stg_events 
    WHERE created_at IS NOT NULL 
    GROUP BY 1)
SELECT 
    ROUND(AVG(num_uq_sessions), 2) 
FROM df
```
A: 7.27 --> 7 unique sessions per hour on average
