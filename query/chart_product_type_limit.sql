SELECT * FROM coffee_shop_sales

SELECT
	product_type,
    SUM(unit_price * transaction_qty) as total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5 and product_category = 'Coffee'
GROUP BY product_type
ORDER BY SUM(unit_price * transaction_qty) DESC
LIMIT 10