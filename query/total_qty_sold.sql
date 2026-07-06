SELECT * FROM coffee_shop_sales

SELECT SUM(transaction_qty) AS Total_Quantity_Sold
FROM coffee_shop_sales
WHERE
	MONTH(transaction_date) = 6
    
SELECT 
	MONTH(transaction_date) AS month, -- Number of Month
    ROUND(SUM(transaction_qty)) AS total_quantity_sold, -- Total Sales Column
    (SUM(transaction_qty) - LAG(SUM(transaction_qty), 1) -- Month Sales Difference
    -- LAG, returns the value from the previous row of the current row
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(transaction_qty), 1) -- (Current-Prev)/Prev
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage -- Percentage
FROM coffee_shop_sales
WHERE 
	MONTH(transaction_date) IN (4,5)
GROUP BY
	MONTH(transaction_date) 
ORDER BY
	MONTH(transaction_date)