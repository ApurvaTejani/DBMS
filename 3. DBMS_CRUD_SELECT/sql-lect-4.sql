USE sql_store;

-- Selecting a tuple of constants (even from clause is optional)
SELECT 1, "ABC", "DEF";

-- Giving column names
SELECT 1 AS d1, "ABC" AS d2, "DEF" AS d3;

-- Select all rows and all columns from a table
SELECT *
FROM customers;

-- Limiting and reordering columns
SELECT points, first_name, last_name
FROM customers;

-- Having expressions in columns
SELECT 2 * points AS TwicePoints, points * points AS PointsSquared, points
FROM customers;

-- some varchar examples
SELECT first_name, LEFT(first_name, 2) AS Initials
FROM customers;

SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS FullName
FROM customers;

-- DISTINCT keyword
SELECT *
FROM customers;

SELECT DISTINCT first_name, last_name
FROM customers;

SELECT DISTINCT first_name
FROM customers;

SELECT DISTINCT customer_id, first_name, last_name
FROM customers;

-- WHERE clause
SELECT *
FROM customers
WHERE customer_id >= 10;

-- select customers with non zero points
SELECT *
FROM customers
WHERE points <> 0;

-- Read customers who have phone
SELECT *
FROM customers
WHERE phone IS NOT NULL;

-- Read customers who don't have phone
SELECT *
FROM customers
WHERE phone IS NULL;

-- Check this null comparison
SELECT (NULL = NULL), (NULL IS NULL);

-- Mutiple conditions (OR, AND, NOT)
SELECT *
FROM customers;

-- Read customers who have phone and points > 1000
SELECT *
FROM customers
WHERE phone IS NOT NULL AND points > 1000;

-- Read customers who either have a phone or points > 1000
SELECT *
FROM customers
WHERE phone IS NOT NULL OR points > 1000;

SELECT *
FROM customers
WHERE NOT(city = 'Atlanta');

-- phone is null and points <= 1000
SELECT *
FROM customers
WHERE NOT(phone IS NOT NULL OR points > 1000)

-- NOT (a > 10 AND b < 20)
-- a <= 10 OR b >= 20

-- IN operator
SELECT *
FROM customers
WHERE customer_id IN (2, 3, 9, 10, 20, 21);

-- BETWEEN => (col >= 10 AND col <= 20)
SELECT *
FROM products;

-- Get products with quantity >= 20 abd less than <= 60
SELECT *
FROM products
WHERE quantity_in_stock BETWEEN 20 AND 60;

SELECT *
FROM products
WHERE quantity_in_stock >= 20 AND quantity_in_stock <= 60;


CREATE TABLE Students (
	id INT PRIMARY KEY,
    first_name VARCHAR(10)
)
CHARACTER SET 'utf8mb4' -- a, b, c, A, B, C, 1, 2, 3
COLLATE 'utf8mb4_0900_as_ci';

DROP TABLE students;

SELECT *
FROM students;

SELECT DISTINCT first_name
FROM students;


-- LIKE operator (for filtering using regular expressions)
SELECT *
FROM customers;

-- Find customers who live in a city whose name start with c
SELECT *
FROM customers
WHERE city LIKE 'c%';

-- Find customers who live in a city whose name end with n
SELECT *
FROM customers
WHERE city LIKE '%n';


-- ORDERING
SELECT *
FROM customers; -- sorted by PK by default

SELECT *
FROM customers
ORDER BY first_name DESC, last_name ASC, points; 


-- LIMIT and OFFSET
SELECT *
FROM customers
ORDER BY first_name
LIMIT 5
OFFSET 3;


-- 100 records, on every page we show 10 results
-- what will be the limit and offset for 4th page = leave 30 records, pick next 10
-- LIMIT 10 OFFSET 30
-- LIMIT 30, 10

SELECT *
FROM customers
ORDER BY points DESC
LIMIT 1
OFFSET 1;

SELECT *
FROM customers
ORDER BY first_name
LIMIT 5
OFFSET 5;




SELECT IF(phone IS NULL, 'NA', phone) AS phone, points
FROM customers;


-- JOINs, Indexes, SQ, Exists

-- Overflow
	SELECT points, points * points * points
	FROM customers;

