-- first import the sql code from one-to-many.sql file

--Write a SQL statement to retrieve the call times, duration, and 
--first name for all calls not made to William Swift.

SELECT  ca."when", ca.duration, co.first_name
FROM    calls AS ca
JOIN    contacts AS co
ON      ca.contact_id = co.id AND
        co.id <> (SELECT id FROM contacts 
                    WHERE first_name = 'William' AND
                          last_name = 'Swift');

--or, we could use the second ON condition as a WHERE clause

--Write SQL statements to add the following call data to the database:
-- when 	          duration 	first_name 	last_name 	number
--2016-01-17 11:52:00 	175 	Merve 	      Elk 	    6343511126
--2016-01-18 21:22:00 	79 	  Sawa 	      Fyodorov 	  6125594874

INSERT INTO contacts 
            (first_name, last_name, number)
    VALUES  ('Merve', 'Elk', 6343511126),
            ('Sawa', 'Fyodorov', 6125594874);

INSERT INTO calls
            ("when", duration, contact_id)
    VALUES  ('2016-01-17 11:52:00', 175, 
                (SELECT id FROM contacts WHERE number = 6343511126)),
            ('2016-01-18 21:22:00', 79, 
                (SELECT id FROM contacts WHERE number = 6125594874));

--Add a constraint to contacts that prevents a duplicate value being 
--added in the column number.

   ALTER TABLE  contacts
ADD CONSTRAINT  unique_number UNIQUE (number);

--Write a SQL statement that attempts to insert a duplicate number for a 
--new contact but fails. What error is shown?

INSERT INTO contacts 
            (first_name, last_name, number)
     VALUES ('duplicate', 'number', 6125594874);

--It throws an error saying that unique constraint (unique_number) is violated 


--Why does "when" need to be quoted in many of the queries in this lesson?

-- Because WHEN is a keyword and to avoid the possible error of 
-- having Postgres mistake the column name for a keyword
