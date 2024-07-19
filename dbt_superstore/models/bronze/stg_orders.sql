{{ config(
  materialized='view',
  alias='orders'
) }}

SELECT
    row_id AS dwh_id,
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    case when city = 'Burlington' and postal_code is null then '05401' else postal_code end as postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit,
    current_timestamp AS etl_timestamp
FROM {{ source('superstore', 'orders')}}
