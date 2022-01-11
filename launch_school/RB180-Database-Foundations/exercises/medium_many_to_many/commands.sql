CREATE DATABASE billing;

\c billing

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) UNIQUE NOT NULL
  CHECK (upper(payment_token) = payment_token AND 
        length(payment_token = 8))
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2) CHECK (price >= 0)
);

INSERT INTO customers
            (name, payment_token)
     VALUES ('Pat Johnson', 'XHGOAHEQ'),
            ('Nancy Monrel', 'JKWQPJKL'),
            ('Lynn Blake', 'KLZXWEEE'),
            ('Chen Ke-Hua', 'KWETYCVX'),
            ('Scott Lakso', 'UUEAPQPS'),
            ('Jim Pornot', 'XKJEYAZA');

INSERT INTO services
            (description, price)
     VALUES ('Unix Hosting', 5.95),
            ('DNS', 4.95),
            ('Whois Registration', 1.95),
            ('High Bandwidth', 15),
            ('Business Support', 250),
            ('Dedicated Hosting', 50),
            ('Bulk Email', 250),
            ('One-to-one Training', 999);

CREATE TABLE customers_services (
  id serial PRIMARY KEY,
  customer_id integer NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
  service_id integer NOT NULL REFERENCES services(id) ON DELETE CASCADE
);

INSERT INTO customers_services
            (customer_id, service_id)
     VALUES (1, 1), (1, 2), (1, 3),
            (3, 1), (3, 2), (3, 3), (3, 4), (3, 5),
            (4, 1), (4, 4),
            (5, 1), (5, 2), (5, 6),
            (6, 1), (6, 6), (6, 7);  

--get customer with service

SELECT * FROM customers 
WHERE id IN (SELECT DISTINCT customer_id 
              FROM customers_services);

SELECT DISTINCT customers.* FROM customers
INNER JOIN customers_services
        ON customer_id = customers.id;

--get customer with no serives

SELECT * FROM customers 
WHERE id NOT IN (SELECT DISTINCT customer_id 
              FROM customers_services);

SELECT DISTINCT customers.* FROM customers
      LEFT JOIN customers_services
             ON customer_id = customers.id
          WHERE customers_services.service_id IS NULL;

--further exploration
SELECT DISTINCT customers.*, services.* FROM customers
FULL OUTER JOIN customers_services AS cs
             ON customer_id = customers.id
FULL OUTER JOIN services
             ON services.id = cs.service_id
          WHERE cs.service_id IS NULL OR
                cs.customer_id IS NULL;

--service without a customer using RIGHT OUTER JOIN
          SELECT s.description FROM customers_services AS cs
RIGHT OUTER JOIN services AS s
              ON cs.service_id = s.id
           WHERE cs.customer_id IS NULL;

--services for each customer, including customers 
--without a service

         SELECT  c.name, string_agg(s.description, ', ') AS services
           FROM  customers AS c
LEFT OUTER JOIN  customers_services AS cs
             ON  cs.customer_id = c.id
LEFT OUTER JOIN  services AS s
             ON  s.id = cs.service_id
       GROUP BY  c.name;

--further exploration using lag function
--basically, check if the current name is equal to  the name
--in the previous row; if it's the same, insert NULL, otherwise
--insert the current name.
        SELECT  CASE customers.name
                  WHEN lag(customers.name, 1) OVER (ORDER BY customers.name) 
                    then NULL
                  ELSE customers.name
                END
                  AS name,
                services.description
           FROM customers
LEFT OUTER JOIN customers_services
             ON customer_id = customers.id
LEFT OUTER JOIN services
             ON services.id = service_id;

--services with at least 3 customers
  SELECT  s.description, count(cs.customer_id)
    FROM  services AS s
    JOIN  customers_services AS cs
      ON  cs.service_id = s.id
GROUP BY  s.description
  HAVING  count(cs.customer_id) >= 3;   

--or
WITH service_count AS (
      SELECT  s.description, count(cs.customer_id)
        FROM  services AS s
        JOIN  customers_services As cs
          ON  cs.service_id = s.id
    GROUP BY  s.description )

SELECT description, count 
  FROM service_count
 WHERE count >= 3;

--total gross income
SELECT  sum(price) as gross
  FROM  services as s
  JOIN  customers_services as cs
    ON  cs.service_id = s.id;

--add a new customer

INSERT INTO customers
            (name, payment_token)
     VALUES ('John Doe', EYODHLCN);

--since the id of john doe is 7, we can insert values
INSERT INTO customers_services
            (customer_id, service_id)
     VALUES (7, 1), (7, 2), (7, 3);

--revenue from big ticket services (price > 100)

SELECT sum(price)
  FROM (SELECT price 
          FROM services AS s
          JOIN customers_services AS cs
            ON cs.service_id = s.id 
         WHERE price > 100) AS big_ticket;

--without using subqueries

SELECT  sum(price)
  FROM  services AS s
  JOIN  customers_services AS cs
    ON  cs.service_id = s.id 
 WHERE  price > 100;

--if all customers were to subscribe to big-ticket services
SELECT sum(price)
  FROM (SELECT price 
          FROM (SELECT description, price 
                  FROM services WHERE price > 100   
                ) AS s
    CROSS JOIN customers AS c
        ) AS big_ticket;

--without using subquery

    SELECT  sum(price)
      FROM  services AS s
CROSS JOIN  customers AS c
     WHERE  price > 100;

--delete bulk email and customer Chen Ke-Hua

--since we have on delete cascade clause, we can do as follows:

DELETE FROM customers
      WHERE name = 'Chen Ke-Hua';

DELETE FROM services
      WHERE description = 'Bulk Email';