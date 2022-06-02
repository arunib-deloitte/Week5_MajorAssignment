{{ config(materialized='table') }}

select nav_date,year,month,nav,
sum(nav) OVER(PARTITION BY year ORDER BY nav_date) as YTD,
sum(nav) OVER(PARTITION BY year,month ORDER BY nav_date) as MTD
from "ANALYTICS"."DBT"."SUBTABLE"