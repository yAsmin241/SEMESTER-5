CREATE DATABASE index_lab;
USE index_lab;

CREATE TABLE orders (
	order_id INT,
    customer_id INT,
    product_id INT,
    order_date DATE,
    total DECIMAL (10,2)
);

INSERT INTO orders (order_id, customer_id, product_id, order_date, total)
VALUES 
	(001, 1, 10, '2024-02-01', 129.99),
	(002, 2, 10, '2024-02-02', 159.50),
	(003, 2, 10, '2024-02-03', 89.99),
	(004, 3, 11, '2024-02-04', 249.00),
	(005, 1, 12, '2024-02-05', 179.99),
	(006, 4, 10, '2024-02-06', 99.99),
	(007, 2, 13, '2024-02-07', 119.50),
	(008, 5, 14, '2024-02-08', 299.99),
	(009, 3, 10, '2024-02-09', 139.00),
	(010, 4, 15, '2024-02-10', 199.99),
	(011, 1, 11, '2024-02-11', 89.50),
	(012, 5, 10, '2024-02-12', 149.99),
	(013, 2, 12, '2024-02-13', 219.00),
	(014, 3, 13, '2024-02-14', 169.99),
	(015, 2, 10, '2024-02-15', 109.50);
	
CREATE INDEX idx_cust_prod 
ON orders(customer_id, product_id);

SELECT * FROM orders
WHERE customer_id = 2 AND product_id = 10;

EXPLAIN SELECT * FROM orders
WHERE customer_id = 2 AND product_id = 10;

SELECT * FROM orders
WHERE product_id = 10;

EXPLAIN SELECT * FROM orders
WHERE product_id = 10;

DROP INDEX idx_cust_prod ON orders;

CREATE INDEX idx_prod_cust
ON orders(product_id, customer_id);

SELECT * FROM orders
WHERE customer_id = 2 AND product_id = 10;

EXPLAIN SELECT * FROM orders
WHERE customer_id = 2 AND product_id = 10;

SELECT * FROM orders
WHERE product_id = 10;

EXPLAIN SELECT * FROM orders
WHERE product_id = 10;