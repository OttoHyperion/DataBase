-- Запрос 1: Компания - страна.
select
t1.name company_name,
t2.name country_name
from stockmarket.company t1
inner join stockmarket.country t2 on t1.country_id = t2.id
order by company_name