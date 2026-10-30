
  create or replace   view ANALYTICS._STAGING.stg_tpch__regions
  
   as (
    with source as (
    select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.region
)
select
    r_regionkey as region_id,
    r_name as region_name,
    r_comment as comment
from source
  );

