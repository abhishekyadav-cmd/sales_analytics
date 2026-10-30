
  create or replace   view ANALYTICS._STAGING.stg_tpch__lineitems
  
   as (
    with source as (
    select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.lineitem
)
select
    l_orderkey as order_id,
    l_partkey as part_id,
    l_suppkey as supplier_id,
    l_linenumber as line_number,
    l_quantity as quantity,
    l_extendedprice as extended_price,
    l_discount as discount_percentage,
    l_tax as tax_rate,
    l_returnflag as return_flag,
    l_linestatus as line_status,
    l_shipdate as ship_date,
    l_commitdate as commit_date,
    l_receiptdate as receipt_date,
    l_shipinstruct as ship_instructions,
    l_shipmode as ship_mode,
    l_comment as comment
from source
  );

