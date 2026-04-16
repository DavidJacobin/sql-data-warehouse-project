-- Total number of customers by Country
SELECT 
	country, 
	COUNT(customer_id) AS total_customers
FROM gold.dim_customers
GROUP BY country
ORDER BY tottal_customers DESC

--Total number of customers by Gender
SELECT 
	gender, 
	COUNT(customer_id) AS total_customers
FROM gold.dim_customers
GROUP BY gender
ORDER BY total_customers DESC

--Total number of products by category
SELECT 
	category,
	COUNT(product_id) AS total_products
FROM gold.dim_products
GROUP BY category
ORDER BY  total_products DESC

--Average cost per category
SELECT 
	category,
	AVG(cost) AS average_cost
FROM gold.dim_products
GROUP BY category
ORDER BY  average_cost DESC

--Total revenue by category
SELECT 
	p.category,
	SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p ON f.product_key = p.product_key
GROUP BY p.category 
ORDER BY total_revenue DESC

--Total revenue by customer
SELECT
	c.customer_key,
	SUM(f.sales_amount) AS total_sales
FROM gold.dim_customers c
LEFT JOIN gold.fact_sales f ON c.customer_key = f.customer_key
GROUP BY c.customer_key
ORDER BY total_sales DESC

--Sold items by country
SELECT
	c.country,
	SUM(f.quantity) AS total_sold_quantity
FROM gold.dim_customers c
LEFT JOIN gold.fact_sales f ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_sold_quantity DESC
