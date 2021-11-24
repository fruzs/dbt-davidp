{% snapshot stg_products_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='product_id',
      strategy='check',
      check_cols=['price', 'quantity'],
      invalidate_hard_deletes=True
    )
  }}

  SELECT * 
  FROM {{ ref('stg_products') }}

{% endsnapshot %}