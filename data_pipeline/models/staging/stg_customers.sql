-- stg_customers.sql
select
    cast(customer_id as string) as customer_id,
    trim(customer_name)            as customer_name,
    trim(region)                as region,
   
from {{ source('retail_raw', 'RETAILIO_1') }}
where customer_id is not null
