-- https://www.w3schools.com/Sql/tryit.asp?filename=trysql_select_top

-- find all customers that live in London. Returns 6 records.
-- This can be done with SELECT and WHERE clauses

SELECT * 
FROM CUSTOMERS 
WHERE City = 'London';

-- find all customers with postal code 1010.
-- Returns 3 customers.
-- This can be done with SELECT and WHERE clauses

SELECT * 
FROM CUSTOMERS 
WHERE PostalCode = '1010';

-- find the phone number for the supplier with the id 11.
-- Should be (010) 9984510.
-- This can be done with SELECT and WHERE clauses

SELECT * 
FROM SUPPLIERS
WHERE SupplierID = 11;

-- list orders descending by the order date.
-- The order with date 1997-02-12 should be at the top.
-- This can be done with SELECT, WHERE, and ORDER BY clauses

SELECT *
FROM ORDERS
ORDER BY OrderDate DESC;

-- find all suppliers who have names longer than 20 characters. You can use length(SupplierName) to get the length of the name. Returns 11 records.
-- This can be done with SELECT and WHERE clauses

SELECT * 
FROM SUPPLIERS
WHERE LENGTH(SupplierName) > 20;

-- find all customers that include the word "market" in the name. Should return 4 records.
-- This can be done with SELECT and a WHERE clause using the LIKE keyword
-- Don't forget the wildcard '%' symbols at the beginning and end of your substring to denote it can appear anywhere in the string in question

SELECT * 
FROM CUSTOMERS
WHERE CustomerName LIKE '%market%';

-- add a customer record for "The Shire" the contact name is "Bilbo Baggins" the address is "1 Hobbit-Hole" in "Bag End", postal code "111" and the country is "Middle Earth".
-- This can be done with the INSERT INTO clause

INSERT INTO CUSTOMERS (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('The Shire', 'Bilbo Baggins', '1 Hobbit-Hole', 'Bag End', '111', 'Middle Earth');

-- update Bilbo Baggins record so that the postal code changes to "11122".
-- This can be done with UPDATE and WHERE clauses

UPDATE CUSTOMERS
SET PostalCode = '11122';

-- list orders grouped by customer showing the number of orders per customer.
-- Rattlesnake Canyon Grocery should have 7 orders.
-- This can be done with SELECT, COUNT, JOIN and GROUP BY clauses.
-- Your count should focus on a field in the Orders table, not the Customer table
-- There is more information about the COUNT clause on W3 Schools

SELECT COUNT(ORDERS.CustomerID) AS ORDERS, CUSTOMERS.CustomerName
FROM ORDERS
LEFT JOIN CUSTOMERS
ON CUSTOMERS.CustomerID = ORDERS.CustomerID
GROUP BY CustomerName;

-- list customers names and the number of orders per customer.
-- Sort the list by number of orders in descending order.
-- Ernst Handel should be at the top with 10 orders followed by QUICK-Stop, Rattlesnake Canyon Grocery and Wartian Herkku with 7 orders each.
-- This can be done by adding an ORDER BY clause to the previous answer

SELECT COUNT(ORDERS.CustomerID) AS ORDERS, CUSTOMERS.CustomerName
FROM ORDERS
LEFT JOIN CUSTOMERS
ON CUSTOMERS.CustomerID = ORDERS.CustomerID
GROUP BY CustomerName
ORDER BY ORDERS DESC;

-- list orders grouped by customer's city showing number of orders per city. 
-- Returns 58 Records with Aachen showing 2 orders and Albuquerque showing 7 orders.
-- This is very similar to the previous two queries, however, it focuses on the City rather than the CustomerName

SELECT COUNT(ORDERS.CustomerID) AS ORDERS, CUSTOMERS.City
FROM ORDERS
LEFT JOIN CUSTOMERS
ON CUSTOMERS.CustomerID = ORDERS.CustomerID
GROUP BY City;

-- delete all customers that have no orders.
-- Should delete 17 (or 18 if you haven't deleted the record added) records.
-- This is done with a DELETE query
-- In the WHERE clause, you can provide another list with an IN keyword this list can be the result of another SELECT query. 
-- Write a query to return a list of CustomerIDs that meet the criteria above. 
-- Pass that to the IN keyword of the WHERE clause as the list of IDs to be deleted
-- Use a LEFT JOIN to join the Orders table onto the Customers table and check for a NULL value in the OrderID column

DELETE FROM CUSTOMERS
WHERE CustomerID NOT IN (
  SELECT CustomerID
  FROM ORDERS); 