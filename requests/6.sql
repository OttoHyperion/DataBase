-- Запрос 6: Пользователи и брокеры, валюты, в которых открыты счета
select
t1.surname person_surname,
t1.first_name person_first_name,
t1.last_name person_last_name,
b1.name brocker_name, 
c1.name currency_name
from stockmarket.personBrockerAccount t2
inner join stockmarket.person t1 on t2.person_id = t1.id
inner join stockmarket.brocker b1 on t2.brocker_id = b1.id
inner join stockmarket.brockerAccount a1 on b1.brockerAccount_id = a1.id
inner join stockmarket.currency c1 on a1.currency_id = c1.id
order by person_surname