SELECT * FROM coffee_shop_sales

SELECT 
	store_location,
    CONCAT(ROUND(SUM(unit_price * transaction_qty) / 1000,2), 'K') AS Total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 6
GROUP BY store_location
ORDER BY SUM(unit_price * transaction_qty) DESC
