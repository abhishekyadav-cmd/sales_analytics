with lineitems as (
    select * from {{ ref('stg_tpch__lineitems') }}
),
orders as (
    select * from {{ ref('stg_tpch__orders') }}
),
parts as (
    select * from {{ ref('stg_tpch__parts') }}
),
customers as (
    select * from {{ ref('int_customers_with_region') }}
)

select
    l.order_id,
    l.line_number,
    l.part_id,
    p.part_name,
    p.brand as part_brand,
    p.retail_price,
    l.supplier_id,
    o.customer_id,
    c.customer_name,
    c.region_id,
    c.region_name,
    o.order_date,
    o.order_status,
    l.quantity,
    l.extended_price,
    l.discount_percentage,
    l.tax_rate,
    -- Assignment formula: net revenue = extended price * (1 - discount)
    round(l.extended_price * (1 - l.discount_percentage), 2) as net_revenue
from lineitems l
inner join orders o on l.order_id = o.order_id
left join parts p on l.part_id = p.part_id
left join customers c on o.customer_id = c.customer_id