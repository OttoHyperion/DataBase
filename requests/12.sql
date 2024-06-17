-- Запрос 12: Акционеры и их пополнения баланса брокерского счета, сумма пополнения, дата, время
select 
n1.surname person_surname,
n1.first_name person_first_name,
n1.last_name person_last_name,
t1.type operation_type,
t1.sum deposit_sum,
t1.date,
t1.time
from stockmarket.personBrockerAccount b1
inner join stockmarket.person n1 on b1.person_id = n1.id
inner join stockmarket.operation t1 on t1.personBrockerAccount_id = b1.id
where t1.type = 'Пополнение'
order by time