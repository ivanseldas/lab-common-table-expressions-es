-- 1. Escribe una CTE que liste los nombres y cantidades de los productos con un precio unitario mayor a $50
SELECT productname, unit
FROM products
WHERE price > 50;

-- 2. ¿Cuáles son los 5 productos más rentables?
SELECT 
	p.productid AS Product_ID,
    p.productname AS Product_Name,
    SUM(p.price * od.quantity) AS TotalRevenue		
FROM products p
INNER JOIN orderdetails od ON p.ProductID = od.ProductID
INNER JOIN orders o ON od.OrderID = o.OrderID
GROUP BY product_id
ORDER BY TotalRevenue DESC
LIMIT 10;

