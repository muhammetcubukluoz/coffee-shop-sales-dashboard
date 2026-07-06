SELECT * FROM coffee_shop_sales

-- Average Transaction Value (ATV) 
-- "What is the average sales per transaction?"

SELECT AVG(unit_price * transaction_qty) AS Avg_Sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5

-- Average Daily Sales
-- "What is the average daily sales?"

SELECT
	CONCAT(ROUND(AVG(total_sales) / 1000,1), 'K') AS Avg_Sales
FROM
	(
		SELECT SUM(transaction_qty * unit_price) AS total_sales
        FROM coffee_shop_sales
        WHERE MONTH (transaction_date) = 4
        GROUP BY transaction_date
    ) AS Internal_Query
    
    
SELECT 
	DAY(transaction_date) AS day_of_month,
    SUM(unit_price * transaction_qty) AS total_sales
FROM coffee_shop_sales
WHERE MONTH (transaction_date) = 5
GROUP BY DAY(transaction_date)
ORDER BY DAY(transaction_date) 

SELECT 
	day_of_month,
    CASE
		WHEN total_sales > avg_sales THEN 'Above Average'
        WHEN total_sales < avg_sales THEN 'Below Average'
        ELSE 'Average'
	END AS sales_status,
    total_sales
FROM 
	(
		SELECT
			DAY(transaction_date) AS day_of_month,
            SUM(unit_price * transaction_qty) AS total_sales,
            AVG(SUM(unit_price * transaction_qty)) OVER() AS avg_sales
		FROM coffee_shop_sales
		WHERE MONTH(transaction_date) = 5
        GROUP BY DAY(transaction_date)
	) AS sales_data
ORDER BY day_of_month