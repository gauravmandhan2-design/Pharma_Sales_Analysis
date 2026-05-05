CREATE DATABASE pharma_project;
USE pharma_project;

SELECT * FROM pharma_sales LIMIT 10;

UPDATE pharma_sales
SET date = STR_TO_DATE(date, '%Y-%m-%d');

ALTER TABLE pharma_sales
MODIFY date DATE;

SELECT date FROM pharma_sales LIMIT 10;

SELECT Main_Category, SUM(Sales) AS total_demand
FROM pharma_sales
GROUP BY Main_Category
ORDER BY total_demand DESC;

SELECT date, SUM(sales) AS total_demand
FROM pharma_sales
GROUP BY date
ORDER BY date;

SELECT 
	YEAR(date) AS YEAR,
    MONTH(date) AS MONTH,
    SUM(Sales) AS demand
FROM pharma_sales
GROUP BY year, month
ORDER BY year, month;

SELECT
	Main_Category,
	YEAR(date) AS YEAR,
    MONTH(date) AS MONTH,
    SUM(sales) AS demand
FROM pharma_sales
GROUP BY Main_Category, year, month
ORDER BY Main_Category, year, month;

SELECT 
	Main_Category,
    SUM(Sales) AS total_demand,
    RANK() OVER (ORDER BY SUM(Sales)DESC) AS rank_order
FROM pharma_sales
GROUP BY Main_Category;

SELECT date, SUM(sales) AS total_demand
FROM pharma_sales
GROUP BY date
ORDER BY total_demand DESC
LIMIT 5;

SELECT
	main_category,
    ROUND(SUM(sales) * 100 / SUM(SUM(sales)) OVER (), 2) AS Percentage_share
FROM pharma_sales
GROUP BY main_category
ORDER BY Percentage_share DESC;

SELECT 
	Main_Category,
    MONTH(date) AS MONTH,
    SUM(sales) AS demand
FROM pharma_sales
GROUP BY Main_Category , month
ORDER BY Main_Category , month;

SELECT * FROM pharma_sales