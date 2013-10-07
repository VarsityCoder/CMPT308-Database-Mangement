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
select distinct pid
from orders
join orders on customers.cid = order.aid
where city = 'Kyoto';

--5
select name 
from customers 
where cid not in (
select cid from orders)