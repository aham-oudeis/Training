CREATE DATABASE residents;

\i residents_with_data.sql

  SELECT    state, count(*)
    FROM    people
GROUP BY    state
ORDER BY    count DESC
    LIMIT   10;

  SELECT    split_part(email, '@', 2) as domain, count(*)
    FROM    people
GROUP BY    split_part(email, '@', 2)
ORDER BY    count DESC;

--or, using a subquery

  SELECT    domain, count(*)
    FROM    ( SELECT  split_part(email, '@', 2) as domain
                FROM  people ) as temp
GROUP BY    domain
ORDER BY    count DESC;

DELETE FROM people
      WHERE id = 3399;

DELETE FROM people
      WHERE state = 'CA';

     UPDATE people
        SET given_name = UPPER(given_name)
      WHERE email LIKE '%teleworm.us';

--delete all rows

DELETE FROM people;