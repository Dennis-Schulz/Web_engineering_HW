SELECT 
    id,
    order_id,
    CASE
        WHEN unit_price > 10 THEN 'Expensive'
        ELSE 'Cheap'
    END AS category
FROM
    order_details;
    

SELECT 
    id,
    order_id,
    IF(unit_price > 10,
        'Expensive',
        'Cheap') AS category
FROM
    order_details;
    

SELECT 
    *, quantity * unit_price AS total_price
FROM
    order_details
WHERE
    purchase_order_id IS NULL;
    
    
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    employees
LIMIT 3 OFFSET 1;    


SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS yaar_month
FROM
    orders;
  
 
SELECT DISTINCT
    company
FROM
    customers
ORDER BY company DESC;
  
  