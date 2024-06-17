-- Запрос 14: Общее количество купленных валют и общая цена их покупки
select 
c1.name currency_name,
sum(c2.count) currency_count,
sum(c2.total_cost) total_price
from stockmarket.currency c1
inner join stockmarket.personCurrency c2 on c2.currency_id = c1.id
group by c1.name
order by total_price