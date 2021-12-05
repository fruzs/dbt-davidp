### Week 2 

Q: What is our overall conversion rate?
A: 36.1% 

``` sql
SELECT 
    COUNT(DISTINCT session_id) AS total_num_sessions
   ,(SELECT 
         COUNT(DISTINCT session_id) 
     FROM fct_events
     WHERE event_type = 'checkout') AS checkout_num_sessions
   ,ROUND((SELECT 
               COUNT(DISTINCT session_id) 
           FROM fct_events
           WHERE event_type = 'checkout') / COUNT(DISTINCT session_id)::numeric * 100 ,2) AS conversion_rate
     FROM fct_events;
```
---

Q: What is our conversion rate by product? Why might certain products be converting at higher/lower rates than others?
A: 
``` sql
SELECT 
       p.name
      ,COUNT(distinct sp.session_id) AS num_sessions
      ,SUM(has_checkout) AS num_checkouts
      ,ROUND(SUM(has_checkout) / COUNT(distinct sc.session_id)::numeric * 100 ,2) AS conversion_rate
FROM {{ ref('int_sessions_checkout') }} sc
LEFT JOIN {{ ref('int_sessions_product') }} sp ON sc.session_id = sp.session_id
LEFT JOIN {{ ref('stg_postgres__products') }} p ON sp.product_id = p.product_id
WHERE p.name IS NOT NULL
GROUP BY 1
```
---

Q: Include an image of the model DAG to show how it has been simplified/improved by adding macros and packages.
A:

