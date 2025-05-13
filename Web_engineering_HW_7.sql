/*1   Вывести названия продуктов таблица products, включая количество заказанных единиц quantity для каждого продукта таблица order_details.
Решить задачу с помощью cte и подзапроса*/

SELECT 
    p.product_name,
    (SELECT 
            SUM(od.quantity)
        FROM
            order_details od
        WHERE
            od.product_id = p.id) AS total_quantity
FROM
    (SELECT 
        *
    FROM
        products) AS p;

WITH product_quantities AS (
  SELECT 
    product_id,
    SUM(quantity) AS total_quantity
  FROM order_details
  GROUP BY product_id
)
SELECT 
    p.product_name, pq.total_quantity
FROM
    products p
        LEFT JOIN
    product_quantities pq ON p.id = pq.product_id;
    
/*2  Найти все заказы таблица orders, сделанные после даты самого первого заказа клиента Lee таблица customers.*/

SELECT 
    *
FROM
    orders
WHERE
    order_date > (SELECT 
            MIN(o.order_date)
        FROM
            orders o
                JOIN
            customers c ON o.customer_id = c.id
        WHERE
            c.last_name = 'Lee');
            
            
/*3 Найти все продукты таблицы  products c максимальным target_level*/       
    
SELECT 
    *
FROM
    products
WHERE
    target_level = (SELECT 
            MAX(target_level)
        FROM
            products);