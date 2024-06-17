-- Запрос 10: Акционеры и их продажи акций, количество акций, сумма продажи, дата, время
select
n1.surname person_surname,
n1.first_name person_first_name,
n1.last_name person_last_name,
c1.name company_name,
o1.type operation_type,
o1.count stock_count,
o1.cost_sum selling_price,
o1.date,
o1.time
from stockmarket.stockOperation o1
inner join stockmarket.person n1 on o1.person_id = n1.id
inner join stockmarket.stock s1 on o1.stock_id = s1.id
inner join stockmarket.company c1 on s1.company_id = c1.id
where o1.type = 'Продажа'
order by person_surname