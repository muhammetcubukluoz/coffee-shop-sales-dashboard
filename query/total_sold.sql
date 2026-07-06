SELECT * FROM coffee_shop_sales

SELECT ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 3;

-- Selected Month / CM - May=5
-- PM - April = 4

SELECT 
	MONTH(transaction_date) AS month, -- Number of Month
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales, -- Total Sales Column
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1) -- Month Sales Difference
    -- LAG, returns the value from the previous row of the current row
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(unit_price * transaction_qty), 1) -- (Current-Prev)/Prev
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage -- Percentage
FROM coffee_shop_sales
WHERE 
	MONTH(transaction_date) IN (4,5)
GROUP BY
	MONTH(transaction_date) 
ORDER BY
	MONTH(transaction_date)