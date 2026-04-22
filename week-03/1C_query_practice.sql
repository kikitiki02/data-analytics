-- Write a query to list the product id, product name, and unit price of every product. This time, display them in ascending order by price.
Use northwind;
SELECT ProductID,ProductName,UnitPrice 
FROM products
ORDER BY UnitPrice ASC;

-- What are the products that we carry where we have at least 100 units on hand? Order them in descending order by price.
Use northwind;
SELECT ProductName,UnitsInStock,UnitPrice
FROM products
WHERE UnitsInStock >= 100
ORDER BY UnitPrice DESC;
/* the products that have at least 100 units in stock are, Sirop d'rable, Sasquatch Ale, Rhnbru Klosterbier,Rd Kaviar,Pt chinois, Inlagd Sill, Gustaf's Knckebrd,Grandma's Boysenberry Spread, Geitost, Boston Crab Meat.*/

-- What are the products that we carry where we have at least 100 units on hand? Order them in descending order by price. If two or more have the same price, list those in ascending order by product name.
Use northwind;
SELECT ProductName,UnitsInStock,UnitPrice
FROM products
WHERE UnitsInStock >= 100
ORDER BY UnitPrice DESC, ProductName ASC;

-- Write a query against the orders table that displays the total number of distinct customers who have placed orders, based on customer ID. Use an alias to label the count calculation as CustomerCount largest to smallest
Use northwind;
SELECT COUNT(DISTINCT CustomerID) AS CustomerCount
FROM orders
ORDER BY CustomerCount DESC;
/* theres 89 distict customers*/

-- Write a query against the orders table that displays the total number of distinct customers who have placed orders, by customer ID, for each country where orders have been shipped. Again, use an alias to label the count as CustomerCount. Order the list by the CustomerCount, largest to smallest.
Use northwind;
SELECT ShipCountry,COUNT(DISTINCT CustomerID) AS CustomerCount
FROM orders
GROUP BY ShipCountry
ORDER BY CustomerCount DESC;
/* US-13, Ger-11, Fr-10, Br-9, UK-7, Mex-5, Spain-Ven-4, Arg-Can-It-3*/

-- What are the products that we carry where we have less than 25 units on hand, but 1 or more units of them are on order? Write a query that orders them by quantity on order (high to low), then by product name
Use northwind;
SELECT UnitsInStock, ProductName, UnitsOnOrder
FROM products 
WHERE UnitsInStock < 25
	AND UnitsOnOrder >= 1
ORDER BY UnitsOnOrder DESC, ProductName ASC;
/* Louisiana Hot Spiced Okra has 4 in stock and 100 units on order */

-- Write a query to list each of the job titles in employees, along with a count of how many employees hold each job title.
Use northwind;
SELECT Title, COUNT(DISTINCT EmployeeID) AS EmployeeCount
FROM employees
GROUP BY Title;
/* sales representative-6, Inside Sales Coordinator-1, Sales Manager-1, Vice President-1 */

-- What employees have a monthly salary that is between $2000 and $2500? Write a query that orders them by job title.
Use northwind;
SELECT EmployeeID, FirstName, Salary, Title
FROM employees
WHERE salary BETWEEN 2000 AND 2500 
ORDER BY Title;
/* Laura, Anne, Michael, and Andrew */