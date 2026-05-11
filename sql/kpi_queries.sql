-- Total sales and profit
SELECT 
    SUM(sales) AS total_sales,
    SUM(benefit_per_order) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM clean_supply_chain;

-- Sales by region
SELECT 
    order_region,
    SUM(sales) AS total_sales,
    COUNT(order_id) AS total_orders
FROM clean_supply_chain
GROUP BY order_region
ORDER BY total_sales DESC;

-- Late delivery rate
SELECT 
    delivery_status,
    COUNT(*) AS total_orders,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM clean_supply_chain
GROUP BY delivery_status;

-- Category performance
SELECT 
    category_name,
    SUM(sales) AS sales,
    SUM(benefit_per_order) AS profit,
    COUNT(order_id) AS orders
FROM clean_supply_chain
GROUP BY category_name
ORDER BY sales DESC;

-- Monthly trend
SELECT 
    DATE_TRUNC('month', order_date_dateorders) AS order_month,
    SUM(sales) AS monthly_sales,
    COUNT(order_id) AS monthly_orders
FROM clean_supply_chain
GROUP BY 1
ORDER BY 1;


