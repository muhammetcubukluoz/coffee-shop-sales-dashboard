SELECT * FROM coffee_shop_sales

UPDATE coffee_shop_sales
SET transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');

UPDATE coffee_shop_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%e.%m.%Y');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;

DESCRIBE coffee_shop_sales

ALTER TABLE coffee_shop_sales
CHANGE COLUMN ï»¿transaction_id transaction_id INT

