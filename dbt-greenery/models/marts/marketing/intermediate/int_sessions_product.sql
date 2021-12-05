SELECT 
      session_id,
      product_id
FROM {{ ref('stg_postgres__events') }} e
where event_type = 'add_to_cart'
