{#{config(materialized='table')}#}

SELECT 
        u.user_id
      , u.first_name
      , u.last_name
      , u.email
      , u.phone_number
      , u.created_at
      , u.updated_at
      , a.address
      , a.zipcode
      , a.state
      , a.country
FROM {{ source('raw', 'users') }} u
LEFT JOIN {{ ref('base_postgres__addresses') }} a ON u.address_id = a.address_id