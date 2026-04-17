/* a) What is the name of the table that holds the items Northwind sells?
b) What is the name of the table that holds the types/categories of the items
Northwind sells?
A) The name of the table that holds items is the product table 
B) The categories table shows the types/categories 
*/

/* Who is the Northwind employee whose name makes it look like she’s a bird?*/
SELECT Lastname, Firstname
FROM employees;
/* Margaret Peacock is the answer */

/* How many records does your query return? Using the toolbar options at the top of
the query pane, how can you change your query to retrieve only 10 rows? */
SELECT * FROM products;
/* 77 records get returned. I can change the query to only retrive 10 rows by clicking limit to 10 rows. I can also do that by putting LIMIT and whatever number */

/* What is the category id of seafood? Include a comment in your script to answer
this.*/
SELECT * FROM categories;
/* The seafood category ID is 8 */

/* Create a final SELECT statement to retrieve the top 50 records from orders, including
only the OrderID, OrderDate, ShipName, and ShipCountry columns.*/
SELECT OrderID, OrderDate, ShipName, ShipCountry
FROM orders
