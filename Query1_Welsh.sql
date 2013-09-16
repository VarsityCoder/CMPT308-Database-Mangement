--1. This query shows all of the Customer information
SELECT * FROM Customers;

--2. This query shows all agents named Smith
SELECT name, city FROM Agents WHERE name = 'Smith';

--3. This query shows the pid, name and quantity of all products costing more than USD 1.25
SELECT pid, name, quantity FROM Products WHERE priceUSD > 1.25;

--4. This query shows the Order Number aid from all of the orders
SELECT ordno, aid FROM Orders;

--5. This query shows the names and cities of customers not in Dallas
SELECT name, city FROM Customers WHERE city =! 'Dallas';

--6.This query of shows the names of all agents in New York and Newark
SELECT name FROM Agents WHERE city = 'New York' OR city = 'Newark';

--7. This query shows all data for not in New York or Newark that cost USD 1 or less
SELECT * FROM Products WHERE city <> 'New York' AND city <> 'Newark' AND priceUSD <= 1.00;

--8. This query shows all orders in January and March 
SELECT * FROM Orders WHERE mon = 'jan' OR mon = 'mar';

--9. This query doesn't show anything in this database but it is supposed to show all of the orders from February less than USD 100.
SELECT * FROM Orders WHERE mon = 'feb' AND dollars < 100.00;

-- 10. This query doesn't show anything in this database but it is supposed to show all of the orders associated with c005.
SELECT * FROM Orders WHERE cid = 'c005';
