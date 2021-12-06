SELECT 
       p.name
      ,COUNT(distinct sp.session_id) AS num_sessions
      ,SUM(has_checkout) AS num_checkouts
      ,{{ conversion_rate_in_percentage('has_checkout','sc.session_id') }} as conversion_rate
FROM {{ ref('int_sessions_checkout') }} sc
LEFT JOIN {{ ref('int_sessions_product') }} sp ON sc.session_id = sp.session_id
LEFT JOIN {{ ref('stg_postgres__products') }} p ON sp.product_id = p.product_id
WHERE p.name IS NOT NULL
GROUP BY 1
