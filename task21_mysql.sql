
-- Task 21: Basic SQL SELECT | Northwind-inspired practice database
-- Run this script in a new/empty database.

CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(60),
    Country VARCHAR(60)
);

CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10,2),
    CategoryID INTEGER,
    UnitsInStock INTEGER
);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    OrderDate DATE,
    Status VARCHAR(30),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderID INTEGER,
    ProductID INTEGER,
    Quantity INTEGER,
    UnitPrice DECIMAL(10,2),
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Sample data
INSERT INTO Customers VALUES (1, 'Alfreds Futterkiste', 'Berlin', 'Germany');
INSERT INTO Customers VALUES (2, 'Ana Trujillo Emparedados', 'Mexico City', 'Mexico');
INSERT INTO Customers VALUES (3, 'Antonio Moreno Taqueria', 'Mexico City', 'Mexico');
INSERT INTO Customers VALUES (4, 'Around the Horn', 'London', 'UK');
INSERT INTO Customers VALUES (5, 'Berglunds snabbkop', 'Lulea', 'Sweden');
INSERT INTO Customers VALUES (6, 'Blauer See Delikatessen', 'Mannheim', 'Germany');
INSERT INTO Products VALUES (1, 'Chai', 18.0, 1, 39);
INSERT INTO Products VALUES (2, 'Chang', 19.0, 1, 17);
INSERT INTO Products VALUES (3, 'Aniseed Syrup', 10.0, 2, 13);
INSERT INTO Products VALUES (4, 'Chef Anton''s Cajun Seasoning', 22.0, 2, 53);
INSERT INTO Products VALUES (5, 'Grandma''s Boysenberry Spread', 25.0, 2, 120);
INSERT INTO Products VALUES (6, 'Ikura', 31.0, 3, 29);
INSERT INTO Products VALUES (7, 'Queso Cabrales', 21.0, 4, 22);
INSERT INTO Products VALUES (8, 'Tofu', 23.25, 5, 35);
INSERT INTO Orders VALUES (10248, 1, '2026-10-01', 'Shipped');
INSERT INTO Orders VALUES (10249, 2, '2026-10-03', 'Shipped');
INSERT INTO Orders VALUES (10250, 3, '2026-10-05', 'Processing');
INSERT INTO Orders VALUES (10251, 4, '2026-10-08', 'Shipped');
INSERT INTO Orders VALUES (10252, 1, '2026-10-10', 'Processing');
INSERT INTO Orders VALUES (10253, 5, '2026-10-12', 'Shipped');
INSERT INTO Orders VALUES (10254, 6, '2026-10-15', 'Cancelled');
INSERT INTO Orders VALUES (10255, 2, '2026-10-18', 'Shipped');
INSERT INTO OrderDetails VALUES (10248, 1, 10, 18.0);
INSERT INTO OrderDetails VALUES (10248, 3, 5, 10.0);
INSERT INTO OrderDetails VALUES (10249, 2, 8, 19.0);
INSERT INTO OrderDetails VALUES (10249, 5, 4, 25.0);
INSERT INTO OrderDetails VALUES (10250, 4, 6, 22.0);
INSERT INTO OrderDetails VALUES (10250, 7, 3, 21.0);
INSERT INTO OrderDetails VALUES (10251, 8, 12, 23.25);
INSERT INTO OrderDetails VALUES (10251, 1, 5, 18.0);
INSERT INTO OrderDetails VALUES (10252, 6, 7, 31.0);
INSERT INTO OrderDetails VALUES (10252, 3, 10, 10.0);
INSERT INTO OrderDetails VALUES (10253, 5, 2, 25.0);
INSERT INTO OrderDetails VALUES (10253, 2, 6, 19.0);
INSERT INTO OrderDetails VALUES (10254, 4, 1, 22.0);
INSERT INTO OrderDetails VALUES (10255, 7, 9, 21.0);

-- 10 practice queries
-- Q1. Display all customers
SELECT * FROM Customers;

-- Q2. Select specific customer columns
SELECT CustomerName, City FROM Customers;

-- Q3. Filter customers by country
SELECT CustomerName, City, Country
FROM Customers
WHERE Country = 'Germany';

-- Q4. Filter products by price
SELECT ProductName, UnitPrice
FROM Products
WHERE UnitPrice > 20;

-- Q5. Use multiple conditions
SELECT ProductName, UnitPrice, UnitsInStock
FROM Products
WHERE UnitPrice >= 20 AND UnitsInStock > 30;

-- Q6. Sort products by price (high to low)
SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice DESC;

-- Q7. Sort customers alphabetically
SELECT CustomerName, City
FROM Customers
ORDER BY CustomerName ASC;

-- Q8. Filter orders by date
SELECT OrderID, CustomerID, OrderDate, Status
FROM Orders
WHERE OrderDate >= '2026-10-08'
ORDER BY OrderDate;

-- Q9. Search names using LIKE
SELECT ProductName
FROM Products
WHERE ProductName LIKE 'C%';

-- Q10. Limit the result to the five cheapest products
SELECT ProductName, UnitPrice
FROM Products
ORDER BY UnitPrice ASC
LIMIT 5;