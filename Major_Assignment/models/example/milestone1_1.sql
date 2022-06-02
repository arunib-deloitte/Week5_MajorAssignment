{{ config(materialized='table') }}

SELECT monthname(n.nav_date) as nav_month, f.category as scheme, avg(n.nav) as Average_Nav, 
avg(n.REPURCHASE_PRICE) as Average_Repurchase_Price, avg(sale_price) as Average_Sale_Price
FROM "ANALYTICS"."DBT"."NAV_HISTORY" as n
INNER JOIN "ANALYTICS"."DBT"."MUTUALFUND" as m
INNER JOIN "ANALYTICS"."DBT"."FUND_CATEGORY" as f
ON n.codes=m.codes
GROUP BY nav_month,f.category
ORDER BY f.category
