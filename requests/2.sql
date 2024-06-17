-- Запрос 2: Цены акций компаний
select
t1.name company_name,
t2.cost cost_stock
from stockmarket.stock t2
inner join stockmarket.company t1 on t2.company_id = t1.id
order by t2.cost asc