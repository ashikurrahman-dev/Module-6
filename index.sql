-- Task-01
SELECT
    c.id,
    c.name,
    c.email,
    COUNT(o.id) AS total_orders
FROM
    customers c
LEFT JOIN
    orders o ON c.id = o.customer_id
GROUP BY
    c.id, c.name, c.email
ORDER BY
    total_orders DESC; 


-- Task-02
SELECT
    o.id,
    p.name,
    oi.quantity,
    (oi.quantity * oi.unit_price) AS total_amount
FROM
    orders o
JOIN
    order_items oi ON o.id = oi.order_id
JOIN
    products p ON oi.product_id = p.id
ORDER BY
    o.id ASC;


-- Task-03
SELECT
    c.name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM
    products p
JOIN
    categories c ON p.category_id = c.id
JOIN
    order_items oi ON p.id = oi.product_id
GROUP BY
    c.name
ORDER BY
    total_revenue DESC;


-- Task-04
SELECT
    c.name,
    SUM(p.price * oi.quantity) AS total_purchase_amount
FROM
    customers c
JOIN
    orders o ON c.id = o.customer_id
JOIN
    order_items oi ON o.id = oi.order_id
JOIN
    products p ON oi.product_id = p.id
GROUP BY
    c.name
ORDER BY
    total_purchase_amount DESC
LIMIT 5;
