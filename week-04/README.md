# Capstone\_1



Link to 10 min present video:

https://drive.google.com/file/d/1ms25z9guDpepd9zclK1wFq\_Xdy5SeyND/view?usp=sharing







**For my summary stats for average bottle price and total sum for all rum sales I used these queries:**



4\. What is the total sales revenue and the average bottle price (btl\_price) for  your chosen \[Rum]?

SELECT SUM(total) :: money AS rumrev

FROM public.sales

WHERE category\_name ILIKE '%rum%'

/\* $53,126,653.19 is the total sales revenue \*/

SELECT AVG(btl\_price::numeric) :: money AS avg\_rum\_bottle

FROM public.sales

WHERE category\_name ILIKE '%rum%'

/\* $13.05 is the average bottle price \*/



**For the results (graph too) of my top 5 rum products I used this:**



5\. How many transactions were recorded for each specific item description within your chosen \[Rum]? Which specific product is the most frequently purchased?

SELECT description, COUNT(\*) AS transactions, category\_name

FROM public.sales

WHERE category\_name ILIKE '%rum%'

GROUP BY description, category\_name

ORDER BY transactions DESC

LIMIT 5

/\* 247 transactions were recorded and Captain Morgan Spiced Rum was the most bought at 37,448 times \*/





**For Top 5 stores and Counties I used these (graphs too):**

6\. Which store generated the highest total revenue for Rum? Which generated the lowest (but still greater than zero)?

SELECT stores.name,stores.store, SUM(sales.total):: money AS rumrev

FROM public.sales

JOIN stores ON stores.store  = sales.store

WHERE category\_name ILIKE '%rum%'

GROUP BY stores.name, stores.store

ORDER BY rumrev DESC

LIMIT 5

/\* Store 2633 ("Hy-vee #3 / Bdi / Des Moines") highest is $1,675,626.86 \*/



13\. Write a query that shows total sales for rum by county. Which county generates the most revenue for you?

SELECT SUM(total::numeric):: money AS totalrumsales,county

FROM public.sales

WHERE category\_name ILIKE '%rum%'

GROUP BY County

ORDER BY totalrumsales DESC

LIMIT 5

/\* Polk county generated $9,984,793.64 \*/



**For Lowest performing stores slide and graph I used this:**

I used the same question from 6 I just put ASC instead

SELECT stores.name,stores.store, SUM(sales.total):: money AS rumrev

FROM public.sales

JOIN stores ON stores.store  = sales.store

WHERE category\_name ILIKE '%rum%'

GROUP BY stores.name, stores.store

ORDER BY rumrev ASC

LIMIT 5



**For low performing counties I used The same as 13 but I changed DESC to ASC:**

SELECT SUM(total::numeric):: money AS totalrumsales,county

FROM public.sales

WHERE category\_name ILIKE '%rum%'

GROUP BY County

ORDER BY totalrumsales ASC

LIMIT 5



For my marketing slide I went to google trends to look up any spike in searches for rum in 2014 if it matched the same spike for Q4 in rum and it did. Also for Q4 rum sales i used this (graph results too):

&#x20;1. Create a list of all transactions for Rum that took place in the last quarter of 2014, sorted by the total sale amount from highest to lowest.

SELECT date,total

FROM public.sales

WHERE category\_name ILIKE '%rum%'

AND date BETWEEN '2014-10-01'AND '2014-12-31'

ORDER by total DESC



For my Rum category slide I used the query from question #9 but I also Added my own to compare the difference in sales based on category:

&#x20;9. Find all sales records where the category\_name is either your chosen category or a closely related competitor category

SELECT DISTINCT category\_name

FROM public.sales

WHERE category\_name ILIKE '%Rum%'



\-- 9.1 Extra data finding for myself for rum categories

SELECT DISTINCT category\_name,SUM(total::numeric)::money AS categorysales

FROM public.sales

WHERE category\_name ILIKE '%Rum%'

GROUP BY category\_name

ORDER BY categorysales DESC



For my vendors Category I used this query for the graph too:

7\. What is the total revenue for every vendor within Rum, sorted from highest to lowest?

SELECT SUM(total):: money AS vendor\_total, vendor, vendor\_no

FROM public.sales

WHERE category\_name ILIKE '%rum%'

GROUP BY vendor, vendor\_no

ORDER BY vendor\_total DESC

LIMIT 5



And finally for my competitor slide I used made my own query to find out the top 5 popular alcohol products to see where rum sits in the list to see the difference in sales:

&#x20;21. Extra research on other popular products

SELECT DISTINCT SUM(total::numeric)::money AS popularproduct ,item, sales.category\_name,description

FROM public.sales

GROUP BY sales.category\_name, item, description

ORDER BY popularproduct DESC

LIMIT 5

