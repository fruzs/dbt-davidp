{#{config(materialized='table')}#}

SELECT 
        product_id
      , name
      , price
      , quantity
FROM {{ source('raw', 'products') }}