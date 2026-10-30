
  create or replace   view ANALYTICS._STAGING.stg_raw__region_targets
  
   as (
    with source as (
    select * from ANALYTICS.RAW.region_targets
)
select
    upper(trim(region_name)) as region_name,
    cast(target_year as int) as target_year,
    cast(sales_target as decimal(18, 2)) as sales_target,
    loaded_at
from source
  );

