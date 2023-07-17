{% snapshot payments_snapshot %}
{{
  config(
    target_database='analytics',
    target_schema='snapshots_bhipple',
    unique_key='order_id',
    strategy='timestamp',
    updated_at='order_date',
    invalidate_hard_deletes=True,
  )
}}
select * from {{ ref('stg_orders') }}
{% endsnapshot %}