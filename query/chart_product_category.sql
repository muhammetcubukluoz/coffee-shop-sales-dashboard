SELECT * FROM coffee_shop_sales

SELECT 
	product_category,
    SUM(unit_price * transaction_qty) AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5
GROUP BY product_category
ORDER BY SUM(unit_price * transaction_qty) DESC