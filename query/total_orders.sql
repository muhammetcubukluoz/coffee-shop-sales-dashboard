SELECT * FROM coffee_shop_sales

SELECT COUNT(transaction_id) AS Total_Orders
FROM coffee_shop_sales
WHERE 
	MONTH(transaction_date) = 5
    
SELECT 
	MONTH(transaction_date) AS month, -- Number of Month
    ROUND(COUNT(transaction_id)) AS total_orders, -- Total Sales Column
    (COUNT(transaction_id) - LAG(COUNT(transaction_id), 1) -- Month Sales Difference
    -- LAG, returns the value from the previous row of the current row
    OVER (ORDER BY MONTH(transaction_date))) / LAG(COUNT(transaction_id), 1) -- (Current-Prev)/Prev
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage -- Percentage
FROM coffee_shop_sales
WHERE 
	MONTH(transaction_date) IN (4,5)
GROUP BY
	MONTH(transaction_date) 
ORDER BY
	MONTH(transaction_date)
