select
    order_id,
    line_number,
    net_revenue
from ANALYTICS._INTERMEDIATE.int_order_lines_enriched
where net_revenue < 0