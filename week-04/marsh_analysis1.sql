/* Name: Kiki 
Category/Vendor of Choice: Rum 
*/ 

-- 1. Create a list of all transactions for Rum that took place in the last quarter of 2014, sorted by the total sale amount from highest to lowest.
SELECT date,total
FROM public.sales
WHERE category_name ILIKE '%rum%'
AND date BETWEEN '2014-10-01'AND '2014-12-31'
ORDER by total DESC
LIMIT 5

-- 2. Which transactions for Rum had a bottle quantity greater than 12? Display the date, store number, item description, and total amount.
SELECT bottle_qty,date,store,description,total
FROM public.sales
WHERE category_name ILIKE '%rum%'
AND bottle_qty > 12
LIMIT 10

-- 3. Find all products in the products_table whose item_description contains a specific keyword (e.g., 'Limited', 'Spiced'). What categories do they belong to?
SELECT DISTINCT item_description, category_name
FROM public.products
WHERE item_description ILIKE '%spiced%'
OR item_description ILIKE '%Limited%'
GROUP BY category_name,item_description
LIMIT 10

/* When I look for a description like spiced or limited it seems it's usually for whiskies or rums mostly, ocasional vodka */

-- 4. What is the total sales revenue and the average bottle price (btl_price) for  your chosen [Rum]?
SELECT SUM(total) :: money AS rumrev
FROM public.sales
WHERE category_name ILIKE '%rum%'
/* $53,126,653.19 is the total sales revenue */
SELECT AVG(btl_price::numeric) :: money AS avg_rum_bottle
FROM public.sales
WHERE category_name ILIKE '%rum%'
/* $13.05 is the average bottle price */

-- 5. How many transactions were recorded for each specific item description within your chosen [Rum]? Which specific product is the most frequently purchased?
SELECT description, COUNT(*) AS transactions, category_name
FROM public.sales
WHERE category_name ILIKE '%rum%'
GROUP BY description, category_name
ORDER BY transactions DESC
/* 247 transactions were recorded and Captain Morgan Spiced Rum was the most bought at 37,448 times */

-- 6. Which store generated the highest total revenue for Rum? Which generated the lowest (but still greater than zero)?
SELECT stores.name,stores.store, SUM(sales.total):: money AS rumrev
FROM public.sales
JOIN stores ON stores.store  = sales.store
WHERE category_name ILIKE '%rum%'
GROUP BY stores.name, stores.store
ORDER BY rumrev DESC
LIMIT 5
/* Store 2633 ("Hy-vee #3 / Bdi / Des Moines") highest is $1,675,626.86 */

SELECT stores.name,stores.store, SUM(sales.total):: money AS rumrev
FROM public.sales
JOIN stores ON stores.store  = sales.store
WHERE category_name ILIKE '%rum%'
GROUP BY stores.name, stores.store
HAVING SUM(total) >0
ORDER BY rumrev ASC
LIMIT 5
/* Store 4095 ("Hawkeye Convenience Stores / 1st Ave"and East) made $106.56 on rum sales */

-- 7. What is the total revenue for every vendor within Rum, sorted from highest to lowest?
SELECT SUM(total):: money AS vendor_total, vendor, vendor_no
FROM public.sales
WHERE category_name ILIKE '%rum%'
GROUP BY vendor, vendor_no
ORDER BY vendor_total DESC
LIMIT 5

-- 8. Which stores had total sales revenue for Rum exceeding $2,000?
SELECT stores.name,stores.store,SUM(sales.total):: money AS rumrev
FROM public.sales
JOIN stores ON stores.store  = sales.store
WHERE category_name ILIKE '%rum%'
GROUP BY stores.name, stores.store
HAVING SUM(total) >2000
ORDER BY rumrev DESC
LIMIT 5
/* Top 5 are "Hy-vee #3 / Bdi / Des Moines,Central City 2, Sam's Club 6344 / Windsor Heights, Sam's Club 8162 / Cedar Rapids, Hy-vee Wine and Spirits / Iowa City" */

-- 9. Find all sales records where the category_name is either your chosen category or a closely related competitor category 
SELECT DISTINCT category_name
FROM public.sales
WHERE category_name ILIKE '%Rum%'
/* Theres 5 distinct category names, Barbados rum, flavored rum, jamaica rum, puerto rico & virgin islands rum, and spiced rum */

