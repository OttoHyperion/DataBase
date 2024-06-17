-- Таблица с компаниями, с указанием к какой стране они принадлежат
SELECT * FROM stockmarket."company";

-- Таблица с брокерами и в какой валюте они работают
SELECT * FROM stockmarket."brocker";

--Таблица для придания индефикатора валюте для брокеров, чтобы проводить операции
SELECT * FROM stockmarket."brockeraccount";

-- Таблица со странами
SELECT * FROM stockmarket."country";

-- Таблица с курсом валют и принадлежании к стране
SELECT * FROM stockmarket."currency";

-- Таблица со всеми операциями с валютой
SELECT * FROM stockmarket."currencyoperation";

-- Таблица с операциями между акционерами и их счетами у брокеров
SELECT * FROM stockmarket."operation";

-- Таблица с акционерами
SELECT * FROM stockmarket."person";

-- Таблица с счетами акционеров у брокеров
SELECT * FROM stockmarket."personbrockeraccount";

-- Таблица показывающая владение валютой акционерами
SELECT * FROM stockmarket."personcurrency";

-- Таблица показывающая владение акциями компаний акционерами
SELECT * FROM stockmarket."personstock";

-- Курс акций компаний
SELECT * FROM stockmarket."stock";

-- Операции с акциями компаний
SELECT * FROM stockmarket."stockoperation";