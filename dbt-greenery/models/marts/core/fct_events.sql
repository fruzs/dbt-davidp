SELECT 
        event_id
      , session_id
      , user_id
      , event_type
      , page_url
      , product_id
      , created_at
FROM {{ ref('stg_postgres__events') }}