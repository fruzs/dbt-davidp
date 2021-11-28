### Week 2 

Q: What is our user repeat rate (users who purchased 2 or more times / users who purchased)  
A: 0.80 repeat rate

``` sql
WITH df AS (
	SELECT
		user_id,
		COUNT(*) AS num_orders
	FROM stg_postgres__orders
	GROUP BY 1
)
SELECT
	COUNT(DISTINCT user_id) AS total_num_users,
	COUNT(CASE WHEN num_orders >1 THEN 1 END) AS repeat_num_users,
	ROUND((COUNT(CASE WHEN num_orders >1 THEN 1 END) / COUNT(DISTINCT user_id):: numeric),2) AS repeat_rate
FROM df;
```
---

Q: What are good indicators of a) users who will likely purchase again and b) users who are likely NOT to purchase again?   
   If more data was available, what features would you want to look into to answer this question?  
A: 
* Likely: large num_sessions, large num_items in first_buy, account created, short duration between page view and first_buy, delivery date before est. delivery date
* Not likely: all opposites for likely
* Additional features: referrals, ratings & reviews, social media sharing, attribution channel, gender, age  

---

Q: Explain the marts models added. Why did you organize the models in the way you did?  
A: Wanted to organize the models based on business function, while remaining flexible to expand on new models leveraging dry code.

---

Q: Include an image of your model DAGs  
A:

---
Q: What assumptions are you making about each model? (i.e. why are you adding each test?)  
A: Tests used cover uniqueness, not null, referential integrity, and accepted values.  

---
Q: Did you find any “bad” data as you added and ran tests on your models?   
   How did you go about either cleaning the data in the dbt model or adjusting your assumptions/tests?  
A: Yes, data is never clean. Sometimes incorrect data can be inferred and adjusted, but other times it requires collaboration with engineers to understand the 'correct' logic.

---
Q: Explain how you would ensure these tests are passing regularly and how you would alert stakeholders about bad data getting through?  
A: Tests need to be scheduled to run regularly and trigger a sucesss/fail notification with test details in case of failure.


