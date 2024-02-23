USE sql_store;

SELECT * FROM products;
SELECT * FROM order_items;

WITH prd_oi_map (pid, qty) AS
(
	SELECT p.product_id, IFNULL(oi.quantity, 0)
    FROM products p
    LEFT JOIN order_items oi
		ON p.product_id = oi.product_id
), prd_oqty_map (pid, oqty) AS
(
	SELECT pid, SUM(qty)
    FROM prd_oi_map
    GROUP BY pid
), prd_rqty_map (pid, pname, qis, oqty, rqty) AS
(
	SELECT p.product_id, p.name, p.quantity_in_stock, pom.oqty, (p.quantity_in_stock - pom.oqty) 
    FROM products p
    JOIN prd_oqty_map pom
		ON p.product_id = pom.pid
)
SELECT * FROM prd_rqty_map;

-- Recursive CTE
-- Fibonacci = Familiarity with syntax

-- 0th = 0
-- 1st = 1
-- 2nd = 1
-- 3rd = 2
-- 4th = 3
-- 5th = 5
-- 6th = 8
WITH RECURSIVE fib (n, nf, nm1f) AS
(
	-- base case
    -- UNION
    -- iteration case
    SELECT 1, 1, 0
    UNION
    SELECT n + 1, nf + nm1f, nf FROM fib WHERE n <= 10
)
SELECT n, nf, nm1f FROM fib;

-- n, 	nf, 	nm1f
-- 1, 	1, 		0
-- 2, 	1, 		1
-- 3, 	2, 		1




-- Employees = Real life example
USE sql_hr;
SELECT * FROM employees;

-- BREAK = 10:49 to 10:54
WITH RECURSIVE org_str (eid, mgrid, name, path_to_top) AS
(
	SELECT employee_id, reports_to, first_name, CAST(employee_id AS CHAR(100)) FROM employees 
    WHERE reports_to IS NULL
    UNION
    SELECT e.employee_id, e.reports_to, e.first_name, CONCAT(e.employee_id, ' -> ', m.path_to_top)
    FROM employees e
    JOIN org_str m ON e.reports_to = m.eid
)
SELECT * FROM org_str;

-- 37270 null yovonda 37270
-- 33391 37270 darcy 33391->37270
-- 37851 37270 sayer 37851->37270
-- 40448
-- 
--
--
