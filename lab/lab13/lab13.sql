.read data.sql

-- QUESTIONS --



-------------------------------------------------------------------------
------------------------ Give Interest- ---------------------------------
-------------------------------------------------------------------------

UPDATE accounts SET amount = amount + amount * 0.02;

create table give_interest_result as select * from accounts; -- just for tests

-------------------------------------------------------------------------
------------------------ Split Accounts ---------------------------------
-------------------------------------------------------------------------

CREATE TABLE temp AS SELECT name, amount FROM accounts;

UPDATE accounts SET name = name || "'s Savings account", amount = amount / 2;

UPDATE temp SET name = name || "'s Checking account", amount = amount / 2;

INSERT INTO accounts SELECT name, amount FROM temp ORDER BY name;

create table split_account_results as select * from accounts; -- just for tests

-------------------------------------------------------------------------
-------------------------------- Whoops ---------------------------------
-------------------------------------------------------------------------

DROP TABLE accounts;


CREATE TABLE average_prices AS
  SELECT category, SUM(MSRP) / COUNT(*) AS
  average_price FROM products GROUP BY category;

CREATE TABLE lowest_prices AS
  SELECT store, item, price FROM inventory GROUP BY item HAVING MIN(price);

CREATE TABLE shopping_list AS
  SELECT a.name, b.store FROM products AS a, lowest_prices AS b WHERE a.name = b.item
  GROUP BY a.category HAVING MIN(a.MSRP / a.rating);

CREATE TABLE total_bandwidth AS
  SELECT SUM(a.Mbs) FROM stores AS a, shopping_list AS b WHERE a.store = b.store;
