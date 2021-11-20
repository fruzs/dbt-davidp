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
WITH df AS 
  (SELECT 
        DATE_TRUNC('hour', created_at) AS date_hour
       ,COUNT(*) AS num_orders 
   FROM stg_orders 
   WHERE created_at IS NOT NULL 
   GROUP BY 1)
SELECT AVG(num_orders) from df;
```
A: 8.125 --> 8 orders per hour on average

---
Q: On average, how long does an order take from being placed to being delivered?
---
Q: How many users have only made one purchase? Two purchases? Three+ purchases?
---
Q: On average, how many unique sessions do we have per hour?


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
