-- Changes over time

--Total sales over Year

SELECT 
	YEAR(order_date) AS order_year,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT(customer_key)) AS total_customers, -- checking how many customers 
	SUM(quantity) AS total_quantity -- checking how much quantity was sold 
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date);

--Total sales over Month

SELECT 
	MONTH(order_date) AS order_month,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT(customer_key)) AS total_customers, -- checking how many customers 
	SUM(quantity) AS total_quantity -- checking how much quantity was sold 
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date);

--Total sales over Month and Year

SELECT 
	YEAR(order_date) AS order_year,
	MONTH(order_date) AS order_month,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT(customer_key)) AS total_customers, -- checking how many customers 
	SUM(quantity) AS total_quantity -- checking how much quantity was sold 
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date), YEAR(order_date)
ORDER BY MONTH(order_date), YEAR(order_date)ASC;

