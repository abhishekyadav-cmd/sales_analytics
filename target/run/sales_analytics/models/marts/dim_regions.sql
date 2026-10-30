
  
    

        create or replace transient table ANALYTICS._MARTS.dim_regions
         as
        (select
    region_id,
    region_name
from ANALYTICS._STAGING.stg_tpch__regions
        );
      
  