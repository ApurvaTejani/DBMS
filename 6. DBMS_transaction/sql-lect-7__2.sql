USE sql_store;

SELECT * FROM products;

start transaction;

UPDATE products
SET name = 'GHI'
WHERE product_id = 10;

SELECT * FROM products;

commit;
rollback;
