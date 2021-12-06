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

| row_num | product             | num_sessions | num_checkouts | conversion_rate |
|---------|---------------------|--------------|---------------|-----------------|
|    1    |      Peace Lily     |      27      |       18      |      66.67      |
|    2    |       Monstera      |      27      |       18      |      66.67      |
|    3    |        Orchid       |      36      |       23      |      63.89      |
|    4    |   Bird of Paradise  |      33      |       21      |      63.64      |
|    5    |   String of pearls  |      41      |       25      |      60.98      |
|    6    |     Majesty Palm    |      37      |       22      |      59.46      |
|    7    |       ZZ Plant      |      39      |       23      |      58.97      |
|    8    |   Birds Nest Fern   |      34      |       20      |      58.82      |
|    9    |     Spider Plant    |      31      |       18      |      58.06      |
|    10   |     Dragon Tree     |      35      |       20      |      57.14      |
|    11   |        Bamboo       |      37      |       21      |      56.76      |
|    12   |     Boston Fern     |      29      |       16      |      55.17      |
|    13   |   Fiddle Leaf Fig   |      29      |       16      |      55.17      |
|    14   |  Calathea Makoyana  |      31      |       17      |      54.84      |
|    15   |    Pink Anthurium   |      35      |       19      |      54.29      |
|    16   |        Pothos       |      24      |       13      |      54.17      |
|    17   |      Money Tree     |      28      |       15      |      53.57      |
|    18   |        Cactus       |      32      |       17      |      53.13      |
|    19   |      Arrow Head     |      40      |       21      |       52.5      |
|    20   |     Snake Plant     |      33      |       17      |      51.52      |
|    21   |     Philodendron    |      34      |       17      |        50       |
|    22   | Angel Wings Begonia |      30      |       15      |        50       |
|    23   | Pilea Peperomioides |      33      |       16      |      48.48      |
|    24   |      Aloe Vera      |      35      |       15      |      42.86      |
|    25   |    Alocasia Polly   |      26      |       11      |      42.31      |
|    26   |      Jade Plant     |      24      |       10      |      41.67      |
|    27   |        Ficus        |      36      |       14      |      38.89      |
|    28   |     Rubber Plant    |      35      |       13      |      37.14      |
|    29   |    Ponytail Palm    |      30      |       11      |      36.67      |
|    30   |     Devil's Ivy     |      30      |       10      |      33.33      |  

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

