{{ config(materialized='view') }}

select
    order_id,
    customer_id,
    quantity,
    price,
    order_timestamp,
    revenue
from {{ ref('stg_orders') }}     -- 🔹 from STAGING schema via ref()