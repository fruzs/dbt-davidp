SELECT *
FROM {{ ref('stg_postgres__events') }}
WHERE event_type = 'page_view'