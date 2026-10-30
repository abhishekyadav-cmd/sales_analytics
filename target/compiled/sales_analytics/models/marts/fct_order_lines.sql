

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
from ANALYTICS._INTERMEDIATE.int_order_lines_enriched

