-- Запрос 15: Брокеры, у которых не менее двух акционеров
select
b1.name brocker_name,
count(p1.id) person_count
from stockmarket.personBrockerAccount a1
inner join stockmarket.brocker b1 on a1.brocker_id = b1.id
inner join stockmarket.person p1 on a1.person_id = p1.id
group by b1.name
having count(p1.id) >= 2
order by person_count 