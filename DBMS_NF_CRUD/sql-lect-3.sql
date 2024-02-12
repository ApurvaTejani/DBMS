USE sql_store;

SELECT *
FROM customers;

-- Insert 1 row
INSERT INTO customers
VALUES
(DEFAULT, "ABC", "DEF", "1988-08-11", "999", "Ghaziabad", "Atlanta", "GA", 800);


-- Insert multiple
INSERT INTO customers
VALUES
(12, "ABC", "DEF", "1988-08-11", "999", "Ghaziabad", "Atlanta", "GA", 800),
(13, "ABC", "DEF", "1988-08-11", "999", "Ghaziabad", "Atlanta", "GA", 800);

-- Skip the columns with default values and nulls
INSERT INTO customers
VALUES
(DEFAULT, "ABC", "DEF", "1988-08-11", "999", "Ghaziabad", "Atlanta", "GA", 800);

INSERT INTO customers
VALUES
(DEFAULT, "ABC", "DEF", DEFAULT, DEFAULT, "Ghaziabad", "Atlanta", "GA", DEFAULT);

-- named columns
INSERT INTO customers (first_name, last_name, address, city, state)
VALUES ("Sumeet", "Malik", "Sec 63", "Noida", "UP");

-- named columns : leave columns with default, ai or null
-- named columns: reorder the columns also
INSERT INTO customers (state, first_name, last_name, address, city)
VALUES ("UP", "Sumeet", "Malik", "Sec 63", "Noida");


CREATE Table students (
	id INT PRIMARY KEY AUTO_INCREMENT,
    points INT DEFAULT(0),
    name VARCHAR(10)
);

INSERT INTO students (name)
VALUES ("A");

SELECT * FROM students;

-- Updates

UPDATE customers
SET first_name = 'A', last_name = 'B'
WHERE customer_id = 17;

UPDATE customers
SET points = points + 1000
WHERE customer_id IN (10, 11, 12);

UPDATE customers
SET points = 0
WHERE points % 2 = 1 AND customer_id > 0;

-- Always start an update query from the where clause

-- DELETE
DELETE FROM customers
WHERE customer_id = 18;


-- INSERT
INSERT INTO customers (first_name, last_name, state, city, address)
VALUES("A", "B", "UP", "Noida", "Sec 63");






