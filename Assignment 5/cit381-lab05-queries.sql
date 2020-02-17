-- CIT 381
-- Lab 05
-- Lillie Rose
-- Create a WHERE subquery that returns the customer with the minimum payment (customer number 398)
SELECT 
    c.customerName,
    c.customerNumber,
    p.amount
FROM
    payments p
    inner join customers c on c.customerNumber = p.customerNumber
WHERE
    amount = (SELECT MIN(amount) FROM payments);
-- Create a WHERE subquery that returns customer that have <= the average payment (108 rows returned)
SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount <= (SELECT 
            AVG(amount)
        FROM
            payments);
-- Create a WHERE subquery that returns the number of customers that have placed an order (the number should be 98)
SELECT 
    customerName
FROM
    customers
WHERE
    customerNumber IN (SELECT DISTINCT
            customerNumber
        FROM
            orders);
-- Create a FROM subquery that creates a temporary table of products with a quantityInStock > 10 and returns maximum buyPrice and minimum buyPrice (should return one row of 103.42 and 15.91)
SELECT 
    MAX(buyPrice), 
    MIN(buyPrice)
FROM
    (SELECT buyPrice from products
    where quantityInStock > 10)
    as quantity;
-- Create a WHERE correlated subquery that returns products where the quantityInStock >= average quantityOrdered found in the orderDetails table (108 rows returned)
SELECT
	p.productName
FROM products p
INNER JOIN orderdetails o ON p.productCode = o.productCode
WHERE  
p.quantityInStock >= AVG(o.quantityOrdered);
