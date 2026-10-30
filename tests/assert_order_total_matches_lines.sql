with line_totals as (
    select
        order_id,
        sum(extended_price * (1 - discount_percentage) * (1 + tax_rate)) as computed_total
    from {{ ref('stg_tpch__lineitems') }}
    group by order_id
),
orders as (
    select
        order_id,
        total_price
    from {{ ref('stg_tpch__orders') }}
)

select
    o.order_id,
    o.total_price,
    l.computed_total,
    abs(o.total_price - l.computed_total) as difference
from orders o
join line_totals l on o.order_id = l.order_id
where abs(o.total_price - l.computed_total) > 0.05