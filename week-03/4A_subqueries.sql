-- What is the product name(s) of the most expensive products?
USE northwind;
SELECT CategoryName,ProductName, MAX(UnitPrice) AS Mp
FROM products
JOIN categories ON categories.CategoryID = products.CategoryID
GROUP BY CategoryName, ProductName
ORDER BY Mp DESC;
/* The most expensive product is a beverage called Cte de Blaye for $263.50 */

-- What is the product name(s) and categories of the least expensive products?
USE northwind;
SELECT CategoryName,ProductName, MIN(UnitPrice) AS Mp
FROM products
JOIN categories ON categories.CategoryID = products.CategoryID
GROUP BY CategoryName, ProductName
ORDER BY Mp ASC;
/* The least expensive is a dairy product called Geitost for $2.50 */

-- What is the order id, shipping name and shipping address of all orders shipped via "Federal Shipping"?
USE northwind;
SELECT OrderID, ShipName, ShipAddress
FROM orders
JOIN shippers ON orders.ShipVia = shippers.ShipperID
WHERE CompanyName = 'Federal Shipping';
/* 255 Order ID's shipped federal shipping */

-- What are the order ids of the orders that included "Sasquatch Ale"?
USE northwind;
SELECT DISTINCT orders.OrderID
FROM orders
JOIN `order details` ON `order details`.OrderID = orders.OrderID
JOIN products ON products.ProductID = `order details`.ProductID
WHERE ProductName = 'Sasquatch Ale';
/* 19 Order Id's come back */

-- What is the name of the employee that sold order 10266?
USE northwind;
SELECT FirstName, LastName
FROM employees
JOIN orders ON orders.employeeID = employees.employeeID
WHERE OrderID = 10266;
/* Janet Leverling sold order 10266 */

-- What is the name of the customer that bought order 10266?
USE northwind;
SELECT ContactName
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
WHERE OrderID = 10266;
/* Pirkko Koskitalo bought order 10266 */
