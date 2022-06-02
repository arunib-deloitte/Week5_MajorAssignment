{{ config(materialized='table') }}

SELECT n.codes,
sum(n.nav) OVER(PARTITION BY year(n.nav_date) ORDER BY nav_date) as YTD,
sum(n.nav) OVER(PARTITION BY year(n.nav_date),month(n.nav_date) ORDER BY nav_date) as MTD
from nav_history as n
where n.codes in
(SELECT m.codes
FROM FUND_CATEGORY f,MUTUALFUND m
WHERE f.CATEGORY LIKE '%Liquid%' AND m.category_id=f.id)
