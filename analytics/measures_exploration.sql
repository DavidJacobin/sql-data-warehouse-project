
SELECT *
FROM INFORMATION_SCHEMA.TABLES

SELECT *
FROM INFORMATION_SCHEMA.COLUMNS

SELECT DISTINCT country FROM gold.dim_customers

SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1,2,3

SELECT 
	MIN(order_date) AS first_order, 
	MAX(order_date) AS last_order,
	DATEDIFF(MONTH,MIN(order_date),MAX(order_date))
FROM gold.fact_sales

SELECT  MIN(birthdate) AS oldest_birthdate,
		DATEDIFF(YEAR, MIN(birthdate),GETDATE()) AS age,
		MAX(birthdate) AS youngest_birthdate,
		DATEDIFF(YEAR, MAX(birthdate),GETDATE()) AS age
FROM gold.dim_customers

SELECT 
	SUM(sales_amount) AS total_sales
FROM gold.fact_sales

SELECT 
	SUM(quantity) AS total_quantity
FROM gold.fact_sales

SELECT
	AVG(price) AS avg_selling_price
FROM gold.fact_sales

SELECT
	COUNT(order_number) AS total_of_orders
FROM gold.fact_sales

SELECT
	COUNT(DISTINCT order_number) AS total_of_orders
FROM gold.fact_sales

SELECT
	COUNT(product_name) AS total_products
FROM gold.dim_products


SELECT
	COUNT(customer_key) AS totla_number_of_customers
FROM gold.dim_customers

SELECT
	COUNT(DISTINCT customer_key) AS totla_number_of_customers
FROM gold.fact_sales


SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS amount FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity' AS measure_name, SUM(quantity) AS amount FROM gold.fact_sales
UNION ALL 
SELECT 'Avarage Price' AS measure_name, AVG(price) AS amount FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders' AS measure_name, COUNT(order_number) AS amount FROM gold.fact_sales
UNION ALL
SELECT 'Total Distinct Orders' AS measure_name, COUNT(DISTINCT order_number) AS amount FROM gold.fact_sales
UNION ALL 
SELECT 'Total Products' AS measure_name, COUNT(product_name) AS amount FROM gold.dim_products
