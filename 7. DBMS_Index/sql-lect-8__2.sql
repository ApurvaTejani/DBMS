-- SHOW, CREATE, DROP, EXPLAIN

USE sql_store;
SELECT * FROM customers;

show index in customers;

SELECT * FROM customers WHERE customer_id = 10;
EXPLAIN SELECT * FROM customers WHERE customer_id = 10;

SELECT * FROM customers WHERE points = 2794;
EXPLAIN SELECT * FROM customers WHERE points = 2794;

CREATE INDEX idx_customers_points ON customers(points);
DROP INDEX idx_customers_points ON customers;

SELECT * FROM customers WHERE first_name = 'abc';
EXPLAIN SELECT * FROM customers WHERE first_name = 'abc';

-- 0 = 19: 1+18
-- 1 = 6: 1+5
-- 2 = 4: 1+3
-- 3 = 3: 1+2
-- 4 = 1: 1+0


CREATE INDEX idx_customers_fn ON customers(first_name(4));
DROP INDEX idx_customers_fn ON customers;
