### Week 1 

Q: How many users do we have?
``` sql
SELECT 
  COUNT(DISTINCT user_id) 
FROM dbt_davidp.stg_users;
```
A: 130 users

3. On average, how many orders do we receive per hour?
4. On average, how long does an order take from being placed to being delivered?
5. How many users have only made one purchase? Two purchases? Three+ purchases?
6. On average, how many unique sessions do we have per hour?


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
