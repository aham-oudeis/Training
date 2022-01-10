--import the many-to-many.sql file

--The books_categories table from this database was created with 
--foreign keys that don't have the NOT NULL and ON DELETE CASCADE 
--constraints. Go ahead and add them now.
    ALTER TABLE  books_categories
   ALTER COLUMN  book_id SET NOT NULL,
   ALTER COLUMN  category_id SET NOT NULL,
DROP CONSTRAINT  books_categories_book_id_fkey,
DROP CONSTRAINT  books_categories_category_id_fkey,
ADD FOREIGN KEY  (book_id) REFERENCES books(id) ON DELETE CASCADE,
ADD FOREIGN KEY  (category_id) REFERENCES categories(id) ON DELETE CASCADE;

-- write a SQL query to list the author's name with a list of categories
-- of books  they have authored

    SELECT  b.id, b.author, string_agg(c.name, ', ')
      FROM  books AS b
INNER JOIN  books_categories AS bc
        ON  b.id = bc.book_id
INNER JOIN  categories AS c
        ON  c.id = bc.category_id
  GROUP BY  b.id, b.author
  ORDER BY  b.id;

--write SQL statments to insert  the following data (given in a table)

 ALTER TABLE  books
ALTER COLUMN  title  TYPE text,
ALTER COLUMN  author TYPE text;

INSERT INTO books
            (title, author)
     VALUES ('Sally Ride: America''s First Woman in Space', 'Lynn Sherr'),
            ('Jane Eyre', 'Charlotte Bronte'),
            ('Vij''s: Elegant and Inspired Indian Cuisine', 'Meeru Dhalwala and Vikram Vij');

INSERT INTO categories
            (name)
     VALUES ('Space Exploration'), ('Cookbook'), ('South Asia');

INSERT INTO books_categories
            (book_id, category_id)
     VALUES ((SELECT id FROM books 
              WHERE title = 'Sally Ride: America''s First Woman in Space'),
              (SELECT id FROM categories 
              WHERE name = 'Biography')),
            ((SELECT id FROM books 
              WHERE title = 'Sally Ride: America''s First Woman in Space'),
              (SELECT id FROM categories 
              WHERE name = 'Nonfiction')),
            ((SELECT id FROM books 
              WHERE title = 'Sally Ride: America''s First Woman in Space'),
              (SELECT id FROM categories 
              WHERE name = 'Space Exploration')),
            ((SELECT id FROM books 
              WHERE title = 'Jane Eyre'),
              (SELECT id FROM categories 
              WHERE name = 'Fiction')),
            ((SELECT id FROM books 
              WHERE title = 'Jane Eyre'),
              (SELECT id FROM categories 
              WHERE name = 'Classics')),
            ((SELECT id FROM books 
              WHERE title = 'Vij''s: Elegant and Inspired Indian Cuisine'),
              (SELECT id FROM categories 
              WHERE name = 'Cookbook')),
            ((SELECT id FROM books 
              WHERE title = 'Vij''s: Elegant and Inspired Indian Cuisine'),
              (SELECT id FROM categories 
              WHERE name = 'Nonfiction')),
            ((SELECT id FROM books 
              WHERE title = 'Vij''s: Elegant and Inspired Indian Cuisine'),
              (SELECT id FROM categories 
              WHERE name = 'South Asia'));

-- Write a SQL statement to add a uniqueness constraint on the combination 
-- of columns book_id and category_id of the books_categories table. 
-- This constraint should be a table constraint; so, it should check for 
-- uniqueness on the combination of book_id and category_id across all 
-- rows of the books_categories table.

ALTER TABLE books_categories
ADD UNIQUE (book_id, category_id);

--display the category name with the books in that category 
--along with the number of books in that category

    SELECT  c.name, 
            count(b.id) AS book_count,
            string_agg(b.title, ', ') AS book_titles
      FROM  categories AS c
INNER JOIN  books_categories AS bc
        ON  bc.category_id = c.id
INNER JOIN  books AS b
        ON  b.id = bc.book_id
  GROUP BY  c.name
  ORDER BY  c.name;