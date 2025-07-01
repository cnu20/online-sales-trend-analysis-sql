CREATE DATABASE sales_analysis;
USE sales_analysis;


CREATE TABLE online_sales (
    transaction_id VARCHAR(50),
    order_date DATE,
    product_category VARCHAR(100),
    product_name VARCHAR(255),
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_revenue DECIMAL(12,2),
    region VARCHAR(100),
    payment_method VARCHAR(100)
);


select * from online_sales


SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM
    online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date), EXTRACT(MONTH FROM order_date)
ORDER BY
    order_year, order_month;




SELECT
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM
    online_sales
WHERE
    EXTRACT(YEAR FROM order_date) = 2024
GROUP BY
    EXTRACT(MONTH FROM order_date)
ORDER BY
    order_month;
    
    
    
SELECT
    region,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(total_revenue) AS total_revenue
FROM
    online_sales
WHERE
    EXTRACT(YEAR FROM order_date) = 2024
GROUP BY
    region, EXTRACT(MONTH FROM order_date)
ORDER BY
    region, order_month;


