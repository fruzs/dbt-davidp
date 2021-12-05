### Week 2 

Q: What is our overall conversion rate?
A: 36.1% 

``` sql
SELECT 
  COUNT(DISTINCT session_id) AS total_num_sessions
  , (SELECT 
        COUNT(DISTINCT session_id) 
     FROM fct_events
     WHERE event_type = 'checkout') AS checkout_num_sessions
     ,ROUND((SELECT 
        COUNT(DISTINCT session_id) 
     FROM fct_events
     WHERE event_type = 'checkout')  / COUNT(DISTINCT session_id)::numeric * 100,2) AS conversion_rate
     FROM fct_events;
```
---

Q: What is our conversion rate by product? Why might certain products be converting at higher/lower rates than others?
A: 

---

Q: Include an image of the model DAG to show how it has been simplified/improved by adding macros and packages.
A:

