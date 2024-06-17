-- Запрос 7: Количество акций каждой компании, которые купили Акционеры и общая сумма акций
select 
c1.name company_name,
sum(s1.count) stock_count,
sum(s1.total_price) total_price
from stockmarket.company c1
inner join stockmarket.stock s2 on s2.company_id = c1.id
inner join stockmarket.personStock s1 on s1.stock_id = s2.id
group by c1.name
order by total_price