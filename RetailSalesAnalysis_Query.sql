--Creating Table
DROP TABLE IF EXISTS RetailSales;
CREATE TABLE RetailSales(
		transactions_id	INT PRIMARY KEY, 
		sale_date DATE,
		sale_time TIME,
		customer_id	INT,
		gender VARCHAR(10),
		age	INT,
		category VARCHAR(25),	
		quantity INT,
		price_per_unit FLOAT,	
		cogs FLOAT,
		total_sale FLOAT
);

--Retrieving Data
SELECT * FROM RetailSales
LIMIT 5;

--Counting Rows
SELECT COUNT(*) FROM RetailSales;

--Data Cleaning
--Checking for NULL value
SELECT * FROM RetailSales
WHERE transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantity IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
or total_sale IS NULL;

--Removing rows with NULL values
DELETE FROM RetailSales
WHERE transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR age IS NULL
OR category IS NULL
OR quantity IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
or total_sale IS NULL;

--Checking row count again
SELECT COUNT(*) FROM RetailSales; --13 Rows affected

--Exploratory Data Analysis
--Counting Unique Customers
SELECT COUNT(DISTINCT customer_id) AS Unique_Customers FROM RetailSales;

--Displaying Unique Category
SELECT DISTINCT (category) AS Unique_Category FROM RetailSales;

--Data Analysis / Insights
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT * FROM RetailSales
WHERE sale_date='2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022
SELECT * FROM RetailSales
WHERE category='Clothing' 
AND quantity>3
AND TO_CHAR(sale_date,'YYYY-MM')='2022-11';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category, SUM(total_sale), COUNT(*) AS total_order 
FROM RetailSales
GROUP BY category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT AVG(age) FROM RetailSales
WHERE category='Beauty';

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM RetailSales
WHERE total_sale>1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT gender,category,COUNT(transactions_id) FROM RetailSales
GROUP BY gender, category;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

