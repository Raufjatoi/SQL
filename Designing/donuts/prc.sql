-- schema.sql

-- Drop tables if they exist to avoid conflicts
DROP TABLE IF EXISTS Ingredients;
DROP TABLE IF EXISTS Donuts;
DROP TABLE IF EXISTS DonutIngredients;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS OrderDetails;

-- Create Ingredients table
CREATE TABLE Ingredients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price_per_unit REAL NOT NULL
);

-- Create Donuts table
CREATE TABLE Donuts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    gluten_free BOOLEAN NOT NULL,
    price REAL NOT NULL
);

-- Create DonutIngredients table to represent the relationship between donuts and ingredients
CREATE TABLE DonutIngredients (
    donut_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    FOREIGN KEY (donut_id) REFERENCES Donuts(id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(id),
    PRIMARY KEY (donut_id, ingredient_id)
);

-- Create Customers table
CREATE TABLE Customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- Create Orders table
CREATE TABLE Orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

-- Create OrderDetails table to represent the relationship between orders and donuts
CREATE TABLE OrderDetails (
    order_id INTEGER NOT NULL,
    donut_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (donut_id) REFERENCES Donuts(id),
    PRIMARY KEY (order_id, donut_id)
);
