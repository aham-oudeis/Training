CREATE TABLE bidders (
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE items (
  id serial PRIMARY KEY,
  name text NOT NULL,
  initial_price numeric(6, 2) NOT NULL 
    CHECK(initial_price > 0 AND initial_price <= 1000),
  sales_price numeric(6, 2)
    CHECK(sales_price > 0 AND sales_price <= 1000)
);

CREATE TABLE bids (
  id serial PRIMARY KEY,
  bidder_id integer NOT NULL 
    REFERENCES bidders(id) ON DELETE CASCADE,
  item_id integer NOT NULL
    REFERENCES items(id) ON DELETE CASCADE,
  amount numeric(6, 2) NOT NULL
    CHECK(amount > 0 AND amount <= 1000)
);

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders FROM 'bidders.csv' WITH DELIMITER ',' CSV HEADER;
\copy items FROM 'items.csv' WITH DELIMITER ',' CSV HEADER;
\copy bids FROM 'bids.csv' WITH DELIMITER ',' CSV HEADER;

--items with bids on them using IN operator
SELECT i.name AS "Bid on Items"
  FROM items AS i
 WHERE i.id IN (SELECT DISTINCT item_id FROM bids);

--items with no bids on them using NOT IN operator
SELECT i.name AS "Not bid on"
  FROM items AS i
 WHERE i.id NOT IN (SELECT DISTINCT item_id FROM bids);

--conditional subqueries: people with bid in the auction
--using EXISTS
SELECT  b.name
  FROM  bidders as b
 WHERE  EXISTS (SELECT true FROM bids WHERE bids.bidder_id = b.id);

--using join instead of EXISTS
SELECT  DISTINCT b.name
FROM  bidders as b
JOIN  bids
  ON  bids.bidder_id = b.id;

--query from a virtual table

SELECT  max(count)
  FROM  (SELECT item_id, count(bidder_id)
           FROM bids
       GROUP BY item_id
         ) as bid_count_on_item;


--scalar subqueries: number of bids on each item

SELECT i.name, 
      (SELECT count(bidder_id) FROM bids 
        WHERE item_id = i.id)
  FROM items AS i;

--row comparision

SELECT id
  FROM items 
 WHERE ROW(name, initial_price, sales_price)
        = ('Painting', 100, 250);

--when using EXPLAIN ANALYZE, it is important to pay attention
--to planning time, execution time, and total costs.
--sometimes a query may be faster and costly
--depending on which is more valuable, we would have to 
--choose the query that fits our needs