/*Таблица purchase_order_details
1. Для каждого заказа order_id выведите минимальный, максмальный и средний unit_cost*/

SELECT 
    purchase_order_id,
    MIN(unit_cost) AS min_unit_cost,
    MAX(unit_cost) AS max_unit_cost,
    AVG(unit_cost) AS avg_unit_cost
FROM
    purchase_order_details
GROUP BY purchase_order_id;

/*2. Оставьте только уникальные строки из предыдущего запроса.*/

SELECT DISTINCT
    purchase_order_id,
    MIN(unit_cost) AS min_unit_cost,
    MAX(unit_cost) AS max_unit_cost,
    AVG(unit_cost) AS avg_unit_cost
FROM
    purchase_order_details
GROUP BY purchase_order_id;

/*3 Посчитайте стоимость продукта в заказе как quantity*unit_cost Выведите суммарную стоимость продуктов с помощью оконной функции Сделайте то же самое с помощью GROUP BY*/

SELECT 
    id,
    purchase_order_id,
    product_id,
    quantity,
    unit_cost,
    quantity * unit_cost AS product_total,
    SUM(quantity * unit_cost) OVER (PARTITION BY purchase_order_id) AS order_total
FROM purchase_order_details;

-- GROUP BY
SELECT 
    purchase_order_id, SUM(quantity * unit_cost) AS order_total
FROM
    purchase_order_details
GROUP BY purchase_order_id;

/*4. Посчитайте количество заказов по дате получения и posted_to_inventory Если оно превышает 1 то выведите '>1' в противном случае '=1'
Выведите purchase_order_id, date_received и вычисленный столбец*/

SELECT 
    purchase_order_id,
    date_received,
    CASE 
        WHEN COUNT(*) OVER (PARTITION BY date_received, posted_to_inventory) > 1 THEN '>1'
        ELSE '=1'
    END AS received_inventory_count_status
FROM purchase_order_details;