-- 10. List all transactions where the state bottle cost was between $10 and $20 for Rum
SELECT state_btl_cost
FROM public.sales
WHERE state_btl_cost::numeric BETWEEN 10 AND 20
AND category_name ILIKE '%rum%'
/* 113,995 transactions come up */

-- 11. Write a query that displays each store's total sales for Rum along with the store's name and address from the stores_table.
SELECT stores.name,stores.store,stores.store_address, SUM(sales.total):: money AS rumrev
FROM public.sales
JOIN stores ON stores.store  = sales.store
WHERE category_name ILIKE '%rum%'
GROUP BY stores.name,stores.store

-- 12. For each sale in, display the transaction date, total amount, and the population of the county where the sale occurred by joining with counties_table. 
SELECT sales.date,total,population
FROM public.sales
JOIN public.counties ON sales.county = counties.county
WHERE category_name ILIKE '%rum%'
LIMIT 5

-- 13. Write a query that shows total sales for rum by county. Which county generates the most revenue for you? 
SELECT SUM(total::numeric):: money AS totalrumsales,county
FROM public.sales
WHERE category_name ILIKE '%rum%'
GROUP BY County
ORDER BY totalrumsales DESC
LIMIT 1
/* Polk county generated $9,984,793.64 */

-- 14. Join the sales_table and products_table to show total revenue for rum alongside the proof and pack size of the items. 
SELECT SUM(total::numeric):: money AS rumrev,proof,products.pack
FROM public.sales
JOIN public.products ON sales.item = products.item_no
WHERE sales.category_name ILIKE '%rum%'
GROUP BY proof,products.pack
Limit 5

-- 15. Are there any counties in the counties_table that have a population over 10,000 but zero sales for rum?
SELECT DISTINCT counties.county,population,total
FROM public.counties
JOIN public.sales ON sales.county = counties.county 
WHERE sales.category_name ILIKE '%rum%'
AND population > 10000
AND total !=0
GROUP BY counties.county,population,total
LIMIT 5
/* there are no counties that have zero sales for rum */

-- 16. Display total revenue for rum grouped by the store_status  (from stores_table). Are active stores ('A') performing significantly better than others?
SELECT DISTINCT store_status, SUM(total::numeric)::money AS rumrev,name
FROM public.stores
JOIN sales ON sales.store = stores.store
WHERE category_name ILIKE '%rum%'
GROUP BY store_status,stores.store,name
ORDER BY rumrev DESC
LIMIT 5
/* I think big grocery stores or chain stores that are active are more suucessful than smaller stores that aren't chains */

-- 17. Using a subquery, find all transactions for rum from stores located in a specific high-growth city (e.g., 'Des Moines') found in the stores_table.
SELECT * 
FROM public.sales
JOIN public.stores ON stores.store = sales.store
WHERE category_name ILIKE '%rum%'
AND store_address ILIKE '%Des Moines%'


-- 18. Which stores had total sales for rum that were above the average store revenue for that same group? (Hint: Use a subquery for the average)
SELECT SUM(total::numeric)::money AS rumrev,stores.store,stores.name
FROM public.sales
JOIN public.stores ON stores.store = sales.store
WHERE category_name ILIKE '%rum%'
GROUP BY stores.store,stores.name
HAVING SUM(sales.total::numeric) > (
SELECT AVG(storetotal)
FROM (
	SELECT SUM(total::numeric) AS storetotal
	FROM public.sales
	WHERE category_name ILIKE '%rum%'
	GROUP BY store)t)
	LIMIT 5;
        
-- 19. Find the top 5 highest-grossing items for rum, then use a subquery to look up their full details (like case_cost and proof) from the products_table.
SELECT item_no,item_description,proof,case_cost
FROM public.products
JOIN(
	SELECT item, SUM(total::numeric)::money AS rumrev
	FROM public.sales
	WHERE category_name ILIKE '%rum%'
GROUP BY item
ORDER BY rumrev DESC
LIMIT 5)
sales ON products.item_no = sales.item
/* captain morgan spiced rum top 2, 3 is captain morgan spiced barrel, 4 is captain morgan original spiced, 5 is admiral nelson spiced rum */

-- 20. Write a query using a subquery to find all sales records for rum from stores that have an 'A' (Active) status in the stores_table.
SELECT *
FROM public.sales
WHERE category_name ILIKE '%rum%'
AND store IN(
	SELECT store
	FROM public.stores
	WHERE store_status = 'A')
