-- 1
CREATE DATABASE LibraryDB;
--2
CREATE SCHEMA library;
--3
CREATE TABLE library.Books(
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    published_year INT,
    price FLOAT
);
--4
CREATE TABLE books();
ALTER TABLE books ADD COLUMN created_at TIMESTAMP DEFAULT NOW();
DROP TABLE books;
