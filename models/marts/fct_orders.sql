with orders as (
    select * from {{ ref('stg_tpch__orders') }}
),
order_aggregates as (
    select
        order_id,
        count(line_number) as total_items,
        sum(net_revenue) as computed_net_revenue
    from {{ ref('int_order_lines_enriched') }}
    group by order_id
)

select
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_date,
    o.order_priority,
    o.total_price,
    coalesce(a.total_items, 0) as total_line_items,
    coalesce(a.computed_net_revenue, 0) as total_net_revenue
from orders o
left join order_aggregates a on o.order_id = a.order_id