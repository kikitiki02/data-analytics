-- 1. Write a query that shows total sales for rum by county. Which county generates the most revenue for you? 
SELECT SUM(total::numeric):: money AS totalrumsales,county
FROM public.sales
WHERE category_name ILIKE '%rum%'
GROUP BY County
ORDER BY totalrumsales DESC
LIMIT 1
/* Polk county generated $9,984,793.64 */

-- 2. Join the sales_table and products_table to show total revenue for rum alongside the proof and pack size of the items. 
SELECT SUM(total::numeric):: money AS rumrev,proof,products.pack
FROM public.sales
JOIN public.products ON sales.item = products.item_no
WHERE sales.category_name ILIKE '%rum%'
GROUP BY proof,products.pack

-- 3. Are there any counties in the counties_table that have a population over 10,000 but zero sales for rum?
SELECT counties.county,population, total
FROM public.counties
JOIN public.sales ON sales.county = counties.county 
WHERE sales.category_name ILIKE '%rum%'
AND population > 10000
AND total < 0
GROUP BY counties.county, total,population

-- 4. Display total revenue for rum grouped by the store_status  (from stores_table). Are active stores ('A') performing significantly better than others?


-- 5. Using a subquery, find all transactions for rum from stores located in a specific high-growth city (e.g., 'Des Moines') found in the stores_table.


-- 6. Which stores had total sales for rum that were above the average store revenue for that same group? (Hint: Use a subquery for the average)


-- 7. Find the top 5 highest-grossing items for rum, then use a subquery to look up their full details (like case_cost and proof) from the products_table.


-- 8. Write a query using a subquery to find all sales records for rum from stores that have an 'A' (Active) status in the stores_table.

