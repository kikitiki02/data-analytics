-- Write a query to find the price of the cheapest item that Northwind sells. Then write a second query to find the name of the product that has that price
USE northwind;
SELECT UnitPrice
FROM products
ORDER BY UnitPrice ASC;
/* the chepaest item is $2.50 */

USE northwind;
SELECT ProductName, UnitPrice
FROM products
WHERE UnitPrice = '2.5000';
/* The product name is Geitost */

-- Write a query to find the average price of all items that Northwind sells
USE northwind;
SELECT AVG(UnitPrice) AS ap
FROM products;
/* The average price is $28.86 */

-- Write a query to find the price of the most expensive item that Northwind sells. Then write a second query to find the name of the product with that price, plus the name of the supplier for that product
USE northwind;
SELECT UnitPrice
FROM products
ORDER BY UnitPrice DESC;
/* The most expensive item is $263.50 */

USE northwind;
SELECT ProductName, UnitPrice, CompanyName
FROM products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE UnitPrice = '263.5000'
ORDER BY UnitPrice DESC;
/* The product is Cte de Blaye and the company is Aux joyeux ecclsiatiques */

-- Write a query to find total monthly payroll (the sum of all the employees’ monthly salaries)
USE northwind;
SELECT SUM(Salary) 
FROM employees;
/* The total monthly payroll is $20,362.92 */

-- Write a query to identify the highest salary and the lowest salary amounts which any employee makes.
USE northwind;
SELECT MAX(Salary) AS highsalary, MIN(Salary) AS lowsalary
FROM employees;
/* Highest: $3,119.15 Lowest: $1,744.21 */

-- Write a query to find the name and supplier ID of each supplier and the number of items they supply.
USE northwind;
SELECT suppliers.SupplierID,suppliers.CompanyName, COUNT(products.ProductID) AS NumberofItems
FROM suppliers
JOIN products ON suppliers.SupplierID = products.SupplierID
GROUP BY suppliers.SupplierID, suppliers.CompanyName;


-- Write a query to find the list of all category names and the average price for items in each category
USE northwind;
SELECT CategoryName, AVG(UnitPrice) AS AP
FROM products
JOIN categories ON categories.CategoryID = products.CategoryID
GROUP BY CategoryName;
/* Bevs:$37.97,Cond:$23.06,Conf:$25.16,Dairy:$28.73,Grain:$20.25,Meat:$54.00,Produce:$32.37,Seafood:$20.68 */

-- Write a query to find, for all suppliers that provide at least 5 items to Northwind, what is the name of each supplier and the number of items they supply
USE northwind;
SELECT suppliers.CompanyName,COUNT(products.ProductID) AS NumberOfItems
FROM suppliers
JOIN products ON suppliers.SupplierID = products.SupplierID
GROUP BY suppliers.SupplierID, suppliers.CompanyName
HAVING COUNT(products.ProductID) >= 5;
/* Pavlova, LTD and Plutzer Lebensmittelgromrkte AG */

-- Write a query to list products currently in inventory by the product id, product name, and inventory value (calculated by multiplying unit price by the number of units on hand). Sort the results in descending order by value. If two or more have the same value, order by product name
USE northwind;
SELECT ProductID,ProductName, UnitsInStock * UnitPrice AS inventoryvalue
FROM products
ORDER BY inventoryvalue DESC, ProductName ASC
