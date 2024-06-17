-- Запрос 8: Акционеры, у которых на брокерском счете (берется наибольший брокерский счет) 
-- лежит более 31000 рублей и выводится максимальный баланс.
select
t1.surname person_surname,
t1.first_name person_first_name,
t1.last_name person_last_name,
max(b1.balance) max_balance
from stockmarket.personBrockerAccount b1
inner join stockmarket.person t1 on b1.person_id = t1.id
group by t1.surname, t1.first_name, t1.last_name
having max(b1.balance) > 31000
order by max_balance asc
