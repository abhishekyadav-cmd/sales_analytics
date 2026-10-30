{% snapshot scd_region_targets %}

{{
    config(
      target_database='ANALYTICS',
      target_schema='MARTS',
      unique_key="region_name || '-' || cast(target_year as varchar)",
      strategy='check',
      check_cols=['sales_target']
    )
}}

select
    region_name,
    target_year,
    sales_target
from {{ ref('stg_raw__region_targets') }}

{% endsnapshot %}