-- Запрос 13: Считает общую сумму пополнений и выводов, которые совершил акционер.
select
n1.surname person_surname,
t1.type operation_type,
t1.date,
t1.time,
t1.sum operation_sum,
sum(t1.sum) over (partition by a1.person_id order by t1.date, t1.time) total_amount
from stockmarket.personBrockerAccount a1
inner join stockmarket.operation t1 on t1.personBrockerAccount_id = a1.id
inner join stockmarket.person n1 on a1.person_id = n1.id
order by a1.person_id, t1.date, t1.time