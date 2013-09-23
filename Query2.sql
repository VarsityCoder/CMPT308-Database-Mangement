--1
-- This query gest the cities of agents booking an order for customer c002
select city 
from agents 
WHERE aid in (
 select aid 
 FROM orders 
 WHERE cid = 'c002');
--2
-- This query gives the pids of products ordered through any agent who makes at least one oreder for a customer in Kyoto
select name 
from products 
WHERE pid in (
 select pid 
 FROM orders 
 WHERE cid = 'c006');
--3
-- This query gives the cids and names of customers who never placed an order through agent a03
select name,cid 
from customers 
WHERE cid not in (
 select cid 
 FROM orders 
 WHERE aid = 'a03');

--4
-- This query gives the cids and names of customers who ordered both product p01 and p07
select name,cid 
from customers 
WHERE cid in 
(
  (
 select cid 
 FROM orders
  WHERE pid = 'p01') 
  and (
  select cid F
  ROM orders 
  WHERE pid = 'p07'
  )
    );
--5
-- This query gives the pids of products ordered by any customer who ever placed an order through agent a03
select name,cid 
from customers 
WHERE cid in (
 select cid 
 FROM orders 
 WHERE aid = 'a03');
--6
-- This query gives the names and discounts of all customers who place orders through agents in Dallas or Duluth
select name,discount
from customers 
WHERE cid in (
select distinct cid
 FROM orders
 WHERE aid = 'a05' or aid = 'a06');
--7
-- This query gives the information on all customers who have the same discount as that of any customers in Dallas or Kyoto
select name, city, discount
from customers
where cid not in (
    select cid
    from customers
    where city = 'Dallas' or city = 'Kyoto'
)
and discount in (
    select discount
    from customers
    where city = 'Dallas' or city = 'Kyoto'
)

