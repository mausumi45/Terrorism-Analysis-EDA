create database project_1;
Use project_1;
select * from superstore;
-- Rename sub-category column
ALTER Table superstore RENAME COLUMN  `Sub-Category` To Subcategory;
-- number of records in table
select COUNT(*) AS RECORD_COUNT from superstore;
-- number of column in a table
select COUNT(*) AS COLUMN_COUNT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'superstore';
-- get column name & datatype of table
select column_name, data_type from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'superstore';
-- DATA ANALYSIS
-- How many number of cities oresent in table?
select COUNT( City) from superstore;
-- how many nuber of unique cities present in there?
select COUNT(distinct City) from superstore;
-- How many number of states present in table?
select COUNT( distinct state) from superstore;
-- Find the total sales ?
select SUM(sales) from superstore;
-- Find the statewise total sales in superstore?
select state , 
	SUM(sales) as Total_sales
from superstore 
group by state;
-- Find the top 5 state with highest sales?
select state,
   SUM(Sales) as total_sales
from superstore 
group by state
order by SUM(sales) desc 
limit 5;
-- Most selling category (with best subcategry)
select Category,subcategory,SUM(Sales) as total_sales 
from superstore
GROUP BY Category,subcategory
order by sum(sales) desc
limit 1;
-- Top 5 profitable sub-categories
select SubCategory,SUM(profit) as total_sales 
from superstore
GROUP BY SubCategory
order by sum(profit) desc
limit 5;
-- Which region has the highest sales?
select Region , SUM(sales)
from superstore
group by Region
order by SUM(sales)
limit 1;
-- Which subcategory have most discount?
select category,subcategory,Max(discount)
from superstore
Group By subcategory,category
order by Max(discount) desc
limit 1;
-- Worst profitable category;
select category , SUM(profit) as prof_category
from superstore
group by category
order by SUM(profit) asc
limit 1;
-- Worst profitable subcategory
select subcategory , SUM(profit) as prof_category
from superstore
group by subcategory
order by SUM(profit) asc
limit 1;
-- Fetch all the data from superstore where profit is less than 0?
select * from superstore where profit < 0;
-- number of record where profit less than 0
select count(*) as num_record from superstore where profit <0;
-- fetch all the sales,profit,quantity,discount for each segment
select segment,SUM(sales) as Total_sales,SUM(discount) as total_discount,SUM(quantity) as total_quantity,SUM(profit) as PROFIT
from superstore
group by Segment;
-- fetch total quantity in each subcategories
select subcategory , COUNT(quantity) as total_quantity
from superstore
group by subcategory
order by COUNT(quantity) desc;
-- Display the Category and Subcategory with their average profit and discount
select category,subcategory, AVG(profit) as avg_profit, AVG(discount) as avg_discount
from superstore
group by category,subcategory;
