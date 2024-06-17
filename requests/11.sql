-- Запрос 11: Акционеры, у которых количество купленных валют превышает количество купленных акций
select
t1.surname person_surname,
t1.first_name person_first_name,
t1.last_name person_last_name,
sum(s1.count) stock_count,
sum(c1.count) currency_count
from stockmarket.person t1
inner join stockmarket.personStock s1 on s1.person_id = t1.id
inner join stockmarket.personCurrency c1 on c1.person_id = t1.id
group by t1.surname, t1.first_name, t1.last_name
having sum(s1.count) < sum(c1.count)
order by person_surname