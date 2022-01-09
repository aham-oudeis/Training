--Problems from working with a single table

CREATE TABLE people (
  name text NOT NULL,
	age  integer NOT NULL,
  occupation text
)

INSERT INTO people (name, age, occupation)
  VALUES  ('Abby', 34, 'biologist'),
          ('Mu''nisah', 26, NULL),
          ('Mirabelle', 24, 'contractor');

SELECT  * 
  FROM  people
  WHERE name = 'Mu''nisah';

SELECT  * 
  FROM  people
  WHERE age = 26;

SELECT  * 
  FROM  people
  WHERE occupation IS NULL;

CREATE TABLE birds (
  name varchar(50),
  length numeric(3, 1),
  wingspan numeric(3, 1),
  family varchar(50),
  extinct boolean
)

INSERT INTO birds 
    (name, length, wingspan, family, extinct)
VALUES
    ('Spotted Towhee', 21.6, 26.7, 'Emberizidae', false),
    ('American Robin', 25.5, 36, 'Turdidae', false),
    ('Greater Koa Finch', 19, 24, 'Fringillidae', true),
    ('Carolina Parakeet', 33, 55.8, 'Psittacidae', true),
    ('Common Kestrel', 35.5, 73.5, 'Falconiidae', false);

SELECT    name, family
  FROM    birds
  WHERE   extinct = false
ORDER BY  length DESC;

SELECT  round(avg(wingspan), 1), min(wingspan), max(wingspan)
FROM    birds;

CREATE TABLE menu_items (
  item varchar(30),
  prep_time integer,
  ingredient_cost decimal(4, 2),
  sales integer,
  menu_price  numeric(4, 2)
);

INSERT INTO menu_items 
    (item, prep_time, ingredient_cost, sales, menu_price)
VALUES
    ('omelette', 10, 1.5, 182, 7.99),
    ('tacos', 5, 2, 254, 8.99),
    ('oatmeal', 1, 0.5, 79, 5.99);


--a little more involved way than by using ORDER BY and LIMIT
WITH item_profit as
  (SELECT item, menu_price - ingredient_cost as profit
    FROM menu_items)
SELECT item, profit
FROM  item_profit
WHERE profit = (SELECT max(profit) FROM item_profit);

SELECT item, menu_price, ingredient_cost, 
      round(prep_time * 13.0 / 60, 2) as labor_cost, 
      round(menu_price - ingredient_cost - (prep_time * 13.0 / 60), 2) as profit
FROM menu_items
ORDER BY profit DESC;

--using a subquery

SELECT  item, 
        menu_price, 
        ingredient_cost, labor_cost,
        menu_price - ingredient_cost - labor_cost as profit
  FROM  (SELECT   item, 
                  menu_price, 
                  ingredient_cost, 
                  round(prep_time * 13.0 / 60, 2) as labor_cost
            FROM  menu_items) as temp
ORDER BY profit DESC;