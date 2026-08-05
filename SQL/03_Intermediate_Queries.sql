USE RetailHub;

-- ============================================
-- Query 1: Total Orders by Region
-- ============================================

SELECT
    Region,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY Region;

-- ============================================
-- Query 2: Total Quantity Sold
-- ============================================

SELECT
    ProductID,
    SUM(Quantity) AS TotalQuantitySold
FROM Order_Details
GROUP BY ProductID
ORDER BY TotalQuantitySold DESC;

-- ============================================
-- Query 3: Total Discount
-- ============================================

SELECT
    SUM(Discount) AS TotalDiscount
FROM Order_Details;

-- ============================================
-- Query 4: Products per Category
-- ============================================

SELECT
    Category,
    COUNT(*) AS TotalProducts
FROM Products
GROUP BY Category;

-- ============================================
-- Query 5: Customers Joined in 2024
-- ============================================

SELECT *
FROM Customers
WHERE YEAR(JoinDate)=2024;

-- ============================================
-- Query 6: Orders Between Dates
-- ============================================

SELECT *
FROM Orders
WHERE OrderDate
BETWEEN '2024-01-01'
AND '2024-12-31';

-- ============================================
-- Query 7: Highest Cost Products
-- ============================================

SELECT
    ProductName,
    CostPrice
FROM Products
ORDER BY CostPrice DESC
LIMIT 10;

-- ============================================
-- Query 8: Gender Distribution
-- ============================================

SELECT
    Gender,
    COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Gender;

-- ============================================
-- Query 9: Payment Mode by Region
-- ============================================

SELECT
    Region,
    PaymentMode,
    COUNT(*) AS TotalOrders
FROM Orders
GROUP BY
    Region,
    PaymentMode
ORDER BY
    Region;
    
-- ============================================
-- Query 10: Average Discount
-- ============================================

SELECT
    AVG(Discount) AS AverageDiscount
FROM Order_Details;

-- ============================================
-- Query 11: Maximum Quantity Purchased
-- ============================================

SELECT
    MAX(Quantity) AS HighestQuantity
FROM Order_Details;

-- ============================================
-- Query 12: Minimum Quantity Purchased
-- ============================================

SELECT
    MIN(Quantity) AS LowestQuantity
FROM Order_Details;

-- ============================================
-- Query 13: Customer Cities
-- ============================================

SELECT DISTINCT City
FROM Customers;

-- ============================================
-- Query 15: Total Customers
-- ============================================

SELECT COUNT(*) AS TotalCustomers
FROM Customers;

