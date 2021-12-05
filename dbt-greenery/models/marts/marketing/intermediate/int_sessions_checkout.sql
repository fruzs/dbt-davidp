SELECT 
      session_id
    , max(CASE WHEN  event_type = 'checkout' then 1 else 0 END) AS has_checkout

FROM {{ ref('stg_postgres__events') }} e
GROUP BY 1