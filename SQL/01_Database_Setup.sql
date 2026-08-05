CREATE DATABASE IF NOT EXISTS RetailHub;

USE RetailHub;

CREATE TABLE IF NOT EXISTS Customers (

    CustomerID VARCHAR(10) PRIMARY KEY,
    CustomerName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50),
    State VARCHAR(50),
    JoinDate DATE

);

CREATE TABLE IF NOT EXISTS Products (

    ProductID VARCHAR(10) PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    SubCategory VARCHAR(50),
    UnitPrice DECIMAL(10,2),
    CostPrice DECIMAL(10,2)

);

-- ============================================
-- Create Orders Table
-- ============================================

CREATE TABLE IF NOT EXISTS Orders (

    OrderID VARCHAR(10) PRIMARY KEY,

    CustomerID VARCHAR(10),

    OrderDate DATE,

    PaymentMode VARCHAR(30),

    Region VARCHAR(30),

    FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)

);

-- ============================================
-- Create Order_Details Table
-- ============================================

CREATE TABLE IF NOT EXISTS Order_Details (

    OrderDetailID VARCHAR(10) PRIMARY KEY,

    OrderID VARCHAR(10),

    ProductID VARCHAR(10),

    Quantity INT,

    Discount DECIMAL(5,2),

    FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
        REFERENCES Products(ProductID)

);
