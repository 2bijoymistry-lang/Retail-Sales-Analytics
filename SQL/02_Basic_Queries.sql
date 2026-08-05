-- ============================================
-- Query 1: Display all customers
-- ============================================

USE RetailHub;

SELECT *
FROM Customers;

-- ============================================
-- Query 2: Customer Names and Cities
-- ============================================

SELECT CustomerName,
       City
FROM Customers;

-- =======================================
-- Query 3: Customers older than 40
-- ========================================

SELECT *
FROM Customers
WHERE Age > 40;

-- ======================================
-- Query 4: Expensive Products
-- =======================================

SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > 20000;

-- ================================
-- Query 5: UPI Orders
-- =================================

SELECT *
FROM Orders
WHERE PaymentMode = 'UPI';

-- ==============================
-- Query 6: Maharashtra Customers
-- ===============================

SELECT *
FROM Customers
WHERE State = 'Maharashtra';

-- ============================
-- Query 7: Products by Price
-- ============================

SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

-- =================================
-- Query 8: Customers by Gender
-- ==================================

SELECT Gender, 
	COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Gender;

-- ================================
-- Query 9: Orders by Payment Mode
-- =================================

SELECT PaymentMode,
	COUNT(*) AS TotalOrders
FROM Orders
GROUP BY PaymentMode;

-- ====================================
-- Query 10: Average Product Price
-- =====================================
SELECT AVG(UnitPrice) AS AveragePrice
FROM Products;
