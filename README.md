## Book Store Management System - SQL Project
## Overview
This project represents a basic Book Store Management System implemented in SQL. The system allows for tracking books, customers, and orders, and provides insightful queries for various aspects of the business. The system is designed with three primary tables:

- Books: Stores information about books, including title, author, genre, price, and stock levels.
- Customers: Stores customer information such as name, email, phone, city, and country.
- Orders: Tracks customer orders, including the book(s) ordered, order date, quantity, and total amount.
## Objective
The goal of this project is to design and implement a relational database for a book store, manage data related to books, customers, and orders, and generate useful insights using SQL queries. The project includes data import from CSV files, table creation, and multiple queries for analysis.

## Project Structure
- Tables Created:
  - Books: Contains details about books.
  - Customers: Contains customer details.
  - Orders: Contains details of orders placed by customers, with references to books and 
   customers.
- Data Import: Data is imported from CSV files for books, customers, and orders.
## SQL Scripts
# 1. Table Creation
- Books Table
sql
Copy
DROP TABLE IF EXISTS Books;

CREATE TABLE Books (
    Book_id serial PRIMARY KEY,
    Title varchar(100),
    Author varchar(100),
    Genere varchar(100),
    Published_Year int,
    Price numeric(10,2),
    Stock int
);
- Customers Table
sql
Copy
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    Customer_id int PRIMARY KEY,
    Name varchar(100),
    Email varchar(100),
    Phone varchar(15),
    City varchar(50),
    Country varchar(100)
);
- Orders Table
sql
Copy
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    Order_id int PRIMARY KEY,
    Customer_id int REFERENCES Customers(Customer_id),
    Book_id int REFERENCES Books(Book_id),
    Order_Date date,
    Quantity int,
    Total_Amount numeric(10,2)
);
# 2. Data Import from CSV
 To import data from CSV files, use the COPY command in PostgreSQL.

sql
Copy
COPY Books(Book_id, Title, Author, Genere, Published_Year, Price, Stock)
FROM 'C:\Sqlproject\Books.csv' 
DELIMITER ',' CSV HEADER;

-- COPY Customers(Customer_id, Name, Email, Phone, City, Country)
   FROM 'C:\Sqlproject\Customers.csv' 
   DELIMITER ',' CSV HEADER;

COPY Orders(Order_id, Customer_id, Book_id, Order_Date, Quantity, Total_Amount)
FROM 'C:\Sqlproject\Orders.csv' 
DELIMITER ',' CSV HEADER;
# 3. Simple Queries for Data Analysis
-- 1) Retrieve all books in the "Fiction" genre:
-- 2) Find books published after the year 1950:
-- 3) List all customers from the Canada:
-- 4) Show orders placed in November 2023:
-- 5) Retrieve the total stock of books available:
-- 6) Find the details of the most expensive book:
-- 7) Show all customers who ordered more than 1 quantity of a book:
-- 8) Retrieve all orders where the total amount exceeds $20:
-- 9) List all genres available in the Books table:
-- 10) Find the book with the lowest stock:
-- 11) Calculate the total revenue generated from all orders:



## 4. Advanced Queries

-- 1) Retrieve the total number of books sold for each genre:
-- 2) Find the average price of books in the "Fantasy" genre:
-- 3) List customers who have placed at least 2 orders:
-- 4) Find the most frequently ordered book:
-- 5) Show the top 3 most expensive books of 'Fantasy' Genre :
-- 6) Retrieve the total quantity of books sold by each author:
-- 7) List the cities where customers who spent over $30 are located:
-- 8) Find the customer who spent the most on orders:
--9) Calculate the stock remaining after fulfilling all orders:

## Potential Enhancements
1. Reports and Visualizations: Using tools like Power BI or Tableau, integrate the database with a reporting system for visual analysis of sales trends, customer behaviors, and book performance.

2. Additional Features:

- Add more tables for inventory management, suppliers, or discounts.
- Implement more complex business logic for customer loyalty programs or promotional discounts.
## Conclusion
This project provides a solid foundation for managing a book store's data using SQL. The system allows for easy tracking of books, customers, and orders, while offering advanced queries to generate key business insights. It can be further expanded to include more features or integrated with business intelligence tools for more advanced reporting and visualization.


