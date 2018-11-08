CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


SELECT REVERSE(UPPER('Why does my cat look at me with such hatred'));

SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );
  
SELECT REPLACE(title, ' ', '->') AS title
FROM books;
  
SELECT
    author_lname AS forwards,
    REVERSE(author_lname) AS backwards
FROM books;
   
SELECT
    UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'Full name in caps'
From books;
  
SELECT title, released_year
 FROM books;
 
 SELECT
   CONCAT(title, 'was released in', released_year) AS bulrb
FROM books;
 
SELECT 
    CONCAT(title, ' ', CHAR_LENGTH(title)), 'character count'
FROM books;
 
SELECT 
     title,
     CHAR_LENGTH(title) AS 'character coount'
 FROM books;
 
SELECT
      CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
      CONCAT(author_lname, ',', author_fname) AS author,
      CONCAT(stock_quantity, 'in stock') AS quantity
FROM books;
 
 
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
    VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
           ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
           ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);
           
           
SELECT title
FROM books
WHERE title LIKE '%stories%';

SELECT title, pages
FROM books
ORDER BY pages DESC
LIMIT 1;


SELECT
    CONCAT(title, ' - ', released_year) AS summary
FROM books
ORDER BY released_year DESC
LIMIT 3;

SELECT title, released_year, stock_quantity
FROM books
ORDER BY stock_quantity
LIMIT 3;

SELECT title, author_lname
FROM books
ORDER by 2,1;


SELECT 
     CONCAT(
     'MY FAVORITE AUTHOR IS',
     UPPER(author_fname),
      UPPER(author_lname),
      '!'
      ) AS yell
FROM books
ORDER BY author_lname;


SELECT COUNT(*)
FROM books
WHERE title LIKE '%the%';


SELECT * FROM books 
WHERE pages = (SELECT Min(pages) 
                FROM books); 
                
SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;  





SELECT pages,
  CONCAT(author_fname, ' ', author_lname)
FROM books
ORDER BY pages DESC;



SELECT released_year AS year,
      COUNT(*) AS '# book',
    AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year;




SELECT title, released_year
FROM books
WHERE released_year < 1980;

SELECT title, author_lname
FROM books
WHERE author_lname = 'Eggers'
    OR author_lname = 'Chabon';


SELECT title, author_lname, released_year
FROM books
WHERE author_lname = 'Lahiri'
    AND released_year > 2000;
    
    
SELECT title, pages
FROM books
WHERE pages BETWEEN 100 AND 200;


SELECT title, author_lname
FROM books
WHERE author_lname LIKE 'C%' 
    OR author_lname LIKE 'S%';
    

SELECT author_fname, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' book')
    END AS COUNT    
FROM books
GROUP BY author_lname, author_fname;