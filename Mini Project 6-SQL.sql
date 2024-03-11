show databases;
use project;
show tables;
select * from customers;
select * from offices;
select * from orders;
select * from orderdetails;

-- 1 Write a SQL query to retrieve the first 5 rows from the "customers" table
select * from customers limit 5;

-- 2 Write a SQL query to retrieve the unique city names from "customers" table sorted in descending order.
select distinct city from customers order by city desc;

-- 3 Write a SQL query to get the number of unique city names "offices" table.
select count(distinct city) from offices;

-- 4 Write a SQL query to get the maximum, minimum and average value from the "age" column in the "customers" table
select max(creditLimit) as max_creditLimit, min(creditLimit) as min_creditLimit, avg(creditLimit) as avg_creditLimit from customers;

-- 5 Write a SQL query to get the city names which are present in “offices” table but not in “customer” table.
select city from offices where city NOT IN (select city from customers);

-- 6 Write a SQL query to get the city names which are present in “offices” table as well as in “customer” table.
select city from offices where city IN (select city from customers);

-- 7 Write a SQL query to get records where city or state is not given in “customer” table and creditlimit is in the range – 80000 to 130000.
select * from customers
where (city or state is null) and 8000< creditlimit <130000;

-- 8 (x) Write a SQL query to get the maximum number of orders placed on a particular date and what is that date in orders table 
select orderDate, COUNT(*) as orderNumber
from orders
group by orderDate
order by orderNumber desc; -- LIMIT 1;

-- 9 (x) For the records which we get in previous question(Q8), write a SQL query to get the customer names and their phone numbers.

-- 10 SQL query to get the customer phone number and customer name from customers table where order is either cancelled or disputed in orders table
select  a.phone, a.customerName from customers as a
join orders as b on a.customerNumber = b.customerNumber
where b.status in ('cancelled', 'disputed');

-- 11 Write a SQL query to get the top 4 highest selling products from orderdetails table.
select * from orderdetails;
select p.productCode, sum(quantityOrdered) AS HSP
from orderdetails
group by productCode
order by priceEach DESC
LIMIT 4;

-- 12 (x)  Write a SQL query to get the count of orders placed by each customer in 2003 and 2004
SELECT customerNumber, COUNT(*) AS order_count
FROM orders
WHERE YEAR(orderDate) >= 2003 AND YEAR(orderDate) <= 2004
GROUP BY customerNumber;

-- 13  Write a SQL query to get the city names from customer table where more than 4 customers reside
select city from customers
group by city
having count(*) > 4;

