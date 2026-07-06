SELECT * FROM coffee_shop_sales

-- CALENDAR
SELECT
    SUM(unit_price * transaction_qty) as total_sales,
    SUM(transaction_qty) AS total_qty_sold,
    COUNT(*) AS total_orders
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5 -- May
	AND DAYOFWEEK(transaction_date) = 2 -- Mon
    AND HOUR(transaction_time) = 8 -- Hour Number

-- HOUR
SELECT
	HOUR(transaction_time) AS Hour_of_Day,
	SUM(unit_price * transaction_qty) as total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5
GROUP BY HOUR(transaction_time)
ORDER BY hour(transaction_time)

-- GET SALES FROM MONDAY TO SUNDAY 

SELECT 
    CASE 
        WHEN DAYOFWEEK(transaction_date) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date) = 7 THEN 'Saturday'
        ELSE 'Sunday'
    END AS Day_of_Week,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales
FROM coffee_shop_sales
WHERE MONTH(transaction_date) = 5 
GROUP BY 
    CASE 
        WHEN DAYOFWEEK(transaction_date) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date) = 7 THEN 'Saturday'
        ELSE 'Sunday'
    END;