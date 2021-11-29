SELECT 
      oi.order_id
    , p.name AS product_name
    , oi.quantity AS product_qty

FROM {{ ref('stg_postgres__order_items') }} oi
LEFT JOIN {{ ref('stg_postgres__products') }} p ON oi.product_id = p.product_id