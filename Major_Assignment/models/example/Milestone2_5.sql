{{ config(materialized='table') }}

select f.category,min(k.returns) as min_returns,max(k.returns) as max_returns 
from "ANALYTICS"."DBT"."FUND_CATEGORY" f
inner join
(select * from "ANALYTICS"."DBT"."MUTUALFUND" m
inner join 
(select n.codes, avg(n.nav) as returns
from "ANALYTICS"."DBT"."NAV_HISTORY" n
group by n.codes) c
on m.codes=c.codes)k
on f.id=k.category_id
group by f.category

