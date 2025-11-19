{{ config(materialized='view') }}

select
    cast(order_id as string)        as order_id,
    cast(customer_id as string)     as customer_id,
    cast(quantity as number)        as quantity,
    cast(order_date as timestamp_ntz) as order_timestamp,
    cast(price as number(10,2))     as price,
    quantity * price                as revenue
from {{ source('retail_raw', 'RETAILIO_1') }}
where order_id is not null