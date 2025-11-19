{{ config(materialized='table') }}

select
    date_trunc('day', order_timestamp) as order_date,
    sum(revenue)  as total_revenue,
    sum(quantity) as total_quantity,
    count(distinct order_id) as order_count
from {{ ref('fct_orders') }}        -- from SILVER_SCHEMA
group by date_trunc('day', order_timestamp)

