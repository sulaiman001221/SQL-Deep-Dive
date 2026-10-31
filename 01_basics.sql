-- Each statement runs in order. The CI job prints every result.

-- 1. Everything from one table
SELECT * FROM Customers;

-- 2. Pick columns and filter
SELECT CustomerName, City FROM Customers WHERE Country = 'Mexico';

-- 3. Join orders to customers
SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- 4. Aggregate: total quantity per order
SELECT OrderID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails
GROUP BY OrderID;

-- 5. Products with their supplier and category names
SELECT p.ProductName, s.SupplierName, c.CategoryName, p.Price
FROM Products p
JOIN Suppliers s ON p.SupplierID = s.SupplierID
JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY p.Price DESC;
