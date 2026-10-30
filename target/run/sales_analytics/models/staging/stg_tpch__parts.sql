
  create or replace   view ANALYTICS._STAGING.stg_tpch__parts
  
   as (
    with source as (
    select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.part
)
select
    p_partkey as part_id,
    p_name as part_name,
    p_mfgr as manufacturer,
    p_brand as brand,
    p_type as part_type,
    p_size as size,
    p_container as container,
    p_retailprice as retail_price,
    p_comment as comment
from source
  );

