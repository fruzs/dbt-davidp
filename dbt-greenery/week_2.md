### Week 2 

Q: What is our user repeat rate (users who purchased 2 or more times / users who purchased)  
A: 0.80 repeat rate

``` sql
WITH total_users AS (
	SELECT
		1 AS id,
		COUNT(DISTINCT user_id) AS total_num_users
	FROM stg_postgres__orders
)
, df AS (
	SELECT
		user_id,
		COUNT(*) AS num_orders
	FROM stg_postgres__orders
	GROUP BY 1
	HAVING COUNT(*) > 1
)
, repeat_users AS (
	SELECT
		1 AS id,
		COUNT(user_id) AS repeat_num_users
	FROM df
)
SELECT
	tu.total_num_users,
	ru.repeat_num_users,
	round((ru.repeat_num_users / tu.total_num_users :: numeric),2) AS repeat_rate
FROM total_users tu
	JOIN repeat_users ru ON tu.id = ru.id;
```
---

Q: What are good indicators of a) users who will likely purchase again and b) users who are likely NOT to purchase again?   
   If more data was available, what features would you want to look into to answer this question?  
A: 

---

Q: Explain the marts models added. Why did you organize the models in the way you did?  
A:  

---

Q: Include an image of your model DAGs  
A:

---
Q: What assumptions are you making about each model? (i.e. why are you adding each test?)  
A: 

---
Q: Did you find any “bad” data as you added and ran tests on your models?   
   How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?  
A: 

---
Q: Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through?  
A: 


