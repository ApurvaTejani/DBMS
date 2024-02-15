USE sql_store;

-- aggregates
SELECT *
FROM customers;

SELECT *
FROM products;

-- average price of all products
SELECT AVG(unit_price)
FROM products;

-- total quantity
SELECT SUM(quantity_in_stock)
FROM products;

-- having multiple aggregates in single query is fine
SELECT SUM(quantity_in_stock) AS Total, MAX(quantity_in_stock) AS Maximum, 
	   MIN(quantity_in_stock), COUNT(quantity_in_stock), AVG(quantity_in_stock)
FROM products;

SELECT product_id, name, COUNT(quantity_in_stock)
FROM products
WHERE product_id >= 5;


SELECT *
FROM customers;

-- GROUP BY
SELECT state, SUM(points), COUNT(customer_id)
FROM customers
GROUP BY state;

SELECT *
FROM orders;

-- for every status show the number of orders
SELECT status, COUNT(order_id)
FROM orders
GROUP BY status

USE sql_invoicing;
SELECT *
FROM invoices;


-- total invoice per client
SELECT client_id, SUM(invoice_total), COUNT(invoice_id)
FROM invoices
GROUP BY client_id;

-- show total invoices of client, for only those clients who had more than 2 invoices
SELECT client_id, SUM(invoice_total), COUNT(invoice_id)
FROM invoices
GROUP BY client_id
HAVING COUNT(invoice_id) >= 2;

-- show total invoice per client
-- consider only those invoices which have a payment date
-- show only those client which have made atleast 2 invoices

SELECT client_id, SUM(invoice_total), COUNT(invoice_id)
FROM invoices
WHERE payment_date IS NOT NULL
GROUP BY client_id
HAVING COUNT(*) >= 2;

-- GROUP BY on multiple clauses


USE sql_store;




SELECT * FROM customers;
SELECT * FROM orders; -- 1 customer can make many orders
SELECT * FROM order_items; -- 1 order may contain multiple products


-- customer_id, total number of items bought by each customers
SELECT c.customer_id, SUM(oi.quantity)
FROM customers c
JOIN orders o
	ON c.customer_id = o.customer_id
JOIN order_items oi
	ON o.order_id = oi.order_id
GROUP BY c.customer_id


UPDATE customers
SET points = NULL
WHERE points = -1 and customer_id >= 1;


SELECT points, COALESCE(points, 0)
FROM customers;

SELECT COUNT(points), COUNT(COALESCE(points, 0))
FROM customers;


