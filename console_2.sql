--1
CREATE DATABASE SalesDB;

CREATE Schema sales;
--2
CREATE TABLE sales.Customers(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email TEXT NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL
);
CREATE TABLE sales.Products(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);
CREATE TABLE sales.Orders(
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES sales.Customers(customer_id),
    order_date DATE
);
CREATE TABLE sales.OrderItems(
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES sales.Orders(order_id),
    product_id INT REFERENCES sales.Products(product_id),
    quantity INT CHECK (quantity >= 1)
);
