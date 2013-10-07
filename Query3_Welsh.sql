-- 1
SELECT city 
FROM agents 
WHERE aid IN (
 SELECT aid 
 FROM orders 
 WHERE cid = 'c002');
 
-- 2
SELECT city 
FROM agents
JOIN orders ON agents.aid = orders.aid
WHERE cid = 'c002'; 

-- 3
SELECT DISTINCT pid
FROM orders
WHERE aid IN (SELECT aid
FROM orders
WHERE cid IN (SELECT cid
FROM customers
WHERE city = 'Kyoto'))
 
-- 4
SELECT DISTINCT o1.pid
FROM orders o1, orders o2, customers c
WHERE o2.cid = c.cid AND c.city = 'Kyoto' AND o1.aid = o2.aid
ORDER BY o1.pid

--5
SELECT name 
FROM customers 
WHERE cid NOT IN (
SELECT cid FROM orders)

--6
SELECT name
FROM customers LEFT OUTER JOIN orders ON orders.cid = customers.cid
WHERE orders.ordno IS NULL

--7
SELECT DISTINCT customers.name, 
agents.name
FROM customers, orders, agents
WHERE orders.cid = customers.cid AND 
orders.aid = agents.aid AND 
customers.city = agents.city

-- 8 
SELECT customers.name, agents.name, agents.city
FROM customers, agents
WHERE customers.city = agents.city
ORDER BY agents.city

--9
SELECT city, name
FROM customers
WHERE city IN (
SELECT city FROM(
SELECT products.city, count(products.city) 
FROM products
GROUP BY products.city 
ORDER BY count ASC
LIMIT 1
)sub1
)

--10
SELECT city, name
FROM customers
WHERE city IN (
SELECT city from(
SELECT products.city, count(products.city) 
FROM products
GROUP BY products.city 
ORDER BY count DESC
LIMIT 1
)sub1
)


--11
SELECT custumer.name = products.city
customers.city(SELECT city, count(city)
FROM products 
GROUP BY city
HAVING count(city) IN
SELECT max(count(city) 
FROM (SELECT count(city)
FROM products
GROUP BY city)
)sub1

--12
SELECT *
FROM products
GROUP BY products.pid
HAVING products.priceusd > 
(SELECT avg(priceUSD)
FROM products)

--13
SELECT customers.name, orders.pid, orders.dollars
FROM customers, orders
WHERE orders.cid = customers.cid
ORDER BY orders.dollars DESC

--14
SELECT customers.name, COALESCE(sum(orders.qty), 0)
FROM customers LEFT OUTER JOIN orders ON orders.cid = customers.cid
GROUP BY customers.cid
ORDER BY customers.name

--15
SELECT customers.name, products.name, agents.name
FROM customers, products, agents, orders
WHERE orders.cid = customers.cid 
AND orders.pid = products.pid 
AND orders.aid = agents.aid 
AND agents.city = 'New York'

--16
SELECT orders.ordno, orders.dollars, ((products.priceusd * orders.qty) - 
((customers.discount / 100) * 
(products.priceusd * orders.qty)))
FROM orders, products, customers 
WHERE orders.cid = customers.cid 
AND orders.pid = products.pid
AND orders.dollars <> ((products.priceusd * orders.qty) 
-((customers.discount / 100) 
*(products.priceusd * orders.qty)))

--17
UPDATE orders
SET dollars = 1000
WHERE dollars = 500
