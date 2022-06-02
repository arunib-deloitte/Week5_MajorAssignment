{{ config(materialized='table') }}

select codes,min(nav) as min_nav,max(nav) as max_nav
from "ANALYTICS"."DBT"."NAV_HISTORY"
group by codes