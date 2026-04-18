-- Running Total by year

SELECT
	order_date,
	total_amount,
	SUM(total_amount) OVER(PARTITION BY order_date ORDER BY order_date) -- 
FROM(
SELECT 
	DATETRUNC(month, order_date) AS order_date,
	SUM(sales_amount) AS total_amount
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
)t

-- Moving Average Price
SELECT
	order_date,
	AVG(average_price) OVER(PARTITION BY order_date ORDER BY order_date) AS moving_avg_price
FROM (
SELECT 
	DATETRUNC(month, order_date) AS order_date,
	AVG(price) AS average_price
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
)t
