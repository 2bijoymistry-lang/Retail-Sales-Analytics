USE RetailHub;

-- ============================================
-- Query 1 : Customer Orders
-- ============================================

SELECT
    o.OrderID,
    c.CustomerName,
    o.OrderDate,
    o.PaymentMode,
    o.Region
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;

-- ============================================
-- Query 2 : Order Details with Product
-- ============================================

SELECT
    od.OrderDetailID,
    od.OrderID,
    p.ProductName,
    od.Quantity,
    od.Discount
FROM Order_Details od
INNER JOIN Products p
ON od.ProductID = p.ProductID;

-- ============================================
-- Query 3 : Sales Amount
-- ============================================

SELECT
    od.OrderDetailID,
    p.ProductName,
    od.Quantity,
    p.UnitPrice,
    (od.Quantity * p.UnitPrice) AS SalesAmount
FROM Order_Details od
INNER JOIN Products p
ON od.ProductID = p.ProductID;

-- ============================================
-- Query 4 : Discount Amount
-- ============================================

SELECT
    od.OrderDetailID,
    p.ProductName,
    od.Quantity,
    p.UnitPrice,
    od.Discount,
    (od.Quantity * p.UnitPrice * od.Discount / 100) AS DiscountAmount
FROM Order_Details od
INNER JOIN Products p
ON od.ProductID = p.ProductID;

-- ============================================
-- Query 5 : Net Sales
-- ============================================

SELECT
    od.OrderDetailID,
    p.ProductName,
    od.Quantity,
    p.UnitPrice,
    od.Discount,
    (od.Quantity * p.UnitPrice) -
    (od.Quantity * p.UnitPrice * od.Discount / 100) AS NetSales
FROM Order_Details od
INNER JOIN Products p
ON od.ProductID = p.ProductID;

-- ============================================
-- Query 6 : Total Revenue
-- ============================================

SELECT
SUM(
(od.Quantity*p.UnitPrice)-
(od.Quantity*p.UnitPrice*od.Discount/100)
) AS TotalRevenue
FROM Order_Details od
JOIN Products p
ON od.ProductID=p.ProductID;

-- ============================================
-- Query 7 : Top Customers
-- ============================================

SELECT
    c.CustomerName,
    COUNT(o.OrderID) AS TotalOrders
FROM Customers c
JOIN Orders o
ON c.CustomerID=o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalOrders DESC
LIMIT 10;

-- ============================================
-- Query 8 : Top Selling Products
-- ============================================

SELECT
    p.ProductName,
    SUM(od.Quantity) AS TotalSold
FROM Products p
JOIN Order_Details od
ON p.ProductID=od.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC
LIMIT 10;

-- ============================================
-- Query 9 : Revenue by Category
-- ============================================

SELECT
    p.Category,
    SUM(
        (od.Quantity*p.UnitPrice)-
        (od.Quantity*p.UnitPrice*od.Discount/100)
    ) AS Revenue
FROM Products p
JOIN Order_Details od
ON p.ProductID=od.ProductID
GROUP BY p.Category
ORDER BY Revenue DESC;

-- ============================================
-- Query 10 : Revenue by Region
-- ============================================

SELECT
    o.Region,
    SUM(
        (od.Quantity*p.UnitPrice)-
        (od.Quantity*p.UnitPrice*od.Discount/100)
    ) AS Revenue
FROM Orders o
JOIN Order_Details od
ON o.OrderID=od.OrderID
JOIN Products p
ON od.ProductID=p.ProductID
GROUP BY o.Region
ORDER BY Revenue DESC;

-- ============================================
-- Query 11 : Customer Age Group
-- ============================================

SELECT
CustomerName,
Age,

CASE

WHEN Age<25 THEN 'Young'

WHEN Age BETWEEN 25 AND 40 THEN 'Adult'

ELSE 'Senior'

END AS AgeGroup

FROM Customers;

-- ============================================
-- Query 12 : Row Number
-- ============================================

SELECT

ProductName,

UnitPrice,

ROW_NUMBER()
OVER(
ORDER BY UnitPrice DESC
) AS PriceRank

FROM Products;

-- ============================================
-- Query 13 : Rank Products
-- ============================================

SELECT

ProductName,

UnitPrice,

RANK()
OVER(
ORDER BY UnitPrice DESC
) AS ProductRank

FROM Products;

-- ============================================
-- Query 14 : Running Revenue
-- ============================================

SELECT

o.OrderDate,

SUM(
(od.Quantity*p.UnitPrice)-
(od.Quantity*p.UnitPrice*od.Discount/100)
)

OVER(
ORDER BY o.OrderDate
) AS RunningRevenue

FROM Orders o

JOIN Order_Details od

ON o.OrderID=od.OrderID

JOIN Products p

ON od.ProductID=p.ProductID;

-- ============================================
-- Query 15 : CTE Example
-- ============================================

WITH RevenueCTE AS
(

SELECT

p.Category,

SUM(
(od.Quantity*p.UnitPrice)-
(od.Quantity*p.UnitPrice*od.Discount/100)
) AS Revenue

FROM Products p

JOIN Order_Details od

ON p.ProductID=od.ProductID

GROUP BY p.Category

)

SELECT *

FROM RevenueCTE

ORDER BY Revenue DESC;

