{{ config(materialized='table') }}

select nav_date,year(nav_date) as year,monthname(nav_date) as month, sum(nav) as nav
from nav_history
group by nav_date
order by nav_date