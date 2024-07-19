DROP TABLE IF EXISTS stg.orders;

CREATE TABLE stg.orders AS
SELECT
    row_id,
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
    CASE 
        WHEN city = 'Burlington' AND postal_code IS NULL THEN '05401' 
        ELSE postal_code 
    END AS postal_code, -- clean piece of data
    region,
    product_id,
    category AS product_category,
    subcategory AS product_subcategory,
    product_name,
    sales,
    quantity,
    discount,
    profit
FROM {{ source('superstore', 'orders') }};

DROP TABLE IF EXISTS stg.people;
CREATE TABLE stg.people (
    regional_manager Varchar(20) NOT NULL,
    region Varchar(10) NOT NULL
);

DROP TABLE IF EXISTS stg.returns;
CREATE TABLE stg.returns (
    returned Varchar(5) NOT NULL,
    order_id Varchar(20) NOT NULL
