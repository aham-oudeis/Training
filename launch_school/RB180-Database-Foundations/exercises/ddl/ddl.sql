--create an extrasolar planetory database

CREATE DATABASE extrasolar;

\c extrasolar

CREATE TABLE stars (
  id serial PRIMARY KEY,
  name varchar(35) NOT NULL UNIQUE,
  distance integer NOT NULL CHECK (distance > 0),
  spectral_type char(1) 
    CHECK (spectral_type in ('O', 'B', 'A', 'F', 'G', 'K', 'M')
            AND length(spectral_type) = 1),
  companions integer NOT NULL CHECK (companions >= 0)
);

CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1) UNIQUE,
  mass  integer
);

--relating stars and planets

ALTER TABLE planets
 ADD COLUMN star_id integer NOT NULL 
            REFERENCES stars(id) ON DELETE CASCADE;

--increase star name length

ALTER TABLE stars
ALTER COLUMN name TYPE varchar(50);

--further exploration: there is no problem with imposing 
--a dataype on existing data if the data is in agreement
--with the datatype; this explanation works for constraints
--as well

--stellar distance precision
 ALTER TABLE stars
ALTER COLUMN distance TYPE numeric;

--further exploration: see the above explanation

--check values in list

ALTER TABLE stars
ADD CHECK (spectral_type IN ('O', 'B', 'A', 'F', 'G', 'K', 'M')),
ALTER COLUMN spectral_type SET NOT NULL;

--remove check_spectral_type and use enum instead

CREATE TYPE spectral_type_enum
         AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars
DROP CONSTRAINT stars_spectral_type_check,
ALTER COLUMN spectral_type TYPE spectral_type_options
       USING spectral_type::spectral_type_enum;

--planetary mass precision, make designation column required

ALTER TABLE planets
ALTER COLUMN mass TYPE numeric,
ALTER COLUMN mass SET NOT NULL,
ADD CHECK (mass > 0.0),
ALTER COLUMN designation SET NOT NULL;


--add a semi-major axis column with numberic value required 

ALTER TABLE planets
ADD COLUMN semi_major_axis numeric NOT NULL;

--add a moons table

CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation integer NOT NULL CHECK (designation > 0),
  semi_major_axis numeric CHECK (semi_major_axis > 0),
  mass numeric CHECK (mass > 0),
  planet_id integer NOT NULL REFERENCES planets(id)
);

-- save and delete the database
-- from the terminal: pg_dump --INSERTS > extrasolar.dump.sql
-- then dropdb extrasolar