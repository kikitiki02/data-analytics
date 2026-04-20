-- Write a query to list the product id, product name, and unit price of every product that Northwinds sells.
Use northwind;
SELECT ProductID, ProductName, UnitPrice
FROM products;

-- Write a query to identify the products where the unit price is $7.50 or less.
Use northwind;
SELECT ProductName,UnitPrice
FROM products
WHERE UnitPrice < 7.50;

-- What are the products that we carry where we have no units on hand, but 1 or more units are on backorder?
Use northwind;
SELECT ProductName,UnitsInStock,UnitsOnOrder
FROM products 
WHERE UnitsInStock = 0
	AND UnitsOnOrder >= 1;
    
-- Examine the products table. How does it identify the type (category) of each item sold? Where can you find a list of all categories? Write a set of queries to answer these questions, ending with a query that creates a list of all the seafood items we carry.
Use northwind;
SELECT ProductName, CategoryID
FROM products;

Use northwind;
SELECT CategoryID,CategoryName
FROM categories;

Use northwind;
SELECT CategoryName,ProductName
FROM products,categories
WHERE CategoryName = 'Seafood';
/* theres 77 seafood items*/

-- Examine the products table again. How do you know what supplier each product comes from? Where can you find info on suppliers? Write a set of queries to find the specific identifier for "Tokyo Traders" and then find all products from that supplier.
Use northwind;
SELECT SupplierID,CompanyName
FROM suppliers;
/* the tokyo traders supplier ID is 4*/

Use northwind;
SELECT SupplierID,ProductName 
FROM products
WHERE SupplierID = 4;
/* Tokyo Traders sell 3 items. Mishi Kobe Niku, Ikura, and Longlife Tofu.*/

-- How many employees work at northwind? What employees have "manager" somewhere in their job title?
Use northwind;
SELECT EmployeeID,Title 
FROM employees
WHERE Title LIKE '%Manager%';
/* 9 employees work here and only one is a Sales Manager */


