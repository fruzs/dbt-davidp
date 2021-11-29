SELECT 
        order_id
      , promo_code
      , discount_percent
      , user_id
      , created_at
      , order_cost
      , shipping_cost
      , order_total
      , tracking_id
      , shipping_service
      , estimated_delivery_at
      , delivered_at
      , status
      , address
      , zipcode
      , state
      , country
FROM {{ ref('stg_postgres__orders') }}
