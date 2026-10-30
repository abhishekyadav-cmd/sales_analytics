with customers as (
    select * from ANALYTICS._STAGING.stg_tpch__customers
),
nations as (
    select * from ANALYTICS._STAGING.stg_tpch__nations
),
regions as (
    select * from ANALYTICS._STAGING.stg_tpch__regions
)

select
    c.customer_id,
    c.customer_name,
    c.address,
    c.phone_number,
    c.account_balance,
    c.market_segment,
    n.nation_name,
    r.region_id,
    r.region_name
from customers c
left join nations n on c.nation_id = n.nation_id
left join regions r on n.region_id = r.region_id