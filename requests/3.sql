-- Запрос 3: Владельцы акций
select
t1.surname person_surname,
t1.first_name person_first_name,
t1.last_name person_last_name,
c1.name company_name
from stockmarket.personStock t2
inner join stockmarket.person t1 on t2.person_id = t1.id
inner join stockmarket.stock s1 on t2.stock_id = s1.id
inner join stockmarket.company c1 on s1.company_id = c1.id
order by 1