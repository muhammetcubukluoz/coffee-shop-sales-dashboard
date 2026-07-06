SELECT * FROM coffee_shop_sales

SELECT 
	CONCAT(ROUND(SUM(unit_price * transaction_qty) / 1000, 1), 'K') AS Total_Sales,
    CONCAT(ROUND(SUM(transaction_qty) / 1000, 1), 'K') AS Total_QTY_Sold,
    CONCAT(ROUND(COUNT(transaction_id) / 1000, 1), 'K') AS Total_Orders
FROM coffee_shop_sales
WHERE
	transaction_date = '2023-03-27'
