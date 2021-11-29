SELECT 
      
        oi.order_id
      , oi.product_name
      , oi.product_qty
      , o.promo_code
      , o.discount_percent
      , u.first_name
      , u.last_name
      , u.email
      , u.phone_number
      , o.created_at
      , o.order_cost
      , o.shipping_cost
      , o.order_total
      , o.tracking_id
      , o.shipping_service
      , o.estimated_delivery_at
      , o.delivered_at
      , o.status
      , o.address
      , o.zipcode
      , o.state
      , o.country
FROM {{ ref('int_order_items') }} oi
LEFT JOIN {{ ref('fct_orders') }} o ON oi.order_id = o.order_id
LEFT JOIN {{ ref('dim_users') }} u ON o.user_id = u.user_id 