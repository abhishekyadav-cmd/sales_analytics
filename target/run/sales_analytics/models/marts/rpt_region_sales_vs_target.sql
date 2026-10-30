
  
    

        create or replace transient table ANALYTICS._MARTS.rpt_region_sales_vs_target
         as
        (with actual_sales as (
    select
        region_name,
        extract(year from order_date) as sales_year,
        sum(net_revenue) as actual_revenue
    from ANALYTICS._MARTS.fct_order_lines
    group by 1, 2
),
targets as (
    select
        region_name,
        target_year,
        sales_target
    from ANALYTICS._STAGING.stg_raw__region_targets
)

select
    coalesce(a.region_name, t.region_name) as region_name,
    coalesce(a.sales_year, t.target_year) as year,
    coalesce(a.actual_revenue, 0) as actual_revenue,
    coalesce(t.sales_target, 0) as target_revenue,
    coalesce(a.actual_revenue, 0) - coalesce(t.sales_target, 0) as variance_amount,
    case 
        when coalesce(t.sales_target, 0) = 0 then null
        else round(((coalesce(a.actual_revenue, 0) - t.sales_target) / t.sales_target) * 100, 2)
    end as variance_pct
from actual_sales a
full outer join targets t 
    on a.region_name = t.region_name 
   and a.sales_year = t.target_year
        );
      
  