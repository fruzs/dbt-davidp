{#{config(materialized='table')}#}

SELECT 
        event_id
      , session_id
      , user_id
      , event_type
      , page_url
      , CASE 
          WHEN page_url NOT LIKE 'https://greenary.com/product/%' THEN NULL
          ELSE  REPLACE(page_url,'https://greenary.com/product/','') END AS product_id
      , created_at
FROM {{ source('raw', 'events') }}