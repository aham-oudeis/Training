--set up database

CREATE DATABASE workshop;

CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp DEFAULT NOW()
);

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number integer NOT NULL UNIQUE,
  device_id integer REFERENCES devices(id)
);

--insert data for parts and devices

INSERT INTO devices 
            (name)
     VALUES ('Accelerometer'),
            ('Gyroscope');

INSERT INTO parts
            (part_number, device_id)
     VALUES (11, (SELECT id FROM devices WHERE name = 'Accelerometer')),
            (12, (SELECT id FROM devices WHERE name = 'Accelerometer')),
            (13, (SELECT id FROM devices WHERE name = 'Accelerometer')),
            (21, (SELECT id FROM devices WHERE name = 'Gyroscope')),
            (22, (SELECT id FROM devices WHERE name = 'Gyroscope')),
            (23, (SELECT id FROM devices WHERE name = 'Gyroscope')),
            (24, (SELECT id FROM devices WHERE name = 'Gyroscope')),
            (25, (SELECT id FROM devices WHERE name = 'Gyroscope')),
            (31, NULL),
            (32, NULL),
            (33, NULL);

--inner join: display all devices with all the parts that make them up

  SELECT  d.name, p.part_number
    FROM  devices AS d
    JOIN  parts AS p
      ON  d.id = p.device_id
ORDER BY  d.name

--select part_number that start with a 3

SELECT * 
  FROM parts 
 WHERE part_number::text LIKE '3%';

 --aggregate functions: device with the number of parts

    SELECT d.name, count(p.id) AS "number of parts"
      FROM devices AS d
INNER JOIN parts AS p
        ON d.id = p.device_id
  GROUP BY d.name
  ORDER BY name DESC, "number of parts" DESC;

--two queries: parts with its associated device and 
--parts without an associated device

  SELECT  part_number, device_id
    FROM  parts
   WHERE  device_id IS NOT NULL;

  SELECT  part_number, device_id
    FROM  parts
   WHERE  device_id IS NULL;

--oldest device

  INSERT INTO devices
              (name)
       VALUES ('Magnetometer');

  INSERT INTO parts
              (part_number, device_id)
       VALUES (42, 
              (SELECT id FROM devices 
                WHERE name = 'Magnetometer'));

SELECT  name
  FROM  devices
 WHERE  created_at = (SELECT min(created_at) FROM devices);

--update device_id

UPDATE  parts
   SET  device_id = (SELECT id FROM devices WHERE name = 'Accelerometer')
 WHERE  id IN (SELECT id FROM parts 
                WHERE device_id = (SELECT id FROM devices WHERE name = 'Gyroscope')
                ORDER BY id DESC LIMIT 2);

--delete accelerometer
--since we do not have ON DELETE CASCADE clause,
--we will have to first delete parts that references
--accelerometer and then deleter the device

DELETE FROM parts
      WHERE device_id = (SELECT id FROM devices
                          WHERE name = 'Accelerometer');

DELETE FROM  devices 
       WHERE name = 'Accelerometer';