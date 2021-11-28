{#{config(materialized='table')}#}

SELECT 
        promo_id
      , discout as discount_percent
      , status
FROM {{ source('raw', 'promos') }}