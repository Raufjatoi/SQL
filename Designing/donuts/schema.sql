CREATE TABLE "Ingredients" (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price REAL NOT NULL
);
CREATE TABLE "Donuts"(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    gluten_free BOOLEAN NOT NULL,
    price REAL NOT NULL
);
CREATE TABLE "DonutIngredients"(
    donut_id INTEGER NOT NULL,
    ingredient_id INTEGER NOT NULL,
    FOREIGN KEY (donut_id) REFERENCES Donuts(id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(id),
    PRIMARY KEY (donut_id,ingredient_id)
);
CREATE TABLE "Customers"(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);
CREATE TABLE "Orders"(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);
CREATE TABLE "OrderDetails"(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL ,
    donut_id INTEGER NOT NULL ,
    quantity INTEGER NOT NULL ,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (donut_id) REFERENCES Donuts(id),
    PRIMARY KEY (order_id,donut_id)
);