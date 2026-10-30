select
    part_id,
    part_name,
    manufacturer,
    brand,
    part_type,
    size,
    container,
    retail_price
from {{ ref('stg_tpch__parts') }}