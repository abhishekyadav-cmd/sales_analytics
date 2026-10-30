{{
    config(
        materialized='incremental',
        unique_key=['order_id', 'line_number']
    )
}}

select
    order_id,
    line_number,
    part_id,
    supplier_id,
    customer_id,
    region_id,
    region_name,
    order_date,
    quantity,
    extended_price,
    discount_percentage,
    net_revenue
from {{ ref('int_order_lines_enriched') }}

{% if is_incremental() %}
    -- Incremental run: only process new or updated orders
    where order_date > (select max(order_date) from {{ this }})
{% endif %}