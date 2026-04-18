-- Part to whole Analysis

WITH category_sales AS (
SELECT
	category,
	SUM(s.sales_amount) AS total_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p ON s.product_key = p.product_key 
GROUP BY category
)

SELECT 
	category,
	total_sales,
	SUM(total_sales) OVER() AS overall_sales,
	ROUND((CAST(total_sales AS float) / SUM(total_sales)OVER()) *100,2) AS percentage_sales
FROM category_sales
ORDER BY category
