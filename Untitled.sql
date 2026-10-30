USE ROLE DBT_ROLE;
USE WAREHOUSE DBT_WH;

-- Ek baar manual run karke verify karo
EXECUTE DBT PROJECT ANALYTICS.raw.SALES_ANALYTICS ARGS = 'build --target prod';