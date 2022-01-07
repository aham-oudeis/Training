### Relational Database 	
A structured collection of data that follows the relational model.

### RDBMS 	
Relational Database Management System. A software application for managing relational databases, such as PostgreSQL, MySQL, SQLite.

### Relation 	
A set of individual but related data entries; analogous to a database table.

### SQL 	
Structured Query Language. The language used by RDBMSs.

### SQL Statement 	
A SQL command used to access/use the database or the data within that database via the SQL language.

### SQL query 	
A subset of a "SQL Statement". A query is a way to search, or lookup data within a database, as opposed to updating or changing data.

### SQL Sub-languages
#### DDL: Data Definition Language: 
   * Used to define the structure of a database and the tables and the columns.
   * Deals with schema
   * CREATE/ALTER/DROP TABLE

#### DML: Data Manipulation Language: SELECT/UPDATE/DELETE
   * Used to retrieve or modify data stored in a database
   * Deals with content (data)
   * SELECT, UPDATE, DELETE

#### DCL: Data Control Language: 
   * Used to manage permissions to various users, such as determining what they are allowed to do when interaction with a database.
   * Deals with permissions
   * GRANT/REVOKE

### Schema
> Schema is concerned with the structure of a database. This structure is defined by things such as the names of tables and table columns, the data types of those columns and any constraints that they may have.

### Data
> Data is concerned with the contents of a database. These are the actual values associated with specific rows and columns in a database table.

### Data Type
A data type classifies particular values that are allowed for that column. It specifies the kind of values permitted in that column. If a conversion is possible, then it will insert the converted value. For instance, if the data type is integer, but you enter a decimal value, then the value will be converted into an integer. Likewise, if the data type is integer and you input a number as a string, it will convert the string into a number. But if a conversion is not possible, then it will throw an error: `invalid input syntax for type` For instance, if you try to input a different data type, say input text ('hello') in a column with integer data type, it will throw an error. Thus, it offers a layer of protection from an invalid data being entered as a value.

### Constraints
> One of the key functions of a database is to maintain the integrity and quality of the data that it is storing. Keys and Constraints are rules that define what data values are allowed in certain columns. They are an important database concept and are part of a database's schema definition. Defining Keys and Constraints is part of the database design process and ensures that the data within a database is reliable and maintains its integrity. Constraints can apply to a specific column, an entire table, more than one table, or an entire schema. [source](https://launchschool.com/books/sql/read/create_table)

### serial
> serial is a special data type available in PostgreSQL. It uses the integer data type along with a DEFAULT constraint and a function called nextval which keeps a track of the current highest value and increments this by one to be used as the next value.[source](https://launchschool.com/books/sql/read/create_table)