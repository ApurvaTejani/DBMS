SELECT *
FROM customers;

SELECT *
FROM orders;

-- customer_first_name, order_date
SELECT c.first_name, o.order_date
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id;
    
USE sql_hr;

SELECT *
FROM employees;

-- employee name, manager name

SELECT e.first_name, m.first_name
FROM employees e
JOIN employees m
	ON e.reports_to = m.employee_id;
    
USE sql_store;

-- customer.first_name, product.name
SELECT *
FROM customers; -- customer_id, first_name

SELECT *
FROM orders; -- customer_id, order_id

SELECT *
FROM order_items; -- order_id, product_id

SELECT *
FROM products; -- product_id, name


SELECT c.first_name, p.name
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
JOIN products p
	ON oi.product_id = p.product_id;
    
-- USING
SELECT c.first_name, o.order_date
FROM customers c
JOIN orders o
USING (customer_id);

-- NATURAL JOIN
SELECT c.first_name, o.order_date
FROM customers c
NATURAL JOIN orders o;

-- CROSS JOIN
SELECT *
FROM customers;

SELECT *
FROM products;

-- CROSS JOIN Syntax 1
SELECT *
FROM customers, products;

-- CROSS JOIN Syntax 2
SELECT *
FROM customers
CROSS JOIN products;


-- Fake entries via cross joins
SELECT *
FROM products;

CREATE Table tblforNames (
	id INT PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE tblForQty (
	id INT PRIMARY KEY,
    qty INT
);

CREATE TABLE tblForPrice (
	id INT PRIMARY KEY,
    price double
);

INSERT INTO tblforNames
VALUES 
(1, "A"),
(2, "B");

INSERT INTO tblForQty
VALUES 
(1, 10),
(2, 20);


INSERT INTO tblForPrice
VALUES 
(1, 5.5),
(2, 2.2);

SELECT *
FROM tblForNames;

SELECT *
FROM tblForQty;

SELECT *
FROM tblForPrice;


SELECT t1.name, t2.qty, t3.price
FROM tblForNames t1, tblForQty t2, tblForPrice t3;

INSERT INTO products (name, quantity_in_stock, unit_price)
SELECT t1.name, t2.qty, t3.price
FROM tblForNames t1, tblForQty t2, tblForPrice t3;







    
    
    