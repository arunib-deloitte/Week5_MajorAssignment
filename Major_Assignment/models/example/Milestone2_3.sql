{{ config(materialized='table') }}

select m.codes,m.name,c.stop_date
from "ANALYTICS"."DBT"."MUTUALFUND" m
inner join
(select codes,max(nav_date) as stop_date
from "ANALYTICS"."DBT"."NAV_HISTORY" 
group by codes
HAVING max(nav_date)<'2019-02-28') c
on m.codes=c.codes