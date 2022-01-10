# Database Design

## ERD: Entities Relationship Diagram
* A graphical representation of the entities and the relationship that exists betweeen them. 
* More broadly, they can be called database diagrams, although sometimes ERDs are associated with a high level diagrams than with the low-level diagrams.

## Database Diagrams
Depending on the details in the diagrams, we can divide them into three categories:
1. Conceptual Schema: A high level design with a primary focus on identifying the entities and their relatiionships.
2. Logical Schema: A mid level design with a focus on fleshing out the details of the relationship between entities.
3. Physical Schema: A low level database-specific design with a focus on implementation.

## Three Types of Relationship
1. One-to-one: If a token of some type has one-to-one correspondence with a token of another type, then it is a one-to-one relationship. Generally, this sort of relationship is folded into one table.
2. One-to-many: If a token of some type (entity) can be associated with many tokens of another type (entity), then it is a one-to-many relationship. For example, one tree can have many apples, but all apples have to belong to some one tree. (One apple growing on two trees?)
3. Many-to-many: If a token of some type can be associated with many tokens of another type and vice versa, then it is a many-to-many relationship. For example, students-to-classes can be modeled on many-to-many relationship: a student can take many classes, and a class can contain many students. 

## Cardinality
The number of objects on the either side of the relationship is called the cardinality of that entity for that relationship. Cardinality is the maximum number of objects on either side of the relationship. For example, in a One-to-many relationship, the cardinality is 1:M.

## Modality
The minimum number of objects on the either side of the relationship is called the modality of that relationship. For instance, the relationship between an apple tree and apples is such that an apple tree can fail to grow any apples but an apple must belong  to some tree, so that the modality of the relationship is 1 on the side of the tree and 0 on the side of the apples.

* In Crow's Foot notation, the cardinality of many is denoted with three splitting lines and cardinality of one is  denoted with a single line. Modality of 0 is denoted with a tiny circle on the line, and modality of 1 is denoted with a little-line perpendicular to the connecting line.

## Normalization
The process of splitting up data into different tables to remove duplication and improve data integrity is known as normalization.

1. The reason for normalization is to reduce redundancy in data and improve data integrity (update anomaly, insertion anomaly, deletion anomaly)
2. Normalization is performedd by splitting the data across multiple tables and defining the relationships between them

Having a large table to contain all data instead of splitting the data across table may lead to various kinds of issues with the data integrity. 

## Update Anomaly
When there are tons of duplicated data, while updating some record one may fail to update all the duplicated data. In such a case, the updated record would contain inconsistent data. 

## Insertion Anomaly
Say a many-to-many relationshiip is bundled up in one giant table with cardinality of 0 on either side. Say, members and book-checkouts are listed in one giant table. In such a case, adding a member without a book-checkout requires adding a null value to the book-checkout. This would lead to proliferation of null values throughout the table.

## Deletion Anomaly
Likewise, if two independent entities are tied up in one table, deleting the record of one entiity would require deleting the record of another entity. Say, a member is associated with only one book-checkout and suppose that the book is deemed lost. If we want to delete the book from the database, we would effectively delete the member associated with that book-checkout.



