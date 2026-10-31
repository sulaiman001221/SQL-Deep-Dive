-- W3Schools-style sample database (small stand-in dataset).
-- Table and column names follow the W3Schools SQL tutorial.
-- Run with: sqlite3 w3schools.db < schema.sql

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS OrderDetails;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Suppliers;
DROP TABLE IF EXISTS Shippers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    CustomerID   INTEGER PRIMARY KEY,
    CustomerName TEXT NOT NULL,
    ContactName  TEXT,
    Address      TEXT,
    City         TEXT,
    PostalCode   TEXT,
    Country      TEXT
);

CREATE TABLE Categories (
    CategoryID   INTEGER PRIMARY KEY,
    CategoryName TEXT NOT NULL,
    Description  TEXT
);

CREATE TABLE Employees (
    EmployeeID INTEGER PRIMARY KEY,
    LastName   TEXT NOT NULL,
    FirstName  TEXT NOT NULL,
    BirthDate  TEXT,
    Notes      TEXT
);

CREATE TABLE Shippers (
    ShipperID   INTEGER PRIMARY KEY,
    ShipperName TEXT NOT NULL,
    Phone       TEXT
);

CREATE TABLE Suppliers (
    SupplierID   INTEGER PRIMARY KEY,
    SupplierName TEXT NOT NULL,
    ContactName  TEXT,
    Address      TEXT,
    City         TEXT,
    PostalCode   TEXT,
    Country      TEXT,
    Phone        TEXT
);

CREATE TABLE Products (
    ProductID   INTEGER PRIMARY KEY,
    ProductName TEXT NOT NULL,
    SupplierID  INTEGER REFERENCES Suppliers(SupplierID),
    CategoryID  INTEGER REFERENCES Categories(CategoryID),
    Unit        TEXT,
    Price       REAL
);

CREATE TABLE Orders (
    OrderID    INTEGER PRIMARY KEY,
    CustomerID INTEGER REFERENCES Customers(CustomerID),
    EmployeeID INTEGER REFERENCES Employees(EmployeeID),
    OrderDate  TEXT,
    ShipperID  INTEGER REFERENCES Shippers(ShipperID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INTEGER PRIMARY KEY,
    OrderID       INTEGER REFERENCES Orders(OrderID),
    ProductID     INTEGER REFERENCES Products(ProductID),
    Quantity      INTEGER
);

INSERT INTO Customers (CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country) VALUES
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados', 'Ana Trujillo', 'Avda. de la Constitución 2222', 'México D.F.', '05021', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mataderos 2312', 'México D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbköp', 'Christina Berglund', 'Berguvsvägen 8', 'Luleå', 'S-958 22', 'Sweden');

INSERT INTO Employees (EmployeeID, LastName, FirstName, BirthDate, Notes) VALUES
(1, 'Davolio', 'Nancy', '1968-12-08', 'Education includes a BA in psychology.'),
(2, 'Fuller', 'Andrew', '1952-02-19', 'Earned a Ph.D. in English.'),
(3, 'Leverling', 'Janet', '1963-08-30', 'Holds a BA in psychology.');

INSERT INTO Shippers (ShipperID, ShipperName, Phone) VALUES
(1, 'Speedy Express', '(503) 555-9831'),
(2, 'United Package', '(503) 555-3199'),
(3, 'Federal Shipping', '(503) 555-9931');

INSERT INTO Categories (CategoryID, CategoryName, Description) VALUES
(1, 'Beverages', 'Soft drinks, coffees, teas, beers, and ales'),
(2, 'Condiments', 'Sweet and savory sauces, relishes, spreads, and seasonings'),
(3, 'Confections', 'Desserts, candies, and sweet breads');

INSERT INTO Suppliers (SupplierID, SupplierName, ContactName, Address, City, PostalCode, Country, Phone) VALUES
(1, 'Exotic Liquid', 'Charlotte Cooper', '49 Gilbert St.', 'London', 'EC1 4SD', 'UK', '(171) 555-2222'),
(2, 'New Orleans Cajun Delights', 'Shelley Burke', 'P.O. Box 78934', 'New Orleans', '70117', 'USA', '(100) 555-4822'),
(3, 'Tokyo Traders', 'Yoshi Nagase', '9-8 Sekimai Musashino-shi', 'Tokyo', '100', 'Japan', '(03) 3555-5011');

INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price) VALUES
(1, 'Chais', 1, 1, '10 boxes x 20 bags', 18),
(2, 'Chang', 1, 1, '24 - 12 oz bottles', 19),
(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10),
(4, 'Chef Anton''s Cajun Seasoning', 2, 2, '48 - 6 oz jars', 22),
(5, 'Konbu', 3, 2, '2 kg box', 6),
(6, 'Tofu', 3, 2, '40 - 100 g pkgs.', 23.25),
(7, 'Ikura', 3, 2, '12 - 200 ml jars', 31);

INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate, ShipperID) VALUES
(10248, 5, 3, '1996-07-04', 1),
(10249, 1, 1, '1996-07-05', 2),
(10250, 2, 2, '1996-07-08', 3),
(10251, 3, 1, '1996-07-08', 1),
(10252, 4, 2, '1996-07-09', 2);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 10248, 3, 12),
(2, 10248, 6, 10),
(3, 10249, 1, 5),
(4, 10250, 4, 9),
(5, 10250, 5, 40),
(6, 10251, 2, 6),
(7, 10252, 7, 15),
(8, 10252, 3, 20);
