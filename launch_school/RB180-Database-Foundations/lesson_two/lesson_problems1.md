# Practice Problems for SQL

1. What kind of programming language is SQL?
* Declarative

* Special purpose language for manipulating the structure and values of datasets stored in a relational database.

2. What are the three sublanguages of SQL?
* DDL- Data Definition Language 
-(CREATE TABLE, ALTER TABLE, ADD COLUMN )
* DML- Data Manipulation Language-(SELECT, INSERT INTO, UPDATE, DELETE)
* DCL- Data Control Language

3. Write the following values as quoted string values that could be used in a SQL query.
```SQL
canoe
a long road
weren't
"No way!"
```

```sql
'canoe'
'a long road'
'weren''t'
'"No way!"'
```

4. What operator is used to concatanate strings?
* There are two ways to do this: using `||` operator or the CONCAT(str1, str2) function
* Using the `||` operator with NULL value return NULL, concat function ignores the NULL values.

5. What function returns a lowercased version of a string? Write a SQL statement using it.
* LOWER(str) returns a lowercased version of a string
* SELECT lower('HELLO, THERE!') AS greeting;
   
6. How does the psql console display true and false values?
* true as t and false as f.
  
7. The surface area of a sphere is calculated using the formula A = 4π r2, where A is the surface area and r is the radius of the sphere.

Use SQL to compute the surface area of a sphere with a radius of 26.3cm, truncated to return an integer.

* SELECT trunc(4 * pi() * power(26.3, 2)) AS Surface_area_of_a_Sphere_with_radius_26_3cm
