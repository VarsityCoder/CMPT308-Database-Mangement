-- 1
select city 
from agents 
WHERE aid in (
 select aid 
 FROM orders 
 WHERE cid = 'c002');
 
-- 2
select city 
from agents
join orders on agents.aid = orders.aid
where cid = 'c002'; 

-- 3
select distinct pid
from orders
where aid in (select aid
from orders
where cid in (select cid
from customers
where city = 'Kyoto'))
 
-- 4
select distinct o1.pid
from orders o1, orders o2, customers c
where o2.cid = c.cid and c.city = 'Kyoto' AND o1.aid = o2.aid
order by o1.pid
--5
select name 
from customers 
where cid not in (
select cid from orders)

--6
SELECT name
FROM customers left outer join orders on orders.cid = customers.cid
where orders.ordno IS NULL

--7
