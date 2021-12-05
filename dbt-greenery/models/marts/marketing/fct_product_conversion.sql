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
