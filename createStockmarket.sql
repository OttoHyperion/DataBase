
BEGIN;

CREATE TABLE IF NOT EXISTS stockmarket.person
(
    id bigint NOT NULL,
    surname character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS stockmarket.country
(
    id bigint NOT NULL,
    name character varying NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS stockmarket.company
(
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    country_id bigint NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS stockmarket.currency
(
    id bigint NOT NULL,
    name character varying NOT NULL,
    cost double precision,
    country_id bigint NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS stockmarket.stock
(
    id bigint NOT NULL,
    cost double precision NOT NULL,
    company_id bigint NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS stockmarket.personStock
(
    id bigint NOT NULL,
    person_id bigint NOT NULL,
    stock_id bigint NOT NULL,
    count bigint NOT NULL,
    total_price double precision NOT NULL,
    PRIMARY KEY (id)
);
CREATE TABLE IF NOT EXISTS stockmarket.operation
(
    id bigint NOT NULL,
    type character varying(255) NOT NULL,
    personBrockerAccount_id bigint NOT NULL,
    sum double precision NOT NULL,
    date date NOT NULL,
    "time" time(6) without time zone NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS stockmarket.stockOperation
(
    id bigint NOT NULL,
    person_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    stock_id bigint NOT NULL,
    count bigint NOT NULL,
    cost_sum double precision NOT NULL,
    date date NOT NULL,
    "time" time(6) without time zone NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS stockmarket.currencyOperation
(
    id bigint NOT NULL,
    person_id bigint NOT NULL,
    type character varying(255) NOT NULL,
    currency_id bigint NOT NULL,
    count bigint NOT NULL,
    cost_sum double precision NOT NULL,
    date date NOT NULL,
    "time" time(6) without time zone NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS stockmarket.brocker
(
    id bigint NOT NULL,
    brockerAccount_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS stockmarket.personCurrency
(
    id bigint NOT NULL,
    person_id bigint NOT NULL,
    currency_id bigint NOT NULL,
    count bigint NOT NULL,
    total_cost double precision NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS stockmarket.brockerAccount
(
    id bigint NOT NULL,
    currency_id bigint NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS stockmarket.personBrockerAccount
(
    id bigint NOT NULL,
    person_id bigint NOT NULL,
    brocker_id bigint,
    balance double precision NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS stockmarket.company
    ADD FOREIGN KEY (country_id)
    REFERENCES stockmarket.country (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS stockmarket.currency
    ADD FOREIGN KEY (country_id)
    REFERENCES stockmarket.country (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS stockmarket.personCurrency
    ADD FOREIGN KEY (person_id)
    REFERENCES stockmarket.person (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS stockmarket.personCurrency
    ADD FOREIGN KEY (currency_id)
    REFERENCES stockmarket.currency (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS stockmarket.stock
    ADD FOREIGN KEY (company_id)
    REFERENCES stockmarket.company (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS stockmarket.personStock
    ADD FOREIGN KEY (person_id)
    REFERENCES stockmarket.person (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS stockmarket.personStock
    ADD FOREIGN KEY (stock_id)
    REFERENCES stockmarket.stock (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS stockmarket.brocker
    ADD FOREIGN KEY (brockerAccount_id)
    REFERENCES stockmarket.brockerAccount (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS stockmarket.brockerAccount
    ADD FOREIGN KEY (currency_id)
    REFERENCES stockmarket.currency (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS stockmarket.personBrockerAccount
    ADD FOREIGN KEY (person_id)
    REFERENCES stockmarket.person (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS stockmarket.personBrockerAccount
    ADD FOREIGN KEY (brocker_id)
    REFERENCES stockmarket.brocker (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS stockmarket.operation
    ADD FOREIGN KEY (personBrockerAccount_id)
    REFERENCES stockmarket.personBrockerAccount (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS stockmarket.stockOperation
    ADD FOREIGN KEY (stock_id)
    REFERENCES stockmarket.stock (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS stockmarket.stockOperation
    ADD FOREIGN KEY (person_id)
    REFERENCES stockmarket.person (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS stockmarket.currencyOperation
    ADD FOREIGN KEY (currency_id)
    REFERENCES stockmarket.currency (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE IF EXISTS stockmarket.currencyOperation
    ADD FOREIGN KEY (person_id)
    REFERENCES stockmarket.person (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
