--Write a query that determines how many tickets have been sold.
SELECT count(id) 
  FROM tickets;

--Write a query that determines how many different 
--customers purchased tickets to at least one event.
SELECT  count(DISTINCT customer_id)
  FROM  tickets; 

--Write a query that determines what percentage of the customers 
--in the database have purchased a ticket to one or more of the events.
    SELECT  round(count(DISTINCT tickets.customer_id) * 100 / 
                  count(DISTINCT customers.id)::decimal, 1)
            as tickets_buying_customers_percent
      FROM  tickets
RIGHT JOIN  customers
        ON  tickets.customer_id = customers.id
--the reason we need distinct for customers.id is because
--we are doing a right join and that adds 2131 rows with
--duplicate values of customers id to match with the tickets

--using subquery is simpler here
SELECT round((SELECT count(DISTINCT customer_id) FROM tickets) * 100 
        / (SELECT count(id) FROM customers)::decimal, 2);

--Write a query that returns the name of each event and how many tickets 
--were sold for it, in order from most popular to least popular.

   SELECT   events.name, count(tickets.id) as popularity
     FROM   events
LEFT JOIN   tickets
       ON   tickets.event_id = events.id
 GROUP BY   events.name
 ORDER BY   popularity DESC;

 --Write a query that returns the user id, email address, 
 --and number of events for all customers that have 
 --purchased tickets to three events.

   SELECT  c.id, c.email, count(DISTINCT t.event_id) "Tickets Purchased"
     FROM  customers AS c
     JOIN  tickets AS t
       ON  c.id = t.customer_id
 GROUP BY  c.id
   HAVING  count(DISTINCT t.event_id) = 3

--using with we can use WHERE instead of HAVING
WITH grp AS (
    SELECT  c.id, c.email, count(DISTINCT t.event_id)
     FROM  customers AS c
     JOIN  tickets AS t
       ON  c.id = t.customer_id
 GROUP BY  c.id )

SELECT id, email, count FROM grp WHERE count = 3;


--Write a query to print out a report of all tickets 
--purchased by the customer with the email address 
--'gennaro.rath@mcdermott.co'. The report should 
--include the event name and starts_at and the seat's
--section name, row, and seat number.

SELECT e.name, e.starts_at, sec.name as section, s.row, s.number as seat
FROM   customers c
INNER JOIN  tickets t
ON c.id = (SELECT id FROM customers 
            WHERE email = 'gennaro.rath@mcdermott.co')
    AND
    c.id = t.customer_id
INNER JOIN  events e 
ON e.id = t.event_id
INNER JOIN seats s 
ON t.seat_id = s.id
INNER JOIN sections sec
ON s.section_id = sec.id;

