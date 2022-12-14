1.
-- Table: World

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | name        | varchar |
-- | continent   | varchar |
-- | area        | int     |
-- | population  | int     |
-- | gdp         | int     |
-- +-------------+---------+
-- name is the primary key column for this table.
-- A country is big if:

-- it has an area of at least three million (i.e., 3000000 km2), or
-- it has a population of at least twenty-five million (i.e., 25000000).
-- Write an SQL query to report the name, population, and area of the big countries.

-- Return the result table in any order.

SELECT name, population, area
FROM world
WHERE area >= 3000000 or population >= 25000000;

2.
-- Table: Courses
-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | student     | varchar |
-- | class       | varchar |
-- +-------------+---------+
-- (student, class) is the primary key column for this table.
-- Each row of this table indicates the name of a student and the class in which they are enrolled.
--  

-- Write an SQL query to report all the classes that have at least five students.

-- Return the result table in any order.

SELECT class
FROM courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;


3.
-- Table: Customer

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- | referee_id  | int     |
-- +-------------+---------+
-- id is the primary key column for this table.
-- Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
--  

-- Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.

-- Return the result table in any order.

SELECT name 
FROM Customer
WHERE referee_id != 2 or referee_id is null;

4.
-- Table: Products

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | product_id  | int     |
-- | low_fats    | enum    |
-- | recyclable  | enum    |
-- +-------------+---------+
-- product_id is the primary key for this table.
-- low_fats is an ENUM of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
-- recyclable is an ENUM of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.
--  

-- Write an SQL query to find the ids of products that are both low fat and recyclable.

-- Return the result table in any order.

SELECT product_id 
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

5.
-- Table: Customers

-- +-------------+---------+
-- | Column Name | Type    |
-- +-------------+---------+
-- | id          | int     |
-- | name        | varchar |
-- +-------------+---------+
-- id is the primary key column for this table.
-- Each row of this table indicates the ID and name of a customer.
--  

-- Table: Orders

-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | customerId  | int  |
-- +-------------+------+
-- id is the primary key column for this table.
-- customerId is a foreign key of the ID from the Customers table.
-- Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
--  

-- Write an SQL query to report all customers who never order anything.

-- Return the result table in any order.

SELECT name AS Customers
FROM Customers
LEFT JOIN Orders 
ON Customers.id = Orders.CustomerId
WHERE Orders.customerId IS NULL;