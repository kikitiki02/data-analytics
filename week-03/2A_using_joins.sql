-- Create a single query to list the product id, product name, unit price and category name of all products. Order by category name and within that, by product name.
USE northwind;
SELECT ProductID,ProductName,UnitPrice,CategoryName
FROM products 
JOIN categories ON products.CategoryID = categories.CategoryID
ORDER BY CategoryName,ProductName;

-- Create a single query to list the product id, product name, unit price and supplier name of all products that cost more than $75. Order by product name.
USE northwind;
SELECT ProductID,ProductName,UnitPrice,CompanyName
FROM products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE UnitPrice > 75.00
ORDER BY ProductName;

-- Create a single query to list the product id, product name, unit price, category name,and supplier name of every product. Order by product name.
USE northwind;
SELECT ProductID,ProductName,UnitPrice,CategoryName,CompanyName
FROM products
JOIN suppliers ON products.supplierID = suppliers.supplierID
JOIN categories ON categories.categoryID = products.categoryID
ORDER BY ProductName;

-- Create a single query to list the order id, ship name, ship address, and shipping company name of every order that shipped to Germany. Assign the shipping company name the alias ‘Shipper.’ Order by the name of the shipper, then the name of who it shipped to.
USE northwind;
SELECT OrderID,ShipName,ShipAddress,CompanyName AS Shipper
FROM orders
JOIN shippers ON orders.ShipVia = shippers.ShipperID
WHERE ShipCountry LIKE '%Germany%'
ORDER BY Shipper, orders.ShipName;

-- Start from the same query as above (#4), but omit OrderID and add logic to group by ship name, with a count of how many orders were shipped for that ship name.
USE northwind;
SELECT ShipName,COUNT(*) AS OrderCount
FROM orders
JOIN shippers ON orders.ShipVia = shippers.ShipperID
WHERE ShipCountry LIKE '%Germany%'
GROUP BY ShipName
ORDER BY ShipName;

-- Create a single query to list the order id, order date, ship name, ship address of all orders that included Sasquatch Ale.
SELECT DISTINCT orders.OrderID,orders.OrderDate,orders.ShipName,orders.ShipAddress
FROM orders
JOIN `order details` ON `order details`.OrderID = orders.OrderID
JOIN products ON `order details`.ProductID = products.ProductID
WHERE products.ProductName = 'Sasquatch Ale';