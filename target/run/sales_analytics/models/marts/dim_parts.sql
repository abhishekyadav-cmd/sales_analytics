
  
    

        create or replace transient table ANALYTICS._MARTS.dim_parts
         as
        (select
    part_id,
    part_name,
    manufacturer,
    brand,
    part_type,
    size,
    container,
    retail_price
from ANALYTICS._STAGING.stg_tpch__parts
        );
      
  