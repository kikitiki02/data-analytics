/* Name: Kiki 
Category/Vendor of Choice: Rum 
*/ 

-- 1. Create a list of all transactions for Rum that took place in the last quarter of 2014, sorted by the total sale amount from highest to lowest.
SELECT date,total
FROM public.sales
WHERE description ILIKE '%rum%'
AND date BETWEEN '2014-10-01'AND '2014-12-31'
ORDER by total DESC

-- 2. Which transactions for Rum had a bottle quantity greater than 12? Display the date, store number, item description, and total amount.
SELECT bottle_qty,date,store,description,total
FROM public.sales
WHERE description ILIKE '%rum%'
AND bottle_qty > 12

-- 3. Find all products in the products_table whose item_description contains a specific keyword (e.g., 'Limited', 'Spiced'). What categories do they belong to?
SELECT DISTINCT item_description, category_name
FROM public.products
WHERE item_description ILIKE '%spiced%'
GROUP BY category_name,item_description
/* When I look for a description like spiced it seems it's usually for whiskies or rums mostly */

-- 4. What is the total sales revenue and the average bottle price (btl_price) for  your chosen [Rum]?
SELECT SUM(total) :: money AS rumrev
FROM public.sales
WHERE description ILIKE '%rum%'
/* $46,669,469.29 is the total sales revenue */
SELECT AVG(btl_price::numeric) :: money AS avg_rum_bottle
FROM public.sales
WHERE description ILIKE '%rum%'
/* $13.33 is the average bottle price */

-- 5. How many transactions were recorded for each specific item description within your chosen [Rum]? Which specific product is the most frequently purchased?
SELECT description, COUNT(*) AS transactions
FROM public.sales
WHERE description ILIKE '%rum%'
GROUP BY description
ORDER BY transactions DESC
/* 150 transactions were recorded and Captain Morgan Spiced Rum was the most bought at 37,448 times */

-- 6. Which store generated the highest total revenue for Rum? Which generated the lowest (but still greater than zero)?
SELECT stores.name,stores.store, SUM(sales.total):: money AS rumrev
FROM public.sales
JOIN stores ON stores.store  = sales.store
WHERE description ILIKE '%rum%'
GROUP BY stores.name, stores.store
ORDER BY rumrev DESC
/* Store 2633 ("Hy-vee #3 / Bdi / Des Moines") highest is $1,813,351.13 */

SELECT stores.name,stores.store, SUM(sales.total):: money AS rumrev
FROM public.sales
JOIN stores ON stores.store  = sales.store
WHERE description ILIKE '%rum%'
GROUP BY stores.name, stores.store
HAVING SUM(total) >0
ORDER BY rumrev ASC
/* Store 4095 ("City Liquor And Tobacco / Waterloo") made $44.40 on rum sales */

-- 7. What is the total revenue for every vendor within Rum, sorted from highest to lowest?
SELECT vendor,vendor_no,SUM(total):: money AS vendor_total
FROM public.sales
WHERE description ILIKE '%rum%'
GROUP BY vendor,vendor_no
ORDER BY vendor_total DESC

-- 8. Which stores had total sales revenue for Rum exceeding $2,000?
SELECT stores.name,stores.store,SUM(sales.total):: money AS rumrev
FROM public.sales
JOIN stores ON stores.store  = sales.store
WHERE description ILIKE '%rum%'
GROUP BY stores.name, stores.store
HAVING SUM(total) >2000
ORDER BY rumrev DESC
/* 1,215 stores had exceded $2,000 in rum sales */

-- 9. Find all sales records where the category_name is either your chosen category or a closely related competitor category 
SELECT DISTINCT category_name
FROM public.sales
WHERE category_name ILIKE '%Rum%'
/* Theres 5 distinct category names, Barbados rum, flavored rum, jamaica rum, puerto rico & virgin islands rum, and spiced rum */

-- 10. List all transactions where the state bottle cost was between $10 and $20 for Rum
SELECT state_btl_cost
FROM public.sales
WHERE state_btl_cost::numeric BETWEEN 10 AND 20
AND description ILIKE '%rum%'
/* 119,558 transactions come up */

-- 11. Write a query that displays each store's total sales for Rum along with the store's name and address from the stores_table.
SELECT stores.name,stores.store,stores.store_address, SUM(sales.total):: money AS rumrev
FROM public.sales
JOIN stores ON stores.store  = sales.store
WHERE description ILIKE '%rum%'
GROUP BY stores.name,stores.store

-- 12. For each sale in, display the transaction date, total amount, and the population of the county where the sale occurred by joining with counties_table. 
SELECT sales.date,total,population
FROM public.sales
JOIN public.counties ON sales.county = counties.county
WHERE description ILIKE '%rum%'
