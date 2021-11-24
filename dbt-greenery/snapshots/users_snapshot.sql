{% snapshot stg_users_snapshot %}

  {{
    config(
      target_schema='snapshots',
      unique_key='user_id',
      strategy='timestamp',
      updated_at='updated_at',
      invalidate_hard_deletes=True
    )
  }}

  SELECT * 
  FROM {{ ref('stg_users') }}

{% endsnapshot %}