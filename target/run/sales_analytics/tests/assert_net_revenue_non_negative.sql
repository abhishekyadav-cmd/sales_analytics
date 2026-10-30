select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      select
    order_id,
    line_number,
    net_revenue
from ANALYTICS._INTERMEDIATE.int_order_lines_enriched
where net_revenue < 0
      
    ) dbt_internal_test