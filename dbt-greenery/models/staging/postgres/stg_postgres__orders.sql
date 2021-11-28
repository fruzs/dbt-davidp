{#{config(materialized='table')}#}

SELECT 
        o.order_id
      , o.promo_id AS promo_code
      , p.discount_percent
      , o.user_id
      , o.created_at
      , o.order_cost
      , o.shipping_cost
      , o.order_total
      , o.tracking_id
      , o.shipping_service
      , o.estimated_delivery_at
      , o.delivered_at
      , o.status
      , a.address
      , a.zipcode
      , a.state
      , a.country
FROM {{ source('raw', 'orders') }} o
LEFT JOIN {{ ref('base_postgres__addresses') }} a ON o.address_id = a.address_id
LEFT JOIN {{ ref('base_postgres__promos') }} p ON o.promo_id = p.promo_id