USE sql_store;

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM products;

CREATE VIEW CityWiseProductSale AS
SELECT c.city, p.name, SUM(oi.quantity)
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.city, p.name;

SELECT * FROM CityWiseProductSale
WHERE city LIKE '%ton';

DROP VIEW CityWiseProductSale;

SELECT * FROM customers;

-- IF
SELECT customer_id, first_name, points, IF(points >= 1000, "HNI", "Regular") AS Type
FROM customers;

-- CASE
SELECT customer_id, first_name, points, 
	   CASE 
			WHEN points >= 1000 THEN 'P0'
            WHEN points >= 500 THEN 'P1'
            WHEN points >= 100 THEN 'P2'
            ELSE 'P3'
		END AS Priority
FROM customers;

SELECT * FROM customers;

-- IFNULL
SELECT first_name, birth_date, phone, IFNULL(birth_date, 'Age not known'), IFNULL(phone, "No Phone")
FROM customers;

-- COALESCE
SELECT first_name, birth_date, phone, COALESCE(birth_date, phone, 'Unknown')
FROM customers;

SELECT * FROM customers;
-- Windowing fns 
SELECT customer_id, first_name, state, points, 
	   ROW_NUMBER() OVER (ORDER BY points DESC) AS RN,
	   RANK() OVER (ORDER BY points DESC) AS Rk,
	   DENSE_RANK() OVER (ORDER BY points DESC) AS DRk
FROM customers;

-- windowing fns with partition by
SELECT *
FROM
(
	SELECT customer_id, first_name, state, points, 
		   ROW_NUMBER() OVER (PARTITION BY state ORDER BY points DESC) AS RN,
		   RANK() OVER (PARTITION BY state ORDER BY points DESC) AS Rk,
		   DENSE_RANK() OVER (PARTITION BY state ORDER BY points DESC) AS DRk
	FROM customers
) Tbl
WHERE Tbl.RN = 2;

-- UNION and UNION ALL
-- Rules
	-- Both should have equal number of columns
    -- They should be ordered in same order of data types
    -- Name of columns of 1st result set are preserved
SELECT * FROM customers;
SELECT * FROM shippers;


SELECT customer_id, first_name
FROM customers

UNION ALL

SELECT shipper_id, name
FROM shippers;






