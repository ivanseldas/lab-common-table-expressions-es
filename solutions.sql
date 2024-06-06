-- QUERY 1
-- Escribe una CTE que liste los nombres y cantidades de los productos con un precio unitario mayor a $50
SELECT productname, unit
FROM products
WHERE price > 50;

-- QUERY 2
-- ¿Cuáles son los 5 productos más rentables?
SELECT
    p.productid AS Product_ID,
    p.productname AS Product_Name,
    SUM(p.price * od.quantity) AS TotalRevenue		
FROM products p
INNER JOIN orderdetails od ON p.ProductID = od.ProductID
INNER JOIN orders o ON od.OrderID = o.OrderID
GROUP BY product_id
ORDER BY TotalRevenue DESC
LIMIT 5;

-- QUERY 3
-- Escribe una CTE que liste las 5 categorías principales según el número de productos que tienen.
SELECT
	c.categoryname AS category,
    COUNT(p.productname) AS product_count
FROM
	categories c
INNER JOIN products p ON c.CategoryID = p.CategoryID
GROUP BY category
ORDER BY product_count DESC
LIMIT 5;

-- QUERY 4
-- Escribe una CTE que muestre la cantidad promedio de pedidos para cada categoría de producto
SELECT
	c.categoryname AS category,
	AVG(od.Quantity) AS quantity_avg
FROM 
	categories c
INNER JOIN products p ON c.CategoryID = p.CategoryID
INNER JOIN orderdetails od ON p.ProductID = od.ProductID
GROUP BY category;


-- QUERY 5
-- Crea una CTE para calcular el importe medio de los pedidos para cada cliente
SELECT
	c.customerid AS id,
	c.customername AS name,
    AVG(od.quantity * p.price) AS avgorderamount
FROM
	customers c
INNER JOIN orders o ON c.CustomerID = o.CustomerID
INNER JOIN orderdetails od ON od.OrderID = o.OrderID
INNER JOIN products p ON od.ProductID = p.ProductID
GROUP BY id
ORDER BY avgorderamount DESC;

-- QUERY 6
-- Crea una CTE que calcule las ventas totales para cada producto en el año 1997.
SELECT
	p.productname AS product,
    SUM(od.quantity) AS order_total
FROM
	products p
INNER JOIN orderdetails od ON od.ProductID = p.ProductID
INNER JOIN orders o ON o.OrderID = od.OrderID
WHERE (SELECT EXTRACT(year FROM o.orderdate) = '1997')
GROUP BY product
ORDER BY order_total DESC
LIMIT 15;